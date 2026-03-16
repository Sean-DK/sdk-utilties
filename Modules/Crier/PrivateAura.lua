local _, private = ...
local SDKUtil = private:GetPrototype("SDKUtil")
local SDKCrier = private:GetPrototype("SDKCrier")

local function AddAnchor(unit, auraIndex)
    local key = unit .. auraIndex
    if SDKCrier.PrivateAuraAnchors[key] then return end

    SDKCrier.PrivateAuraFrames[key] = CreateFrame("Frame", nil, UIParent)
    SDKCrier.PrivateAuraFrames[key]:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    SDKCrier.PrivateAuraFrames[key]:SetFrameStrata("HIGH")
    SDKCrier.PrivateAuraFrames[key]:EnableMouse(false)
    SDKCrier.PrivateAuraFrames[key]:Show()

    local iconSize = SDKUtil:GetOption("Crier_PrivateAuraTracking_IconSize") or 64
    local xOffset = SDKUtil:GetOption("Crier_PrivateAuraTracking_XPos") or 0
    local yOffset = SDKUtil:GetOption("Crier_PrivateAuraTracking_YPos") or 0

    if SDKUtil:GetOption("Crier_PrivateAuraTracking_Tooltip") then
        SDKCrier.PrivateAuraFrames[key]:SetSize(iconSize, iconSize)
    else
        SDKCrier.PrivateAuraFrames[key]:SetSize(0.001, 0.001)
    end

    local frame = SDKCrier.PrivateAuraFrames[key]
    local args = {
        unitToken = unit,
        auraIndex = auraIndex,
        parent = frame,
        showCountdownFrame = true,
        showCountdownNumbers = false,
        iconInfo = {
            iconAnchor = {
                point = "CENTER",
                relativeTo = frame,
                relativePoint = "CENTER",
                offsetX = xOffset + ((auraIndex - 1) * iconSize),
                offsetY = yOffset,
            },
            borderScale = 1,
            iconWidth = iconSize,
            iconHeight = iconSize,
        },
        durationAnchor = {
            point = "CENTER",
            relativeTo = frame,
            relativePoint = "CENTER",
            offsetX = xOffset + ((auraIndex - 1) * iconSize),
            offsetY = yOffset + (-(iconSize / 2) - 6),
        },
    }

    local anchor = C_UnitAuras.AddPrivateAuraAnchor(args)

    if anchor then
        SDKCrier.PrivateAuraAnchors[key] = anchor
        SDKUtil:Debug("SDKPrivateAura: registered anchor", anchor, "for", unit, auraIndex)
    else
        SDKUtil:Debug("SDKPrivateAura: failed to register anchor for", unit, auraIndex)
    end
end

function SDKCrier:RegisterPrivateAuras()
    if not SDKUtil:GetOption("Crier_PrivateAuraTracking") then return end

    SDKCrier.PrivateAuraAnchors = SDKCrier.PrivateAuraAnchors or {}
    SDKCrier.PrivateAuraFrames = SDKCrier.PrivateAuraFrames or {}

    local auraLimit = SDKUtil:GetOption("Crier_PrivateAuraTracking_Limit") or 5

    for auraIndex=1, auraLimit do
        AddAnchor("player", auraIndex)
    end
end

function SDKCrier:UnregisterPrivateAuras()
    for key, id in pairs(SDKCrier.PrivateAuraAnchors) do
        C_UnitAuras.RemovePrivateAuraAnchor(id)
        SDKCrier.PrivateAuraAnchors[key] = nil
    end
    for key, frame in pairs(SDKCrier.PrivateAuraFrames) do
        frame:Hide()
        SDKCrier.PrivateAuraFrames[key] = nil
    end
end

function SDKCrier:UpdatePrivateAuraConfig()
    self:UnregisterPrivateAuras()
    self:RegisterPrivateAuras()
end