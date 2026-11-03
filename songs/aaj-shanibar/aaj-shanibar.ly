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
  composer = "Butcher Brown/ Rupa"
  tagline = ##f
}

#(set-global-staff-size 15)
\paper {
  ragged-last-bottom = ##t
  paper-height = 9.4\in
  top-margin = 0.25\in
  bottom-margin = 0.3\in
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

#(define (paren-side side glyph)
   (lambda (grob)
     (let ((head (ly:note-head::print grob))
           (paren (ly:font-get-glyph (ly:grob-default-font grob) glyph)))
       (ly:stencil-combine-at-edge head X side paren 0.25))))
openParen  = \once \override NoteHead.stencil =
  #(paren-side LEFT "accidentals.leftparen")
closeParen = \once \override NoteHead.stencil =
  #(paren-side RIGHT "accidentals.rightparen")

figDC    = { d''8 c''16 d''8 c''16 d''8~ }
figDClv  = { d''8 c''16 d''8 c''16 d''8\laissezVibrer }
figHarmLv = { g'8 f'16 g'8 f'16 g'8\laissezVibrer }

answer   = { d''8 b'8-. r4 }
answerD  = { d''8 c''8-. r4 }

figBeb   = { d''8 ees''16 d''8 c''16 b'8~ }
figBsh   = { d''8. \acciaccatura e''16 d''8 c''16 b'8~ }
figFs    = { fis''8 f''16 fis''8 f''16 fis''8~ }
figCs    = { cis''8 c''16 cis''8 c''16 cis''8~ }
lift     = { b'4 g''4-. }

tptRunA  = { g'16 g' g' d'' d'' d'' g'' g'' }
tptRunB  = { g''16 d'' d'' d'' a' a' a' g' g'8. d'8. c'8 }
saxRunA  = { c'16 c' c' g' g' g' c'' c'' }
saxRunB  = { c''16 g' g' g' d' d' d' c' c'8. d'8. c'8 }

lick     = { r2. r8 a'8~ | a'4. g'2 fis'8~ }
lickHold = { \after 2 \> fis'1~\< | fis'4. r8\! r2 }

%% E: sax melody; trumpet doubles a perfect fifth above, as in bar 37.
outVamp = {
  \after 2 \< d''1~\> |
  d''4\! r4 \figDC |
  \answer \figDC |
  \answer \figDC |
  \break
  \after 2 \< d''1~\> |
  d''4\! r4 \figDC |
  \answer \figDC |
  \answer \figDClv |
}

sax = {
  \global
  \override Staff.Clef.break-visibility = #all-invisible

  \mark \markup { \bold \box "A" }
  \bar ".|:"
  \repeat volta 4 {
    \openParen \after 2 \< d''1~\>^\markup { \italic "Only on repeat" } |
    \closeParen d''4\! r4 \figDC |
    \answer \figDC |
    \answer \figDC |
    \break
    \after 2 \< d''1~\> |
    d''4\! r4 \figDC |
    \answer \figDC |
    \answer \figDC |
  }
  \break

  \mark \markup { \bold \box "B" }
  \repeat volta 2 {
    \openParen d''1~\<^\markup { \italic "Only on entering" } |
    \closeParen \after 1 \! d''1\> |
    R1*2 |
    \break
    R1*3 |
  }
  \alternative {
    { R1 }
    { \once \override Score.VoltaBracket.text =
        \markup \normal-text \abs-fontsize #8 \line { "To Coda" \musicglyph "scripts.coda" }
      r2 \figDClv }
  }
  \pageBreak

  \mark \markup { \bold \box "C" }
  \textMark \markup { \italic "Solo vamp — repeat on cue" }
  \repeat volta 2 { R1*8 | }
  \break

  \mark \markup { \bold \box "D" \musicglyph "scripts.coda" "Coda" }
  \answerD \figDC |
  \answerD \figBeb |
  \lift \figBsh |
  b'4 r4 r2 |
  \break
  R1*3 |
  r2 \figCs |
  \break
  cis''8 a'8 r8 fis'16 fis'16
    fis'8 fis'8 fis'8 f'16 fis'16~ |
  fis'4 r4 \saxRunA |
  \saxRunB |
  b4-. r4 \figHarmLv |
  \pageBreak
  \mark \markup { \bold \box "E" }
  \textMark \markup { \italic "Vamp out — 8 bars; repeat and end on cue" }
  \repeat volta 2 { \outVamp }
  \bar ":|."
}

%% C percussion: dotted-eighth pairs at both ends, quarter note in the middle.
clave = { c8. c8. c4 c8. c8. | }

%% B: the and of 2 in the first three bars of each half.
%% C: the and of 2 for six bars, then a whole note tied over two bars.
hit = { r4 r8 c8 r2 }
%% Chord guide replaces the silent horn staves during the C solo vamp.
chordGuide = {
  \global
  \repeat volta 4 { s1*8 }
  \repeat volta 2 { s1*7 }
  \alternative { { s1 } { s1 } }
  \repeat volta 2 { \repeat unfold 8 { c4 c4 c4 c4 | } }
  s1*12
  \repeat volta 2 { s1*8 }
}

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

bassPart = {
  \global
  \clef bass
  \override Staff.Clef.break-visibility = #all-invisible
  \repeat volta 4 { \riff \riff }
  \repeat volta 2 { \riff \rOne | \rTwo | \rThree | }
  \alternative { { \rFour } { d8\repeatTie r8 c8 b,8 c8 d8 c4 } }
  \repeat volta 2 { <>^\markup { \italic "Groove as written, songo, whole notes, or tacet, to taste" } \cLine e1 }
  \riff \riff
  \rOne |
  r4 c'8 r8 r2 |
  R1 |
  r4 c8 b,8 c8 d8 c4 |
  \repeat volta 2 { \riff \riff }
  \bar ":|."
}

bassShow = {
  \global
  \clef bass
  \override Staff.Clef.break-visibility = #all-invisible
  \repeat volta 4 {
    \riff
    s1*4
  }
  \repeat volta 2 { s1*7 }
  \alternative { { s1 } { s1 } }
  \repeat volta 2 { <>^\markup { \italic "Groove as written, songo, whole notes, or tacet, to taste" } \cLine e1 }
  \riff \riff
  \rOne |
  r4 c'8 r8 r2 |
  R1 |
  r4 c8 b,8 c8 d8 c4 |
  \repeat volta 2 { \riff \riff }
  \bar ":|."
}

trumpet = {
  \global
  \override Staff.Clef.break-visibility = #all-invisible

  \repeat volta 4 { R1*8 | }

  \repeat volta 2 {
    \lick | \lickHold | \lick |
    \after 2 \> fis'1~\< |
  }
  \alternative {
    { fis'4. r8\! r2 }
    { fis'4.\repeatTie r8\! r2 }
  }

  \repeat volta 2 { R1*8 | }

  R1*3 |
  r2 \figDC |
  \answerD \figDC |
  \answerD \figBeb |
  \lift \figBsh |
  b'4 r4 \figFs |
  fis''8 d''8 r8 fis''16 fis''16
    fis''8 fis''8 fis''8 f''16 fis''16~ |
  fis''4 r4 \tptRunA |
  \tptRunB |
  b4-. r4 \figDClv |
  \repeat volta 2 { \transpose c g \outVamp }
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
    \new StaffGroup <<
      \new RhythmicStaff \with {
        instrumentName = "Chords"
        shortInstrumentName = "Ch."
        \RemoveAllEmptyStaves
        \override NoteHead.style = #'slash
        \override Stem.stencil = ##f
        \override TimeSignature.stencil = ##f
      } { \chordGuide }
      \new Staff \with { instrumentName = "Sax" shortInstrumentName = "Sax" \RemoveEmptyStaves } {
        \new Voice \with { \consists "Pitch_squash_engraver" } { \sax }
      }
      \new RhythmicStaff \with {
        instrumentName = "Perc."
        shortInstrumentName = "Perc."
        keepAliveInterfaces = #'(note-head-interface)
        \RemoveAllEmptyStaves
        \override NoteHead.style = #'cross
      } { \percussionLine }
      \new RhythmicStaff \with {
        instrumentName = "Rhythm"
        shortInstrumentName = "Rhy."
        \RemoveAllEmptyStaves
        \override NoteHead.style = #'cross
      } { \rhythmLine }
      \new Staff \with { instrumentName = "Tmpt" shortInstrumentName = "Tmpt" \RemoveEmptyStaves } {
        \new Voice \with { \consists "Pitch_squash_engraver" } { \trumpet }
      }
      \new Staff \with {
        instrumentName = "Bass" shortInstrumentName = "Bass"
        \RemoveAllEmptyStaves
      } { \bassShow }
    >>
  >>
  \layout {
    indent = 0\mm
    \context { \Score \override SystemStartBar.collapse-height = #0 }
  }
}

\score {
  <<
    \new ChordNames { \chordPart }
    \new Staff \with { midiInstrument = "alto sax" } { \sax }
    \new Staff \with { midiInstrument = "trumpet" } { \trumpet }
    \new Staff \with { midiInstrument = "electric bass (finger)" } { \bassPart }
  >>
  \midi { }
}
