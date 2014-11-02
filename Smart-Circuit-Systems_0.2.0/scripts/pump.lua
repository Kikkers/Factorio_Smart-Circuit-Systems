-- initialization functions

function InitPump(pumpPart)
	local dir = pumpPart.direction
	local pos = pumpPart.position
	
	local actuator = game.createentity{name = "smart-pump-actuator", position = pos, direction = dir}
	local chestPart = game.createentity{name = "actuator-chest", position = pos}
	pumpPart.destroy(); -- recreate to get sorting order good (so you can see the blue arrow)
	pumpPart = game.createentity{name = "smart-pump-pipe", position = pos, direction = dir}
	
	Insert(glob.lastTickHeld, pos, -actuatorTickInterval)
	Insert(glob.allPumps, pos, actuator)

	chestPart.insert{name = "actuator-functional-unit", count = expectedSensorUnits}
	chestPart.operable = false
	chestPart.destructible = false
	actuator.destructible = false
	pumpPart.active = false
end

-- updating functions

function TickPump(actuator, tick)
	local pumpPart = GetEntityAt(actuator.position, "smart-pump-pipe")
	local chestPart = GetEntityAt(actuator.position, "actuator-chest")
	
	-- test changes
	local currentActive = testActuatorActivity(actuator, chestPart, tick)
	
	-- modify if changed
	if currentActive ~= pumpPart.active then
		pumpPart.active = currentActive
		--if pumpPart.active then Print("smart pump active") else Print("smart pump inactive") end
	end
end

-- Cleanup functions

function CleanupPump(pumpPart)
	local actuator = GetEntityAt(pumpPart.position, "smart-pump-actuator")
	if actuator ~= nil then
		CleanupPumpMisc(actuator)
		actuator.destroy()
	end
end

function CleanupPumpActuator(actuator)
	CleanupPumpMisc(actuator)
	local pumpPart = GetEntityAt(actuator.position, "smart-pump-pipe")
	if pumpPart ~= nil then pumpPart.destroy() end
end

function CleanupPumpMisc(actuator)
	local pos = actuator.position
	local chestPart = GetEntityAt(pos, "actuator-chest")
	if chestPart ~= nil then chestPart.destroy() end
	actuator.heldstack = nil

	Remove(glob.lastTickHeld, pos)
	Remove(glob.allPumps, pos)
end
