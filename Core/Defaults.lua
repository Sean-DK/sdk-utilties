local addonName, private = ...
local SDKUtil = private:GetPrototype("SDKUtil")

SDKUtil.DefaultOptions = {
	profile = {
		Enabled = true,
		Admin = false,
		DebugMessages = false,
        InfoMessages = false,
        WarnMessages = true,
		Version = C_AddOns.GetAddOnMetadata(addonName, "Version"),
        Crier_Enabled = true,
        Crier_OutputChannel = "Master",
        Crier_DungeonsEnabled = true,
        Crier_RaidsEnabled = true,
        Crier_EnableTextAlerts = true,
        Crier_TextAlertsThreshold = 8,
        Crier_TextAlertsFontSize = 22,
        Crier_TextAlertsFont = "Friz Quadrata TT",
        Crier_TextAlertsXPos = 0,
        Crier_TextAlertsYPos = 25,
        Crier_PrivateAuraTracking = true,
        Crier_PrivateAuraTracking_Tooltip = false,
        Crier_PrivateAuraTracking_Limit = 5,
        Crier_PrivateAuraTracking_IconSize = 64,
        Crier_PrivateAuraTracking_XPos = 0,
        Crier_PrivateAuraTracking_YPox = 0,
        Flourish_Enabled = true,
        Flourish_HighlightEnabled = true,
        Flourish_ReminderEnabled = true,
        Flourish_Frame = {0, 0, 0, 1},
        Flourish_Border = {0.2, 0.2, 0.2, 1},
	},
}