local _G      = GLOBAL
local require = _G.require

local scripts =
{
	"assets",
	"prefabs",
	"recipes",
	"strings",
	"tuning",
}

local init    =
{
	"postinit",
	"scrapbook",
}

for _, v in pairs(scripts) do
	modimport("scripts/"..v)
end

for _, v in pairs(init) do
	modimport("init/"..v)
end




















