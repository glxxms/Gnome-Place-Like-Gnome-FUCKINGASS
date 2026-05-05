local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- baby_angel_gnome : 30% chance to drop when releasing a volatile canary on the surface.

ENV.AddStategraphPostInit("canarypoisoned", function(sg)
	local oldrecover_transform_enter = sg.states["recover_transform"].onenter
	sg.states["recover_transform"].onenter = function(inst, ...)
		if inst.components.lootdropper and math.random() <= TUNING.GNOME_DROP_RATES.BABY_ANGEL_GNOME then
			inst.components.lootdropper:SpawnLootPrefab("baby_angel_gnome")
		end
		
		oldrecover_transform_enter(inst, ...)
	end
end)