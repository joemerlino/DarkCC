include theos/makefiles/common.mk

TWEAK_NAME = DarkCC
DarkCC_FILES = Tweak.xm
DarkCC_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += darkccprefs
SUBPROJECTS += darkcctoggle
include $(THEOS_MAKE_PATH)/aggregate.mk
