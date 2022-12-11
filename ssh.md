# Konfiguracja SSH

```
Host *.mojafirma.pl
	User root

Host rocky9
	ForwardAgent yes
	#User root
	HostName 10.0.114.29

Host jakis.moj.serwer.com
	ForwardAgent yes

Host DebianALX
	HostName 10.0.114.100
	ProxyJump rocky9
```


## Forwardowanie portów

### Case 1

Na serwerze `rocky9` działa usługa na porcie `5656` i chcemy mieć do niej dostęp lokalnie na porcie `5600`:

```command
$ ssh -L 5600:localhost:5656 rocky9
```

### Case 2 

Lokalnie działa usługa na porcie 3434 i chcemy mieć do niej dostęp z poziomu serwera `rocky9`, na porcie 3400:

```command
$ ssh -R 3400:localhost:3434 rocky9
```

### Case 3

Zdalny serwer `rocky9` ma dostęp do zasobu na porcie `1234` na serwerze `xyz.example.com` i chcemy mieć dostęp do tego zasobu lokalnie na porcie 9999:

```command
$ ssh -L 9999:xyz.example.com:1234 rocky9
```

