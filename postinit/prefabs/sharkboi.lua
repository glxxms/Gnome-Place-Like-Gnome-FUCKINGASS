local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- toadstool_gnome1 : 20% chance to drop when trading with frostjaw.

ENV.AddPrefabPostInit("sharkboi", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end

	inst:ListenForEvent("trade", function(inst, data)
		if data and data.item and data.item:HasTag("oceanfish")
			and inst.components.lootdropper and math.random() <= TUNING.GNOME_DROP_RATES.BOOT_GNOME then
			
			inst.components.lootdropper:SpawnLootPrefab("boot_gnome")
		end
	end)
end)