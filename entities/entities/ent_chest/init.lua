
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

ENT.Ents = {
	["val_airdrop_amnd"] = true,
}

function ENT:Initialize()
	self:SetModel("models/props_junk/wood_crate001a.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)

	self.Entity:SetCollisionGroup(COLLISION_GROUP_NONE)
	
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then 
		phys:SetMass(100) 
		phys:Wake() 
	end
end

function ENT:UpdateTransmitState()
--if self:GetPos():Distance(Entity( 1 ):GetPos()) < 1250 then return end
	return TRANSMIT_PVS
end

function ENT:OnTakeDamage(dmginfo)
end

function ENT:Think()
end

function ENT:Use(ply, caller)
	
end