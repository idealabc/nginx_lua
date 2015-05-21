local _M = {}
local config  = {['default']={
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379},
    	{['ip']='127.0.0.1', ['port']=6379}

    }
}
local _redis;
function _M.init(index)
		local k = index % 16
		local ip = config.default[k].ip;
		local port = config.default[k].port;
		--ngx.say("init redis"..index.."-"..ip.."-"..port)
    	local redis = require "resty.redis"
        _redis = redis:new()
	    _redis:set_timeout(1000) -- 1 sec
        local ok, err = _redis:connect(ip, port)
        if not ok then
        	ngx.say("failed to connect: ", err)
            return
        end
	return _redis
end

function _M.close()
	_M.redis:close()
end

return _M;

--[[ 


local red = require "app.common.redis".init(18)
	local   ok, err = red:set("dog", "an animal")
    if not ok then
    	ngx.say("failed to set dog: ", err)
        return
    end
    
	red:close();
	ngx.say(ok)
	
--]]