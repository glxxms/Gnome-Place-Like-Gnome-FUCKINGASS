local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- gneo_gnome : 50% chance to drop in tier 3 shadow knight loot.

ENV.AddPrefabPostInit("shadow_knight", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:ListenForEvent("death", function(inst)
		if inst.level and inst.level >= 3 and inst.components.lootdropper
			and math.random() <= TUNING.GNOME_DROP_RATES.GNEO_GNOME then
			
			inst.components.lootdropper:SpawnLootPrefab("gneo_gnome")
		end
	end)
end)