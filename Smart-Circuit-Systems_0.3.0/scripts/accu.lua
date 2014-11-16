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
	
	if storedCharge > 0 then
		
		-- check that is good to have, but will likely never occur (inv is cleared when no charge is present)
		for name,_ in pairs(inv.getcontents()) do
			if name ~= "charge-unit" then
				Print("Warning: Irrelevant items have been inserted into Smart Battery. They will be removed to ensure proper sensor operation.")
				inv.clear()
				break
			end
		end
	
		--modify fluid representation if changed
		local amountdiff = math.floor(storedCharge / 2500.0) - inv.getitemcount("charge-unit")
		if amountdiff > 0 then 
			inv.insert{name = "charge-unit", count = amountdiff}
		elseif amountdiff < 0 then 
			inv.remove{name = "charge-unit", count = -amountdiff}
		end
		
	else
		inv.clear()
	end
end

-- Cleanup functions

function CleanupBatteryChest(chestPart)
	local pos = chestPart.position
	local batteryPart = GetEntityAt(pos, "smart-battery")
	
	chestPart.getinventory(1).clear()
	Remove(glob.allBatteries, Offset(pos, -0.5))
	
	if batteryPart ~= nil then batteryPart.destroy() end
end

function CleanupBattery(batteryPart)
	local pos = batteryPart.position
	local chestPart = GetEntityAt(Offset(pos, 0.5), "smart-battery-chest")
	if chestPart ~= nil then
		chestPart.getinventory(1).clear()
		chestPart.destroy()
	end
	
	Remove(glob.allBatteries, pos)
end
