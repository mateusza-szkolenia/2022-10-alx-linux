#!/bin/bash

read -p 'Podaj imię: ' imie

# uwaga na spacje!
if [ "$imie" == "Mateusz" ]
# ^ ^       ^  ^         ^

then
	echo "Witaj, mistrzu"
else
	if test -z "$imie"
	then
		echo "Witaj, nieznajomy"
	else
		echo "Witaj, $imie"
	fi
fi


