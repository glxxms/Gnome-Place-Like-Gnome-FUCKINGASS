local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- dfly_gnome1 : 10% chance to drop in dragonfly loot.
-- dfly_gnome2 : guaranteed to drop in dragonfly loot if killed while enraged.

ENV.AddPrefabPostInit("dragonfly", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:ListenForEvent("death", function(inst)
		if inst.components.lootdropper then
			if math.random() <= TUNING.GNOME_DROP_RATES.DFLY_GNOME1 then -- Down from 20%
				inst.components.lootdropper:SpawnLootPrefab("dfly_gnome1")
			end
			
			if inst.enraged and math.random() <= TUNING.GNOME_DROP_RATES.DFLY_GNOME2 then
				inst.components.lootdropper:SpawnLootPrefab("dfly_gnome2")
			end
		end
	end)
end)