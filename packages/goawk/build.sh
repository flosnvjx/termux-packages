TERMUX_PKG_HOMEPAGE=https://github.com/benhoyt/goawk
TERMUX_PKG_DESCRIPTION="POSIX-compliant AWK interpreter written in Go, with CSV support"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE=LICENSE.txt
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.20.0
TERMUX_PKG_SRCURL=https://github.com/benhoyt/goawk/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=c24ef4a9b1c0b416c1aeb786368b36736617c60cfd1f4e871798f5abb2a18e0b
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	termux_setup_golang
	mkdir bin
	go build -o ./bin -trimpath
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin bin/*
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.* csv.md
}
