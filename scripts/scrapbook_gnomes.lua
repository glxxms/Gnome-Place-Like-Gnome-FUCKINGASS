local scrapbookdata =
{
    ice_gnome                 = { deps = { "deerclops" },          specialinfo = "GNOME_ICE" },
    ice_gnomette              = { deps = { "deerclops" },          specialinfo = "GNOME_ICE_GNOMETTE" },

    egg_gnome                 = { deps = { "moose" },              specialinfo = "GNOME_EGG" },
    bearger_gnome             = { deps = { "bearger" },            specialinfo = "GNOME_BEARGER" },
    beret_gnome               = { deps = { "frog" },               specialinfo = "GNOME_BERET" },

    dfly_gnome1               = { deps = { "dragonfly" },          specialinfo = "GNOME_DFLY_1" },
    dfly_gnome2               = { deps = { "dragonfly" },          specialinfo = "GNOME_DFLY_2" },

    beequeen_gnome            = { deps = { "beequeen" },           specialinfo = "GNOME_BEEQUEEN" },
    toadstool_gnome1          = { deps = { "toadstool" },          specialinfo = "GNOME_TOADSTOOL_1" },
    toadstool_gnome2          = { deps = { "toadstool_dark" },     specialinfo = "GNOME_TOADSTOOL_2" },

    boot_gnome                = { deps = { "sharkboi" },           specialinfo = "GNOME_BOOT" },
    upsidedown_gnome          = { deps = { "cavein_boulder" },     specialinfo = "GNOME_UPSIDEDOWN" },

    derp_gnome                = { deps = { "tumbleweed" },         specialinfo = "GNOME_DERP" },
    derp_gnomette             = { deps = { "tumbleweed" },         specialinfo = "GNOME_DERP_GNOMETTE" },

    chef_gnome                = { deps = { "cookpot" },            specialinfo = "GNOME_CHEF" },
    potted_gnome              = { deps = { "tumbleweed" },         specialinfo = "GNOME_POTTED" },

    gnudist_gnome             = { deps = { "birchnutdrake" },      specialinfo = "GNOME_GNUDIST" },
    buttcheek_gnome           = { deps = { "wetpouch" },           specialinfo = "GNOME_BUTTCHEEK" },

    gneo_gnome                = { deps = { "shadow_knight" },      specialinfo = "GNOME_GNEO" },
    gloomy_gnome              = { deps = { "terrorbeak" },         specialinfo = "GNOME_GLOOMY" },

    snurtle_gnome             = { deps = { "snurtle" },            specialinfo = "GNOME_SNURTLE" },
    pirate_gnome              = { deps = { "prime_mate", "powder_monkey" }, specialinfo = "GNOME_PIRATE" },

    stpatrick_gnome           = { deps = { "potato_oversized" },            specialinfo = "GNOME_STPATRICK" },
    stpatrick_gnomette        = { deps = { "potato_oversized" },            specialinfo = "GNOME_STPATRICK_GNOMETTE" },

    baby_gnome                = { deps = { "canary" },                      specialinfo = "GNOME_BABY" },
    baby_devil_gnome          = { deps = { "krampus" },                     specialinfo = "GNOME_BABY_DEVIL" },
    baby_angel_gnome          = { deps = { "canary" },                      specialinfo = "GNOME_BABY_ANGEL" },

    baby_knife_gnome          = { deps = { "chester" },            specialinfo = "GNOME_KNIFE" },
    baby_knife_darkness_gnome = { deps = { "chester" },            specialinfo = "GNOME_KNIFE_DARKNESS" },
    baby_knife_ice_gnome      = { deps = { "chester" },            specialinfo = "GNOME_KNIFE_ICE" },

    jimbo_gnome               = { deps = { "balatro_machine" },    specialinfo = "GNOME_JIMBO" },

    poop_gnome                = { deps = { "pigman" },             specialinfo = "GNOME_POOP" },

    catcoon_gnome             = { deps = { "catcoon" },            specialinfo = "GNOME_CATCOON" },
    catcoon_silly_gnome       = { deps = { "catcoon" },            specialinfo = "GNOME_CATCOON_SILLY" },

    raincoat_gnomette         = { deps = { "rainometer" },                  specialinfo = "GNOME_RAINCOAT" },
}

-- Command to unlock everything in the scrapbook: TheScrapbookPartitions:DebugUnlockEverything()
-- * You must run it in local mode *

-- Simplified them because they're basically the same prefab
-- you can manually edit each one by using the parameters below on the table above.
-- for more parameters and custom logic see debugcommands.lua line 2503.
-- i.e cool_gnome = { stacksize = 10, bank = "coolbank", build = "coolbuild", anim = "coolanim" } etc.
for k, v in pairs(scrapbookdata) do
    v.name = v.name or k
    v.prefab = k
    v.tex = k..".tex"

    v.type = v.type or "item"
    v.subcat = v.subcat or "trinket"
    v.stacksize = v.stacksize or 40

    v.bank = v.bank or "trinkets_gnomes"
    v.build = v.build or "trinkets_gnomes"
    v.anim = v.anim or k
end

return scrapbookdata