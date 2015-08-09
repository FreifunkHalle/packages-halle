# Copyright (C) 2015 Matthias Fuhrmeister <freifunk at 3dfxatwork de>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-halle-luci2
PKG_RELEASE:=1.0

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-halle-luci2
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-halle-vpn
  DEPENDS:=+freifunk-halle-vpn +freifunk-halle-botinfo +freifunk-halle-dhcp \
    	+meshwizard +freifunk-firewall +uhttpd +uhttpd-mod-ubus \
	+olsrd +olsrd-mod-dyn-gw-plain +olsrd-mod-jsoninfo +olsrd-mod-nameservice \
	+olsrd-mod-watchdog +ip +freifunk-gwcheck \
	+olsrd-mod-txtinfo +batctl +luci2 
	 
endef

define Package/freifunk-halle-luci2/description
  Metapackage to select all packages for Freifnk Halle.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-halle-luci2/install
  $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-halle-luci2))
