#!/bin/bash

# Author: Elena Pashkova
# Description: Cyphre that is replacing each letter with the letter that follows it in the alphabet.
# Do not forget to
        # Make the script executable with
        # chmod +x phrase_coder.sh.
        # Run the script with ./phrase_coder.sh.




# Function to code a single letter
code_letter() {
    local letter="$1"
    local next_letter=$(echo "$letter" | tr 'a-y' 'b-z' | tr 'z' 'a')
    echo -n "$next_letter"
}

# Read the input phrase from the user
read -p "Enter a phrase: " input_phrase

# Convert each letter in the input phrase
coded_phrase=""
for (( i=0; i<${#input_phrase}; i++ )); do
    letter="${input_phrase:i:1}"
    coded_letter=$(code_letter "$letter")
    coded_phrase="$coded_phrase$coded_letter"
done

# Print the coded phrase
echo "Coded Phrase: $coded_phrase"

