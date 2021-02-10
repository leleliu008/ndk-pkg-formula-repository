summary "Light UNIX download accelerator"
webpage "https://github.com/axel-download-accelerator/axel"
src_git "https://github.com/axel-download-accelerator/axel.git"
src_url "https://github.com/axel-download-accelerator/axel/releases/download/v2.17.10/axel-2.17.10.tar.xz"
src_sum "46eb4f10a11c4e50320ae6a034ef03ffe59dc11c3c6542a9867a3e4dc0c4b44e"
license "GPL-2.0-or-later"
require "pkg-config make"
depends "openssl"

build() {
    configure
}
