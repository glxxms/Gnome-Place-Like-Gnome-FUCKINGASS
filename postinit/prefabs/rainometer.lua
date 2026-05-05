local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- raincoat_gnomette : 1% chance to drop from rainometer when the day starts and it rains.

local function OnCyclesChanged(inst, cycles)
	if not inst:HasTag("burnt") and TheWorld.state.israining and math.random() <= TUNING.GNOME_DROP_RATES.RAINCOAT_GNOMETTE then
		if inst.components.lootdropper == nil then
			inst:AddComponent("lootdropper")
		end
		
		inst.components.lootdropper:SpawnLootPrefab("raincoat_gnomette")
	end
end

ENV.AddPrefabPostInit("rainometer", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:WatchWorldState("cycles", OnCyclesChanged)
end)