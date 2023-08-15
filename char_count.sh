#!/bin/bash

# Author: Elena Pashkova
# Decription: Word counting script from external file.


# Check if a file is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Get the filename from the command-line argument
filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found: $filename"
    exit 1
fi

# Perform word count using 'wc' command
word_count=$(wc -w < "$filename")
line_count=$(wc -l < "$filename")
char_count=$(wc -m < "$filename")

# Print the statistics
echo "Word count: $word_count"
echo "Line count: $line_count"
echo "Character count: $char_count"

