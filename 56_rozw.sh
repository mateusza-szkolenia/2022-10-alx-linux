#!/bin/bash

for plik in *.sh
do
	echo -n "Plik: $plik "

	n=$(wc -l < "$plik")

	echo -n "liczba linii: $n "

	n2=$(cat "$plik" | grep -v '^$' | wc -l)

	echo -n "(niepustych: $n2) "

	if test -x "$plik"
	then
		echo "prawa dostępu: OK"
	else
		echo "prawa dostępu: poprawić"
	fi

done
