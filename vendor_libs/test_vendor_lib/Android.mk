LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

BT_DIR := $(TOP_DIR)system/bt

LOCAL_SRC_FILES := \
    src/bt_vendor.cc \
    src/command_packet.cc \
    src/dual_mode_controller.cc \
    src/event_packet.cc \
    src/hci_transport.cc \
    src/packet.cc \
    src/packet_stream.cc \
    src/test_channel_transport.cc \
    src/vendor_manager.cc

# We pull in gtest because base/files/file_util.h, which is used to read the
# controller properties file, needs gtest/gtest_prod.h.
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    $(BT_DIR) \
    $(BT_DIR)/hci/include \
    $(BT_DIR)/osi/include \
    $(BT_DIR)/stack/include \
    $(BT_DIR)/third_party/gtest/include

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libchrome

LOCAL_CPP_EXTENSION := .cc
LOCAL_CFLAGS += -std=c++11
LOCAL_MODULE := test-vendor
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
