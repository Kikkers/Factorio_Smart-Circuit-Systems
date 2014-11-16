-- initialization functions

function InitActuator(actuator)
	local pos = actuator.position
	game.createentity{name = "actuator-greenlamp", position = pos}
	Insert(glob.allActuators, pos, actuator)
end

-- updating functions

function RotateActuator(actuator)
	local prevTargetEntity = GetEntityInDirection(actuator.position, actuator.direction)
	
	if prevTargetEntity ~= nil and actuator.force.name == actuator.force.name then
		-- change back to active in case the actuator had disabled it
		prevTargetEntity.active = true
	end
end

function TickActuator(actuator)
	if actuator.energy <= 0.0 then return end
	
	local pos = actuator.position
	local targetEntity = GetEntityInDirection(pos, actuator.direction)
	
	if targetEntity ~= nil and targetEntity.force.name == actuator.force.name then
	
		-- test changes
		local currentActive = testActuatorActivity(actuator)
		
		-- modify if changed
		if currentActive ~= targetEntity.active then
			targetEntity.active = currentActive
			CleanupLamps(pos)
			if currentActive then
				game.createentity{name = "actuator-greenlamp", position = pos}
			else
				game.createentity{name = "actuator-redlamp", position = pos}
			end
		end
	end
end

-- Cleanup functions

function CleanupActuator(actuator)
	CleanupLamps(actuator.position)
	Remove(glob.allActuators, actuator.position)
end
