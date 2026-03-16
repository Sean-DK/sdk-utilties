local _, private = ...
local SDKCrier = private:GetPrototype("SDKCrier")

--Forgemaster Garfrost
local ForgemasterGarfrost = SDKCrier:InitializeEncounterOptions(608)
ForgemasterGarfrost:AddSoundAlertOption(1261546, true, "|ccff41e3aAlert|r") --Orebreaker
ForgemasterGarfrost:AddSoundAlertOption(1261847, true, "|ccff41e3aAlert|r") --Cryostomp
ForgemasterGarfrost:AddSoundAlertOption(1262029, true, "|ccff41e3aAlert|r") --Glacial Overload
ForgemasterGarfrost:AddPrivateAuraAlertOption(1261286, true, "|ccff41e3aAirhorn|r") --Throw Saronite
ForgemasterGarfrost:AddPrivateAuraAlertOption(1261799, true, "|ccff41e3aSpell Under You|r") --Glacial Overload

function ForgemasterGarfrost:OnEncounterStart()
	self:EnableAlertSound(1261546, 144)
	self:EnableAlertSound(1261847, 145)
	self:EnableAlertSound(1262029, 147)
    self:EnablePrivateAuraSound(1261286)
    self:EnablePrivateAuraSound(1261799)
end

--Ick & Krick
local Ick = SDKCrier:InitializeEncounterOptions(609)
Ick:AddSoundAlertOption(1264027, true, "|ccff41e3aAlert|r") --Shade Shift
Ick:AddSoundAlertOption(1264336, true, "|ccff41e3aAlert|r") --Plague Explosion
Ick:AddSoundAlertOption(1264287, true, "|ccff41e3aMeow|r") --Blight Smash
Ick:AddPrivateAuraAlertOption(1264453, true, "|ccff41e3aAirhorn|r") --Lumbering Fixation
Ick:AddPrivateAuraAlertOption(1264299, true, "|ccff41e3aSpell Under You|r") --Blight

function Ick:OnEncounterStart()
	self:EnableAlertSound(1264027, 204)
	self:EnableAlertSound(1264336, 205)
    self:EnablePrivateAuraSound(1264453)
    self:EnablePrivateAuraSound(1264299)

    if self:IsTank() then
	    self:EnableAlertSound(1264287, 206)
    end
end

--Scourgelord Tyrannus
local ScourgelordTyrannus = SDKCrier:InitializeEncounterOptions(610)
ScourgelordTyrannus:AddSoundAlertOption(1262582, true, "|ccff41e3aAlert|r") --Scourgelord's Brand
ScourgelordTyrannus:AddSoundAlertOption(1263406, true, "|ccff41e3aAlert|r") --Army of the Dead
ScourgelordTyrannus:AddSoundAlertOption(1263756, true, "|ccff41e3aAlert|r") --Death's Grasp
ScourgelordTyrannus:AddSoundAlertOption(1276948, false, "|ccff41e3aAlert|r") --Icy Barrage
ScourgelordTyrannus:AddPrivateAuraAlertOption(1262772, true, "|ccff41e3aAirhorn|r") --Rime Blast

function ScourgelordTyrannus:OnEncounterStart()
	self:EnableAlertSound(1262582, 164)
	self:EnableAlertSound(1263406, 165)
	self:EnableAlertSound(1263756, 168)
	self:EnableAlertSound(1276948, 375)
    self:EnablePrivateAuraSound(1262772)
end