-- initialization functions

function InitPump(pumpPart)
	local dir = pumpPart.direction
	local pos = pumpPart.position
	
	local actuator = game.createentity{name = "smart-pump-actuator", position = pos, direction = dir}
	pumpPart.destroy(); -- recreate to get sorting order good (so you can see the blue arrow)
	pumpPart = game.createentity{name = "smart-pump-pipe", position = pos, direction = dir}
	
	Insert(glob.allPumps, pos, actuator)

	actuator.destructible = false
	pumpPart.active = false
end

-- updating functions

function TickPump(actuator, tick)
	local pumpPart = GetEntityAt(actuator.position, "smart-pump-pipe")
	
	-- test changes
	local currentActive = testActuatorActivity(actuator)
	
	-- modify if changed
	if currentActive ~= pumpPart.active then
		pumpPart.active = currentActive
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
	Remove(glob.allPumps, actuator.position)
end
