--track0:t,0,100,0,0.01
--dialog:制御点,local controlPoints="0,0,0,1,1,1";y逆転 /chk,local reverse = 1;
dofile("plugins/script/bezier_tools.lua")
local t = obj.track0
local cpointsstr = controlPoints
local rev = reverse

local function split(str, delim)
    -- Eliminate bad cases...
    if string.find(str, delim) == nil then
        return { str }
    end

    local result = {}
    local pat = "(.-)" .. delim .. "()"
    local lastPos
    for part, pos in string.gfind(str, pat) do
        table.insert(result, part)
        lastPos = pos
    end
    table.insert(result, string.sub(str, lastPos))
    return result
end
--ここからメイン
local points = split(cpointsstr,",")
t = t / 100
	local x,y = Bezier(t,unpack(points))
	y = rev == 1 and 1 - y or y
	obj.ox = x
	obj.oy = y