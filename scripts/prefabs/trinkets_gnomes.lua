local assets =
{
    Asset("ANIM", "anim/trinkets_gnomes.zip"),

    Asset("IMAGE", "images/GPLG_inventoryimages.tex"),
    Asset("ATLAS", "images/GPLG_inventoryimages.xml"),
    Asset("ATLAS_BUILD", "images/GPLG_inventoryimages.xml", 256),
}

local prefabs =
{
    "flies",
}

local GNOMES =
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

    -- New! 04-01-26
    "baby_gnome",
    "baby_devil_gnome",
    "baby_angel_gnome",
    "baby_knife_gnome",
    "baby_knife_darkness_gnome",
    "baby_knife_ice_gnome",
    "catcoon_gnome",
    "catcoon_silly_gnome",
    "derp_gnomette",
    "jimbo_gnome",
    "poop_gnome",
    "raincoat_gnomette",
}

--------------------------------------------------------------------------

TUNING.STPATRICK_GNOME_LUCK         = TUNING.STPATRICK_GNOME_LUCK           or 0.01
TUNING.STPATRICK_GNOME_HELD_BONUS   = TUNING.STPATRICK_GNOME_HELD_BONUS     or 0.01
TUNING.STPATRICK_GNOME_STACK_BONUS  = TUNING.STPATRICK_GNOME_STACK_BONUS    or 0.02

--------------------------------------------------------------------------

local function GetStPatrickLuck(inst, owner)

    local base = TUNING.STPATRICK_GNOME_LUCK

    if owner ~= nil and owner:HasTag("player") then
        base = base + TUNING.STPATRICK_GNOME_HELD_BONUS
    end

    if inst.components.stackable ~= nil then
        local stack = inst.components.stackable:StackSize()
        if stack > 1 then
            base = base + (stack - 1) * TUNING.STPATRICK_GNOME_STACK_BONUS
        end
    end

    return base
end

--------------------------------------------------------------------------

-- KNIFE BABY ANIMATION HANDLER
local function StartKnifeBabyLoop(inst)

    if inst._animtask ~= nil then
        inst._animtask:Cancel()
        inst._animtask = nil
    end

    local function PlayOnce()
        if inst.AnimState ~= nil and inst._gnome_anim ~= nil then
            inst.AnimState:PlayAnimation(inst._gnome_anim, false)
        end
    end

    PlayOnce()

    inst._animtask = inst:DoPeriodicTask(30, PlayOnce)
end

--------------------------------------------------------------------------

-- POOP GNOME FLIES HANDLER
local function UpdateFlies(inst)

    if inst._flies == nil then return end

    local x, y, z = inst.Transform:GetWorldPosition()
    local players = TheSim:FindEntities(x, y, z, 3, { "player" })

    if #players > 0 then
        inst._flies:Hide()
    else
        inst._flies:Show()
    end
end

--------------------------------------------------------------------------

local function MakeGnome(name)

    local function fn()

        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("trinkets_gnomes")
        inst.AnimState:SetBuild("trinkets_gnomes")

        inst._gnome_anim = name

        if name == "baby_knife_gnome" or name == "baby_knife_darkness_gnome" or name == "baby_knife_ice_gnome" then
            inst.AnimState:PlayAnimation(name, false)
        else
            inst.AnimState:PlayAnimation(name, true)
        end

        inst:AddTag("trinket")
        inst:AddTag("gnome")
        inst:AddTag("gnomes")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inspectable")
        inst:AddComponent("inventoryitem")
        inst:AddComponent("tradable")

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        ------------------------------------------------------------------
        -- ST PATRICK LUCK SYSTEM
        ------------------------------------------------------------------

        if string.find(name, "stpatrick") then
            inst:AddComponent("luckitem")
            inst.components.luckitem:SetLuck(GetStPatrickLuck)
            inst:AddTag("lucky")
        end

        ------------------------------------------------------------------
        -- KNIFE BABY LOOP START
        ------------------------------------------------------------------

        if name == "baby_knife_gnome" or name == "baby_knife_darkness_gnome" then
            inst:DoTaskInTime(0, StartKnifeBabyLoop)

            inst:ListenForEvent("onremove", function()
                if inst._animtask ~= nil then
                    inst._animtask:Cancel()
                    inst._animtask = nil
                end
            end)
        end

        ------------------------------------------------------------------
        -- POOP GNOME FLIES
        ------------------------------------------------------------------

        if name == "poop_gnome" then

            inst._flies = SpawnPrefab("flies")

            if inst._flies ~= nil then
                inst._flies.entity:SetParent(inst.entity)

                inst._flies.Transform:SetPosition(
                    math.random() * 0.3 - 0.15,
                    0.5,
                    math.random() * 0.3 - 0.15
                )
            end

            inst._fliestask = inst:DoPeriodicTask(1, UpdateFlies)

            inst:DoTaskInTime(0, UpdateFlies)

            inst:ListenForEvent("onremove", function()
                if inst._flies ~= nil then
                    inst._flies:Remove()
                    inst._flies = nil
                end
                if inst._fliestask ~= nil then
                    inst._fliestask:Cancel()
                    inst._fliestask = nil
                end
            end)
        end

        ------------------------------------------------------------------

        MakeHauntableLaunch(inst)

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

--------------------------------------------------------------------------

local prefab_list = {}

for _, gnome in ipairs(GNOMES) do
    table.insert(prefab_list, MakeGnome(gnome))
end

return unpack(prefab_list)