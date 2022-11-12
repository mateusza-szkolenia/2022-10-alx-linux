# konfiguracja screena

Wrzucić do pliku `/etc/screenrc` lub lokalnie `.screenrc` (na koncie użytkownika)

```
startup_message off
hardstatus off
caption always '%{gk}[ %{G}%H %{g}][%= %{wk}%?%-Lw%?%{=b kR}(%{W}%n*%t%?(%u)%?%{=b kR})%{= kw}%?%+Lw%?%?%= %{g}][%{Y}%l%{g}]%{=b C}[%c:%s]%{W}'
```

