#!/bin/bash

# Define the Downloads directory and subdirectories for different file types
DOWNLOADS_DIR="$HOME/Downloads"
IMAGE_DIR="$DOWNLOADS_DIR/Images"
DOCUMENT_DIR="$DOWNLOADS_DIR/Documents"
VIDEO_DIR="$DOWNLOADS_DIR/Videos"
OTHER_DIR="$DOWNLOADS_DIR/Other"

# Create subdirectories if they don't exist
mkdir -p "$IMAGE_DIR" "$DOCUMENT_DIR" "$VIDEO_DIR" "$OTHER_DIR"

# Function to move files to appropriate subdirectories
sort_file() {
    file="$1"
    extension="${file##*.}"

    case "$extension" in
        jpg|jpeg|png|gif)
            mv "$file" "$IMAGE_DIR/"
            ;;
        pdf|doc|docx|txt)
            mv "$file" "$DOCUMENT_DIR/"
            ;;
        mp4|avi|mkv)
            mv "$file" "$VIDEO_DIR/"
            ;;
        *)
            mv "$file" "$OTHER_DIR/"
            ;;
    esac
}

# Monitor Downloads directory for new files and sort them
inotifywait -m -q -e create -e moved_to "$DOWNLOADS_DIR" |
while read -r directory event file; do
    if [ -f "$directory/$file" ]; then
        sort_file "$directory/$file"
        echo "Moved '$file' to appropriate directory."
    fi
done

