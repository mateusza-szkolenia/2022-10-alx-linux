#!/bin/bash

while true
do
	read -p "Polecenie: " cmd

	if [ "$cmd" == "hej" ]
	then
		echo "no hej"
		continue
	fi

	if [ "$cmd" == "koniec" ]
	then
		echo "Do widzenia"
		exit
		continue
	fi

	echo "nie rozumiem: $cmd"

done
