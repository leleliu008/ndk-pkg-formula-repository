package set summary "Bourne-Again SHell, a UNIX command interpreter"
package set webpage "https://www.gnu.org/software/bash"
package set src.git "https://git.savannah.gnu.org/git/bash.git"
package set src.url "https://mirrors.tuna.tsinghua.edu.cn/gnu/bash/bash-5.1.tar.gz"
package set src.sum "cc012bc860406dcf42f64431bcd3d2fa7560c02915a601aba9cd597a39329baa"
package set version "5.1"
package set license "GPL-3.0-or-later"
package set bsystem "configure"
package set dep.pkg "readline ncurses"

build() {
    configure \
        --with-curses \
        --without-bash-malloc \
        --disable-profiling \
        --enable-readline \
        --enable-select \
        --enable-history \
        --enable-static-link
}
