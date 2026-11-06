# Compared to What

Soul Jazz · Gene McDaniels · quarter note = 144

| Part | Score | LilyPond source | MIDI |
| --- | --- | --- | --- |
| Bass | [PDF](compared-to-what-bass.pdf) | [Source](compared-to-what-bass.ly) | [MIDI](compared-to-what-bass.midi) |
| Tenor sax in B♭ | [PDF](compared-to-what-tenor.pdf) | [Source](compared-to-what-tenor.ly) | [MIDI](compared-to-what-tenor.midi) |
| Drums | [PDF](compared-to-what-drums.pdf) | [Source](compared-to-what-drums.ly) | [MIDI](compared-to-what-drums.midi) |

The chord symbols come from `compared-to-what-changes.ily` (concert pitch), which every part includes.

## Form

- Intro: A1 · B1 · B2 · A2 (8 bars each, written out), then Ext 1 · Ext 2.
- Build (segno) · Push · Hold · Release.
- Head + Vamp, repeated; drum break at bar 92, To Coda.
- Last time D.S. al Coda.
- Coda: 4-bar vamp, repeat as desired, then the hits to the end. The tenor part adds a 4-bar closing lick (repeat as desired) before the hits, so its Coda bar numbers run 4 ahead of the bass and drums.

## Rebuild

From the repository root, with LilyPond 2.24 installed:

```sh
bash ./generate-pdfs.sh compared-to-what
```

The PDFs and MIDI files are included here for direct download; this song has an explicit exception to the repository's generated-file ignores.
