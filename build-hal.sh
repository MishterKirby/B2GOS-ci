#!/bin/bash
source b2g.env
chmod +x $ANDROID_ROOT/B2G/kernel/motorola/osprey/scripts/gcc-wrapper.py
chmod +x $ANDROID_ROOT/B2G//gecko/build/autoconf/config.guess
chmod +x $ANDROID_ROOT/B2G//gecko/mach
export SHELL=/bin/bash

cd $ANDROID_ROOT/B2G
export DISABLE_SOURCES_XML=true
export USE_CCACHE=1
export B2G_FOTA_FULLIMG_PARTS="/boot:boot.img /system:system.img"
export B2G_SYSTEM_APPS=1
export B2G_UPDATE_CHANNEL=default
export MOZ_TELEMETRY_REPORTING=1
export MOZ_CRASHREPORTER_NO_REPORT=1 
export ENABLE_DEFAULT_BOOTANIMATION=true
export DOGFOOD=1
export VARIANT=eng
export DEVICE_DEBUG=1
export SCREEN_TIMEOUT=0
export NOFTU=1
export NO_LOCK_SCREEN=1
export MOZILLA_OFFICIAL=1
export GAIA_DISTRIBUTION_DIR=distros/spark
export GAIA_DEV_PIXELS_PER_PX=2.25

./build.sh -j$(nproc)  gecko-update-fota-fullimg
