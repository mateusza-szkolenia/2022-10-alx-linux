# Mikołajki

Napisać skrypt służący do przeprowadzenia losowania mikołajkowego.

Skrypt przyjmuje jako parametr nazwę pliku tekstowego zawierającego listę adresów email, np.

```
ala@example.com
basia@example.com
czesia@example.com
```

Przykład uruchomienia skryptu:
```command
$ ./mikolajki.sh klasa.txt
Losowanie...
Wysyłam maile:
- ala@example.com
...
```

Skrypt losuje kto komu kupuje prezent i wysyła maila (lub zapisuje do pliku tekstowego) informację o tym:

Przykład wysyłania maili:

```shell
$ echo "Wylosowana osoba: $osoba1" | mail -s "losowanie mikołajkowe" "$osoba2"

# lub jeśli nie mamy działającej poczty:

$ echo "Wylosowana osoba: $osoba1" | tee "/tmp/losowanie/$osoba2.txt"
```

Do losowania kolejności można użyć programu `shuf` lub `sort` (z odp. parametrami).

Uwaga:
- każdy musi być wylosowany dokładnie raz
- nikt nie może wylosować samego siebie

Dodatkowe podpowiedzi i przydatne narzędzia:
- `mktemp` (użycie: `mktemp /tmp/cokolwiek.XXXXXXXXXX`)
- `paste`

