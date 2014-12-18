LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Superuser
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := daemonsu
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := supolicy
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libsupol
LOCAL_SRC_FILES := $(LOCAL_MODULE).so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := install-recovery.sh
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := link_su_binary
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_SUFFIX := -timestamp

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): daemonsu $(TARGET_OUT)/bin/mksh
$(LOCAL_BUILT_MODULE): $(LOCAL_PATH)/Android.mk
$(LOCAL_BUILT_MODULE):
	$(hide) echo "Installing su binary .. "
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(TARGET_OUT)/bin/.ext/
	$(hide) rm -rf $@
	$(hide) cp $(TARGET_OUT)/xbin/daemonsu $(TARGET_OUT)/bin/.ext/.su
	$(hide) cp $(TARGET_OUT)/xbin/daemonsu $(TARGET_OUT)/xbin/sugote
	$(hide) cp $(TARGET_OUT)/xbin/daemonsu $(TARGET_OUT)/xbin/su
	$(hide) cp $(TARGET_OUT)/bin/mksh $(TARGET_OUT)/xbin/sugote-mksh
	$(hide) touch $@
