local assets =
{
    Asset("ANIM", "anim/trinkets_gnomes.zip"),
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
}

--------------------------------------------------------------------------

-- SAFE TUNING DEFAULTS
TUNING.STPATRICK_GNOME_LUCK = TUNING.STPATRICK_GNOME_LUCK or 0.1
TUNING.STPATRICK_GNOME_HELD_BONUS = TUNING.STPATRICK_GNOME_HELD_BONUS or 0.15
TUNING.STPATRICK_GNOME_STACK_BONUS = TUNING.STPATRICK_GNOME_STACK_BONUS or 0.02

--------------------------------------------------------------------------

local function GetStPatrickLuck(inst, owner)

    local base = TUNING.STPATRICK_GNOME_LUCK

    -- bonus if held by player
    if owner ~= nil and owner:HasTag("player") then
        base = base + TUNING.STPATRICK_GNOME_HELD_BONUS
    end

    -- stacking bonus
    if inst.components.stackable ~= nil then
        local stack = inst.components.stackable:StackSize()
        if stack > 1 then
            base = base + (stack - 1) * TUNING.STPATRICK_GNOME_STACK_BONUS
        end
    end

    return base
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
        inst.AnimState:PlayAnimation(name)

        inst:AddTag("trinket")
        inst:AddTag("gnome")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inspectable")

        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.imagename = name
        inst.components.inventoryitem.atlasname = "images/GPLG_inventoryimages.xml"

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

        MakeHauntableLaunch(inst)

        return inst
    end

    return Prefab(name, fn, assets)
end

--------------------------------------------------------------------------

local prefabs = {}

for _, gnome in ipairs(GNOMES) do
    table.insert(prefabs, MakeGnome(gnome))
end

return unpack(prefabs)