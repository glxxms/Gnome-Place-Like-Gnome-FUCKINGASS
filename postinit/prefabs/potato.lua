local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- stpatrick_gnome : 2% chance to drop when breaking oversized potatoes.
-- stpatrick_gnomette : 1% chance to drop when breaking oversized potatoes.

local OldOnFinished
local function OnFinished(inst, ...)
	if inst.components.lootdropper == nil then
		inst:AddComponent("lootdropper")
	end
	
	if math.random() <= TUNING.GNOME_DROP_RATES.STPATRICK_GNOME then
		inst.components.lootdropper:SpawnLootPrefab("stpatrick_gnome")
	end
	if math.random() <= TUNING.GNOME_DROP_RATES.STPATRICK_GNOMETTE then
		inst.components.lootdropper:SpawnLootPrefab("stpatrick_gnomette")
	end
	
	if OldOnFinished then
		OldOnFinished(inst, ...)
	end
end

ENV.AddPrefabPostInit("potato_oversized", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.workable then
		if OldOnFinished == nil then
			OldOnFinished = inst.components.workable.onfinish
		end
		
		inst.components.workable:SetOnFinishCallback(OnFinished)
	end
end)