-- one hit kills 
-- todo -- make this a toggleable mod 
RegisterKeyBind(Key.F7, function()
    local extended_stats = FindAllOf('ExtendedStatComponent_C')
    if extended_stats then
        print('ENABLING ONE HIT KILLS')
        for _, extended_stat in pairs(extended_stats) do
            if not string.find(extended_stat:GetFullName(), 'BP_CombatCharacter_Player_Final_C') then
                extended_stat.CurrentValue = 1
                extended_stat.MaxValue = 1


                -- bosses have cached health that needs to be overriden 
                if string.find(extended_stat:GetFullName(), 'BOSS') then
                    extended_stat.PreCurrentValueCached = 1
                    extended_stat.PreMaxValueCached = 1
                end
            else
                print('ONE HIT KILLS NOT ENABLED FOR PLAYER')
            end
        end
    end
end)