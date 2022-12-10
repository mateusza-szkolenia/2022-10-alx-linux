#!/bin/bash

[ -e stop.txt ] && rm stop.txt

echo "Aby przerwać pętlę, utwórz plik stop.txt (w innym terminalu)"

echo "Lub przerwij przez CTRL-C"

while ! [ -e stop.txt ]
do
	date
	sleep 1
done

