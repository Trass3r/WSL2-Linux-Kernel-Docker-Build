#! /bin/bash
set -e

TARGET=$(uname -r)

if [ ! -d WSL2-Linux-Kernel ] ; then
git clone --depth=100 -b linux-msft-wsl-4.19.y https://github.com/microsoft/WSL2-Linux-Kernel.git
fi
(cd WSL2-Linux-Kernel && git fetch && git co $TARGET)

make -C WSL2-Linux-Kernel/tools/perf -j8
make -C WSL2-Linux-Kernel/tools/perf install DESTDIR=`pwd`/linux-tools-$TARGET prefix=/usr
mkdir -p $(pwd)/linux-tools-$TARGET/DEBIAN
echo "Package: linux-tools
Version: $TARGET
Priority: optional
Architecture: amd64
Depends: libunwind-dev (>= 1.2.1), libbabeltrace1 (>= 1.5.5), libbabeltrace-ctf1 (>= 1.5.5), libnuma1 (>= 2.0.11)
Maintainer: No one
Description: linux-perf tools for WSL2
" > $(pwd)/linux-tools-$TARGET/DEBIAN/control
dpkg-deb --build linux-tools-$TARGET
echo use with sudo apt install ./linux-tools-$TARGET.deb
