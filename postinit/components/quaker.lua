local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- upsidedown_gnome : 1% chance to fall during quakes.

local Quaker = require("components/quaker")
local OldQuaker_ctor = Quaker._ctor

Quaker._ctor = function(self, ...)
	OldQuaker_ctor(self, ...)
	
	local _debris = GnomeUpvalue(self.SetDebris, "_debris")
	
	if _debris then
		table.insert(_debris, {
			weight = TUNING.GNOME_DROP_RATES.UPSIDEDOWN_GNOME,
			loot = {"upsidedown_gnome"},
		})
	end
end