local ENV = env
GLOBAL.setfenv(1, GLOBAL)

-- chef_gnome : 1% chance to drop when a meal is done cooking.

local Stewer = require("components/stewer")

local OldStartCooking = Stewer.StartCooking
function Stewer:StartCooking(...)
	local test = OldStartCooking(self, ...)
	
	self.inst:DoTaskInTime(self:GetTimeToCook() or 1, function()
		if self.product and self.inst.components.lootdropper and math.random() < TUNING.GNOME_DROP_RATES.CHEF_GNOME then -- Down from 5%
			self.inst.components.lootdropper:SpawnLootPrefab("chef_gnome")
		end
	end)
	
	return test
end