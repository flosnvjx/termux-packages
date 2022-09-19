TERMUX_PKG_HOMEPAGE=https://github.com/jqnatividad/qsv
TERMUX_PKG_DESCRIPTION="CSV/TSV processing utility in Rust (actively maintained fork of xsv, lite variant)"
TERMUX_PKG_LICENSE="MIT, Unlicense"
TERMUX_PKG_LICENSE_FILE="COPYING"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.68.0
TERMUX_PKG_SRCURL=https://github.com/jqnatividad/qsv/archive/refs/tags/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=790a37550c5e6d6dfb48087ed397a7ab81ba00fd2bc8e22cf3ad70d10055ec7a
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	termux_setup_rust
	cargo build --bin qsvlite --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release --locked
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/qsvlite
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.*
}
