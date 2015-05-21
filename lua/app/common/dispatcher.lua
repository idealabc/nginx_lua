--
--require = require"app.common.require".require 

local str = require "app.common.string"
local ok, new_tab = pcall(require, "table.new")
if not ok then
new_tab = function (narr, nrec) return {} end
end


local _M = new_tab(0, 16)
local cIndex = 2;
local mIndex = 3;
function _M.router()
    local path = ngx.var.request_uri;
    local pos = string.find(path, "?")
    if pos then
    	path = string.sub(path,1,pos-1)
    end
    local t =str.split(path,"/")
    if t then
    	local ctrlName = t[cIndex]
    	local callName = t[mIndex]
    	 
    	if ctrlName then
    		local ctrl =  require ("app.controller."..ctrlName)
    		if ctrl and callName then 
    			local call =  ctrl[callName]()
    		end
    	end
    end
    --ngx.say(path) 
end

_M.router()
return _M
