TARGET := iphone:clang:latest:14.0
ARCHS := arm64 arm64e

# السطر الأول المهم
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MyLibyanaPatch

MyLibyanaPatch_FILES = Tweak.xm \
                        fishhook.c \
                        hook.c \
                        mach_excServer.c \
                        $(wildcard ESP/*.c ESP/*.cpp ESP/*.m ESP/*.mm) \
                        $(wildcard SYS/*.c SYS/*.cpp SYS/*.m SYS/*.mm)

MyLibyanaPatch_CFLAGS = -fobjc-arc -I. -IESP -ISYS
MyLibyanaPatch_LDFLAGS = -undefined dynamic_lookup

# السطر الأخير المهم
include $(THEOS_MAKE_PATH)/tweak.mk
