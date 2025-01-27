# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351elec)

PKG_NAME="351files"
PKG_VERSION="bab7144d2b3dccdc090445608d0a21210e3d438b"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/Tardigrade-nx/351Files"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2 SDL2_image SDL2_gfx SDL2_ttf"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="A Single panel file Manager tailored for Anbernic 351 devices: RG351V/MP and RG351P/M. Can be easily adapted to any Linux-based device."

if [ "${DEVICE}" = "RG351MP" ]
then
  PKG_PATCH_DIRS="RG351MP"
fi

make_target() {
  make DEVICE=${DEVICE} RES_PATH=/usr/share/351files/res START_PATH=/storage/roms SDL2_CONFIG=${SYSROOT_PREFIX}/usr/bin/sdl2-config CC=$CXX
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/share/351files
  cp 351Files $INSTALL/usr/bin/
  cp -rf res $INSTALL/usr/share/351files/
}

