TERMUX_PKG_HOMEPAGE=https://github.com/shenwei356/csvtk
TERMUX_PKG_DESCRIPTION="A cross-platform, efficient and practical CSV/TSV toolkit"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.24.0
TERMUX_PKG_SRCURL=https://github.com/shenwei356/csvtk/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=d944e55d9555733990783bbe45200da5eaef47a13d4eac242ef084d9384d54f8
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	termux_setup_golang
	mkdir bin
	go build -o ./bin -trimpath ./csvtk
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin bin/*
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.* CHANGELOG.*
}
