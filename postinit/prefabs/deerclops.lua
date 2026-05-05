local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- ice_gnome : 10% chance to drop in deerclops loot.
-- ice_gnomette : 5% chance to drop in deerclops loot.

ENV.AddPrefabPostInit("deerclops", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("ice_gnome", TUNING.GNOME_DROP_RATES.ICE_GNOME) -- Down from 20%
		inst.components.lootdropper:AddChanceLoot("ice_gnomette", TUNING.GNOME_DROP_RATES.ICE_GNOMETTE) -- Down from 8%
	end
end)