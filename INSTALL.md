# 校园网自动登录插件安装指南

## 编译方法

### 方法一：作为OpenWrt源码的一部分编译

1. 将插件目录复制到OpenWrt源码的`package/luci-app-campusnet`目录下

   ```bash
   git clone https://github.com/openwrt/openwrt.git
   cd openwrt
   mkdir -p package/luci-app-campusnet
   cp -r /path/to/luci-app-campusnet/* package/luci-app-campusnet/
   ```

2. 选择要编译的软件包

   ```bash
   make menuconfig
   ```

   在`LuCI -> Applications`中找到并选择`luci-app-campusnet`

3. 编译插件

   ```bash
   make package/luci-app-campusnet/compile V=s
   ```

### 方法二：单独编译IPK包

1. 安装OpenWrt SDK

   ```bash
   # 下载适合你的设备的SDK
   wget https://downloads.openwrt.org/releases/21.02.3/targets/x86/64/openwrt-sdk-21.02.3-x86-64_gcc-8.4.0_musl.Linux-x86_64.tar.xz
   tar -xJf openwrt-sdk-*.tar.xz
   cd openwrt-sdk-*
   ```

2. 准备编译环境

   ```bash
   ./scripts/feeds update -a
   ./scripts/feeds install -a
   ```

3. 复制插件源码

   ```bash
   mkdir -p package/luci-app-campusnet
   cp -r /path/to/luci-app-campusnet/* package/luci-app-campusnet/
   ```

4. 编译

   ```bash
   make package/luci-app-campusnet/compile V=s
   ```

5. 编译完成后，IPK文件将位于`bin/packages/*/base/`目录下

## 安装方法

1. 将编译好的IPK文件上传到路由器

   ```bash
   scp bin/packages/*/base/luci-app-campusnet_*.ipk root@192.168.1.1:/tmp/
   ```

2. 登录路由器安装

   ```bash
   ssh root@192.168.1.1
   cd /tmp
   opkg install luci-app-campusnet_*.ipk
   ```

3. 重启LUCI

   ```bash
   /etc/init.d/uhttpd restart
   ```

4. 在浏览器中访问路由器管理界面，在"服务"菜单下找到"校园网自动登录"选项