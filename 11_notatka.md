# exportowanie

Przypisujemy zmienną i uruchamiamy proces potomny - zmienna nie jest dostępna.

```command
$ imie=Mateusz
$ bash
$ echo "imię to: $imie"
imię to
```

Jeżeli wyeksportujemy, to zmienna będzie widoczna

```command
$ imie=Mateusz
$ export imie
$ bash
$ echo "imię to: $imie"
imię to Mateusz
```

