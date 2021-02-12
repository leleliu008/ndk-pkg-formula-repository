summary "Coreutils progress viewer"
webpage "https://github.com/Xfennec/progress"
src_git "https://github.com/Xfennec/progress.git"
src_url "https://github.com/Xfennec/progress/archive/v0.15.tar.gz"
src_sum "1ed0ac65a912ef1aa605d524eaddaacae92079cf71182096a7c65cbc61687d1b"
license "GPL-3.0"
require "pkg-config"
depends "ncurses libwordexp"

build_in_sourced

build() {
    make clean &&
    make CC="$CC" CFLAGS="$CFLAGS $CPPFLAGS" LDFLAGS="$LDFLAGS $libwordexp_LIBRARY_DIR/libwordexp.a" UNAME=Linux &&
    make install PREFIX="$ABI_INSTALL_DIR"
}
