local _G                 = GLOBAL
local require            = _G.require
local scrapbook_prefabs  = require("scrapbook_prefabs")
local scrapbookdata      = require("screens/redux/scrapbookdata")

local SCRAPBOOK_GNOMES   = require("scrapbook_gnomes")

for k, v in pairs(SCRAPBOOK_GNOMES) do
    scrapbook_prefabs[k] = true
    scrapbookdata[k]     = v
end