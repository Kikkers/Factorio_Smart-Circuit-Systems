Factorio: Smart Fluid Mod
=========================

Tested to work with Factorio v0.10.12

Mod for factorio that adds two items, both usable as elements of the circuit network: 
	* A sensor for the contents of a pipe.
	* A pump that works on a wire condition. 

For the impatient though, because official factorio development will likely eventually include exactly the contents of this mod (although significantly less hack-y)

Install instructions:
Copy the "smart-fluid" folder into the mods folder. The mods folder is created after running Factorio once. After copying, restart Factorio and open mods in the main menu, you should see the mod already enabled there.

Stuff to know / how to use / what hacks were used: 
	* The smart tank creates dummy items according to the fluid temperature and volume. They stack up to 1000, which means 10.0 volume or 100.0 temperature. Use these as wire conditions in the circuit network.
	* The pump has two selection boxes. This is currently necessary for ... reasons. Only the outer box can be rotated, and accepts wire connections. The pump direction can be viewed with the inner box. 
	* You can remove items from the hidden chest overlapping the pump with an inserter. Don't do this. I was unable to figure out how to prevent this in code.
	* Don't mind the yellow junk inside the pump selection box. That's just the hidden inserter putting items from the hidden chest into the hidden chest (if you must ask, check the code). 

Version history:
0.1
	* Recipes are one iron plate for both items. (For testing purposes or the impatient)
	* Unlocked from start (you still need red/green wires tho).
	* Not yet rigorously tested, some crashing bugs may still exist.
	
	


