package set summary "Very fast implementation of tldr in Rust"
package set git.url "https://github.com/dbrgn/tealdeer.git"
package set src.url "https://github.com/dbrgn/tealdeer/archive/v1.5.0.tar.gz"
package set src.sum "00902a50373ab75fedec4578c6c2c02523fad435486918ad9a86ed01f804358a"
package set license "Apache-2.0"
package set dep.pkg "openssl"
package set dep.cmd "base64 patch"
package set bsystem "cargo"

prepare() {
    {
        cat << EOF
LS0tIGEvc3JjL3R5cGVzLnJzCisrKyBiL3NyYy90eXBlcy5ycwpAQCAtNDMsNyArNDMsNyBAQAog
fQogCiBpbXBsIFBsYXRmb3JtVHlwZSB7Ci0gICAgI1tjZmcodGFyZ2V0X29zID0gImxpbnV4Iild
CisgICAgI1tjZmcoYW55KHRhcmdldF9vcyA9ICJsaW51eCIsIHRhcmdldF9vcyA9ICJhbmRyb2lk
IikpXQogICAgIHB1YiBmbiBjdXJyZW50KCkgLT4gU2VsZiB7CiAgICAgICAgIFNlbGY6OkxpbnV4
CiAgICAgfQpAQCAtNjYsNiArNjYsNyBAQAogCiAgICAgI1tjZmcobm90KGFueSgKICAgICAgICAg
dGFyZ2V0X29zID0gImxpbnV4IiwKKyAgICAgICAgdGFyZ2V0X29zID0gImFuZHJvaWQiLAogICAg
ICAgICB0YXJnZXRfb3MgPSAibWFjb3MiLAogICAgICAgICB0YXJnZXRfb3MgPSAiZnJlZWJzZCIs
CiAgICAgICAgIHRhcmdldF9vcyA9ICJuZXRic2QiLAo=
EOF
    } | base64 -d | patch -p1
}