TERMUX_PKG_HOMEPAGE=http://xmlsoft.org/libxslt/
TERMUX_PKG_DESCRIPTION="XSLT processing library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
_MAJOR_VERSION=1.1
TERMUX_PKG_VERSION=${_MAJOR_VERSION}.37
TERMUX_PKG_SRCURL=https://download.gnome.org/sources/libxslt/${_MAJOR_VERSION}/libxslt-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=3a4b27dc8027ccd6146725950336f1ec520928f320f144eb5fa7990ae6123ab4
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--without-python"
TERMUX_PKG_DEPENDS="libxml2, libgcrypt, libgpg-error, zlib"
TERMUX_PKG_BREAKS="libxslt-dev"
TERMUX_PKG_REPLACES="libxslt-dev"
