#!/usr/bin/env bash

# for i in 1 2 3; do echo $i; done
# for i in `seq 1 3`; do echo $i; done
# for i in $(seq 1 3); do echo $i; done
# for i in {1..3}; do echo $i; done

lt=(1 2 3)

echo $lt
echo ${lt}
echo ''

echo ${lt[0]}
echo ${lt[1]}
echo ${lt[2]}
echo ${lt[3]}
echo ''

echo ${lt[*]}
echo ${lt[@]}
echo ''

for i in "${lt[*]}"; do echo $i; done
for i in "${lt[@]}"; do echo $i; done
echo ''

lt=(a b c)
for i in "${lt[*]}"; do echo $i; done
for i in "${lt[@]}"; do echo $i; done
echo ''
