#!/bin/bash

for n in 4 17 19 60 23 3 78 34 40 123 13 14 15 16 17 99 8
do
	if [ "$n" -gt 50 ]
	then
		continue
	fi

	if [ "$n" -lt 10 ]
	then
		continue
	fi

	echo "Liczba: $n"
	touch "/tmp/$n.txt"
	# ping 10.0.0.$n
	# inne instrukcje
done

