#!/bin/bash

touch start.txt

echo "Aby przerwać pętlę, usuń plik start.txt (w innym terminalu)"

echo "Lub przerwij przez CTRL-C"

while [ -e start.txt ]
do
	date
	sleep 1
done

