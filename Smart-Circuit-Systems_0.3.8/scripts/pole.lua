-- initialization functions

function InitPole(actuator, event)
	local pos = actuator.position
	
	local poleA
	local poleB
	if IsVertical(actuator) then
		game.createentity{name = "smart-pole-deco-vertical", position = pos, force = event.player.force}
		poleA = game.createentity{name = "south-node", position = {x = pos.x, y = pos.y + 1}, force = game.forces.player}
		poleB = game.createentity{name = "north-node", position = {x = pos.x, y = pos.y - 1}, force = game.forces.player}
	else
		game.createentity{name = "smart-pole-deco-horizontal", position = pos, force = game.forces.player}
		poleA = game.createentity{name = "east-node", position = {x = pos.x + 1, y = pos.y}, force = game.forces.player}
		poleB = game.createentity{name = "west-node", position = {x = pos.x - 1, y = pos.y}, force = game.forces.player}
	end
	-- start out disconnected
	poleA.disconnectneighbour()
	poleB.disconnectneighbour()
	poleA.destructible = false
	poleB.destructible = false
	
	Insert(glob.allPoles, pos, actuator)
	LoadPole(actuator)
end

function LoadPole(actuator)
	local pos = actuator.position
	
	-- remove redundant lamps, migration code
	local lamp = GetEntityAt(pos, "actuator-redlamp")
	if lamp == nil then lamp = GetEntityAt(pos, "actuator-greenlamp") end
	if lamp ~= nil then lamp.destroy() end
	
	local data = {}
	data[1] = LoadPoleFinish
	data[2] = actuator
	Insert(modEntities, pos, data)
	LoadPoleFinish(data)
end

-- extra function to handle case where poles are not yet findable (not sure if needed anymore, but it doesn't seem to crash)
function LoadPoleFinish(data)
	local pos = data[2].position
	data[3], data[4] = GetPolesFromActuatorPos(pos)
	
	if data[3] ~= nil and data[4] ~= nil then
		-- find current state
		data[5] = false
		for _,n in pairs(data[3].neighbours) do
			if n.position.x == data[4].position.x and n.position.y == data[4].position.y then
				data[5] = true
				break
			end
		end
		
		data[1] = TickPole
	end
end

-- updating functions

function RotatePole(pole)
	pole.direction = (pole.direction + 6) % 8 -- basically a fuck you to any rotation request
end

function TickPole(data)
	if data[2].energy <= 0.0 then return end

	-- test changes
	local currentActive = testActuatorActivity(data[2])
	
	-- modify if changed
	if currentActive ~= data[5] then
		data[5] = currentActive
		if currentActive then
			-- connect
			data[3].connectneighbour(data[4]) -- copper
			data[3].connectneighbour(data[4], 0) -- red
			data[3].connectneighbour(data[4], 1) -- green
		else
			-- disconnect all from poleA
			local disconnected = DisconnectPole(data[3])
			-- reconnect all except poleB
			for _,n in pairs(disconnected) do
				if n[1].position.x ~= data[4].position.x or n[1].position.y ~= data[4].position.y then
					if n[2] then data[3].connectneighbour(n[1]) end
					if n[3] then data[3].connectneighbour(n[1], 0) end
					if n[4] then data[3].connectneighbour(n[1], 1) end
				end
			end
		end
	end
end

function GetPolesFromActuatorPos(pos)
	local poleA
	local poleB
	local actuator = Get(glob.allPoles, pos)
	if actuator ~= nil then
		if IsVertical(actuator) then 
			poleA = GetEntityAt({x=pos.x, y=pos.y+1}, "south-node")
			poleB = GetEntityAt({x=pos.x, y=pos.y-1}, "north-node")
		else                                          
			poleA = GetEntityAt({x=pos.x+1, y=pos.y}, "east-node")
			poleB = GetEntityAt({x=pos.x-1, y=pos.y}, "west-node")
		end
	end
	return poleA, poleB
end

function DisconnectPole(pole)
	local allDisconnected = {}
	local num = 0
	for _,n in pairs(pole.neighbours) do
		local singleDisconnected = {n}
		table.insert(singleDisconnected, pole.connectneighbour(n) == false)
		table.insert(singleDisconnected, pole.connectneighbour(n, 0) == false)
		table.insert(singleDisconnected, pole.connectneighbour(n, 1) == false)
		table.insert(allDisconnected, singleDisconnected)
		num = num + 1
	end
	
	pole.disconnectneighbour()
	pole.disconnectneighbour(0)
	pole.disconnectneighbour(1)

	return allDisconnected
end

-- Cleanup functions

function CleanupPoleNode(pole)
	local actuator = GetActuatorFromPole(pole)
	CleanupPole(actuator)
	actuator.destroy()
end

function GetActuatorFromPole(pole)
	local pos = pole.position
	local actuator
	if pole.name == "west-node" then
		actuator = GetEntityAt({x = pos.x + 1, y = pos.y}, "pole-actuator")
	elseif pole.name == "east-node" then
		actuator = GetEntityAt({x = pos.x - 1, y = pos.y}, "pole-actuator")
	elseif pole.name == "north-node" then
		actuator = GetEntityAt({x = pos.x, y = pos.y + 1}, "pole-actuator")
	elseif pole.name == "south-node" then
		actuator = GetEntityAt({x = pos.x, y = pos.y - 1}, "pole-actuator")
	end
	return actuator
end

function CleanupPole(actuator)
	local pos = actuator.position
	local poleA
	local poleB
	poleA, poleB = GetPolesFromActuatorPos(pos)
	if poleA ~= nil then poleA.destroy() end
	if poleB ~= nil then poleB.destroy() end
	
	local deco = GetEntityAt(pos, "smart-pole-deco-vertical")
	if deco == nil then deco = GetEntityAt(pos, "smart-pole-deco-horizontal") end
	if deco ~= nil then deco.destroy() end
	
	Remove(glob.allPoles, pos)
	Remove(modEntities, pos)
end
