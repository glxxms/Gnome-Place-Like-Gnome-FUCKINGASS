local ENV = env
GLOBAL.setfenv(1, GLOBAL)

local SCRAPBOOK_GNOMES = require("scrapbook_gnomes")

ENV.AddPlayerPostInit(function(inst)
	if TheScrapbookPartitions then
		for k, v in pairs(SCRAPBOOK_GNOMES) do
			TheScrapbookPartitions:SetViewedInScrapbook(k)
		end
	end
end)