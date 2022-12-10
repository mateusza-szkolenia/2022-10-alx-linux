#!/bin/bash

srv=10.0.14.48

while true
do
	if ping -c 1 "$srv" > /dev/null 2>&1
	then
		echo OK
	else
		echo "Błąd serwera $srv" | mail m.adamowski@alx.pl
		exit
	fi
	sleep 1
done
