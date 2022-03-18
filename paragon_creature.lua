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
    local dLevel = pLevel - cLevel

    local paragon = player:GetData("paragon")

    if (dLevel <= Paragon.Config.PlayerCreatureLevelDifference and dLevel >= -Paragon.Config.PlayerCreatureLevelDifference) then
        for creature_id, creature_exp in pairs(Paragon.ServerInformations.creature_informations) do
            local cEntry = creature:GetEntry()
            if (creature_id == cEntry) then
                paragon:SetExp(creature_exp)
            end
        end
    end
end
RegisterPlayerEvent(7, OnPlayerKillCreature)