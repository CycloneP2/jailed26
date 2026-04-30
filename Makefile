export ARCHS = arm64
export TARGET = iphone:clang:latest:15.0

INSTALL_TARGET_PROCESSES = MobileMLBB

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MLBBESP

MLBBESP_FILES = Tweak.xm
MLBBESP_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
