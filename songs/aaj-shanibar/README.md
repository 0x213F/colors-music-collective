# Aaj Shanibar (Ibiza)

House Jazz · Butcher Brown/ Rupa · quarter note = 127 · concert pitch

| Part | Score | LilyPond source | MIDI |
| --- | --- | --- | --- |
| Full score | [PDF](aaj-shanibar.pdf) | [Source](aaj-shanibar.ly) | [MIDI](aaj-shanibar.midi) |
| Bass | [PDF](aaj-shanibar-bass.pdf) | [Source](aaj-shanibar-bass.ly) | [MIDI](aaj-shanibar-bass.midi) |

## Form

- Head in: A A A A → B B.
- Solos: C vamp, with A between solos.
- Head out: A A A A → B B, taking the pickup ending to D (coda).
- E: eight-bar vamp out; repeat and end on cue.

The form summary governs the performance. Take B's first printed ending on the head in; use the To Coda ending on the second B of the head out. MIDI is a notation reference in page order, not a complete performance of the roadmap or open-ended solo vamps.

## Rebuild

From the repository root, with LilyPond 2.24 installed:

```sh
bash ./generate-pdfs.sh aaj-shanibar
```

Both sources are self-contained. The PDFs and MIDI files are included here for direct download; this song has an explicit exception to the repository's generated-file ignores.
