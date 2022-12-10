#!/bin/bash

suma=0
poprawic=0

for plik in *.sh
do
	echo -n "Plik: $plik "

	n=$(wc -l < "$plik")

	suma=$(( suma + n ))

	echo -n "liczba linii: $n "

	n2=$(cat "$plik" | grep -v '^$' | wc -l)

	echo -n "(niepustych: $n2) "

	if test -x "$plik"
	then
		echo "prawa dostępu: OK"
	else
		echo "prawa dostępu: poprawić"
		poprawic=$((poprawic + 1))
	fi

	if grep -q "TODO" "$plik"
	then
		echo "TODO: tak"
	else
		echo "TODO: brak"
	fi

	if grep -q "FIXME" "$plik"
	then
		echo "FIXME: tak"
	else
		echo "FIXME: brak"
	fi

done

echo "Razem linii: $suma, do poprawienia chmod: $poprawic"

