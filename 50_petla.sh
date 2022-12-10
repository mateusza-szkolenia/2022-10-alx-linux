#!/bin/bash

for imie in Asia Basia Czesia Dorota Ewa Frania
do
	echo "Dzień dobry $imie"
	echo "Jak się czujesz?"
	touch /tmp/$imie.txt
done

