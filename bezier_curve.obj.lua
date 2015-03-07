--track0:�n�_t,0,100,0,0.01
--track1:�I�_t,0,100,100,0.01
--track2:�_�T�C�Y,0,10000,1,0.01
--dialog:����_,local controlPoints="0,0,0,1,1,1";�`��_��,local numberOfPoints=1000;y�t�] /chk,local reverse = 1;�_�̐F /col,local color=0xffffff;�}�` /fig,local figureType="�~";
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
--�������烁�C��
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