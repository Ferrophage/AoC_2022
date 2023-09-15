#!/bin/bash
#total score
ts=0
while IFS= read -r line || [[ -n "$line" ]]; do
#	echo "$line"
	line=$( echo "$line" | tr 'ABCXYZ' '123012' )
	#their action
	ta="$((${line:0:1}))"
	#my action
	ma="$((${line: -1}-1))"
	#my sign
	ms="$(( ($ta+$ma) % 3 ))"
	if [ $ms -eq 0 ]; then
		ms=3
	fi
	#this round
	tr=3
	if [[ $ma -eq -1 ]];
		then
		tr=0
	elif [[ $ma -eq 1 ]];
		then
		tr=6
	fi
	tr="$(($tr+$ms))"
	ts=$(echo "$ts+$tr" | bc )
#	echo "ta:$ta ma:$ma ms:$ms tr:$tr ts:$ts"
done < ../input.txt
echo "$ts"
