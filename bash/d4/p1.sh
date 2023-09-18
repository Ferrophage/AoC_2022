#!/bin/bash
ttl=0
#read file into very large array, each element is a whole line
readarray fullArr < input.txt
#iterate over each element, split into four data points
IFS="-,"
for line in "${fullArr[@]}"; do
	read -ra tempArr <<< $line
	if [[ ("${tempArr[0]}" -le "${tempArr[2]}" && "${tempArr[1]}" -ge "${tempArr[3]}") || ("${tempArr[0]}" -ge "${tempArr[2]}" && "${tempArr[1]}" -le "${tempArr[3]}") ]]
		then
		ttl=$(($ttl+1))
	fi
done
echo $ttl
