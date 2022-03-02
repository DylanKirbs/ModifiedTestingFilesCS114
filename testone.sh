#!/bin/bash

# Change your program name here
JAVA_PROGRAM_NAME="SU00000000"

echo "Running custom tester"
echo "Compiling program"
javac "${JAVA_PROGRAM_NAME}.java"

report_category_number () {
    echo ""
    echo "========================================================================"
    echo "Test category $1"
    echo "========================================================================"
}

execute_test () {
    echo "Arguments:"; echo -n "  "
    cat files/$1_$2_params.txt
    echo "Moves:"; echo -n "  "
    cat files/$1_$2_moves.txt
    echo "Comparison:"
    cat files/$1_$2_params.txt | java $JAVA_PROGRAM_NAME `xargs` < files/$1_$2_moves.txt | diff --strip-trailing-cr -s - files/$1_$2_out.txt
}

echo "Category $1, case $2"
execute_test $1 $2
