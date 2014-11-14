Factorio: Smart-Circuit-Systems
=========================

Tested to work with Factorio v0.11.3

Mod for factorio that (currently) adds four items, all capable of interacting with the circuit network: 
+ A sensor for the contents of a pipe.
+ A pump that works on a wire condition.
+ A wire switcher that works on a wire condition
+ A sensor for the charge of an accumulator

(Mod was formerly known as Smart-Fluid.)

This mod is for the impatient, because official factorio development will likely eventually include exactly the contents of this mod in the next major version update (although significantly less hack-y)

Install instructions:
Copy the "Smart-Circuit_Systems_..." folder into the mods folder. The mods folder is created after running Factorio once. After copying, restart Factorio and open mods in the main menu, you should see the mod already enabled there.

Stuff to know / how to use / what hacks were used: 
+ Smart tanks and smart accumulators create dummy items representing their measurements. All dummy items stack up to 1000, which is the maximum of the sensor's respective measurements.
+ The pump and electric switch have multiple selection boxes. Connect red or green wires to the selection box that shows the yellow junk, in order to allow setting the circuit conditions. 
+ The electric switch has two additional terminals on which you can connect wires (copper, red or green), through which you can control what signals or power is passed on.
+ Concerning the yellow junk inside the pump selection box, ignore it. That's just the hidden inserter checking the circuit condition. 

Known issues:
+ The way that the smart pump is currently set up prevents it from appearing in blueprints or as a ghost. I'm guessing the best solution would be a multi-tile structure like the electric switch.

Version history:

0.2.2
+ All structures except for the smart pump can now be constructed and deconstructed using robots. 

0.2.1
+ Added technologies for the objects. Required tech is fluid handling, advanced electronics, electric energy distribution
+ Improved the way circuit conditions are checked (not using a hidden chest anymore, but the yellow junk has to stay for now)
+ Backwards compatible with 0.2.0 (cleans up redundant items from saves using 0.2.0)
	
0.2.0
+ Added smart accumulator and electric switch
+ Modified art for smart tank
	
0.1.2
+ Support for v0.11.1
+ Recipes modified to more conventional requirements
	
0.1.1
+ Recipes are one iron plate for both items. (For testing purposes or the impatient)
+ Unlocked from start (you still need red/green wires tho).
+ Not yet rigorously tested, some crashing bugs may still exist.
	
	


