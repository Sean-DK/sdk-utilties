local _, private = ...
local LSM = LibStub("LibSharedMedia-3.0")
local SDKUtil = private:GetPrototype("SDKUtil")
local SDKCrier = private:GetPrototype("SDKCrier")
local icons = "Interface\\Addons\\SDKUtil\\Media\\Icons\\"

SDKUtil.OptionOrder = 1

local function CreateTestTimers()
    local testEvents = {
        { spellID = 1282251, duration = 8, name = "Test - Short" },
        { spellID = 374341,  duration = 12, name = "Test - Medium" },
        { spellID = 388820,  duration = 20, name = "Test - Long" },
    }

    for _, t in ipairs(testEvents) do
        local eventId = C_EncounterTimeline.AddScriptEvent({
            spellID          = t.spellID,
            iconFileID       = 0,
            duration         = t.duration,
            overrideName     = t.name,
            severity         = Enum.EncounterEventSeverity.Medium,
            icons            = Enum.EncounterEventIconmask.DeadlyEffect,
            paused           = false,
        })

        if eventId then
            SDKUtil:Debug("Test timer created with eventId", eventId)
        else
            SDKUtil:Debug("Failed to create test timer for spellID", t.spellID)
        end
    end
end

function SDKUtil:GetOption(path)
    local t = SDKUtil.Data.profile
    for segment in path:gmatch("[^%.]+") do
        t = t[segment]
        if t == nil then return nil end
    end
    return t
end

function SDKUtil:SetOption(path, value)
	SDKUtil:Debug("SDKUtil:SetOption:", path, "=", tostring(value));
    local t = SDKUtil.Data.profile
    local segments = {}
    for segment in path:gmatch("[^%.]+") do
        table.insert(segments, segment)
    end
    for i = 1, #segments - 1 do
        t = t[segments[i]]
    end
    t[segments[#segments]] = value
end

SDKUtil.Options = {
	type = "group",
	name = "SDKUtil",
	args = {
		Enabled = {
			type = "toggle",
			name = "Enable",
			order = 1,
			get = function() return SDKUtil:GetOption("Enabled") end,
			set = function(_, v) SDKUtil:SetOption("Enabled", v) end,
		},
        Admin = {
            type = "toggle",
            name = "Admin",
            order = 2,
            hidden = true,
            get = function() return SDKUtil:GetOption("Admin") end,
            set = function(_, v) SDKUtil:SetOption("Admin", v) end,
        },
		DebugMessages = {
			type = "toggle",
			name = "Debug Mode",
			order = 3,
			hidden = function() return not SDKUtil:GetOption("Admin") end,
			get = function() return SDKUtil:GetOption("DebugMessages") end,
			set = function(_, v) SDKUtil:SetOption("DebugMessages", v) end,
		},
		General = {
			type = "group",
			name = "General",
			order = 10,
			disabled = function() return not SDKUtil:GetOption("Enabled") end,
			args = {
                InfoMessages = {
                    type = "toggle",
                    name = "Info Messages",
                    order = 1,
                    get = function() return SDKUtil:GetOption("InfoMessages") end,
                    set = function(_, v) return SDKUtil:SetOption("InfoMessages", v) end,
                },
                WarnMessages = {
                    type = "toggle",
                    name = "Warning Messages",
                    order = 2,
                    get = function() return SDKUtil:GetOption("WarnMessages") end,
                    set = function(_, v) return SDKUtil:SetOption("WarnMessages", v) end,
                },
                CrierEnabled = {
                    type = "toggle",
                    name = "Enable Crier",
                    order = 3,
                    get = function() return SDKUtil:GetOption("Crier_Enabled") end,
                    set = function(_, v) SDKUtil:SetOption("Crier_Enabled", v) end,
                },
                FlourishEnabled = {
                    type = "toggle",
                    name = "Enable Flourish",
                    order = 3,
                    get = function() return SDKUtil:GetOption("Flourish_Enabled") end,
                    set = function(_, v) SDKUtil:SetOption("Flourish_Enabled", v) end,
                },
			},
		},
        Crier = {
            type = "group",
            name = "|T" .. icons .. "Crier.tga:16:16|t Crier",
            order = 20,
            disabled = function() return not SDKUtil:GetOption("Enabled") or not SDKUtil:GetOption("Crier_Enabled") end,
            args = {
                HeroImage = {
                    type = "description",
                    name = "Crier plays custom sound files during boss encounters in dungeons and raids to alert you of critical mechanics as they happen. Configure which sounds trigger on which events, and let Crier handle the rest so you can stay focused on the fight.",
                    image = icons .. "CrierBig",
                    imageWidth = 128,
                    imageHeight = 128,
                    order = 1,
                    fontSize = "large",
                },
                HeroDivider = {
                    type = "header",
                    name = "",
                    order = 2,
                },
                General = {
                    type = "group",
                    name = "Custom Sound Alerts",
                    order = 3,
                    inline = true,
                    args = {
                        DungeonsEnabled = {
                            type = "toggle",
                            name = "Enable in Dungeons",
                            order = 4,
                            get = function() return SDKUtil:GetOption("Crier_DungeonsEnabled") end,
                            set = function(_, v) return SDKUtil:SetOption("Crier_DungeonsEnabled", v) end,
                        },
                        RaidsEnabled = {
                            type = "toggle",
                            name = "Enable in Raids",
                            order = 5,
                            get = function() return SDKUtil:GetOption("Crier_RaidsEnabled") end,
                            set = function(_, v) return SDKUtil:SetOption("Crier_RaidsEnabled", v) end,
                        },
                        OutputChannel = {
                            type = "select",
                            name = "Output Channel",
                            order = 6,
                            values = {
                                Master = "Master",
                                SFX = "Sound Effects",
                                Music = "Music",
                                Ambience = "Ambience",
                                Dialog = "Dialog",
                            },
                            get = function() return SDKUtil:GetOption("Crier_OutputChannel") end,
                            set = function(_, v) return SDKUtil:SetOption("Crier_OutputChannel", v) end,
                        },
                    },
                },
                TextAlertOptions = {
                    type = "group",
                    name = "Text Reminders",
                    order = 4,
                    inline = true,
                    args = {
                        TextAlerts = {
                            type = "toggle",
                            name = "Enable Text Reminders",
                            order = 1,
                            get = function() return SDKUtil:GetOption("Crier_EnableTextAlerts") end,
                            set = function(_, v) return SDKUtil:SetOption("Crier_EnableTextAlerts", v) end,
                        },
                        Threshold = {
                            type = "range",
                            name = "Threshold Seconds",
                            order = 2,
                            min = 3, max = 30, step = 1,
                            get = function() return SDKUtil:GetOption("Crier_TextAlertsThreshold") end,
                            set = function(_, v) return SDKUtil:SetOption("Crier_TextAlertsThreshold", v) end,
                        },
                        Font = {
                            type = "select",
                            name = "Font",
                            order = 3,
                            dialogControl = "LSM30_Font",
                            values = LSM:HashTable("font"),
                            get = function() return SDKUtil:GetOption("Crier_TextAlertsFont") end,
                            set = function(_, v) return SDKUtil:SetOption("Crier_TextAlertsFont", v) end,
                        },
                        FontSize = {
                            type = "range",
                            name = "Font Size",
                            order = 4,
                            min = 8, max = 100, step = 1,
                            get = function() return SDKUtil:GetOption("Crier_TextAlertsFontSize") end,
                            set = function(_, v) return SDKUtil:SetOption("Crier_TextAlertsFontSize", v) end,
                        },
                        RunTest = {
                            type = "execute",
                            name = "Test",
                            order = 5,
                            func = CreateTestTimers,
                        }
                    },
                },
                PrivateAuras = {
                    type = "group",
                    name = "Private Auras",
                    order = 5,
                    inline = true,
                    args = {
                        Enable = {
                            type = "toggle",
                            name = "Enable Private Aura Tracking",
                            order = 1,
                            width = "full",
                            get = function() return SDKUtil:GetOption("Crier_PrivateAuraTracking") end,
                            set = function(_, v) return SDKUtil:SetOption("Crier_PrivateAuraTracking", v) end,
                        },
                        Tooltip = {
                            type = "toggle",
                            name = "Show Tooltip",
                            order = 2,
                            width = "full",
                            get = function() return SDKUtil:GetOption("Crier_PrivateAuraTracking_Tooltip") end,
                            set = function(_, v)
                                SDKUtil:SetOption("Crier_PrivateAuraTracking_Tooltip", v) 
                                SDKCrier:UpdatePrivateAuraConfig()
                            end,
                        },
                        AuraLimit = {
                            type = "range",
                            name = "Max Auras",
                            order = 3,
                            min = 1, max = 10, step = 1,
                            get = function() return SDKUtil:GetOption("Crier_PrivateAuraTracking_Limit") end,
                            set = function(_, v)
                                SDKUtil:SetOption("Crier_PrivateAuraTracking_Limit", v)
                                SDKCrier:UpdatePrivateAuraConfig()
                            end,
                        },
                        IconSize = {
                            type = "range",
                            name = "Icon Size",
                            order = 4,
                            min = 8, max = 128, step = 2,
                            get = function() return SDKUtil:GetOption("Crier_PrivateAuraTracking_IconSize") end,
                            set = function(_, v)
                                SDKUtil:SetOption("Crier_PrivateAuraTracking_IconSize", v)
                                SDKCrier:UpdatePrivateAuraConfig()
                            end,
                        },
                        XPos = {
                            type = "range",
                            name = "X Offset",
                            order = 5,
                            min = -1000, max = 1000, step = 10,
                            get = function() return SDKUtil:GetOption("Crier_PrivateAuraTracking_XPos") end,
                            set = function(_, v)
                                SDKUtil:SetOption("Crier_PrivateAuraTracking_XPos", v)
                                SDKCrier:UpdatePrivateAuraConfig()
                            end,
                        },
                        YPos = {
                            type = "range",
                            name = "Y Offset",
                            order = 6,
                            min = -1000, max = 1000, step = 10,
                            get = function() return SDKUtil:GetOption("Crier_PrivateAuraTracking_YPos") end,
                            set = function(_, v)
                                SDKUtil:SetOption("Crier_PrivateAuraTracking_YPos", v)
                                SDKCrier:UpdatePrivateAuraConfig()
                            end,
                        },
                    },
                },
                Dungeons = {
                    type = "group",
                    name = "Dungeons",
                    order = 7,
                    disabled = function() return not SDKUtil:GetOption("Enabled") or not SDKUtil:GetOption("Crier_Enabled") or not SDKUtil:GetOption("Crier_DungeonsEnabled") end,
                    args = {
                        Description = {
                            type = "description",
                            name = "Select a dungeon to customize alert settings",
                            fontSize = "large",
                        },
                    },
                },
                Raids = {
                    type = "group",
                    name = "Raids",
                    order = 8,
                    disabled = function() return not SDKUtil:GetOption("Enabled") or not SDKUtil:GetOption("Crier_Enabled") or not SDKUtil:GetOption("Crier_RaidsEnabled") end,
                    args = {
                        Description = {
                            type = "description",
                            name = "Select a raid to customize alert settings",
                            fontSize = "large",
                        },
                    },
                },
            },
        },
        Flourish = {
            type = "group",
            name = "|T" .. icons .. "Flourish.tga:16:16|t Flourish",
            order = 30,
            disabled = function() return not SDKUtil:GetOption("Enabled") or not SDKUtil:GetOption("Flourish_Enabled")  end,
            args = {
                HeroImage = {
                    type = "description",
                    name = "",
                    image = icons .. "FlourishBig",
                    imageWidth = 128,
                    imageHeight = 128,
                    order = 1,
                    fontSize = "large",
                },
                HeroDescription = {
                    type = "description",
                    name = "Flourish tracks a chosen buff across your party or raid frames, highlighting each member based on whether they currently have the effect applied. Designed for healers who want to quickly assess their raid frames, Flourish removes the guesswork so you can keep your group covered without losing focus.",
                    order = 2,
                    fontSize = "large",
                },
                Divider = {
                    type = "header",
                    name = "",
                    order = 3,
                },
                FrameHighlightEnabled = {
                    type = "toggle",
                    name = "Enable Frame Highlighting",
                    order = 4,
                    width = "full",
                    get = function() return SDKUtil:GetOption("Flourish_HighlightEnabled") end,
                    set = function(_, v) return SDKUtil:SetOption("Flourish_HighlightEnabled", v) end,
                },
                BuffReminderEnabled = {
                    type = "toggle",
                    name = "Enable Buff Reminder",
                    order = 5,
                    width = "full",
                    get = function() return SDKUtil:GetOption("Flourish_ReminderEnabled") end,
                    set = function(_, v) return SDKUtil:SetOption("Flourish_ReminderEnabled", v) end,
                },
                FrameHighlight = {
                    type = "group",
                    name = "Frame Highlight",
                    order = 1,
                    disabled = function() return not SDKUtil:GetOption("Enabled") or not SDKUtil:GetOption("Flourish_Enabled") or not SDKUtil:GetOption("Flourish_HighlightEnabled") end,
                    args = {
                        Color = {
                            type = "color",
                            name = "Default Frame Color",
                            order = 4,
                            get = function() return unpack(SDKUtil:GetOption("Flourish_Frame")) end,
                            set = function(_, r, g, b, a) return SDKUtil:SetOption("Flourish_Frame", {r,g,b,a}) end,
                        },
                        Border = {
                            type = "color",
                            name = "Default Border Color",
                            order = 5,
                            get = function() return unpack(SDKUtil:GetOption("Flourish_Border")) end,
                            set = function(_, r, g, b, a) return SDKUtil:SetOption("Flourish_Border", {r,g,b,a}) end,
                        },
                    },
                },
                BuffReminder = {
                    type = "group",
                    name = "Buff Reminder",
                    order = 2,
                    disabled = function() return not SDKUtil:GetOption("Enabled") or not SDKUtil:GetOption("Flourish_Enabled") or not SDKUtil:GetOption("Flourish_ReminderEnabled") end,
                    args = {},
                },
            },
        },
	},
}