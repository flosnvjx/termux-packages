TERMUX_PKG_HOMEPAGE="https://github.com/whitfin/runiq"
TERMUX_PKG_DESCRIPTION="Like uniq(1) but does not need to sort input before processing"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="1.2.2"
TERMUX_PKG_SRCURL="https://github.com/whitfin/runiq/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=27d0274c725137c34b32d5ce76cfc92bb71a4e49a427a307f85f7b8c5f6fd2f4
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release #--locked
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/runiq
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.*
}
