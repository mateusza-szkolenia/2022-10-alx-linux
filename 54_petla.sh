#!/bin/bash

echo "Użycie seq"
for n in $(seq 5 15)
do
	echo "Liczba: $n"
done


echo "Klamerki {5..15}"
for n in {5..15}
do
	echo "Liczba: $n"
done


echo "Składnia C"
for ((n=5; n<=15; n++))
do
	echo "Liczba: $n"
done

