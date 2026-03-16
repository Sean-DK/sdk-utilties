local addonName, private = ...
local SDKUtil = private:GetPrototype("SDKUtil")
local SDKCrier = private:GetPrototype("SDKCrier")
local Addon = LibStub("AceAddon-3.0"):NewAddon("SDKUtil", "AceConsole-3.0", "AceEvent-3.0")
private.addon = Addon

function Addon:OnInitialize()
    SDKUtil.Data = LibStub("AceDB-3.0"):New("SDKUtilDB", SDKUtil.DefaultOptions, true)
    --SDKUtil.Data.RegisterCallback(SDKUtil, "OnProfileChanged", "OnProfileChanged")
	--SDKUtil.Data.RegisterCallback(SDKUtil, "OnProfileCopied", "OnProfileChanged")
	--SDKUtil.Data.RegisterCallback(SDKUtil, "OnProfileReset", "OnProfileChanged")
	
    LibStub("AceConfig-3.0"):RegisterOptionsTable("SDKUtil", SDKUtil.Options)
	_, SDKUtil.OptionCategory = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("SDKUtil", "SeanDK Utilities")
	SDKUtil.Options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(SDKUtil.Data)
	
	self:RegisterChatCommand("sdku", "OnChatCommand")
end

function Addon:OnEnable()
    self:Print("SDKUtil loaded. Type /sdku for options.")
	
	if IsLoggedIn() then
		self:OnPlayerLogin()
	else
		self:RegisterEvent("PLAYER_LOGIN", "OnPlayerLogin")
	end
end

function Addon:OnPlayerLogin()
    local SDKHeal = private:GetPrototype("SDKHeal")
    SDKUtil.PlayerClass = UnitClass("player")
    SDKUtil:InitializeZoneTracking()
    SDKCrier:InitializeOptions()
    SDKCrier:InitializeTextAlerts()
    SDKCrier:RegisterPrivateAuras()
    SDKCrier:RegisterEncounters()
    SDKHeal:RegisterOptions()
end

function Addon:OnChatCommand(input)
    local cmd = input:trim():lower()

    if cmd == "admin" then
        local isAdmin = SDKUtil:GetOption("Admin")
        SDKUtil:SetOption("Admin", not isAdmin)
        if not isAdmin then
            SDKUtil:Warn("Admin mode enabled")
        else
            SDKUtil:Warn("Admin mode disabled")
        end
    elseif cmd == "" then
        if not InCombatLockdown() then
            LibStub("AceConfigDialog-3.0"):Open("SDKUtil")
        else
            SDKUtil:Warn("Cannot open options during combat")
        end
    else
        SDKUtil:Warn("Unknown command: " .. cmd)
        SDKUtil:Warn("Usage: /sdku")
    end
end

function Addon:Print(...)
    DEFAULT_CHAT_FRAME:AddMessage("|cffc41e3aSDK|r|cffffffffUtil|r:" .. strjoin(" ", tostringall(...)))
end

function SDKUtil:Debug(...)
	if self.Data and self.Data.profile.DebugMessages then
		Addon:Print("|cff888888[Debug]|r", ...)
	end
end

function SDKUtil:Info(...)
	if self.Data and self.Data.profile.InfoMessages then
		Addon:Print("|cff00b4ff[Info]|r", ...)
	end
end

function SDKUtil:Warn(...)
	Addon:Print("|cffff9900[Warn]|r", ...)
end