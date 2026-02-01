local function UpdateUI()
    local bars = {"ActionButton","MultiBarBottomLeftButton","MultiBarBottomRightButton","MultiBarRightButton","MultiBarLeftButton","MultiBar5Button","MultiBar6Button","MultiBar7Button"}
    for _, barName in ipairs(bars) do
        for i = 1, 12 do
            local button = _G[barName..i]
            if button then
                -- 1. MACRO TEXT (CENTERED & ADAPTIVE)
                local name = _G[barName..i.."Name"]
                if name then
                    name:ClearAllPoints()
                    name:SetPoint("CENTER", button, "CENTER", 0, 0)
                    local txt = name:GetText() or ""
                    local len = #txt
                    if len >= 4 then
                        name:SetFont("Fonts\\ARIALN.TTF", 8, "OUTLINE")
                    elseif len == 3 then
                        name:SetFont("Fonts\\FRIZQT__.TTF", 9, "OUTLINE")
                    else
                        name:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
                    end
                end

                -- 2. CHARGE/STACK COUNTER (BIGGER & NUDGED)
                local count = _G[barName..i.."Count"]
                if count then
                    count:ClearAllPoints()
                    -- Moves it to the extreme corner: (X=3, Y=-2)
                    count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 3, -2)
                    -- Increased to size 14 for maximum visibility
                    count:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
                end
            end
        end
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("ACTIONBAR_SLOT_CHANGED")
f:RegisterEvent("PLAYER_REGEN_ENABLED") 
f:SetScript("OnEvent", UpdateUI)