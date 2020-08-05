#!/bin/bash 

coinFlip=$((RANDOM%2))
if [ $coinFlip -eq 0 ]
then
	echo "Heads"
else
	echo "Tails"
fi
declare -A coinDictionary
#coinDictionary[Heads]=0
#coinDictionary[Tails]=0

coinDictionary[HH]=0
coinDictionary[HT]=0
coinDictionary[TH]=0
coinDictionary[TT]=0

for (( i=0 ; i<10 ; i++ ))
do
	coinFlip=$((RANDOM%2))

coinFlip2=$((RANDOM%2))
	case $coinFlip$coinFlip2 in
		00)
			((coinDictionary[HH]++))
			;;
		01)
			((coinDictionary[HT]++))
			;;
		10)
			((coinDictionary[TH]++))
			;;
		11)
			((coinDictionary[TT]++))
			;;
	esac
done


echo "Percentage of two consecutive heads is $((${coinDictionary[HH]}*100/10))%"
echo "Percentage of heads tails is $((${coinDictionary[HT]}*100/10))%"
echo "Percentage of tails heads is $((${coinDictionary[TH]}*100/10))%"
echo "Percentage of two consecutive tails is $((${coinDictionary[TT]}*100/10))%"
