local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- baby_knife_gnome : guaranteed to drop when killing basic chester manually.
-- baby_knife_darkness_gnome : guaranteed to drop when killing shadow chester manually.
-- baby_knife_ice_gnome : guaranteed to drop when killing ice chester manually.

ENV.AddPrefabPostInit("chester", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:ListenForEvent("death", function(inst, data)
		local killer = data and data.afflicter
		
		if killer and killer:HasTag("player") then
			local chester_state = inst._chesterstate and inst._chesterstate:value() or 1
			local gnome_prefab = "baby_knife_"..(chester_state == 2 and "ice_"
				or chester_state == 3 and "darkness_"
				or "").."gnome"
			
			if math.random() <= TUNING.GNOME_DROP_RATES[string.upper(gnome_prefab)] or 1 then
				if inst.components.lootdropper == nil then
					inst:AddComponent("lootdropper")
				end
				
				inst.components.lootdropper:SpawnLootPrefab(gnome_prefab)
			end
		end
	end)
end)