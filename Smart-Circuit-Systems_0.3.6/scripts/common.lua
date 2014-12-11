modEntities = {}

function InitCommon()
	
	if glob.allTanks == nil then glob.allTanks = {} else IterateEntities(glob.allTanks, LoadTank) end
	if glob.allPoles == nil then glob.allPoles = {} else IterateEntities(glob.allPoles, LoadPole) end
	if glob.allBatteries == nil then glob.allBatteries = {} else IterateEntities(glob.allBatteries, LoadBattery) end
	if glob.allActuators == nil then glob.allActuators = {} else IterateEntities(glob.allActuators, LoadActuator) end
	if glob.allSensors == nil then glob.allSensors = {} else IterateEntities(glob.allSensors, LoadSensor) end
	if glob.allCapacitors == nil then glob.allCapacitors = {} else IterateEntities(glob.allCapacitors, LoadCapacitor) end
	
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

function IterateEntities(array, EntityFunction)
	for _,ys in pairs(array) do
		for _,entity in pairs(ys) do
			if entity.valid then 
				EntityFunction(entity)
			end
		end
	end
end

function Offset(pos, amount)
	return {x = pos.x + amount, y = pos.y + amount}
end

function ModifySensorInventory(inv, newContents)
	-- remove all stacks not found in new contents, and modify all matching stacks
	for k,v in pairs(inv.getcontents()) do
		if newContents[k] == nil then
			inv.remove{name = k, count = v}
		else
			local difference = newContents[k] - v
			if difference > 0 then 
				inv.insert{name = k, count = difference}
			elseif difference < 0 then 
				inv.remove{name = k, count = -difference}
			end
			newContents[k] = nil
		end
	end
	
	-- add all new stacks
	for k,v in pairs(newContents) do
		inv.insert{name = k, count = v}
	end
end

function CleanupChest(chestEntity)
	ModifySensorInventory(chestEntity.getinventory(1), {})
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

function GetAdjacentPos(pos, dir, offset)
	if dir == 0 then 
		return {x = pos.x, y = pos.y + offset}
	elseif dir == 2 then 
		return {x = pos.x - offset, y = pos.y}
	elseif dir == 4 then 
		return {x = pos.x, y = pos.y - offset}
	else
		return {x = pos.x + offset, y = pos.y}
	end
end

function GetEntityInDirection(pos, dir)
	local adjPos = GetAdjacentPos(pos, dir, 1)
	local t = game.findentities{{adjPos.x - 0.1, adjPos.y - 0.1}, {adjPos.x + 0.1, adjPos.y + 0.1}}
	for _,v in pairs(t) do
		if v.destructible and v.minable and v.type ~= "item-entity" then
			return v
		end
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

function CleanupLamps(pos)
	local lamp = GetEntityAt(pos, "actuator-redlamp")
	if lamp == nil then lamp = GetEntityAt(pos, "actuator-greenlamp") end
	if lamp ~= nil then lamp.destroy() end
end
