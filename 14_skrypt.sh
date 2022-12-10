#!/bin/bash

# source 14_konfiguracja
. 14_konfiguracja

# gdyby plik był w innym katalogu
# source /etc/alx/konfiguracja
#
# gdyby plik był w katalogu domowym
# source ~/.automatyzator/konfiguracja

# shellcheck disable=SC2154
echo "imie to: $imie"
# shellcheck disable=SC2154
echo "firma to: $firma"
# shellcheck disable=SC2154
echo "dzisiaj jest: $dzisiaj"
# shellcheck disable=SC2154
echo "pracuję na koncie: $konto"

