\version "2.22.1"

\header {
  title = "Don't Forget"
  composer = "Cory Henry"
}

\paper {
  top-margin = 15                            % Add some padding to the very top of the page
  markup-system-spacing.basic-distance = 18  % Space between header and first system
}

% Define chords
chordNames = \chordmode {
  \set chordChanges = ##t
  \time 2/2
  des1/es | des1/es | es1:7.9 | es1:7.9 | b1/des | b1/des | e1/ges | es1/f |
}

% Define melody with new notes
melody = \relative c' {
  \clef treble
  \key c \major
  \time 2/2
  
  % Melody with new notes but keeping the same rhythm
  f1 ~ |     % F tied to next measure
  des1 ~ |   % D flat tied to next measure
  es1 ~ |    % E flat tied to next measure
  bes1 |     % B flat
  es1 ~ |    % E flat tied to next measure
  des1 ~ |   % D flat tied to next measure
  bes1 |     % B flat
  des1 |     % D flat
}

% Define bass line (back to original octave)
bassLine = \relative c {
  \clef bass
  \key c \major
  \time 2/2
  
  % Bass notes as specified (original octave)
  es,4. es4. es4 |  % First measure: E flat - dotted quarter, dotted quarter, quarter
  r1 |               % Second measure: rest
  es'4. es4. es4 |  % Third measure: E flat - dotted quarter, dotted quarter, quarter
  r1 |               % Fourth measure: rest
  des4. des4. des4 | % Fifth measure: D flat - dotted quarter, dotted quarter, quarter
  r1 |               % Sixth measure rest
  aes4. aes4. r4 |             % Seventh measure: G flat whole note
  a4. a4. a4 |               % Eighth measure: F whole note
}

% Define lyrics staff with the specified notes one octave higher
vocalsMusic = \relative c'' {
  \clef treble
  \key c \major
  \time 2/2
  
  % Rhythm for lyrics with the specified notes one octave higher
  r2 f2 | 
  des2 r2 |
  r2 es2 | 
  bes2 r2 |
  r2 es2 | 
  des2 r2 |
  
  % Final measures rhythm with specified notes one octave higher
  r1 |
  r4 bes4 des4 des4 |     % Bes, Des, Des - one octave higher
}

% Define drum part (commented out for now)
% drumPart = \drummode {
%   \time 2/2
%   
%   % Show all 8 measures explicitly with connected snare and hi-hat
%   <<
%     % Hi-hat pattern
%     {
%       hh4 hh8 hh8 hh4 hh8 hh8 |
%       hh4 hh8 hh8 hh4 hh8 hh8 |
%       hh4 hh8 hh8 hh4 hh8 hh8 |
%       hh4 hh8 hh8 hh4 hh8 hh8 |
%       hh4 hh8 hh8 hh4 hh8 hh8 |
%       hh4 hh8 hh8 hh4 hh8 hh8 |
%       hh4 hh8 hh8 hh4 hh8 hh8 |
%       hh4 hh8 hh8 hh4 hh8 hh8 |
%     }
%     
%     % Bass drum pattern
%     {
%       bd2 bd2 |
%       bd2 bd2 |
%       bd2 bd2 |
%       bd2 bd2 |
%       bd2 bd2 |
%       bd2 bd2 |
%       bd2 bd2 |
%       bd2 bd2 |
%     }
%     
%     % Snare pattern (coordinated with hi-hat hits on beat 3)
%     {
%       r2 <sn hh>2 |
%       r2 <sn hh>2 |
%       r2 <sn hh>2 |
%       r2 <sn hh>2 |
%       r2 <sn hh>2 |
%       r2 <sn hh>2 |
%       r2 <sn hh>2 |
%       r2 <sn hh>2 |
%     }
%   >>
% }

% Define two sets of lyrics text
chorusOne = \lyricmode {
  "Please" "don't"
  "for" "get"
  "what" "you're"
  "liv" -- "ing" "for" 
}

chorusTwo = \lyricmode {
  "Please" "don't"
  "for" "get"
  "what" "you're"
  "fight" -- "ing" "for" 
}

verseOneMusic = \relative c'' {
  \clef treble
  \key c \major
  \time 2/2
  
  % First grouping
  r1 | 
  r4 c4. c4. |
  c4. c4. c4 |
  c2 c2 |
  r1 | 
  r4 c8 c8 r8 c8 r4 |
  c4 r8 c8 r8 c8 r4 |
  c2 c2 |
  % Second grouping
  r1 | 
  r4 c4. c4. |
  c4. c4. c4 |
  c2 c2 |
  r1 |
  r4 c8 c8 r8 c8 r8 c8 |
  r4. c8 r8 c8 r8 c8 |
  r4. c8 r8 c8 r8 c8 |
}

% Define two sets of lyrics text
verseOneLyrics = \lyricmode {
  "Sun" "shine" "don't" "come" "with" "out" "rain"
  "and" "that's" "o" "kay" "(That's" "o" "kay)" ""
  "Love" "ain't" "ma" "gic" "with" "out" "pain"
  "So" "we" "keep" "trying,"
  "we" "keep" "trying" "an" "y" "ways"
}

verseTwoMusic = \relative c'' \relative c'' {
  \clef treble
  \key c \major
  \time 2/2
  
  % First grouping
  r1 | 
  r4 c4. c4. |
  c4. c4. c4 |
  c2 c2 |
  r1 | 
  r4 c8 c8 r8 c8 r8 c8 |
  r4. c8 r8 c8 r8 c8 |
  r1 |
  % Second grouping
  r1 | 
  r4 c4. c4. |
  c4. c4. c4 |
  c2 c2 |
  r1 |
  r4 c8 c8 r8 c8 r8 c8 |
  r4. c8 r8 c8 r8 c8 |
  r4. c8 r8 c8 r8 c8 |
}

% Define two sets of lyrics text
verseTwoLyrics = \lyricmode {
  "Time" "means" "no" "thing" "with" "out" "change"
  "So" "don't" "waste" "it" "(Don't)" "waste" "it"
  "Hate" "is" "fear" "that" "is" "not" "tamed"
  "So" "we" "keep" "trying," "we" "keep" "trying" "ev" "ery" "day"
}

verseThreeMusic = \relative c'' \relative c'' {
  \clef treble
  \key c \major
  \time 2/2
  
  % First grouping
  r4 c8 c8 c4 c8 c8 | 
  c4 c8 c8 r4 c8 c8 |
  c4 c8 c8 c4 c8 c8 |
  r1 |
  r4 c8 c8 c4 c8 c8 | 
  c4 c8 c8 r4 c8 c8 |
  c4 c8 c8 c4 c8 c8 |
  r1 |
}

% Define two sets of lyrics text
verseThreeLyrics = \lyricmode {
  "Don't" "for" "get" "what" "you're" "liv" "ing" "for,"
  "don't" "for" "get" "what" "you're" "liv" "ing" "for."
  "Don't" "for" "get" "what" "you're" "fight" "ing" "for,"
  "don't" "for" "get" "what" "you're" "fight" "ing" "for."
}

\score {
  <<
    \new ChordNames \chordNames
    \new Staff \melody
    \new Staff \bassLine
    \new Staff = "vocals" {
      \new Voice = "voice" \vocalsMusic
    }
    \new Lyrics \lyricsto "voice" {
      \set stanza = "1. "
      \chorusOne
    }
    \new Lyrics \lyricsto "voice" {
      \set stanza = "2. "
      \chorusTwo
    }
  >>
  \layout { }
  \midi { \tempo 2 = 80 }
}

\score {
  <<
    \new Staff = "vocals" {
      \new Voice = "voice" \verseOneMusic
    }
    \new Lyrics \lyricsto "voice" {
      \set stanza = "A. "
      \verseOneLyrics
    }
  >>
  \layout { }
  \midi { \tempo 2 = 80 }
}

\score {
  <<
    \new Staff = "vocals" {
      \new Voice = "voice" \verseTwoMusic
    }
    \new Lyrics \lyricsto "voice" {
      \set stanza = "B. "
      \verseTwoLyrics
    }
  >>
  \layout { }
  \midi { \tempo 2 = 80 }
}

\score {
  <<
    \new Staff = "vocals" {
      \new Voice = "voice" \verseThreeMusic
    }
    \new Lyrics \lyricsto "voice" {
      \set stanza = "C. "
      \verseThreeLyrics
    }
  >>
  \layout { }
  \midi { \tempo 2 = 80 }
}