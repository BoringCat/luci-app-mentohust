require("luci.sys")

m = Map("mentohust", translate("MentoHUST LOG"), translate("Log file:/tmp/mentohust.log"))

s = m:section(TypedSection, "mentohust", "")
s.addremove = false
s.anonymous = true

view_cfg = s:option(TextValue, "1", nil)
    view_cfg.rows = 25
    view_cfg.readonly = true
  
    function view_cfg.cfgvalue()  
        return nixio.fs.readfile("/tmp/mentohust.log") or ""  
    end  

return m
