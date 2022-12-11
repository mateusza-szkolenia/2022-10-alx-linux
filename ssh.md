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

