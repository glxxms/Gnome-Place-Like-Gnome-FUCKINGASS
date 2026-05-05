local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- pirate_gnome : 10% chance to drop in powder monkeys loot, or 20% from prime mates.

ENV.AddPrefabPostInit("powder_monkey", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("pirate_gnome", TUNING.GNOME_DROP_RATES.PIRATE_GNOME)
	end
end)

ENV.AddPrefabPostInit("prime_mate", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("pirate_gnome", TUNING.GNOME_DROP_RATES.PIRATE_GNOME2)
	end
end)