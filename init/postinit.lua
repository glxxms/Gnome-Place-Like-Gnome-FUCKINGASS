local _G            = GLOBAL
local require       = _G.require
local SpawnPrefab   = _G.SpawnPrefab
local UpvalueHacker = require("tools/upvaluehacker")

--------------------------------------------------

local function IsMasterSim()
    return _G.TheWorld ~= nil and _G.TheWorld.ismastersim
end

local function DropGnome(inst, gnome, chance)
    if not IsMasterSim() then return end
    if inst == nil or not inst:IsValid() then return end

    if math.random() < chance then
        local x, y, z = inst.Transform:GetWorldPosition()
        local g = SpawnPrefab(gnome)
        if g then
            g.Transform:SetPosition(x, y, z)
        end
    end
end

--------------------------------------------------
-- BOSSES
--------------------------------------------------

AddPrefabPostInit("deerclops", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("ice_gnome",      0.10) -- Down from 20%
        inst.components.lootdropper:AddChanceLoot("ice_gnomette",   0.05) -- Down from 8%
    end
end)

--------------------------------------------------

AddPrefabPostInit("bearger", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("bearger_gnome", 0.50)
    end
end)

--------------------------------------------------

AddPrefabPostInit("moose", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("egg_gnome", 0.10) -- Down from 20%
    end
end)

--------------------------------------------------

AddPrefabPostInit("dragonfly", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "dfly_gnome1",  .10) -- Down from 20%

        if inst.enraged then
            DropGnome(inst, "dfly_gnome2", 1)
        end
    end)
end)

--------------------------------------------------

AddPrefabPostInit("beequeen", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("beequeen_gnome", 0.10)   -- Down from 20%
    end
end)

--------------------------------------------------

AddPrefabPostInit("toadstool", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("toadstool_gnome1", 0.50)
    end
end)

AddPrefabPostInit("toadstool_dark", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("toadstool_gnome2", 1.00)
    end
end)

--------------------------------------------------
-- TRADES
--------------------------------------------------

AddPrefabPostInit("sharkboi", function(inst)
    if not IsMasterSim() then return end

    inst:ListenForEvent("trade", function(inst, data)
        if data and data.item and data.item:HasTag("oceanfish") then
            if math.random() < 0.20 then
                local x, y, z = inst.Transform:GetWorldPosition()
                local gnome = SpawnPrefab("boot_gnome")
                if gnome then
                    gnome.Transform:SetPosition(x, y, z)
                    if gnome.components.inventoryitem then
                        gnome.components.inventoryitem:OnDropped(true, 0.5)
                    end
                end
            end
        end
    end)
end)

--------------------------------------------------
-- CREATURES
--------------------------------------------------

AddPrefabPostInit("snurtle", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("snurtle_gnome", 0.10) -- Down from 50%
    end
end)

--------------------------------------------------
-- Ruins Version
AddPrefabPostInit("nightmarebeak", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("gloomy_gnome", 0.05)
    end
end)

--------------------------------------------------
-- Standard Version
AddPrefabPostInit("terrorbeak", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("gloomy_gnome", 0.01)
    end
end)

--------------------------------------------------

AddPrefabPostInit("prime_mate", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("pirate_gnome", 0.20) -- Down from 50%
    end
end)

AddPrefabPostInit("powder_monkey", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("pirate_gnome", 0.10)
    end
end)

--------------------------------------------------
-- FROG
--------------------------------------------------

AddPrefabPostInit("frog", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("beret_gnome", 0.01)  -- Down from 5%
    end
end)

--------------------------------------------------
-- TUMBLEWEED -- (These don't have a home yet, cheap way out).
--------------------------------------------------

AddPrefabPostInit("tumbleweed", function(inst)
    if not IsMasterSim() then return end

    inst:ListenForEvent("picked", function(inst, picker)
        if picker == nil then return end

        local x, y, z = inst.Transform:GetWorldPosition()

        if math.random() < 0.01 then    -- Down from 5%
            SpawnPrefab("potted_gnome").Transform:SetPosition(x, y, z)
        end

        if math.random() < 0.02 then    -- Down from 4%
            SpawnPrefab("derp_gnome").Transform:SetPosition(x, y, z)
        end
    end)
end)

--------------------------------------------------
-- COOKPOT
--------------------------------------------------

AddPrefabPostInit("cookpot", function(inst)
    if not IsMasterSim() then return end

    inst:DoTaskInTime(0, function(inst)
        if inst.components.stewer then

            local old = inst.components.stewer.StartCooking

            inst.components.stewer.StartCooking = function(self, doer)
                local result = old(self, doer)

                inst:DoTaskInTime(self:GetTimeToCook() or 1, function()
                    if self.product ~= nil then
                        if math.random() < .01 then -- Down from 5%
                            local x, y, z = inst.Transform:GetWorldPosition()
                            local gnome = SpawnPrefab("chef_gnome")
                            if gnome then
                                gnome.Transform:SetPosition(x, y, z)
                                if gnome.components.inventoryitem then
                                    gnome.components.inventoryitem:OnDropped(true, 0.5)
                                end
                            end
                        end
                    end
                end)

                return result
            end

        end
    end)
end)

--------------------------------------------------
-- SHADOW
--------------------------------------------------

AddPrefabPostInit("shadow_knight", function(inst)
    if not IsMasterSim() then return end

    inst:ListenForEvent("death", function(inst)
        if inst.level ~= nil and inst.level >= 3 then
            DropGnome(inst, "gneo_gnome", 0.5)
        end
    end)
end)

--------------------------------------------------
-- WET POUCH
--------------------------------------------------

AddPrefabPostInit("wetpouch", function(inst)
    if not IsMasterSim() then return end

    if inst.components.unwrappable then
        local old = inst.components.unwrappable.onunwrappedfn

        inst.components.unwrappable.onunwrappedfn = function(inst, pos, doer)

            if old then
                old(inst, pos, doer)
            end

            if pos == nil then return end

            if math.random() < .01 then
                local loot = SpawnPrefab("buttcheek_gnome")
                if loot then
                    loot.Transform:SetPosition(pos.x, pos.y, pos.z)
                end
            end
        end
    end
end)

--------------------------------------------------
AddPrefabPostInit("birchnutdrake", function(inst)
    if not _G.TheWorld.ismastersim then
        return inst
    end

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:AddChanceLoot("gnudist_gnome", .01)  -- Down from 5%
    end
end)

--------------------------------------------------
-- HOLIDAYS
--------------------------------------------------

AddPrefabPostInit("potato_oversized", function(inst)
    if not IsMasterSim() then return end

    if inst.components.workable then
        local old_onfinish = inst.components.workable.onfinish

        inst.components.workable:SetOnFinishCallback(function(inst, worker)
            local x, y, z = inst.Transform:GetWorldPosition()

            -- Run original behavior first
            if old_onfinish then
                old_onfinish(inst, worker)
            end

            local roll = math.random()

            if roll < 0.02 then
                SpawnPrefab("stpatrick_gnome").Transform:SetPosition(x, y, z)

            elseif roll < 0.03 then
                SpawnPrefab("stpatrick_gnomette").Transform:SetPosition(x, y, z)
            end
        end)
    end
end)

--------------------------------------------------
-- CAVES EARTHQUAKE
--------------------------------------------------

-- quaker component has 3 tiers, common, uncommon and rare = 1-2-3
-- You can add a new tier too or just inject them into already existing tiers.
-- The chances are already defined there, but you can also add custom logic too...
AddPrefabPostInit("cave_network", function(inst)
    if not _G.TheWorld.ismastersim then
        return
    end

    -- I stg this component is (stupid) as fuck, not a single public variable
    -- to edit or anything, holy shit Klei is in another level.
    local quaker = inst.components.quaker

    if not quaker then
        return
    end

    -- Try search for debris table so we can inject our loot.
    for i = 1, 20 do
        local name, val = _G.debug.getupvalue(quaker.SetDebris, i)

        if name == "_debris" then
            table.insert(val, 
            {
                -- This is NOT chance. It's weighted, see components/quaker.lua
                -- A bit lower than red, blue gems and marble...
                weight = 0.01,
                loot = { "upsidedown_gnome" }
            })

            break
        end
    end
end)

--------------------------------------------------
-- JIMBO
--------------------------------------------------
-- Command for getting max score: c_sel()._currentgame.score = 8
-- * You must open jimbo's screen first *
AddPrefabPostInit("balatro_machine", function(inst)
    local _REWARDS = UpvalueHacker.GetUpvalue(_G.Prefabs.balatro_machine.fn, 
    "EndInteraction", "StartRewardsSequence", "DoDelayedRewards", "REWARDS")
    
    if _REWARDS then
        for _, reward in ipairs(_REWARDS) do
            if reward.string == "TREASURE" then
                table.insert(reward.loot, {"jimbo_gnome", 1})
            end
        end
    end
end)