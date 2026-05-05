local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- potted_gnome : 1% chance to drop from picked tumbleweeds.
-- derp_gnome : 2% chance to drop from picked tumbleweeds.
-- derp_gnomette : 2% chance to drop from picked tumbleweeds.

ENV.AddPrefabPostInit("tumbleweed", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:ListenForEvent("picked", function(inst, data)
		local x, y, z = inst.Transform:GetWorldPosition()
		
		if math.random() < TUNING.GNOME_DROP_RATES.POTTED_GNOME then -- Down from 5%
			SpawnPrefab("potted_gnome").Transform:SetPosition(x, y, z)
		end
		if math.random() < TUNING.GNOME_DROP_RATES.DERP_GNOME then -- Down from 4%
			SpawnPrefab("derp_gnome").Transform:SetPosition(x, y, z)
		end
		if math.random() < TUNING.GNOME_DROP_RATES.DERP_GNOMETTE then -- Down from 4%
			SpawnPrefab("derp_gnomette").Transform:SetPosition(x, y, z)
		end
	end)
end)