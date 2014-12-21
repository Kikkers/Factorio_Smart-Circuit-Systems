-- initialization functions

function InitBattery(batteryPart)
	local pos = batteryPart.position
	local chestPart = game.createentity{name = "smart-battery-chest", position = {x=pos.x+0.001, y=pos.y+0.001}}
	chestPart.destructible = false
	chestPart.operable = false
	
	Insert(glob.allBatteries, pos, chestPart)
	LoadBattery(chestPart)
end

function LoadBattery(chestPart)
	local pos = chestPart.position
	local data = {}
	data[1] = TickBattery
	data[2] = chestPart
	data[3] = GetEntityAt(pos, "smart-battery")
	data[4] = chestPart.getinventory(1)
	data[5] = data[4].getitemcount("charge-unit")
	if data[3] == nil then
		Print("failed restoring smart accumulator at {" .. pos.x .. ", " .. pos.y .. "}")
		Remove(glob.allBatteries, pos, chestPart)
	else
		Insert(modEntities, pos, data)
	end
end

-- updating functions

function TickBattery(data)
	local newCharge = math.floor(data[3].energy / 2500.0)
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

function CleanupBatteryChest(chestPart)
	local pos = chestPart.position
	local batteryPart = GetEntityAt(pos, "smart-battery")
	
	CleanupChest(chestPart)
	Remove(glob.allBatteries, pos)
	Remove(modEntities, pos)
	
	batteryPart.destroy()
end

function CleanupBattery(batteryPart)
	local chestPart = GetEntityAt(batteryPart.position, "smart-battery-chest")
	if chestPart == nil then chestPart = GetEntityAt(Offset(batteryPart.position, 0.5), "smart-battery-chest") end
	local pos = chestPart.position
	
	CleanupChest(chestPart)
	chestPart.destroy()
	
	Remove(glob.allBatteries, pos)
	Remove(modEntities, pos)
end
