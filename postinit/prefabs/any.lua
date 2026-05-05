local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- mod_cherryforest_gnomette : 10% chance to drop when feeding a critter with its favorite food, yum.

ENV.AddPrefabPostInitAny(function(inst)
	if not TheWorld.ismastersim or not inst:HasTag("critter") then
		return inst
	end
	
	if inst.components.eater then
		local OldOnEat = inst.components.eater.oneatfn
		
		inst.components.eater:SetOnEatFn(function(inst, food, feeder, ...)
			if food and food.prefab == inst.favoritefood
				and math.random() <= TUNING.GNOME_DROP_RATES.MOD_CHERRYFOREST_GNOMETTE then
				
				inst:DoTaskInTime(0.5 + math.random(), function(inst)
					if feeder and feeder:IsValid() then
						local gnome = SpawnPrefab("mod_cherryforest_gnomette")
						gnome.Transform:SetPosition(inst.Transform:GetWorldPosition())
						
						LaunchAt(gnome, inst, feeder, 2)
					end
				end)
			end
			
			return OldOnEat and OldOnEat(inst, food, feeder, ...)
		end)
	end
end)