include $(TOPDIR)/rules.mk

PKG_NAME:=alljoynblegw
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/alljoynblegw
  SECTION:=base
  CATEGORY:=Network
  TITLE:=DeviceHive AllJoyn BLE gateway
  DEPENDS:=+bluez-libs +libstdcpp +bluepy-helper +alljoyn +alljoyn-about +alljoyn-controlpanel +alljoyn-notification
endef

define Package/alljoynblegw/description
  DeviceHive AllJoyn BLE gateway
endef

define Package/alljoynblegw/Clean
endef

PLATFORM="openwrt"

define Build/Configure
	(cd $(PKG_BUILD_DIR) && \
		wget -q https://github.com/Pilatuz/devicehive-cpp/archive/btle_aj.zip -O btle_aj.zip && \
		unzip -o btle_aj.zip && \
		mkdir -p $(PKG_BUILD_DIR)/devicehive-cpp-btle_aj/externals && \
		ln -s $(STAGING_DIR)/usr/include $(PKG_BUILD_DIR)/devicehive-cpp-btle_aj/externals/include && \
		ln -s $(STAGING_DIR)/usr/lib $(PKG_BUILD_DIR)/devicehive-cpp-btle_aj/externals/lib.$(PLATFORM) \
	);
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR)/devicehive-cpp-btle_aj/examples && \
		$(MAKE) btle_gw CROSS_COMPILE="$(TARGET_CROSS)" PLATFORM="$(PLATFORM)" \
	);
endef

define Package/alljoynblegw/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/devicehive-cpp-btle_aj/examples/btle_gw $(1)/usr/bin/alljoynblegw
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/devicehive-alljoynblegw $(1)/etc/init.d/devicehive-alljoynblegw
endef

$(eval $(call BuildPackage,alljoynblegw))
