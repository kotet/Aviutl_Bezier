--パーミッション、コンビネーション、二項定理からのベジェ
function permittion(a,b) --aPb
	local function _f(n,limit,i)
		if i == a - limit then
			return n
		else
			return _f(n*i,limit,i-1)
		end
	end
	return _f(1,b,a)
end

function combination(a,b) --aCb
	return permittion(a,b) / permittion(b,b)
end

function binomial(n) -- n=>2 (a+b)^n
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

function Bezier(t,...)--t,x0,y0,x1,y1...
	local cPoints = {}
	local args = {...}
	for i = 1,#args-1,2 do
		table.insert(cPoints,{x = args[i],y = args[i+1]})
	end
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