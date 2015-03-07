--track0:t,0,100,0,0.01
--dialog:êßå‰ì_,local controlPoints="0,0,0,1,1,1";yãtì] /chk,local reverse = 1;
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
--Ç±Ç±Ç©ÇÁÉÅÉCÉì
local points = split(cpointsstr,",")
t = t / 100
	local x,y = Bezier(t,unpack(points))
	y = rev == 1 and 1 - y or y
	obj.ox = x
	obj.oy = y