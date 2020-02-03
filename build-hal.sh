#!/bin/bash
source halium.env
cd $ANDROID_ROOT

# replace something
sed -i 's/external\/selinux/external\/selinux external\/libcurl/g' build/core/main.mk

#rm -r $ANDROID_ROOT/device/oppo/common/keyhandler

source build/envsetup.sh
export USE_CCACHE=1
breakfast $DEVICE
make -j$(nproc) mkbootimg
export USE_HOST_LEX=yes
make -j$(nproc) halium-boot
make -j$(nproc) systemimage 

echo "md5sum halium-boot.img and system.img"
md5sum $ANDROID_ROOT/out/target/product/onyx/halium-boot.img
md5sum $ANDROID_ROOT/out/target/product/onyx/system.img
