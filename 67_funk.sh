#!/bin/bash

function czy_ocena () {
	local ocena=$1

	# ostatnia instrukcja w kodzie funkcji jest też kodem wyjścia	
	[ "$ocena" -ge 1 ] && [ "$ocena" -le 6 ]
}

read -p "Podaj ocenę: " xxx

if czy_ocena "$xxx"
then
	echo "Prawidłowa"
else
	echo "To nie jest ocena w polskim systemie oświaty"
fi

