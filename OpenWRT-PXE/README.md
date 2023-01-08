# OpenWRT

## Mój router

```
system type		: Atheros AR9330 rev 1
machine			: TP-LINK TL-WR710N v1
```

## Pliki konf

Plik `/etc/config/dhcp`

```
config dnsmasq
        option enable_tftp '1'
        option tftp_root '/srv/tftp'
        option dhcp_boot 'pxelinux.0'
```

Plik `/etc/config/fstab`

```
config mount
	option target '/srv'
	option enabled '1'
	option enabled_fsck '0i'
	option uuid 'xxxxxxxxxxxxxxxxxxxxxx'
```
