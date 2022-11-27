# Zadanie

Napisać program, który zapyta użytkownika o imię.
* Jeśli będzie to nasze (każdy swoje) to ma napisać "Witaj mistrzu".
* Jeśli jest to inne imie, to ma napisać "Witaj *IMIĘ*".
* Jeśli nie podano imienia, ma napisać "Witaj nieznajomy"

Ściągawka:

```command
[2022-10-alx-linux] $ test "$imie" == "Mateusz"
[2022-10-alx-linux] $ echo $?
0
[2022-10-alx-linux] $ test "$imie" == "Mat"
[2022-10-alx-linux] $ echo $?
1
[2022-10-alx-linux] $ test -z "$qwe"
[2022-10-alx-linux] $ echo $?
0
[2022-10-alx-linux] $ test -z "$imie"
[2022-10-alx-linux] $ echo $?
```
