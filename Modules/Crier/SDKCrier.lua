local _, private = ...
local Addon = private.addon
local LSM = LibStub("LibSharedMedia-3.0")
local SDKUtil = private:GetPrototype("SDKUtil")

local SDKCrier = private:GetPrototype("SDKCrier")
local mt = { __index = SDKCrier }

local function GetCountdownSounds()
    local all = LSM:HashTable("sound")
    return {
        ["None"]    = all["None"],
        ["|ccff41e3a3-2-1|r"]   = all["|ccff41e3a3-2-1|r"],
        ["|ccff41e3a5-4-3-2-1|r"] = all["|ccff41e3a5-4-3-2-1|r"],
    }
end

function SDKCrier:InitializeOptions()
    for _, encounter in ipairs(SDKCrier.Encounters) do
        if not encounter.Loaded then
            local encounterName, _, _, _, _, journalInstanceId, encounterId, instanceId = EJ_GetEncounterInfo(encounter.JournalEncounterId)
	        local instanceName, instanceDescription, bgImage, buttonImage, loreImage, bg2, _, _, _, _, _, isRaid = EJ_GetInstanceInfo(journalInstanceId)

            encounter.EncounterName = encounterName
            encounter.JournalInstanceId = journalInstanceId
            encounter.EncounterId = encounterId
            encounter.InstanceName = instanceName
            encounter.InstanceId = instanceId
            encounter.IsRaid = isRaid

            local parentGroup = isRaid and SDKUtil.Options.args.Crier.args.Raids or SDKUtil.Options.args.Crier.args.Dungeons
            local instanceKey = "Instance_" .. tostring(instanceId)
            local encounterKey = "Encounter_" .. tostring(encounterId)

            if not parentGroup.args[instanceKey] then
                parentGroup.args[instanceKey] = {
                    type = "group",
                    name = instanceName or instanceKey,
                    order = SDKUtil.OptionOrder,
                    args = {
                        Header = {
                            type = "header",
                            name = instanceName,
                            order = 1,
                        },
                        Image = {
                            type = "description",
                            name = "",
                            image = bg2,
                            imageWidth = 256,
                            imageHeight = 128,
                            order = 2,
                            width = "full",
                        },
                        Description = {
                            type = "description",
                            name = instanceDescription,
                            order = 3,
                            fontSize = "large",
                            width = "full",
                        },
                    },
                }
                SDKUtil.OptionOrder = SDKUtil.OptionOrder + 1
            end

            local instanceArgs = parentGroup.args[instanceKey].args
            if not instanceArgs[encounterKey] then
                instanceArgs[encounterKey] = {
                    type = "group",
                    name = encounterName or encounterKey,
                    order = SDKUtil.OptionOrder,
                    args = {},
                }
                SDKUtil.OptionOrder = SDKUtil.OptionOrder + 1
            end

            local spellcastGroupArgs = {}
            local privateAuraGroupArgs = {}
            local encounterArgs = instanceArgs[encounterKey].args
            for key, value in pairs(encounter.DefaultOptions) do
                SDKUtil.DefaultOptions.profile[key] = value
                if not key:match("_Sound$") and not key:match("_Countdown$") and key ~= "Enabled" and not encounterArgs[key] then
                    if key:match("^SoundAlertOption_") then
                        local spellId = key:match("^SoundAlertOption_(%d+)$")
                        local numericSpellId = tonumber(spellId)
                        if not numericSpellId then
                            SDKUtil:Debug("SDKCrier:InitializeOptions: could not parse spellId from key: " .. key)
                        else
                            local spellInfo = C_Spell.GetSpellInfo(numericSpellId)
                            spellcastGroupArgs[key] = {
                                type = "group",
                                name = "",
                                inline = true,
                                order = SDKUtil.OptionOrder,
                                args = {
                                    Name = {
                                        type = "description",
                                        name = spellInfo.name,
                                        order = 1,
                                        image = spellInfo.iconID,
                                        imageWidth = 32,
                                        imageHeight = 32,
                                        fontSize = "large",
                                    },
                                    Description = {
                                        type = "description",
                                        name = function() return C_Spell.GetSpellDescription(numericSpellId) or "" end,
                                        order = 2,
                                        fontSize = "medium",
                                    },
                                    Enabled = {
                                        type = "toggle",
                                        name = "Enable",
                                        order = 3,
                                        width = "half",
                                        get = function() return SDKUtil:GetOption(key) end,
                                        set = function(_, v) return SDKUtil:SetOption(key, v) end,
                                    },
                                    Sound = {
                                        type = "select",
                                        name = "Sound",
                                        order = 4,
                                        values = function() return LSM:HashTable("sound") end,
                                        dialogControl = "LSM30_Sound",
                                        get = function() return SDKUtil:GetOption(key .. "_Sound") end,
                                        set = function(_, v) return SDKUtil:SetOption(key .. "_Sound", v) end,
                                    },
                                    Countdown = {
                                        type = "select",
                                        name = "Countdown",
                                        order = 5,
                                        values = GetCountdownSounds,
                                        dialogControl = "LSM30_Sound",
                                        get = function() return SDKUtil:GetOption(key .. "_Countdown") end,
                                        set = function(_, v) return SDKUtil:SetOption(key .. "_Countdown", v) end,
                                    },
                                    Divider = {
                                        type = "header",
                                        name = "",
                                        order = 6,
                                    },
                                },
                            }
                            SDKUtil.OptionOrder = SDKUtil.OptionOrder + 1
                        end
                    elseif key:match("^PrivateAuraSoundAlert_") then
                        local spellId = key:match("^PrivateAuraSoundAlert_(%d+)$")
                        local numericSpellId = tonumber(spellId)
                        if not numericSpellId then
                            SDKUtil:Debug("SDKCrier:InitializeOptions: could not parse spellId from key: " .. key)
                        else
                            local spellInfo = C_Spell.GetSpellInfo(numericSpellId)
                            privateAuraGroupArgs[key] = {
                                type = "group",
                                name = "",
                                inline = true,
                                order = SDKUtil.OptionOrder,
                                args = {
                                    Name = {
                                        type = "description",
                                        name = spellInfo.name,
                                        order = 1,
                                        image = spellInfo.iconID,
                                        imageWidth = 32,
                                        imageHeight = 32,
                                        fontSize = "large",
                                    },
                                    Description = {
                                        type = "description",
                                        name = function() return C_Spell.GetSpellDescription(numericSpellId) or "" end,
                                        order = 2,
                                        fontSize = "medium",
                                    },
                                    Enabled = {
                                        type = "toggle",
                                        name = "Enable",
                                        order = 3,
                                        width = "half",
                                        get = function() return SDKUtil:GetOption(key) end,
                                        set = function(_, v) return SDKUtil:SetOption(key, v) end,
                                    },
                                    Sound = {
                                        type = "select",
                                        name = "Sound",
                                        order = 4,
                                        values = function() return LSM:HashTable("sound") end,
                                        dialogControl = "LSM30_Sound",
                                        get = function() return SDKUtil:GetOption(key .. "_Sound") end,
                                        set = function(_, v) return SDKUtil:SetOption(key .. "_Sound", v) end,
                                    },
                                    Divider = {
                                        type = "header",
                                        name = "",
                                        order = 6,
                                    },
                                },
                            }
                            SDKUtil.OptionOrder = SDKUtil.OptionOrder + 1
                        end
                    end
                end
            end

            if next(spellcastGroupArgs) then
                encounterArgs["Spellcasts"] = {
                    type = "group",
                    name = "Abilities",
                    order = 1,
                    inline = true,
                    args = spellcastGroupArgs,
                }
            end

            if next(privateAuraGroupArgs) then
                encounterArgs["PrivateAuras"] = {
                    type = "group",
                    name = "Private Auras",
                    order = 2,
                    inline = true,
                    args = privateAuraGroupArgs,
                }
            end

            encounter.Loaded = true
        end
    end

    SDKUtil.Data:RegisterDefaults(SDKUtil.DefaultOptions)
    LibStub("AceConfigRegistry-3.0"):NotifyChange("SDKUtil")
end

function SDKCrier:RegisterEncounters()
    for _, encounter in ipairs(SDKCrier.Encounters or {}) do
        local id = encounter.InstanceId
        if id then
            SDKUtil.ZoneRegistry[id] = SDKUtil.ZoneRegistry[id] or {}
            table.insert(SDKUtil.ZoneRegistry[id], encounter)
        end
    end

    Addon:RegisterEvent("ZONE_CHANGED_NEW_AREA", function()
        SDKUtil:OnZoneChanged()
    end)

    SDKUtil:OnZoneChanged()
end

function SDKCrier:InitializeEncounterOptions(journalEncounterId)
    SDKCrier.Encounters = SDKCrier.Encounters or {}
    local encounter = setmetatable({
        Options = {
            Enabled = true,
        },
        DefaultOptions = {
            Enabled = true,
        },
        Loaded = false,
        Hooked = false,
        JournalEncounterId = journalEncounterId,
    }, mt)
    table.insert(SDKCrier.Encounters, encounter)
    return encounter
end

function SDKCrier:AddSoundAlertOption(spellId, default, defaultSound)
    self.DefaultOptions["SoundAlertOption_" .. spellId] = (default == nil) or default
    self.DefaultOptions["SoundAlertOption_" .. spellId .. "_Sound"] = defaultSound
    self.DefaultOptions["SoundAlertOption_" .. spellId .. "_Countdown"] = "None"
    self.Options["SoundAlertOption_" .. spellId] = default
    self.Options["SoundAlertOption_" .. spellId .. "_Sound"] = defaultSound or "|ccff41e3aAlert|r"
    self.Options["SoundAlertOption_" .. spellId .. "_Countdown"] = "None"
end

function SDKCrier:AddPrivateAuraAlertOption(spellId, default, defaultSound)
    self.DefaultOptions["PrivateAuraSoundAlert_" .. spellId] = (default == nil) or default
    self.DefaultOptions["PrivateAuraSoundAlert_" .. spellId .. "_Sound"] = defaultSound
    self.Options["PrivateAuraSoundAlert_" .. spellId] = default
    self.Options["PrivateAuraSoundAlert_" .. spellId .. "_Sound"] = defaultSound or "|ccff41e3aAirhorn|r"
end

function SDKCrier:RegisterEvents()
    if self.Hooked then return end
    SDKUtil:Debug("SDKCrier:RegisterEvents: registering encounter", self.EncounterId)

    self.Frame = self.Frame or CreateFrame("Frame")
    self.Frame:RegisterEvent("ENCOUNTER_START")
    self.Frame:RegisterEvent("ENCOUNTER_END")
    self.Frame:SetScript("OnEvent", function(_, event, encounterId)
        if encounterId == self.EncounterId then
            if event == "ENCOUNTER_START" then self:OnEncounterStart()
            elseif event == "ENCOUNTER_END" then 
                Addon:ClearTimelineEvents() --TextAlert.lua
                self:ClearPrivateAuraSounds()
                self:ClearEventSounds() 
            end
        end
    end)
    
    self.Hooked = true
end

function SDKCrier:UnregisterEvents()
    if not self.Hooked then return end
    SDKUtil:Debug("SDKCrier:UnregisterEvents: unregistering encounter", self.EncounterId)
    if self.Frame then
        self.Frame:UnregisterEvent("ENCOUNTER_START")
        self.Frame:UnregisterEvent("ENCOUNTER_END")
    end
    self.Hooked = false
end

function SDKCrier:EnableAlertSound(spellId, eventId, overrideType)
    self.RegisteredEvents = self.RegisteredEvents or {}

    local key = "SoundAlertOption_" .. spellId
    if not self.Options[key] then return end
    if not SDKUtil:GetOption("Crier_Enabled") then return end
    if self.IsRaid and not SDKUtil:GetOption("Crier_RaidsEnabled") then return end
    if not self.IsRaid and not SDKUtil:GetOption("Crier_DungeonsEnabled") then return end

    SDKUtil:Debug("SDKCrier:EnableAlertSounds: registering event", eventId)

    local soundName = SDKUtil:GetOption(key .. "_Sound")
    if not soundName then
        SDKUtil:Debug("SDKCrier:EnableAlertSounds: no sound configured for", key)
        return
    end

    local soundPath = LSM:Fetch("sound", soundName)
    if not soundPath then
        SDKUtil:Debug("SDKCrier:EnableAlertSounds: sound file not found in LSM (", soundPath, ")")
        return
    end

    local channel = SDKUtil:GetOption("Crier_OutputChannel") or "Master"
    overrideType = overrideType or 1

    C_EncounterEvents.SetEventSound(eventId, overrideType, { file = soundPath, channel = channel, volume = 1 })

    if overrideType ~= 2 then
        local countdownName = SDKUtil:GetOption(key .. "_Countdown")
        local countdownPath = countdownName and LSM:Fetch("sound", countdownName)
        if countdownName ~= "None" and countdownPath then
            C_EncounterEvents.SetEventSound(eventId, 2, { file = countdownPath, channel = channel, volume = 1 })
        end
    end

    self.RegisteredEvents[eventId] = true
end

function SDKCrier:EnablePrivateAuraSound(spellId)
    self.PrivateAuraSounds = self.PrivateAuraSounds or {}

    local key = "PrivateAuraSoundAlert_" .. spellId
    if not self.Options[key] then return end
    if not SDKUtil:GetOption("Crier_Enabled") then return end
    if self.IsRaid and not SDKUtil:GetOption("Crier_RaidsEnabled") then return end
    if not self.IsRaid and not SDKUtil:GetOption("Crier_DungeonsEnabled") then return end

    if not C_UnitAuras.AuraIsPrivate(spellId) then
		SDKUtil:Debug("Attempting to register private aura sound for spell ID " .. spellId .. " which is not a private aura. This sound will not be registered.")
		return
	end

    local soundName = SDKUtil:GetOption(key .. "_Sound")
    if not soundName then
        SDKUtil:Debug("SDKCrier:EnableAlertSounds: no sound configured for", key)
        return
    end

    local soundPath = LSM:Fetch("sound", soundName)
    if not soundPath then
        SDKUtil:Debug("SDKCrier:EnableAlertSounds: sound file not found in LSM (", soundPath, ")")
        return
    end

    local channel = SDKUtil:GetOption("Crier_OutputChannel") or "Master"

    if type(soundPath) == "number" then
        self.PrivateAuraSounds[#self.PrivateAuraSounds + 1] = C_UnitAuras.AddPrivateAuraAppliedSound({
            spellID = spellId,
            unitToken = "player",
            soundFileID = soundPath,
            outputChannel = channel,
        })
    else
        self.PrivateAuraSounds[#self.PrivateAuraSounds + 1] = C_UnitAuras.AddPrivateAuraAppliedSound({
            spellID = spellId,
            unitToken = "player",
            soundFileName = soundPath,
            outputChannel = channel,
        })
    end
end

function SDKCrier:ClearEventSounds()
    if self.RegisteredEvents then
        for eventId, _ in pairs(self.RegisteredEvents) do
            SDKUtil:Debug("SDKCrier:ClearEventSounds: clearing event", eventId)
            C_EncounterEvents.SetEventSound(eventId, 0, nil)
            C_EncounterEvents.SetEventSound(eventId, 1, nil)
            C_EncounterEvents.SetEventSound(eventId, 2, nil)
        end
        self.RegisteredEvents = nil
    end

    self.Hooked = false
end

function SDKCrier:ClearPrivateAuraSounds()
    if self.PrivateAuraSounds then
		for _, id in next, self.PrivateAuraSounds do
			C_UnitAuras.RemovePrivateAuraAppliedSound(id)
		end
		self.PrivateAuraSounds = nil
	end
end

function SDKCrier:IsTank()
    local specIndex = GetSpecialization()
    if not specIndex then return false end
    local _, _, _, _, role = GetSpecializationInfo(specIndex)
    return role == "TANK"
end