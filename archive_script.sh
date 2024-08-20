#!/bin/bash

# Variables
base=/home/manohar/MyScripts/PROJECTS/ARCHIVE_PROJECT
days=10
depth=1
run=0

# Check if base directory exists
if [[ ! -d $base ]]; then
    echo "Directory not found: $base"
    exit 1
else
    echo "Path found: $base"
fi

# Create archive folder if not present
if [[ ! -d $base/archive ]]; then
    echo "Folder $base/archive not found..."
    echo "Creating $base/archive folder..."
    mkdir -p $base/archive
    echo "Archive folder created successfully 😃"
else
    echo "Archive folder found 😊"
fi

echo "Archiving files in archive folder 🔄"

# Check if largeFolder exists
if [[ ! -d $base/largeFolder ]]; then
    echo "largeFolder not found in $base"
    exit 1
fi

# Find and archive files larger than 1MB
find $base/largeFolder -maxdepth $depth -type f -size +1M | while read -r i; do
    if [ $run -eq 0 ]; then
        echo "Larger file found: $i 📂"
        echo "Archiving $i... ✔️"
        gzip "$i" || exit 1
        mv "$i.gz" "$base/archive" || exit 1
        echo "Archiving $i done ✅"
    fi
done

echo "to see archive files use command - cd $base/archive && ls -ltr👍"
