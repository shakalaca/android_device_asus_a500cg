LOCAL_PATH:= $(call my-dir)

ifeq ($(BOARD_CREATE_MODPROBE_SYMLINK), true)

include $(CLEAR_VARS)

LOCAL_MODULE := link_modprobe
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_SUFFIX := -timestamp

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): INIT_FILE := ../init
$(LOCAL_BUILT_MODULE): SYMLINK := $(TARGET_ROOT_OUT)/sbin/modprobe
$(LOCAL_BUILT_MODULE): $(LOCAL_PATH)/Android.mk
$(LOCAL_BUILT_MODULE):
	$(hide) echo "Symlink: $(SYMLINK) -> $(INIT_FILE)"
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(dir $(SYMLINK))
	$(hide) rm -rf $@
	$(hide) rm -rf $(SYMLINK)
	$(hide) ln -sf $(INIT_FILE) $(SYMLINK)
	$(hide) touch $@

endif
