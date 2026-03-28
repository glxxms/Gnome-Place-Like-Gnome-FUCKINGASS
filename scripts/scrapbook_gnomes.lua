local scrapbookdata = 
{
    ice_gnome                 = { deps = { "deerclops"                   } },
    ice_gnomette              = { deps = { "deerclops"                   } },
    egg_gnome                 = { deps = { "moose"                       } },
    bearger_gnome             = { deps = { "bearger"                     } },
    beret_gnome               = { deps = { "frog"                        } },
    dfly_gnome1               = { deps = { "dragonfly"                   } },
    dfly_gnome2               = { deps = { "dragonfly"                   } },
    beequeen_gnome            = { deps = { "beequeen"                    } },
    toadstool_gnome1          = { deps = { "toadstool"                   } },
    toadstool_gnome2          = { deps = { "toadstool_dark"              } },
    boot_gnome                = { deps = { "sharkboi"                    } },
    upsidedown_gnome          = { specialinfo = "GNOME_UPSIDEDOWN"         },
    derp_gnome                = { deps = { "tumbleweed"                  } },
    chef_gnome                = { deps = { "cookpot"                     } },
    potted_gnome              = { deps = { "tumbleweed"                  } },
    gnudist_gnome             = { deps = { "birchnutdrake"               } },
    buttcheek_gnome           = { deps = { "wetpouch"                    } },
    gneo_gnome                = { deps = { "shadow_knight"               } },
    snurtle_gnome             = { deps = { "snurtle"                     } },
    pirate_gnome              = { deps = { "prime_mate", "powder_monkey" } },
    gloomy_gnome              = { deps = { "terrorbeak"                  } }, -- Uhhh Nightmarebeak doesn't have an entry.
    stpatrick_gnome           = { deps = { "potato_oversized"            } },
    stpatrick_gnomette        = { deps = { "potato_oversized"            } },
    baby_gnome                = { deps = { "tumbleweed"                  } },
    baby_devil_gnome          = { deps = { "tumbleweed"                  } },
    baby_angel_gnome          = { deps = { "tumbleweed"                  } },
    baby_knife_gnome          = { deps = { "chester"                  } },
    baby_knife_darkness_gnome = { deps = { "chester"                  } },
    jimbo_gnome               = { deps = { "balatro_machine"             } },
    poop_gnome                = { deps = { "pigman"             } },
    baby_knife_ice_gnome      = { deps = { "chester"             } },
    catcoon_gnome             = { deps = { "catcoon"             } },
    catcoon_silly_gnome       = { deps = { "catcoon"             } },
    derp_gnomette             = { deps = { "tumbleweed"             } },
    raincoat_gnomette         = { specialinfo = "GNOME_UPSIDEDOWN"         },
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