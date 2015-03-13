include $(TOPDIR)/rules.mk

PKG_NAME:=blegw
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/blegw
  SECTION:=base
  CATEGORY:=Network
  TITLE:=DeviceHive BLE gateway
  DEPENDS:=+bluez-libs +bluepy-helper +libstdcpp +boost +boost-system +boost-thread +boost-date_time
endef

define Package/blegw/description
  DeviceHive BLE gateway 
endef

define Package/blegw/Clean
endef

PLATFORM="openwrt"

define Build/Configure
	(cd $(PKG_BUILD_DIR) && \
		wget -q https://github.com/Pilatuz/devicehive-cpp/archive/btle_gw.zip -O btle_gw.zip && \
		unzip -o btle_gw.zip && \
		mkdir -p $(PKG_BUILD_DIR)/devicehive-cpp-btle_gw/externals && \
		ln -s $(STAGING_DIR)/usr/include $(PKG_BUILD_DIR)/devicehive-cpp-btle_gw/externals/include && \
		ln -s $(STAGING_DIR)/usr/lib $(PKG_BUILD_DIR)/devicehive-cpp-btle_gw/externals/lib.$(PLATFORM) \
	);
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR)/devicehive-cpp-btle_gw/examples && \
		$(MAKE) btle_gw CROSS_COMPILE="$(TARGET_CROSS)" PLATFORM="$(PLATFORM)" \
	);
endef

define Package/blegw/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/devicehive-cpp-btle_gw/examples/btle_gw $(1)/usr/bin/blegw
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/devicehive-blegw $(1)/etc/init.d/devicehive-blegw
endef

$(eval $(call BuildPackage,blegw))
