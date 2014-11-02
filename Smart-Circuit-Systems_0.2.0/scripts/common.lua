
actuatorTickInterval = 4
expectedSensorUnits = 900

function initCommon()
	if glob.allTanks == nil then glob.allTanks = {} end
	if glob.allPumps == nil then glob.allPumps = {} end
	if glob.allPoles == nil then glob.allPoles = {} end
	if glob.allBatteries == nil then glob.allBatteries = {} end
	if glob.lastTickHeld == nil then glob.lastTickHeld = {} end
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

function GetEntityAt(pos, entityname)
	local t = game.findentitiesfiltered{area = {{pos.x - 0.1, pos.y - 0.1}, {pos.x + 0.1, pos.y + 0.1}}, name = entityname}
	for k,v in pairs(t) do
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

function testActuatorActivity(actuator, chest, tick)

	if actuator.heldentity == nil then
	
		-- notify if unknown inserters removed chest contents
		local storedSensorUnits = chest.getinventory(1).getitemcount("actuator-functional-unit")
		if storedSensorUnits ~= expectedSensorUnits then
			Print("Warning: actuator functional units have been removed from an actuator. The items will be replaced.")
			chest.insert{name = "actuator-functional-unit", count = (expectedSensorUnits - storedSensorUnits)}
		end
		
		local elapsedSinceHeld = tick - Get(glob.lastTickHeld, actuator.position)
		if elapsedSinceHeld > actuatorTickInterval then -- slight delay for the time the actuator (inserter) does not hold an item, but is still active
			return false
		else
			return true
		end
		
	elseif actuator.energy == 0 then
		return false
	else
		Set(glob.lastTickHeld, actuator.position, tick)
		return true
	end
end
