-- initialization functions

function InitPole(actuator)
	local pos = actuator.position
	
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
	
	game.createentity{name = "actuator-redlamp", position = pos}
	
	-- use position indexing, as we need a reliable way to find the right actuator from a pole
	Insert(glob.allPoles, pos, actuator)
	
	poleA.destructible = false
	poleB.destructible = false
end

-- updating functions

function RotatePole(pole)
	pole.direction = (pole.direction + 6) % 8 -- basically a fuck you to any rotation request
end

function TickPole(actuator)
	if actuator.energy <= 0.0 then return end

	local pos = actuator.position
	local activeIndicator = GetEntityAt(pos, "actuator-greenlamp")
	
	-- test changes
	local currentActive = testActuatorActivity(actuator)
	
	-- modify if changed
	if currentActive then
		if activeIndicator == nil then
			
			local poleA, poleB = GetPolesFromActuatorPos(pos)
			if poleA ~= nil and poleB ~= nil then
				-- connect all
				local c = poleA.connectneighbour(poleB)
				local r = poleA.connectneighbour(poleB, 0)
				local g = poleA.connectneighbour(poleB, 1)
			
			CleanupLamps(pos)
			game.createentity{name = "actuator-greenlamp", position = pos}
			end
		end
	else
		if activeIndicator ~= nil then
			CleanupLamps(pos)
			game.createentity{name = "actuator-redlamp", position = pos}
			
			local poleA, poleB = GetPolesFromActuatorPos(pos)
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
	
	CleanupLamps(pos)
	Remove(glob.allPoles, pos)
end
