TERMUX_PKG_HOMEPAGE=https://github.com/greymd/teip
TERMUX_PKG_DESCRIPTION="Select fields from the standard input then replace them with the output of a command"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.0.0
TERMUX_PKG_SRCURL=https://github.com/greymd/teip/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=faa60ce440d91dbdfc06786b7224eecff5da034ec0d040cc1c3e6bb71f8bcda7
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/teip
	install -Dm600 -t $TERMUX_PREFIX/share/man/man1 man/teip.1
	install -Dm600 -t $PREFIX/share/zsh/site-functions completion/zsh/_teip
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.*
}
