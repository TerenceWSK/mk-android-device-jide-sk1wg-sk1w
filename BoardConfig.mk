#
# Copyright (C) 2011 The Android Open-Source Project
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
#

DEVICE_PACKAGE_OVERLAYS += device/jide/sk1wg/overlay

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := false

# Use the non-open-source parts, if they're present
-include vendor/jide/sk1wg/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := macallan

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/jide/sk1wg
TARGET_KERNEL_CONFIG := mokee_sk1wg_defconfig
#TARGET_PREBUILT_KERNEL := device/jide/sk1wg/kernel

# Video
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 1
HWUI_COMPILE_FOR_PERF := true

# Recovery
RECOVERY_FSTAB_VERSION := 2
RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_FSTAB := device/jide/sk1wg/fstab.macallan
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD -DADD_LEGACY_MEMORY_DEALER_CONSTRUCTOR_SYMBOL

TARGET_RELEASETOOLS_EXTENSIONS := device/jide/sk1wg

# Partition
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608 # 8M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760 # 10M 		#8388608 # 8M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1048576000 # 1G
BOARD_USERDATAIMAGE_PARTITION_SIZE := 60578332672 # 25.6G
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 805306368 #918552576 # 876M
#BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_PERSISTIMAGE_PARTITION_SIZE := 24338432 #8283750 # 7.9M


# Wifi related defines
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd

WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/bcm43341/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/bcm43341/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/bcm43341/fw_bcmdhd_p2p.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/jide/sk1wg/bluetooth

# SELINUX Defines
BOARD_SEPOLICY_DIRS += \
    device/jide/sk1wg/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    genfs_contexts \
    service_contexts \
#   device.te \
    drmserver.te \
    file.te \
    keystore.te \
    mediaserver.te \
    recovery.te \
    sensors_config.te \
    surfaceflinger.te \
    system_app.te \
    system_server.te \
    ueventd.te \
    vold.te \
    radio.te \
    halsel.te \
    wifiloader.te \
    akmd.te \
    set_hwui_params.te \
    input-cfboost.te \
    powerservice.te \
    rm_ts_service.te \
    ussr_setup.te \
    usdwatchdog.te \
    kernel.te \
    gpsd.te \
    servicemanager.te \
    sysinit.te \
    wpa_supplicant.te \
#   service.te
    
BOARD_HARDWARE_CLASS := device/jide/sk1wg/cmhw

EXTENDED_FONT_FOOTPRINT := true
