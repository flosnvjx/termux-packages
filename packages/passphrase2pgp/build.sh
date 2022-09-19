TERMUX_PKG_HOMEPAGE=https://github.com/skeeto/passphrase2pgp
TERMUX_PKG_DESCRIPTION="Generate PGP key from given passphrase in a reproducible manner"
TERMUX_PKG_LICENSE="Unlicense"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.2.0
TERMUX_PKG_SRCURL=https://github.com/skeeto/passphrase2pgp/releases/download/v$TERMUX_PKG_VERSION/passphrase2pgp-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=c8b36917f901787dc6996cc1e39067a068a7f87d96e7ee350e67f9b8bb979d31
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_golang
	mkdir bin
	go build -o ./bin -trimpath
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin bin/*
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.*
}
