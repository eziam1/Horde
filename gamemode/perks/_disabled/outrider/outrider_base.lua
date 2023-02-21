PERK.PrintName = "Antrider Base"
PERK.Description = [[
The Outrider class relies on its Antlion to support teammates and weaken enemies.
COMPLEXITY: MEDIUM

{1} increased Antlion health.

Equipped with Pheropods. Upgradable through shop.
LMB: Raise Antlion (50 Energy)
Creates an Antlion that is bound to your command:
- Players can mount the Antlion by pressing E. The mounter is affected by Antlion's Blessing.
- Antlion's Blessing provides 15% increased evasion and 15% Poison damage resistance.
- Antlion melee attack deals Physical damage.
- Antlion ranged attack deals splashing Poison damage to enemies, but provides Antlion's Blessing to players.
- Antlion has 50% increased Poison damage resistance.
- When you die, the Antlions will also die.

RMB: Throw Pod
Throws a pheropod at the target. HOLD to stop Antlion movement.
- If the target is a location, Antlions will try to move to that area.
- If the target is an enemy, Antlions will focus on that enemy.
- If the target is a player, Antlions will perform range attacks at that player location.
- If the target is an Antlion, heals that Antlion for 10% of its health.]]
PERK.Icon = "materials/subclasses/artificer.png"
PERK.Params = {
    [1] = {percent = true, base = 0, level = 0.008, max = 0.2, classname = "Artificer"},
    [2] = {value = 0.008, percent = true},
    [3] = {value = 0.2, percent = true},
}
PERK.Hooks = {}

PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "artificer_base" then
        if ply:HasWeapon("horde_solar_seal") == true then return end
        ply:StripWeapons()
        timer.Simple(0, function() ply:Give("horde_solar_seal") end)
    end
end

PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("artificer_base") then return end
    if HORDE:IsLightningDamage(dmginfo) then
        npc:Horde_AddDebuffBuildup(HORDE.Status_Shock, dmginfo:GetDamage() * (ply:Horde_GetPerkLevelBonus("artificer_base")), ply, dmginfo:GetDamagePosition())
        bonus.increase = bonus.increase + ply:Horde_GetPerkLevelBonus("artificer_base")
    elseif HORDE:IsFireDamage(dmginfo) then
        bonus.increase = bonus.increase + ply:Horde_GetPerkLevelBonus("artificer_base")
    end
end

PERK.Hooks.Horde_PrecomputePerkLevelBonus = function (ply)
    if SERVER then
        ply:Horde_SetPerkLevelBonus("artificer_base", math.min(0.2, 0.008 * ply:Horde_GetLevel("Artificer")))
    end
end