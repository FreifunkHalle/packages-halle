# Copyright (C) 2011 Manuel Munz <freifunk at somakoma de>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-halle-botinfo
PKG_RELEASE:=1.1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-halle-botinfo
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-halle-botinfo
  DEPENDS:=+freifunk-common +iwinfo
endef

define Package/freifunk-halle-botinfo/description
  Routerdeamon to collect Routerinformation in Halle.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-halle-botinfo/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-halle-botinfo))
