local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- buttcheek_gnome : 1% chance to be found in crumpled packages.

local function OnUnwrapped(inst, data)
	if math.random() <= TUNING.GNOME_DROP_RATES.BUTTCHEEK_GNOME then
		local loot = SpawnPrefab("buttcheek_gnome")
		
		if loot then
			loot.Transform:SetPosition(inst.Transform:GetWorldPosition())
		end
	end
end

ENV.AddPrefabPostInit("wetpouch", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:ListenForEvent("unwrapped", OnUnwrapped)
end)