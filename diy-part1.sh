#!/bin/bash
# 添加 Passwall 及其依赖源
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main' >> feeds.conf.default

# 添加 MosDNS 源 (ImmortalWrt 官方库通常已有，若需特定版本可添加)
# echo 'src-git mosdns https://github.com/Iinexus/luci-app-mosdns.git;master' >> feeds.conf.default
