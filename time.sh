#!/bin/bash

#These are the names of the programs to time.
PROG_NAMES=("rpmulti-a" "rpmulti-f" "rpmulti-c")
#Bash doesn't support multi-dimensional arrays, so this is a linear 2D array. Yes these have to be strings.
TESTS=("2345" "789" "23958233" "5830" "260824" "614280" "2" "2" "525" "252")

for f in ${PROG_NAMES[@]}
do
    printf "\033[92m-=Testing Program: %s=-\033[0m\n" ${f}

    printf "\033[93m-=Recursive Testing=-\033[0m\n"
    for ((i=0; i<${#TESTS[@]}; i+=2))
    do
        timeStart=$(date +%s%N)
        printf "1\n%s\n%s\n" ${TESTS[$i]} ${TESTS[$(($i+1))]} | ./${f} > /dev/null 
        timeEnd=$(date +%s%N)
        timeDiff=$(($timeEnd - $timeStart))

        printf "Test %d took %.3f milliseconds\n" $((${i} / 2 + 1)) $(echo "scale=3; $timeDiff / 1000000" | bc)
    done

    printf "\033[93m-=Non-Recursive Testing=-\033[0m\n"
    for ((i=0; i<${#TESTS[@]}; i+=2))
    do
        timeStart=$(date +%s%N)
        printf "2\n%s\n%s\n" ${TESTS[$i]} ${TESTS[$(($i+1))]} | ./${f} > /dev/null
        timeEnd=$(date +%s%N)
        timeDiff=$(($timeEnd - $timeStart))

        printf "Test %d took %.3f milliseconds\n" $((${i} / 2 + 1)) $(echo "scale=3; $timeDiff / 1000000" | bc)
    done
done

