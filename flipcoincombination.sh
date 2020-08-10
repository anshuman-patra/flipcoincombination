#!/bin/bash 

coinFlip=$((RANDOM%2))
if [ $coinFlip -eq 0 ]
then
	echo "Heads"
else
	echo "Tails"
fi
declare -A coinDictionary
coinDictionary[H]=0
coinDictionary[T]=0

coinDictionary[HH]=0
coinDictionary[HT]=0
coinDictionary[TH]=0
coinDictionary[TT]=0
coinDictionary[HHH]=0
coinDictionary[HHT]=0
coinDictionary[HTH]=0
coinDictionary[THH]=0
coinDictionary[HTT]=0
coinDictionary[THT]=0
coinDictionary[TTH]=0
coinDictionary[TTT]=0

for (( i=0 ; i<30 ; i++ ))
do
	coinFlip=$((RANDOM%14))
case $coinFlip in
		0)
			((coinDictionary[HHH]++))
			;;
1)
			((coinDictionary[HHT]++))
			;;
3)
			((coinDictionary[THH]++))
			;;
2)
			((coinDictionary[HTH]++))
			;;
4)
			((coinDictionary[HTT]++))
			;;
5)
			((coinDictionary[THT]++))
			;;
6)
			((coinDictionary[TTH]++))
			;;
7)
			((coinDictionary[TTT]++))
			;;
8)
			((coinDictionary[HH]++))
			;;
9)
			((coinDictionary[HT]++))
			;;
10)
			((coinDictionary[TH]++))
			;;
11)
			((coinDictionary[TT]++))
			;;
12)
			((coinDictionary[H]++))
			;;	
13)
			((coinDictionary[T]++))
			;;

esac
done

i=0
for value in `echo ${coinDictionary[@]}`
do
	valueArray[$i]=$value
	((i++))
done
i=0
for key in `echo ${!coinDictionary[@]}`
do
	keyArray[$i]=$key
	((i++))
done
max=0
maxCounter=0
for (( counter=0 ; counter<14 ; counter++ ))
do
	if [ ${valueArray[$counter]} -gt $max ]
	then
		max=${valueArray[counter]}
		maxCounter=$counter
	fi
done
echo "The winning combination is ${keyArray[$maxCounter]} and it occured ${valueArray[$maxCounter]} times."
echo "Heads has occured for " `awk "BEGIN{print ${coinDictionary[H]}/30*100}"` "%"
echo "Tails has occured for " `awk "BEGIN{print ${coinDictionary[T]}/30*100}"` "%"
echo "Heads Heads has occured for " `awk "BEGIN{print ${coinDictionary[HH]}/30*100}"` "%"
echo "Heads Tails has occured for " `awk "BEGIN{print ${coinDictionary[HT]}/30*100}"` "%"
echo "Tails Heads has occured for " `awk "BEGIN{print ${coinDictionary[TH]}/30*100}"` "%"
echo "Tails Tails has occured for " `awk "BEGIN{print ${coinDictionary[TT]}/30*100}"` "%"
echo "Heads Heads Heads has occured for " `awk "BEGIN{print ${coinDictionary[HHH]}/30*100}"` "%"
echo "Heads Heads Tails has occured for " `awk "BEGIN{print ${coinDictionary[HHT]}/30*100}"` "%"
echo "Heads Tails Heads has occured for " `awk "BEGIN{print ${coinDictionary[HTH]}/30*100}"` "%"
echo "Tails Heads Heads has occured for " `awk "BEGIN{print ${coinDictionary[THH]}/30*100}"` "%"
echo "Heads Tails Tails has occured for " `awk "BEGIN{print ${coinDictionary[HTT]}/30*100}"` "%"
echo "Tails Heads Tails has occured for " `awk "BEGIN{print ${coinDictionary[THT]}/30*100}"` "%"
echo "Tails Tails Heads has occured for " `awk "BEGIN{print ${coinDictionary[TTH]}/30*100}"` "%"
echo "Tails Tails Tails has occured for " `awk "BEGIN{print ${coinDictionary[TTT]}/30*100}"` "%"
echo "The winning combination is ${keyArray[$maxCounter]} and it occured" `awk "BEGIN{print ${valueArray[$maxCounter]}*100/30}"` "%"





