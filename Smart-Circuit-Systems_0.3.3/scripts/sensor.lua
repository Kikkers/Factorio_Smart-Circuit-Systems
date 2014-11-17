-- initialization functions

function InitSensor(sensor)
	Insert(glob.allSensors, sensor.position, sensor)
	sensor.operable = false
end

-- updating functions

function TickSensor(sensor)
	local pos = sensor.position
	local inv = sensor.getinventory(1)
	
	local radius = 1.49
	local effectiveArea = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}
	
	-- gather all items into this table
	local newContents = {}
	
	local items = game.findentitiesfiltered{area = effectiveArea, type = "item-entity"}
	for _,v in pairs(items) do
		if newContents[v.stack.name] == nil then 
			newContents[v.stack.name] = v.stack.count
		else
			newContents[v.stack.name] = newContents[v.stack.name] + v.stack.count
		end
	end
	
	UpdateFromInventories(newContents, effectiveArea, "container", 1)
	UpdateFromInventories(newContents, effectiveArea, "locomotive", 1)
	UpdateFromInventories(newContents, effectiveArea, "cargo-wagon", 1)
	UpdateFromInventories(newContents, effectiveArea, "car", 2)
	
	ModifySensorInventory(inv, newContents)
end

function UpdateFromInventories(newContents, area, containertype, numExpectedInventories)
	local containers = game.findentitiesfiltered{area = area, type = containertype}
	for _,cv in pairs(containers) do
		for i=1,numExpectedInventories do
			local containerInv = cv.getinventory(i)
			for ik,iv in pairs(containerInv.getcontents()) do
				if newContents[ik] == nil then
					newContents[ik] = iv
				else
					newContents[ik] = newContents[ik] + iv
				end
			end
		end
	end
end

-- Cleanup functions

function CleanupSensor(sensor)
	CleanupChest(sensor)
	Remove(glob.allSensors, pos)
end
