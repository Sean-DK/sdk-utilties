local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Ranjit
local Ranjit = SDKCrier:InitializeEncounterOptions(965)
Ranjit:AddSoundAlertOption(153757, true, "|ccff41e3aAlert|r") --Fan of Blades
Ranjit:AddSoundAlertOption(1258148, true, "|ccff41e3aAlert|r") --Wind Chakram
Ranjit:AddSoundAlertOption(156793, true, "|ccff41e3aAlert|r") --Chakram Vortex
Ranjit:AddPrivateAuraAlertOption(1252733, true, "|ccff41e3aAirhorn|r") --Gale Surge

function Ranjit:OnEncounterStart()
	self:EnableAlertSound(153757, 299)
	self:EnableAlertSound(1258148, 300)
	self:EnableAlertSound(156793, 301)
    self:EnablePrivateAuraSound(1252733)
end

--Araknath
local Araknath = SDKCrier:InitializeEncounterOptions(966)
Araknath:AddSoundAlertOption(154115, true, "|ccff41e3aAlert|r") --Fiery Smash
Araknath:AddSoundAlertOption(154162, true, "|ccff41e3aAlert|r") --Energize
Araknath:AddSoundAlertOption(154135, true, "|ccff41e3aAlert|r") --Supernova
Araknath:AddPrivateAuraAlertOption(154132, true, "|ccff41e3aAirhorn|r")

function Araknath:OnEncounterStart()
	self:EnableAlertSound(154115, 302)
	self:EnableAlertSound(154135, 304)
    self:EnablePrivateAuraSound(154132)

    if not self:IsTank() then
	    self:EnableAlertSound(154162, 303)
    end
end

--Rukhran
local Rukhran = SDKCrier:InitializeEncounterOptions(967)
Rukhran:AddSoundAlertOption(1253510, true, "|ccff41e3aAlert|r") --Sun Break
Rukhran:AddSoundAlertOption(1253519, true, "|ccff41e3aMeow|r") --Burning Claws
Rukhran:AddSoundAlertOption(1253527, true, "|ccff41e3aAlert|r") --Searing Quills
Rukhran:AddSoundAlertOption(1253511, false, "|ccff41e3aAlert|r") --Blaze of Glory
Rukhran:AddPrivateAuraAlertOption(1253511, true, "|ccff41e3aAirhorn|r") --Burning Pursuit

function Rukhran:OnEncounterStart()
	self:EnableAlertSound(1253510, 305)
	self:EnableAlertSound(1253527, 308)
	self:EnableAlertSound(1253511, 603)
    self:EnablePrivateAuraSound(1253511)

    if self:IsTank() then
	    self:EnableAlertSound(1253519, 306)
    end
end

--High Sage Viryx
local HighSageViryx = SDKCrier:InitializeEncounterOptions(968)
HighSageViryx:AddSoundAlertOption(1253998, true, "|ccff41e3aAlert|r") --Cast Down
HighSageViryx:AddSoundAlertOption(154396, true, "|ccff41e3aAlert|r") --Solar Blast
HighSageViryx:AddPrivateAuraAlertOption(1253541, true, "|ccff41e3aAirhorn|r") --Scorching Ray
HighSageViryx:AddPrivateAuraAlertOption(153954, true, "|ccff41e3aAirhorn|r") --Cast Down
HighSageViryx:AddPrivateAuraAlertOption(1253531, true, "|ccff41e3aAirhorn|r") --Lens Flare

function HighSageViryx:OnEncounterStart()
	self:EnableAlertSound(1253998, 310)
	self:EnableAlertSound(154396, 311)
    self:EnablePrivateAuraSound(1253541)
    self:EnablePrivateAuraSound(153954)
    self:EnablePrivateAuraSound(1253531)
end