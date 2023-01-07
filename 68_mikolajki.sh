#!/bin/bash

lista='mikolajki.txt'


lista_los=$(mktemp /tmp/miko-los.XXXXXXXXXXXX.txt)
lista_par=$(mktemp /tmp/miko-par.XXXXXXXXXXXX.txt)

function sprawdz_pary () {
	while read kto komu
	do
		# echo "Kto: $kto  komu: $komu"
		if [[ "$kto" == "$komu" ]]
		then
			echo "Błąd! Ktoś wylosował samego siebie! Nie może tak być!"
			return 1
		fi
	done < "$lista_par"

	return 0
}

while true
do
	shuf "$lista" > "$lista_los"
	paste "$lista" "$lista_los" > "$lista_par"

	sprawdz_pary && break

	echo "No niestety, losuję ponownie"
done

echo "Wysyłam maile:"
while read kto komu
do
	echo "- $kto"
	# echo "Kupujesz prezent dla: $komu" | mail "$kto"
	echo "Kupujesz prezent dla: $komu" > "/tmp/$kto.txt"
done < "$lista_par"

rm "$lista_par"
rm "$lista_los"

