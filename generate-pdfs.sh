#!/bin/bash

# Generate PDF files from .ly files in the songs directory
# Usage: ./generate-pdfs.sh [--all] [song_name]
# --all: Generate all file types (PDF, MIDI, etc.)
# song_name: Process only the specified song

generate_all=false
target_song=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --all)
      generate_all=true
      shift
      ;;
    *)
      target_song="$1"
      shift
      ;;
  esac
done

if [ -n "$target_song" ]; then
  if [ "$generate_all" = true ]; then
    echo "Generating all file types for song: $target_song"
  else
    echo "Generating PDF for song: $target_song"
  fi
else
  if [ "$generate_all" = true ]; then
    echo "Generating all file types from all LilyPond files..."
  else
    echo "Generating PDFs from all LilyPond files..."
  fi
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
        echo "Converting $ly_file to PDF..."
        
        # Generate files in the same directory as the .ly file
        if [ "$generate_all" = true ]; then
          lilypond --output="$song_dir" "$ly_file"
        else
          lilypond --pdf --output="$song_dir" "$ly_file"
        fi
        
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
  echo "✅ Generated $pdf_count PDF file(s)"
  echo "Note: These PDF files are for local testing only and will not be committed to git."
fi