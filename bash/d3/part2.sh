#!/bin/bash
sum=0
declare -a chartable
for letter in {a..z}
do
	chartable+=("$letter")
done
for letter in {A..Z}
do
	chartable+=("$letter")
done
#echo "${chartable[2]}"
declare -A valhash
value=1
for letter in "${chartable[@]}"
do
	valhash[$letter]="$value"
	value=$((value+1))
done
#printf "%s\n" "${valhash[@]}"
while IFS= read -r line || [[ -n "$line" ]]; do
	lnlgth=${#line}
	hlflgth="$(($lnlgth/2))"
	cpt1="${line:0:$hlflgth}"
	cpt2="${line:$hlflgth:$hlflgth}"
#	echo "$cpt1 $cpt2"
	thischar=""
	for (( i=0; i<"$hlflgth"; i++ ));
	do
		thischar="${cpt1:$i:1}"
#		echo "thischar: $thischar"
		if [[ "$cpt2" == *"$thischar"* ]]; then
			break 1
		fi
	done
	charval="${valhash[$thischar]}"
#	echo "end loop. char: $thischar charval: $charval"
	sum="$(( $sum+$charval ))"
done < input.txt
echo "$sum"
