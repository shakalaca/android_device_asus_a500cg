## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := a500cg

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/asus/a500cg/full_a500cg.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a500cg
PRODUCT_NAME := cm_a500cg
PRODUCT_BRAND := asus
PRODUCT_MODEL := a500cg
PRODUCT_MANUFACTURER := asus
