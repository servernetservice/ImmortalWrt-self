#!/bin/bash

# 1. 强制分区大小 (内核64M, 根分区1280M，确保安装后剩余约1G)
sed -i 's/CONFIG_TARGET_KERNEL_PARTSIZE=16/CONFIG_TARGET_KERNEL_PARTSIZE=64/g' .config
sed -i 's/CONFIG_TARGET_ROOTFS_PARTSIZE=160/CONFIG_TARGET_ROOTFS_PARTSIZE=1280/g' .config

# 2. 预设默认 IP (可选，默认为 192.168.1.1)
# sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 3. 修正 MosDNS 编译过程中可能的路径错误
find ./ | grep Makefile | xargs sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' 2>/dev/null

# 4. 移除系统默认的 AdGuardHome 以防止与编译包冲突 (保险措施)
rm -rf feeds/luci/applications/luci-app-adguardhome
