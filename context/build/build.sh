#!/bin/sh
set -e

URL=https://github.com/openNDS/openNDS/archive/refs/tags/v10.3.0.tar.gz
FNAME=v10.3.0.tar.gz
SRCDIR=openNDS-10.3.0

wget -O $FNAME $URL
sha512sum -c checksum
tar xvf $FNAME
cd $SRCDIR
make
make install DESTDIR=/install/