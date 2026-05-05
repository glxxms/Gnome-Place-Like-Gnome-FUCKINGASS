local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- baby_gnome : 1% chance to be left behind by canaries.

local OldOnSpawn
local function OnSpawn(inst, ...)
	if math.random() < TUNING.GNOME_DROP_RATES.BABY_GNOME then
		SpawnPrefab("baby_gnome").Transform:SetPosition(x, y, z)
	end
	
	if OldOnSpawn then
		OldOnSpawn(inst, ...)
	end
end

ENV.AddPrefabPostInit("canary", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.periodicspawner then
		if OldOnSpawn == nil then
			OldOnSpawn = inst.components.periodicspawner.onspawn
		end
		
		inst.components.periodicspawner.onspawn = OnSpawn
	end
end)