#!/usr/bin/env bash

set -euxo pipefail

# Define directories
LIBS_DIR="ReproGame/bin/Debug/net8.0"
XACT_DIR="ReproGame/bin/Debug/net8.0/Content/audio"

# Process function
process_directory() {
  local DIR="$1"

  # Ensure the directory exists
  if [[ -d "$DIR" ]]; then
    cd "$DIR" || return

    # Find files ending in .new
    NEW_FILES=(*.new)
    OLD_FILES=(*.old)

    if [[ ${#NEW_FILES[@]} -gt 0 && ${NEW_FILES[0]} != "*.new" ]]; then
      # Handle .new files
      for NEW_FILE in "${NEW_FILES[@]}"; do
        PREFIX="${NEW_FILE%.new}"
        if [[ -f "$PREFIX" ]]; then
          mv "$PREFIX" "$PREFIX.old" # Add .old to the original file
        fi
        mv "$NEW_FILE" "$PREFIX"     # Strip .new from the new file
      done
    elif [[ ${#OLD_FILES[@]} -gt 0 && ${OLD_FILES[0]} != "*.old" ]]; then
      # Handle .old files
      for OLD_FILE in "${OLD_FILES[@]}"; do
        PREFIX="${OLD_FILE%.old}"
        if [[ -f "$PREFIX" ]]; then
          mv "$PREFIX" "$PREFIX.new" # Add .new to the original file
        fi
        mv "$OLD_FILE" "$PREFIX"     # Strip .old from the old file
      done
    fi

    # Return to the original directory
    cd - > /dev/null || exit
  else
    echo "Directory not found: $DIR" >&2
  fi
}

# Check arguments
if [[ "$#" -eq 0 ]]; then
  echo "Usage: $0 [libs] [xact]"
  exit 1
fi

# Process arguments
for ARG in "$@"; do
  case "$ARG" in
    libs)
      process_directory "$LIBS_DIR"
      ;;
    xact)
      process_directory "$XACT_DIR"
      ;;
    *)
      echo "Unknown argument: $ARG" >&2
      echo "Valid arguments are: libs, xact"
      exit 1
      ;;
  esac
done
