local _, private = ...
local SDKUtil = private:GetPrototype("SDKUtil")
local Addon = private.addon

function SDKUtil:InitializeZoneTracking()
    SDKUtil.ZoneRegistry = SDKUtil.ZoneRegistry or {}
    for _, encounter in ipairs(SDKUtil.Encounters or {}) do
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

function SDKUtil:OnZoneChanged()
    local _, _, _, _, _, _, _, instanceId = GetInstanceInfo()

    SDKUtil:Debug("OnZoneChanged: instanceId =", instanceId)

    SDKUtil:UnhookAllEncounters()

    if not instanceId or instanceId == 0 then return end

    local encounters = SDKUtil.ZoneRegistry[instanceId]
    if not encounters then
        SDKUtil:Debug("OnZoneChanged: no encounters registered for instanceId", instanceId)
        return
    end

    for _, encounter in ipairs(encounters) do
        if SDKUtil:GetOption("Crier_Enabled") then
            encounter:RegisterEvents()
        end
    end
end

function SDKUtil:UnhookAllEncounters()
    for _, encounter in ipairs(SDKUtil.Encounters or {}) do
        if encounter.Hooked then
            encounter:UnregisterEvents()
        end
    end
end