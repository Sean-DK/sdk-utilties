local _, private = ...
local LSM = LibStub("LibSharedMedia-3.0")
local SDKUtil = private:GetPrototype("SDKUtil")
local SDKCrier = private:GetPrototype("SDKCrier")
local Addon = private.addon

local TextTimer = {}
local activeTimers = {}
local timerFrames = {}

local function GetRainbowColor(speed)
    speed = speed or 6
    local t = GetTime() * speed
    local r = math.sin(t) * 0.5 + 0.5
    local g = math.sin(t + (2 * math.pi / 3)) * 0.5 + 0.5
    local b = math.sin(t + (4 * math.pi / 3)) * 0.5 + 0.5
    return r, g, b
end

local function GetFlashColor(colorA, colorB, speed)
    speed = speed or 6
    local t = math.sin(GetTime() * speed) * 0.5 + 0.5  -- oscillates 0 to 1
    local r = colorA[1] + (colorB[1] - colorA[1]) * t
    local g = colorA[2] + (colorB[2] - colorA[2]) * t
    local b = colorA[3] + (colorB[3] - colorA[3]) * t
    return r, g, b
end

function SDKCrier:InitializeTextAlerts()
    local anchor = CreateFrame("Frame", "TextTimerAnchor", UIParent)
    anchor:SetSize(200, 30)
    anchor:SetPoint("CENTER", UIParent, "CENTER", 0, 20)

    local fontPath = LSM:Fetch("font", SDKUtil:GetOption("Crier_TextAlertsFont")) or "Fonts\\FRIZQT__.TTF"
    local fontSize = SDKUtil:GetOption("Crier_TextAlertsFontSize") or 22

    local nextAlert = anchor:CreateFontString(nil, "OVERLAY")
    nextAlert:SetFont(fontPath, fontSize, "OUTLINE")
    nextAlert:SetPoint("TOP", anchor, "TOP", 0, 0)
    nextAlert:SetJustifyH("CENTER")
    nextAlert:Hide()
    local nextTimer = anchor:CreateFontString(nil, "OVERLAY")
    nextTimer:SetFont(fontPath, fontSize, "OUTLINE")
    nextTimer:SetPoint("LEFT", nextAlert, "RIGHT", 0, 0)
    nextTimer:SetJustifyH("LEFT")
    nextTimer:SetWidth(100)
    nextTimer:Hide()
    timerFrames[1] = { label = nextAlert, timer = nextTimer }

    local onDeckAlert = anchor:CreateFontString(nil, "OVERLAY")
    onDeckAlert:SetFont(fontPath, fontSize * 0.6, "OUTLINE")
    onDeckAlert:SetPoint("TOP", anchor, "TOP", 0, 24)
    onDeckAlert:SetJustifyH("CENTER")
    onDeckAlert:Hide()
    local onDeckTimer = anchor:CreateFontString(nil, "OVERLAY")
    onDeckTimer:SetFont(fontPath, fontSize * 0.6, "OUTLINE")
    onDeckTimer:SetPoint("LEFT", onDeckAlert, "RIGHT", 0, 0)
    onDeckTimer:SetJustifyH("LEFT")
    onDeckTimer:SetWidth(100)
    onDeckTimer:Hide()
    timerFrames[2] = { label = onDeckAlert, timer = onDeckTimer }

    local updateFrame = CreateFrame("Frame")
    updateFrame:SetScript("OnUpdate", function(self, elapsed)
        local now = GetTime()
        local slot = 1

        local sorted = {}
        for id, timer in pairs(activeTimers) do
            local remaining = timer.endTime - now
            if remaining <= 0 then
                activeTimers[id] = nil
                if timer.onExpire then timer.onExpire() end
            else
                table.insert(sorted, {id = id, timer = timer, remaining = remaining})
            end
        end

        table.sort(sorted, function(a, b)
            return a.remaining < b.remaining  -- shortest first
        end)

        for id, entry in pairs(sorted) do
            if slot > 2 then break end
        
            local line = timerFrames[slot]
            local timerText
            local r, g, b
            
            if slot == 1 then
                local yellow = {1, 1, 0}
                local green  = {0, 1, 0}
                r, g, b = GetFlashColor(yellow, green)
                timerText = string.format("(%.1f)", entry.remaining)
            else
                r, g, b = 1, 1, 0
                timerText = string.format("(%d)", math.ceil(entry.remaining))
            end

            line.label:SetTextColor(r, g, b)
            line.timer:SetTextColor(r, g, b)
            line.label:SetText(entry.timer.label)
            line.timer:SetText(timerText)

            local threshold = SDKUtil:GetOption("Crier_TextAlertsThreshold") or 8
            if entry.remaining <= threshold then
                line.label:Show()
                line.timer:Show()
            else
                line.label:Hide()
                line.timer:Hide()
            end
            slot = slot + 1
        end
        
        for i = #sorted + 1, 2 do
            timerFrames[i].label:Hide()
            timerFrames[i].timer:Hide()
        end
    end)
end

function TextTimer.Start(id, label, duration, onExpire)
    activeTimers[id] = {
        label = label,
        endTime = GetTime() + duration,
        onExpire = onExpire,
    }
end

function TextTimer.Cancel(id)
    activeTimers[id] = nil
end

function TextTimer.CancelAll()
    wipe(activeTimers)
end

function Addon:OnTimelineAdded(self, eventInfo, remaining)
    if not SDKUtil:GetOption("Crier_EnableTextAlerts") then return end
    if eventInfo and eventInfo.source == 2 then return end -- Block Edit Mode events
    
    local id = eventInfo.id
    local name = eventInfo.spellName
    local duration = remaining or eventInfo.duration

    TextTimer.Start(id, name, duration)
end

function Addon:OnTimelineRemoved(self, id)
    TextTimer.Cancel(id)
end

function Addon:ClearTimelineEvents()
    SDKUtil:Debug("Addon:ClearTimelineEvents")
    TextTimer.CancelAll()
end

Addon:RegisterEvent("ENCOUNTER_TIMELINE_EVENT_ADDED", "OnTimelineAdded")
Addon:RegisterEvent("ENCOUNTER_TIMELINE_EVENT_REMOVED", "OnTimelineRemoved")