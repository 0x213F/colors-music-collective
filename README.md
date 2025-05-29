# Colors Music Collective

A collection of songs with historical and social significance, featuring sheet music and descriptions.

## Contributing

To add a new song to the collection:

1. Create a new directory in `/songs/` with the song name (use lowercase with hyphens)
2. Add an `info.json` file with the song title and description:
   ```json
   {
     "title": "Song Title",
     "description": "Brief description of the song's significance..."
   }
   ```
3. Optionally add a `.ly` (LilyPond) file for sheet music that will be converted to PDF
4. Submit a pull request

The website automatically updates when changes are merged to the main branch.

## Local Development

For local testing and development on macOS:

### Setup
```bash
# Install LilyPond and dependencies
./install-deps.sh
```

### Generate PDFs
```bash
# Generate PDFs for all songs (default)
./generate-pdfs.sh

# Generate PDF for a specific song
./generate-pdfs.sh fables-of-faubus

# Generate all file types (PDF, MIDI, etc.) for all songs
./generate-pdfs.sh --all

# Generate all file types for a specific song
./generate-pdfs.sh --all fables-of-faubus
```

Note: Local PDFs are for testing only and will not be committed to git.

## License

This project is currently offered with no license.