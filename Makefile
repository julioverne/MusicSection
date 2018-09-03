include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MusicSection

MusicSection_FILES = /mnt/d/codes/musicsection/Tweak.xm
MusicSection_FRAMEWORKS = CydiaSubstrate UIKit CoreGraphics QuartzCore
MusicSection_PRIVATE_FRAMEWORKS = 
MusicSection_LDFLAGS = -Wl,-segalign,4000

export ARCHS = armv7 arm64
MusicSection_ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/tweak.mk
	
all::
