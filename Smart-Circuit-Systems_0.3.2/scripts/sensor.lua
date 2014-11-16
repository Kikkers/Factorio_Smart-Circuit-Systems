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
	
	local allAdjacentInventories = game.findentitiesfiltered{area = effectiveArea, type = "container"}
	
	inv.clear()
	
	local items = game.findentitiesfiltered{area = effectiveArea, type = "item-entity"}
	for _,v in pairs(items) do
		inv.insert{name = v.stack.name, count = v.stack.count}
	end
	
	UpdateFromInventories(inv, effectiveArea, "container", 1)
	UpdateFromInventories(inv, effectiveArea, "locomotive", 1)
	UpdateFromInventories(inv, effectiveArea, "cargo-wagon", 1)
	UpdateFromInventories(inv, effectiveArea, "car", 2)
end

function UpdateFromInventories(sensorInv, area, containertype, numExpectedInventories)
	local containers = game.findentitiesfiltered{area = area, type = containertype}
	for _,cv in pairs(containers) do
		for i=1,numExpectedInventories do
			local containerInv = cv.getinventory(i)
			for ik,iv in pairs(containerInv.getcontents()) do
				sensorInv.insert{name = ik, count = iv}
			end
		end
	end
end

-- Cleanup functions

function CleanupSensor(sensor)
	sensor.getinventory(1).clear()
	Remove(glob.allSensors, pos)
end
