CreateConVar("horde_default_enemy_config", 1, FCVAR_SERVER_CAN_EXECUTE, "Use default enemy wave config settings.")
CreateConVar("horde_default_item_config", 1, FCVAR_SERVER_CAN_EXECUTE, "Use default item config settings.")
CreateConVar("horde_default_class_config", 1, FCVAR_SERVER_CAN_EXECUTE, "Use default class config settings.")
CreateConVar("horde_max_wave", 10, FCVAR_SERVER_CAN_EXECUTE, "Max waves.")
CreateConVar("horde_break_time", 60, FCVAR_SERVER_CAN_EXECUTE, "Break time between waves.")
CreateConVar("horde_enable_shop", 1, FCVAR_SERVER_CAN_EXECUTE + FCVAR_REPLICATED, "Enables shop menu or not.")
CreateConVar("horde_enable_shop_icons", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Enables shop menu icons or not.")
CreateConVar("horde_enable_perk", 1, FCVAR_SERVER_CAN_EXECUTE + FCVAR_REPLICATED, "Enables perks or not.")
CreateConVar("horde_enable_rank", 1, FCVAR_SERVER_CAN_EXECUTE + FCVAR_REPLICATED, "Enables ranks or not.")
CreateConVar("horde_enable_client_gui", 1, FCVAR_SERVER_CAN_EXECUTE, "Enables client information ui or not.")
CreateConVar("horde_max_spawn_distance", 2000, FCVAR_SERVER_CAN_EXECUTE, "Maximum enenmy respawn distance.")
CreateConVar("horde_min_spawn_distance", 400, FCVAR_SERVER_CAN_EXECUTE, "Minimum enenmy respawn distance.")
CreateConVar("horde_max_spawn_z_distance", 500, FCVAR_SERVER_CAN_EXECUTE, "Maximum enemy respawn height difference with players.")

CreateConVar("horde_start_money", 900, FCVAR_SERVER_CAN_EXECUTE, "Money given at start.")
CreateConVar("horde_round_bonus", 500, FCVAR_SERVER_CAN_EXECUTE, "Round bonus given at the end of the round.")
CreateConVar("horde_enable_ammobox", 1, FCVAR_SERVER_CAN_EXECUTE, "Enable ammobox spawns.")
CreateConVar("horde_npc_cleanup", 1, FCVAR_SERVER_CAN_EXECUTE, "Kills all NPCs after a wave.")
CreateConVar("horde_external_lua_config", "", FCVAR_SERVER_CAN_EXECUTE, "Name of external config to load. This will take over the configs if exists.")
--CreateConVar("horde_starter_weapon_1", "", FCVAR_ARCHIVE, "Starter weapon 1.")
--CreateConVar("horde_starter_weapon_2", "", FCVAR_ARCHIVE, "Starter weapon 2.")

CreateConVar("horde_director_interval", 5, FCVAR_SERVER_CAN_EXECUTE, "Game director execution interval in seconds. Decreasing this increases spawn rate.")
CreateConVar("horde_max_enemies_alive_base", 20, FCVAR_SERVER_CAN_EXECUTE, "Maximum number of living enemies (base).")
CreateConVar("horde_max_enemies_alive_scale_factor", 5, FCVAR_SERVER_CAN_EXECUTE, "Scale factor of the maximum number of living enemies for multiplayer.")
CreateConVar("horde_max_enemies_alive_max", 50, FCVAR_SERVER_CAN_EXECUTE, "Maximum number of maximum living enemies.")
CreateConVar("horde_corpse_cleanup", 0, FCVAR_SERVER_CAN_EXECUTE, "Remove corpses.")

CreateConVar("horde_base_walkspeed", 180, FCVAR_SERVER_CAN_EXECUTE, "Base walkspeed.")
CreateConVar("horde_base_runspeed", 220, FCVAR_SERVER_CAN_EXECUTE, "Base runspeed.")

CreateConVar("horde_difficulty", 0, FCVAR_SERVER_CAN_EXECUTE, "Difficulty.")
CreateConVar("horde_disable_difficulty_voting", 0, FCVAR_SERVER_CAN_EXECUTE, "Disable difficulty voting.")
CreateConVar("horde_endless", 0, FCVAR_SERVER_CAN_EXECUTE, "Endless.")
CreateConVar("horde_total_enemies_scaling", 0, FCVAR_SERVER_CAN_EXECUTE, "Forces the gamemode to multiply maximum enemy count by this.")

CreateConVar("horde_perk_start_wave", 1, FCVAR_SERVER_CAN_EXECUTE + FCVAR_REPLICATED, "The wave when Tier 1 perks are active.")
CreateConVar("horde_perk_scaling", 2, FCVAR_SERVER_CAN_EXECUTE + FCVAR_REPLICATED, "The multiplier to the level for which wave it is unlocked. e.g. at 1.5, perk level 4 is unlocked at start_wave + 6.", 0)

CreateConVar("horde_enable_starter", 1, FCVAR_ARCHIVE + FCVAR_REPLICATED, "Enables starter weapons.")
CreateConVar("horde_arccw_attinv_free", 1, FCVAR_SERVER_CAN_EXECUTE + FCVAR_REPLICATED, "Free ArcCW attachments.")

CreateConVar("horde_ready_countdown_ratio", 0.5, FCVAR_SERVER_CAN_EXECUTE, "Ratio of players required to start the 60 second countdown (0-1).")

CreateConVar("horde_enable_scoreboard", 1, FCVAR_SERVER_CAN_EXECUTE, "Enables built-in scoreboard.")
CreateConVar("horde_enable_3d2d_icon", 1, FCVAR_SERVER_CAN_EXECUTE, "Enables player icon renders.")

CreateConVar("horde_turret_spread", 0.5, FCVAR_SERVER_CAN_EXECUTE, "Turret spread.")

CreateConVar("horde_testing_unlimited_class_change", 0, FCVAR_SERVER_CAN_EXECUTE, "You can change a class for an unlimited times. Please use this only for testing purposes.")
CreateConVar("horde_testing_display_damage", 0, FCVAR_ARCHIVE, "Display damage for testing.")
CreateConVar("horde_display_damage", 1, FCVAR_ARCHIVE, "Display damage.")
CreateConVar("horde_enable_health_gui", 1, FCVAR_ARCHIVE, "Enables health UI.")
CreateConVar("horde_enable_ammo_gui", 1, FCVAR_ARCHIVE, "Enables ammo UI.")
CreateClientConVar("horde_disable_default_gadget_use_key", 0, FCVAR_ARCHIVE, "Disable default key bind for active gadgets.")

if SERVER then
util.AddNetworkString("Horde_LegacyNotification")
util.AddNetworkString("Horde_PlayerInit")
util.AddNetworkString("Horde_SyncItems")
util.AddNetworkString("Horde_SyncEnemies")
util.AddNetworkString("Horde_SyncClasses")
util.AddNetworkString("Horde_SyncStatus")
util.AddNetworkString("Horde_SyncSpecialArmor")
util.AddNetworkString("Horde_PlayerReadySync")
util.AddNetworkString("Horde_AmmoboxCountdown")
util.AddNetworkString("Horde_SyncBossSpawned")
util.AddNetworkString("Horde_SyncBossHealth")
end

HORDE = {}
HORDE.__index = HORDE
HORDE.version = "1.1.9.0"
print("[HORDE] HORDE Version is " .. HORDE.version) -- Sanity check

HORDE.color_crimson = Color(220, 20, 60, 225)
HORDE.color_crimson_dim = Color(200, 0, 40)
HORDE.color_crimson_dark = Color(100,0,0)
HORDE.color_crimson_violet = Color(146, 43, 62)
HORDE.color_gadget_active = HORDE.color_crimson
HORDE.color_gadget_once = Color(238,130,238)
HORDE.color_hollow = Color(40,40,40,225)
HORDE.color_hollow_dim = Color(80, 80, 80, 225)
HORDE.color_config_bar = Color(50, 50, 50, 200)
HORDE.color_config_bg = Color(150, 150, 150, 200)
HORDE.color_config_content_bg = Color(230,230,230)
HORDE.color_none = Color(0,0,0,0)
HORDE.color_config_btn = Color(40,40,40)
HORDE.start_game = false
HORDE.total_enemies_per_wave = {15, 19, 23, 27, 30, 33, 36, 39, 42, 45, 47, 49, 51, 53, 55, 56, 57, 58, 59, 60}
--HORDE.total_enemies_per_wave = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

-- Director
HORDE.difficulty = 1
HORDE.total_enemies_this_wave = 0
HORDE.alive_enemies_this_wave = 0
HORDE.killed_enemies_this_wave = 0
HORDE.current_wave = 0
HORDE.total_break_time = math.max(10, GetConVarNumber("horde_break_time"))
HORDE.current_break_time = HORDE.total_break_time

HORDE.max_spawn_distance = math.max(100, GetConVarNumber("horde_max_spawn_distance"))
HORDE.min_spawn_distance = math.max(100, GetConVarNumber("horde_min_spawn_distance"))
HORDE.max_enemies_alive = 20
HORDE.spawned_enemies = {}
HORDE.spawned_enemies_count = {}
HORDE.ai_nodes = HORDE.ai_nodes or {}
HORDE.found_ai_nodes = false
HORDE.enemy_spawn_z = 6
HORDE.min_base_enemy_spawns_per_think = 4
HORDE.max_base_enemy_spawns_per_think = 5
HORDE.spawn_radius = 75
HORDE.max_max_waves = 10
HORDE.max_waves = math.min(HORDE.max_max_waves, math.max(1, GetConVarNumber("horde_max_wave")))
HORDE.start_money = math.max(0, GetConVarNumber("horde_start_money"))
HORDE.total_enemies_this_wave_fixed = 0
HORDE.kill_reward_base = 90
HORDE.round_bonus_base = GetConVar("horde_round_bonus"):GetInt()
HORDE.disable_levels_restrictions = 0
if CLIENT then
net.Receive("Horde_Disable_Levels", function ()
    HORDE.disable_levels_restrictions = 1
end)
end

HORDE.SPAWN_PROXIMITY = 0
HORDE.SPAWN_UNIFORM = 1
HORDE.SPAWN_PROXIMITY_NOISY = 2

-- Ammobox
HORDE.ammobox_max_count_limit = 9
HORDE.ammobox_refresh_interval = 60
HORDE.enable_ammobox = GetConVar("horde_enable_ammobox"):GetInt()

-- Statistics
-- Keep track of entities separately, so we don't have to network entities across
-- the network.
HORDE.player_drop_entities = {}
HORDE.player_ready = {}
HORDE.player_damage = {}
HORDE.player_damage_taken = {}
HORDE.player_heal = {}
HORDE.player_headshots = {}
HORDE.player_elite_kills = {}
HORDE.player_vote_map_change = {}

-- Render / Gui
HORDE.render_highlight_disable = 0
HORDE.render_highlight_enemies = 1
HORDE.render_highlight_ammoboxes = 2
HORDE.difficulty_text = {"NORMAL", "HARD", "REALISM", "NIGHTMARE", "APOCALYPSE"}

-- ArcCW Attachments
if ArcCWInstalled then
    if GetConVar("horde_arccw_attinv_free"):GetInt() == 0 then
        RunConsoleCommand("arccw_attinv_free", "0")
    else
        RunConsoleCommand("arccw_attinv_free", "1")
    end

    -- Disable perks that messes up with Horde's own system.
    if GetConVar("horde_default_item_config"):GetInt() == 1 then
        ArcCW.AttachmentBlacklistTable["go_perk_headshot"] = true
        ArcCW.AttachmentBlacklistTable["go_perk_ace"] = true
        ArcCW.AttachmentBlacklistTable["go_perk_last"] = true
        ArcCW.AttachmentBlacklistTable["go_perk_refund"] = true
        ArcCW.AttachmentBlacklistTable["go_perk_slow"] = true
        ArcCW.AttachmentBlacklistTable["go_m249_mag_12g_45"] = true
    end
end


-- Disable Godmode
RunConsoleCommand("sbox_godmode", "0")
RunConsoleCommand("vj_npc_addfrags", "0")
RunConsoleCommand("vj_npc_knowenemylocation", "1")
RunConsoleCommand("vj_npc_bleedenemyonmelee", "0")

-- Util functions
function HORDE:GiveAmmo(ply, wpn, count)
    local clip_size = wpn:GetMaxClip1()
    local ammo_id = wpn:GetPrimaryAmmoType()

    if clip_size > 0 then -- block melee
        ply:GiveAmmo(clip_size * count, ammo_id, false)
        return true
    else
        -- Give 1 piece of this ammo since clip size do not apply
        if ammo_id >= 1 then
            ply:GiveAmmo(count, ammo_id, false)
            return true
        end
    end
    return false
end

function HORDE:Round2(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function HORDE:GetUpgradePrice(class, ply)
    local level
    if CLIENT then
        level = LocalPlayer():Horde_GetUpgrade(class)
    else
        level = ply:Horde_GetUpgrade(class)
    end
    if class == "horde_void_projector" or class == "horde_solar_seal" or class == "horde_astral_relic" or class == "horde_carcass" or class == "horde_pheropod" then
        local price = 800 + 25 * level
        return price
    else
        local base_price = HORDE.items[class].price
        local price = HORDE:Round2(math.max(100, base_price / 2) + math.max(10, base_price / 64) * level)
        return price
    end
end

hook.Add( "SetupMove", "CustomDashShit", function( ply, mv, cmd )
    if(mv:KeyPressed(IN_ALT2) && CurTime() > ply:GetNW2Float("DashCooldown") && !ply:GetNW2Bool("DashLeftGround") && IsValid(ply:GetActiveWeapon())) then
        local x = mv:GetSideSpeed()
        local y = mv:GetForwardSpeed()
        local ang = (mv:GetAngles():Right()*x+mv:GetAngles():Forward()*y):GetNormalized()
        if(ang.x == 0 && ang.y == 0) then return end
        local dir = ply:GetVelocity()+Vector(ang.x,ang.y,math.Clamp(ang.z, 0.15, 0.66))*450
        if CLIENT && IsFirstTimePredicted() then
            local animtoplay = x < 0 && "dashleft" or x > 0 && "dashright" or "dashforward"
            local dur = (animtoplay == "dashright" or animtoplay == "dashleft") && 0.5 or 2
            StartArmAnim(animtoplay,"c_miscarm",dur)
            ply:EmitSound("dashwhoosh.wav",50,math.random(75,125),0.4)
            if(ply:IsOnGround()) then
                ply:EmitSound("meslide1.wav",50,math.random(75,125),0.55)
            end
        end
        ply:SetGroundEntity(nil)
        mv:SetVelocity(dir)
        ply.DashInvuln = CurTime() + 0.45
        ply:SetNW2Bool("DashLeftGround",true)
    end
end )

hook.Add( "PlayerPostThink", "CustomDashGround", function( ply )
    if(ply:IsOnGround() && ply:GetNW2Bool("DashLeftGround")) then
        ply:SetNW2Bool("DashLeftGround",false)
        ply:SetNW2Float("DashCooldown",CurTime()+0.9)
    end
    if(CurTime() > (ply.AttackingDur or 0) && ply.Attacking) then
        ply.Attacking = false
    end
end )

hook.Add("DoAnimationEvent" , "PlayerAttackingShit" , function( ply , event , data )
    if event == PLAYERANIMEVENT_ATTACK_PRIMARY or event == PLAYERANIMEVENT_ATTACK_SECONDARY then
       ply.Attacking = true
       ply.AttackingDur = CurTime() + 0.25
    end
end)

if SERVER then
    util.AddNetworkString("SetKnockDown")
    hook.Add("PostPlayerDeath","knockdownviewmodelfix",function(ply)
        net.Start("SetKnockDown")
        net.WriteEntity(ply)
        net.WriteBool(false)
        net.Broadcast()
        ply:SetViewOffset(Vector(0,0,64))
        ply:StopLuaAnimation("damageair")
        ply:StopLuaAnimation("damageair_getup")
        ply.KnockedDown = nil
    end)
else
    DOWNEDFPSPOS = 0
    hook.Add("CalcViewModelView","downedcalcview",function(wep, vm, oldPos, oldAng, pos, ang )
        DOWNEDFPSPOS = math.Approach(DOWNEDFPSPOS,-32,0.75)
        if(LocalPlayer().DisableMoveAnimation) then
            local pos = oldPos + oldAng:Up()*DOWNEDFPSPOS + oldAng:Forward()*DOWNEDFPSPOS
            return pos
        end
    end)
    net.Receive("SetKnockDown",function()
        local ply = net.ReadEntity()
        local bool = net.ReadBool()
        ply.DisableMoveAnimation = bool
        DOWNEDFPSPOS = 0
    end)
    RegisterLuaAnimation('damageair', {
        FrameData = {
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_L_Calf'] = {
                        RU = 16
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                        RU = -80
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                        RU = -32
                    },
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                        RU = -48
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                        RU = -64,
                        RR = 32
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        RF = 32
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = -80
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                        RU = 16
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                        RU = -48
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                        RU = -64,
                        RR = -31
                    }
                },
                FrameRate = 10
            },
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_L_Calf'] = {
                        RU = 16
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                        RU = -85
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                        RU = -35
                    },
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                        RU = -48
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                        RU = -64,
                        RR = 32
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                        RU = 20
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                        RU = -64,
                        RR = -31
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        RF = 32
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                        RU = -48
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = -85
                    }
                },
                FrameRate = 24
            },
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_L_Calf'] = {
                        RU = 48
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                        RU = -16
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                        RU = 16
                    },
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                        RU = -48
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                        RU = -64,
                        RR = 80
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                        RU = 16
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                        RU = 32
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        MU = -31.111111111111,
                        RF = -96
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                        RU = -48
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = -48
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                        RU = -64,
                        RR = -80
                    }
                },
                FrameRate = 2
            },
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                    },
                    ['ValveBiped.Bip01_L_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                        RU = 32,
                        RR = -32
                    },
                    ['ValveBiped.Bip01_Spine4'] = {
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        MU = -33,
                        RF = -91
                    },
                    ['ValveBiped.Bip01_L_Calf'] = {
                        RU = 48
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                        RU = 31,
                        RR = 32
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = -16
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                    },
                    ['ValveBiped.Bip01_R_Foot'] = {
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_R_Clavicle'] = {
                    }
                },
                FrameRate = 2
            },
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                    },
                    ['ValveBiped.Bip01_L_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                        RU = 32,
                        RR = -32
                    },
                    ['ValveBiped.Bip01_Spine4'] = {
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        MU = -33,
                        RF = -91
                    },
                    ['ValveBiped.Bip01_L_Calf'] = {
                        RU = 48
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                        RU = 31,
                        RR = 32
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = -16
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                    },
                    ['ValveBiped.Bip01_R_Foot'] = {
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_R_Clavicle'] = {
                    }
                },
                FrameRate = 1
            },
        },
        Interpolation = INTERP_CUBIC,
        RestartFrame = 6,
        Type = TYPE_STANCE
    })

    RegisterLuaAnimation('damageair_getup', {
        FrameData = {
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                    },
                    ['ValveBiped.Bip01_L_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                        RU = 32,
                        RR = -32
                    },
                    ['ValveBiped.Bip01_Spine4'] = {
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        MU = -33,
                        RF = -91
                    },
                    ['ValveBiped.Bip01_L_Calf'] = {
                        RU = 48
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                        RU = 31,
                        RR = 32
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = -16
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                    },
                    ['ValveBiped.Bip01_R_Foot'] = {
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_R_Clavicle'] = {
                    }
                },
                FrameRate = 1000
            },
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                    },
                    ['ValveBiped.Bip01_L_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                        RU = 32,
                        RR = -32
                    },
                    ['ValveBiped.Bip01_Spine4'] = {
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        MU = -33,
                        RF = -91
                    },
                    ['ValveBiped.Bip01_L_Calf'] = {
                        RU = 48
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                        RU = 31,
                        RR = 32
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = -16
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                    },
                    ['ValveBiped.Bip01_R_Foot'] = {
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_R_Clavicle'] = {
                    }
                },
                FrameRate = 10
            },
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                        RU = -96
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                        RU = -16
                    },
                    ['ValveBiped.Bip01_R_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                    },
                    ['ValveBiped.Bip01_Spine4'] = {
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                        RU = 32
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                        RU = 128
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                        RU = -96,
                        RR = 32
                    },
                    ['ValveBiped.Bip01_L_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_L_Calf'] = {
                        RU = 112
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                        RU = 32
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = -80
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        MU = -24,
                        RF = -180
                    },
                    ['ValveBiped.Bip01_R_Foot'] = {
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                        RU = -96,
                        RR = -32
                    }
                },
                FrameRate = 2.5
            },
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                        RU = -96
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                        RU = -16
                    },
                    ['ValveBiped.Bip01_R_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                    },
                    ['ValveBiped.Bip01_Spine4'] = {
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                        RU = 32
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                        RU = 128
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                        RU = -96,
                        RR = 32
                    },
                    ['ValveBiped.Bip01_L_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_L_Calf'] = {
                        RU = 112
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                        RU = 32
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = -80
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        MU = -24,
                        RF = -180
                    },
                    ['ValveBiped.Bip01_R_Foot'] = {
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                        RU = -96,
                        RR = -32
                    }
                },
                FrameRate = 8
            },
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                        RU = 16,
                        RR = 16
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                        RU = -16
                    },
                    ['ValveBiped.Bip01_R_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                        RU = 48
                    },
                    ['ValveBiped.Bip01_Spine4'] = {
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                        MU = -13.3333,
                        RF = -48
                    },
                    ['ValveBiped.Bip01_L_Calf'] = {
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                        RU = -64
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                        RU = -48
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                        RU = 32
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                        RU = 32
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                        RU = 32
                    },
                    ['ValveBiped.Bip01_R_Foot'] = {
                        RU = -48
                    },
                    ['ValveBiped.Bip01_L_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                        RU = 16,
                    }
                },
                FrameRate = 4
            },
            {
                BoneInfo = {
                    ['ValveBiped.Bip01_Spine2'] = {
                    },
                    ['ValveBiped.Bip01_R_Thigh'] = {
                    },
                    ['ValveBiped.Bip01_Head1'] = {
                    },
                    ['ValveBiped.Bip01_L_Clavicle'] = {
                    },
                    ['ValveBiped.Bip01_L_UpperArm'] = {
                    },
                    ['ValveBiped.Bip01_Spine4'] = {
                    },
                    ['ValveBiped.Bip01_Pelvis'] = {
                    },
                    ['ValveBiped.Bip01_L_Calf'] = {
                    },
                    ['ValveBiped.Bip01_R_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_L_Thigh'] = {
                    },
                    ['ValveBiped.Bip01_R_Calf'] = {
                    },
                    ['ValveBiped.Bip01_Spine1'] = {
                    },
                    ['ValveBiped.Bip01_Spine'] = {
                    },
                    ['ValveBiped.Bip01_R_Foot'] = {
                    },
                    ['ValveBiped.Bip01_R_UpperArm'] = {
                    },
                    ['ValveBiped.Bip01_L_Forearm'] = {
                    },
                    ['ValveBiped.Bip01_R_Clavicle'] = {
                    }
                },
                FrameRate = 4
            }
        },
        Interpolation = INTER_CUBIC,
        Type = TYPE_GESTURE
    })
end

function HORDE:KnockDown(ply,ang)
if(ply.KnockedDown || ply:HasGodMode()) then return end
    ply:ViewPunch( Angle(-90,0,0) )
    ply:Freeze(true)
    ply:StopLuaAnimation("damageair_getup")
    ply:StopLuaAnimation("damageair")
    ply:SetLuaAnimation("damageair")
    ply:SetEyeAngles(ang)
    ply:SetViewOffset(Vector(0,0,4))
    ply.KnockedDown = true
    net.Start("SetKnockDown")
    net.WriteEntity(ply)
    net.WriteBool(true)
    net.Broadcast()
    for k, v in pairs(ply:GetWeapons()) do
        v.StoredHoldtype = v:GetHoldType()
        v:SetHoldType("normal")
    end
    if(timer.Exists("damageknockbacked"..ply:GetName())) then
        timer.Remove("damageknockbacked"..ply:GetName())
    end
    if(timer.Exists("knockgetup"..ply:GetName())) then
        timer.Remove("knockgetup"..ply:GetName())
    end
    timer.Create("damageknockbacked"..ply:GetName(),0.5,1,function()
        if(IsValid(ply)) then
            ply:SetLuaAnimation("damageair_getup",nil,nil,1.66)
            ply:StopLuaAnimation("damageair")
            timer.Create("knockgetup"..ply:GetName(),0.2,1,function()
                if(IsValid(ply)) then
                    for k, v in pairs(ply:GetWeapons()) do
                        v:SetHoldType(v.StoredHoldtype)
                    end
                    local tr = util.TraceLine({start=ply:GetPos(),endpos=ply:GetPos()+vector_up*75,filter=ply})
                    if(!tr.Hit) then
                        ply:SetPos(ply:GetPos() + Vector(0,0,2))
                    end
                    ply:SetVelocity(Angle(0,ply:EyeAngles().y,0):Forward()*150+Vector(0,0,100))
                    ply:SetViewOffset(Vector(0,0,64))
                    ply:Freeze(false)
                    net.Start("SetKnockDown")
                    net.WriteEntity(ply)
                    net.WriteBool(false)
                    net.Broadcast()
                    ply.KnockedDown = nil
                end
            end)
        end
    end)
end