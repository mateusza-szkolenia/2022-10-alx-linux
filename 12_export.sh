#!/bin/bash

echo "Używam poprzedniego skryptu nr 4"

./04_zmienne

echo "Eksportuję zmienną firma i uruchamiam ponownie"

firma=ALX
export firma

./04_zmienne
