#!/bin/bash

lista='mikolajki.txt'


lista_los='mikolajki.txt.shuf'
lista_par='mikolajki.txt.pary'

shuf "$lista" > "$lista_los"

paste "$lista" "$lista_los" > "$lista_par"

echo "Wylosowane pary:"
cat "$lista_par"


