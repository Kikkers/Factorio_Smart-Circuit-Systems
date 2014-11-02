-- initialization functions

function InitPole(actuator)
	local pos = actuator.position
	local chestPart = game.createentity{name = "actuator-chest", position = pos}
	
	local poleA
	local poleB
	if IsVertical(actuator) then
		game.createentity{name = "smart-pole-deco-vertical", position = pos}
		poleA = game.createentity{name = "south-node", position = {x = pos.x, y = pos.y + 1}}
		poleB = game.createentity{name = "north-node", position = {x = pos.x, y = pos.y - 1}}
	else
		game.createentity{name = "smart-pole-deco-horizontal", position = pos}
		poleA = game.createentity{name = "east-node", position = {x = pos.x + 1, y = pos.y}}
		poleB = game.createentity{name = "west-node", position = {x = pos.x - 1, y = pos.y}}
	end
	-- start out disconnected
	poleA.disconnectneighbour()
	poleB.disconnectneighbour()
	
	-- use position indexing, as we need a reliable way to find the right actuator from a pole
	Insert(glob.allPoles, pos, actuator)
	Insert(glob.lastTickHeld, pos, -actuatorTickInterval)
	
	chestPart.insert{name = "actuator-functional-unit", count = expectedSensorUnits}
	chestPart.operable = false
	chestPart.destructible = false
	poleA.destructible = false
	poleB.destructible = false
end

-- updating functions

function TickPole(actuator, tick)
	local chestPart = GetEntityAt(actuator.position, "actuator-chest")
	if chestPart == nil then return end
	
	local activeIndicator = GetEntityAt(actuator.position, "actuator-active-indicator")
	
	-- test changes
	local currentActive = testActuatorActivity(actuator, chestPart, tick)
	
	-- modify if changed
	if currentActive then
		if activeIndicator == nil then
			local poleA, poleB = GetPolesFromActuatorPos(actuator.position)
			-- connect all
			local c = poleA.connectneighbour(poleB)
			local r = poleA.connectneighbour(poleB, 0)
			local g = poleA.connectneighbour(poleB, 1)
		
			game.createentity{name = "actuator-active-indicator", position = actuator.position}
		end
	else
		if activeIndicator ~= nil then
			local poleA, poleB = GetPolesFromActuatorPos(actuator.position)
			-- disconnect all
			local disconnected = DisconnectPole(poleA)
			-- reconnect all except poleB
			for _,n in pairs(disconnected) do
				if n[1].position.x ~= poleB.position.x or n[1].position.y ~= poleB.position.y then
					if n[2] then poleA.connectneighbour(n[1]) end
					if n[3] then poleA.connectneighbour(n[1], 0) end
					if n[4] then poleA.connectneighbour(n[1], 1) end
				end
			end
			activeIndicator.destroy()
		end
	end
end

function GetPolesFromActuatorPos(pos)
	local poleA
	local poleB
	local actuator = Get(glob.allPoles, pos)
	if actuator ~= nil then
		if IsVertical(Get(glob.allPoles, pos)) then 
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
		actuator = Get(glob.allPoles, {x = pos.x + 1, y = pos.y})
	elseif pole.name == "east-node" then
		actuator = Get(glob.allPoles, {x = pos.x - 1, y = pos.y})
	elseif pole.name == "north-node" then
		actuator = Get(glob.allPoles, {x = pos.x, y = pos.y - 1})
	elseif pole.name == "south-node" then
		actuator = Get(glob.allPoles, {x = pos.x, y = pos.y + 1})
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
	
	local chestPart = GetEntityAt(pos, "actuator-chest")
	if chestPart ~= nil then
		chestPart.getinventory(1).clear()
		chestPart.destroy()
	end
	
	local activeIndicator = GetEntityAt(pos, "actuator-active-indicator")
	if activeIndicator ~= nil then activeIndicator.destroy() end
	
	actuator.heldstack = nil
	Remove(glob.lastTickHeld, pos)
	Remove(glob.allPoles, pos)
end
