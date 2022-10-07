TERMUX_PKG_HOMEPAGE="https://github.com/okbob/pspg"
TERMUX_PKG_DESCRIPTION="Pager designed to interact with terminal output of sqlite3/pgctl/mysql(1)"
TERMUX_PKG_LICENSE="BSD 2-Clause"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="5.5.8"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SRCURL="https://github.com/okbob/pspg/archive/refs/tags/5.5.8.tar.gz"
TERMUX_PKG_SHA256=bc25e517784f08840796188d1fb8e908ed522d0809c0ca176eae07363bd5281b
TERMUX_PKG_DEPENDS="ncurses, readline"
TERMUX_PKG_MAKE_INSTALL_TARGET="install man-install"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_make_install() {
	install -Dm600 -t $TERMUX_PREFIX/share/bash-completion/completions bash-completion.sh
	install -Dm600 -t $TERMUX_PREFIX/share/doc/$TERMUX_PKG_NAME README.*
}
