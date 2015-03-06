--パーミッション、コンビネーション、二項定理からのベジェ
local function permittion(a,b) --aPb
	local function f(n,limit,i)
		if i == a - limit then
			return n
		else
			return f(n*i,limit,i-1)
		end
	end
	return f(1,b,a)
end

local function combination(a,b) --aCb
	return permittion(a,b) / permittion(b,b)
end

local function binomial(n) -- n=>2 (a+b)^n
	local isEven = n%2 == 0 and true or false
	local buftable = {1,n}
	local max = isEven and n/2 or (n-1)/2
	for r = 2,max do
		table.insert(buftable,combination(n,r))
	end
	local start = isEven and #buftable - 1 or #buftable
	for i = start,1,-1 do
		table.insert(buftable,buftable[i])
	end
	return buftable
end

local function Bezier(t,...)--t,x1,y1,x2,y2... x0,y0=0,0 xn,yn=1,1
	if t == 0 then return 0,0 end
	if t == 1 then return 1,1 end
	local cPoints = {}
	local args = {...}
	table.insert(cPoints,{x = 0,y = 0})
	for i = 1,#args-1,2 do
		table.insert(cPoints,{x = args[i],y = args[i+1]})
	end
	table.insert(cPoints,{x = 1,y = 1})
	local dementions = #cPoints -1
	local coTable = binomial(dementions)
	local x = 0
	local y = 0
	for i = 1,#coTable do
		x = x + (coTable[i] * ((1 - t) ^ (#coTable - i)) * (t ^ (i-1)) * cPoints[i].x)
		y = y + (coTable[i] * ((1 - t) ^ (#coTable - i)) * (t ^ (i-1)) * cPoints[i].y)
	end
	return x,y
end