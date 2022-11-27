#!/bin/bash

read -p 'Podaj imię: ' imie

if test "$imie" == "Mateusz"
then
	echo "Witaj, mistrzu"
elif test -z "$imie"
then
	echo "Witaj, nieznajomy"
else
	echo "Witaj, $imie"
fi

