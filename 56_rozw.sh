#!/bin/bash

for plik in *.sh
do
	echo -n "Plik: $plik "

	if test -x "$plik"
	then
		echo "prawa dostępu: OK"
	else
		echo "prawa dostępu: poprawić"
	fi

done
