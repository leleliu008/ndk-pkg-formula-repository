summary "Cryptography and SSL/TLS Toolkit"
webpage "https://openssl.org"
src_url "https://dl.bintray.com/homebrew/mirror/openssl-1.1.1g.tar.gz"
src_sum "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
bsystem "make"
require "perl"

build_in_sourced

prepare() {
    sed_in_place '/ndk is invalid/d'      Configurations/15-android.conf &&
    sed_in_place '/no NDK $triarch-gcc/d' Configurations/15-android.conf &&
    sed_in_place '/-target/d'             Configurations/15-android.conf &&
    sed_in_place '/-gcc-toolchain/d'      Configurations/15-android.conf &&
    sed_in_place '/tritools-4.9/d'        Configurations/15-android.conf
}

#注意：1.0.2以上的openssl不支持openssl-fips，从openssl3.0开始支持新设计的openssl-fips
#https://github.com/openssl/openssl/issues/7582
build() {
    export CROSS_SYSROOT=$SYSROOT
    
    run ./Configure \
        shared \
        no-ssl2 \
        no-ssl3 \
        no-comp \
        no-hw \
        no-engine \
        no-asm \
        -D__ANDROID_API__="$MIN_SDK_API_LEVEL" \
        --prefix="$ABI_INSTALL_DIR" \
        "$(os_compiler)" &&
    make clean &&
    make &&
    make install
}

os_compiler() {
    # ./configure LIST | grep android
    case $BUILD_FOR_ARCH in
        armv7a)  echo "android-arm"    ;;
        aarch64) echo "android-arm64"  ;;
        i686)    echo "android-x86"    ;;
        x86_64)  echo "android-x86_64" ;;
    esac
}
