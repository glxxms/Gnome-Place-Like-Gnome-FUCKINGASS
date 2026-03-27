local _G            = GLOBAL
local STRINGS       = _G.STRINGS
local NAMES         = STRINGS.NAMES
local RECIPE_DESC   = STRINGS.RECIPE_DESC


STRINGS.GPLG_STRINGS = {}

local function SetItemsDescribeStrings(item_name, strings)
	for character,str in pairs(strings) do
		STRINGS.CHARACTERS[string.upper(character)].DESCRIBE[string.upper(item_name)] = str
	end
end

--[[ Was just testing!
local TEST_STRINGS = {
    GENERIC      = "TODO",
    WAXWELL      = "TODO",
    WOLFGANG     = "TODO",
    WX78         = "TODO",
    WILLOW       = "TODO",
    WENDY        = "TODO",
    WOODIE       = "TODO",
    WICKERBOTTOM = "TODO",
    WATHGRITHR   = "TODO",
    WEBBER       = "TODO",
    WINONA       = "TODO",
    WORTOX       = "TODO",
    WORMWOOD     = "TODO",
    WALTER       = "TODO",
    WARLY        = "TODO",
    WURT         = "TODO",
    WANDA        = "TODO",
}
NAMES.TEST			= "TODO"
RECIPE_DESC.TEST	= "TODO"
SetItemsDescribeStrings("TEST", TEST_STRINGS)
]]

STRINGS.SCRAPBOOK.SPECIALINFO.GNOME_UPSIDEDOWN = "Using text because well, you know... earthquakes are not a scrapbook thing :)"

local ICE_GNOME_STRINGS =
{
    GENERIC      = "A chilly little fellow.",
    WAXWELL      = "A frozen curiosity.",
    WOLFGANG     = "Tiny ice man!",
    WX78         = "FROZEN DECORATIVE UNIT.",
    WILLOW       = "Cold. Boring.",
    WENDY        = "Even frost can take a shape.",
    WOODIE       = "Looks cold, eh.",
    WICKERBOTTOM = "A figurine preserved in frost.",
    WATHGRITHR   = "A warrior lost to winter!",
    WEBBER       = "He looks cold!",
    WINONA       = "Somebody carved that nice.",
    WORTOX       = "Brrr! Frosty little imp!",
    WORMWOOD     = "Cold friend.",
    WALTER       = "Ice.",
    WARLY        = "Too cold for cooking.",
    WURT         = "Cold gnome! Brrrp!",
    WANDA        = "Frozen in time.",
}
NAMES.ICE_GNOME = "Ice Gnome"
SetItemsDescribeStrings("ICE_GNOME", ICE_GNOME_STRINGS)

local ICE_GNOMETTE_STRINGS =
{
    GENERIC      = "A frosty little lady.",
    WAXWELL      = "An elegant frozen statuette.",
    WOLFGANG     = "Little ice lady!",
    WX78         = "SUB-ZERO DECORATIVE UNIT.",
    WILLOW       = "Still boring.",
    WENDY        = "Cold beauty.",
    WOODIE       = "Bit frosty there.",
    WICKERBOTTOM = "A feminine variant of the icy figurine.",
    WATHGRITHR   = "A maiden of winter!",
    WEBBER       = "She's icy!",
    WINONA       = "Cute little sculpture.",
    WORTOX       = "Frosty and fancy!",
    WORMWOOD     = "Cold lady.",
    WALTER       = "She's neat!",
    WARLY        = "Too frozen for garnish.",
    WURT         = "Cold lady gnome!",
    WANDA        = "Preserved beautifully.",
}
NAMES.ICE_GNOMETTE = "Ice Gnomette"
SetItemsDescribeStrings("ICE_GNOMETTE", ICE_GNOMETTE_STRINGS)

--

local EGG_GNOME_STRINGS =
{
    GENERIC      = "Egg-cellent!",
    WAXWELL      = "A most peculiar ornament.",
    WOLFGANG     = "Egg man!",
    WX78         = "OVAL GNOME UNIT.",
    WILLOW       = "It looks fragile.",
    WENDY        = "A shell, cracked.",
    WOODIE       = "Looks like breakfast.",
    WICKERBOTTOM = "Curiously oviform.",
    WATHGRITHR   = "A warrior egg!",
    WEBBER       = "Egg friend!",
    WINONA       = "That's a weird one.",
    WORTOX       = "Egg-cellent!",
    WORMWOOD     = "Egg gnome.",
    WALTER       = "I like it!",
    WARLY        = "Needs butter.",
    WURT         = "Egg friend!",
    WANDA        = "Oddly timeless.",
}
NAMES.EGG_GNOME = "Egg Gnome"
SetItemsDescribeStrings("EGG_GNOME", EGG_GNOME_STRINGS)

--

local DFLY_GNOME1_STRINGS =
{
    GENERIC      = "It mimics something far more dangerous.",
    WAXWELL      = "A restrained likeness.",
    WOLFGANG     = "Gnome looks tough! Is it tough?",
    WX78         = "THREAT IMITATION DETECTED.",
    WILLOW       = "It's trying to be intimidating.",
    WENDY        = "A still image of something restless.",
    WOODIE       = "Seen the real thing. This ain't it.",
    WICKERBOTTOM = "A sculpted interpretation of the Dragonfly.",
    WATHGRITHR   = "A warrior frozen mid-fury.",
    WEBBER       = "It looks like it could wake up!",
    WINONA       = "Someone put a lot of detail into this.",
    WORTOX       = "A little echo of a big tantrum!",
    WORMWOOD     = "Not moving friend.",
    WALTER       = "It feels like it's watching me...",
    WARLY        = "All form, no bite.",
    WURT         = "Looks scary, but not scary, florp.",
    WANDA        = "Time has pinned it in place.",
}

NAMES.DFLY_GNOME1 = "Dragonfly Gnome"

SetItemsDescribeStrings("DFLY_GNOME1", DFLY_GNOME1_STRINGS)

local DFLY_GNOME2_STRINGS =
{
    GENERIC      = "It looks ready to erupt, but never does.",
    WAXWELL      = "A fury captured, then stilled.",
    WOLFGANG     = "Very angry gnome! Still not hot.",
    WX78         = "WARNING: VISUAL THREAT ONLY.",
    WILLOW       = "It's trying so hard.",
    WENDY        = "All that rage, trapped in stillness.",
    WOODIE       = "Feels like it should explode.",
    WICKERBOTTOM = "Depicts the Dragonfly in an agitated state.",
    WATHGRITHR   = "Its wrath is bound!",
    WEBBER       = "He looks REALLY spicy!",
    WINONA       = "Looks unstable... but isn't.",
    WORTOX       = "So much rage, so little payoff!",
    WORMWOOD     = "Angry fire friend.",
    WALTER       = "I don't think it'll actually do anything... right?",
    WARLY        = "Overcooked in appearance only.",
    WURT         = "Angry gnome! No burn, florp.",
    WANDA        = "A tantrum frozen in time.",
}

NAMES.DFLY_GNOME2 = "Enraged Dragonfly Gnome"

SetItemsDescribeStrings("DFLY_GNOME2", DFLY_GNOME2_STRINGS)

--

local BEEQUEEN_GNOME_STRINGS =
{
    GENERIC      = "Sticky royalty.",
    WAXWELL      = "A regal insectoid effigy.",
    WOLFGANG     = "Queen gnome!",
    WX78         = "APIARY MONARCH UNIT.",
    WILLOW       = "Covered in honey, probably.",
    WENDY        = "Even queens crumble.",
    WOODIE       = "Buzz buzz.",
    WICKERBOTTOM = "A tribute to apian royalty.",
    WATHGRITHR   = "A buzzing monarch!",
    WEBBER       = "Bee queen friend!",
    WINONA       = "Someone put effort in that.",
    WORTOX       = "Buzzing majesty!",
    WORMWOOD     = "Bee queen.",
    WALTER       = "Neat!",
    WARLY        = "Sticky sweet.",
    WURT         = "Buzz gnome!",
    WANDA        = "Royalty rarely lasts.",
}
NAMES.BEEQUEEN_GNOME = "Bee Queen Gnome"
SetItemsDescribeStrings("BEEQUEEN_GNOME", BEEQUEEN_GNOME_STRINGS)

--

local BEARGER_GNOME_STRINGS =
{
    GENERIC      = "It's trying very hard to look big.",
    WAXWELL      = "A small creature with oversized ambition.",
    WOLFGANG     = "Tiny bear man! Not so scary.",
    WX78         = "SIZE: INSUFFICIENT. ATTITUDE: EXCESSIVE.",
    WILLOW       = "Aw, it thinks it's tough.",
    WENDY        = "A soft thing pretending at ruin.",
    WOODIE       = "That little guy wouldn't last a day in the woods.",
    WICKERBOTTOM = "A curious, bear-like figurine with exaggerated features.",
    WATHGRITHR   = "A warrior in spirit, if not in scale.",
    WEBBER       = "He�s got fuzzy ears! I like him!",
    WINONA       = "Looks like it could knock over... a cup, maybe.",
    WORTOX       = "A puffed-up little rascal!",
    WORMWOOD     = "Soft friend. Loud energy.",
    WALTER       = "It looks like Bearger! Just... really small.",
    WARLY        = "All fluff, no force.",
    WURT         = "Tiny smashy gnome! Florp!",
    WANDA        = "An overstatement, reduced.",
}

NAMES.BEARGER_GNOME = "Bearger Gnome"

SetItemsDescribeStrings("BEARGER_GNOME", BEARGER_GNOME_STRINGS)

--

local TOADSTOOL_GNOME1_STRINGS =
{
    GENERIC      = "That's a very committed costume.",
    WAXWELL      = "A poor soul buried beneath excess.",
    WOLFGANG     = "Tiny frog gnome!",
    WX78         = "COSTUME BULK: EXCESSIVE.",
    WILLOW       = "Ew. It's kind of squishy.",
    WENDY        = "Something small, hidden under all that.",
    WOODIE       = "That's a bit much for a little guy, eh.",
    WICKERBOTTOM = "An exaggerated imitation of the Toadstool creature.",
    WATHGRITHR   = "A warrior clad in swollen hide!",
    WEBBER       = "He's wearing a frog suit!",
    WINONA       = "Looks heavy.",
    WORTOX       = "Heehee! Dressed for disaster!",
    WORMWOOD     = "Gnome in frog skin.",
    WALTER       = "I think it's supposed to be that cave frog...",
    WARLY        = "Overstuffed.",
    WURT         = "Big frog gnome! Lumpy, florp!",
    WANDA        = "Too much for such a small frame.",
}

NAMES.TOADSTOOL_GNOME1 = "Toadstool Gnome"

SetItemsDescribeStrings("TOADSTOOL_GNOME1", TOADSTOOL_GNOME1_STRINGS)


local TOADSTOOL_GNOME2_STRINGS =
{
    GENERIC      = "I can't tell where the gnome ends.",
    WAXWELL      = "Completely lost beneath it.",
    WOLFGANG     = "Angry frog suit...",
    WX78         = "GNOME VISIBILITY: COMPROMISED.",
    WILLOW       = "Okay, that's actually gross.",
    WENDY        = "Consumed by what it chose to wear.",
    WOODIE       = "That one's gotten outta hand.",
    WICKERBOTTOM = "An excessive and distorted variation of the original design.",
    WATHGRITHR   = "Swallowed by its own armor!",
    WEBBER       = "I think he's stuck in there...",
    WINONA       = "Yeah, that's not coming off.",
    WORTOX       = "Heehee... went too far with it!",
    WORMWOOD     = "Too much frog. Not gnome now.",
    WALTER       = "I don't think that's a costume anymore...",
    WARLY        = "Far beyond proper portions.",
    WURT         = "Florp!",
    WANDA        = "An idea taken too far.",
}

NAMES.TOADSTOOL_GNOME2 = "Misery Toadstool Gnome"

SetItemsDescribeStrings("TOADSTOOL_GNOME2", TOADSTOOL_GNOME2_STRINGS)

--

local DERP_GNOME_STRINGS =
{
    GENERIC      = "There's nothing behind those eyes.",
    WAXWELL      = "Utterly vacant.",
    WOLFGANG     = "Funny face gnome!",
    WX78         = "ERROR: BRAIN NOT FOUND.",
    WILLOW       = "He gets it.",
    WENDY        = "Existence is confusing.",
    WOODIE       = "Look at that dopey grin.",
    WICKERBOTTOM = "A grotesque caricature.",
    WATHGRITHR   = "He looks battle-confused!",
    WEBBER       = "Silly gnome!",
    WINONA       = "Somebody had fun sculpting that.",
    WORTOX       = "Derpy imp!",
    WORMWOOD     = "Silly friend.",
    WALTER       = "He looks lost.",
    WARLY        = "Not food safe.",
    WURT         = "Funny gnome!",
    WANDA        = "Hopeless.",
}
NAMES.DERP_GNOME = "Derp Gnome"
SetItemsDescribeStrings("DERP_GNOME", DERP_GNOME_STRINGS)

local BUTTCHEEK_GNOME_STRINGS =
{
    GENERIC      = "Why would someone sculpt that.",
    WAXWELL      = "Utterly tasteless.",
    WOLFGANG     = "Strange gnome!",
    WX78         = "GLUTEAL GNOME.",
    WILLOW       = "Heh.",
    WENDY        = "Even shame can be carved.",
    WOODIE       = "That's unfortunate.",
    WICKERBOTTOM = "Incredibly inappropriate.",
    WATHGRITHR   = "Dishonorable sculpture!",
    WEBBER       = "Hehehe!",
    WINONA       = "Someone had too much time.",
    WORTOX       = "Cheeky!",
    WORMWOOD     = "Strange statue.",
    WALTER       = "Oh.",
    WARLY        = "Absolutely not.",
    WURT         = "Weird gnome!",
    WANDA        = "Distasteful.",
}
NAMES.BUTTCHEEK_GNOME = "Buttcheek Gnome"
SetItemsDescribeStrings("BUTTCHEEK_GNOME", BUTTCHEEK_GNOME_STRINGS)

--

local BOOT_GNOME_STRINGS =
{
    GENERIC      = "Looks like it got kicked around.",
    WAXWELL      = "A boot-shaped oddity.",
    WOLFGANG     = "Boot gnome!",
    WX78         = "FOOTWEAR GNOME UNIT.",
    WILLOW       = "Probably smells.",
    WENDY        = "Even boots outlive us.",
    WOODIE       = "Seen worse boots.",
    WICKERBOTTOM = "An unusual sculptural form.",
    WATHGRITHR   = "A warrior's boot!",
    WEBBER       = "Boot friend!",
    WINONA       = "That's a strange design.",
    WORTOX       = "Kickin' little fellow!",
    WORMWOOD     = "Boot statue.",
    WALTER       = "Someone lost their shoe.",
    WARLY        = "Not appetizing.",
    WURT         = "Boot gnome!",
    WANDA        = "Stomped through time.",
}
NAMES.BOOT_GNOME = "Boot Gnome"
SetItemsDescribeStrings("BOOT_GNOME", BOOT_GNOME_STRINGS)

--

local UPSIDEDOWN_GNOME_STRINGS =
{
    GENERIC      = "I think it's backwards.",
    WAXWELL      = "An inversion of taste.",
    WOLFGANG     = "Upside gnome!",
    WX78         = "INVERTED UNIT.",
    WILLOW       = "Looks uncomfortable.",
    WENDY        = "The world turned over.",
    WOODIE       = "That's not right, eh.",
    WICKERBOTTOM = "Displayed incorrectly.",
    WATHGRITHR   = "A warrior turned!",
    WEBBER       = "He's upside down!",
    WINONA       = "Somebody messed up.",
    WORTOX       = "Flip-flopped imp!",
    WORMWOOD     = "Upside friend.",
    WALTER       = "That seems wrong.",
    WARLY        = "Presentation matters.",
    WURT         = "Upside gnome!",
    WANDA        = "Perspective is everything.",
}
NAMES.UPSIDEDOWN_GNOME = "Upside-down Gnome"
SetItemsDescribeStrings("UPSIDEDOWN_GNOME", UPSIDEDOWN_GNOME_STRINGS)

--

local CHEF_GNOME_STRINGS =
{
    GENERIC      = "He looks ready to cook.",
    WAXWELL      = "A culinary caricature.",
    WOLFGANG     = "Chef gnome!",
    WX78         = "CULINARY UNIT.",
    WILLOW       = "I bet he burns stuff.",
    WENDY        = "A feast for no one.",
    WOODIE       = "Little cook there.",
    WICKERBOTTOM = "A gastronomy-themed statuette.",
    WATHGRITHR   = "A cook of battle feasts!",
    WEBBER       = "He cooks!",
    WINONA       = "Cute little cook.",
    WORTOX       = "Kitchen imp!",
    WORMWOOD     = "Cook friend.",
    WALTER       = "He looks professional.",
    WARLY        = "Ah, a colleague!",
    WURT         = "Cook gnome!",
    WANDA        = "His recipes are timeless.",
}
NAMES.CHEF_GNOME = "Chef Gnome"
SetItemsDescribeStrings("CHEF_GNOME", CHEF_GNOME_STRINGS)

--

local POTTED_GNOME_STRINGS =
{
    GENERIC      = "He lives in a pot.",
    WAXWELL      = "Garden ornamentation.",
    WOLFGANG     = "Plant gnome!",
    WX78         = "BOTANICAL GNOME.",
    WILLOW       = "It's a plant statue.",
    WENDY        = "Even soil has memories.",
    WOODIE       = "Looks garden-ready.",
    WICKERBOTTOM = "A horticultural motif.",
    WATHGRITHR   = "A guardian of soil!",
    WEBBER       = "Plant friend!",
    WINONA       = "Cute decoration.",
    WORTOX       = "Pot-bound imp!",
    WORMWOOD     = "Plant gnome.",
    WALTER       = "That's neat!",
    WARLY        = "Perhaps herbs?",
    WURT         = "Plant gnome!",
    WANDA        = "Rooted in time.",
}
NAMES.POTTED_GNOME = "Potted Gnome"
SetItemsDescribeStrings("POTTED_GNOME", POTTED_GNOME_STRINGS)

--

local GNUDIST_GNOME_STRINGS =
{
    GENERIC      = "He's... very free.",
    WAXWELL      = "Disturbingly uninhibited.",
    WOLFGANG     = "Naked gnome!",
    WX78         = "CLOTHING: NOT INSTALLED.",
    WILLOW       = "Put some clothes on.",
    WENDY        = "Bare as the grave.",
    WOODIE       = "Bit drafty, eh.",
    WICKERBOTTOM = "Indecent sculpture.",
    WATHGRITHR   = "Unarmored warrior!",
    WEBBER       = "Oh.",
    WINONA       = "Well that's awkward.",
    WORTOX       = "Shameless imp!",
    WORMWOOD     = "No clothes.",
    WALTER       = "Uh.",
    WARLY        = "Absolutely not.",
    WURT         = "Naked gnome!",
    WANDA        = "Poor taste.",
}
NAMES.GNUDIST_GNOME = "Gnudist Gnome"
SetItemsDescribeStrings("GNUDIST_GNOME", GNUDIST_GNOME_STRINGS)

--

local GNEO_GNOME_STRINGS =
{
    GENERIC      = "He looks like he knows kung fu.",
    WAXWELL      = "A dramatic pose.",
    WOLFGANG     = "Whoa!",
    WX78         = "SIMULATION GNOME.",
    WILLOW       = "Whoa.",
    WENDY        = "Reality bends.",
    WOODIE       = "Fancy moves.",
    WICKERBOTTOM = "A cultural reference, perhaps.",
    WATHGRITHR   = "A warrior of fate!",
    WEBBER       = "Cool!",
    WINONA       = "That's stylish.",
    WORTOX       = "Reality-hopper!",
    WORMWOOD     = "Flying gnome.",
    WALTER       = "He looks heroic.",
    WARLY        = "Very dramatic plating.",
    WURT         = "Flying gnome!",
    WANDA        = "Time distortion indeed.",
}
NAMES.GNEO_GNOME = "Gneo Gnome"
SetItemsDescribeStrings("GNEO_GNOME", GNEO_GNOME_STRINGS)

local SNURTLE_GNOME_STRINGS =
{
    GENERIC      = "Shell yeah.",
    WAXWELL      = "A shelled monstrosity.",
    WOLFGANG     = "Shell gnome!",
    WX78         = "ARMORED GNOME.",
    WILLOW       = "Looks tough.",
    WENDY        = "A shell for sorrow.",
    WOODIE       = "Hard-headed.",
    WICKERBOTTOM = "Inspired by subterranean fauna.",
    WATHGRITHR   = "A shielded warrior!",
    WEBBER       = "Shell friend!",
    WINONA       = "Nice shell work.",
    WORTOX       = "Crunchy imp!",
    WORMWOOD     = "Shell gnome.",
    WALTER       = "Cool!",
    WARLY        = "Hard exterior.",
    WURT         = "Shell gnome!",
    WANDA        = "Timeless shell.",
}
NAMES.SNURTLE_GNOME = "Snurtle Gnome"
SetItemsDescribeStrings("SNURTLE_GNOME", SNURTLE_GNOME_STRINGS)

local PIRATE_GNOME_STRINGS =
{
    GENERIC      = "Arr.",
    WAXWELL      = "A rogue figurine.",
    WOLFGANG     = "Pirate gnome!",
    WX78         = "PIRACY UNIT.",
    WILLOW       = "He looks shady.",
    WENDY        = "A plunderer of trinkets.",
    WOODIE       = "Yar.",
    WICKERBOTTOM = "Nautical ornamentation.",
    WATHGRITHR   = "A sea raider!",
    WEBBER       = "Pirate friend!",
    WINONA       = "Nice hat.",
    WORTOX       = "Salty imp!",
    WORMWOOD     = "Pirate gnome.",
    WALTER       = "Adventure!",
    WARLY        = "Sea seasoning.",
    WURT         = "Boat gnome!",
    WANDA        = "Lost to the tides.",
}
NAMES.PIRATE_GNOME = "Pirate Gnome"
SetItemsDescribeStrings("PIRATE_GNOME", PIRATE_GNOME_STRINGS)

local GLOOMY_GNOME_STRINGS =
{
    GENERIC      = "It looks tired.",
    WAXWELL      = "A somber statue.",
    WOLFGANG     = "Sad gnome.",
    WX78         = "DEPRESSED UNIT.",
    WILLOW       = "Mood.",
    WENDY        = "It understands.",
    WOODIE       = "Looks rough.",
    WICKERBOTTOM = "A melancholic figure.",
    WATHGRITHR   = "A fallen warrior!",
    WEBBER       = "Sad friend.",
    WINONA       = "Poor thing.",
    WORTOX       = "Gloomy imp!",
    WORMWOOD     = "Sad gnome.",
    WALTER       = "It needs cheering up.",
    WARLY        = "Not appetizing.",
    WURT         = "Sad gnome.",
    WANDA        = "Relatable.",
}
NAMES.GLOOMY_GNOME = "Gloomy Gnome"
SetItemsDescribeStrings("GLOOMY_GNOME", GLOOMY_GNOME_STRINGS)

--

local STPATRICK_GNOME_STRINGS =
{
    GENERIC      = "A lucky little fellow.",
    WAXWELL      = "An emerald curiosity.",
    WOLFGANG     = "Lucky gnome!",
    WX78         = "FORTUNE UNIT.",
    WILLOW       = "Green little guy.",
    WENDY        = "Luck fades.",
    WOODIE       = "Bit o' luck there.",
    WICKERBOTTOM = "An Irish-themed ornament.",
    WATHGRITHR   = "Fortune warrior!",
    WEBBER       = "Lucky friend!",
    WINONA       = "Cute decoration.",
    WORTOX       = "Lucky imp!",
    WORMWOOD     = "Lucky gnome.",
    WALTER       = "Maybe it brings luck.",
    WARLY        = "A festive garnish.",
    WURT         = "Lucky gnome!",
    WANDA        = "Fortune is fleeting.",
}
NAMES.STPATRICK_GNOME = "St. Patrick's Gnome"
SetItemsDescribeStrings("STPATRICK_GNOME", STPATRICK_GNOME_STRINGS)


local STPATRICK_GNOMETTE_STRINGS =
{
    GENERIC      = "A lucky little lady.",
    WAXWELL      = "A fortunate figurine.",
    WOLFGANG     = "Lucky lady gnome!",
    WX78         = "FORTUNE UNIT II.",
    WILLOW       = "Green lady.",
    WENDY        = "Luck never lasts.",
    WOODIE       = "Lucky statue.",
    WICKERBOTTOM = "A festive variation.",
    WATHGRITHR   = "A fortunate maiden!",
    WEBBER       = "Lucky friend!",
    WINONA       = "Pretty festive.",
    WORTOX       = "Lucky imp!",
    WORMWOOD     = "Lucky lady.",
    WALTER       = "Neat!",
    WARLY        = "Festive indeed.",
    WURT         = "Lucky gnome!",
    WANDA        = "Time spares no luck.",
}
NAMES.STPATRICK_GNOMETTE = "St. Patrick's Gnomette"
SetItemsDescribeStrings("STPATRICK_GNOMETTE", STPATRICK_GNOMETTE_STRINGS)

--

local BERET_GNOME_STRINGS =
{
    GENERIC      = "A rather cultured little fellow.",
    WAXWELL      = "An air of pretension in miniature.",
    WOLFGANG     = "Tiny artist man!",
    WX78         = "AESTHETICALLY INCLINED DECOR UNIT.",
    WILLOW       = "Looks like he'd judge my flames.",
    WENDY        = "He creates, yet remains unmoved.",
    WOODIE       = "Fancy hat for a tiny guy.",
    WICKERBOTTOM = "A gnome of apparent artistic pursuits.",
    WATHGRITHR   = "A bard of brush and beret!",
    WEBBER       = "He's got a cute hat!",
    WINONA       = "Looks like he knows what he's doin'.",
    WORTOX       = "Ho ho! A painter of peculiar taste!",
    WORMWOOD     = "Hat friend.",
    WALTER       = "He looks like an artist.",
    WARLY        = "Ah! A connoisseur of the arts!",
    WURT         = "Fancy hat gnome, florp!",
    WANDA        = "A fleeting moment of inspiration.",
}

NAMES.BERET_GNOME = "Beret Gnome"

SetItemsDescribeStrings("BERET_GNOME", BERET_GNOME_STRINGS)

-- New: 04/01/26

local BABY_GNOME_STRINGS =
{
    GENERIC      = "Just a tiny little thing.",
    WAXWELL      = "Even smaller than ambition.",
    WOLFGANG     = "Baby gnome is weak!",
    WX78         = "MINIATURE DECORATIVE UNIT.",
    WILLOW       = "Ugh, it's staring at me.",
    WENDY        = "So small, yet it persists.",
    WOODIE       = "Lil' guy, eh?",
    WICKERBOTTOM = "A diminutive figurine.",
    WATHGRITHR   = "A warrior yet to grow!",
    WEBBER       = "It's just a baby!",
    WINONA       = "Tiny but well made.",
    WORTOX       = "A wee little wanderer!",
    WORMWOOD     = "Small friend.",
    WALTER       = "Adorable.",
    WARLY        = "Petit and charming.",
    WURT         = "Tiny gnome, florp!",
    WANDA        = "It hasn't had time to age yet.",
}
NAMES.BABY_GNOME = "Baby Gnome"
SetItemsDescribeStrings("BABY_GNOME", BABY_GNOME_STRINGS)

local BABY_DEVIL_GNOME_STRINGS =
{
    GENERIC      = "That one has a mean streak.",
    WAXWELL      = "Ambition in its purest form.",
    WOLFGANG     = "Tiny angry man!",
    WX78         = "HOSTILE MINIATURE UNIT.",
    WILLOW       = "I like this one.",
    WENDY        = "Born with something dark inside.",
    WOODIE       = "Bit of a menace, eh?",
    WICKERBOTTOM = "A mischievous effigy.",
    WATHGRITHR   = "A fiend in miniature!",
    WEBBER       = "He looks grumpy!",
    WINONA       = "Got a little attitude.",
    WORTOX       = "A devilish little darling!",
    WORMWOOD     = "Angry friend.",
    WALTER       = "I don't trust it.",
    WARLY        = "Spicy temperament.",
    WURT         = "Mean gnome! Blorp!",
    WANDA        = "It started wrong.",
}
NAMES.BABY_DEVIL_GNOME = "Baby Devil Gnome"
SetItemsDescribeStrings("BABY_DEVIL_GNOME", BABY_DEVIL_GNOME_STRINGS)

local BABY_ANGEL_GNOME_STRINGS =
{
    GENERIC      = "A tiny little saint.",
    WAXWELL      = "Innocence rarely lasts.",
    WOLFGANG     = "Nice tiny man!",
    WX78         = "BENIGN MINIATURE UNIT.",
    WILLOW       = "Too pure. Gross.",
    WENDY        = "Soft, fleeting goodness.",
    WOODIE       = "Aw, that's a nice one.",
    WICKERBOTTOM = "A representation of virtue.",
    WATHGRITHR   = "A blessed little spirit!",
    WEBBER       = "It looks so nice!",
    WINONA       = "Sweet little thing.",
    WORTOX       = "Heavenly and hollow!",
    WORMWOOD     = "Kind friend.",
    WALTER       = "I like this one.",
    WARLY        = "Delicately divine.",
    WURT         = "Nice gnome! Flurp!",
    WANDA        = "It won't stay that way.",
}
NAMES.BABY_ANGEL_GNOME = "Baby Angel Gnome"
SetItemsDescribeStrings("BABY_ANGEL_GNOME", BABY_ANGEL_GNOME_STRINGS)

local BABY_KNIFE_GNOME_STRINGS =
{
    GENERIC      = "Why does it have that?",
    WAXWELL      = "Intent made manifest.",
    WOLFGANG     = "Tiny man has stab stick!",
    WX78         = "THREAT DETECTED.",
    WILLOW       = "Oh, that's fun.",
    WENDY        = "It knows what it's doing.",
    WOODIE       = "That ain't right.",
    WICKERBOTTOM = "Concerning craftsmanship.",
    WATHGRITHR   = "A blade for a tiny warrior!",
    WEBBER       = "Why does it need that?!",
    WINONA       = "That's� a little worrying.",
    WORTOX       = "Stabby-stabby imp!",
    WORMWOOD     = "Sharp friend.",
    WALTER       = "I don't like that at all.",
    WARLY        = "Dangerously playful.",
    WURT         = "Pointy gnome! Blorp!",
    WANDA        = "Already making choices.",
}
NAMES.BABY_KNIFE_GNOME = "Baby Knife Gnome"
SetItemsDescribeStrings("BABY_KNIFE_GNOME", BABY_KNIFE_GNOME_STRINGS)

local BABY_KNIFE_DARKNESS_GNOME_STRINGS =
{
    GENERIC      = "It feels wrong.",
    WAXWELL      = "Now that is familiar.",
    WOLFGANG     = "Bad tiny man!",
    WX78         = "HIGH-THREAT SHADOW UNIT.",
    WILLOW       = "Okay, that's a little much.",
    WENDY        = "Something inside it is awake.",
    WOODIE       = "Don't like the look of that one.",
    WICKERBOTTOM = "A deeply unsettling effigy.",
    WATHGRITHR   = "A cursed warrior!",
    WEBBER       = "It's scary...",
    WINONA       = "That one's bad news.",
    WORTOX       = "Shadowed and sharp!",
    WORMWOOD     = "Dark friend.",
    WALTER       = "We should put that away.",
    WARLY        = "A bitter creation.",
    WURT         = "Scary gnome! Glorp!",
    WANDA        = "It shouldn't exist.",
}
NAMES.BABY_KNIFE_DARKNESS_GNOME = "Baby Knife Gnome"
SetItemsDescribeStrings("BABY_KNIFE_DARKNESS_GNOME", BABY_KNIFE_DARKNESS_GNOME_STRINGS)

NAMES.JIMBO_GNOME = "JIMBO Gnome"