-- initialization functions

function InitCapacitor(chestPart)
	local pos = chestPart.position
	local batteryPart = game.createentity{name = "capacitor-battery", position = pos}
	batteryPart.destructible = false
	chestPart.operable = false
	
	Insert(glob.allCapacitors, pos, chestPart)
	LoadCapacitor(chestPart)
end

function LoadCapacitor(chestPart)
	local pos = chestPart.position
	local data = {}
	data[1] = TickCapacitor
	data[2] = chestPart
	data[3] = GetEntityAt(pos, "capacitor-battery")
	data[4] = chestPart.getinventory(1)
	data[5] = data[4].getitemcount("charge-unit")
	Insert(modEntities, pos, data)
end

-- updating functions

function TickCapacitor(data)
	local batteryPart = data[3]
	
	local newCharge = math.floor(batteryPart.energy / 2500.0)
	if newCharge ~= data[5] then
		data[5] = newCharge
		
		local newContents = {}
		if newCharge > 0 then
			newContents["charge-unit"] = newCharge
		end
		ModifySensorInventory(data[4], newContents)
	end
end

-- Cleanup functions

function CleanupCapacitor(chestPart)
	local pos = chestPart.position
	local batteryPart = GetEntityAt(pos, "capacitor-battery")
	
	CleanupChest(chestPart)
	Remove(glob.allCapacitors, pos)
	Remove(modEntities, pos)
	
	batteryPart.destroy()
end

