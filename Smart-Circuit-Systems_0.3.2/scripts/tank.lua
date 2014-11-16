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
	
	inv.clear()
	if storedfluid ~= nil then
		inv.insert{name = "fluid-content", count = math.floor((storedfluid.amount * 100) + 0.5)}
		inv.insert{name = "fluid-temperature", count = math.floor((storedfluid.temperature * 10) + 0.5)}
	end
end

-- Cleanup functions

function CleanupTank(tank)
	local pos = tank.position
	
	tank.getinventory(1).clear()
	local pipePart = GetEntityAt(pos, "smart-tank-pipe")
	if pipePart ~= nil then pipePart.destroy() end
	
	Remove(glob.allTanks, pos)
end
