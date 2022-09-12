TERMUX_PKG_HOMEPAGE="http://www.shlomifish.org/open-source/projects/fortune-mod/"
TERMUX_PKG_DESCRIPTION="Display random messages or quotations (maintained portable fork w/ \"strfile\" utility)"
TERMUX_PKG_LICENSE="BSD"
TERMUX_PKG_DEPENDS="recode"
TERMUX_PKG_BUILD_DEPENDS="perl docbook-xsl"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_PROVIDES="fortune"
TERMUX_PKG_CONFLICTS="fortune"
TERMUX_PKG_DEPENDS="recode"
TERMUX_PKG_VERSION=3.14.1
#TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/shlomif/fortune-mod/releases/download/fortune-mod-$TERMUX_PKG_VERSION/fortune-mod-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=367023f5db01d5952e4e6d96f263dd2b6875e43b6ba3cbdee9cfad3e8294b17b
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DNO_OFFENSIVE=OFF
-DLOCALDIR=$PREFIX/share/games/fortunes
"

#termux_step_pre_configure() {
#	cpan install Path::Tiny App::XML::DocBook::Builder
#}
