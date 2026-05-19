local ALL_GNOMES = require("GPLG_data")
local fns        = ALL_GNOMES.fns or {}

local function MakeGnome(name, data)
	local assets = {}
	
	local bank   = data.bank or "trinkets_gnomes"
	local build  = data.build or bank
	
	table.insert(assets, Asset("ANIM", "anim/"..bank..".zip"))
	if bank ~= build then
		table.insert(assets, Asset("ANIM", "anim/"..build..".zip"))
	end
	
	local prefabs = data.prefabs or {}
	
	--
	
	local function RepeatAnim(inst)
		inst.AnimState:PlayAnimation(data.anim or inst._gnome_anim, false)
		
		inst._animtask = inst:DoTaskInTime(GetRandomMinMax(data.animloop_cd[1], data.animloop_cd[2]), RepeatAnim)
	end
	
	--
	
	local function fn()
		local inst = CreateEntity()
		
		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddNetwork()
		inst.entity:AddFollower()
		
		MakeInventoryPhysics(inst)
		
		if not data.sinks then
			local floater = data.floater or {}
			
			MakeInventoryFloatable(inst, floater.size, floater.offset or 0.1, floater.scale or 0.7)
		end
		
		local should_loop = not (data.animloop_cd or not data.animloop)
		
		inst.AnimState:SetBank(bank)
		inst.AnimState:SetBuild(build)
		inst.AnimState:PlayAnimation(data.anim or name, should_loop)
		
		inst:AddTag("gnome")
		inst:AddTag("molebait") -- Sorry!
		inst:AddTag("cattoy")   -- Sorry!
		inst:AddTag("furnituredecor") -- You're welcome!
		inst:AddTag("trinket")
		
		if data.tags then
			for i, v in ipairs(data.tags) do
				inst:AddTag(v)
			end
		end
		
		if data.client_fn then
			data.client_fn(inst)
		end
		
		inst.entity:SetPristine()
		
		if not TheWorld.ismastersim then
			return inst
		end
		
		inst._gnome_anim    = data.anim or name
		inst._gnome_anim_cd = data.animloop_cd
		
		inst:AddComponent("furnituredecor")
		
		inst:AddComponent("inspectable")
		
		inst:AddComponent("inventoryitem")
		if data.sinks then
			inst.components.inventoryitem:SetSinks(true)
		end
		
		inst:AddComponent("stackable")
		inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
		
		inst:AddComponent("tradable")
		inst.components.tradable.goldvalue = data.goldvalue or TUNING.GOLD_VALUES.TRINKETS[4] or 3
		inst.components.tradable.rocktribute = math.ceil(inst.components.tradable.goldvalue / 3)
		
		if inst:HasTag("lucky") then
			inst:AddComponent("luckitem")
			inst.components.luckitem:SetLuck(fns.GetStPatrickLuck)
		end
		
		if data.animloop_cd then
			inst._animtask = inst:DoTaskInTime(GetRandomMinMax(data.animloop_cd[1], data.animloop_cd[2]), RepeatAnim)
		end
		
		if data.master_fn then
			data.master_fn(inst)
		end
		
		MakeHauntableLaunch(inst)
		
		return inst
	end
	
	return Prefab(name, fn, assets, prefabs)
end

--

local gnome_prefabs = {}

for prefab, data in pairs(ALL_GNOMES) do
	if not data.no_prefab then
		table.insert(gnome_prefabs, MakeGnome(prefab, data))
	end
end

return unpack(gnome_prefabs)