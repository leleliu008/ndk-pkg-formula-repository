summary "Low-level library for pixel manipulation"
webpage "https://cairographics.org"
src_url "https://cairographics.org/releases/pixman-0.40.0.tar.gz"
src_sum "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
license "LGPL-2.1"

build() {
    meson \
        -Dneon=disabled \
        -Darm-simd=disabled
}