summary "Automatically generate simple man pages"
webpage "https://www.gnu.org/software/help2man"
src_url "https://ftp.gnu.org/gnu/help2man/help2man-1.47.17.tar.xz"
src_sum "da3a35c50b1e1f8c8fa322d69fa47c9011ce443a8fb8d1d671b1f01b8b0008eb"
license "GPL-3.0-or-later"
require "make"

build() {
    configure
}