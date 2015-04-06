# Copyright (C) 2015 Matthias Fuhrmeister <freifunk at 3dfxatwork de>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-halle-without-vpn
PKG_RELEASE:=1.0

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-halle-without-vpn
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-halle-vpn
  DEPENDS:=+luci +freifunk-halle-botinfo +luci-mod-freifunk \
	+luci-mod-freifunk-community +meshwizard \
	+freifunk-halle-dhcp \
	+olsrd-mod-txtinfo +batctl
endef

define Package/freifunk-halle-without-vpn/description
  Metapackage to select all packages for Freifnk Halle.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-halle-without-vpn/install
  $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-halle-without-vpn))
