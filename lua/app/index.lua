--[[
	
--]]            
--https://github.com/openresty/lua-nginx-module/issues/208
require = require"app.common.require".require 
--ngx.say("hello!")
local ok, dispatcher  = require "app.common.dispatcher"

--local ok, dispatcher  = pcall(require, "app.test.nginx")
--ngx.exit(ngx.HTTP_OK)



--local redis =  require "app.controller.user"
            
