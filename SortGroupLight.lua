-- THIS ADDON IS AN EXACT COPY OF SORTGROUP ADDON
-- https://www.curseforge.com/wow/addons/sortgroup
-- I DO NOT CLAIM OWNERSHIP OF THIS CODE, I'M NOT THE AUTHOR, 
-- I JUST ADJUSTED IT SO IT FITS MY SPECIFIC NEEDS ON THE GAME

local ADDON_NAME, addon = ...

if not _G[ADDON_NAME] then
	_G[ADDON_NAME] = CreateFrame("Frame")
end

addon = _G[ADDON_NAME]

addon:RegisterEvent("PLAYER_ENTERING_WORLD")

addon:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		local _, instanceType = IsInInstance()
        if instanceType == "arena" then
            print("|cffffcc00 SortGroupLight: |cffffffff Arena detected | sorting group descending")
            addon:SortBottomDescending()
        else	
            print("|cffffcc00 SortGroupLight: |cffffffff World detected | not sorting")
        end
	end
end)

function addon:SortBottomDescending()
    local CRFSort_BottomDownwards = function(t1, t2)
        if not UnitExists(t1) then
            return false;
        elseif not UnitExists(t2) then
            return true
        elseif UnitIsUnit(t1, 'player') then
            return false;
        elseif UnitIsUnit(t2, 'player') then
            return true;
        else
            return t1 < t2;
        end
    end
    CompactPartyFrame_SetFlowSortFunction(CRFSort_BottomDownwards);
end