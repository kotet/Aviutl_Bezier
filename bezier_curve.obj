--track0:始点t,0,100,0,0.01
--track1:終点t,0,100,100,0.01
--track2:点サイズ,0,10000,1,0.01
--dialog:制御点,local controlPoints="0,0,0,1,1,1";描画点数,local numberOfPoints=1000;y逆転 /chk,local reverse = 1;点の色 /col,local color=0xffffff;図形 /fig,local figureType="円";
dofile("plugins/script/bezier_tools.lua")
local startt = obj.track0
local endt = obj.track1
local figsiz = obj.track2
local cpointsstr = controlPoints
local numofp = numberOfPoints
local rev = reverse
local col = color
local fig = figureType

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
obj.load("figure",fig,col,figsiz)
endt,startt = endt/100,startt/100
if startt > endt then startt,endt = endt,startt end
for i=1,numofp do
	local t = startt + (i / numofp) * (endt - startt)
	local x,y = Bezier(t,unpack(points))
	y = rev == 1 and 1 - y or y
	obj.draw(x,y)
end