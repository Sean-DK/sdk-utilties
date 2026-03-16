local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Vexamus
local Vexamus = SDKCrier:InitializeEncounterOptions(2509)
Vexamus:AddSoundAlertOption(385974, true, "|ccff41e3aAlert|r") --Arcane Orbs
Vexamus:AddSoundAlertOption(386173, true, "|ccff41e3aAlert|r") --Mana Bombs
Vexamus:AddSoundAlertOption(385958, true, "|ccff41e3aMeow|r") --Arcane Expulsion
Vexamus:AddSoundAlertOption(388537, true, "|ccff41e3aAlert|r") --Arcane Fissure

function Vexamus:OnEncounterStart()
	self:EnableAlertSound(385974, 274)
	self:EnableAlertSound(386173, 275)
	self:EnableAlertSound(388537, 277)

    if self:IsTank() then
	    self:EnableAlertSound(385958, 276)
    end
end

--Overgrown Ancient
local OvergrownAncient = SDKCrier:InitializeEncounterOptions(2512)
OvergrownAncient:AddSoundAlertOption(388796, true, "|ccff41e3aAlert|r") --Germinate
OvergrownAncient:AddSoundAlertOption(388923, true, "|ccff41e3aAlert|r") --Burst Forth
OvergrownAncient:AddSoundAlertOption(388623, true, "|ccff41e3aAlert|r") --Branch Out
OvergrownAncient:AddSoundAlertOption(388544, true, "|ccff41e3aMeow|r") --Barkbreaker

function OvergrownAncient:OnEncounterStart()
	self:EnableAlertSound(388796, 284)
	self:EnableAlertSound(388923, 285)
	self:EnableAlertSound(388623, 283)

    if self:IsTank() then
        self:EnableAlertSound(388544, 282)
    end
end

--Crawth
local Crawth = SDKCrier:InitializeEncounterOptions(2495)
Crawth:AddSoundAlertOption(376997, true, "|ccff41e3aMeow|r") --Savage Peck
Crawth:AddSoundAlertOption(377004, true, "|ccff41e3aAlert|r") --Deafening Screech
Crawth:AddSoundAlertOption(377034, true, "|ccff41e3aAlert|r") --Overpowering Gust
Crawth:AddSoundAlertOption(377182, true, "|ccff41e3aAlert|r") --Play Ball

function Crawth:OnEncounterStart()
	self:EnableAlertSound(377004, 279)
	self:EnableAlertSound(377034, 280)
	self:EnableAlertSound(377182, 397)

    if self:IsTank() then
	    self:EnableAlertSound(376997, 278)
    end
end

--Echo of Doragosa
local EchoOfDoragosa = SDKCrier:InitializeEncounterOptions(2514)
EchoOfDoragosa:AddSoundAlertOption(1282251, true, "|ccff41e3aMeow|r") --Astral Blast
EchoOfDoragosa:AddSoundAlertOption(374341, true, "|ccff41e3aAlert|r") --Energy Bomb
EchoOfDoragosa:AddSoundAlertOption(388820, true, "|ccff41e3aAlert|r") --Power Vacuum
EchoOfDoragosa:AddPrivateAuraAlertOption(389007, true, "|ccff41e3aSpell Under You|r") --Wild Energy
EchoOfDoragosa:AddPrivateAuraAlertOption(389011, false, "|ccff41e3aAirhorn|r") --Overwhelming Power

function EchoOfDoragosa:OnEncounterStart()
	self:EnableAlertSound(374341, 295)
	self:EnableAlertSound(388820, 296)
    self:EnablePrivateAuraSound(389007)
    self:EnablePrivateAuraSound(389011)
    
    if self:IsTank() then
	    self:EnableAlertSound(1282251, 294)
    end
end