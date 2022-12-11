#!/bin/bash

function czy_ocena () {
	local ocena=$1
	
	if [ "$ocena" -ge 1 ] && [ "$ocena" -le 6 ]
	then
		return 0
	else
		return 1
	fi
}

read -p "Podaj ocenę: " xxx

if czy_ocena "$xxx"
then
	echo "Prawidłowa"
else
	echo "To nie jest ocena w polskim systemie oświaty"
fi

