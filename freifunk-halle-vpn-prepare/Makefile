# Copyright (C) 2015 Matthias Fuhrmeister <freifunk at 3dfxatwork de>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-halle-vpn-prepare
PKG_RELEASE:=0.4.0

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-halle-vpn-prepare
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-halle-vpn-prepare
  DEPENDS:=+freifunk-common +openvpn-polarssl
endef

define Package/freifunk-halle-vpn-prepare/description
  Routerdeamon to collect Routerinformation in Halle.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-halle-vpn-prepare/install
  $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-halle-vpn-prepare))
