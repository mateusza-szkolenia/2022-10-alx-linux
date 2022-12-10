#!/bin/bash

for plik in raport-{2000..2022}-{wiosna,lato,jesien,zima}.pdf
do
	echo "Plik: $plik"
	test -e "$plik" && echo "Istnieje" || echo "nie istnieje"
done

