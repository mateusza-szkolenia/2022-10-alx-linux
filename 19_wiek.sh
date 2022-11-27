#!/bin/bash

read -p 'Podaj rok urodzenia: ' uro

biez=$(date +%Y)

wiek=$((biez - uro))

echo "Twój wiek: $wiek"
