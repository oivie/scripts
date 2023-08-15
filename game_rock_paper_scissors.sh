#!/bin/bash

# Authot: Elena Pashkova
# Description: Shell script game.
# Rock, Paper, Scissor Game
# The player choses either: rock, papper or scissors
# The script determines based on choises.


# Array of choices
choices=("rock" "paper" "scissors")

# Function to get computer's choice
get_computer_choice() {
    local index=$((RANDOM % 3))
    echo "${choices[index]}"
}

# Function to determine the winner
determine_winner() {
    local player_choice="$1"
    local computer_choice="$2"

    if [ "$player_choice" == "$computer_choice" ]; then
        echo "It's a tie!"
    elif [ "$player_choice" == "rock" ] && [ "$computer_choice" == "scissors" ] ||
         [ "$player_choice" == "paper" ] && [ "$computer_choice" == "rock" ] ||
         [ "$player_choice" == "scissors" ] && [ "$computer_choice" == "paper" ]; then
        echo "You win!"
    else
        echo "Computer wins!"
    fi
}

echo "Welcome to Rock, Paper, Scissors!"
read -p "Choose your move (rock/paper/scissors): " player_choice

# Check if the player's choice is valid
if [[ ! " ${choices[@]} " =~ " ${player_choice} " ]]; then
    echo "Invalid choice. Please choose rock, paper, or scissors."
else
    computer_choice=$(get_computer_choice)
