#!/bin/bash

read -p 'wiek: ' wiek

if [ "$wiek" -ge 7 ] && [ "$wiek" -lt 18 ]
then
	echo "Objęty obowiązkiem szkolnym"
else
	echo "NIE"
fi

