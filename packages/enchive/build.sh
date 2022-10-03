TERMUX_PKG_HOMEPAGE="https://github.com/skeeto/enchive"
TERMUX_PKG_DESCRIPTION="Like passphrase2pgp + age for encryption, but in C"
TERMUX_PKG_LICENSE="Unlicense"
TERMUX_PKG_LICENSE_FILE="UNLICENSE"
TERMUX_PKG_MAINTAINER="@flosnvjx"
TERMUX_PKG_VERSION="3.5+g210608"
## comment these until upstream toggle a new release becasue we require https://github.com/skeeto/enchive/commit/da8de6a647f7d0429b22ec4e711326ec773d389d
#TERMUX_PKG_AUTO_UPDATE=true
#TERMUX_PKG_SRCURL="https://github.com/skeeto/enchive/releases/download/$TERMUX_PKG_VERSION/enchive-$TERMUX_PKG_VERSION.tar.xz"
TERMUX_PKG_SRCURL="https://github.com/skeeto/enchive/archive/13aeab9fe876c99f804c08a963b6a8499309f402.tar.gz"
TERMUX_PKG_SUGGESTS="pinentry"
TERMUX_PKG_SHA256=6e19024c938c5a72a953b618e315545a46085e6832bc0576d20cfec516b8400a
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
	sed -e '/^CC  *= /		s% =% ?=%
		/^CFLAGS  *= /		s% =% ?=%
		/^LDFLAGS  *= /		s% =% ?=%
		/^CPPFLAGS  *= /	s% =% ?=%
		/^PREFIX  *= /		s% =% ?=%' -i Makefile
}

termux_step_post_make_install() {
	install -pDm600 -t $TERMUX_PREFIX/share/emacs/site-lisp enchive-mode.el
}
