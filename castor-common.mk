# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit the fusion-common definitions
$(call inherit-product, device/sony/shinano-common/shinano.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/castor_windy/overlay-common

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Device is a Tablet
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := normal large
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Device specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.device.rc:root/init.device.rc

# NFC
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
   $(LOCAL_PATH)/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# Sensors
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# Thermal manager
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/thermanager.xml:system/etc/thermanager.xml

# Wifi
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

# call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
