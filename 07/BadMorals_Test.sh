#!/bin/bash
#
# This script is reading input1 from the input1_variations.txt file, 
# generates a `test_input.txt` file which serves as standard input to
# BadMorals.exe.
#
# Only the "Congratulations" are displayed along with the correspinding inputs

input2="htroFdnAkcaB"
input3="nOMNSaSFjC["

while read -r input1; do 
    echo "$input1" > test_input.txt
    echo "$input2" >> test_input.txt
    echo "$input3" >> test_input.txt

    ./BadMorals.exe < test_input.txt | grep Congrat && cat test_input.txt
done <input1_variations.txt
