#!/bin/bash

imie=Mateusz

# każdy z tych zapisów daje ten sam efekt

echo "xxx${imie}xxx"
echo "xxx$imie""xxx"
echo xxx"$imie"xxx
echo 'xxx'$imie"xxx"


# Ale ten już nie:

echo 'xxx $imie xxx'

