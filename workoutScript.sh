#!/bin/bash

# List of workout activities
workoutList=("Biceps, Triceps and Forearms" "Abs and Cardio" "Chest and Back" "Leg and Pelvic Floor Muscles" "Biceps, Triceps and Forearms" "Abs and Chest" "Rest")

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'  # Reset color to default

# Function to get the current index, default to 0 if the file doesn't exist
get_index() {
    if [ -f .index ]; then
        cat .index
    else
        echo 0
    fi
}

# Function to center text and draw a box around it
center_text() {
    text="$1"
    # Get terminal width (number of columns)
    terminal_width=$(tput cols)
    text_length=${#text}
    padding=$(( (terminal_width - text_length) / 2 ))

    # Print top border
    printf "%${terminal_width}s\n" "" | tr " " "="
    # Print centered text with padding
    printf "%${padding}s%s\n" "" "$text"
    # Print bottom border
    printf "%${terminal_width}s\n" "" | tr " " "="
}

# Function to display today's workout inside a box
show() {
    index=$(get_index)
    clear  # Optional: clears the terminal screen
    # Box around the workout with centered text
    center_text "${workoutList[index]}"
    echo ""
    echo -e "${YELLOW}Stay focused, and give it your best!${RESET}"
    echo $index > .index  # Save the index back to the file
    echo ""
}

# Function to update the workout and move to the next one
did() {
    index=$(get_index)
    index=$(( (index + 1) % ${#workoutList[@]} ))  # Wrap around the index if it exceeds the array size
    echo $index > .index  # Save the new index back to the file
    clear  # Optional: clears the terminal screen

    # Output updated status inside a box
    center_text "Great job on completing today's workout!"
    echo ""
    echo -e "${YELLOW}Tomorrow's workout is:${RESET} ${workoutList[index]}"
    echo -e "${GREEN}Keep it up!${RESET}"
    echo ""
}

function reset() {
    echo 0 > .index
    echo -e "${BLUE}Workout index has been reset form Day 1.${RESET}"
}

# Main command-line logic to handle input arguments
case "$1" in
    show)
        show
        ;;
    did)
        did
        ;;
    reset)
        reset
        ;;
    *)
        echo -e "${RED}Usage: $0 {show|did}${RESET}"
        exit 1
        ;;
esac
