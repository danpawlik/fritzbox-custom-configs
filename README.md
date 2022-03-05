# fritzbox-custom-configs
Config files to build firmware images for FRITZ!Box Fon WLAN 7390 and others

## How to

Build freetz-ng firmware image for FRITZ!Box 7390 (Germany version):

```shell
sudo yum install -y podman
mkdir -p build_dir
podman run --name freetz -it -u user -v $(pwd)/build_dir:/home/user/build_dir:z quay.io/dpawlik/freetz-ng:latest /bin/bash
```

Inside the container:

```shell
git clone https://github.com/danpawlik/fritzbox-custom-configs
cd build_dir
git clone https://github.com/Freetz-NG/freetz-ng
cp ../fritzbox-custom-configs/freetz-ng/7390/.config .config
cp ../fritzbox-custom-configs/freetz-ng/7390/.config.compressed .config.compressed

## optional execute
make menuconfig

unset CFLAGS CXXCFLAGS
make -j $(nproc)
```

If all is done, in `bin` directory, you will find container image.

The system image will be available in `build_dir`.

## Build own container image

To build container image:

```shell
podman build -t freetz-ng -f Dockerfile
```
