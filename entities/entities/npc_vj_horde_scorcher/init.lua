AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/horde/bloodsquid/bloodsquid.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 250
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE", "CLASS_XEN"} -- NPCs with the same class with be allied to each other
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"bite"} -- Melee Attack Animations
ENT.MeleeAttackDistance = 32 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 85 -- How far does the damage go?
ENT.TimeUntilMeleeAttackDamage = 1 -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttackDamage = 30
ENT.MeleeAttackBleedEnemy = false -- Should the player bleed when attacked by melee
ENT.FootStepTimeRun = 0.5 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.5 -- Next foot step sound when it is walking
ENT.AnimTbl_Walk = {ACT_WALK} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.AnimTbl_RangeAttack = {"range"} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_horde_scorcher_projectile" -- The entity that is spawned when range attacking
ENT.RangeDistance = 850 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 100 -- How close does it have to be until it uses melee?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "attach_mouth" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.TimeUntilRangeAttackProjectileRelease = 0.5 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 7 -- How much time until it can use a range attack?
ENT.Immune_Fire = true

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav","npc/zombie/foot2.wav","npc/zombie/foot3.wav"}
--ENT.SoundTbl_Breath = {"npc/zombie_poison/pz_breathe_loop1.wav"}
ENT.SoundTbl_Idle = {"horde/bloodsquid/bc_idle1.wav", "horde/bloodsquid/bc_idle2.wav"}
ENT.SoundTbl_Alert = {"horde/bloodsquid/bc_attackgrowl1.wav","horde/bloodsquid/bc_attackgrowl2.wav","horde/bloodsquid/bc_attackgrowl3.wav"}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"zsszombie/miss1.wav","zsszombie/miss2.wav","zsszombie/miss3.wav","zsszombie/miss4.wav"}
ENT.SoundTbl_Pain = {"horde/bloodsquid/bc_pain1.wav","horde/bloodsquid/bc_pain2.wav","horde/bloodsquid/bc_pain3.wav"}
ENT.SoundTbl_Death = {"horde/bloodsquid/bc_die1.wav","horde/bloodsquid/bc_die2.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.CanFlinch = 1
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	self:SetColor(Color(50, 50, 0))
    self:Ignite(99999999)
	self:AddRelationship("npc_headcrab_poison D_LI 99")
	self:AddRelationship("npc_headcrab_fast D_LI 99")
end

function ENT:RangeAttackCode()
	if self.Dead == true or self.vACT_StopAttacks == true or self.Flinching == true or self.MeleeAttacking == true then return end
	if IsValid(self:GetEnemy()) then
		self.RangeAttacking = true
		self:PlaySoundSystem("RangeAttack")
		if self.RangeAttackAnimationStopMovement == true then self:StopMoving() end
		if self.RangeAttackAnimationFaceEnemy == true then self:FaceCertainEntity(self:GetEnemy(), true) end
		-- Default projectile code
		local projectile = ents.Create(self.RangeAttackEntityToSpawn)
		local target_pos = self:GetEnemy():GetPos() + Vector(0, 10, 0)
		projectile:SetPos(self:GetAttachment(1).Pos)
		projectile:SetAngles((target_pos - projectile:GetPos()):Angle())
		projectile:SetOwner(self)
		projectile:SetPhysicsAttacker(self)
		projectile:Spawn()
		projectile:Activate()
		local phys = projectile:GetPhysicsObject()
		if IsValid(phys) then
			phys:Wake()
			local vel = (target_pos - self:GetAttachment(1).Pos) * 1.5
			phys:SetVelocity(vel)
			--projectile:SetAngles(vel:GetNormal():Angle())
		end
	end
	if self.AlreadyDoneRangeAttackFirstProjectile == false && self.TimeUntilRangeAttackProjectileRelease != false then
		self:RangeAttackCode_DoFinishTimers()
	end
	self.AlreadyDoneRangeAttackFirstProjectile = true
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/

VJ.AddNPC("Scorcher","npc_vj_horde_scorcher", "Zombies")