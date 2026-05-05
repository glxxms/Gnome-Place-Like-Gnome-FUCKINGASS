local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- gloomy_gnome : 1% chance to drop in terror beak loot, or 5% if spawned from nightmare cycle.

ENV.AddPrefabPostInit("terrorbeak", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("gloomy_gnome", TUNING.GNOME_DROP_RATES.GLOOMY_GNOME)
	end
end)

ENV.AddPrefabPostInit("nightmarebeak", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	
	if inst.components.lootdropper then
		inst.components.lootdropper:AddChanceLoot("gloomy_gnome", TUNING.GNOME_DROP_RATES.GLOOMY_GNOME2)
	end
end)