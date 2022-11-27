#!/bin/bash

powloka="$1"

n=$(grep -c "/$powloka$" /etc/passwd)

echo "Liczba kont: $n"

