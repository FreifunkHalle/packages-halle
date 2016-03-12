# Copyright (C) 2015 Matthias Fuhrmeister <freifunk at 3dfxatwork de>
# This is free software, licensed under the GPL 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-halle-full
PKG_RELEASE:=1.1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-halle-full
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-halle-full
  DEPENDS:=+freifunk-halle-vpn +luci +freifunk-halle \
    +luci-mod-freifunk +luci-mod-freifunk-community +luci-app-meshwizard +freifunk-p2pblock \
    +luci-proto-ppp +luci-app-freifunk-widgets +luci-ssl \
    +luci-app-freifunk-policyrouting +luci-app-p2pblock +iputils-traceroute6 +freifunk-de \
    +luci-i18n-freifunk-policyrouting-de +luci-i18n-olsr-de +luci-i18n-p2pblock-de +luci-i18n-openvpn-de \
    +olsrd-mod-txtinfo +batctl +ppp +ppp-mod-pppoe
endef

define Package/freifunk-halle-full/description
  Metapackage to select all packages for Freifnk Halle.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-halle-full/install
  $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-halle-full))
