include $(TOPDIR)/rules.mk

PKG_NAME:=bluepy-helper
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/bluepy-helper
  SECTION:=base
  CATEGORY:=Utilities
  TITLE:=Bluepy helper from bluepy
  DEPENDS:=+bluez-libs +libc +glib2
endef

define Package/bluepy-helper/description
  Bluepy helper from bluepy (https://github.com/IanHarvey/bluepy) 
endef

define Package/bluepy-helper/Clean
endef

PLATFORM="openwrt"

define Build/Configure
	(cd $(PKG_BUILD_DIR) && \
		wget -q https://github.com/IanHarvey/bluepy/archive/master.zip -O master.zip && \
		unzip -o master.zip \
	);
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR)/bluepy-master/bluepy && \
		$(MAKE) CC=$(TARGET_CROSS)gcc \
	);
endef

define Package/bluepy-helper/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bluepy-master/bluepy/bluepy-helper $(1)/usr/bin/bluepy-helper
endef

$(eval $(call BuildPackage,bluepy-helper))
