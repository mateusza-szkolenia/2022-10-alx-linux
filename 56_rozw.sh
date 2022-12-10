#!/bin/bash

suma=0
poprawic=0

for plik in *.sh
do
	n=$(wc -l < "$plik")

	suma=$(( suma + n ))

	n2=$(cat "$plik" | grep -v '^$' | wc -l)

	if test -x "$plik"
	then
		prawa=OK
	else
		prawa=poprawic
		poprawic=$((poprawic + 1))
	fi

	if grep -q "TODO" "$plik"
	then
		todo=tak
	else
		todo=brak
	fi

	if grep -q "FIXME" "$plik"
	then
		fixme=tak
	else
		fixme=brak
	fi

	echo "$plik: linii kodu: $n (niepustych: $n2), prawa dostępu: $prawa, TODO: $todo, FIXME: $fixme"

done

echo "Razem linii: $suma, do poprawienia chmod: $poprawic"

