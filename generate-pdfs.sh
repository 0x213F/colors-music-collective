#!/bin/bash

# Generate PDF files from .ly files in the songs directory
# Usage: ./generate-pdfs.sh [song_name]
# If song_name is provided, only that song will be processed

target_song="$1"

if [ -n "$target_song" ]; then
  echo "Generating files for song: $target_song"
else
  echo "Generating files from all LilyPond files..."
fi

pdf_count=0

# Find all .ly files in songs directories
for song_dir in songs/*/; do
  if [ -d "$song_dir" ]; then
    song_name=$(basename "$song_dir")
    
    # Skip if target song is specified and this isn't it
    if [ -n "$target_song" ] && [ "$song_name" != "$target_song" ]; then
      continue
    fi
    
    for ly_file in "$song_dir"*.ly; do
      if [ -f "$ly_file" ]; then
        echo "Converting $ly_file..."
        
        # Generate files in the same directory as the .ly file
        lilypond --output="$song_dir" "$ly_file"
        
        if [ $? -eq 0 ]; then
          echo "✅ Generated: ${song_dir}${song_name}.pdf"
          ((pdf_count++))
        else
          echo "❌ Failed to convert: $ly_file"
        fi
      fi
    done
  fi
done

if [ $pdf_count -eq 0 ]; then
  if [ -n "$target_song" ]; then
    echo "No .ly files found for song: $target_song"
  else
    echo "No .ly files found to convert."
  fi
else
  echo "✅ Generated $pdf_count file(s)"
  echo "Note: These files are for local testing only and will not be committed to git."
fi