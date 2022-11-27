#!/bin/bash

echo "Liczba param: $#"
echo "Wszystkie parametry: $*"
echo "Każdy parametr     : $@"

# przykładowe wywołanie:
# ./skrypt "ala ma kota" "xxx yyy zzz"

#grep bash $*
#
# grep bash ala ma kota xxx yyy zzz
# 6 parametrów:
# "ala"
# "ma"
# "kota"
# "xxx"
# "yyy"
# "zzz"

#grep bash "$*"
#
# grep bash "ala ma kota xxx yyy zzz"
# 1 parametr:
# "ala ma kota xxx yyy zzz"

#grep bash $@
#
# grep bash ala ma kota xxx yyy zzz
# 6 parametrów, j.w.

grep bash "$@"
#
# grep bash "ala ma kota" "xxx yyy zzz"
# 2 parametry - prawidłowo
# "ala ma kota"
# "xxx yyy zzz"

