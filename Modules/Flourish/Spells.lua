local _, private = ...
local SDKUtil = private:GetPrototype("SDKUtil")

local SDKHeal = private:GetPrototype("SDKHeal")

function SDKHeal:GetSafeSpellName(spellId)
    local info = C_Spell.GetSpellInfo(spellId)
    return info and info.name or nil
end

SDKHeal.SpellList = {
    ["Evoker"] = {
        -- Preservation
        [355941] = false, --Dream Breath
        [363502] = false, --Dream Flight
        [364343] = true, --Echo
        [366155] = false, --Reversion
        [367364] = false, --Echo Reversion
        [373267] = false, --Lifebind
        [376788] = false, --Echo Dream Breath

        -- Augmentation
        [360827] = false, --Blistering Scales
        [395152] = false, --Ebon Might
        [410089] = false, --Prescience
        [410263] = false, --Inferno's Blessing
        [410686] = false, --Symbiotic Bloom
        [413984] = false, --Shifting Sands
    },

    ["Druid"] = {
        [774]    = true, --Rejuvenation
        [8936]   = false, --Regrowth
        [33763]  = false, --Lifebloom
        [48438]  = false, --Wild Growth
        [155777] = false, --Germination
    },

    ["Priest"] = {
        -- Discipline
        [17]      = false, --Power Word: Shield
        [194384]  = true, --Atonement
        [1253593] = false, --Void Shield

        -- Holy
        [139]   = true, --Renew
        [41635] = false, --Prayer of Mending
        [77489] = false, --Echo of Light
    },

    ["Monk"] = {
        [115175] = false, --Soothing Mist
        [119611] = true, --Renewing Mist
        [124682] = false, --Enveloping Mist
        [450769] = false, --Aspect of Harmony
    },

    ["Shaman"] = {
        [974]    = false, --Earth Shield
        [383648] = false, --Earth Shield
        [61295]  = true, --Riptide
    },

    ["Paladin"] = {
        [53563]   = true, --Beacon of Light
        [156322]  = false, --Eternal Flame
        [156910]  = false, --Beacon of Faith
        [1244893] = false, --Beacon of the Savior
    },
}