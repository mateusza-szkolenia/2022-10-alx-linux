#!/bin/bash

for plik in *.mp3 *.exe *.md
do
	[ -e "$plik" ] || continue

	echo "Plik: $plik"
	wc -l < "$plik"
done
