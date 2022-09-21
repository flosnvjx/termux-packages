TERMUX_PKG_HOMEPAGE=https://github.com/01mf02/jaq
TERMUX_PKG_DESCRIPTION="Rusty jq clone focussed on correctness, speed, and simplicity"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE-MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.8.0
TERMUX_PKG_SRCURL=https://github.com/01mf02/jaq/archive/refs/tags/v0.8.0.tar.gz
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/jaq
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.*
}
