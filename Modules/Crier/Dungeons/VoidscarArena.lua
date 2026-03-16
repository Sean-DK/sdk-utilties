local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Taz'Rah
local Tazrah = SDKCrier:InitializeEncounterOptions(2791)
Tazrah:AddSoundAlertOption(1222085, true, "|ccff41e3aMeow|r") --Cosmic Spike
Tazrah:AddSoundAlertOption(1262901, true, "|ccff41e3aAlert|r") --Gather Shadows
Tazrah:AddSoundAlertOption(1222274, true, "|ccff41e3aAlert|r") --Dark Rift
Tazrah:AddPrivateAuraAlertOption(1225011, true, "|ccff41e3aAirhorn|r") --Ethereal Shards
Tazrah:AddPrivateAuraAlertOption(1222098, true, "|ccff41e3aAirhorn|r") --Nether Dash

function Tazrah:OnEncounterStart()
	self:EnableAlertSound(1262901, 40)
	self:EnableAlertSound(1222274, 41)
    self:EnablePrivateAuraSound(1225011)
    self:EnablePrivateAuraSound(1222098)

    if self:IsTank() then
	    self:EnableAlertSound(1222085, 39)
    end
end

--Atroxus
local Atroxus = SDKCrier:InitializeEncounterOptions(2792)
Atroxus:AddSoundAlertOption(1222371, true, "|ccff41e3aAlert|r") --Provoke Creeper
Atroxus:AddSoundAlertOption(1222642, true, "|ccff41e3aMeow|r") --Hulking Claw
Atroxus:AddSoundAlertOption(1263977, true, "|ccff41e3aAlert|r") --Noxious Breath
Atroxus:AddSoundAlertOption(1226120, true, "|ccff41e3aAlert|r") --Poison Splash
Atroxus:AddSoundAlertOption(1262497, true, "|ccff41e3aAlert|r") --Monstrous Stomp
Atroxus:AddPrivateAuraAlertOption(1283506, true, "|ccff41e3aAirhorn|r") --Fixate
Atroxus:AddPrivateAuraAlertOption(1222484, true, "|ccff41e3aSpell Under You|r") --Poison Pool

function Atroxus:OnEncounterStart()
	self:EnableAlertSound(1222371, 46)
	self:EnableAlertSound(1263977, 54)
	self:EnableAlertSound(1226120, 55)
	self:EnableAlertSound(1262497, 297)
    self:EnablePrivateAuraSound(1283506)
    self:EnablePrivateAuraSound(1222484)

    if self:IsTank() then
	    self:EnableAlertSound(1222642, 47)
    end
end

--Charonus
local Charonus = SDKCrier:InitializeEncounterOptions(2793)
Charonus:AddSoundAlertOption(1227264, true, "|ccff41e3aAlert|r") --Cosmic Blast
Charonus:AddSoundAlertOption(1222758, true, "|ccff41e3aAlert|r") --Void Cascade
Charonus:AddSoundAlertOption(1263982, true, "|ccff41e3aAlert|r") --Gravity Orbs
Charonus:AddPrivateAuraAlertOption(1263983, true, "|ccff41e3aAirhorn|r") --Condensed Mass
Charonus:AddPrivateAuraAlertOption(1282770, true, "|ccff41e3aAirhorn|r") --Unstable Singularity debuff
Charonus:AddPrivateAuraAlertOption(1248130, true, "|ccff41e3aSpell Under You|r") --Unstable Singularity

function Charonus:OnEncounterStart()
	self:EnableAlertSound(1227264, 57)
	self:EnableAlertSound(1222758, 171)
	self:EnableAlertSound(1263982, 58)
    self:EnablePrivateAuraSound(1263983) -- Might not work
    self:EnablePrivateAuraSound(1282770)
    self:EnablePrivateAuraSound(1248130)
end