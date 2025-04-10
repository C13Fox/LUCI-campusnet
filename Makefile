include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-campusnet
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Your Name <your.email@example.com>
PKG_LICENSE:=GPL-3.0-or-later

LUCI_TITLE:=LuCI support for Campus Network Auto Login
LUCI_DEPENDS:=+luci-base +curl
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature