--[[
	https://github.com/openresty/lua-nginx-module/issues/208
--]]            
require = require"app.common.require".require 
--local ok, dispatcher  = require "app.common.dispatcher"
local s = require "app.common.string"

ngx.say(s.unescape("1&amp;2"))

ngx.say(s.escape("1'2"))

--ngx.say(s._unescape(s._escape("1&2")))