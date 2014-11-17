-- initialization functions

function InitBattery(chargePart)
	local pos = chargePart.position
	
	local chestPart = game.createentity{name = "smart-battery-chest", position = pos}
	
	Insert(glob.allBatteries, pos, chestPart)
	
	chestPart.destructible = false
	chestPart.operable = false
		
end

-- updating functions

function TickBattery(chestPart)
	local inv = chestPart.getinventory(1)
	local batteryPart = GetEntityAt(chestPart.position, "smart-battery")
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

function CleanupBatteryChest(chestPart)
	local pos = chestPart.position
	local batteryPart = GetEntityAt(pos, "smart-battery")
	
	CleanupChest(chestPart)
	Remove(glob.allBatteries, Offset(pos, -0.5))
	
	if batteryPart ~= nil then batteryPart.destroy() end
end

function CleanupBattery(batteryPart)
	local pos = batteryPart.position
	local chestPart = GetEntityAt(Offset(pos, 0.5), "smart-battery-chest")
	if chestPart ~= nil then
		CleanupChest(chestPart)
		chestPart.destroy()
	end
	
	Remove(glob.allBatteries, pos)
end
