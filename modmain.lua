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



























