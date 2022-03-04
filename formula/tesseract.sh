package set summary "OCR (Optical Character Recognition) engine"
package set git.url "https://github.com/tesseract-ocr/tesseract.git"
package set src.url "https://github.com/tesseract-ocr/tesseract/archive/5.1.0.tar.gz"
package set src.sum "fdec8528d5a0ecc28ab5fff985e0b8ced60726f6ef33f54126f2868e323d4bd2"
package set license "Apache-2.0"
package set dep.pkg "leptonica icu4c pango libglob cpu_features"
package set dep.cmd "pkg-config"
package set bsystem "cmake"
package set cdefine "ANDROID"

build() {
    export CPPFLAGS="$CPPFLAGS -I$cpu_features_INCLUDE_DIR/ndk_compat"
    export LDFLAGS="$LDFLAGS $cpu_features_LIBRARY_DIR/libndk_compat.so"
    export LDFLAGS="$LDFLAGS $libglob_LIBRARY_DIR/libglob.a"
    cmakew \
        -DENABLE_LTO=ON \
        -DUSE_SYSTEM_ICU=ON \
        -DDISABLE_ARCHIVE=OFF \
        -DDISABLE_CURL=OFF \
        -DBUILD_TESTS=OFF \
        -DBUILD_TRAINING_TOOLS=ON
}
