local _, ns = ...
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")


function ns:sendNotification()
    local screenshotFormat = GetCVar("screenshotFormat")
    if screenshotFormat ~= "tga" then
        SetCVar("screenshotFormat", "tga")
    else
        screenshotFormat = "jpeg"
    end
    Screenshot()
    SetCVar("screenshotFormat", screenshotFormat)
end


eventFrame:SetScript("OnEvent", function(frame, event, arg1, ...)
    local status, _, _, _, _, queueType, _, _, _, _, _ = GetBattlefieldStatus(arg1)
    if status == "confirm" and queueType == "RATEDSHUFFLE" then
        ns:sendNotification()
    end
end)