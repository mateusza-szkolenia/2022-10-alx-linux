#!/bin/bash

read -p "Podaj nazwę powłoki: " powloka

echo "p: $powloka"

cat /etc/passwd | grep "/$powloka$"

