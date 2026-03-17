local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Chimaerus
local Chimaerus = SDKCrier:InitializeEncounterOptions(2795)
Chimaerus:AddSoundAlertOption(1245404, true, "|ccff41e3aAlert|r") --Ravenous Dive
Chimaerus:AddSoundAlertOption(1251021, true, "|ccff41e3aAlert|r") --Rift Emergence
Chimaerus:AddSoundAlertOption(1246621, true, "|ccff41e3aAlert|r") --Caustic Phlegm
Chimaerus:AddSoundAlertOption(1272726, true, "|ccff41e3aAlert|r") --Rending Tear
Chimaerus:AddSoundAlertOption(1245452, true, "|ccff41e3aAlert|r") --Corrupted Devastation
Chimaerus:AddSoundAlertOption(1257087, true, "|ccff41e3aAlert|r") --Consuming Miasma
Chimaerus:AddSoundAlertOption(1262289, true, "|ccff41e3aAlert|r") --Alndust Upheaval
Chimaerus:AddSoundAlertOption(1260088, true, "|ccff41e3aAlert|r") --Rift Cataclysm
Chimaerus:AddSoundAlertOption(1264780, true, "|ccff41e3aAlert|r") --Rift Madness
Chimaerus:AddSoundAlertOption(1245396, true, "|ccff41e3aAlert|r") --Consume
Chimaerus:AddPrivateAuraAlertOption(1272726, true, "|ccff41e3aSpell On You|r") --Rending Tear
Chimaerus:AddPrivateAuraAlertOption(1257087, true, "|ccff41e3aSpell On You|r") --Consuming Miasma
Chimaerus:AddPrivateAuraAlertOption(1245698, true, "|ccff41e3aSpell On You|r") --Alnsight
Chimaerus:AddPrivateAuraAlertOption(1264756, true, "|ccff41e3aSpell On You|r") --Rift Madness
Chimaerus:AddPrivateAuraAlertOption(1258192, true, "|ccff41e3aSpell On You|r") --Lingering Miasma
Chimaerus:AddPrivateAuraAlertOption(1265940, true, "|ccff41e3aSpell On You|r") --Fearsome Cry
Chimaerus:AddPrivateAuraAlertOption(1250953, true, "|ccff41e3aSpell On You|r") --Rift Sickness

function Chimaerus:OnEncounterStart()
	self:EnableAlertSound(1245404, 48)
	self:EnableAlertSound(1251021, 49)
	self:EnableAlertSound(1246621, 50)
	self:EnableAlertSound(1272726, 51)
	self:EnableAlertSound(1245452, 53)
	self:EnableAlertSound(1245452, 458)
	self:EnableAlertSound(1257087, 119)
	self:EnableAlertSound(1262289, 149)
	self:EnableAlertSound(1262289, 431)
	self:EnableAlertSound(1260088, 170)
	self:EnableAlertSound(1264780, 217)
	self:EnableAlertSound(1245396, 307)
	self:EnablePrivateAuraSound(1272726)
	self:EnablePrivateAuraSound(1257087)
	self:EnablePrivateAuraSound(1245698)
	self:EnablePrivateAuraSound(1264756)
	self:EnablePrivateAuraSound(1258192)
	self:EnablePrivateAuraSound(1265940)
	self:EnablePrivateAuraSound(1250953)
end