# Copyright (C) 2011 Manuel Munz <freifunk at somakoma de>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-de
PKG_RELEASE:=1.0

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-de
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-de
  DEPENDS:=+luci-i18n-base-de +luci-i18n-commands-de +luci-i18n-firewall-de +luci-i18n-freifunk-de \
             +luci-i18n-meshwizard-de +luci-i18n-splash-de
endef

define Package/freifunk-de/description
  Metapackage for Freifunk Halle
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-de/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-de))
