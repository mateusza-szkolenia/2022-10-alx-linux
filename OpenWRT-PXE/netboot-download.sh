#!/bin/sh

set -e

distro="$1"
release="$2"

distros="kali ubuntu debian arch almalinux rocky fedora centos centosstream opensuse alpine"

if [ -z "$distro" ]
then
	echo "usage: $0 DISTRO"
	echo " distros:"
	for d in $distros
	do
		echo "  - $d"
	done
	exit 1
fi

echo "Distro: $distro"

if [ "x$distro" == "xALL" ]
then
	for d in $distros
	do
		sh "$0" "$d"
	done
fi

case "$distro" in
kali|ubuntu|debian)
	ARCH="amd64"
	FILE="netboot.tar.gz"
	PXE="$distro-installer"
	IS_DEBIAN="y"
	case "$distro" in
	kali)
		RELEASE=rolling
		TITLE="^Kali Linux ($RELEASE) Installer"
		URL="http://http.kali.org/kali/dists/kali-rolling/main/installer-$ARCH/current/images/netboot/netboot.tar.gz"
		;;
	ubuntu)
		RELEASE=focal
		TITLE="^Ubuntu Linux ($RELEASE) Installer"
		URL="http://archive.ubuntu.com/ubuntu/dists/$RELEASE/main/installer-$ARCH/current/legacy-images/netboot/netboot.tar.gz"
		;;
	debian)
		RELEASE=bullseye
		TITLE="^Debian GNU/Linux ($RELEASE) Installer"
		URL="http://ftp.debian.org/debian/dists/$RELEASE/main/installer-$ARCH/current/images/netboot/netboot.tar.gz"
		;;
	esac
	DIR="$distro-$RELEASE"
	;;

arch)
	URL="http://archlinux.org/static/netboot/ipxe-arch.7db2ebf431ea.lkrn"
	DIR="$distro-rolling"
	FILE="$distro.lkrn"
	;;

alpine)
	RELEASE=v3.16
	ARCH="x86_64"
	REPO="http://dl-cdn.alpinelinux.org/alpine"
	ALPINE_REPO="$REPO/$RELEASE/main"
	TITLE="Alpine ($RELEASE) Installer"
	URL="$REPO/$RELEASE/releases/$ARCH/netboot/"	
	KERNEL="vmlinuz-lts"
	INITRD="initramfs-lts"
	MODLOOP="modloop-lts"
	MODLOOP_URL="http://10.99.85.1/pxe/alpine/$MODLOOP"
	FILES="$KERNEL $INITRD $MODLOOP"
	DIR="$distro"
	;;

almalinux|rocky|fedora|centos|centosstream)
	ARCH=x86_64
	DIR="$distro"
	KERNEL="vmlinuz"
	INITRD="initrd.img"
	IS_REDH=y
	case "$distro" in
	rocky)
		RELEASE=8
		[ -n "$release" ] && RELEASE="$release"
		TITLE="^Rocky Linux $RELEASE Installer"
		REPO="http://dl.rockylinux.org/pub/rocky/$RELEASE/BaseOS/$ARCH/os/"
		;;
	almalinux)
		RELEASE=9
		[ -n "$release" ] && RELEASE="$release"
		TITLE="^Alma Linux $RELEASE Installer"
		REPO="https://repo.almalinux.org/almalinux/$RELEASE/BaseOS/$ARCH/os/"
		;;
	fedora)
		RELEASE=36
		[ -n "$release" ] && RELEASE="$release"
		TITLE="^Fedora $RELEASE Installer"
		REPO="https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/$RELEASE/Server/$ARCH/os/"
		;;
	centos)
		RELEASE=7
		[ -n "$release" ] && RELEASE="$release"
		TITLE="^CentOS $RELEASE Installer"
		REPO="http://mirror.centos.org/centos/$RELEASE/os/$ARCH/"
		;;
	centosstream)
		RELEASE=9
		[ -n "$release" ] && RELEASE="$release"
		TITLE="CentOS ^Stream $RELEASE Installer"
		REPO_HOST="mirror.stream.centos.org"
		[ "$RELEASE" == "8" ] && REPO="http://mirror.centos.org/centos/$RELEASE-stream/BaseOS/$ARCH/os/"
		REPO="http://mirror.stream.centos.org/$RELEASE-stream/BaseOS/$ARCH/os/"
		;;
	esac

	URL="$REPO/images/pxeboot"
	;;

opensuse)
	ARCH=x86_64
	URL="http://download.opensuse.org/factory/repo/oss/boot/$ARCH/loader/"
	REPO="http://download.opensuse.org/factory/repo/oss/"
	DIR="$distro"
	KERNEL=linux
	INITRD=initrd
	FILES="$KERNEL $INITRD"
	TITLE="^openSUSE Installer"
	;;

esac

echo "Creating subdirectory $DIR"
[ -d "$DIR" ] || mkdir "$DIR"

echo "Downloading $DIR/$FILE"
if [ -n "$FILE" ]
then
	[ -e "$DIR/$FILE" ] || curl -L "$URL" > "$DIR/$FILE"
fi

if [ "x$IS_REDH" = "xy" ]
then
	for f in $INITRD $KERNEL
	do
		fo="$f-$RELEASE"
		[ -e "$DIR/$fo" ] && continue
		curl -L "$URL/$f" > "$DIR/$fo"
	done
elif [ "x$IS_DEBIAN" = "xy" ]
then
	if ! [ -e "$DIR/pxelinux.0" ]
	then
		tar -z -x -v -f "$DIR/$FILE" -C "$DIR"
		ln -s "$DIR/debian-installer" "$PXE"
		cd "$PXE"/amd64/boot-screens/
		sed -i -e "s_debian-installer/_$distro-installer/_g" *.cfg
		cd -
	fi
else
	if [ -n "$FILES" ]
	then
		for f in $FILES
		do
			[ -e "$DIR/$f" ] && continue
			curl -L "$URL/$f" > "$DIR/$f"
		done
	fi
fi

if [ "x$IS_REDH" = "xy" ]
then
	cat > "$DIR/menu-$RELEASE.cfg" <<EOF
label $distro
	menu label $TITLE
	kernel $DIR/$KERNEL-$RELEASE
	append initrd=$DIR/$INITRD-$RELEASE devfs=nomount ip=dhcp inst.repo=$REPO
EOF
	[ -e "$DIR/menu.cfg" ] && rm "$DIR/menu.cfg"
	ln -s "menu-$RELEASE.cfg" "$DIR/menu.cfg"

elif [ "x$IS_DEBIAN" = "xy" ]
then
	cat > "$DIR/menu.cfg" <<EOF
label $distro
	menu label $TITLE
        kernel vesamenu.c32
        append $PXE/amd64/pxelinux.cfg/default
EOF

elif [ "x$distro" = "xopensuse" ]
then
	cat > "$DIR/menu.cfg" <<EOF
label $distro
	menu label $TITLE
	kernel $DIR/$KERNEL
	append initrd=$DIR/$INITRD splash=silent vga=0x314 showopts install=$REPO
EOF
elif [ "x$distro" = "xalpine" ]
then
	cat > "$DIR/menu.cfg" <<EOF
label $distro
	menu label $TITLE
	kernel $DIR/$KERNEL
	append initrd=$DIR/$INITRD modules=loop,squashfs modloop=$MODLOOP_URL alpine_repo=$ALPINE_REPO
EOF

else
	echo "Menu not created."
fi

