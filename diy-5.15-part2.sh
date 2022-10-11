#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate

########### 更新lean的内置的smartdns版本 ###########
sed -i 's/1.2022.37/1.2022.38/g' feeds/packages/net/smartdns/Makefile
sed -i 's/5a2559f0648198c290bb8839b9f6a0adab8ebcdc/fa0ab28bab3dac40a535722a1bc49de26a22b0bf/g' feeds/packages/net/smartdns/Makefile
sed -i 's/^PKG_MIRROR_HASH/#&/' feeds/packages/net/smartdns/Makefile

########### 安装应用过滤（必选）###########
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

########### 安装smartdns（必选）###########
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

########### 设置密码为空（可选） ###########
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
