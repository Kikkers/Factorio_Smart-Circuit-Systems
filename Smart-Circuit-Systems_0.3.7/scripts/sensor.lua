-- initialization functions

function InitSensor(sensor)
	sensor.operable = false
	Insert(glob.allSensors, sensor.position, sensor)
	LoadSensor(sensor)
end

function LoadSensor(sensor)
	local pos = sensor.position
	local radius = 1.49
	local effectiveArea = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}
	
	local data = {}
	data[1] = TickSensor
	data[2] = sensor
	data[3] = sensor.getinventory(1)
	data[4] = effectiveArea
	Insert(modEntities, sensor.position, data)
end

-- updating functions

function TickSensor(data)
	-- gather all items into this table
	local newContents = {}
	
	local items = game.findentitiesfiltered{area = data[4], type = "item-entity"}
	for _,v in pairs(items) do
		if newContents[v.stack.name] == nil then 
			newContents[v.stack.name] = v.stack.count
		else
			newContents[v.stack.name] = newContents[v.stack.name] + v.stack.count
		end
	end
	
	UpdateFromInventories(newContents, data[4], "container", 1)
	UpdateFromInventories(newContents, data[4], "locomotive", 1)
	UpdateFromInventories(newContents, data[4], "cargo-wagon", 1)
	UpdateFromInventories(newContents, data[4], "car", 2)
	
	ModifySensorInventory(data[3], newContents)
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
	Remove(modEntities, pos)
end
