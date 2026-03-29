local assets =
{
    Asset("ANIM", "anim/aprilfools_gnome.zip"),

    Asset("IMAGE", "images/GPLG_inventoryimages.tex"),
    Asset("ATLAS", "images/GPLG_inventoryimages.xml"),
    Asset("ATLAS_BUILD", "images/GPLG_inventoryimages.xml", 256),
}

local prefabs =
{
}

--------------------------------------------------------------------------

local function CancelAllTasks(inst)
    if inst._looptask ~= nil then
        inst._looptask:Cancel()
        inst._looptask = nil
    end
end

--------------------------------------------------------------------------

local function PlayIdle(inst)
    inst.AnimState:PlayAnimation("idle", true)
end

--------------------------------------------------------------------------

local function DoGiggle(inst)
    inst.AnimState:PlayAnimation("giggle")
    inst.AnimState:PushAnimation("idle", true)
end

--------------------------------------------------------------------------

local function DoMoustacheSpin(inst)
    inst.AnimState:PlayAnimation("moustache_spin_loop")
    inst.AnimState:PushAnimation("idle", true)
end

--------------------------------------------------------------------------

local function DoMoustacheGrow(inst)
    inst.AnimState:PlayAnimation("moustache_grow_big")
    inst.AnimState:PushAnimation("moustache_big_idle", false)

    inst:DoTaskInTime(15, function()
        if inst:IsValid() then
            inst.AnimState:PlayAnimation("moustache_grow_normal")
            inst.AnimState:PushAnimation("idle", true)
        end
    end)
end

--------------------------------------------------------------------------

local function DoTongue(inst)
    inst.AnimState:PlayAnimation("tongue_grow_long")
    inst.AnimState:PushAnimation("tongue_idle", false)

    inst:DoTaskInTime(10, function()
        if inst:IsValid() then
            inst.AnimState:PlayAnimation("tongue_wiggle")
            inst.AnimState:PushAnimation("tongue_idle", false)

            inst:DoTaskInTime(10, function()
                if inst:IsValid() then
                    inst.AnimState:PlayAnimation("tongue_grow_normal")
                    inst.AnimState:PushAnimation("idle", true)
                end
            end)
        end
    end)
end

--------------------------------------------------------------------------

local function PickBehavior(inst)
    if not inst:IsValid() then return end

    local roll = math.random()

    if roll < 0.55 then
        PlayIdle(inst)

    elseif roll < 0.70 then
        DoGiggle(inst)

    elseif roll < 0.82 then
        DoMoustacheSpin(inst)

    elseif roll < 0.92 then
        DoMoustacheGrow(inst)

    else
        DoTongue(inst)
    end
end

--------------------------------------------------------------------------

local function StartLoop(inst)

    CancelAllTasks(inst)

    local function Loop()
        PickBehavior(inst)

        local delay = math.random(12, 25)

        inst._looptask = inst:DoTaskInTime(delay, Loop)
    end

    Loop()
end

--------------------------------------------------------------------------

local function fn()

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("aprilfools_gnome")
    inst.AnimState:SetBuild("aprilfools_gnome")
    inst.AnimState:PlayAnimation("idle", true)

    inst:AddTag("trinket")
    inst:AddTag("gnome")
    inst:AddTag("gnomes")

    inst.entity:SetPristine()

    ----------------------------------------------------------------------

    if not TheWorld.ismastersim then
        return inst
    end

    ----------------------------------------------------------------------

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/GPLG_inventoryimages.xml"

    inst:AddComponent("tradable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    ----------------------------------------------------------------------

    inst:DoTaskInTime(0, StartLoop)

    inst:ListenForEvent("onremove", function()
        CancelAllTasks(inst)
    end)

    ----------------------------------------------------------------------

    MakeHauntableLaunch(inst)

    return inst
end

--------------------------------------------------------------------------

return Prefab("aprilfools_gnome", fn, assets, prefabs)