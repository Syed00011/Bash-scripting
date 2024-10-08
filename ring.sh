#!/bin/bash

# Armor selection
echo "Select your armor class:
1 - Ninja (power = 10)
2 - Red Ranger (power = 15)
3 - Yellow Ranger (power = 12)"

read class

case $class in
    1)
        type="ninja"
        power="10"
        ;;
    2)
        type="red ranger"
        power="15"
        ;;
    3)
        type="yellow ranger"
        power="12"
        ;;
    *)
        echo "Invalid selection, exiting..."
        exit 1
        ;;
esac

echo "You have selected $type with power $power!"
echo "Be ready to play!"

# Difficulty selection
echo "Select the difficulty level:
1 - Easy
2 - Medium
3 - Hard"

read difficulty

# Difficulty-based level skipping
if [[ $difficulty == 1 ]]; then
    echo "You selected Easy mode!"
    goto_level_2=false
    goto_level_3=false
elif [[ $difficulty == 2 ]]; then
    echo "You selected Medium mode, skipping Level 1!"
    goto_level_2=true
    goto_level_3=false
elif [[ $difficulty == 3 ]]; then
    echo "You selected Hard mode, skipping straight to Level 3!"
    goto_level_2=false
    goto_level_3=true
else
    echo "Invalid difficulty selection, exiting..."
    exit 1
fi

# Level 1: Only played if Easy is selected
if [[ $goto_level_2 == false && $goto_level_3 == false ]]; then
    echo "Level 1: Enter your number (between 0 and 1)"
    read number
    random=$(($RANDOM % 2))

    if [[ $number == $random ]]; then
        echo "You are safe!"
    else
        echo "You died!"
        exit
    fi

    echo "The random number was: $random"
    echo "Get ready for the next battle!"
    sleep 2
fi

# Level 2: Played in Medium and Hard modes
if [[ $goto_level_3 == false ]]; then
    echo "Level 2: Enter a number between 0-2"
    read number
    random=$(($RANDOM % 3))

    if [[ $number == $random ]]; then
        echo "Good! You won level 2! Now enter the next number."
        read name
        nano=$(($RANDOM % 5))
        
        if [[ $nano != $name ]]; then
            echo "You won! Be ready for level 3!"
        else
            echo "Better luck next time! The correct number was $nano."
            exit
        fi
    else
        echo "You lost! The correct number was $random."
        exit
    fi
fi

# Level 3: Played in Hard mode and after completing Level 2
echo "Level 3: Select a number between 0-10"
read mimi
bibi=$(($RANDOM % 11))

if [[ $mimi != $bibi ]]; then
    echo "You are so lucky today!"
else
    echo "Goodbye! The correct number was $bibi."
    exit
fi
