PERK.PrintName = "Hollow Essence"
PERK.Description =
[[+{1} to maximum Spectres alive.
{2} reduced Raise Spectre cost.]]
PERK.Icon = "materials/perks/necromancer/hollow_essence.png"
PERK.Params = {
    [1] = {value = 1},
    [2] = {value = 0.4, percent = true},
}
PERK.Hooks = {}

PERK.Hooks.Horde_OnRaiseSpectre = function (ply, properties)
    if ply:Horde_GetPerk("necromancer_hollow_essence") then
        properties.hollow_essence = true
    end
end

PERK.Hooks.Horde_OnSetPerk = function (ply, perk)
    if CLIENT then return end
    if perk == "necromancer_hollow_essence" then
        if not ply.Horde_Spectre_Max_Count then ply.Horde_Spectre_Max_Count = 0 end
        ply.Horde_Spectre_Max_Count = ply.Horde_Spectre_Max_Count + 1
    end
end

PERK.Hooks.Horde_OnUnsetPerk = function (ply, perk)
    if CLIENT then return end
    if perk == "necromancer_hollow_essence" then
        ply.Horde_Spectre_Max_Count = ply.Horde_Spectre_Max_Count - 1

        if HORDE.player_drop_entities[ply:SteamID()] then
            for id, ent in pairs(HORDE.player_drop_entities[ply:SteamID()]) do
                if ent:IsNPCHorde() and ent:GetClass() == "npc_vj_horde_spectre" then
                    ent:Remove()
                end
            end
        end
    end
end