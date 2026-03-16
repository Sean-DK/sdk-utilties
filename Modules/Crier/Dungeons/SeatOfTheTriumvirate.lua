local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Zuraal
local Zuraal = SDKCrier:InitializeEncounterOptions(1979)
Zuraal:AddSoundAlertOption(1268916, true, "|ccff41e3aAlert|r") --Null Palm
Zuraal:AddSoundAlertOption(1263399, true, "|ccff41e3aAlert|r") --Oozing Slam
Zuraal:AddSoundAlertOption(1263440, true, "|ccff41e3aAlert|r") --Void Slash
Zuraal:AddSoundAlertOption(1263304, true, "|ccff41e3aAlert|r") --Crashing Void
Zuraal:AddPrivateAuraAlertOption(244588, true, "|ccff41e3aSpell Under You|r") --Void Sludge

function Zuraal:OnEncounterStart()
	self:EnableAlertSound(1268916, 223)
	self:EnableAlertSound(1263399, 225)
	self:EnableAlertSound(1263440, 226)
	self:EnableAlertSound(1263304, 238)
    self:EnablePrivateAuraSound(244588)
end

--Saprish
local Saprish = SDKCrier:InitializeEncounterOptions(1980)
Saprish:AddSoundAlertOption(247175, true, "|ccff41e3aAlert|r") --Void Bomb
Saprish:AddSoundAlertOption(248831, true, "|ccff41e3aAlert|r") --Dread Screech
Saprish:AddSoundAlertOption(1263523, true, "|ccff41e3aAlert|r") --Overload
Saprish:AddPrivateAuraAlertOption(1280064, true, "|ccff41e3aAirhorn|r") --Phase Dash
Saprish:AddPrivateAuraAlertOption(245742, true, "|ccff41e3aAirhorn|r") --Shadow Pounce

function Saprish:OnEncounterStart()
	self:EnableAlertSound(247175, 234)
	self:EnableAlertSound(248831, 236)
	self:EnableAlertSound(1263523, 243)
    self:EnablePrivateAuraSound(1280064)
    self:EnablePrivateAuraSound(245742)
end

--Viceroy Nezhar
local ViceroyNezhar = SDKCrier:InitializeEncounterOptions(1981)
ViceroyNezhar:AddSoundAlertOption(1263538, true, "|ccff41e3aAlert|r") --Umbral Tentacles
ViceroyNezhar:AddSoundAlertOption(1263528, true, "|ccff41e3aAlert|r") --Repulse
ViceroyNezhar:AddSoundAlertOption(1277358, true, "|ccff41e3aAlert|r") --Gates of the Abyss
ViceroyNezhar:AddPrivateAuraAlertOption(1263542, false, "|ccff41e3aAirhorn|r") --Mass Void Infusion
ViceroyNezhar:AddPrivateAuraAlertOption(1263532, true, "|ccff41e3aSpell Under You|r") --Void Storm

function ViceroyNezhar:OnEncounterStart()
	self:EnableAlertSound(1263538, 246)
	self:EnableAlertSound(1263528, 247)
	self:EnableAlertSound(1277358, 376)
    self:EnablePrivateAuraSound(1263542)
    self:EnablePrivateAuraSound(1263532)
end

--L'ura
local Lura = SDKCrier:InitializeEncounterOptions(1982)
Lura:AddSoundAlertOption(1265419, true, "|ccff41e3aAlert|r") --Notes of Despair
Lura:AddSoundAlertOption(1265421, true, "|ccff41e3aAlert|r") --Dirge of Despair
Lura:AddSoundAlertOption(1264196, true, "|ccff41e3aAlert|r") --Disintegrate
Lura:AddSoundAlertOption(1265689, true, "|ccff41e3aAlert|r") --Grim Chorus
Lura:AddSoundAlertOption(1265426, true, "|ccff41e3aAlert|r") --Symphony of the Eternal Night
Lura:AddSoundAlertOption(1266001, true, "|ccff41e3aAlert|r") --Backlash
Lura:AddPrivateAuraAlertOption(1265426, true, "|ccff41e3aAirhorn|r")

function Lura:OnEncounterStart()
	self:EnableAlertSound(1265419, 248)
	self:EnableAlertSound(1265421, 249)
	self:EnableAlertSound(1264196, 251)
	self:EnableAlertSound(1265689, 252)
	self:EnableAlertSound(1265426, 250)
	self:EnableAlertSound(1266001, 254)
    self:EnablePrivateAuraSound(1265426)
end