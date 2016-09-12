# Copyright (C) 2015 Matthias Fuhrmeister <freifunk at 3dfxatwork de>
# This is free software, licensed under the Apache 2.0 license.

include $(TOPDIR)/rules.mk

PKG_NAME:=freifunk-halle-without-web
PKG_RELEASE:=1.1.1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/freifunk-halle-without-web
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Freifunk
  TITLE:=freifunk-halle-without-web
  DEPENDS:=+freifunk-halle-vpn +freifunk-halle +meshwizard +freifunk-firewall \
	+olsrd +olsrd-mod-dyn-gw-plain +olsrd-mod-jsoninfo +olsrd-mod-nameservice \
	+olsrd-mod-watchdog +ip +freifunk-gwcheck \
	+olsrd-mod-txtinfo +batctl +freifunk-policyrouting 
	 
endef

define Package/freifunk-halle-without-web/description
  Metapackage to select packages for Freifnk Halle without Webinterface.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freifunk-halle-without-web/install
  $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,freifunk-halle-without-web))
