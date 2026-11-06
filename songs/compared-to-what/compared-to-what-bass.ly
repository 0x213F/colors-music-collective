\version "2.24.0"

%% "Compared to What" - bass chart.
%%
%% Built from the Logic export "~/Music/Logic/Compared to Whut.mid"
%% (144 bpm). FORM and chord reasoning live in
%% compared-to-what-changes.ily, shared with the tenor part.
%%
%% THE LICK is one bar, identical in every key of the export:
%%   root root b7 root (four eighths, no tie) |
%%   rest, 5 on the "and" of 3, rest, b7 on the "and" of 4
%% (2026-11-05: the tie into beat 3 is gone and the 5 is an eighth.
%% The export held the root across beat 3 with a quarter 5.)
%% It is written once, in Eb, and every other key is a \transpose of
%% it, so a rhythm change lands everywhere at once.
%%
%% Bass sounds an octave below written as usual; written here an octave
%% below the export's pitches (the export's Eb4 is written Eb3).
%%
%% Departures from the export, deliberately:
%%  - The export runs Eb for 16 bars; the form as specified is
%%    A1 8 (Eb) + B1 8 + B2 8 (Ebm) + A2 8 (Eb7) = 32 bars, written
%%    out with no repeats (the user's call, 2026-11-05). The form wins.
%%  - Bar 32: the export changes key only at the barline. Here the chord
%%    turns to Dm on beat 3, so the lick's back half is played in D
%%    (A on the "and" of 3, C on the "and" of 4) - which is exactly the
%%    D lick's back half, so it leads straight into bar 33.
%%  - Bar 48 and the Build (49-68) are NOT the export's lick - see
%%    BUILD below. The export keeps the lick climbing through the keys.
%%  - A few performance slips in the export are not transcribed: a
%%    dropped A in the B bars, a doubled F, a stray Eb grace.

%% BUILD. Bar 48 sets it up: the F of the lick on the downbeat, then
%% "ups" on low F - the "and" of every beat. Written F2, which sounds
%% F1, the lowest F on the bass.
%%
%% From bar 49 a two-bar climb replaces the lick:
%%   | F (q) rest A (q) rest | Bb (dotted q) C (8) - up C, up F |
%% i.e. 1 3 4 5 of the chord. The "and" of 3 repeats the C from the
%% "and" of 2 (it was a low F until 2026-09-30); only the "and" of 4
%% drops to the root, leading into the next bar's downbeat.
%% Written once in F (buildFig) and transposed onto each chord.
%% Beat 4 of the first bar was not specified - left as a rest. The
%% "quarter rest, quarter F" x2 on beats 3-4 is written as eighths
%% (r8 C8 r8 F8): only two beats remain. Bar 48 still has F on every
%% "and" - it is not part of the figure.
%%
%% CLASH: the figure has a MAJOR 3rd (A over F). Transposed onto the
%% m7 chords it plays Bb over Gbm7, B over Gm7, C over Abm7 and so on -
%% a major 3rd against a minor chord, on beat 3 of every other bar.
%% Either the chords are dominant (Gb7 G7 Ab7 ...) or the figure's 3rd
%% flattens there. Left as-is, unresolved.
%%
%% From Abm7 (bar 61) the figure changes to a ONE-bar root-and-4th
%% pattern (climbFig), one per bar, rising with the chords:
%%   Ab (q)  Db (8)  Ab (8~8)  Db (8~8)  rest (8)
%% Both off-beat notes are tied eighths, so beats 3 AND 4 are shown -
%% a plain quarter on the "and" of 3 read as if it were on the beat.
%% No 3rd in it, so bars 61-68 no longer carry the CLASH above - it
%% remains in 53-60 (Gbm7, Gm7).
%%
%% The C7 bars (69-72) are upbeats on the high C - 16 in a row, no
%% downbeats (the export's octave figure is gone) - and 73-76 return
%% to the lick as the Release (4 bars); climbFig stops at Bm7.
%%
%% HEAD (77-92) and VAMP (93-108), repeated as one 32-bar unit.
%% The head is in F (see KEY in the changes file). The bass pedals
%% low F eighths - the root - through it. The Vamp goes back to the
%% lick in F, the same figure the Coda vamps on.
%% The hits (87, 91, and again at 113, 117) climb F Bb C - the last
%% one is the 5th of F7, not the root, so the figure rises. See the changes file for
%% the rests in 89, 90 and 92. At 87 and 113 the last hit (C) ties over
%% and holds through the next bar; 89-90 and 115-116 are the N.C. break.
%%
%% ROADMAP: segno on bar 49 (Build), To Coda after bar 92, "Last time
%% D.S. al Coda" after the Vamp. Coda (109-112) is the lick in F, vamped.

\header {
  title = "Compared to What"
  subtitle = "Bass"
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

%% 8 8 8 8 | r 8 r 8 - beats 3-4 are flagged eighths, NOT beamed
%% across the rests (tried 2026-11-05, the user didn't want it).
lick    = { ees8 ees8 des8 ees8 r8 bes,8 r8 des8 }
lickD   = \transpose ees d  \lick
lickF   = \transpose ees f  \lick
lickGb  = \transpose ees ges \lick
lickG   = \transpose ees g  \lick
lickAb  = \transpose ees aes \lick
lickA   = \transpose ees a  \lick
lickBb  = \transpose ees bes \lick
lickB   = \transpose ees b  \lick

%% bar 32 (A2 ends) - Eb lick's front half, D lick's back half (see header)
mTwenty = { ees8 ees8 des8 ees8 r8 a,8 r8 c8 }

%% C7 bars - upbeats only, on the high C (the export's upper octave)
cUps = { r8 c'8 r8 c'8 r8 c'8 r8 c'8 }

%% Head - pedal, and the hit figure (bars 87 and 91)
pedal  = { f,8 f,8 f,8 f,8 f,8 f,8 f,8 f,8 }
hits   = { f,4. bes,8~ bes,4 c4 }
%% 87/113 - the last hit ties over and holds through 88/114
hitsHold = { f,4. bes,8~ bes,4 c4~ | c1 }
hitsEnd = { f,4. bes,8~ bes,4 c4\fermata }   %% the last bar of the tune

%% bar 48 - the lick's F on 1, then ups on low F (see BUILD)
mThirtySix = { f8 f,8 r8 f,8 r8 f,8 r8 f,8 }

%% the Build's two-bar climb, in F: 1 . 3 . | 4 5 . up 5, up 1
buildFig   = { f,4 r4 a,4 r4 | bes,4. c8 r8 c8 r8 f,8 }
buildGb    = \transpose f ges \buildFig
buildG     = \transpose f g   \buildFig

%% from Abm7 on - one bar, root and 4th, in Ab (see BUILD)
climbFig   = { aes,4 des8 aes,8~ aes,8 des8~ des8 r8 }
climbA     = \transpose aes a   \climbFig
climbBb    = \transpose aes bes \climbFig
climbB     = \transpose aes b   \climbFig

bass = {
  \global
  \clef bass
  \override Staff.Clef.break-visibility = #all-invisible

  %% Eighth-note pickup (2026-11-05): the lick's last note, b7 into the root
  \partial 8 des8\mf

  %% Intro form A1 B1 B2 A2, 8 bars each, written out - no repeats
  %% Dynamics: mf from the pickup, mp at B1, back to mf at A2,
  %% mp at 49 (Build), mf at 57 - shared with the drum part
  \mark \markup { \bold \box "A1" }
  \lick \lick \lick \lick \break                   %% 1-4    Eb
  \lick \lick \lick \lick \bar "||" \break         %% 5-8

  \mark \markup { \bold \box "B1" }
  <>\mp \lick \lick \lick \lick \break                   %% 9-12   Ebm
  \lick \lick \lick \lick \bar "||" \break         %% 13-16

  \mark \markup { \bold \box "B2" }
  \lick \lick \lick \lick \break                   %% 17-20  Ebm
  \lick \lick \lick \lick \bar "||" \break         %% 21-24

  \mark \markup { \bold \box "A2" }
  <>\mf \lick \lick \lick \lick \break                   %% 25-28  Eb7
  \lick \lick \lick \mTwenty \bar "||" \break      %% 29-32, Dm on 3 of 32

  \mark \markup { \bold \box "Ext 1" }
  \lickD \lickD \lickD \lickD \break                %% 33-36  Dm
  \lickD \lickD \lickD \lickD \bar "||" \break   %% 37-40

  \mark \markup { \bold \box "Ext 2" }
  \lickF \lickF \lickF \lickF \break                %% 41-44  F7
  \lickF \lickF \lickF \mThirtySix \bar "||" \break

  \segnoMark \default
  \mark \markup { \bold \box "Build" }
  <>\mp \buildFig \buildFig \break      %% 49-52  F7 (mp)
  \buildGb \buildGb \break        %% 53-56  Gbm7
  <>\mf \buildG \buildG \break          %% 57-60  Gm7 (mf)
  \mark \markup { \bold \box "Push" }
  \climbFig \climbFig \climbA \climbA \break   %% 61-64  Abm7 Am7
  \climbBb \climbBb \climbB \climbB \break     %% 65-68  Bbm7 Bm7
  \mark \markup { \bold \box "Hold" }
  \cUps \cUps \cUps \cUps \bar "||" \break   %% 69-72  C7

  \mark \markup { \bold \box "Release" }
  \lickF \lickF \lickF \lickF \break    %% 73-76
  %% no \bar "||" here - it would eat the Head's repeat-start

  \repeat volta 2 {
    \mark \markup { \bold \box "Head" }
    \pedal \pedal \pedal \pedal \break                 %% 77-80
    \pedal \pedal \pedal \pedal \break                 %% 81-84
    \pedal \pedal \hitsHold \break                      %% 85-88, C held through 88
    r1 | r1 | \hits |                                  %% 89-91, 89-90 N.C.
    \textMark \markup { \italic "Drum break" }
    r1                                                  %% 92
    %% To Coda sits on the barline after 92 (marks attach to the
    %% following bar, and at the \break it draws on this system).
    \codaMark 1
    \textEndMark \markup { \italic "To Coda" }
    \bar "||" \break

    \mark \markup { \bold \box "Vamp" }
    \lickF \lickF \lickF \lickF \break                 %% 93-96
    \lickF \lickF \lickF \lickF \break
    \lickF \lickF \lickF \lickF \break
    \lickF \lickF \lickF \lickF                         %% 105-108
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
  \repeat volta 2 { \lickF \lickF \lickF \lickF }   %% 109-112
  \break
  \hitsHold                                          %% 113-114, held
  r1 | r1 | \hitsEnd                                 %% 115-117, 115-116 N.C.
  \bar "|."
}

\score {
  <<
    \new ChordNames { \set chordChanges = ##t \partial 8 s8 \changes }  %% s8 = pickup
    \new Staff { \bass }
  >>
  \layout {
    indent = 0
    \context { \Score \override SystemStartBar.collapse-height = #0 }
  }
}

\score {
  \unfoldRepeats << \new ChordNames { \partial 8 s8 \changes } \new Staff \bass >>
  \midi { }
}
