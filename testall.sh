#!/bin/bash

# Change your program name here
JAVA_PROGRAM_NAME="SU00000000"

echo "Running custom tester"
echo "Compiling program"
javac "${JAVA_PROGRAM_NAME}.java"


echo ""
echo "CS113/114 Testing Script"



report_category_number () {
    echo ""
    echo "========================================================================"
    echo "Test category $1"
    echo "========================================================================"
}

execute_test () {
    echo "Test #$2"
    cat files/$1_$2_params.txt | java $JAVA_PROGRAM_NAME `xargs` < files/$1_$2_moves.txt | diff --strip-trailing-cr -s - files/$1_$2_out.txt
}

# Category 1, 2
for category in {1..2}
do
    report_category_number $category
    for number in {1..10}
    do
        execute_test $category $number
    done
done

# Category 3, 4
for category in {3..5}
do
    report_category_number $category
    for number in {1..5}
    do
        execute_test $category $number
    done
done
