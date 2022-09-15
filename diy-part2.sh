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
# sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

mkdir -p files/etc/uci-defaults
cat << "EOF" > files/etc/uci-defaults/90_custom
uci -q batch << EOI
set network.lan.ipaddr='192.168.2.1'
set network.@device[2].macaddr='b8:27:eb:48:f8:30'
set network.@device[2].ipv6='0'
del network.wan6
commit network
set dhcp.lan.force='1'
set dhcp.lan.ra_flags='none'
del dhcp.lan.ra
del dhcp.lan.ra_slaac
del dhcp.lan.dhcpv6
commit dhcp
set system.@system[0]=system
set system.@system[0].hostname='CN210101841'
set system.@system[0].timezone='CST-8'
set system.@system[0].zonename='Asia/Shanghai'
set system.@system[0].ttylogin='0'
set system.@system[0].log_size='64'
set system.@system[0].log_proto='udp'
set system.@system[0].urandom_seed='0'
commit system
EOF
