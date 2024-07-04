#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: missing <1st dir path> <2nd dir path>"
    exit 1
fi

dir1="$1"
dir2="$2"

find_missing_files() {
    local dir1="$1"
    local dir2="$2"
    local missing_files=""

    files_dir1=$(find "$dir1" -type f -exec basename {} \; | sort)
    files_dir2=$(find "$dir2" -type f -exec basename {} \; | sort)

    while IFS= read -r file; do
        if ! grep -q "^$file$" <<< "$files_dir2"; then
            missing_files+="$file"$'\n'
        fi
    done <<< "$files_dir1"

    echo "$missing_files"
}

missing_in_dir2=$(find_missing_files "$dir1" "$dir2")
missing_in_dir1=$(find_missing_files "$dir2" "$dir1")

if [ -n "$missing_in_dir2" ]; then
    echo "Files missing in $dir1:"
    echo "$missing_in_dir2" | column
else
    echo "No files missing in $dir1 from $dir2."
fi

echo ""

if [ -n "$missing_in_dir1" ]; then
    echo "Files missing in $dir2:"
    echo "$missing_in_dir1" | column
else
    echo "No files missing in $dir2 from $dir1."
fi

