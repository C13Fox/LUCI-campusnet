local m, s, o

m = Map("campusnet", translate("校园网自动登录"), translate("自动检测网络环境并登录校园网"))

s = m:section(TypedSection, "campusnet", translate("基本设置"))
s.anonymous = true

o = s:option(Flag, "enabled", translate("启用"))
o.rmempty = false

o = s:option(Value, "username", translate("用户名"))
o.rmempty = false

o = s:option(Value, "password", translate("密码"))
o.password = true
o.rmempty = false

o = s:option(Value, "ip", translate("IP地址"), translate("留空将自动获取"))
o.rmempty = true

o = s:option(Value, "mac", translate("MAC地址"), translate("留空将自动获取"))
o.rmempty = true

o = s:option(Value, "interval", translate("检测间隔（秒）"))
o.default = 60
o.rmempty = false
o.datatype = "uinteger"

return m