# 校园网自动登录插件 (luci-app-campusnet)

这是一个OpenWrt LUCI插件，用于自动登录校园网并检测网络环境，在网络断开时自动重新登录。

## 功能特点

- 自动检测网络状态
- 自动登录校园网
- 可配置的用户名和密码
- 定时检测网络连接并自动重连
- 简洁的LUCI界面
- 支持手动测试登录功能
- 网络状态实时监控

## 安装方法

1. 将插件上传到OpenWrt设备
   ```
   scp -r luci-app-campusnet root@192.168.1.1:/tmp/
   ```

2. 登录到OpenWrt设备
   ```
   ssh root@192.168.1.1
   ```

3. 安装插件
   ```
   cd /tmp/
   opkg install luci-app-campusnet_*.ipk
   ```

4. 重启LUCI
   ```
   /etc/init.d/uhttpd restart
   ```

## 使用方法

1. 在LUCI界面中找到"服务" -> "校园网自动登录"选项
2. 配置您的校园网账号和密码
3. 启用自动登录功能
4. 保存并应用设置

## 命令行工具

插件提供了几个命令行工具，方便调试和测试：

- `/usr/bin/campusnet-login` - 手动测试登录功能
- `/usr/bin/campusnet-status` - 显示当前网络状态和配置信息

## 技术细节

插件使用curl发送HTTP请求进行登录，并通过定期检测网络连接状态来确定是否需要重新登录。登录URL格式如下：

```
http://10.17.8.18:801/eportal/portal/login?callback=dr1003&login_method=1&user_account=USERNAME&user_password=PASSWORD&wlan_user_ip=IP&wlan_user_mac=MAC&wlan_ac_ip=10.17.4.1&terminal_type=1&lang=zh-cn&v=8194&lang=zh
```

## 故障排除

如果遇到问题，请尝试以下步骤：

1. 检查配置是否正确
2. 运行 `/usr/bin/campusnet-status` 查看当前状态
3. 尝试手动登录 `/usr/bin/campusnet-login`
4. 查看系统日志 `logread | grep campusnet`

## 开发者信息

本插件基于OpenWrt LUCI框架开发，使用Shell脚本和Lua语言。