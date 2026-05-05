local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- beret_gnome : 1% chance to drop in frogs loot.

ENV.AddPrefabPostInit("frog", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("beret_gnome", TUNING.GNOME_DROP_RATES.BERET_GNOME)
	end
end)
