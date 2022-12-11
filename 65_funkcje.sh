#!/bin/bash

# zmienne są domyślnie globalne

powitanie () {
	local koniec
	echo "Witaj"
	echo "Jest dzisiaj $(date +%F) i $pogoda"
	koniec=tak
}


koniec=nie
pogoda='pada śnieg'

powitanie
powitanie
powitanie

echo "czy koniec? $koniec"

