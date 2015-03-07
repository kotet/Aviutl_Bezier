--track0:x(time),0,100,0,0.01
--track1:開始値,-100000,100000,0,0.01
--track2:終了値,-100000,100000,0,0.01
--dialog:P1,local p1="0,1";P2,local p2="1,0";反映対象,local target="ox";
dofile("plugins/script/bezier_tools.lua")
local x = obj.track0
local startnum = obj.track1
local endnum = obj.track2

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
local function bisection(min,max,expected,margin,func)
	while (true) do
		local median = (min+max)/2
		local result = func(median)
		local difference = result - expected
		if math.abs(difference) < margin then
			return median
		elseif difference < 0 then
			min = median
		else
			max = median
		end
	end
end

--ここからメイン
x = x / 100
local p1x,p1y = unpack(split(p1,','))
local p2x,p2y = unpack(split(p2,','))
local result_t = bisection(0,1,x,0.00001,function(t)
		return Bezier(t,0,0,p1x,p1y,p2x,p2y,1,1)
	end)
local result_x,result_y = Bezier(result_t,0,0,p1x,p1y,p2x,p2y,1,1)
obj[target] = result_y * (endnum - startnum + 1) + startnum