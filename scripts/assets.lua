
local _G      = GLOBAL
local require = _G.require

Assets = 
{	
    Asset("ANIM", "anim/trinkets_gnomes.zip"),
	
    Asset("IMAGE", "images/GPLG_inventoryimages.tex"),
    Asset("ATLAS", "images/GPLG_inventoryimages.xml"),
    Asset("ATLAS_BUILD", "images/GPLG_inventoryimages.xml", 256),
}

local GNOMES_ICONS =
{
    "ice_gnome",
    "ice_gnomette",
    "egg_gnome",
    "bearger_gnome",
    "beret_gnome",
    "dfly_gnome1",
    "dfly_gnome2",
    "beequeen_gnome",
    "toadstool_gnome1",
    "toadstool_gnome2",
    "boot_gnome",
    "upsidedown_gnome",
    "derp_gnome",
    "chef_gnome",
    "potted_gnome",
    "gnudist_gnome",
    "buttcheek_gnome",
    "gneo_gnome",
    "snurtle_gnome",
    "pirate_gnome",
    "gloomy_gnome",
    "stpatrick_gnome",
    "stpatrick_gnomette",
}

for k, v in pairs(GNOMES_ICONS) do
    RegisterInventoryItemAtlas("images/GPLG_inventoryimages.xml", v..".tex")
end

-- Hack for mod items not appearing in Mini Signs.
local _GetInventoryItemAtlas = _G.GetInventoryItemAtlas
_G.GetInventoryItemAtlas = function(name, ...)
    local myatlas = _G.resolvefilepath("images/GPLG_inventoryimages.xml")

    if _G.TheSim:AtlasContains(myatlas, name) then
        return myatlas
    end

    return _GetInventoryItemAtlas(name, ...)
end