PERK.PrintName = "Resistant"
PERK.Description = "Take {percent} less damage."

PERK.Parameters = {
    ["percent"] = {type = "f", default = 0.1, min = 0, max = 1, percent = true},
}

PERK.Hooks = {}
PERK.Hooks.EntityTakeDamage = function(target, dmginfo)
    if target:IsPlayer() and target:Horde_GetPerk("resistance_all") then
        dmginfo:ScaleDamage(1 - target:Horde_GetPerkParam("resistance_all", "percent"))
    end
end