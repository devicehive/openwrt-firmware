include $(TOPDIR)/rules.mk

PKG_NAME:=dabin
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/dabin
  SECTION:=base
  CATEGORY:=Network
  TITLE:=Binaries for DeviceHive gateway
  DEPENDS:=+bluez-libs +libstdcpp +alljoyn +alljoyn-about
endef

define Package/dabin/description
 Binaries for device hive gateway
endef

define Package/dabin/Clean
endef

define Build/Compile
endef

define Package/dabin/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/btle_gw $(1)/usr/bin/btle_gw
	$(INSTALL_BIN) ./files/DH_alljoyn $(1)/usr/bin/DH_alljoyn
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/devicehive-gw-ble $(1)/etc/init.d/devicehive-gw-ble
	$(INSTALL_BIN) ./files/devicehive-gw-alljoyn $(1)/etc/init.d/devicehive-gw-alljoyn
endef

$(eval $(call BuildPackage,dabin))
