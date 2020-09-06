summary="Implementation of the Unicode BiDi algorithm"
homepage="https://github.com/fribidi/fribidi"
url="https://github.com/fribidi/fribidi/releases/download/v1.0.10/fribidi-1.0.10.tar.xz"
sha256="7f1c687c7831499bcacae5e8675945a39bacbad16ecaa945e9454a32df653c01"

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --disable-debug \
        --disable-static \
        --enable-shared \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG='' && \
    make clean &&
    make install
}