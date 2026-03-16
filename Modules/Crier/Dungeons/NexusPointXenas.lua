local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Chief Corewright Kasreth
local ChiefCorewrightKasreth = SDKCrier:InitializeEncounterOptions(2813)
ChiefCorewrightKasreth:AddSoundAlertOption(1257509, true, "|ccff41e3aAlert|r") --Corespark Detonation
ChiefCorewrightKasreth:AddSoundAlertOption(1251183, true, "|ccff41e3aAlert|r") --Leyline Array
ChiefCorewrightKasreth:AddSoundAlertOption(1264048, true, "|ccff41e3aAlert|r") --Flux Collapse
ChiefCorewrightKasreth:AddPrivateAuraAlertOption(1251785, true, "|ccff41e3aAirhorn|r") --Reflux Charge
ChiefCorewrightKasreth:AddPrivateAuraAlertOption(1264042, true, "|ccff41e3aSpell Under You|r") --Arcane Spill

function ChiefCorewrightKasreth:OnEncounterStart()
	self:EnableAlertSound(1257509, 106)
	self:EnableAlertSound(1251183, 108)
	self:EnableAlertSound(1264048, 172)
	self:EnablePrivateAuraSound(1251785)
	self:EnablePrivateAuraSound(1264042)
end

--Corewarden Nysarra
local CorewardenNysarra = SDKCrier:InitializeEncounterOptions(2814)
CorewardenNysarra:AddSoundAlertOption(1264439, true, "|ccff41e3aAlert|r") --Lightscar Flare
CorewardenNysarra:AddSoundAlertOption(1247937, true, "|ccff41e3aMeow|r") --Umbral Lash
CorewardenNysarra:AddSoundAlertOption(1252703, true, "|ccff41e3aAlert|r") --Null Vanguard
CorewardenNysarra:AddSoundAlertOption(1271684, true, "|ccff41e3aAlert|r") --Devour the Unworthy
CorewardenNysarra:AddPrivateAuraAlertOption(1249020, true, "|ccff41e3aAirhorn|r") --Eclipsing Step
CorewardenNysarra:AddPrivateAuraAlertOption(1282678, true, "|ccff41e3aAirhorn|r") --Flailstorm

function CorewardenNysarra:OnEncounterStart()
	self:EnableAlertSound(1264439, 34)
	self:EnableAlertSound(1252703, 36)
	self:EnableAlertSound(1271684, 37)
	self:EnablePrivateAuraSound(1249020)
	self:EnablePrivateAuraSound(1282678)

    if self:IsTank() then
	    self:EnableAlertSound(1247937, 35)
    end
end

--Lothraxion
local Lothraxion = SDKCrier:InitializeEncounterOptions(2815)
Lothraxion:AddSoundAlertOption(1255503, true, "|ccff41e3aAlert|r") --Brilliant Dispersion
Lothraxion:AddSoundAlertOption(1257567, true, "|ccff41e3aAlert|r") --Divine Guile
Lothraxion:AddSoundAlertOption(1255335, true, "|ccff41e3aMeow|r") --Searing Rend
Lothraxion:AddSoundAlertOption(1255531, true, "|ccff41e3aAlert|r") --Flicker
Lothraxion:AddPrivateAuraAlertOption(1255503, true, "|ccff41e3aAirhorn|r") --Brilliant Dispersion
Lothraxion:AddPrivateAuraAlertOption(1255310, true, "|ccff41e3aSpell Under You|r") --Radiant Scar

function Lothraxion:OnEncounterStart()
	self:EnableAlertSound(1255503, 109)
	self:EnableAlertSound(1257567, 110)
	self:EnableAlertSound(1255531, 112)
	self:EnablePrivateAuraSound(1255503)
	self:EnablePrivateAuraSound(1255310)

    if self:IsTank() then
	    self:EnableAlertSound(1255335, 111)
    end
end