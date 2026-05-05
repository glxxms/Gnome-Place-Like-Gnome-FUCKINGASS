name = "Gnome Place Like Gnome"
author = "gloomy"
version = "0.6"
local info_version = "󰀔 [ Version "..version.." ]"

description = info_version..[[ 

Collectible gnomes! Collect them! All of them!]]

forumthread = ""

api_version = 10

all_clients_require_mod = true
dst_compatible = true

icon_atlas = "GPLG.xml"
icon = "GPLG.tex"

server_filter_tags = {
	"gloomy",
	"gnome",
	"gnomes",
	"collectibles",
}

local options = {
	none = {{description = "", data = false}},
	toggle = {{description = "Disabled", data = false}, {description = "Enabled", data = true}},
	language = {{description = "English", hover = "By gloomy.", data = false}},
	chance = {},
	score = {},
}

local descs = {
	language = "Change the mod language.",
	chance = "Chance for this gnome to appear under its specific condition...\n(Check \"Gnome\" in your scrapbook for hints!)",
	chance_plus = "Chance for this gnome to appear under a specific condition...\n(Some other sources have increased chances!)",
	score = "Reach this score or higher with JIMBO for this gnome to appear.",
}

local configs = {
	language = "Language ",
	chance = "Drop Rate ",
	score = "Score ",
}

local function AmtConfig(self, suffix, max, step, min)
	local config = 1
	for i = min or step or 1, max, step or 1 do
		self[config] = {description = i..(suffix or ""), data = i}
		config = config + 1
	end
end

AmtConfig(options.chance, "%", 100, 1, 0)
AmtConfig(options.score, nil, 2000, 100)

configuration_options = {
	--{name = "language", label = configs.language, hover = descs.language, options = options.language, default = false},
	
	-- AUTO-GENERATED GNOME CONFIGS START
	{name = "aprilfools_gnome", label = "April Fools Gnome", options = options.none, default = false},
	{name = "chance_aprilfools_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "baby_angel_gnome", label = "Angel Gnomlet", options = options.none, default = false},
	{name = "chance_baby_angel_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 30},

	{name = "baby_devil_gnome", label = "Devil Gnomlet", options = options.none, default = false},
	{name = "chance_baby_devil_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "baby_gnome", label = "Gnomlet", options = options.none, default = false},
	{name = "chance_baby_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "baby_knife_darkness_gnome", label = "Knife-Wielding Shadow Gnomlet", options = options.none, default = false},
	{name = "chance_baby_knife_darkness_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 100},

	{name = "baby_knife_gnome", label = "Knife-Wielding Gnomlet", options = options.none, default = false},
	{name = "chance_baby_knife_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 100},

	{name = "baby_knife_ice_gnome", label = "Knife-Wielding Ice Gnomlet", options = options.none, default = false},
	{name = "chance_baby_knife_ice_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 100},

	{name = "bearger_gnome", label = "Bearger Gnome", options = options.none, default = false},
	{name = "chance_bearger_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 50},

	{name = "beequeen_gnome", label = "Bee Queen Gnome", options = options.none, default = false},
	{name = "chance_beequeen_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 10},

	{name = "beret_gnome", label = "Beret Gnome", options = options.none, default = false},
	{name = "chance_beret_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "boot_gnome", label = "Boot Gnome", options = options.none, default = false},
	{name = "chance_boot_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 20},

	{name = "buttcheek_gnome", label = "Buttcheek Gnome", options = options.none, default = false},
	{name = "chance_buttcheek_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "catcoon_gnome", label = "Catcoon Gnome", options = options.none, default = false},
	{name = "chance_catcoon_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "catcoon_silly_gnome", label = "Silly Catcoon Gnome", options = options.none, default = false},
	{name = "chance_catcoon_silly_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 5},

	{name = "chef_gnome", label = "Chef Gnome", options = options.none, default = false},
	{name = "chance_chef_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "derp_gnome", label = "Derp Gnome", options = options.none, default = false},
	{name = "chance_derp_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 2},

	{name = "derp_gnomette", label = "Derp Gnomette", options = options.none, default = false},
	{name = "chance_derp_gnomette", label = configs.chance, hover = descs.chance, options = options.chance, default = 2},

	{name = "dfly_gnome1", label = "Dragonfly Gnome", options = options.none, default = false},
	{name = "chance_dfly_gnome1", label = configs.chance, hover = descs.chance, options = options.chance, default = 10},

	{name = "dfly_gnome2", label = "Enraged Dragonfly Gnome", options = options.none, default = false},
	{name = "chance_dfly_gnome2", label = configs.chance, hover = descs.chance, options = options.chance, default = 100},

	{name = "egg_gnome", label = "Egg Gnome", options = options.none, default = false},
	{name = "chance_egg_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 10},

	{name = "gloomy_gnome", label = "Gloomy Gnome", options = options.none, default = false},
	{name = "chance_gloomy_gnome", label = configs.chance, hover = descs.chance_plus, options = options.chance, default = 1},

	{name = "gneo_gnome", label = "Gneo Gnome", options = options.none, default = false},
	{name = "chance_gneo_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 50},

	{name = "gnudist_gnome", label = "Gnudist Gnome", options = options.none, default = false},
	{name = "chance_gnudist_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "ice_gnome", label = "Ice Gnome", options = options.none, default = false},
	{name = "chance_ice_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 10},

	{name = "ice_gnomette", label = "Ice Gnomette", options = options.none, default = false},
	{name = "chance_ice_gnomette", label = configs.chance, hover = descs.chance, options = options.chance, default = 5},

	{name = "jimbo_gnome", label = "Jimbo Gnome", options = options.none, default = false},
	{name = "chance_jimbo_gnome", label = configs.score, hover = descs.score, options = options.score, default = 1400},

	{name = "mod_cherryforest_gnomette", label = "Cheery Gnomette", options = options.none, default = false},
	{name = "chance_mod_cherryforest_gnomette", label = configs.chance, hover = descs.chance, options = options.chance, default = 10},

	{name = "pirate_gnome", label = "Pirate Gnome", options = options.none, default = false},
	{name = "chance_pirate_gnome", label = configs.chance, hover = descs.chance_plus, options = options.chance, default = 10},

	{name = "poop_gnome", label = "Poop Gnome", options = options.none, default = false},
	{name = "chance_poop_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "potted_gnome", label = "Potted Gnome", options = options.none, default = false},
	{name = "chance_potted_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "raincoat_gnomette", label = "Raincoat Gnomette", options = options.none, default = false},
	{name = "chance_raincoat_gnomette", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "snurtle_gnome", label = "Snurtle Gnome", options = options.none, default = false},
	{name = "chance_snurtle_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 10},

	{name = "stpatrick_gnome", label = "St. Patrick's Gnome", options = options.none, default = false},
	{name = "chance_stpatrick_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 2},

	{name = "stpatrick_gnomette", label = "St. Patrick's Gnomette", options = options.none, default = false},
	{name = "chance_stpatrick_gnomette", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	{name = "toadstool_gnome1", label = "Toadstool Gnome", options = options.none, default = false},
	{name = "chance_toadstool_gnome1", label = configs.chance, hover = descs.chance, options = options.chance, default = 50},

	{name = "toadstool_gnome2", label = "Misery Toadstool Gnome", options = options.none, default = false},
	{name = "chance_toadstool_gnome2", label = configs.chance, hover = descs.chance, options = options.chance, default = 100},

	{name = "upsidedown_gnome", label = "Upside-down Gnome", options = options.none, default = false},
	{name = "chance_upsidedown_gnome", label = configs.chance, hover = descs.chance, options = options.chance, default = 1},

	-- AUTO-GENERATED GNOME CONFIGS END
}