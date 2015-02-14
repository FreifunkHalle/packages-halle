# Copyright (C) 2011 Manuel Munz <freifunk at somakoma de>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-halle-vpn
PKG_RELEASE:=1.0

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-halle-vpn
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-halle-vpn
  DEPENDS:=+freifunk-halle-vpn-prepare +openvpn-polarssl
endef

define Package/freifunk-halle-vpn/description
  Metapackage to select packages for Freifnk Halle VPN.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-halle-vpn/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-halle-vpn))
