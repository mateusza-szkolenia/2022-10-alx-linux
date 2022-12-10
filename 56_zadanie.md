# Zadanie

Napisz program, który wyświetli listę plików z rozszerzeniem `.sh`
Przy każdym pliku wyświetli:
- czy plik ma prawa dostępu do uruchomienia
- liczbę linii pliku
- liczbę niepustych linii pliku
- informację, czy w pliku znajduje się słowo TODO albo FIXME

Na koniec, wyświetli:
- sumaryczną liczbę linii
- liczbę plików, wymagających poprawienia praw dostępu

Przykład:

```command
$ ./skrypt
Plik: abc.sh: Liczba linii: 20 (niepustych: 15), prawa dostępu: OK, TODO: tak, FIXME: brak
Plik: abc1.sh: Liczba linii: 250 (niepustych: 125), prawa dostępu: OK, TODO: brak, FIXME: tak
Plik: abc64.sh: Liczba linii: 206 (niepustych: 135), prawa dostępu: poprawić, TODO: brak, FIXME: brak
Plik: abc6.sh: Liczba linii: 206 (niepustych: 135), prawa dostępu: OK, TODO: brak, FIXME: brak

Łącznie: liczba linii: 654, do poprawienia chmod: 1
```
