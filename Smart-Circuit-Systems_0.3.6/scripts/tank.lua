-- initialization functions

function InitTank(chestPart)
	local pos = chestPart.position
	local pipePart = game.createentity{name = "smart-tank-pipe", position = pos}
	pipePart.destructible = false
	chestPart.operable = false
	chestPart.active = false

	Insert(glob.allTanks, pos, chestPart)
	LoadTank(chestPart)
end

function LoadTank(chestPart)
	local pos = chestPart.position
	local data = {}
	data[1] = TickTank
	data[2] = chestPart
	data[3] = GetEntityAt(pos, "smart-tank-pipe")
	data[4] = chestPart.getinventory(1)
	data[5] = data[4].getitemcount("fluid-content")
	data[6] = data[4].getitemcount("fluid-temperature")
	Insert(modEntities, pos, data)
end

-- updating functions

function TickTank(data)

	local fluid = data[3].fluidbox[1]
	if fluid ~= nil then
		local newAmount = math.floor((fluid.amount * 100) + 0.5)
		local newTemp = math.floor((fluid.temperature * 10) + 0.5)
		
		--if data[5] ~= data[4].getitemcount("fluid-content") or data[6] ~= data[4].getitemcount("fluid-temperature") then
		--	Print("Don't do that!")
		--	data[5] = data[4].getitemcount("fluid-content")
		--	data[6] = data[4].getitemcount("fluid-temperature")
		--end
	
		if newAmount ~= data[5] or newTemp ~= data[6] then
			data[5] = newAmount
			data[6] = newTemp
			
			local newContents = {}
			if newAmount > 0 then
				newContents["fluid-content"] = newAmount
			end
			if newTemp > 0 then
				newContents["fluid-temperature"] = newTemp
			end
			ModifySensorInventory(data[4], newContents)
		end
	end
end

-- Cleanup functions

function CleanupTank(chestPart)
	local pos = chestPart.position
	
	CleanupChest(chestPart)
	local pipePart = GetEntityAt(pos, "smart-tank-pipe")
	if pipePart ~= nil then pipePart.destroy() end
	
	Remove(glob.allTanks, pos)
	Remove(modEntities, pos)
end
