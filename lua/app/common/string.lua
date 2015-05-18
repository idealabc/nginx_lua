

local ok, new_tab = pcall(require, "table.new")
if not ok then
	new_tab = function (narr, nrec) return {} end
end


local _M = new_tab(0, 16)

--分割字符串
function _M.split(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={} ; i=1
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                t[i] = str
                --ngx.say(str)
                i = i + 1
        end
        return t
end


return _M