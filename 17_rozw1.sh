#!/bin/bash

read -p "Podaj nazwę powłoki: " powloka

n=$(grep -c "/$powloka$" /etc/passwd)

echo "Liczba kont: $n"

