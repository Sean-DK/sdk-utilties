local _, private = ...
local SDKUtil = private:GetPrototype("SDKUtil")

local SDKHeal = private:GetPrototype("SDKHeal")

function SDKHeal:RegisterOptions()
    for class, spells in pairs(SDKHeal.SpellList) do
        local parentGroup = SDKUtil.Options.args.Flourish.args.FrameHighlight
        local key = "Flourish_" .. class

        local spellNames = {}
        for spellId, default in pairs(spells) do
            local name = SDKHeal:GetSafeSpellName(spellId)
            spellNames[name] = name
            if default then 
                SDKUtil.DefaultOptions.profile[key] = true
                SDKUtil.DefaultOptions.profile[key.."_Spell"] = name
                SDKUtil.DefaultOptions.profile[key.."_Frame"] = {0.1, 0.3, 0.1, 1}
                SDKUtil.DefaultOptions.profile[key.."_Border"] = {0.1, 0.5, 0.1, 1}
            end
        end

        parentGroup.args[key] = {
            type = "group",
            name = class,
            inline = true,
            order = SDKUtil.OptionOrder,
            args = {
                Enabled = {
                    type = "toggle",
                    name = "Enabled",
                    order = 1,
                    get = function() return SDKUtil:GetOption(key) end,
                    set = function(_, v) return SDKUtil:SetOption(key, v) end,
                },
                Spell = {
                    type = "select",
                    name = "Spell",
                    order = 2,
                    values = spellNames,
                    get = function() return SDKUtil:GetOption(key .. "_Spell") end,
                    set = function(_, v) return SDKUtil:SetOption(key .. "_Spell", v) end,
                },
                Frame = {
                    type = "color",
                    name = "Frame Color",
                    order = 3,
                    get = function() return unpack(SDKUtil:GetOption(key .. "_Frame")) end,
                    set = function(_, r, g, b, a) return SDKUtil:SetOption(key .. "_Frame", {r, g, b, a}) end,
                },
                Border = {
                    type = "color",
                    name = "Border Color",
                    order = 4,
                    get = function() return unpack(SDKUtil:GetOption(key .. "_Border")) end,
                    set = function(_, r, g, b, a) return SDKUtil:SetOption(key .. "_Border", {r, g, b, a}) end,
                },
                Divider = {
                    type = "header",
                    name = "",
                    order = 5,
                },
            },
        }
        SDKUtil.OptionOrder = SDKUtil.OptionOrder + 1
    end
    
    SDKUtil.Data:RegisterDefaults(SDKUtil.DefaultOptions)
    LibStub("AceConfigRegistry-3.0"):NotifyChange("SDKUtil")
end

local function CompareColors(a, b)
    local r1, g1, b1, a1 = a:GetRGBA()
    local r2, g2, b2, a2 = b:GetRGBA()
    return r1 == r2 and g1 == g2 and b1 == b2 and a1 == a2
end

local function HasBuff(unit)
    local auras = C_UnitAuras.GetUnitAuras(unit, 'PLAYER|HELPFUL')
    if not auras then return end

    local spellName = SDKUtil:GetOption("Flourish_" .. SDKUtil.PlayerClass .. "_Spell")
    for _, aura in ipairs(auras) do
        if aura and not issecretvalue(aura) and not issecretvalue(aura.name) and aura.name == spellName then return true end
    end
end

local function UpdateFrame(frame)
    if not SDKUtil:GetOption("Enabled") 
    or not SDKUtil:GetOption("Flourish_Enabled") 
    or not SDKUtil:GetOption("Flourish_" .. SDKUtil.PlayerClass)
    then return end

    local unit = frame and frame.displayedUnit
    if not (unit == "player" or unit:match("^party%d+$") or unit:match("^raid%d+$")) then return end

    if HasBuff(unit) then
        frame.healthBar:SetStatusBarColor(unpack(SDKUtil:GetOption("Flourish_" .. SDKUtil.PlayerClass .. "_Frame")))
        frame:SetBackdropBorderColor(unpack(SDKUtil:GetOption("Flourish_" .. SDKUtil.PlayerClass .. "_Border")))
    else
        frame.healthBar:SetStatusBarColor(unpack(SDKUtil:GetOption("Flourish_Frame")))
        frame:SetBackdropBorderColor(unpack(SDKUtil:GetOption("Flourish_Border")))
    end
end

C_Timer.After(0, function()
        hooksecurefunc("CompactUnitFrame_UpdateAuras", UpdateFrame)
        hooksecurefunc("CompactUnitFrame_UpdateHealth", UpdateFrame)
        hooksecurefunc("CompactUnitFrame_UpdateHealthColor", UpdateFrame)
    end)