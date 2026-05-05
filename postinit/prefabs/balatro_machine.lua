local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- jimbo_gnome : added to JIMBO rewards when scoring at least 1400.

local OldEndInteraction
local function EndInteraction(inst, ...)
	local total_score = 0
	
	if inst._currentgame and inst._currentgame.joker then
		total_score = (inst._currentgame.joker._chips or 0) * (inst._currentgame.joker._mult or 1)
	end
	
	inst._got_jimbo_gnome = total_score >= TUNING.GNOME_DROP_RATES.JIMBO_GNOME -- 1400+
	
	if OldEndInteraction then
		OldEndInteraction(inst, ...)
	end
end

local OldSpawnRewards
local function SpawnRewards(inst, doer, score, loot, ...)
	if inst._got_jimbo_gnome then
		inst._got_jimbo_gnome = nil
		SpawnRewards(inst, doer, score, {"jimbo_gnome", 1}, ...)
	end
	
	if OldSpawnRewards then
		OldSpawnRewards(inst, doer, score, loot, ...)
	end
end

-- Command for testing looting the gnome (while playing in the machine) :
-- c_selectnext("balatro_machine")._currentgame.joker._chips = TUNING.GNOME_DROP_RATES.JIMBO_GNOME

ENV.AddPrefabPostInit("balatro_machine", function(inst)
	OldEndInteraction = GnomeUpvalue(Prefabs.balatro_machine.fn, "EndInteraction")
	local StartRewardsSequence = GnomeUpvalue(OldEndInteraction, "StartRewardsSequence")
	local DoDelayedRewards = GnomeUpvalue(StartRewardsSequence, "DoDelayedRewards")
	OldSpawnRewards = GnomeUpvalue(DoDelayedRewards, "SpawnRewards")
	
	if OldSpawnRewards then
		GnomeUpvalue(DoDelayedRewards, "SpawnRewards", SpawnRewards)
		GnomeUpvalue(Prefabs.balatro_machine.fn, "EndInteraction", EndInteraction)
	end
end)