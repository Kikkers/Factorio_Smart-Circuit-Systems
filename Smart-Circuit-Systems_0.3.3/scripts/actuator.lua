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
	
		EntityActivityTest(actuator, targetEntity)
	else
		local lamp = GetEntityAt(pos, "actuator-redlamp")
		if lamp ~= nil then 
			lamp.destroy()
			game.createentity{name = "actuator-greenlamp", position = pos}
		end
	end
end

function EntityActivityTest(actuator, targetEntity)
	local pos = actuator.position

	-- test changes
	local actuatorState = testActuatorActivity(actuator)
		
	-- see if change is relevant
	local doToggle = false
	if targetEntity.type == "cargo-wagon" or targetEntity.type == "locomotive" then
		if actuatorState == targetEntity.train.manualmode then
			if actuatorState then targetEntity.train.manualmode = false else targetEntity.train.manualmode = true end
			doToggle = true
		end
	else
		if actuatorState ~= targetEntity.active then
			targetEntity.active = actuatorState
			doToggle = true
		end
	end
	
	-- modify if changed
	if doToggle then
		CleanupLamps(pos)
		if actuatorState then
			game.createentity{name = "actuator-greenlamp", position = pos}
		else
			game.createentity{name = "actuator-redlamp", position = pos}
		end
	end
end

-- Cleanup functions

function CleanupActuator(actuator)
	local pos = actuator.position
	CleanupLamps(pos)
	Remove(glob.allActuators, pos)
end
