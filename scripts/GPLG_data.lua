local fns = {}

local gnome_data = {
	["aprilfools_gnome"] = 			{default = 1, anim = "idle", bank = "aprilfools_gnome", build = "aprilfools_gnome"},
	["baby_angel_gnome"] = 			{default = 30},
	["baby_devil_gnome"] = 			{default = 1},
	["baby_gnome"] = 				{default = 1},
	["baby_knife_darkness_gnome"] = {default = 100, animloop_cd = {10, 30}},
	["baby_knife_gnome"] = 			{default = 100, animloop_cd = {10, 30}},
	["baby_knife_ice_gnome"] = 		{default = 100, animloop_cd = {10, 30}},
	["bearger_gnome"] = 			{default = 50},
	["beequeen_gnome"] = 			{default = 10},
	["beret_gnome"] = 				{default = 1},
	["boot_gnome"] = 				{default = 20},
	["buttcheek_gnome"] = 			{default = 1},
	["catcoon_gnome"] = 			{default = 1},
	["catcoon_silly_gnome"] = 		{default = 5},
	["chef_gnome"] = 				{default = 1},
	["derp_gnome"] = 				{default = 2},
	["derp_gnomette"] = 			{default = 2},
	["dfly_gnome1"] = 				{default = 10},
	["dfly_gnome2"] = 				{default = 100},
	["egg_gnome"] = 				{default = 10},
	["gloomy_gnome"] = 				{default = 1, desc = "chance_plus"},
	["gneo_gnome"] = 				{default = 50},
	["gnudist_gnome"] = 			{default = 1},
	["ice_gnome"] = 				{default = 10},
	["ice_gnomette"] = 				{default = 5},
	["jimbo_gnome"] = 				{default = 1400, options = "score", config = "score", desc = "score"},
	["mod_cherryforest_gnomette"] = {default = 10},
	["pirate_gnome"] = 				{default = 10, desc = "chance_plus"},
	["poop_gnome"] = 				{default = 1, master_fn = fns.SpawnFlies, prefabs = {"flies"}},
	["potted_gnome"] = 				{default = 1},
	["raincoat_gnomette"] = 		{default = 1},
	["snurtle_gnome"] = 			{default = 10},
	["stpatrick_gnome"] = 			{default = 2, tags = {"lucky"}},
	["stpatrick_gnomette"] = 		{default = 1, tags = {"lucky"}},
	["toadstool_gnome1"] = 			{default = 50},
	["toadstool_gnome2"] = 			{default = 100},
	["upsidedown_gnome"] = 			{default = 1},
	["plumber_brother_gnome1"] = 	{default = 1},
	["plumber_brother_gnome2"] = 	{default = 1},
}

--	Poop Gnome

fns.UpdateFlies = function(inst)
	if inst._flies and inst._flies:IsValid() then
		local x, y, z = inst.Transform:GetWorldPosition()
		if #FindPlayersInRange(x, y, z, 3, true) > 0 then
			inst._flies:Hide()
		else
			inst._flies:Show()
		end
	end
end

fns.SpawnFlies = function(inst)
	inst._flies = SpawnPrefab("flies")
	inst._flies.entity:SetParent(inst.entity)
	inst._flies.Transform:SetPosition(math.random() * 0.3 - 0.15, 0.5, math.random() * 0.3 - 0.15)
	
	inst._fliestask = inst:DoPeriodicTask(1, fns.UpdateFlies, 0)
end


gnome_data["poop_gnome"].master_fn = fns.SpawnFlies

--	St. Patrick's Gnomes

fns.GetStPatrickLuck = function(inst, owner)
	local base = TUNING.STPATRICK_GNOME_LUCK
	
	if owner and owner:HasTag("player") then
		base = base + TUNING.STPATRICK_GNOME_HELD_BONUS
	end
	
	if inst.components.stackable then
		local stack = inst.components.stackable:StackSize()
		if stack > 1 then
			base = base + (stack - 1) * TUNING.STPATRICK_GNOME_STACK_BONUS
		end
	end
	
	return base
end

--	April Fools Gnome

local TOMFOOLERIES = {
	idle = 20,
	giggle = 5,
	moustachespin = 5,
	moustachegrow = 5,
	tongue = 5,
}

fns.DoTomfooleries = function(inst, force_tomfoolery, prev_tomfoolery)
	local tomfoolery = force_tomfoolery or weighted_random_choice(TOMFOOLERIES)
	local cd = {8, 24}
	
	--	Shrink stache
	if prev_tomfoolery == "moustachegrow" then
		inst.AnimState:PlayAnimation("moustache_grow_normal")
		inst.AnimState:PushAnimation(inst._gnome_anim, false)
		tomfoolery = "moustacheshrink"
	--	Stop wiggle
	elseif prev_tomfoolery == "tonguewiggle" then
		inst.AnimState:PlayAnimation("tongue_grow_normal")
		inst.AnimState:PushAnimation(inst._gnome_anim, false)
	--	Keep wiggle
	elseif prev_tomfoolery == "tongue" then
		inst.AnimState:PlayAnimation("tongue_wiggle")
		inst.AnimState:PushAnimation("tongue_idle", false)
		tomfoolery = "tonguewiggle"
		cd = {4, 8}
	--	Do wiggle
	elseif tomfoolery == "tongue" then
		inst.AnimState:PlayAnimation("tongue_grow_long")
		inst.AnimState:PushAnimation("tongue_idle", false)
		cd = {4, 8}
	--	Do giggle
	elseif tomfoolery == "giggle" then
		inst.AnimState:PlayAnimation("giggle")
		inst.AnimState:PushAnimation(inst._gnome_anim, false)
	--	Spin stache
	elseif tomfoolery == "moustachespin" then
		inst.AnimState:PlayAnimation("moustache_spin_loop")
		inst.AnimState:PushAnimation(inst._gnome_anim, false)
	--	Grow stache
	elseif tomfoolery == "moustachegrow" then
		inst.AnimState:PlayAnimation("moustache_grow_big")
		inst.AnimState:PushAnimation("moustache_big_idle", false)
	--	Boring...
	elseif tomfoolery == "idle" then
		inst.AnimState:PlayAnimation(inst._gnome_anim, false)
	end
	
	inst._tomfooleries = inst:DoTaskInTime(GetRandomMinMax(cd[1], cd[2]), fns.DoTomfooleries, nil, tomfoolery)
end

fns.StartTomfooleries = function(inst)
	if inst._tomfooleries == nil then
		inst._tomfooleries = inst:DoTaskInTime(1, fns.DoTomfooleries)
	end
end

gnome_data["aprilfools_gnome"].master_fn = fns.StartTomfooleries

--

for k, v in pairs(gnome_data) do
	v.prefab = v.prefab or k
end

gnome_data.functions = fns

return gnome_data