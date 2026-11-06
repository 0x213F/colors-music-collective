\version "2.24.0"

%% Compared to What - DRUMS
%%
%% Same form, bar numbers, roadmap and dynamics as compared-to-what-bass.ly
%% (2026-11-05). If the bass part's form changes, this must change with it.
%% No chord symbols - the boxed marks carry the form.
%%
%% FORM / GROOVES (notated bars):
%%   pickup         eighth rest (the bass has a Db pickup)
%%   A1     1-4     tacet
%%          5-8     cowbell quarters                          mf
%%   B1     9-16    cowbell quarters + cross stick on 2 and 4  mp
%%   B2     17-24   same (cowbell runs through B1 and B2)
%%   A2     25-32   cross stick on all 4 beats, ride eighths;        mf
%%                  cowbell stops
%%   Ext 1  33-40   same groove, crash on beat 2 of 33, 37, 39
%%   Ext 2  41-48   same groove
%%   Build  49-60   same groove                    mp at 49, mf at 57
%%   Push   61-68   cross stick on every downbeat, ride + bass drum on
%%   Hold   69-72   every upbeat (runs through the Hold); bar 72 has a
%%                  full snare hit on beat 4 into the Release
%%   Release 73-76  back to cross stick quarters + ride eighths,
%%                  crash on beat 2 of 73
%%   Head   77-92   cross stick quarters (all 4 beats) only; the hits at 87 and 91
%%                  are crash + bass drum; 87's last crash rings
%%                  through 88, 89-90 are the N.C. break, same rhythm as
%%                  the bass: dotted q, dotted q (the "and" of 2), q
%%   Vamp   93-108  NOT SPECIFIED - written as the Release groove,
%%                  since the bass plays the same lick there
%%   Coda   109-112 NOT SPECIFIED - same groove as the Vamp
%%          113-117 after the vamp: the hits again, fermata on the last
%%                  (no ending brackets - implied)
%%
%% Cross stick is on 2 and 4 only in B1/B2 (with the cowbell). From A2
%% on - and in the Head - it is on all four beats (the user, 2026-11-05).
%%
%% Every crash is accented, and so is the snare on 4 of bar 72.
%%
%% The crashes replace the ride stroke on that beat; the cross stick
%% still plays under the crash.
%%
%% Noteheads (LilyPond default drum style): cowbell = triangle,
%% cross stick = x on the snare space, ride = x above the staff,
%% crash = x on the top ledger.

\header {
  title = "Compared to What"
  subtitle = "Drums"
  composer = "Gene McDaniels"
  tagline = ##f
}

#(set-global-staff-size 20)
\paper {
  ragged-last-bottom = ##t
  ragged-right = ##f
}

global = {
  \numericTimeSignature
  \time 4/4
  \tempo 4 = 144
}

%% ---- grooves, one bar each ----
bell      = \drummode { cb4 cb cb cb }                       %% 5-8
bellX     = \drummode { cb4 <cb ss> cb <cb ss> }             %% B1, B2
ride      = \drummode { <cymr ss>8 cymr <cymr ss> cymr <cymr ss> cymr <cymr ss> cymr }
rideCrash = \drummode { <cymr ss>8 cymr <cymc ss>-> cymr <cymr ss> cymr <cymr ss> cymr }  %% crash on 2
push      = \drummode { ss8 <cymr bd> ss <cymr bd> ss <cymr bd> ss <cymr bd> }
%% bar 72 (end of Hold) - full snare hit on 4 instead of the cross stick
pushLast  = \drummode { ss8 <cymr bd> ss <cymr bd> ss <cymr bd> sn-> <cymr bd> }
headX     = \drummode { ss4 ss ss ss }

%% the hits - rhythm of the bass's \hits (87, 91, 113, 117)
hits      = \drummode { <cymc bd>4.-> <cymc bd>4.-> <cymc bd>4-> }
hitsEnd   = \drummode { <cymc bd>4.-> <cymc bd>4.-> <cymc bd>4->\fermata }
%% 87/113 - last crash rings (l.v.) through 88/114, which is a rest
hitsHold  = \drummode { <cymc bd>4.-> <cymc bd>4.-> <cymc bd>4->\laissezVibrer | R1 }

drumPart = \drummode {
  \global
  \override Staff.Clef.break-visibility = #all-invisible
  \stemUp   %% one voice, every stem up (hands and feet together)

  \partial 8 r8

  \mark \markup { \bold \box "A1" }
  R1 R1 R1 R1 \break                                         %% 1-4  tacet
  <>\mf \bell \bell \bell \bell \bar "||" \break             %% 5-8

  \mark \markup { \bold \box "B1" }
  <>\mp \bellX \bellX \bellX \bellX \break                   %% 9-12
  \bellX \bellX \bellX \bellX \bar "||" \break               %% 13-16

  \mark \markup { \bold \box "B2" }
  \bellX \bellX \bellX \bellX \break                         %% 17-20
  \bellX \bellX \bellX \bellX \bar "||" \break               %% 21-24

  \mark \markup { \bold \box "A2" }
  <>\mf \ride \ride \ride \ride \break                       %% 25-28
  \ride \ride \ride \ride \bar "||" \break                   %% 29-32

  \mark \markup { \bold \box "Ext 1" }
  \rideCrash \ride \ride \ride \break                        %% 33-36
  \rideCrash \ride \rideCrash \ride \bar "||" \break         %% 37-40

  \mark \markup { \bold \box "Ext 2" }
  \ride \ride \ride \ride \break                             %% 41-44
  \ride \ride \ride \ride \bar "||" \break                   %% 45-48

  \segnoMark \default
  \mark \markup { \bold \box "Build" }
  <>\mp \ride \ride \ride \ride \break                       %% 49-52
  \ride \ride \ride \ride \break                             %% 53-56
  <>\mf \ride \ride \ride \ride \break                       %% 57-60
  \mark \markup { \bold \box "Push" }
  \push \push \push \push \break                             %% 61-64
  \push \push \push \push \break                             %% 65-68
  \mark \markup { \bold \box "Hold" }
  \push \push \push \pushLast \bar "||" \break               %% 69-72, snare on 4 of 72

  \mark \markup { \bold \box "Release" }
  \rideCrash \ride \ride \ride \break                        %% 73-76
  %% no \bar "||" here - it would eat the Head's repeat-start

  \repeat volta 2 {
    \mark \markup { \bold \box "Head" }
    \headX \headX \headX \headX \break                       %% 77-80
    \headX \headX \headX \headX \break                       %% 81-84
    \headX \headX \hitsHold \break                          %% 85-88, crash rings through 88
    R1 | R1 | \hits |                                        %% 89-91, 89-90 N.C. break
    \textMark \markup { \italic "Drum break" }
    \improvisationOn \hide Stem sn4 sn sn sn \undo \hide Stem \improvisationOff          %% 92 - drum break, slashes
    \codaMark 1
    \textEndMark \markup { \italic "To Coda" }
    \bar "||" \break

    \mark \markup { \bold \box "Vamp" }
    \ride \ride \ride \ride \break                           %% 93-96
    \ride \ride \ride \ride \break
    \ride \ride \ride \ride \break
    \ride \ride \ride \ride                                  %% 105-108
  }
  \textEndMark \markup { \italic "Last time D.S. al Coda" }
  \break

  \once \override Score.CodaMark.break-visibility = #begin-of-line-visible
  \codaMark 1
  \mark \markup { \bold \box "Coda" }
  \textMark \markup { \italic "Repeat as desired" }
  \repeat volta 2 { \ride \ride \ride \ride }                %% 109-112
  \break
  \hitsHold                                                  %% 113-114
  R1 | R1 | \hitsEnd                                         %% 115-117
  \bar "|."
}

\score {
  \new DrumStaff { \drumPart }
  \layout {
    indent = 0
    \context { \Score \override SystemStartBar.collapse-height = #0 }
  }
}

\score {
  \unfoldRepeats \new DrumStaff { \drumPart }
  \midi { }
}
