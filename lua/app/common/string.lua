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

--HTML字符串过滤
-- from  kernelsauce/turbo
_M.escape  = function(s)
    return (string.gsub(s, "[}{\">/<'&]", {
        ["&"] = "&amp;",
        ["<"] = "&lt;",
        [">"] = "&gt;",
        ['"'] = "&quot;",
        ["'"] = "&#039;",
        ["/"] = "&#047;"
    }))
end
--HTML字符串还原
-- from  lapis
local html_unescape_entities = { 
  		['&amp;'] = '&',
  		['&lt;'] = '<',
  		['&gt;'] = '>',
  		['&quot;'] = '"',
 		["&#039;"] = "'",
  		["&#047;"] = "/"
	}
_M.unescape  = function(text)
  	return (text:gsub("(&[^&]-;)", function(enc)
    local decoded = html_unescape_entities[enc]
    if decoded then
      return decoded
    else
      return enc
    end
  end))
end
-- 去掉空格
-- from  kernelsauce/turbo
function _M.trim(s)
    -- from PiL2 20.4
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end
-- 去掉左空格
-- from  kernelsauce/turbo
function _M.ltrim(s)
    return (s:gsub("^%s*", ""))
end
-- 去掉右空格
-- from  kernelsauce/turbo
function _M.rtrim(s)
    local n = #s
    while n > 0 and s:find("^%s", n) do n = n - 1 end
    return s:sub(1, n)
end
return _M