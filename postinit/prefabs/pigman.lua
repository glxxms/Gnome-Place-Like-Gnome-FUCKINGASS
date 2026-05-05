local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- poop_gnome : 1% chance to to drop when werepig poops.

local OldOnEat
local function OnEat(inst, food, ...)
	if food and food.components.edible and food.components.edible.foodtype == FOODTYPE.VEGGIE
		and inst.components.werebeast and inst.components.werebeast:IsInWereState()
		and math.random() <= TUNING.GNOME_DROP_RATES.POOP_GNOME then
		
		SpawnPrefab("poop_gnome").Transform:SetPosition(inst.Transform:GetWorldPosition())
	end
	
	return OldOnEat and OldOnEat(inst, food, ...)
end

ENV.AddPrefabPostInit("pigman", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.eater then
		if OldOnEat == nil then
			OldOnEat = inst.components.eater.oneatfn
		end
		
		inst.components.eater:SetOnEatFn(OnEat)
	end
end)