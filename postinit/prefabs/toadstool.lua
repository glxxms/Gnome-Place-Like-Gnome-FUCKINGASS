local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- toadstool_gnome1 : 50% chance to drop in toadstool loot.
-- toadstool_gnome2 : guaranteed to drop in misery toadstool loot.

ENV.AddPrefabPostInit("toadstool", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("toadstool_gnome1", TUNING.GNOME_DROP_RATES.TOADSTOOL_GNOME1)
	end
end)

ENV.AddPrefabPostInit("toadstool_dark", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("toadstool_gnome2", TUNING.GNOME_DROP_RATES.TOADSTOOL_GNOME2)
	end
end)