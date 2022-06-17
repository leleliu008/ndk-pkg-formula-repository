pkg_set summary "get descriptor table size"
pkg_set webpage "https://linux.die.net/man/2/getdtablesize"
pkg_set src.url "dir:///dev/null"

build() {
    echo "int getdtablesize();" > getdtablesize.h &&

    # https://android.googlesource.com/platform/bionic/+/72dc1c22dc6a92dea925398c9e3880364ab29c1c/libc/bionic/getdtablesize.c
    cat > getdtablesize.c <<EOF
#include <sys/resource.h>
#include <sys/sysconf.h>

int getdtablesize() {
    struct rlimit r;
    if (getrlimit(RLIMIT_NOFILE, &r) < 0) {
        return sysconf(_SC_OPEN_MAX);
    }
    return r.rlim_cur;
}
EOF
    run $CC $CFLAGS $CPPFLAGS -c -o getdtablesize.o getdtablesize.c
    run $CC $LDFLAGS -shared -o libgetdtablesize.so getdtablesize.o &&
    run $AR rsc libgetdtablesize.a  getdtablesize.o &&
    run install_incs getdtablesize.h &&
    run install_libs libgetdtablesize.a libgetdtablesize.so
}