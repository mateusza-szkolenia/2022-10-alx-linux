#!/bin/bash

read -p "Podaj nazwę powłoki: " powloka

n=$(cat /etc/passwd | grep "/$powloka$" | wc -l)

echo "Liczba kont: $n"

