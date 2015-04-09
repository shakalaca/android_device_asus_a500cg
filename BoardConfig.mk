COMMON_PATH := device/intel/common
SUPPORT_PATH := vendor/intel/support

LOCAL_PATH := device/asus/a500cg
include $(GENERIC_X86_CONFIG_MK)
BOARD_CREATE_MODPROBE_SYMLINK := true

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
#TARGET_ARCH_VARIANT := x86
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := x86
TARGET_ARCH_ABI := x86
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
LOCAL_CFLAGS += -DARCH_IA32
BOARD_MALLOC_ALIGNMENT := 16

TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
REF_DEVICE_NAME := redhookbay
TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
#TARGET_PREBUILT_KERNEL := device/asus/a500cg/blobs/kernel-ww-2.20.40.13

# Kernel config (reference only)
KERNEL_SRC_DIR := $(TOPDIR)linux/kernel
#KERNEL_SRC := $(TOPDIR)linux/kernel
KERNEL_DIFFCONFIG :=$(TOPDIR)device/asus/a500cg/a500cg_diffconfig
TARGET_KERNEL_CONFIG := i386_ctp_defconfig
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
cmdline_extra := watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789012345678901
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 earlyprintk=nologger loglevel=0 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay $(cmdline_extra) ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=172M
 #androidboot.wakesrc=05 androidboot.mode=main

# File system
# Storage information
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 20
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1363148800
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery global
#TARGET_PROVIDES_INIT_RC := true
#TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/ramdisk/init.recovery.redhookbay.rc
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/ramdisk/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_RECOVERY_SWIPE := true
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
BOARD_SUPPRESS_EMMC_WIPE := true
#TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/blobs/kernel-ww-2.20.40.13

# Recovery options TWRP
DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_SCREEN_WIDTH := 720
TARGET_RECOVERY_SCREEN_HEIGHT := 1280
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_DEFAULT_EXTERNAL_STORAGE := true

#RECOVERY_VARIANT := philz
RECOVERY_VARIANT := twrp
#RECOVERY_VARIANT := cm
#TARGET_SCREEN_HEIGHT := 1280
#TARGET_SCREEN_WIDTH := 720
BRIGHTNESS_SYS_FILE := "/sys/class/backlight/psb-sl/brightness"
#TARGET_RECOVERY_INITRC := vendor/samsung/common_init/init.philz*.rc

# Enabling Houdini by default
INTEL_HOUDINI := true
ADDITIONAL_BUILD_PROPERTIES += ro.product.cpu.abi2=armeabi-v7a
# Appends path to ARM libs for Houdini
PRODUCT_LIBRARY_PATH := $(PRODUCT_LIBRARY_PATH):/system/lib/arm
TARGET_BUILD_EMULATOR := false
# kernel Mmap memory bottom-up
ADDITIONAL_BUILD_PROPERTIES += ro.config.personality=compat_layout

### See upstream patch:
### https://android-review.googlesource.com/#/c/64639/
### Define in bsp until merged
# Macro to add include directories of modules in pathmap_INCL
# relative to root of source tree. Usage:
# $(call add-path-map, project1:path1)
# OR
# $(call add-path-map, \
#        project1:path1 \
#        project2:path1)
#
define add-path-map
$(eval pathmap_INCL += \
    $(foreach path, $(1), \
        $(if $(filter $(firstword $(subst :, ,$(path))):%, $(pathmap_INCL)), \
            $(error Duplicate AOSP path map $(path)), \
            $(path) \
         ) \
     ) \
 )
endef

#Extend the AOSP path includes
$(call add-path-map, stlport:external/stlport/stlport \
        alsa-lib:external/alsa-lib/include \
        libxml2:external/libxml2/include \
        webcore-icu:external/webkit/Source/WebCore/icu \
        tinyalsa:external/tinyalsa/include \
        core-jni:frameworks/base/core/jni \
        vss:frameworks/av/libvideoeditor/vss/inc \
        vss-common:frameworks/av/libvideoeditor/vss/common/inc \
        vss-mcs:frameworks/av/libvideoeditor/vss/mcs/inc \
        vss-stagefrightshells:frameworks/av/libvideoeditor/vss/stagefrightshells/inc \
        lvpp:frameworks/av/libvideoeditor/lvpp \
        osal:frameworks/av/libvideoeditor/osal/inc \
        frameworks-base-core:frameworks/base/core/jni \
        frameworks-av:frameworks/av/include \
        frameworks-openmax:frameworks/native/include/media/openmax \
        jpeg:external/jpeg \
        skia:external/skia/include \
        sqlite:external/sqlite/dist \
        opencv-cv:external/opencv/cv/include \
        opencv-cxcore:external/opencv/cxcore/include \
        opencv-ml:external/opencv/ml/include \
        libstagefright:frameworks/av/media/libstagefright/include \
        libstagefright-rtsp:frameworks/av/media/libstagefright/rtsp \
        libmediaplayerservice:frameworks/av/media/libmediaplayerservice \
        gtest:external/gtest/include \
        frameworks-base-libs:frameworks/base/libs \
        frameworks-av-services:frameworks/av/services \
        tinycompress:external/tinycompress/include \
        libnfc-nci:external/libnfc-nci/src/include \
        libnfc-nci_hal:external/libnfc-nci/src/hal/include \
        libnfc-nci_nfc:external/libnfc-nci/src/nfc/include \
        libnfc-nci_nfa:external/libnfc-nci/src/nfa/include \
        libnfc-nci_gki:external/libnfc-nci/src/gki \
        libc-private:bionic/libc/private \
        icu4c-common:external/icu/icu4c/source/common \
        expat-lib:external/expat/lib \
        libvpx:external/libvpx \
        protobuf:external/protobuf/src \
        zlib:external/zlib \
        openssl:external/openssl/include \
        libnl-headers:external/libnl-headers \
        system-security:system/security/keystore/include/keystore \
        libpcap:external/libpcap \
        libsensorhub:vendor/intel/hardware/libsensorhub/src/include \
        libsensorhub_ish:vendor/intel/hardware/libsensorhub/src_ish/include \
        icu4c-i18n:external/icu/icu4c/source/i18n \
        bt-bluez:system/bluetooth/bluez-clean-headers \
        astl:external/astl/include \
        libusb:external/libusb/libusb \
        libc-kernel:bionic/libc/kernel \
        libc-x86:bionic/libc/arch-x86/include \
        strace:external/strace \
        bionic:bionic \
        opengl:frameworks/native/opengl/include \
        libstagefright-wifi-display:frameworks/av/media/libstagefright/wifi-display \
        libffi:external/libffi/include \
        libffi-x86:external/libffi/linux-x86)


# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP    := "/system/etc/firmware/fw_bcmdhd_43362_apsta.bin"
WIFI_DRIVER_FW_PATH_STA   := "/system/etc/firmware/fw_bcmdhd_43362.bin"
WIFI_DRIVER_MODULE_ARG := "iface_name=wlan0 firmware_path=/system/etc/firmware/fw_bcmdhd_43362.bin"
include device/intel/common/wifi/WifiBoardConfig.mk
# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# HW_Renderer
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
BOARD_ALLOW_EGL_HIBERNATION := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# HWComposer
BOARD_USES_HWCOMPOSER := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

# SELinux
HAVE_SELINUX := true
BOARD_SEPOLICY_DIRS := $(LOCAL_PATH)/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts \
    seapp_contexts \
    property_contexts \
    file.te \
    genfs_contexts \
#    device.te \
    vold.te \
    ecryptfs.te \
    surfaceflinger.te \
    zygote.te \
    su.te \
    pvrsrvctl.te \
    bluetooth.te \
    mediaserver.te

# Camera
USE_CAMERA_STUB := false
USE_CAMERA_HAL2 := true
USE_CSS_1_5 := true
USE_INTEL_METABUFFER := true
USE_INTEL_CAMERA_EXTRAS := true
USE_INTEL_JPEG := true

USE_INTEL_MDP := true
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true

TARGET_PREFER_32_BIT := true
