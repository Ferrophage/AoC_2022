#!/bin/bash
#total score
ts=0
while IFS= read -r line || [[ -n "$line" ]]; do
#	echo "$line"
	line=$( echo "$line" | tr 'ABCXYZ' '123123' )
	ta="$((${line:0:1}))"
	ma="$((${line: -1}))"
	#this round
	tr=3
	if [[ $(echo "$ta>$ma && ( $ta!=3 || $ma!=1 )" | bc ) -eq 1 || $(echo "$ta==1 && $ma==3" | bc) -eq 1 ]];
		then
		tr=0
	elif [[ $ta -lt $ma || $(echo "$ta==3 && $ma==1" | bc) -eq 1 ]];
		then
		tr=6
	fi
	tr="$(($tr+$ma))"
	ts=$(echo "$ts+$tr" | bc )
#	echo "$ta $ma : $tr"
done < ../input.txt
echo "$ts"
