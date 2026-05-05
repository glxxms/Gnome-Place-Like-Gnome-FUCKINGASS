local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- catcoon_gnome : 1% chance to drop on death.
-- catcoon_silly_gnome : 5% chance for a friendly catcoon to vomit it up.

local OldPickRandomGift
local function PickRandomGift(inst, tier, ...)
	if inst.components.lootdropper and math.random() <= TUNING.GNOME_DROP_RATES.CATCOON_SILLY_GNOME
		and inst.components.follower and inst.components.follower:GetLeader() then
		
		inst.components.lootdropper:SpawnLootPrefab("catcoon_silly_gnome")
	end
	
	return OldPickRandomGift and OldPickRandomGift(inst, tier, ...)
end

ENV.AddPrefabPostInit("catcoon", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("catcoon_gnome", TUNING.GNOME_DROP_RATES.CATCOON_GNOME)
	end
	
	if OldPickRandomGift == nil then
		OldPickRandomGift = inst.PickRandomGift
	end
	inst.PickRandomGift = PickRandomGift
end)