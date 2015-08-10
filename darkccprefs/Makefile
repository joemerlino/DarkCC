include theos/makefiles/common.mk

BUNDLE_NAME = darkccprefs
darkccprefs_FILES = darkccprefs.mm
darkccprefs_INSTALL_PATH = /Library/PreferenceBundles
darkccprefs_FRAMEWORKS = UIKit
darkccprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/darkccprefs.plist$(ECHO_END)
