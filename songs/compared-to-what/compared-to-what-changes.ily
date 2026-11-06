%% "Compared to What" - the changes, in CONCERT pitch.
%%
%% Shared by compared-to-what-bass.ly (as is) and
%% compared-to-what-tenor.ly (via \transpose bes c in its \score).
%% Edit the harmony HERE, once. The repeat structure below must stay
%% in step with both parts' staves - see GOTCHAS.md #1.
%%
%% FORM (notated bars):
%%   Intro form, written out (no repeats), 8 bars each:
%%   A1      1-8    Eb        the lick x8
%%   B1     9-16   Ebm
%%   B2     17-24  Ebm
%%   A2     25-32  Eb7       bar 32 turns to Dm on beat 3
%%   Ext 1   33-40  Dm
%%   Ext 2   41-48  F7
%%   Build   49-52  F7
%%           53-56  Gbm7
%%           57-60  Gm7
%%   Push    61-68  Abm7 Am7 Bbm7 Bm7, two bars each
%%   Hold    69-72  C7        bass on the upbeats, high C
%%   Release 73-76  F7        back on the lick
%%   Head    77-92  F7        lyrics only - no melody written. Bass
%%                            pedals F eighths 77-86, then the hits:
%%                            87 & 91  F7 (dotted q) Bb7 (8~q) F7 (q)
%%                            88 F7 held (tied over from 87)
%%                            89-90 N.C., vocal break   92 drum break
%%                            (2026-11-05: N.C. moved from 88 to 89 and
%%                            the hit on 1 of 89 dropped - the user)
%%   Vamp    93-108  F7        16 bars; 77-108 (32 bars) repeated
%%   Last time: D.S. al Coda. The segno is on bar 49 (Build). Play
%%   through the Build, Release and the Head, then at the end of the
%%   Head (bar 92) jump:
%%   Coda    109-112  F7        the lick in F, 4-bar vamp, repeat as desired
%%           113-117          then bars 87-91 again, the hits (no
%%                            ending brackets - implied),
%%                            fermata on the last F7. End.
%%
%% KEY: the head is in F - the original key. The Real Book chart it was
%% taken from is a whole step up (G7 / C7), so everything from it is
%% transposed down: G7 -> F7, C7 -> Bb7. The Coda was specified as a
%% G7 vamp before that came to light; moved to F with the rest.
%%
%% The head's hits come from the Real Book chart (bars 11-16 of its
%% 16-bar form). Bar 92 is the drum break. 88 holds the F7 from 87
%% and 89-90 are the N.C. vocal break - the user's correction of the
%% Real Book reading (2026-11-05).

%% Split in two so a part can insert bars before the final hits (the
%% tenor's closing lick). Bass and drums use plain \changes.
changesMain = \chordmode {
  %% Intro. Written as plain Eb, as asked - the lick's Db would also
  %% support Eb7 if that is what the band actually hears here.
  \repeat unfold 8 ees1                %% A1  1-8

  \repeat unfold 16 ees1:m             %% B1, B2  9-24
  \repeat unfold 7 ees1:7              %% A2  25-32
  ees2:7 d2:m                 %% bar 32 - Dm on the last two beats
  \repeat unfold 8 d1:m               %% Ext 1  33-40
  \repeat unfold 8 f1:7               %% Ext 2  41-48

  %% Build - the roots climb chromatically, as in the Logic export.
  %% Qualities from Gb up are m7 throughout (from "Ab minor seven").
  %% The bass's build figure now has a MAJOR 3rd, which contradicts
  %% the Gbm7 and Gm7 - see BUILD in compared-to-what-bass.ly. From
  %% Abm7 the bass plays root and 4th only, so no clash there.
  \repeat unfold 4 f1:7
  \repeat unfold 4 ges1:m7
  \repeat unfold 4 g1:m7
  aes1:m7 aes:m7  a:m7 a:m7  bes:m7 bes:m7  b:m7 b:m7
  %% C7: the V of F, setting up the return. The bass drops to upbeats
  %% on C here (the export had C octaves).
  \repeat unfold 4 c1:7
  \repeat unfold 4 f1:7        %% Release

  \repeat volta 2 {
    %% Head
    \repeat unfold 10 f1:7                 %% 77-86
    %% F7 reprinted on 1 for redundancy - chordChanges would hide it
    \once \set chordChanges = ##f
    f4.:7 bes4.:7 f4:7                     %% 87 - hits
    f1:7                                   %% 88 - F7 held from 87
    r1 r1                                  %% 89-90 - N.C., vocal break
    %% F7 reprinted on 1 for redundancy - chordChanges would hide it
    \once \set chordChanges = ##f
    f4.:7 bes4.:7 f4:7                     %% 91 - hits
    f1:7                                   %% 92 - drum break
    %% Vamp (was Solo 2)
    \repeat unfold 16 f1:7                 %% 93-108
  }

  %% Coda
  %% mirrors the staves: 4-bar vamp repeat, then the hits (5 bars)
  \repeat volta 2 { f1:7 f:7 f:7 f:7 }    %% 109-112
}

changesEnd = \chordmode {
  \once \set chordChanges = ##f
  f4.:7 bes4.:7 f4:7                     %% 113 = 87
  f1:7                                   %% 114 = 88, F7 held
  r1 r1                                  %% 115-116 = 89-90, N.C.
  \once \set chordChanges = ##f
  f4.:7 bes4.:7 f4:7                     %% 117 = 91, fermata
}

changes = { \changesMain \changesEnd }
