
local _G            = GLOBAL
local TECH 			= _G.TECH
local Ingredient 	= _G.Ingredient
local RECIPETABS 	= _G.RECIPETABS
local AllRecipes 	= _G.AllRecipes
local Recipe 		= _G.Recipe
local Recipe2 		= _G.Recipe2
local TechTree 		= require("techtree")
local RecipeFilter	= require("recipes_filter")

local function SortRecipe(a, b, filter_name, offset)
    local filter = _G.CRAFTING_FILTERS[filter_name]
    if filter and filter.recipes then
        for sortvalue, product in ipairs(filter.recipes) do
            if product == a then
                table.remove(filter.recipes, sortvalue)
                break
            end
        end

        local target_position = #filter.recipes + 1
        for sortvalue, product in ipairs(filter.recipes) do
            if product == b then
                target_position = sortvalue + offset
                break
            end
        end

        table.insert(filter.recipes, target_position, a)
    end
end 
 
local function SortBefore(a, b, filter_name)
    SortRecipe(a, b, filter_name, 0)
end 

local function SortAfter(a, b, filter_name)
    SortRecipe(a, b, filter_name, 1)
end


--[[
AddRecipe2("NAME", {
		Ingredient("trinket_4",	1), 
		Ingredient("SHIT",	5), 
	}, 
	--RECIPETABS.WAR, 
	TECH.MAGIC_TWO, 
	{
		nounlock 			= false,
		no_deconstruction   = true,	
		actionstr			= "QUAGMIRE_TRADER_MERM1",
		sg_state    		= "give",
		product				= "NAME",
		numtogive 			= 1, 
		atlas 				= "images/GPLPinventoryimages.xml", 
		image 				= "NAME.tex",
	},
	{"WEAPON"}
)]]

