#!/bin/bash

# Generate PDF files from all .ly files in the songs directory

echo "Generating PDFs from LilyPond files..."

pdf_count=0

# Find all .ly files in songs directories
for song_dir in songs/*/; do
  if [ -d "$song_dir" ]; then
    song_name=$(basename "$song_dir")
    
    for ly_file in "$song_dir"*.ly; do
      if [ -f "$ly_file" ]; then
        echo "Converting $ly_file to PDF..."
        
        # Generate PDF in the same directory as the .ly file
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
  echo "No .ly files found to convert."
else
  echo "✅ Generated $pdf_count PDF file(s)"
  echo "Note: These PDF files are for local testing only and will not be committed to git."
fi