#!/bin/bash

read -p 'wiek: ' wiek

if [ "$wiek" -lt 8 ] || [ "$wiek" -ge 70 ]
then
	echo "Bilet ulgowy"
else
	echo "Bilet normalny"
fi

