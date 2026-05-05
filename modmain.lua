require("GPLG_tuning")

--	Strings, Translations

require("gnomes_strings/strings")

local translation = GetModConfigData("language")

if translation then
	require("gnomes_strings/"..translation)
end

--	Main, Postinits

require("GPLG_util")

local inits = {
	"assets",
}

for _, v in pairs(inits) do
	modimport("init/"..v)
end

local prefabs = {
	"any",
	"balatro_machine",
	"bearger",
	"beequeen",
	"birchnutdrake",
	"canary",
	"catcoon",
	"chester",
	"deerclops",
	"dragonfly",
	"frog",
	"hedgehound",
	"krampus",
	"moose",
	"pigman",
	"potato",
	"powder_monkey",
	"rainometer",
	"shadow_knight",
	"sharkboi",
	"snurtle",
	"terrorbeak",
	"toadstool",
	"tumbleweed",
	"wetpouch",
	"wilson",
}

local components = {
	"quaker",
	"stewer",
}

local stategraphs = {
	"canarypoisoned",
}

for _, v in pairs(prefabs) do
	modimport("postinit/prefabs/"..v)
end

for _, v in pairs(components) do
	modimport("postinit/components/"..v)
end

for _, v in pairs(stategraphs) do
	modimport("postinit/stategraphs/"..v)
end