local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Hoardmonger
local Hoardmonger = SDKCrier:InitializeEncounterOptions(2776)
Hoardmonger:AddSoundAlertOption(1234233, true, "|ccff41e3aAlert|r") --Spoiled Supplies
Hoardmonger:AddSoundAlertOption(1253268, true, "|ccff41e3aAlert|r") --Earthshatter Slam
Hoardmonger:AddSoundAlertOption(1235118, true, "|ccff41e3aAlert|r") --Ravenous Blow
Hoardmonger:AddPrivateAuraAlertOption(1235405, true, "|ccff41e3aAirhorn|r") --Bonespiked
Hoardmonger:AddPrivateAuraAlertOption(1234846, false, "|ccff41e3aAirhorn|r") --Toxic Spores

function Hoardmonger:OnEncounterStart()
	self:EnableAlertSound(1234233, 86)
	self:EnableAlertSound(1253268, 87)
	self:EnableAlertSound(1235118, 88)
	self:EnablePrivateAuraSound(1235405)
	self:EnablePrivateAuraSound(1234846)
end

--Sentinel of Winter
local SentinelOfWinter = SDKCrier:InitializeEncounterOptions(2777)
SentinelOfWinter:AddSoundAlertOption(1235548, true, "|ccff41e3aAlert|r") --Glacial Torment
SentinelOfWinter:AddSoundAlertOption(1235623, true, "|ccff41e3aAlert|r") --Raging Squall
SentinelOfWinter:AddSoundAlertOption(1235783, true, "|ccff41e3aAlert|r") --Shattering Frostspike
SentinelOfWinter:AddSoundAlertOption(1235656, true, "|ccff41e3aAlert|r") --Eternal Winter
SentinelOfWinter:AddPrivateAuraAlertOption(1235641, true, "|ccff41e3aAirhorn|r") --Raging Squall

function SentinelOfWinter:OnEncounterStart()
	self:EnableAlertSound(1235548, 67)
	self:EnableAlertSound(1235623, 68)
	self:EnableAlertSound(1235783, 69)
	self:EnableAlertSound(1235656, 70)
	self:EnablePrivateAuraSound(1235641)
end

--Nalorakk
local Nalorakk = SDKCrier:InitializeEncounterOptions(2778)
Nalorakk:AddSoundAlertOption(1255385, true, "|ccff41e3aAlert|r") --Forceful Roar
Nalorakk:AddSoundAlertOption(1243011, true, "|ccff41e3aAlert|r") --Fury of the War God
Nalorakk:AddSoundAlertOption(1243569, true, "|ccff41e3aMeow|r") --Overwhelming Onslaught
Nalorakk:AddPrivateAuraAlertOption(1242869, true, "|ccff41e3aAirhorn|r") --Echoing Maul
Nalorakk:AddPrivateAuraAlertOption(1261781, false, "|ccff41e3aAirhorn|r") --Defensive Stance

function Nalorakk:OnEncounterStart()
	self:EnableAlertSound(1255385, 89)
	self:EnableAlertSound(1243011, 91)
	self:EnablePrivateAuraSound(1242869)
    self:EnablePrivateAuraSound(1261781)

    if self:IsTank() then
        self:EnableAlertSound(1243569, 92)
    end
end