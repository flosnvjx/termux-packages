TERMUX_PKG_HOMEPAGE=https://github.com/yamafaktory/jql
TERMUX_PKG_DESCRIPTION="A JSON Query utility"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE-MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=5.0.2
TERMUX_PKG_SRCURL=https://github.com/yamafaktory/jql/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=2a18c18752f8ca1acb1f955beef89ed7cedd7b4eabde32e65c27ffe3d52cc370
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release --locked
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/jql
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.md
}
