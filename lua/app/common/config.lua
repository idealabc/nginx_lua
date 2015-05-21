-- config Singleton
Singleton = {};
local _instance;
function Singleton.getInstance()
    if not _instance then
        _instance = Singleton;
    end
    --'any new methods would be added to the _instance object like this'
    _instance.getType = function()
        return 'singleton';
    end
    return _instance
end

function Singleton:new()
    print('Singleton cannot be instantiated - use getInstance() instead');
end
-- redis config

local _redis;
function Singleton.redisInit()
	--if not _redis then
		ngx.say("init redis")
    	local redis = require "resty.redis"
        _redis = redis:new()
	    _redis:set_timeout(1000) -- 1 sec
        local ok, err = _redis:connect("127.0.0.1", 6379)
        if not ok then
        	ngx.say("failed to connect: ", err)
            return
        end
    --end
	return _redis
end


return Singleton.getInstance()
