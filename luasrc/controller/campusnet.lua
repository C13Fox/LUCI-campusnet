module("luci.controller.campusnet", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/campusnet") then
		return
	end

	entry({"admin", "services", "campusnet"}, cbi("campusnet"), _("校园网自动登录"), 100).dependent = true
end