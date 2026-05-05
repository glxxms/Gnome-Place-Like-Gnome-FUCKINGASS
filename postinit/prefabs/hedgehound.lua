local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- aprilfools_gnome : 1% chance to drop in briar hounds loot.

ENV.AddPrefabPostInit("hedgehound", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("aprilfools_gnome", TUNING.GNOME_DROP_RATES.APRILFOOLS_GNOME)
	end
end)