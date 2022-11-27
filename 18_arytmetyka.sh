#!/bin/bash

a=100
b=200

# zadziała, ale tak się nie robi:
echo "Suma: $(( $a + $b ))"

# poprawny zapis
echo "Suma: $(( a + b ))"

# Przykład, dalczego pierwszy zapis jest błędny:

#
echo "Suma: $(( $a + $b + $c ))"
# (( 100 + 200 + )) # SYNTAX ERROR


# poprawny zapis
echo "Suma: $(( a + b + c ))"
# (( 100 + 200 + 0 ))


