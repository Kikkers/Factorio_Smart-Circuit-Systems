require "defines"
require "scripts.common"
require "scripts.pole"
require "scripts.tank"
require "scripts.accu"
require "scripts.actuator"
require "scripts.sensor"
require "scripts.capacitor"

game.oninit(InitCommon)
game.onload(InitCommon)

game.onevent(defines.events.ontick, function(event)

	-- go over all actuators
	IterateEntities(glob.allActuators, TickActuator)

	-- go over all smart poles
	IterateEntities(glob.allPoles, TickPole)

	-- go over all smart batteries
	IterateEntities(glob.allBatteries, TickBattery)

	-- go over all smart tanks
	IterateEntities(glob.allTanks, TickTank)
	
	-- go over all sensors
	IterateEntities(glob.allSensors, TickSensor)
	
	-- go over all capacitor poles
	IterateEntities(glob.allCapacitors, TickCapacitor)
end)

onplayerrotatedentityHandler = {
	["pole-actuator"] = RotatePole,
	["omni-actuator"] = RotateActuator,
}
game.onevent(defines.events.onplayerrotatedentity, function(event)
	local func = onplayerrotatedentityHandler[event.entity.name]
	if func ~= nil then func(event.entity) end
end)

onbuiltentityHandler = {
	["smart-battery"] = InitBattery,
	["pole-actuator"] = InitPole,
	["smart-tank"] = InitTank,
	["omni-actuator"] = InitActuator,
	["item-sensor"] = InitSensor,
	["capacitor-pole"] = InitCapacitor,
}
game.onevent(defines.events.onbuiltentity, function(event)
	local func = onbuiltentityHandler[event.createdentity.name]
	if func ~= nil then func(event.createdentity) end
end)

game.onevent(defines.events.onrobotbuiltentity, function(event)
	local func = onbuiltentityHandler[event.createdentity.name]
	if func ~= nil then func(event.createdentity) end
end)

onpreplayermineditemHandler = {
	["smart-tank" 		   ] = CleanupTank,
	["smart-battery"       ] = CleanupBattery,
	["smart-battery-chest" ] = CleanupBatteryChest,
	["pole-actuator"       ] = CleanupPole,
	["west-node"           ] = CleanupPoleNode,
	["east-node"           ] = CleanupPoleNode,
	["north-node"          ] = CleanupPoleNode,
	["south-node"          ] = CleanupPoleNode,
	["omni-actuator"       ] = CleanupActuator,
	["item-sensor"         ] = CleanupSensor,
	["capacitor-pole"      ] = CleanupCapacitor,
}
game.onevent(defines.events.onpreplayermineditem, function(event)
	local func = onpreplayermineditemHandler[event.entity.name]
	if func ~= nil then func(event.entity) end
end)
game.onevent(defines.events.onrobotpremined, function(event)
	local func = onpreplayermineditemHandler[event.entity.name]
	if func ~= nil then func(event.entity) end
end)

onentitydiedHandler = {
	["smart-tank" 		   ] = CleanupTank,
	["smart-battery"       ] = CleanupBattery,
	["pole-actuator"       ] = CleanupPole,
	["omni-actuator"       ] = CleanupActuator,
	["item-sensor"         ] = CleanupSensor,
	["capacitor-pole"      ] = CleanupCapacitor,
}
game.onevent(defines.events.onentitydied, function(event)
	local func = onentitydiedHandler[event.entity.name]
	if func ~= nil then func(event.entity) end
end)
