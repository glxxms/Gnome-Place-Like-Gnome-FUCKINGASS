GLOBAL.GPLG_ATLAS = MODROOT.."images/GPLG_inventoryimages.xml"

Assets = {
	Asset("IMAGE", "images/GPLG_inventoryimages.tex"),
	Asset("ATLAS", "images/GPLG_inventoryimages.xml"),
	Asset("ATLAS_BUILD", "images/GPLG_inventoryimages.xml", 256),
	
	Asset("SOUNDPACKAGE", "sound/GPLG_sound.fev"),
	Asset("SOUND", "sound/GPLG_sound.fsb"),
}

PrefabFiles = {
	"GPLG_gnomes",
}

--	Inventory Images

local ALL_GNOMES = require("GPLG_data")

local ITEMS = {
	
}

for name, data in pairs(ALL_GNOMES) do
	if data.prefab then
		for i, v in ipairs(data.images or {name}) do
			table.insert(ITEMS, v)
		end
	end
end

for k, v in pairs(ITEMS) do
	RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/GPLG_inventoryimages.xml"), v..".tex")
end

--	Scrapbook Stuff

local scrapbook_prefabs = require("scrapbook_prefabs")
local scrapbookdata = require("screens/redux/scrapbookdata")

local SCRAPBOOK_GNOMES = require("scrapbook_gnomes")

for k, v in pairs(SCRAPBOOK_GNOMES) do
	scrapbook_prefabs[k] = true
	scrapbookdata[k] = v
end