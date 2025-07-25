 
local MODS_KEY_BINDINGS = {
    ADD_MONEY = Key.NUM_ONE,
    ADD_SKILL_POINTS = Key.NUM_TWO,
    UNLOCK_ALL_ITEMS = Key.NUM_THREE,
    UNLOCK_ALL_FIRE_POINT = Key.NUM_FOUR,
    UNLOCK_SHOP_SELL = Key.NUM_FIVE,
    ADD_ALL_GEM = Key.NUM_SIX,
    ADD_ALL_TOOL = Key.NUM_SEVEN,
    ADD_ALL_STYLE_SKILL = Key.NUM_EIGHT,
    ADD_ALL_EQUIPMENT = Key.NUM_NINE,
    ADD_ALL_ENCHAN = Key.F9,
    UNLOCK_ALL_HELP = Key.F8,
}
---@type ADebugCommand_C
local CACHED_DEBUG_COMMAND = nil


---@return ADebugCommand_C | nil
local GetDebugCommand = function()
    if CACHED_DEBUG_COMMAND then
        return CACHED_DEBUG_COMMAND
    end

    ---@class ADebugCommand_C : UObject
    local dbg = FindFirstOf('DebugCommand_C')
    if dbg then
        CACHED_DEBUG_COMMAND = dbg
        return dbg
    end
    return nil
end


local MODS = {
    ADD_MONEY = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:AddMoney('10000')
        end
    end,
    ADD_SKILL_POINTS = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:AddSkillPt('100')
        end
    end,
    UNLOCK_ALL_ITEMS = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:AddAllGem()
            dbg:GivemeallTool()
            dbg:GivemeallStyleSkill()
            dbg:GivemeallEquipment()
            dbg:GiveAllEnchan()
            dbg:UnlockAllHelp()
        end
    end,
    UNLOCK_ALL_FIRE_POINT = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:UnlockAllFirePoint()
        end
    end,
    UNLOCK_SHOP_SELL = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:OpenShopSell()
        end
    end,
    ADD_ALL_GEM = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:AddAllGem()
        end
    end,
    ADD_ALL_TOOL = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:GivemeallTool()
        end
    end,
    ADD_ALL_STYLE_SKILL = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:GivemeallStyleSkill()
        end
    end,
    ADD_ALL_EQUIPMENT = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:GivemeallEquipment()
        end
    end,
    ADD_ALL_ENCHAN = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:GiveAllEnchan()
        end
    end,
    UNLOCK_ALL_HELP = function()
        local dbg = GetDebugCommand()
        if dbg then
            dbg:UnlockAllHelp()
        end
    end,
}


-- register all key binds 
for func_name, key_bind in pairs(MODS_KEY_BINDINGS) do
    if key_bind then
        RegisterKeyBind(key_bind, MODS[func_name])
        print('Registered key bind for ' .. func_name)
    else
        print('No key bind found for ' .. func_name)
    end
end
