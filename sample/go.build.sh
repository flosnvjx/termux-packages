TERMUX_PKG_HOMEPAGE='https://github.com/u-root/u-root'
TERMUX_PKG_DESCRIPTION="Busybox-like userland utilities plus a Linux bootloader written in Go to build single binary initramfs"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.9.0
TERMUX_PKG_SRCURL="https://github.com/u-root/u-root/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=350499550871daba8724a77b07bc50271acf378ecc6290b0925855550a358f5f
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_golang
	go build -v
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin u-root
}
