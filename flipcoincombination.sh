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

#coinDictionary[HH]=0
#coinDictionary[HT]=0
#coinDictionary[TH]=0
#coinDictionary[TT]=0
coinDictionary[HHH]=0
coinDictionary[HHT]=0
coinDictionary[HTH]=0
coinDictionary[THH]=0
coinDictionary[HTT]=0
coinDictionary[THT]=0
coinDictionary[TTH]=0
coinDictionary[TTT]=0

for (( i=0 ; i<20 ; i++ ))
do
	coinFlip=$((RANDOM%2))

coinFlip2=$((RANDOM%2))
coinFlip3=$((RANDOM%2))
	case $coinFlip$coinFlip2$coinFlip3 in		
000)
			((coinDictionary[HHH]++))
			;;
		001)
			((coinDictionary[HHT]++))
			;;
		010)
			((coinDictionary[HTH]++))
			;;
100)
			((coinDictionary[THH]++))
			;;
		011)
			((coinDictionary[HTT]++))
			;;
		101)
			((coinDictionary[THT]++))
			;;
		110)
			((coinDictionary[TTH]++))
			;;
		111)
			((coinDictionary[TTT]++))
			;;
	esac
done


echo "Percentage of HHH is $((${coinDictionary[HHH]}*100/20))%"
echo "Percentage of HHT is $((${coinDictionary[HHT]}*100/20))%"
echo "Percentage of HTH is $((${coinDictionary[HTH]}*100/20))%"
echo "Percentage of THH is $((${coinDictionary[THH]}*100/20))%"
echo "Percentage of HTT is $((${coinDictionary[HTT]}*100/20))%"
echo "Percentage of THT is $((${coinDictionary[THT]}*100/20))%"
echo "Percentage of TTH is $((${coinDictionary[TTH]}*100/20))%"
echo "Percentage of TTT is $((${coinDictionary[TTT]}*100/20))%"
