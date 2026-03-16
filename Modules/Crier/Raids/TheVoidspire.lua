local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Imperator Averzian
local ImperatorAverzian = SDKCrier:InitializeEncounterOptions(2733)
ImperatorAverzian:AddSoundAlertOption(1262776, true, "|ccff41e3aAlert|r") --Shadow's Advance
ImperatorAverzian:AddSoundAlertOption(1249251, true, "|ccff41e3aAlert|r") --Dark Upheaval
ImperatorAverzian:AddSoundAlertOption(1260712, true, "|ccff41e3aAlert|r") --Oblivion's Wrath
ImperatorAverzian:AddSoundAlertOption(1258880, true, "|ccff41e3aAlert|r") --Void Fall
--ImperatorAverzian:AddSoundAlertOption(1260203, true, "|ccff41e3aAlert|r") --Umbral Collapse
ImperatorAverzian:AddSoundAlertOption(1255702, false, "|ccff41e3aAlert|r") --Pitch Bulwark
ImperatorAverzian:AddPrivateAuraAlertOption(1249265, true, "|ccff41e3aAirhorn|r") --Umbral Collapse
ImperatorAverzian:AddPrivateAuraAlertOption(1280023, true, "|ccff41e3aAirhorn|r") --Void Marked
ImperatorAverzian:AddPrivateAuraAlertOption(1283069, true, "|ccff41e3aAirhorn|r") --Weakened
ImperatorAverzian:AddPrivateAuraAlertOption(1275059, false, "|ccff41e3aAirhorn|r") --Black Miasma

function ImperatorAverzian:OnEncounterStart()
	self:EnableAlertSound(1262776, 194)
	self:EnableAlertSound(1262776, 195)
	self:EnableAlertSound(1249251, 196)
	self:EnableAlertSound(1260712, 198)
	self:EnableAlertSound(1258880, 199)
	self:EnableAlertSound(1258880, 209)
	self:EnableAlertSound(1255702, 201)
	self:EnablePrivateAuraSound(1249265)
	self:EnablePrivateAuraSound(1260203)
	self:EnablePrivateAuraSound(1280023)
	self:EnablePrivateAuraSound(1283069)
	self:EnablePrivateAuraSound(1275059)
end

--Vorasius
local Vorasius = SDKCrier:InitializeEncounterOptions(2734)
Vorasius:AddSoundAlertOption(1241836, true, "|ccff41e3aAlert|r") --Shadowclaw Slam
Vorasius:AddSoundAlertOption(1243853, true, "|ccff41e3aAlert|r") --Void Breath
Vorasius:AddSoundAlertOption(1254199, true, "|ccff41e3aAlert|r") --Parasite Expulsion
Vorasius:AddSoundAlertOption(1260046, true, "|ccff41e3aAlert|r") --Primordial Roar
Vorasius:AddSoundAlertOption(1254112, true, "|ccff41e3aAlert|r") --Fixate Parasite
Vorasius:AddPrivateAuraAlertOption(1243270, true, "|ccff41e3aSpell Under You|r") --Dark Goo
Vorasius:AddPrivateAuraAlertOption(1241844, true, "|ccff41e3aAirhorn|r") --Smashed
Vorasius:AddPrivateAuraAlertOption(1272527, true, "|ccff41e3aAirhorn|r") --Creep Spit
Vorasius:AddPrivateAuraAlertOption(1259186, false, "|ccff41e3aAirhorn|r") --Blisterburst

function Vorasius:OnEncounterStart()
	self:EnableAlertSound(1241836, 59)
	self:EnableAlertSound(1241836, 60)
	self:EnableAlertSound(1243853, 61)
	self:EnableAlertSound(1254199, 62)
	self:EnableAlertSound(1260046, 133)
	self:EnableAlertSound(1254112, 557)
	self:EnablePrivateAuraSound(1243270)
	self:EnablePrivateAuraSound(1241844)
	self:EnablePrivateAuraSound(1272527)
	self:EnablePrivateAuraSound(1259186)
end

--Fallen-King Shalhadaar
local Shalhadaar = SDKCrier:InitializeEncounterOptions(2736)

function Shalhadaar:OnEncounterStart()
end

--Vaelgor and Ezzorak
local VaelgorAndEzzorak = SDKCrier:InitializeEncounterOptions(2735)

function VaelgorAndEzzorak:OnEncounterStart()
end

--Lightblinded Vanguard
local LightblindedVanguard = SDKCrier:InitializeEncounterOptions(2737)

function LightblindedVanguard:OnEncounterStart()
end

--Crown of the Cosmos
local CrownOfTheCosmos = SDKCrier:InitializeEncounterOptions(2738)

function CrownOfTheCosmos:OnEncounterStart()
end