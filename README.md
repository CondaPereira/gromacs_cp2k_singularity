# ***gromacs interface with cp2k***

This is a repository which will provide a portable gromacs ***(interface with cp2k)*** version, and the singularity image file can solve the problem of software installation when there is a lack of dependencies during the service period. The version of the compiled programs now support CPU's ***AVX2*** instruction settings ***(Ryzen 7 5800H)***, Other instruction sets have not been tested yet ***(such as SSE)*** ,which may be OK and I also want to invite you to provide issues and we can solve these difficult together, thanks! :)

### 1. Singularity installation

Based on Singularity's high-performance computing container technology, compared with the container technology used in cloud computing environments such as Docker, Singularity supports both root and non-root user startup, and the user context remains unchanged before and after the container startup, which makes user privileges the same inside and outside of the container. Singularity emphasizes the convenience, portability, and scalability of container services while weakening the high isolation of container processes, resulting in lighter weight, fewer namespaces in the kernel, and less loss of performance. On the other hand, when you transplant a program by sif mirror, you'd better install the singularity on the machine. Nevertheless, it must fail which will prompt ***"/usr/bin/env run-singularity not found ."***

#### ***1. Conda Environment***

```shell
# conda create -n singularity python=3.8
conda activate singularity
conda install -c conda-forge singularity
singularity --version
# singularity version 3.8.6
```

#### ***2. Manually Compile (Ubuntu-20.04)***

This way is recommended when you are an administrator or root user:)

##### Install dependencies 

```shell
sudo apt-get update
sudo apt upgrade -y
sudo apt-get install -y \
    build-essential \
    libseccomp-dev \
    libglib2.0-dev \
    pkg-config \
    squashfs-tools \
    cryptsetup \
    runc
```

##### install Go

```shell
export VERSION=1.19.3 OS=linux ARCH=amd64  # change this as you need

wget -O /tmp/go${VERSION}.${OS}-${ARCH}.tar.gz \
  https://dl.google.com/go/go${VERSION}.${OS}-${ARCH}.tar.gz
sudo tar -C /usr/local -xzf /tmp/go${VERSION}.${OS}-${ARCH}.tar.gz

# then set your own environment variable
```

##### Compiling SingularityCE

```shell
git clone --recurse-submodules https://github.com/sylabs/singularity.git
cd singularity

./mconfig
make -C builddir
sudo make -C builddir install

./mconfig -b ./buildtree -p /usr/local
```

if you want to check out more information about the singularity installation progress, please visit this [website](https://github.com/sylabs/singularity/blob/main/INSTALL.md).

#### ***3. Use of the gromacs_cp2k-f.sif***

Only need download it and then put it in your familiar file location.

[Download location_1 (mainland)](https://pan.baidu.com/s/11R9Mf56B8OiAiw0ybUzU0Q?pwd=1234)  ***code***: 1234

[Download location_2 (All users)]()  

```shell
singularity exec /path to gromacs_cp2k-f.sif gmx_cp2k --version

# this progress might produce huge cache file so i recommend you change the singularity tmp_dir to the proper location 
```
