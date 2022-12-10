#!/bin/bash

napis="ABCDEFGHIJKLMNOP"

echo "fragment od 5 znaku: ${napis:5}"
echo "fragment od 6 znaku o długości 3: ${napis:6:3}"

for plik in raport.pdf raport.docx cokolwiek.txt temp-raport2.pdf
do
	echo "$plik: ${plik%.pdf}"
	echo "$plik: ${plik#temp-}"
	echo "$plik: ${plik/raport/report}"
	echo

done
