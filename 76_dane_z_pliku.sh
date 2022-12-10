#!/bin/bash

while read imie nazwisko grupa
do
	# przeskocz puste linie
	[ -z "$imie" ] && continue

	# przeskocz linie zaczynające się od #
	[ "${imie:0:1}" == "#" ] && continue

	echo "Uczestnik: ($imie $nazwisko) -- ($grupa)"

	# tu mozemy stworzyć konta, itp

done < uczestnicy.txt
