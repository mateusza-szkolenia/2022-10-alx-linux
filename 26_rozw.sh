#!/bin/bash

#pelnoletni=18

read -p 'podaj rok ur: ' rokur

biez=$(date +%Y)

(( wiek = biez - rokur ))

if test "$wiek" -lt 0
then
	echo "Co jest? Jeszcze się nie urodziłeś"
	exit 1
fi

if test "$wiek" -lt 18
then
	echo "Jesteś niepełnoletni"
	(( ilebrak = 18 - wiek ))
	(( kiedy18 = biez + ilebrak ))
	echo "Brakuje $ilebrak lat, osiemnastka w roku $kiedy18"
else
	echo "Jesteś pełnoletni"
fi

