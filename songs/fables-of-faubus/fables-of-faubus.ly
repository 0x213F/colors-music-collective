\version "2.22.0"

% Remove meter from header since we only want it at the beginning of the score
\header {
  title = "Fables of Faubus"
  composer = "Charles Mingus"
  tagline = ##f
}

\paper {
  #(set-paper-size "letter")
  top-margin = 0.75\in
  bottom-margin = 0.75\in
  left-margin = 0.75\in
  right-margin = 0.75\in
  indent = 0\mm  % This removes the indentation at the beginning of the score
  score-system-spacing = #'((basic-distance . 6) (minimum-distance . 4) (padding . 2))
  markup-system-spacing = #'((basic-distance . 4) (padding . 2))
  score-markup-spacing = #'((basic-distance . 4) (padding . 2))
  system-system-spacing = #'((basic-distance . 12) (minimum-distance . 8) (padding . 2))
  between-scores-system-spacing = #'((basic-distance . 10) (minimum-distance . 8) (padding . 2))
}

global = {
  \key aes \major
  \time 4/4
  \set Staff.midiInstrument = "acoustic grand"
  \numericTimeSignature
}

introMusic = {
  \mark \markup { \box \bold "Intro" }
  \bar ".|:"  % Add opening repeat bar at very beginning
  f'2\glissando aes'2^\markup { \bold "B♭m7" } | 
  r8 f'8 a'8 bes'8 \tuplet 3/2 { b'16 c''16 b'16 } bes'16 a'16 f'4 | 
  g'2\glissando bes'2^\markup { \bold "D♭7♯11" } | 
  r8 g'8 bes'8 c''8 \tuplet 3/2 { des''16 d''16 des''16 } c''16 bes'16 g'4 |
}


verseOne = \lyricmode {
  "Oh" "Lord"
  "don't" "let" "them" "" "shoot"  "" "" "" "us"
  "Oh" "Lord"
  "don't" "let" "them" "" "stab" "" "" "" "us"
}

verseTwo = \lyricmode {
  "Oh" "Lord"
  "don't" "let" "them" "" "tar" "and" "fea" -- "ther" "us"
  "Oh" "Lord"
  "no" "" "more" "" "swas" "" "ti" "" "kas" ""
}

headA = {
  \mark \markup { \box \bold "A" }
  \override Staff.Clef.stencil = ##f  % Makes clef invisible after intro
  bes'4-.^\markup { \bold "B♭m7" } bes'4-- bes'4-. bes'4-- | 
  r4 aes'8. bes'16 c''8. bes'16 aes'4 | 
  f'4-.^\markup { \bold "D♭7♯11" } f'2.-- | 
}

firstEndingA = {
  f'4-. f'2.-- |
}

secondEndingA = {
  f'4-. f'4--~ f'8 c'8 \tuplet 3/2 { des'8 e'8 g'8 } |
}

% For section B and beyond, all staves should hide the time signature
headB = {
  \mark \markup { \box \bold "B" }
  aes'1~^\markup { \bold "Gm7♭5" } | 
  aes'8^\markup { \bold "C+7" } c''8 \tuplet 3/2 { des''8 f''8 aes''8 } des''8 bes'8 g'8 e'8 | 
  ges'4.^\markup { \bold "Fm" } f'8 \tuplet 3/2 { bes'4 aes'4 ges'8 f'8 } | 
  g'4.^\markup { \bold "D♭7♯11" } f'8 aes'8 g'8 f'8 c'8 |
}

sectionBFirstEnding = {
  ees'2.^\markup { \bold "C+7♯9" } s8 c'8 | 
  e'2.^\markup { \bold "B♭7♯11" } s8 c'8 | 
  f'2.^\markup { \bold "A♭7" } s8 c'8 |
  \break
  % Modified text to be smaller and with boxed A
  \once \override Score.RehearsalMark.direction = #UP
  \once \override Score.RehearsalMark.extra-offset = #'(0 . 2)
  ges'1~^\markup { \bold "G+7" } | ges'1 |
  \mark \markup { \smaller \italic "Repeat to beginning of " \box \bold "A" }
  g'!2\glissando bes'2 | r8 g'8 bes'8 c''8 \tuplet 3/2 { des''16 d''16 des''16 } c''16 bes'16 g'4 |
}

sectionBSecondEnding = {
  ees'2.^\markup { \bold "C+7♯9" } s8 c'8 | 
  e'2. s8 c'8 | \break
  g'1~ |
  f'2 \tuplet 3/2 { aes'4 c''4 e''4 } |  % This is the corrected 4th measure
  g''1~ |
  g''2. \tuplet 3/2 { a'8 bes'8 b'8 } |
  \break
}

% Add lyrics for section B (second time only)
sectionBLyrics = \lyricmode {
  \skip1 \skip1 \skip1 \skip1
  \skip1 \skip1 \skip1
}

bassMusic = {
  r1 | r1 | r1 | r1 |
}

sectionC = {
  \mark \markup { \box \bold "C" }
  c''4.^\markup { \bold "B♭maj7" } b'8 c''2~ | 
  c''4. bes'8 c''8 des''8 c''8 bes'8 |
  a'4.^\markup { \bold "G♭maj7" } g'8 a'2~ | 
  a'2. \tuplet 3/2 { a'8 bes'8 b'8 } |
  
  \break

  % Repeating the pattern for the second 4 bars
  c''4.^\markup { \bold "B♭maj7" } b'8 c''2~ | 
  c''4. bes'8 ees''8 des''8 c''8 bes'8 |
  a'4.^\markup { \bold "G♭maj7" } g'8 a'2~ | 
  a'4. g'8 a'8 bes'8 a'8 g'8 |
}

solos = {
  \mark \markup { \box \bold "Improvise" }
  r1 |
  r1 |
}

spokenWordText = \markup {
  \vspace #1
  \column {
    \line \italic { Spoken word: }
    \line { "We are in Little Rock, Arkansas, and it's the first day of school." }
    \line { " " }
    \line { "3 years prior, Brown v. Board instructed the states to begin desegregation plans" }
    \line { "\"with all deliberate speed.\"" }
    \line { " " }
    \line { "Yet it has been 3 full years, and there still has yet to be a single" }
    \line { "desegregated school in this town." }
    \line { " " }
    \line { "Well, today that was supposed to change. See earlier today 9 Black students" }
    \line { "showed up for their first day of class at Central High." }
    \line { " " }
    \line { "But what happened when they showed up?" }
    \line { " " }
    \line { "These Little Rock 9 were met with a screaming mob! And a line of state" }
    \line { "National Guard troopers bearing rifles!" }
    \line { " " }
    \line { "Now these uniformed officers, they should have been facing the mob, but no!" }
    \line { " " }
    \line { "Governor Orval Faubus deemed these 9 children as the threat when the real" }
    \line { "threat was the white supremesist mob!" }
  }
}

onCue = {
  \mark \markup { \box \bold "On Cue" }
  r1 | r1 | r1 |
  r1 | r1 | r1 |
}

headD = {
  \mark \markup { \box \bold "D" }
  r1 | r1 | r1 |
}

firstEndingD = {
  r1 |
}

secondEndingD = {
  r1 |
}

sectionE = {
  \mark \markup { \box \bold "E" }
  r1 | r1 | r1 | r1 | r1 |
  r1 |
}

sectionEEnd = {
  r1 | r1 | r1 | r1 |
}

sectionEEndTwo = {
  r1 | r1 | r1 | r1 |
}

\score {
  <<
    % Intro and Section A have only one staff with melodies and lyrics
    \new Staff = "melody" {
      \global
      
      \new Voice = "voice" {
        \repeat volta 2 {
          \introMusic
        }
      }
      
      % Hide time signature for all subsequent sections
      \override Staff.TimeSignature.stencil = ##f
      \break
      
      % Modified Section A to be a single line
      \new Voice {
        \repeat volta 2 {
          \headA
        }
        \alternative {
          \firstEndingA
          \secondEndingA
        }
      }
      \break
    }
    
    \new Lyrics \lyricsto "voice" {
      \set stanza = ""
      \verseOne
    }
    
    \new Lyrics \lyricsto "voice" {
      \set stanza = ""
      \verseTwo
    }
  >>
  \layout { 
    indent = 0\mm
    \context {
      \Score
      \override SystemStartBar.collapse-height = #1
    }
  }
  \midi { }
}

% Adding standalone lyrics below section A
\markup {
  \column {
    \vspace #0.5
    \line { \italic "Theatrical lyrics (after B):" }
    \line { \bold "C:" "Name me someone who's ridiculous; Dannie?" \bold "D:" "(Slowly) Governor! Orval! Faubus!"}
    \line { \bold "C:" "Why is he so sick and rediculous?" \bold "D:" "He won't permit us in his schools!" \bold "C:" "Then he's a fool!"}
    \vspace #1.0
  }
}

% Section B with just two staffs - treble and bass
\score {
  \header {
    title = ""
    piece = ""
  }
  <<
  \new Staff = "treble" {
    \global
    \override Staff.TimeSignature.stencil = ##f
    % System start bar will create a connected repeat bar
    \repeat volta 2 {
      \headB
    }
    \alternative {
      \sectionBFirstEnding
      \sectionBSecondEnding
    }
  }
  
  % Add lyrics for section B that appear below treble staff
  \new Lyrics {
    \sectionBLyrics
  }

  \new Staff = "bass" {
    \clef bass
    \global
    \override Staff.TimeSignature.stencil = ##f
    % The ending brackets will now connect between staves
    \repeat volta 2 {
      \bassMusic
    }
    \alternative {
      { r1 | r1 | r1 | r1 | r1 | r1 | r1 | }
      { r1 | r1 | r1 | r1 | r1 | r1 | }
    }
  }
  >>
  \layout { 
    indent = 0\mm
    \context {
      \Score
      \override SystemStartBar.collapse-height = #1
    }
  }
}

% Remaining sections with single staff
\score {
  \header {
    title = ""
    piece = ""
  }
  \new Staff {
    \global
    \override Staff.TimeSignature.stencil = ##f
    
    \sectionC
    \break
    \repeat volta 2 {
      \solos
    }
    \break
    
    % New spoken word section added here - no bars
    \once \override Score.RehearsalMark.self-alignment-X = #LEFT
    \mark \spokenWordText
    \break
    
    \onCue
    \repeat volta 2 {
      \headD
    }
    \alternative {
      \firstEndingD
      \secondEndingD
    }
    \sectionE
    \sectionEEnd
  }
  \layout { 
    indent = 0\mm
    \context {
      \Score
      \override SystemStartBar.collapse-height = #1
    }
  }
  \midi { }
}