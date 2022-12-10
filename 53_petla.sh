#!/bin/bash

for plik in *.md
do
	echo "Plik: $plik"
	wc -l < "$plik"
done
