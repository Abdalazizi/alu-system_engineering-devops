#!/bin/bash

# Check if directory was passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

DIR="$1"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
  echo "Error: '$DIR' is not a directory or doesn't exist."
  exit 1
fi

# Loop through all files in the directory
for file in "$DIR"/*; do
  # Skip if it's README.md
  if [[ "$(basename "$file")" == "README.md" ]]; then
    echo "Skipping README.md"
    continue
  fi

  # Skip if it's not a regular file
  if [ -f "$file" ]; then
    chmod +x "$file"
    git add .
    git commit -m "made $file executable"
    git push
    echo "Made '$file' executable."
  fi
done
