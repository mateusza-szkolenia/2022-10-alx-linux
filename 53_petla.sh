#!/bin/bash

for plik in *.mp3
do
	if [ -e "$plik" ]
	then
		echo "Plik: $plik"
		wc -l < "$plik"
	fi
done
