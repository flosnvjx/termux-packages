TERMUX_PKG_HOMEPAGE="https://github.com/SierraSoftworks/shig"
TERMUX_PKG_DESCRIPTION="Cryptographically sign and verify files using SSH keys (OpenSSH sshsig compatible)"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="1.0.1"
TERMUX_PKG_SRCURL="https://github.com/SierraSoftworks/shig/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=7ff33ca3a3c9b06635f8b8679637a582353f6300041c66f1cbb765d44a56e5f8
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"

termux_step_make() {
	termux_setup_golang
	mkdir bin
	go build -o ./bin -trimpath
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin bin/*
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.*
}
