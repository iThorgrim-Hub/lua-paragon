---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ithorgrim.
--- DateTime: 18/03/2022 23:01
---
local Paragon = require("paragon")
if (not Paragon.Config.CreatureGiveExp) then
    return false
end

local function OnPlayerKillCreature(event, player, creature)
    local pLevel = player:GetLevel()
    local cLevel = creature:GetLevel()
    local paragon = player:GetData("paragon")

    local dLevel = pLevel - cLevel
    if (dLevel <= Paragon.Config.PlayerCreatureLevelDifference and dLevel >= -Paragon.Config.PlayerCreatureLevelDifference) then
        for creature_id, creature_exp in pairs(Paragon.ServerInformations.creature_informations) do
            if (creature:GetEntry() == creature_id) then
                if (paragon:SetExp(creature_exp)) then
                    player:SendNotification("Vous avez atteind le niveau de paragon " .. paragon:GetLevel())
                end
            end
        end
    end
end
RegisterPlayerEvent(7, OnPlayerKillCreature)