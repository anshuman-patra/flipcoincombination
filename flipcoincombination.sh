#!/bin/bash 

coinFlip=$((RANDOM%2))
if [ $coinFlip -eq 0 ]
then
	echo "Heads"
else
	echo "Tails"
fi
declare -A coinDictionary
coinDictionary[Heads]=0
coinDictionary[Tails]=0

for (( i=0 ; i<10 ; i++ ))
do
	coinFlip=$((RANDOM%2))
	if [ $coinFlip -eq 0 ]
	then
		((coinDictionary[Heads]++))
	else
		((coinDictionary[Tails]++))
	fi
done
echo "Percentage of heads is $((${coinDictionary[Heads]}*100/10))%"
echo "Percentage of tails is $((${coinDictionary[Tails]}*100/10))%"
