\version "2.24.0"

%% Aaj Shanibar — arrangement updated 2026-11-02.
%% Form: A x4, B x2; solos over C, A once between solos.
%% Head out: A x4, B x2, D (entire coda), E (vamp out on cue).
%% E is the opening four bars played twice, including their chords.
%% Printed bars: A 1-8, B 9-17 (alternative endings), C 18-25, D 26-37, E 38-45.
%% B: first ending on pass 1 and head-in pass 2 (then C); second ending
%% only on head-out pass 2, with the sax pickup and jump to D.
%% Concert pitch; no key signature. MIDI follows page order.

\header {
  title = "Aaj Shanibar (Ibiza)"
  subtitle = "House Jazz"
  subsubtitle = "Bass"
  composer = "Butcher Brown/ Rupa"
  tagline = ##f
}

#(set-global-staff-size 18)
\paper {
  ragged-last-bottom = ##t
  top-margin = 0.4\in
}

global = {
  \key c \major
  \numericTimeSignature
  \time 4/4
  \tempo 4 = 127
}

cycle = \chordmode {
  c1:m7  c:m7  d:7  d:7
  c1:m7  c:m7  d:7  d:7
}

cChords = \chordmode {
  \repeat volta 2 {
    c1:7  c:7  b:m7  b:m7  f:maj7  f:maj7  e:m7  e:m7
  }
}

chordPart = \chordmode {
  \repeat volta 4 { \cycle }
  \repeat volta 2 { c1:m7 c:m7 d:7 d:7 c:m7 c:m7 d:7 }
  \alternative { { d1:7 } { d1:7 } }
  \cChords
  c1:m7  c:m7  d:7  d:7
  c1:m7  c:m7  e:m7  e:m7
  g1:maj7  g2:maj7 r2  r1  r1
  \repeat volta 2 { \repeat unfold 2 { c1:m7 c:m7 d:7 d:7 } }

}

rOne   = { c8   g8   c'8  r8    d'8  ees'8 g8   c8   }
rTwo   = { r4        f'4         ees'8 d'8   c'8  b8~ }
rThree = { b8   d'8  g8   r8    fis8 g8    a8   d8~  }
rFour  = { d8   r8   c8   b,8   c8   d8    c4        }
riff   = { \rOne | \rTwo | \rThree | \rFour | }

cLine = {
  c'4. g4.   c4~   | c1   |
  b4.  fis4. b,4~  | b,1  |
  f'4. c'4.  f4~   | f1   |
  e'4. b4.   e4~   |
}

%% C percussion: dotted-eighth pairs at both ends, quarter note in the middle.
clave = { c8. c8. c4 c8. c8. | }

%% B: the and of 2 in the first three bars of each half.
%% C: the and of 2 for six bars, then a whole note tied over two bars.
hit = { r4 r8 c8 r2 }
rhythmLine = {
  \global
  \repeat volta 4 { R1*8 | }
  \repeat volta 2 {
    \hit | \hit | \hit | R1 |
    \hit | \hit | \hit |
  }
  \alternative { { R1 } { R1 } }
  \repeat volta 2 {
    \repeat unfold 6 { \hit | }
    c1~ | c1 |
  }
  R1*12 |
  \repeat volta 2 { R1*8 | }
}

percussionLine = {
  \global
  \repeat volta 4 {
    \repeat percent 4 { c8. c16 c8. c16 r8 c16 c16 r8 c8 | }
    s1*4 |
  }
  \repeat volta 2 {
    R1 | c1 | R1 | c1 |
    R1 | c1 | R1 |
  }
  \alternative { { c1 } { c1 } }
  \repeat volta 2 {
    \repeat percent 8 { \clave }
  }
  R1*12 |
  \repeat volta 2 { R1*8 | }

}

bass = {
  \global
  \clef bass
  \override Staff.Clef.break-visibility = #all-invisible

  \mark \markup { \bold \box "A" }
  \bar ".|:"
  \repeat volta 4 {
    \riff
    \break
    \riff
  }
  \break

  \mark \markup { \bold \box "B" }
  \repeat volta 2 {
    \riff
    \break
    \rOne | \rTwo | \rThree |
  }
  \alternative {
    { \rFour }
    { \once \override Score.VoltaBracket.text =
        \markup \normal-text \abs-fontsize #8 \line { "To Coda" \musicglyph "scripts.coda" }
      d8\repeatTie r8 c8 b,8 c8 d8 c4 }
  }
  \break

  \mark \markup { \bold \box "C" }
  \textMark \markup { \italic "Solo vamp — repeat on cue" }
  \repeat volta 2 { <>^\markup { \italic "Groove as written, songo, whole notes, or tacet, to taste" } \cLine e1 }
  \break

  \mark \markup { \bold \box "D" \musicglyph "scripts.coda" "Coda" }
  \riff
  \break
  \riff
  \break
  \rOne |
  r4 c'8 r8 r2 |
  R1 |
  r4 c8 b,8 c8 d8 c4 |
  \break
  \mark \markup { \bold \box "E" }
  \textMark \markup { \italic "Vamp out — 8 bars; repeat and end on cue" }
  \repeat volta 2 { \riff \break \riff }
  \bar ":|."
}

#(define-markup-command (sec layout props s) (markup?)
  (interpret-markup layout props (markup #:box (#:bold s))))
\markup { \fill-line { \column {
  \line { \bold "Form:" }
  \line { \sec A \sec A \sec A \sec A "→" \sec B \sec B "— Head in" }
  \line { \sec C "Vamp — solos;" \sec A "between solos" }
  \line { \sec A \sec A \sec A \sec A "→" \sec B \sec B "— Head out" }
  \line { "Then" \sec D "Coda →" \sec E "Vamp out (8 bars; repeat on cue)" }
} } }

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \chordPart
    }
    \new RhythmicStaff \with {
      instrumentName = "Perc."
      shortInstrumentName = "Perc."
        keepAliveInterfaces = #'(note-head-interface)
      \RemoveAllEmptyStaves
      \override NoteHead.style = #'cross
      fontSize = #-2
      \override StaffSymbol.staff-space = #(magstep -2)
    } { \percussionLine }
    \new RhythmicStaff \with {
      instrumentName = "Rhythm"
      shortInstrumentName = "Rhy."
      \RemoveAllEmptyStaves
      \override NoteHead.style = #'cross
      fontSize = #-2
      \override StaffSymbol.staff-space = #(magstep -2)
    } { \rhythmLine }
    \new Staff \with { instrumentName = "Bass" } { \bass }
  >>
  \layout {
    indent = 14\mm
    \context { \Score \override SystemStartBar.collapse-height = #0 }
  }
}

\score {
  <<
    \new ChordNames { \chordPart }
    \new Staff \with { midiInstrument = "electric bass (finger)" } { \bass }
  >>
  \midi { }
}
