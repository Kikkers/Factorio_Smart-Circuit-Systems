require "defines"
require "scripts.common"
require "scripts.pole"
require "scripts.tank"
require "scripts.pump"
require "scripts.accu"

game.oninit(InitCommon)
game.onload(InitCommon)

game.onevent(defines.events.onplayerrotatedentity, function(event)
	if event.entity.name == "smart-pump-actuator" then
		local otherPart = GetEntityAt(event.entity.position, "smart-pump-pipe")
		otherPart.direction = event.entity.direction
	elseif event.entity.name == "smart-pump-pipe" then
		local otherPart = GetEntityAt(event.entity.position, "smart-pump-actuator")
		otherPart.direction = event.entity.direction
	elseif event.entity.name == "pole-actuator" then
		event.entity.direction = (event.entity.direction + 6) % 8
	end
end)

game.onevent(defines.events.ontick, function(event)

	-- go over all smart poles
	for _,ys in pairs(glob.allPoles) do
		for _,pole in pairs(ys) do
			if pole.valid then 
				TickPole(pole)
			end
		end
	end

	-- go over all smart batteries
	for _,ys in pairs(glob.allBatteries) do
		for _,battery in pairs(ys) do
			if battery.valid then 
				TickBattery(battery)
			end
		end
	end

	-- go over all smart tanks
	for _,ys in pairs(glob.allTanks) do
		for _,tank in pairs(ys) do
			if tank.valid then 
				TickTank(tank)
			end
		end
	end
	
	-- go over all smart pumps
	for _,ys in pairs(glob.allPumps) do
		for _,pump in pairs(ys) do
			if pump.valid then 
				TickPump(pump) 
			end
		end
	end
end)

onbuiltentityHandler = {
	["smart-battery"] = InitBattery,
	["pole-actuator"] = InitPole,
	["smart-pump-pipe"] = InitPump,
	["smart-tank"] = InitTank,
}
game.onevent(defines.events.onbuiltentity, function(event)
	local func = onbuiltentityHandler[event.createdentity.name]
	if func ~= nil then func(event.createdentity) end
end)

onpreplayermineditemHandler = {
	["smart-tank" 		   ] = CleanupTank,
	["smart-battery"       ] = CleanupBattery,
	["smart-battery-chest" ] = CleanupBatteryChest,
	["smart-pump-pipe"     ] = CleanupPump,
	["smart-pump-actuator" ] = CleanupPumpActuator,
	["pole-actuator"       ] = CleanupPole,
	["west-node"     ] = CleanupPoleNode,
	["east-node"     ] = CleanupPoleNode,
	["north-node"     ] = CleanupPoleNode,
	["south-node"     ] = CleanupPoleNode,
}
game.onevent(defines.events.onpreplayermineditem, function(event)
	local func = onpreplayermineditemHandler[event.entity.name]
	if func ~= nil then func(event.entity) end
end)

onentitydiedHandler = {
	["smart-tank" 		   ] = CleanupTank,
	["smart-pump-pipe"     ] = CleanupPump,
	["smart-battery"       ] = CleanupBattery,
	["pole-actuator"       ] = CleanupPole,
}
game.onevent(defines.events.onentitydied, function(event)
	local func = onentitydiedHandler[event.entity.name]
	if func ~= nil then func(event.entity) end
end)
