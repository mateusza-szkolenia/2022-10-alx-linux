#!/bin/bash

function powitanie () {
	local imie="$1"

	echo "Witaj $imie"
	echo "Co słychać?"
}

echo "Parametry: [$1] [$2] [$3] ... (razem $#)"

powitanie Mateusz
powitanie Magda
powitanie "$1"
powitanie "$*"
powitanie "$@"

