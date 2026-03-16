local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Arcanotron Custos
local ArcanotronCustos = SDKCrier:InitializeEncounterOptions(2659)
ArcanotronCustos:AddSoundAlertOption(474345, true, "|ccff41e3aAlert|r") --Refueling Protocol
ArcanotronCustos:AddSoundAlertOption(474496, true, "|ccff41e3aMeow|r") --Repulsing Slam
ArcanotronCustos:AddSoundAlertOption(1214081, true, "|ccff41e3aAlert|r") --Arcane Expulsion
ArcanotronCustos:AddPrivateAuraAlertOption(1214089, true, "|ccff41e3aSpell Under You|r") --Arcane Residue
ArcanotronCustos:AddPrivateAuraAlertOption(1214038, true, "|ccff41e3aAirhorn|r") --Ethereal Shackles

function ArcanotronCustos:OnEncounterStart()
	self:EnableAlertSound(474345, 281)
	self:EnableAlertSound(1214081, 288)
    self:EnablePrivateAuraSound(1214089)
    self:EnablePrivateAuraSound(1214038)

    if self:IsTank() then
	    self:EnableAlertSound(474496, 286)
    end
end

--Seranel Sunlash
local SeranelSunlash = SDKCrier:InitializeEncounterOptions(2661)
SeranelSunlash:AddSoundAlertOption(1224903, true, "|ccff41e3aAlert|r") --Suppression Zone
SeranelSunlash:AddSoundAlertOption(1248689, false, "|ccff41e3aAlert|r") --Hastening Ward
SeranelSunlash:AddSoundAlertOption(1225193, true, "|ccff41e3aAlert|r") --Wave of Silence
SeranelSunlash:AddPrivateAuraAlertOption(1225787, true, "|ccff41e3aAirhorn|r") --Runic Mark

function SeranelSunlash:OnEncounterStart()
	self:EnableAlertSound(1224903, 93)
	self:EnableAlertSound(1248689, 94)
	self:EnableAlertSound(1225193, 96)
    self:EnablePrivateAuraSound(1225787)
end

--Gemellus
local Gemellus = SDKCrier:InitializeEncounterOptions(2660)
Gemellus:AddSoundAlertOption(1223847, true, "|ccff41e3aInfo|r") --Triplicate
Gemellus:AddPrivateAuraAlertOption(1223958, true, "|ccff41e3aAirhorn|r") --Cosmic Sting TODO: does this work?
Gemellus:AddPrivateAuraAlertOption(1224104, true, "|ccff41e3aSpell Under You|r") --Void Secretions
Gemellus:AddPrivateAuraAlertOption(1253709, true, "|ccff41e3aAirhorn|r") --Neural Link

function Gemellus:OnEncounterStart()
	self:EnableAlertSound(1223847, 635)
    self:EnablePrivateAuraSound(1223958) --TODO: does this work?
    self:EnablePrivateAuraSound(1224104)
    self:EnablePrivateAuraSound(1253709)
end

--Degentrius
local Degentrius = SDKCrier:InitializeEncounterOptions(2662)
Degentrius:AddSoundAlertOption(1215087, true, "|ccff41e3aAlert|r") --Unstable Void Essence
Degentrius:AddSoundAlertOption(1280113, true, "|ccff41e3aMeow|r") --Hulking Fragment
Degentrius:AddPrivateAuraAlertOption(1215897, true, "|ccff41e3aAirhorn|r") --Devouring Entropy

function Degentrius:OnEncounterStart()
	self:EnableAlertSound(1215087, 292)
    self:EnablePrivateAuraSound(1215897)

    if self:IsTank() then
	    self:EnableAlertSound(1280113, 420)
    end
end