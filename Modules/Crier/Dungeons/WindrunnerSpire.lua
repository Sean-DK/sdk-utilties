local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Emberdawn
local Emberdawn = SDKCrier:InitializeEncounterOptions(2655)
Emberdawn:AddSoundAlertOption(466064, true, "|ccff41e3aMeow|r") --Searing Beak
Emberdawn:AddSoundAlertOption(465904, true, "|ccff41e3aAlert|r") --Burning Gale
Emberdawn:AddPrivateAuraAlertOption(466559, true, "|ccff41e3aAirhorn|r") --Flaming Updraft
Emberdawn:AddPrivateAuraAlertOption(472118, true, "|ccff41e3aSpell Under You|r") --Ignited Embers

function Emberdawn:OnEncounterStart()
	self:EnableAlertSound(465904, 242)
    self:EnablePrivateAuraSound(466559)
    self:EnablePrivateAuraSound(472118)

    if self:IsTank() then
        self:EnableAlertSound(466064, 239)
    end
end

--Derelict Duo
local DerelictDuo = SDKCrier:InitializeEncounterOptions(2656)
DerelictDuo:AddSoundAlertOption(472888, true, "|ccff41e3aMeow|r") --Bone Hack
DerelictDuo:AddSoundAlertOption(472736, true, "|ccff41e3aAlert|r") --Debilitating Shriek
DerelictDuo:AddSoundAlertOption(474105, true, "|ccff41e3aAlert|r") --Curse of Darkness
DerelictDuo:AddPrivateAuraAlertOption(1253834, true, "|ccff41e3aAirhorn|r") --Curse of Darkness
DerelictDuo:AddPrivateAuraAlertOption(472793, true, "|ccff41e3aAirhorn|r") --Heaving Yank
DerelictDuo:AddPrivateAuraAlertOption(474129, true, "|ccff41e3aAirhorn|r") --Splattering Spew
DerelictDuo:AddPrivateAuraAlertOption(472777, true, "|ccff41e3aSpell Under You|r") --Gunk Splatter

function DerelictDuo:OnEncounterStart()
	self:EnableAlertSound(472736, 27)
    self:EnablePrivateAuraSound(1253834)
    self:EnablePrivateAuraSound(1215803)
    self:EnablePrivateAuraSound(472793)
    self:EnablePrivateAuraSound(474129)
    self:EnablePrivateAuraSound(472777)

    if self:IsTank() then
        self:EnableAlertSound(472888, 25)
    end
end

--Commander Kroluk
local CommanderKroluk = SDKCrier:InitializeEncounterOptions(2657)
CommanderKroluk:AddSoundAlertOption(467620, true, "|ccff41e3aMeow|r") --Rampage
CommanderKroluk:AddSoundAlertOption(1253026, true, "|ccff41e3aAlert|r") --Intimidating Shout
CommanderKroluk:AddSoundAlertOption(472043, true, "|ccff41e3aAlert|r") --Rallying Bellow
CommanderKroluk:AddPrivateAuraAlertOption(470966, true, "|ccff41e3aAirhorn|r") --Bladestorm fixate
CommanderKroluk:AddPrivateAuraAlertOption(468924, true, "|ccff41e3aSpell Under You|r") --Bladestorm
CommanderKroluk:AddPrivateAuraAlertOption(1283247, true, "|ccff41e3aAirhorn|r") --Reckless Leap

function CommanderKroluk:OnEncounterStart()
	self:EnableAlertSound(1253026, 211)
	self:EnableAlertSound(1253026, 213)
	self:EnableAlertSound(472043, 215)
    self:EnablePrivateAuraSound(470966)
    self:EnablePrivateAuraSound(468924)
    self:EnablePrivateAuraSound(1283247)
    
    if self:IsTank() then
        self:EnableAlertSound(467620, 210)
        self:EnableAlertSound(467620, 556)
    end
end

--The Restless Heart
local RestlessHeart = SDKCrier:InitializeEncounterOptions(2658)
RestlessHeart:AddSoundAlertOption(468429, true, "|ccff41e3aAlert|r") --Bullseye Windblast
RestlessHeart:AddSoundAlertOption(472556, true, "|ccff41e3aAlert|r") --Arrow Rain
RestlessHeart:AddSoundAlertOption(472662, true, "|ccff41e3aMeow|r") --Tempest Slash
RestlessHeart:AddPrivateAuraAlertOption(1282911, true, "|ccff41e3aAirhorn|r") --Bolt Gale
RestlessHeart:AddPrivateAuraAlertOption(1253979, true, "|ccff41e3aAirhorn|r") --Gust Shot
RestlessHeart:AddPrivateAuraAlertOption(472662, true, "|ccff41e3aAirhorn|r") --Tempest Slash
RestlessHeart:AddPrivateAuraAlertOption(1216042, true, "|ccff41e3aAirhorn|r") --Squall Leap

function RestlessHeart:OnEncounterStart()
	self:EnableAlertSound(468429, 21)
	self:EnableAlertSound(472556, 23)
    self:EnablePrivateAuraSound(1282911)
    self:EnablePrivateAuraSound(1253979)
    self:EnablePrivateAuraSound(472662)
    self:EnablePrivateAuraSound(1216042)
    
    if self:IsTank() then
        self:EnableAlertSound(472662, 24)
    end
end