local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- toadstool_gnome1 : 10% chance to drop in snurtles loot.

ENV.AddPrefabPostInit("snurtle_gnome", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("snurtle_gnome", TUNING.GNOME_DROP_RATES.SNURTLE_GNOME) -- Down from 50%
	end
end)