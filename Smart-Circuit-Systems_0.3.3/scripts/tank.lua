-- initialization functions

function InitTank(tank)

	local pipePart = game.createentity{name = "smart-tank-pipe", position = tank.position}
	
	Insert(glob.allTanks, tank.position, tank)
	
	pipePart.destructible = false
	tank.operable = false
		
end

-- updating functions

function TickTank(tank)
	local inv = tank.getinventory(1)
	local pipePart = GetEntityAt(tank.position, "smart-tank-pipe")
	if pipePart == nil then return end
	local storedfluid = pipePart.fluidbox[1]
	
	local newContents = {}
	if storedfluid ~= nil then
		
		local newAmount = math.floor((storedfluid.amount * 100) + 0.5)
		if newAmount > 0 then
			newContents["fluid-content"] = newAmount
		end
		local newTemp = math.floor((storedfluid.temperature * 10) + 0.5)
		if newTemp > 0 then
			newContents["fluid-temperature"] = newTemp
		end
	
	end
	ModifySensorInventory(inv, newContents)
end

-- Cleanup functions

function CleanupTank(tank)
	local pos = tank.position
	
	CleanupChest(tank)
	local pipePart = GetEntityAt(pos, "smart-tank-pipe")
	if pipePart ~= nil then pipePart.destroy() end
	
	Remove(glob.allTanks, pos)
end
