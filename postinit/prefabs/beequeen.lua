local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- beequeen_gnome : 10% chance to drop in bee queen loot.

ENV.AddPrefabPostInit("beequeen", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("beequeen_gnome", TUNING.GNOME_DROP_RATES.BEEQUEEN_GNOME) -- Down from 20%
	end
end)