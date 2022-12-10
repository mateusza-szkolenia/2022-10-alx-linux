## `/etc/sudoers`

```
## Allows people in group wheel to run all commands
%wheel	ALL=(ALL)	ALL

kurs		ALL=(ALL)	ALL
ktos		ALL=(ALL)	sudoedit /etc/banner
mateusza	ALL=(git)	ALL
mati		ALL=(ALL)	ALL
```

## sudo przykład

```command
$ sudo cat /etc/shadow | grep -v '!!\|*' | cut -d : -f 2 | sudo tee /root/hasla-z-shadowa.txt
```
