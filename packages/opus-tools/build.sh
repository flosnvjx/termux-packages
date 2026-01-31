TERMUX_PKG_HOMEPAGE=https://www.opus-codec.org/
TERMUX_PKG_DESCRIPTION="Utilities to encode and decode .opus files"
TERMUX_PKG_LICENSE="BSD 3-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.2
TERMUX_PKG_REVISION=4
TERMUX_PKG_SRCURL=https://downloads.xiph.org/releases/opus/opus-tools-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642259f6da28fa0ff86
TERMUX_PKG_BUILD_DEPENDS="libopusenc-static, libopusenc, libogg-static, libogg, opusfile-static, opusfile, libopus-static, libopus"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--without-flac"

termux_step_pre_configure() {
	export OGG_LIBS="-Wl,-Bstatic -logg -Wl,-Bdynamic"
	export OPUS_LIBS="-Wl,-Bstatic -lopus -Wl,-Bdynamic"
	export OPUSFILE_LIBS="-Wl,-Bstatic -lopusfile -Wl,-Bdynamic"
	export OPUSURL_LIBS="-Wl,-Bstatic -lopusurl -Wl,-Bdynamic"
	export LIBOPUSENC_LIBS="-Wl,-Bstatic -lopusenc -Wl,-Bdynamic"
	export TERMUX_PKG_MAKE_PROCESSES=1
}
