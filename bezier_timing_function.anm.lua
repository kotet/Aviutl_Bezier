--track0:t,0,100,0,0.01
--track1:開始値,-100000,100000,0,0.01
--track1:終了値,-100000,100000,0,0.01
--dialog:P1,local p0="0,1";P2,local p1="1,0";反映対象,local target="ox";
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