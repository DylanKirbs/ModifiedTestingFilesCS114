#!/bin/bash

# Arg 1: TestScript
# Arg 2: Output File
# Arg 3: Category
# Arg 4: Test number
# Eg. ./runtests.sh testone.sh output.txt 1 1
# Eg. ./runtests.sh testall output.txt

echo "Running Modified test script by Dylan Kirby"
echo "Executing: $1 with the following parameters: [$3 $4]"
./$1 $3 $4 > $2
echo "Test script complete"
echo "Output can be found in: $2"
