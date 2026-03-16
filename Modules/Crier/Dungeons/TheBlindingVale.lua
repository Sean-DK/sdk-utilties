local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Lightblossom Trinity
local LightblossomTrinity = SDKCrier:InitializeEncounterOptions(2769)
LightblossomTrinity:AddSoundAlertOption(1234753, true, "|ccff41e3aMeow|r") --Bedrock Slam
LightblossomTrinity:AddSoundAlertOption(1234850, true, "|ccff41e3aAlert|r") --Lightsower Dash
LightblossomTrinity:AddSoundAlertOption(1235564, true, "|ccff41e3aAlert|r") --Lightblossom Beam
LightblossomTrinity:AddPrivateAuraAlertOption(1234802, true, "|ccff41e3aSpell Under You|r") --Fertile Loam
LightblossomTrinity:AddPrivateAuraAlertOption(1261276, true, "|ccff41e3aAirhorn|r") --Thornblade
LightblossomTrinity:AddPrivateAuraAlertOption(1235828, true, "|ccff41e3aSpell Under You|r") --Light-Scorched Earth

function LightblossomTrinity:OnEncounterStart()
	self:EnableAlertSound(1234850, 174)
	self:EnableAlertSound(1235564, 177)
    self:EnablePrivateAuraSound(1234802)
    self:EnablePrivateAuraSound(1261276)
    self:EnablePrivateAuraSound(1235828)

    if self:IsTank() then
	    self:EnableAlertSound(1234753, 173)
    end
end

--Ikuzz
local Ikuzz = SDKCrier:InitializeEncounterOptions(2770)
Ikuzz:AddSoundAlertOption(1236746, true, "|ccff41e3aAlert|r") --Verdant Stomp
Ikuzz:AddSoundAlertOption(1236709, true, "|ccff41e3aAlert|r") --Thorncaller Roar
Ikuzz:AddPrivateAuraAlertOption(1237091, true, "|ccff41e3aAirhorn|r") --Bloodthirsty Gaze
Ikuzz:AddPrivateAuraAlertOption(1272290, true, "|ccff41e3aAirhorn|r") --Crunched

function Ikuzz:OnEncounterStart()
	self:EnableAlertSound(1236746, 178)
	self:EnableAlertSound(1236709, 179)
    self:EnablePrivateAuraSound(1237091)
    self:EnablePrivateAuraSound(1272290)
end

--Lightwarden Ruia
local LightwardenRuia = SDKCrier:InitializeEncounterOptions(2771)
LightwardenRuia:AddSoundAlertOption(1240098, true, "|ccff41e3aAlert|r") --Lightfall
LightwardenRuia:AddSoundAlertOption(1241058, false, "|ccff41e3aAlert|r") --Grievous Thrash
LightwardenRuia:AddSoundAlertOption(1239885, true, "|ccff41e3aAlert|r") --Bear Form
LightwardenRuia:AddSoundAlertOption(1239882, true, "|ccff41e3aAlert|r") --Moonkin Form
LightwardenRuia:AddSoundAlertOption(1239883, true, "|ccff41e3aAlert|r") --Haranir Form
LightwardenRuia:AddSoundAlertOption(1241067, true, "|ccff41e3aAlert|r") --Spirits of the Vale
LightwardenRuia:AddPrivateAuraAlertOption(1239825, true, "|ccff41e3aAirhorn|r") --Lightfire
LightwardenRuia:AddPrivateAuraAlertOption(1240222, true, "|ccff41e3aAirhorn|r") --Pulverizing Strikes

function LightwardenRuia:OnEncounterStart()
	self:EnableAlertSound(1240098, 182)
	self:EnableAlertSound(1241058, 184)
	self:EnableAlertSound(1239885, 185)
	self:EnableAlertSound(1239882, 186)
	self:EnableAlertSound(1239883, 187)
	self:EnableAlertSound(1241067, 188, 0)
    self:EnablePrivateAuraSound(1239825)
    self:EnablePrivateAuraSound(1240222)
end

--Ziekket
local Ziekket = SDKCrier:InitializeEncounterOptions(2772)
Ziekket:AddSoundAlertOption(1246372, true, "|ccff41e3aAlert|r") --Awaken the Lightbloom
Ziekket:AddSoundAlertOption(1247685, false, "|ccff41e3aMeow|r") --Thornspike
Ziekket:AddSoundAlertOption(1246858, true, "|ccff41e3aAlert|r") --Lightbloom's Essence
Ziekket:AddPrivateAuraAlertOption(1253690, true, "|ccff41e3aAirhorn|r") --Concentrated Lightbeam fixate
Ziekket:AddPrivateAuraAlertOption(1246751, true, "|ccff41e3aSpell Under You|r") --Concentrated Lightbeam
Ziekket:AddPrivateAuraAlertOption(1246753, true, "|ccff41e3aSpell Under You|r") --Lightsap

function Ziekket:OnEncounterStart()
	self:EnableAlertSound(1246372, 189)
	self:EnableAlertSound(1246858, 192)
    self:EnablePrivateAuraSound(1253690)
    self:EnablePrivateAuraSound(1246751)
    self:EnablePrivateAuraSound(1246753)
    
    if self:IsTank() then
	    self:EnableAlertSound(1247685, 190)
    end
end