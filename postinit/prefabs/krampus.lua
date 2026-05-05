local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- baby_devil_gnome : 1% chance to drop in krampus loot.

ENV.AddPrefabPostInit("krampus", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("baby_devil_gnome", TUNING.GNOME_DROP_RATES.BABY_DEVIL_GNOME)
	end
end)