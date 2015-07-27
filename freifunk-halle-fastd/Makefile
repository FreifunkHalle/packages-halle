# Copyright (C) 2015 Matthias Fuhrmeister <freifunk at 3dfxatwork de>
# This is free software, licensed under the GPL 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-halle-fastd
PKG_RELEASE:=0.1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-halle-fastd
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-halle-fastd
  DEPENDS:=+luci +freifunk-halle-botinfo +freifunk-halle-dhcp \
    +luci-mod-freifunk +luci-mod-freifunk-community +luci-app-meshwizard \
    +luci-app-freifunk-widgets  \
    +iputils-traceroute6 +freifunk-de \
    +luci-i18n-freifunk-policyrouting-de +luci-i18n-olsr-de \
    +olsrd-mod-txtinfo +batctl 
endef

define Package/freifunk-halle-fastd/description
  Metapackage to select fastd packages for Freifnk Halle.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-halle-fastd/install
  $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-halle-fastd))
