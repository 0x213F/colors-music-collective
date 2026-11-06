\version "2.24.0"

%% "Compared to What" - tenor sax in Bb.
%%
%% Notes are written in TENOR (written) pitch directly - there is no
%% \transpose on the staff. The chord symbols come from the shared
%% concert-pitch compared-to-what-changes.ily and are transposed
%% up a whole step in \score (\transpose bes c). For alto, swap that to
%% \transpose ees c and rewrite the lick a 5th higher.
%%
%% Only A1 (bars 1-8) is written out: the lick in unison with the bass, at
%% the export's pitch (concert Eb4 = written F5). Everything after it is
%% slashes - solo over the changes - except the Head (77-92): the
%% vocal carries the tune there, so the sax rests, and plays only the
%% ensemble hits (87 held through 88, 91) - now pitched - and a fill in 78. Bar layout mirrors the bass part
%% exactly so rehearsal marks and bar numbers agree.

\header {
  title = "Compared to What"
  subtitle = "Tenor Sax in B♭"
  composer = "Gene McDaniels"
  tagline = ##f
}

#(set-global-staff-size 20)
\paper {
  ragged-last-bottom = ##t
  ragged-right = ##f
}

\include "compared-to-what-changes.ily"

global = {
  \numericTimeSignature
  \time 4/4
  \tempo 4 = 144
}

%% concert Eb Eb Db Eb Bb Db, written a major 9th up
lick = { f''8 f''8 ees''8 f''8~ f''8 c''4 ees''8 }   %% tie shows beat 3

%% time slashes - stemless, so they read as "play time", not rhythm.
%% The hits keep their stems: those ARE rhythms.
sb = {
  \improvisationOn \omit Stem
  b'4 b'4 b'4 b'4
  \undo \omit Stem \improvisationOff
}
%% The hits are pitched (2026-11-05, given at the piano in concert):
%%   87/113 rises   concert F G C  = written G A D, last note held thru 88/114
%%   91 falls       concert C G F  = written D A G
%% An octave below the lick (concert 3rd octave, written 4th) - the
%% lick's register was too high for these (the user, 2026-11-05).
%% The last bar (117) stays as rhythm slashes, not pitched.
hitsHold = { g'4. a'8~ a'4 d''4~ | d''1 }
hits     = { d''4. a'8~ a'4 g'4 }
hitsEnd  = { \improvisationOn b'4. b'8~ b'4 b'4\fermata \improvisationOff }

%% CLOSING LICK - tenor only, Coda bars 113-116, repeated (2026-11-05).
%% Given at the piano in concert, same register as the hits (concert
%% F3 = written G4), written a major 9th up:
%%   concert | r Ab(2.) | F(4.) Ab(8) r2 | D C Ab G F(8ths) r | F(4) D(8, low) Ab(8) r2 |
%%   written | r Bb     | G      Bb       | E D Bb A G         | G      E          Bb      |
%% Beyond what was said: the Ab in bar 1 is held to the end of the bar,
%% and the empty beats are rests.
%% The bass and drum parts do NOT have these 4 bars - from 113 on the
%% tenor's bar numbers run 4 ahead of theirs.
closingLick = {
  r4 bes'2.
  g'4. bes'8 r2
  e''8 d''8 bes'8 a'8 g'8 r8 r4
  g'4 e'8 bes'8 r2
}
closingChords = \chordmode { \repeat volta 2 { f1:7 f:7 f:7 f:7 } }
tenorChanges = { \changesMain \closingChords \changesEnd }

%% bar 78 fill - concert G F on the "and"s of 3 and 4 = written A G
fillSeventyEight = { r2 r8 a'8 r8 g'8 }

sax = {
  \global
  \clef treble
  \override Staff.Clef.break-visibility = #all-invisible

  %% Intro form A1 B1 B2 A2, 8 bars each, written out - no repeats
  \mark \markup { \bold \box "A1" }
  \textMark \markup { \italic "With bass" }
  <>\mf \lick \lick \lick \lick \break             %% 1-4    Eb, mf
  <>\> \lick \lick <>\! r1 r1 \bar "||" \break     %% 5-6 decresc., 7-8 rest (2026-11-05)

  \mark \markup { \bold \box "B1" }
  \textMark \markup { \italic "Solo over the changes" }
  \sb \sb \sb \sb \break                           %% 9-12   Ebm
  \sb \sb \sb \sb \bar "||" \break                 %% 13-16

  \mark \markup { \bold \box "B2" }
  \sb \sb \sb \sb \break                           %% 17-20  Ebm
  \sb \sb \sb \sb \bar "||" \break                 %% 21-24

  \mark \markup { \bold \box "A2" }
  \sb \sb \sb \sb \break                           %% 25-28  Eb7
  \sb \sb \sb \sb \bar "||" \break                 %% 29-32

  \mark \markup { \bold \box "Ext 1" }
  \sb \sb \sb \sb \break                           %% 33-36  Dm
  \sb \sb \sb \sb \bar "||" \break                 %% 37-40

  \mark \markup { \bold \box "Ext 2" }
  \sb \sb \sb \sb \break
  \sb \sb \sb \sb \bar "||" \break

  \segnoMark \default
  \mark \markup { \bold \box "Build" }
  \sb \sb \sb \sb \break                           %% 49-52  F7
  \sb \sb \sb \sb \break                           %% 53-56  Gbm7
  \sb \sb \sb \sb \break                           %% 57-60  Gm7
  \mark \markup { \bold \box "Push" }
  \sb \sb \sb \sb \break                           %% 61-64  Abm7 Am7
  \sb \sb \sb \sb \break                           %% 65-68  Bbm7 Bm7
  \mark \markup { \bold \box "Hold" }
  \sb \sb \sb \sb \bar "||" \break                 %% 69-72  C7

  \mark \markup { \bold \box "Release" }
  \sb \sb \sb \sb \break    %% 73-76
  %% no \bar "||" here - it would eat the Head's repeat-start

  \repeat volta 2 {
    \mark \markup { \bold \box "Head" }
    \textMark \markup { \italic "Vocal - fills and hits only" }
    r1 \fillSeventyEight r1 r1 \break          %% 77-80, fill in 78
    r1 r1 r1 r1 \break                         %% 81-84
    r1 r1 \hitsHold \break                   %% 85-88, held through 88
    r1 | r1 | \hits |                          %% 89-91, 89-90 N.C.
    \textMark \markup { \italic "Drum break" }
    r1                                          %% 92
    %% To Coda sits on the barline after 92 (marks attach to the
    %% following bar, and at the \break it draws on this system).
    \codaMark 1
    \textEndMark \markup { \italic "To Coda" }
    \bar "||" \break

    \mark \markup { \bold \box "Vamp" }
    \sb \sb \sb \sb \break                   %% 93-96
    \sb \sb \sb \sb \break
    \sb \sb \sb \sb \break
    \sb \sb \sb \sb                           %% 105-108
  }
  \textEndMark \markup { \italic "Last time D.S. al Coda" }
  \break

  %% ---- Coda: 4-bar vamp (repeat as desired), then bars 87-91 again.
  %% No ending brackets or "Last time" - implied (the user, 2026-11-05) ----
  %% begin-of-line-visible puts the coda sign at the START of this
  %% system rather than the end of the previous one.
  \once \override Score.CodaMark.break-visibility = #begin-of-line-visible
  \codaMark 1
  \mark \markup { \bold \box "Coda" }
  \textMark \markup { \italic "Repeat as desired" }
  \repeat volta 2 { \sb \sb \sb \sb }                  %% 109-112
  \break
  \textMark \markup { \italic "Closing lick - repeat as desired" }
  \repeat volta 2 { \closingLick }                   %% 113-116
  \break
  \hitsHold                                           %% 117-118, held
  r1 | r1 | \hitsEnd                                  %% 119-121, 119-120 N.C.
  \bar "|."
}

\score {
  <<
    \new ChordNames { \set chordChanges = ##t \transpose bes c \tenorChanges }
    \new Staff { \sax }
  >>
  \layout {
    indent = 0
    \context { \Score \override SystemStartBar.collapse-height = #0 }
  }
}

\score {
  \unfoldRepeats <<
    \new ChordNames \transpose bes c \tenorChanges
    \new Staff \transpose c bes, \sax
  >>
  \midi { }
}
