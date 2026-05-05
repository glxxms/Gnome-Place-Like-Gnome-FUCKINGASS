local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- egg_gnome : 10% chance to drop in moose/goose loot.

ENV.AddPrefabPostInit("moose", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("egg_gnome", TUNING.GNOME_DROP_RATES.EGG_GNOME) -- Down from 20%
	end
end)