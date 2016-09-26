#!/bin/bash

BUILD_PATH=/build
BUILD_ROOT=$BUILD_PATH/root
BASE_PKG=$BUILD_PATH/flat/base.pkg

PKG_ROOT=/pkg
PAYLOAD_PATH=$PKG_ROOT/payload

mkdir $BUILD_PATH
mkdir -p $BASE_PKG $BUILD_PATH/flat/Resources/en.lproj $BUILD_ROOT

cp -r $PAYLOAD_PATH $BUILD_ROOT
cp $PKG_ROOT/PackageInfo $BASE_PKG

( cd $BUILD_ROOT && find . | cpio -o --format odc --owner 0:80 | gzip -c ) > $BASE_PKG/Payload

cd $BUILD_PATH
find root | wc -l
du -b -s root
mkbom -u 0 -g 80 root $BASE_PKG/Bom
( cd flat && xar --compression none -cf "$PKG_ROOT/MyPKG.pkg" * )

