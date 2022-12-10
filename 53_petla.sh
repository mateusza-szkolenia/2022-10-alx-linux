#!/bin/bash

for plik in *.mp3
do
	if [ -e "$plik" ]
	then
		# FIXME
		echo "Plik: $plik"
		wc -l < "$plik"\
		# TODO: zmienić na użycie continue
	fi
done
