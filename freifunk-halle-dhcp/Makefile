# Copyright (C) 2014 Matthias Fuhrmiester <freifunk at 3dfxatwork de>
# This is free software, licensed under the GPL 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-halle-dhcp
PKG_RELEASE:=0.5

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-halle-dhcp
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-halle-dhcp
  DEPENDS:=+freifunk-common
endef

define Package/freifunk-halle-dhcp/description
  Routerdeamon to collect Routerinformation in Halle.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-halle-dhcp/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-halle-dhcp))
