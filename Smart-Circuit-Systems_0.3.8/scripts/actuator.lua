-- initialization functions

function InitActuator(actuator)
	local pos = actuator.position
	game.createentity{name = "actuator-greenlamp", position = pos, force = game.forces.player}
	
	Insert(glob.allActuators, pos, actuator)
	LoadActuator(actuator)
end

function LoadActuator(actuator)
	local pos = actuator.position
	local effectTarget
	local targetPos
	effectTarget, targetPos = GetTarget(actuator)
	
	local targetState = false
	local ticksSinceMove = 999
	local lamp = GetEntityAt(pos, "actuator-redlamp")
	if lamp == nil then
		lamp = GetEntityAt(pos, "actuator-greenlamp")
		targetState = true
		if lamp == nil then
			
		end
	end
	
	if (effectTarget ~= nil and effectTarget.valid) and (effectTarget.type == "cargo-wagon" or effectTarget.type == "locomotive") then
	  ticksSinceMove=0
	end
	
	if lamp == nil then
		Print("failed restoring omni actuator at {" .. pos.x .. ", " .. pos.y .. "}")
		Remove(glob.allActuators, pos, actuator)
	else
		local data = {}
		data[1] = TickActuator
		data[2] = actuator
		data[3] = effectTarget
		data[4] = targetPos
		data[5] = lamp
		data[6] = targetState
		data[7] = ticksSinceMove
		Insert(modEntities, pos, data)
	end
end

-- updating functions

function GetTarget(actuator)
	local effectTarget = GetEntityInDirection(actuator.position, actuator.direction)
	local targetPos
	if effectTarget ~= nil then
		if effectTarget.force.name ~= actuator.force.name or effectTarget.valid == false then
			effectTarget = nil
		else
			-- create a copy, because we need to detect movement
			targetPos = {x = effectTarget.position.x, y = effectTarget.position.y} 
		end
	end
	return effectTarget, targetPos
end

function RotateActuator(actuator)
	local data = Get(modEntities, actuator.position)
	
	-- might need to toggle the previous item
	if data[6] == false and data[3] ~= nil and data[3].valid then
		data[6] = true
		EntityActivityTest(data)
		data[6] = false
	end
	
	data[3], data[4] = GetTarget(data[2])
	EntityActivityTest(data)
end

function SwapState(data)
	data[5].destroy()
	if data[6] then
		data[6] = false
		data[5] = game.createentity{name = "actuator-redlamp", position = data[2].position, force = game.forces.player}
	else
		data[6] = true
		data[5] = game.createentity{name = "actuator-greenlamp", position = data[2].position, force = game.forces.player}
	end
end

function TickActuator(data)
	if data[2].energy <= 0.0 then return end
	
	local actuatorState = testActuatorActivity(data[2])
	local stateChanged = false
	if actuatorState ~= data[6] then
		SwapState(data)
		stateChanged = true
	end
	
	-- test changes in target
	-- rails don't activate and if they get detected they prevent detection of trains
	if data[3] == nil or data[3].valid == false or data[3].name=="straight-rail" or data[3].name=="curved-rail" then
		data[3], data[4] = GetTarget(data[2])
		stateChanged=true -- may have new target, without the check a new target may be ignored until state change
	elseif data[3].position.x ~= data[4].x or data[3].position.y ~= data[4].y then
		-- movement detected
		local newTarget 
		local newPosition
		newTarget, newPosition = GetTarget(data[2])
		
		if newTarget ~= data[3] then
			-- also new object, check old object to maybe reset
			EntityActivityTest(data)
			data[3] = newTarget
		end
		data[4] = newPosition
		if (data[3] ~= nil and data[3].valid) and (data[3].type == "cargo-wagon" or data[3].type == "locomotive") then
		    data[7] = -1 --increased immediately
		else data[7]=999
		end
		
	end
	if data[7] < 10 then 
	    data[7] = data[7]+1
	    --train may be stopping
	    stateChanged=true
	end
	  
	if stateChanged then
		EntityActivityTest(data)
	end
end

function EntityActivityTest(data)
	if data[3] == nil or not data[3].valid then return end
	--if data[3] == nil then return end
	
	local effectTarget = data[3]
		
	-- see if change is relevant
	if effectTarget.type == "cargo-wagon" or effectTarget.type == "locomotive" then
	  --don't try and shift moving trains to manual mode because they will stop in the wrong place
		if data[6] == effectTarget.train.manualmode and effectTarget.train.speed < 0.00001 then 
			effectTarget.train.manualmode = not data[6]
		end
	else
		if data[6] ~= effectTarget.active then
			effectTarget.active = data[6]
		end
	end
end

-- Cleanup functions

function CleanupActuator(actuator)
	local pos = actuator.position
	local data = Get(modEntities, pos)
	data[6] = true
	EntityActivityTest(data)
	
	CleanupLamps(pos)
	Remove(glob.allActuators, pos)
	Remove(modEntities, pos)
end
