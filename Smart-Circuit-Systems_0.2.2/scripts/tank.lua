-- initialization functions

function InitTank(tankPart)

	local pipePart = game.createentity{name = "smart-tank-pipe", position = tankPart.position}
	
	Insert(glob.allTanks, tankPart.position, tankPart)
	
	pipePart.destructible = false
	tankPart.operable = false
		
end

-- updating functions

function TickTank(tank)
	local inv = tank.getinventory(1)
	local chestPart = GetEntityAt(tank.position, "smart-tank-pipe")
	if chestPart == nil then return end
	local storedfluid = chestPart.fluidbox[1]
	
	if storedfluid ~= nil then
	
		-- check that is good to have, but will likely never occur (inv is cleared when no liquid is present)
		for name,val in pairs(inv.getcontents()) do
			if name ~= "fluid-content" and name ~= "fluid-temperature" then
				Print("Warning: Irrelevant items have been inserted into Smart Tank. They will be removed to ensure proper sensor operation.")
				inv.clear()
				break
			end
		end
	
		--modify fluid representation if changed
		local amountdiff = math.floor((storedfluid.amount * 100) + 0.5) - inv.getitemcount("fluid-content")
		if amountdiff > 0 then 
			inv.insert{name = "fluid-content", count = amountdiff}
		elseif amountdiff < 0 then 
			inv.remove{name = "fluid-content", count = -amountdiff}
		end
		
		local tempdiff = math.floor((storedfluid.temperature * 10) + 0.5) - inv.getitemcount("fluid-temperature")
		if tempdiff > 0 then 
			inv.insert{name = "fluid-temperature", count = tempdiff}
		elseif tempdiff < 0 then 
			inv.remove{name = "fluid-temperature", count = -tempdiff}
		end
		
	else
		inv.clear()
	end
end

-- Cleanup functions

function CleanupTank(tankPart)
	local pos = tankPart.position
	
	tankPart.getinventory(1).clear()
	local pipePart = GetEntityAt(pos, "smart-tank-pipe")
	if pipePart ~= nil then pipePart.destroy() end
	
	Remove(glob.allTanks, pos)
end
