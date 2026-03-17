local GLOBAL = GLOBAL
local SpawnPrefab = GLOBAL.SpawnPrefab
local TheWorld = GLOBAL.TheWorld

--------------------------------------------------

local function IsMasterSim()
    return TheWorld ~= nil and TheWorld.ismastersim
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
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "ice_gnome", .20)
        DropGnome(inst, "ice_gnomette", .08)
    end)
end)

--------------------------------------------------

AddPrefabPostInit("bearger", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "bearger_gnome", .50)
    end)
end)

--------------------------------------------------

AddPrefabPostInit("moose", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "egg_gnome", .20)
    end)
end)

--------------------------------------------------

AddPrefabPostInit("dragonfly", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "dfly_gnome1", .20)

        if inst.enraged then
            DropGnome(inst, "dfly_gnome2", 1)
        end
    end)
end)

--------------------------------------------------

AddPrefabPostInit("beequeen", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "beequeen_gnome", .20)
    end)
end)

--------------------------------------------------

AddPrefabPostInit("toadstool", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "toadstool_gnome1", .50)
    end)
end)

AddPrefabPostInit("toadstool_dark", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "toadstool_gnome2", 1)
    end)
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
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "snurtle_gnome", .5)
    end)
end)

--------------------------------------------------

AddPrefabPostInit("nightmarebeak", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "gloomy_gnome", .05)
    end)
end)

--------------------------------------------------

AddPrefabPostInit("prime_mate", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "pirate_gnome", .5)
    end)
end)

AddPrefabPostInit("powder_monkey", function(inst)
    if not IsMasterSim() then return end
    inst:ListenForEvent("death", function(inst)
        DropGnome(inst, "pirate_gnome", .10)
    end)
end)

--------------------------------------------------
-- FROG
--------------------------------------------------

AddPrefabPostInit("frog", function(inst)
    if not IsMasterSim() then return end

    if inst.components.lootdropper then
        inst.components.lootdropper:AddChanceLoot("beret_gnome", 0.05)
    end
end)

--------------------------------------------------
-- TUMBLEWEED
--------------------------------------------------

AddPrefabPostInit("tumbleweed", function(inst)
    if not IsMasterSim() then return end

    inst:ListenForEvent("picked", function(inst, picker)
        if picker == nil then return end

        local x, y, z = inst.Transform:GetWorldPosition()

        if math.random() < 0.05 then
            SpawnPrefab("potted_gnome").Transform:SetPosition(x, y, z)
        end

        if math.random() < 0.03 then
            SpawnPrefab("stpatrick_gnome").Transform:SetPosition(x, y, z)
        end

        if math.random() < 0.02 then
            SpawnPrefab("stpatrick_gnomette").Transform:SetPosition(x, y, z)
        end

        if math.random() < 0.04 then
            SpawnPrefab("upsidedown_gnome").Transform:SetPosition(x, y, z)
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
                        if math.random() < .05 then
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
        DropGnome(inst, "gneo_gnome", .5)
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

            if math.random() < .10 then
                local loot = SpawnPrefab("gnudist_gnome")
                if loot then
                    loot.Transform:SetPosition(pos.x, pos.y, pos.z)
                end
            end

            if math.random() < .10 then
                local loot = SpawnPrefab("buttcheek_gnome")
                if loot then
                    loot.Transform:SetPosition(pos.x, pos.y, pos.z)
                end
            end
        end
    end
end)