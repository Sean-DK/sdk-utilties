local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Muro'jin and Nekraxx
local Murojin = SDKCrier:InitializeEncounterOptions(2810)
Murojin:AddSoundAlertOption(1266480, true, "|ccff41e3aMeow|r") --Flanking Spear
Murojin:AddSoundAlertOption(1243900, true, "|ccff41e3aAlert|r") --Fetid Quillstorm
Murojin:AddSoundAlertOption(1243741, true, "|ccff41e3aAlert|r") --Freezing Trap
Murojin:AddSoundAlertOption(1246666, false, "|ccff41e3aAlert|r") --Infected Pinions
Murojin:AddPrivateAuraAlertOption(1243741, false, "|ccff41e3aAirhorn|r") --Freezing Trap Stun
Murojin:AddPrivateAuraAlertOption(1260643, true, "|ccff41e3aAirhorn|r") --Barrage
Murojin:AddPrivateAuraAlertOption(1249478, true, "|ccff41e3aAirhorn|r") --Carrion Swoop

function Murojin:OnEncounterStart()
	self:EnableAlertSound(1243900, 151)
	self:EnableAlertSound(1243741, 152)
	self:EnableAlertSound(1246666, 154)
	self:EnablePrivateAuraSound(1243741)
	self:EnablePrivateAuraSound(1260643)
	self:EnablePrivateAuraSound(1249478)

    if self:IsTank() then
	    self:EnableAlertSound(1266480, 150)
    end
end

--Vordaza
local Vordaza = SDKCrier:InitializeEncounterOptions(2811)
Vordaza:AddSoundAlertOption(1251554, true, "|ccff41e3aMeow|r") --Drain Soul
Vordaza:AddSoundAlertOption(1252054, true, "|ccff41e3aAlert|r") --Unmake
Vordaza:AddSoundAlertOption(1251996, true, "|ccff41e3aAlert|r") --Death's Embrace
Vordaza:AddSoundAlertOption(1252130, true, "|ccff41e3aAlert|r") --Wrest Phantoms
Vordaza:AddSoundAlertOption(1250708, true, "|ccff41e3aAlert|r") --Necrotic Convergence
Vordaza:AddPrivateAuraAlertOption(1252130, true, "|ccff41e3aSpell Under You|r") --Unmake
Vordaza:AddPrivateAuraAlertOption(1251775, true, "|ccff41e3aAirhorn|r") --Final Pursuit

function Vordaza:OnEncounterStart()
	self:EnableAlertSound(1252054, 17)
	self:EnableAlertSound(1251996, 18)
	self:EnableAlertSound(1252130, 19)
	self:EnableAlertSound(1250708, 20)
	self:EnablePrivateAuraSound(1252130)
	self:EnablePrivateAuraSound(1251775)

    if self:IsTank() then
	    self:EnableAlertSound(1251554, 16)
    end
end

--Raktul
local Raktul = SDKCrier:InitializeEncounterOptions(2812)
Raktul:AddSoundAlertOption(1251023, true, "|ccff41e3aMeow|r") --Spiritbreaker
Raktul:AddSoundAlertOption(1253788, true, "|ccff41e3aLong|r") --Soulrending Roar
Raktul:AddPrivateAuraAlertOption(1252675, true, "|ccff41e3aAirhorn|r") --Crush Souls
Raktul:AddPrivateAuraAlertOption(1253779, true, "|ccff41e3aSpell Under You|r") --Spectral Decay

function Raktul:OnEncounterStart()
	self:EnableAlertSound(1253788, 158)
	self:EnablePrivateAuraSound(1252675)
	self:EnablePrivateAuraSound(1253779)

    if self:IsTank() then
	    self:EnableAlertSound(1251023, 156)
    end
end