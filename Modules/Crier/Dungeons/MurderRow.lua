local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Kystia Manaheart
local KystiaManaheart = SDKCrier:InitializeEncounterOptions(2679)
KystiaManaheart:AddSoundAlertOption(1264095, true, "|ccff41e3aAlert|r") --Mirror Images
KystiaManaheart:AddSoundAlertOption(1253813, true, "|ccff41e3aAlert|r") --Fel Spray
KystiaManaheart:AddSoundAlertOption(474240, true, "|ccff41e3aAlert|r") --Fel Nova
KystiaManaheart:AddSoundAlertOption(1230304, true, "|ccff41e3aAirhorn|r") --Light Infusion
KystiaManaheart:AddPrivateAuraAlertOption(1253813, true, "|ccff41e3aSpell Under You|r") --Fel Spray

function KystiaManaheart:OnEncounterStart()
	self:EnableAlertSound(1264095, 120)
	self:EnableAlertSound(1253813, 122)
	self:EnableAlertSound(474240, 202)
	self:EnableAlertSound(1230304, 610, 0)
	self:EnablePrivateAuraSound(1253813)
end

--Zaen Bladesorrow
local ZaenBladesorrow = SDKCrier:InitializeEncounterOptions(2680)
ZaenBladesorrow:AddSoundAlertOption(474765, true, "|ccff41e3aAlert|r") --Same Day Delivery
ZaenBladesorrow:AddSoundAlertOption(474478, true, "|ccff41e3aAlert|r") --Killing Spree
ZaenBladesorrow:AddSoundAlertOption(1222795, true, "|ccff41e3aAlert|r") --Envenom
ZaenBladesorrow:AddPrivateAuraAlertOption(474545, true, "|ccff41e3aAirhorn|r") --Murder in a Row
ZaenBladesorrow:AddPrivateAuraAlertOption(1214352, true, "|ccff41e3aAirhorn|r") --Fire Bomb

function ZaenBladesorrow:OnEncounterStart()
	self:EnableAlertSound(474765, 124)
	self:EnableAlertSound(474478, 127)
	self:EnableAlertSound(1222795, 193)
	self:EnablePrivateAuraSound(474545)
	self:EnablePrivateAuraSound(1214352)
end

--Xathuux
local Xathuux = SDKCrier:InitializeEncounterOptions(2681)
Xathuux:AddSoundAlertOption(473898, true, "|ccff41e3aMeow|r") --Legion Strike
Xathuux:AddSoundAlertOption(474197, true, "|ccff41e3aAlert|r") --Demonic Rage
Xathuux:AddSoundAlertOption(1214663, true, "|ccff41e3aAlert|r") --Axe Toss
Xathuux:AddPrivateAuraAlertOption(474234, true, "|ccff41e3aSpell Under You|r") --Burning Steps

function Xathuux:OnEncounterStart()
	self:EnableAlertSound(474197, 32)
	self:EnableAlertSound(1214663, 559)
	self:EnablePrivateAuraSound(474234)

    if self:IsTank() then
	    self:EnableAlertSound(473898, 30)
    end
end

--Lithiel Cinderfury
local LithielCinderfury = SDKCrier:InitializeEncounterOptions(2682)
LithielCinderfury:AddSoundAlertOption(1218203, true, "|ccff41e3aAlert|r") --Fingers of Gul'dan
LithielCinderfury:AddSoundAlertOption(474408, true, "|ccff41e3aAlert|r") --Summon Vilefiend
LithielCinderfury:AddSoundAlertOption(1224478, true, "|ccff41e3aAlert|r") --Malefic Wave

function LithielCinderfury:OnEncounterStart()
	self:EnableAlertSound(1218203, 37)
	self:EnableAlertSound(474408, 38)
	self:EnableAlertSound(1224478, 207)
end