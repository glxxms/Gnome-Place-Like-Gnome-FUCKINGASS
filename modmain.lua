local _G				= GLOBAL
local require			= GLOBAL.require
local cooking			= require("cooking")
local STRINGS			= GLOBAL.STRINGS
local TECH				= GLOBAL.TECH
local Ingredient		= GLOBAL.Ingredient
local RECIPETABS		= GLOBAL.RECIPETABS
local Recipe			= GLOBAL.Recipe
local resolvefilepath	= GLOBAL.resolvefilepath
local ACTIONS			= GLOBAL.ACTIONS
local Action			= GLOBAL.Action
local ActionHandler		= GLOBAL.ActionHandler
local AllRecipes		= GLOBAL.AllRecipes
local TUNING			= GLOBAL.TUNING
local SpawnPrefab		= GLOBAL.SpawnPrefab
local Vector3			= GLOBAL.Vector3

local RPC				= GLOBAL.RPC
local BufferedAction	= GLOBAL.BufferedAction
local SendRPCToServer	= GLOBAL.SendRPCToServer


require("recipes")


local init =
{
	--"placeholder",
	"postinit",
}

local scripts =
{
	"assets",
	"prefabs",
	"recipes",
	"strings",
	"tuning",
}

for _, v in pairs(init) do
		modimport("init/"..v)
end

for _, v in pairs(scripts) do
		modimport("scripts/"..v)
end

-- Test
--[[
local scrapbook_prefabs = require("scrapbook_prefabs")
local scrapbookdata = require("screens/redux/scrapbookdata")

local SCRAPBOOK_GNOMES = require("scrapbook_gnomes") -- Your file for scrapbook content

for k, v in pairs(SCRAPBOOK_GNOMES) do
    scrapbook_prefabs[k] = true
    scrapbookdata[k] = v
end

local scrapbookdata = {
    gnometrinket1 = {type = "item", subcat = "trinket", stacksize = 40, build = "theirbuild", bank = "theirbank", anim = "1", deps = {"related_prefab_if_any"}},
    gnometrinket2 = {type = "item", subcat = "trinket", stacksize = 40, build = "theirbuild", bank = "theirbank", anim = "2", deps = {"for_example", "the_mob_droping_it"}},
}

for k, v in pairs(scrapbookdata) do
    v.name = v.name or k
    v.prefab = k
    v.tex = k..".tex"
end

return scrapbookdata
]]























