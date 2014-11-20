Factorio: Smart-Circuit-Systems
=========================

Tested to work with Factorio v0.11.3 (will likely work for v0.11.x as well)

Mod for factorio that (currently) adds six items, all capable of interacting with the circuit network: 
+ A device that can switch most machines on or off on a wire condition.
+ A wire switcher that works on a wire condition.
+ A sensor for the contents of a pipe.
+ A sensor for the charge of an accumulator.
+ An electric pulse sensor, which detects the instant the connected power network switches from charging to discharging, and vice versa.
+ A sensor for items lying on the ground and the contents of nearby (primitive) inventories. 

This mod is for the impatient, because official factorio development will likely eventually include at least some the contents of this mod in the next major version update (and probably less hack-y)

Install instructions:
No special requirements here, just copy the "Smart-Circuit_Systems_..." folder into the mods folder. The mods folder is created after running Factorio once. After copying, restart Factorio and open mods in the main menu, you should see the mod already enabled there.

Stuff to know / how to use / what hacks were used: 
+ Smart tanks and smart accumulators create dummy items representing their measurements. All dummy items stack up to 1000, which is the maximum of the sensor's respective measurements.
+ The switching behavior of the omni actuator and electric switch accept red and green wires, be sure to attach the wire to the yellow selection box that shows inserter arrows.
+ The electric switch has two additional terminals on which you can connect wires (copper, red or green), through which you can control what signals or power is passed on.
+ The item sensor range has a 1 tile sensing radius, so it can detect items on adjacent belts. Concerning detecting inventories, only a select few types of inventories can be detected from, including basic chests (not smart or logistic chests), cargo wagons, locomotives and cars.
+ The pulse sensor is equivalent to the smart accumulator, but is limited to 1 charge unit, giving it a binary behavior. Large charge/discharge values makes it react almost instantly to changes in the connected network.

Known issues:
+ Item Sensor is unable to just iterate over the number of inventories of an entity, which is the main reason the item sensor has a limited set of possible container types to scan from.
+ Smart Tank will, on death or being mined, fail to disconnect the circuit wire. Appears to be limited to visuals, rebuilding restores the connection without errors.
+ All sensors (item sensor, smart tank, smart accumulator, pulse sensor) can have their contents modified using inserters like they were chests. This is unintended, but unavoidable (AFAIK), because there seems to be no way to prevent inserters from functioning on specific chests.

Version history:

0.3.5
+ Optimized some code all round to gain performance. Item sensor and omni actuator remain somewhat expensive to simulate still, as they depend on finding potentially moving objects.

0.3.4
+ Added the pulse sensor

0.3.3
+ Fixed a bug in all sensors that failed to clear the network-visible items of the red or green circuit networks. Cause was the use of inventory.clear() which apparently doesn't clear the items of the connected network.

0.3.2
+ Added the item sensor for types: item-entity, container, cargo-wagon, car, locomotive

0.3.1
+ Omni actuator doesn't crash on controlling trains.

0.3.0
+ Added the omni actuator
+ Removed the smart pump, instead you can use an omni actuator on a normal small pump.
+ Changed smart battery prototype to use normal actuator art with pole overlay (to save on vram)
+ Changed electric switch art
+ Fixed that actuators worked when unpowered, now requires a charge to operate.

0.2.2
+ All structures except for the smart pump can now be constructed and deconstructed using robots. 

0.2.1
+ Added technologies for the objects. Required tech is fluid handling, advanced electronics, electric energy distribution
+ Improved the way circuit conditions are checked (not using a hidden chest anymore, but the yellow junk has to stay for now)
+ Backwards compatible with 0.2.0 (cleans up redundant items from saves using 0.2.0)
	
0.2.0
+ Added smart accumulator and electric switch
+ Modified art for smart tank
+ Changed mod name (formerly Smart-Fluid)
	
0.1.2
+ Support for v0.11.1
+ Recipes modified to more conventional requirements
	
0.1.1
+ Recipes are one iron plate for both items. (For testing purposes or the impatient)
+ Unlocked from start (you still need red/green wires tho).
+ Not yet rigorously tested, some crashing bugs may still exist.
	
	


