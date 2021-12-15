package set summary "Top Disk Usage"
package set src.git "https://bitbucket.org/josephpaul0/tdu.git"
package set src.url "https://bitbucket.org/josephpaul0/tdu/get/v1.36.tar.bz2"
package set src.sum "edeb5831ca0c547d4ff2e7011805b821a748b0fc287eb236e01b274e16e4e85a"
package set license "GPL-2.0"
package set bsystem "go"

build() {
    run go build -v -trimpath -ldflags="'-s -w'" -o tdu &&
    run install_bins tdu
}