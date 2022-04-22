#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Add OpenClash
mkdir package/luci-app-openclash
cd package/luci-app-openclash
git init
git remote add origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >>.git/info/sparse-checkout
git pull --depth 1 origin master

# Add UnblockNeteaseMusic
cd ..
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git
# sed -i s/libustream-openssl/libustream-wolfssl/g luci-app-unblockneteasemusic/Makefile

# Add Adguard Home
#git clone https://github.com/kongfl888/luci-app-adguardhome.git

# Add smartdns
#cd ..
#WORKINGDIR="$(pwd)/feeds/packages/net/smartdns"
#mkdir $WORKINGDIR -p
#rm $WORKINGDIR/* -fr
#wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O $WORKINGDIR/master.zip
#unzip $WORKINGDIR/master.zip -d $WORKINGDIR
#mv $WORKINGDIR/openwrt-smartdns-master/* $WORKINGDIR/
#rmdir $WORKINGDIR/openwrt-smartdns-master
#rm $WORKINGDIR/master.zip
#
#LUCIBRANCH="master" #更换此变量
#WORKINGDIR="$(pwd)/feeds/luci/applications/luci-app-smartdns"
#mkdir $WORKINGDIR -p
#rm $WORKINGDIR/* -fr
#wget https://github.com/pymumu/luci-app-smartdns/archive/${LUCIBRANCH}.zip -O $WORKINGDIR/${LUCIBRANCH}.zip
#unzip $WORKINGDIR/${LUCIBRANCH}.zip -d $WORKINGDIR
#mv $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}/* $WORKINGDIR/
#rmdir $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}
#rm $WORKINGDIR/${LUCIBRANCH}.zip
