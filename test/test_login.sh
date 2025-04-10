#!/bin/sh

# 测试脚本 - 用于测试校园网登录功能
# 使用方法: ./test_login.sh <用户名> <密码> [IP地址] [MAC地址]

# 检查参数
if [ $# -lt 2 ]; then
    echo "用法: $0 <用户名> <密码> [IP地址] [MAC地址]"
    exit 1
fi

# 获取参数
USERNAME="$1"
PASSWORD="$2"
IP="${3:-$(curl -s ip.sb)}"
MAC="${4:-$(cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address | sed 's/://g' 2>/dev/null || echo "60557167d7dd138a7ae4adaa682c3528832d21333493c982")}"

# 日志函数
log() {
    echo "$(date "+%Y-%m-%d %H:%M:%S") [test] $1"
}

log "开始测试校园网登录功能"
log "用户名: $USERNAME"
log "密码: $(echo "$PASSWORD" | sed 's/./*/g')"
log "IP地址: $IP"
log "MAC地址: $MAC"

# 构建登录URL
ENCODED_USERNAME=$(echo -n "$USERNAME" | sed 's/@/%40/g')
LOGIN_URL="http://10.17.8.18:801/eportal/portal/login?callback=dr1003&login_method=1&user_account=${ENCODED_USERNAME}&user_password=${PASSWORD}&wlan_user_ip=${IP}&wlan_user_mac=${MAC}&wlan_ac_ip=10.17.4.1&terminal_type=1&lang=zh-cn&v=8194&lang=zh"

log "登录URL: $LOGIN_URL"

# 发送登录请求
log "发送登录请求..."
RESPONSE=$(curl -s "$LOGIN_URL")

# 检查登录结果
if echo "$RESPONSE" | grep -q "success"; then
    log "登录成功!"
    exit 0
else
    log "登录失败: $RESPONSE"
    exit 1
fi