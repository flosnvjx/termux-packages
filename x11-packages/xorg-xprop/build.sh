TERMUX_PKG_HOMEPAGE=https://xorg.freedesktop.org/
TERMUX_PKG_DESCRIPTION="Utility to print properties of X11 windows"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Rafael Kitover <rkitover@gmail.com>"
TERMUX_PKG_VERSION=1.2.5
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://xorg.freedesktop.org/releases/individual/app/xprop-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=9b92ed0316bf2486121d8bac88bd1878f16b43bd335f18009b1f941f1eca93a1
TERMUX_PKG_DEPENDS="libx11"
TERMUX_PKG_BUILD_DEPENDS="xorg-util-macros"

