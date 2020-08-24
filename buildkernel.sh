#! /bin/bash
set -e

if [ ! -d WSL2-Linux-Kernel ] ; then
git clone --depth=100 -b linux-msft-wsl-4.19.y https://github.com/microsoft/WSL2-Linux-Kernel.git
fi
(cd WSL2-Linux-Kernel && git co linux-msft-4.19.104)

make -C WSL2-Linux-Kernel/tools/perf -j8
make -C WSL2-Linux-Kernel/tools/perf install DESTDIR=`pwd`/linux-tools-4.19.104-microsoft-standard prefix=/usr
dpkg-deb --build linux-tools-4.19.104-microsoft-standard
echo use with sudo apt install ./linux-tools-4.19.104-microsoft-standard.deb
