
function InitCommon()
	if glob.allTanks == nil then glob.allTanks = {} end
	if glob.allPumps == nil then glob.allPumps = {} end
	if glob.allPoles == nil then glob.allPoles = {} end
	if glob.allBatteries == nil then glob.allBatteries = {} end
	VerifyVersionChanges()
end

function VerifyVersionChanges()

	-- go over all smart poles
	for _,ys in pairs(glob.allPoles) do
		for _,pole in pairs(ys) do
			if pole.valid then 
				local chestPart = GetEntityOfTypeAt(pole.position, "container")
				if chestPart ~= nil then chestPart.destroy() end
				pole.heldstack = nil
			end
		end
	end

	-- go over all smart pumps
	for _,ys in pairs(glob.allPumps) do
		for _,pump in pairs(ys) do
			if pump.valid then 
				local chestPart = GetEntityOfTypeAt(pump.position, "container")
				if chestPart ~= nil then chestPart.destroy() end
				pump.heldstack = nil
			end
		end
	end
	
	glob.lastTickHeld = nil

end

function Insert(array, pos, value)
	if array[pos.x] == nil then array[pos.x] = {} end
	array[pos.x][pos.y] = value
end

function Set(array, pos, value)
	array[pos.x][pos.y] = value
end

function Get(array, pos)
	if pos == nil or array[pos.x] == nil then return end
	return array[pos.x][pos.y]
end

function Remove(array, pos)
	if pos == nil or array[pos.x] == nil then return end
	local value = array[pos.x][pos.y]
	array[pos.x][pos.y] = nil
	local count = 0
	for _,_ in pairs(array[pos.x]) do count = count + 1 end
	if count == 0 then array[pos.x] = nil end
	return value
end

function Offset(pos, amount)
	return {x = pos.x + amount, y = pos.y + amount}
end

function IsVertical(entity)
	return entity.direction % 4 == 0
end

function GetEntityOfTypeAt(pos, typename)
	local t = game.findentitiesfiltered{area = {{pos.x - 0.1, pos.y - 0.1}, {pos.x + 0.1, pos.y + 0.1}}, type = typename}
	for _,v in pairs(t) do
		return v
	end
	return nil
end

function GetEntityAt(pos, entityname)
	local t = game.findentitiesfiltered{area = {{pos.x - 0.1, pos.y - 0.1}, {pos.x + 0.1, pos.y + 0.1}}, name = entityname}
	for _,v in pairs(t) do
		return v
	end
	return nil
end

function PrintPos(pos)
	Print("(" .. pos.x .. ", " .. pos.y .. ")")
end

function Print(text)
	game.players[1].print(text)
end

function testActuatorActivity(actuator)

	local rCondition = actuator.getcircuitcondition(0)
	local gCondition = actuator.getcircuitcondition(1)
	local lCondition = actuator.getcircuitcondition(2)
	local numNotNil = 0
	local numFulfilled = 0
	if rCondition ~= nil then
		numNotNil = numNotNil + 1
		if rCondition.fulfilled then numFulfilled = numFulfilled + 1 end
	end
	if gCondition ~= nil then
		numNotNil = numNotNil + 1
		if gCondition.fulfilled then numFulfilled = numFulfilled + 1 end
	end
	if lCondition ~= nil then
		numNotNil = numNotNil + 1
		if lCondition.fulfilled then numFulfilled = numFulfilled + 1 end
	end
	return numNotNil == numFulfilled
end
