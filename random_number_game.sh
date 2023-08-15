#!/bin/bash


# Author: Elena Pashkova
# Description: Shell script game.
# In this game, the script generates a random number.
# The player tries to guess that number.
# The script provides feedback to help the player guess correctly.



# Generate a random number between 1 and 100
target_number=$((RANDOM % 100 + 1))

echo "Welcome to the Number Guessing Game!"
echo "Try to guess the secret number between 1 and 100."

# Initialize variables
guess=0
attempts=0

# Loop until the player guesses the correct number
while [ $guess -ne $target_number ]; do
    read -p "Enter your guess: " guess

    # Check if the input is a valid number
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a number."
        continue
    fi

    ((attempts++))

    # Provide feedback based on the guess
    if [ $guess -lt $target_number ]; then
        echo "Try a higher number."
    elif [ $guess -gt $target_number ]; then
        echo "Try a lower number."
    fi
done

echo "Congratulations! You guessed the number $target_number in $attempts attempts."

