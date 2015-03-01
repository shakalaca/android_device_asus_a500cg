## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := a500cg

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/asus/a500cg/full_a500cg.mk)

# Boot Animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a500cg
PRODUCT_NAME := cm_a500cg
PRODUCT_BRAND := ASUS
PRODUCT_MODEL := Zenfone 5
PRODUCT_MANUFACTURER := ASUS
