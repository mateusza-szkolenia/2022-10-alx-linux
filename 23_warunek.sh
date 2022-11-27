#!/bin/bash

# uzytkownik="$1"

read -p "podaj nazwe konta: " uzytkownik

if id "$uzytkownik" > /dev/null 2>&1
then
	echo "Konto istnieje"
else
	echo "Konto nie istnieje."
	# czy chcesz je założyć?
	# read czy
	# if ...
fi

