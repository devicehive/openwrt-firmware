include $(TOPDIR)/rules.mk

PKG_NAME:=alljoyngw
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/alljoyngw
  SECTION:=base
  CATEGORY:=Network
  TITLE:=DeviceHive AllJoyn gateway
  DEPENDS:=+libstdcpp +alljoyn +alljoyn-about
endef

define Package/alljoyngw/description
  DeviceHive AllJoyn gateway
endef

define Package/alljoyngw/Clean
endef

PLATFORM="openwrt"

define Build/Configure
	(cd $(PKG_BUILD_DIR) && \
		wget -q https://github.com/Pilatuz/devicehive-cpp/archive/alljoyn.zip -O alljoyn.zip && \
		unzip -o alljoyn.zip && \
		mkdir -p $(PKG_BUILD_DIR)/devicehive-cpp-alljoyn/externals && \
		ln -s $(STAGING_DIR)/usr/include $(PKG_BUILD_DIR)/devicehive-cpp-alljoyn/externals/include && \
		ln -s $(STAGING_DIR)/usr/lib $(PKG_BUILD_DIR)/devicehive-cpp-alljoyn/externals/lib.$(PLATFORM) \
	);
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR)/devicehive-cpp-alljoyn/alljoyn-bridge && \
		$(MAKE) DH_alljoyn CROSS_COMPILE="$(TARGET_CROSS)" PLATFORM="$(PLATFORM)" \
	);
endef

define Package/alljoyngw/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/devicehive-cpp-alljoyn/alljoyn-bridge/DH_alljoyn $(1)/usr/bin/alljoyngw
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/devicehive-alljoyngw $(1)/etc/init.d/devicehive-alljoyngw
endef

$(eval $(call BuildPackage,alljoyngw))
