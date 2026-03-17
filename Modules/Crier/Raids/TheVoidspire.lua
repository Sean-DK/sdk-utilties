local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Imperator Averzian
local ImperatorAverzian = SDKCrier:InitializeEncounterOptions(2733)
ImperatorAverzian:AddSoundAlertOption(1262776, true, "|ccff41e3aAlert|r") --Shadow's Advance
ImperatorAverzian:AddSoundAlertOption(1249251, true, "|ccff41e3aAlert|r") --Dark Upheaval
ImperatorAverzian:AddSoundAlertOption(1249265, true, "|ccff41e3aAlert|r") --Umbral Collapse
ImperatorAverzian:AddSoundAlertOption(1260712, true, "|ccff41e3aAlert|r") --Oblivion's Wrath
ImperatorAverzian:AddSoundAlertOption(1258880, true, "|ccff41e3aAlert|r") --Void Fall
ImperatorAverzian:AddSoundAlertOption(1280023, false, "|ccff41e3aAlert|r") --Void Mark
ImperatorAverzian:AddPrivateAuraAlertOption(1249265, true, "|ccff41e3aAirhorn|r") --Umbral Collapse
ImperatorAverzian:AddPrivateAuraAlertOption(1280023, true, "|ccff41e3aAirhorn|r") --Void Marked
ImperatorAverzian:AddPrivateAuraAlertOption(1283069, true, "|ccff41e3aAirhorn|r") --Weakened
ImperatorAverzian:AddPrivateAuraAlertOption(1275059, true, "|ccff41e3aAirhorn|r") --Black Miasma

function ImperatorAverzian:OnEncounterStart()
	self:EnableAlertSound(1262776, 194)
	self:EnableAlertSound(1262776, 195)
	self:EnableAlertSound(1249251, 196)
	self:EnableAlertSound(1249265, 197)
	self:EnableAlertSound(1260712, 198)
	self:EnableAlertSound(1258880, 199)
	self:EnableAlertSound(1258880, 209)
	self:EnableAlertSound(1280023, 419)
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
Vorasius:AddPrivateAuraAlertOption(1243270, true, "|ccff41e3aSpell Under You|r") --Dark Goo
Vorasius:AddPrivateAuraAlertOption(1241844, false, "|ccff41e3aAirhorn|r") --Smashed
Vorasius:AddPrivateAuraAlertOption(1272527, false, "|ccff41e3aAirhorn|r") --Creep Spit
Vorasius:AddPrivateAuraAlertOption(1259186, true, "|ccff41e3aAirhorn|r") --Blisterburst

function Vorasius:OnEncounterStart()
	self:EnableAlertSound(1241836, 59)
	self:EnableAlertSound(1241836, 60)
	self:EnableAlertSound(1243853, 61)
	self:EnableAlertSound(1254199, 62)
	self:EnableAlertSound(1260046, 133)
	self:EnablePrivateAuraSound(1243270)
	self:EnablePrivateAuraSound(1241844)
	self:EnablePrivateAuraSound(1272527)
	self:EnablePrivateAuraSound(1259186)
end

--Fallen-King Shalhadaar
local Shalhadaar = SDKCrier:InitializeEncounterOptions(2736)
Shalhadaar:AddSoundAlertOption(1243453, true, "|ccff41e3aAlert|r") --Void Convergence
Shalhadaar:AddSoundAlertOption(1248697, true, "|ccff41e3aAlert|r") --Despotic Command
Shalhadaar:AddSoundAlertOption(1254081, true, "|ccff41e3aAlert|r") --Fractured Projection
Shalhadaar:AddSoundAlertOption(1253024, true, "|ccff41e3aAlert|r") --Shattering Twilight
Shalhadaar:AddSoundAlertOption(1250686, true, "|ccff41e3aAlert|r") --Twilight Obscurity
Shalhadaar:AddSoundAlertOption(1246175, true, "|ccff41e3aAlert|r") --Entropic Unraveling
Shalhadaar:AddPrivateAuraAlertOption(1250828, true, "|ccff41e3aSpell Under You|r") --Void Exposure
Shalhadaar:AddPrivateAuraAlertOption(1248697, true, "|ccff41e3aAirhorn|r") --Despotic Command
Shalhadaar:AddPrivateAuraAlertOption(1245592, true, "|ccff41e3aSpell Under You|r") --Torturous Extract
Shalhadaar:AddPrivateAuraAlertOption(1253024, true, "|ccff41e3aAirhorn|r") --Shattering Twilight
Shalhadaar:AddPrivateAuraAlertOption(1251213, true, "|ccff41e3aSpell Under You|r") --Twilight Spikes
Shalhadaar:AddPrivateAuraAlertOption(1250991, true, "|ccff41e3aSpell On You|r") --Dark Radiation

function Shalhadaar:OnEncounterStart()
	self:EnableAlertSound(1243453, 139)
	self:EnableAlertSound(1248697, 140)
	self:EnableAlertSound(1254081, 141)
	self:EnableAlertSound(1253024, 142)
	self:EnableAlertSound(1250686, 143)
	self:EnableAlertSound(1246175, 148)
	self:EnablePrivateAuraSound(1250828)
	self:EnablePrivateAuraSound(1248697)
	self:EnablePrivateAuraSound(1245592)
	self:EnablePrivateAuraSound(1253024)
	self:EnablePrivateAuraSound(1251213)
	self:EnablePrivateAuraSound(1250991)
end

--Vaelgor and Ezzorak
local VaelgorAndEzzorak = SDKCrier:InitializeEncounterOptions(2735)
VaelgorAndEzzorak:AddSoundAlertOption(1262623, true, "|ccff41e3aAlert|r") --Null Beam
VaelgorAndEzzorak:AddSoundAlertOption(1244917, true, "|ccff41e3aAlert|r") --Void Howl
VaelgorAndEzzorak:AddSoundAlertOption(1245391, true, "|ccff41e3aAlert|r") --Gloom
VaelgorAndEzzorak:AddSoundAlertOption(1244221, true, "|ccff41e3aAlert|r") --Dread Breath
VaelgorAndEzzorak:AddSoundAlertOption(1249748, true, "|ccff41e3aAlert|r") --Midnight Flames
VaelgorAndEzzorak:AddSoundAlertOption(1280458, true, "|ccff41e3aAlert|r") --Grappling Maw
VaelgorAndEzzorak:AddSoundAlertOption(1245645, true, "|ccff41e3aAlert|r") --Rakfang
VaelgorAndEzzorak:AddSoundAlertOption(1265131, true, "|ccff41e3aAlert|r") --Vaelwing
VaelgorAndEzzorak:AddSoundAlertOption(1277470, true, "|ccff41e3aAlert|r") --Cosmosis Gloom
VaelgorAndEzzorak:AddSoundAlertOption(1277471, true, "|ccff41e3aAlert|r") --Cosmosis Null Beam
VaelgorAndEzzorak:AddSoundAlertOption(1277472, true, "|ccff41e3aAlert|r") --Cosmosis Dread Breath
VaelgorAndEzzorak:AddSoundAlertOption(1277473, true, "|ccff41e3aAlert|r") --Cosmosis Void Howl
VaelgorAndEzzorak:AddSoundAlertOption(1248847, true, "|ccff41e3aAlert|r") --Radiant Barrier
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1262999, true, "|ccff41e3aAirhorn|r") --Null Beam
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1244672, true, "|ccff41e3aSpell Under You|r") --Null Zone
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1252157, true, "|ccff41e3aAirhorn|r") --Null Implosion
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1245554, true, "|ccff41e3aAirhorn|r") --Gloomtouched
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1270852, false, "|ccff41e3aAirhorn|r") --Diminish
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1245421, true, "|ccff41e3aSpell Under You|r") --Gloomfield
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1255612, true, "|ccff41e3aAirhorn|r") --Dread Breath Target
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1255979, true, "|ccff41e3aAirhorn|r") --Dread Breath debuff
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1265152, true, "|ccff41e3aAirhorn|r") --Impale
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1248865, true, "|ccff41e3aAirhorn|r") --Radiant Barrier
VaelgorAndEzzorak:AddPrivateAuraAlertOption(1270497, true, "|ccff41e3aAirhorn|r") --Shadowmark

function VaelgorAndEzzorak:OnEncounterStart()
    self:EnableAlertSound(1262623, 101)
    self:EnableAlertSound(1244917, 102)
    self:EnableAlertSound(1245391, 103)
    self:EnableAlertSound(1244221, 104)
    self:EnableAlertSound(1249748, 105)
    self:EnableAlertSound(1277470, 377)
    self:EnableAlertSound(1277471, 378)
    self:EnableAlertSound(1277472, 379)
    self:EnableAlertSound(1277473, 380)
    self:EnableAlertSound(1248847, 381)
	self:EnablePrivateAuraSound(1262999)
	self:EnablePrivateAuraSound(1244672)
	self:EnablePrivateAuraSound(1252157)
	self:EnablePrivateAuraSound(1245554)
	self:EnablePrivateAuraSound(1270852)
	self:EnablePrivateAuraSound(1245421)
	self:EnablePrivateAuraSound(1255612)
	self:EnablePrivateAuraSound(1255979)
	self:EnablePrivateAuraSound(1265152)
	self:EnablePrivateAuraSound(1248865)
	self:EnablePrivateAuraSound(1270497)

    if self:IsTank() then
        self:EnableAlertSound(1280458, 219)
        self:EnableAlertSound(1245645, 220)
        self:EnableAlertSound(1265131, 221)
    end
end

--Lightblinded Vanguard
local LightblindedVanguard = SDKCrier:InitializeEncounterOptions(2737)
LightblindedVanguard:AddSoundAlertOption(1248451, true, "|ccff41e3aAlert|r") --Aura of Peace
LightblindedVanguard:AddSoundAlertOption(1249260, true, "|ccff41e3aAlert|r") --Sacred Shield
LightblindedVanguard:AddSoundAlertOption(1248721, true, "|ccff41e3aAlert|r") --Tyr's Wrath
LightblindedVanguard:AddSoundAlertOption(1246162, true, "|ccff41e3aAlert|r") --Aura of Devotion
LightblindedVanguard:AddSoundAlertOption(1255738, true, "|ccff41e3aAlert|r") --Searing Radiance
LightblindedVanguard:AddSoundAlertOption(1251857, true, "|ccff41e3aAlert|r") --Judgement Shield
LightblindedVanguard:AddSoundAlertOption(1246487, true, "|ccff41e3aAlert|r") --Avenger's Shield
LightblindedVanguard:AddSoundAlertOption(1248652, true, "|ccff41e3aAlert|r") --Divine Toll
LightblindedVanguard:AddSoundAlertOption(1248449, true, "|ccff41e3aAlert|r") --Aura of Wrath
LightblindedVanguard:AddSoundAlertOption(1246736, true, "|ccff41e3aAlert|r") --Final Judgement
LightblindedVanguard:AddSoundAlertOption(1246765, true, "|ccff41e3aAlert|r") --Divine Storm
LightblindedVanguard:AddSoundAlertOption(1246749, true, "|ccff41e3aAlert|r") --Sacred Toll
LightblindedVanguard:AddSoundAlertOption(1276368, true, "|ccff41e3aAlert|r") --Execution Sentence
LightblindedVanguard:AddSoundAlertOption(1276243, true, "|ccff41e3aAlert|r") --Zealous Spirit
LightblindedVanguard:AddPrivateAuraAlertOption(1276982, true, "|ccff41e3aSpell Under You|r") --Divine Consecration
LightblindedVanguard:AddPrivateAuraAlertOption(1246158, true, "|ccff41e3aSpell Under You|r") --Consecration
LightblindedVanguard:AddPrivateAuraAlertOption(1248721, true, "|ccff41e3aAirhorn|r") --Tyr's Wrath
LightblindedVanguard:AddPrivateAuraAlertOption(1251857, true, "|ccff41e3aAirhorn|r") --Judgement (Shield of the Righteous)
LightblindedVanguard:AddPrivateAuraAlertOption(1246487, true, "|ccff41e3aAirhorn|r") --Avenger's Shield
LightblindedVanguard:AddPrivateAuraAlertOption(1246502, false, "|ccff41e3aAirhorn|r") --Avenger's Shield DoT
LightblindedVanguard:AddPrivateAuraAlertOption(1248652, true, "|ccff41e3aAirhorn|r") --Divine Toll
LightblindedVanguard:AddPrivateAuraAlertOption(1246736, true, "|ccff41e3aAirhorn|r") --Judgement (Final Verdict)
LightblindedVanguard:AddPrivateAuraAlertOption(1248985, true, "|ccff41e3aAirhorn|r") --Execution Sentence target
LightblindedVanguard:AddPrivateAuraAlertOption(1249008, false, "|ccff41e3aAirhorn|r") --Execution Sentence debuff
LightblindedVanguard:AddPrivateAuraAlertOption(1272324, true, "|ccff41e3aSpell Under You|r") --Divine Tempest

function LightblindedVanguard:OnEncounterStart()
    self:EnableAlertSound(1248451, 71)
    self:EnableAlertSound(1249260, 74)
    self:EnableAlertSound(1248721, 75)
    self:EnableAlertSound(1246162, 76)
    self:EnableAlertSound(1255738, 77)
    self:EnableAlertSound(1255738, 373)
    self:EnableAlertSound(1251857, 78)
    self:EnableAlertSound(1246487, 79)
    self:EnableAlertSound(1246487, 365)
    self:EnableAlertSound(1248652, 80)
    self:EnableAlertSound(1248449, 81)
    self:EnableAlertSound(1246736, 82)
    self:EnableAlertSound(1246765, 83)
    self:EnableAlertSound(1246765, 374)
    self:EnableAlertSound(1246749, 84)
    self:EnableAlertSound(1276368, 85)
    self:EnableAlertSound(1276243, 358)
    self:EnableAlertSound(1276243, 359)
    self:EnableAlertSound(1276243, 360)
	self:EnablePrivateAuraSound(1276982)
	self:EnablePrivateAuraSound(1246158)
	self:EnablePrivateAuraSound(1248721)
	self:EnablePrivateAuraSound(1251857)
	self:EnablePrivateAuraSound(1246487)
	self:EnablePrivateAuraSound(1246502)
	self:EnablePrivateAuraSound(1248652)
	self:EnablePrivateAuraSound(1246736)
	self:EnablePrivateAuraSound(1248985)
	self:EnablePrivateAuraSound(1249008)
	self:EnablePrivateAuraSound(1272324)

    if self:IsTank() then
        self:EnableAlertSound(1251857, 78)
        self:EnableAlertSound(1246736, 82)
    end
end

--Crown of the Cosmos
local CrownOfTheCosmos = SDKCrier:InitializeEncounterOptions(2738)
CrownOfTheCosmos:AddSoundAlertOption(1233865, true, "|ccff41e3aAlert|r") --Null Corona
CrownOfTheCosmos:AddSoundAlertOption(1283236, true, "|ccff41e3aAlert|r") --Void Expulsion
CrownOfTheCosmos:AddSoundAlertOption(1233602, true, "|ccff41e3aAlert|r") --Silverstrike Arrow
CrownOfTheCosmos:AddSoundAlertOption(1234564, true, "|ccff41e3aAlert|r") --Silverstrike Barrage
CrownOfTheCosmos:AddSoundAlertOption(1235622, true, "|ccff41e3aAlert|r") --Singularity Eruption
CrownOfTheCosmos:AddSoundAlertOption(1237035, true, "|ccff41e3aAlert|r") --Voidstalker Sting
CrownOfTheCosmos:AddSoundAlertOption(1237837, true, "|ccff41e3aAlert|r") --Call of the Void
CrownOfTheCosmos:AddSoundAlertOption(1237614, true, "|ccff41e3aAlert|r") --Ranger Captain's Mark
CrownOfTheCosmos:AddSoundAlertOption(1246918, true, "|ccff41e3aAlert|r") --Cosmic Barrier
CrownOfTheCosmos:AddSoundAlertOption(1239111, true, "|ccff41e3aAlert|r") --Aspect of the End
CrownOfTheCosmos:AddSoundAlertOption(1232470, true, "|ccff41e3aAlert|r") --Grasp of Emptiness
CrownOfTheCosmos:AddSoundAlertOption(1238843, true, "|ccff41e3aAlert|r") --Devouring Cosmos
CrownOfTheCosmos:AddSoundAlertOption(1261016, true, "|ccff41e3aAlert|r") --Rift Simulacrum
CrownOfTheCosmos:AddSoundAlertOption(1243754, true, "|ccff41e3aAlert|r") --Cosmic Portal
CrownOfTheCosmos:AddSoundAlertOption(1246461, true, "|ccff41e3aAlert|r") --Rift Slash
CrownOfTheCosmos:AddPrivateAuraAlertOption(1233865, true, "|ccff41e3aAirhorn|r") --Null Corona
CrownOfTheCosmos:AddPrivateAuraAlertOption(1283236, true, "|ccff41e3aAirhorn|r") --Void Expulsion
CrownOfTheCosmos:AddPrivateAuraAlertOption(1242553, true, "|ccff41e3aSpell Under You|r") --Void Remnants
CrownOfTheCosmos:AddPrivateAuraAlertOption(1233602, true, "|ccff41e3aAirhorn|r") --Silverstrike Arrow
CrownOfTheCosmos:AddPrivateAuraAlertOption(1243981, true, "|ccff41e3aAirhorn|r") --Silverstrike Barrage
CrownOfTheCosmos:AddPrivateAuraAlertOption(1238206, true, "|ccff41e3aSpell Under You|r") --Volatile Fissure
CrownOfTheCosmos:AddPrivateAuraAlertOption(1237623, true, "|ccff41e3aAirhorn|r") --Ranger Captain's Mark
CrownOfTheCosmos:AddPrivateAuraAlertOption(1239111, true, "|ccff41e3aAirhorn|r") --Aspect of the End
CrownOfTheCosmos:AddPrivateAuraAlertOption(1255453, false, "|ccff41e3aAirhorn|r") --Gravity Collapse
CrownOfTheCosmos:AddPrivateAuraAlertOption(1232470, true, "|ccff41e3aAirhorn|r") --Grasp of Emptiness
CrownOfTheCosmos:AddPrivateAuraAlertOption(1243753, true, "|ccff41e3aAirhorn|r") --Ravenous Abyss
CrownOfTheCosmos:AddPrivateAuraAlertOption(1238708, true, "|ccff41e3aAirhorn|r") --Dark Rush

function CrownOfTheCosmos:OnEncounterStart()
    self:EnableAlertSound(1233865, 4)
    self:EnableAlertSound(1283236, 5)
    self:EnableAlertSound(1233602, 6)
    self:EnableAlertSound(1234564, 7)
    self:EnableAlertSound(1235622, 8)
    self:EnableAlertSound(1237035, 9)
    self:EnableAlertSound(1237837, 10)
    self:EnableAlertSound(1237614, 11)
    self:EnableAlertSound(1237614, 131)
    self:EnableAlertSound(1246918, 12)
    self:EnableAlertSound(1239111, 13)
    self:EnableAlertSound(1232470, 14)
    self:EnableAlertSound(1232470, 132)
    self:EnableAlertSound(1238843, 15)
    self:EnableAlertSound(1261016, 135)
    self:EnableAlertSound(1243754, 136)
	self:EnablePrivateAuraSound(1233865)
	self:EnablePrivateAuraSound(1283236)
	self:EnablePrivateAuraSound(1242553)
	self:EnablePrivateAuraSound(1233602)
	self:EnablePrivateAuraSound(1243981)
	self:EnablePrivateAuraSound(1238206)
	self:EnablePrivateAuraSound(1237623)
	self:EnablePrivateAuraSound(1239111)
	self:EnablePrivateAuraSound(1255453)
	self:EnablePrivateAuraSound(1232470)
	self:EnablePrivateAuraSound(1243753)
	self:EnablePrivateAuraSound(1238708)

    if self:IsTank() then
        self:EnableAlertSound(1246461, 137)
    end
    
	SDKUtil:Warn("This module is untested and may have issues.")
end