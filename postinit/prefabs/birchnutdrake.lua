local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- gnudist_gnome : 1% chance to drop in birchnutters loot.

ENV.AddPrefabPostInit("birchnutdrake", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("gnudist_gnome", TUNING.GNOME_DROP_RATES.GNUDIST_GNOME)
	end
end)