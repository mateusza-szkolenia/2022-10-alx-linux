#!/bin/bash

suma=0
poprawic=0

for plik in *.sh
do
	n=$(wc -l < "$plik")

	(( suma += n ))

	n2=$(grep -c -v '^$' < "$plik")

	[ -x "$plik" ] && prawa=OK || prawa=poprawic

	[ "$prawa" == "poprawic" ] && (( poprawic++ ))

	grep -q "TODO" "$plik" && todo=tak || todo=brak

	grep -q "FIXME" "$plik" && fixme=tak || fixme=brak

	echo "$plik: linii kodu: $n (niepustych: $n2), prawa dostępu: $prawa, TODO: $todo, FIXME: $fixme"

done

echo "Razem linii: $suma, do poprawienia chmod: $poprawic"

