# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from earth device.
$(call inherit-product, device/xiaomi/earth/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Product Specifics
PRODUCT_NAME := recovery_earth
PRODUCT_DEVICE := earth
PRODUCT_BRAND := Poco
PRODUCT_MODEL := Poco C55
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
