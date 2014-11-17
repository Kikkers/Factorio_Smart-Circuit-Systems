-- initialization functions

function InitCapacitor(chestPart)
	local pos = chestPart.position
	
	local batteryPart = game.createentity{name = "capacitor-battery", position = pos}
	
	Insert(glob.allCapacitors, pos, chestPart)
	
	batteryPart.destructible = false
	chestPart.operable = false
		
end

-- updating functions

function TickCapacitor(chestPart)
	local inv = chestPart.getinventory(1)
	local batteryPart = GetEntityAt(chestPart.position, "capacitor-battery")
	if batteryPart == nil then return end
	local storedCharge = batteryPart.energy
	
	local newContents = {}
	if storedCharge > 0 then
		
		local newCharge = math.floor(storedCharge / 2500.0)
		if newCharge > 0 then
			newContents["charge-unit"] = math.floor(storedCharge / 2500.0)
		end
	
	end
	ModifySensorInventory(inv, newContents)
end

-- Cleanup functions

function CleanupCapacitor(chestPart)
	local pos = chestPart.position
	local batteryPart = GetEntityAt(pos, "capacitor-battery")
	
	CleanupChest(chestPart)
	Remove(glob.allCapacitors, pos)
	
	if batteryPart ~= nil then batteryPart.destroy() end
end

