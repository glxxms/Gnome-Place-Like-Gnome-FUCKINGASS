local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- bearger_gnome : 50% chance to drop in bearger loot.

ENV.AddPrefabPostInit("bearger", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("bearger_gnome", TUNING.GNOME_DROP_RATES.BEARGER_GNOME)
	end
end)