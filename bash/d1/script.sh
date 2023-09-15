#!/bin/bash
#running total
rt=0
#calorie count
cc=()
while IFS= read -r line || [[ -n "$line" ]]; do
	if [ -z $line ];
		then
		cc+=("$rt")
		rt=0
	else
		rt=$(echo "$rt+$line" | bc )
	fi
done < input.txt
top3=( $(printf "%s\n" ${cc[@]} | sort -rn | head -3 ) )
echo ${top3[@]}
#final total
ft=0
for n in ${top3[@]}; do
	ft=$(echo "$ft+$n" |bc )
done
echo $ft
