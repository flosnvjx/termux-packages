TERMUX_PKG_HOMEPAGE=https://gpac.wp.imt.fr/
TERMUX_PKG_DESCRIPTION="An open-source multimedia framework focused on modularity and standards compliance"
TERMUX_PKG_LICENSE="LGPL-2.1-or-later"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2.4.0r2"
TERMUX_PKG_SRCURL=https://github.com/gpac/gpac/archive/refs/tags/abi-12.27.tar.gz
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_DEPENDS="ffmpeg, freetype, liba52, libjpeg-turbo, liblzma, libmad, libnghttp2, libogg, libpng, libtheora, libvorbis, openjpeg, openssl, pulseaudio, xvidcore, zlib"
TERMUX_PKG_EXTRA_MAKE_ARGS="STRIP=:"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-x11"

termux_step_pre_configure() {
	declare -a _commits=(
	4e9091c4568e4574eeaf8714256d20a916735603
	)

	declare -a _checksums=(
	SKIP_CHECKSUM
	)

	for i in "${!_commits[@]}"; do
		PATCHFILE="${TERMUX_PKG_CACHEDIR}/gpac_patch_${_commits[i]}.patch"
		termux_download \
			"https://github.com/gpac/gpac/commit/${_commits[i]}.patch" \
			"$PATCHFILE" \
			"${_checksums[i]}"
		patch -p1 -i "$PATCHFILE"
	done

	CFLAGS+=" -fPIC"
	for f in $CFLAGS $CPPFLAGS; do
		TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --extra-cflags=$f"
	done
	for f in $LDFLAGS; do
		TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --extra-ldflags=$f"
	done
}
