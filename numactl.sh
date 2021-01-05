summary "NUMA support for Linux"
webpage "https://github.com/numactl/numactl"
src_url "https://github.com/numactl/numactl/releases/download/v2.0.14/numactl-2.0.14.tar.gz"
src_sum "826bd148c1b6231e1284e42a4db510207747484b112aee25ed6b1078756bcff6"

# sys/shm.h:
# void* shmat(int __shm_id, const void* __addr, int __flags) __INTRODUCED_IN(26);
# int shmctl(int __shm_id, int __cmd, struct shmid_ds* __buf) __INTRODUCED_IN(26);
# int shmdt(const void* __addr) __INTRODUCED_IN(26);
# int shmget(key_t __key, size_t __size, int __flags) __INTRODUCED_IN(26);

prepare() {
    #sed_in_place 's/-lrt//' Makefile.am &&
    sed_in_place 's/-lrt//' Makefile.in
}

build() {
    configure
}