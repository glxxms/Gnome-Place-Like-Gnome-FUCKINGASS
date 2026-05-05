local ALL_GNOMES = require("GPLG_data")

function GetGnomeDropRate(config, default_rate, mult, mod)
	local ModName = KnownModIndex:GetModActualName(mod or "Gnome Place Like Gnome")
	
	return (GetModConfigData(config, ModName) or default_rate) * mult
end

--	Drop Rates

TUNING.GNOME_DROP_RATES = {}

for name, data in pairs(ALL_GNOMES) do
	if data.prefab then
		local mult = not data.options and 0.01 or 1
		
		TUNING.GNOME_DROP_RATES[string.upper(name)] = GetGnomeDropRate("chance_"..name, data.default, mult)
	end
end

TUNING.GNOME_DROP_RATES.GLOOMY_GNOME2 = math.min(1, TUNING.GNOME_DROP_RATES.GLOOMY_GNOME * 5)
TUNING.GNOME_DROP_RATES.PIRATE_GNOME2 =  math.min(1, TUNING.GNOME_DROP_RATES.PIRATE_GNOME * 2)

--	Perks

TUNING.STPATRICK_GNOME_LUCK = 0.1
TUNING.STPATRICK_GNOME_HELD_BONUS = 0.15
TUNING.STPATRICK_GNOME_STACK_BONUS = 0.02