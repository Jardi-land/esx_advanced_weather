Citizen.CreateThread(function()
  SetWeatherOwnedByNetwork(false)
  TriggerServerEvent("OnJoin")
end)


local function sendNotificationDetail(WeatherName) --Notification
  SetNotificationTextEntry("STRING")
  AddTextComponentString(_U("notification:"..WeatherName))
  local txd = "CHAR_LS_TOURIST_BOARD" --https://wiki.rage.mp/index.php?title=Notification_Pictures
  local title = "~h~Los Santos Info"
  local subtitle = _U("subtitle:weather") 
  local iconType = 0 --https://docs.fivem.net/natives/?_0x1CCD9A37359072CF
  local flash = false --flash doesn't seems to work
  EndTextCommandThefeedPostMessagetext(txd, txd, flash, iconType, title, subtitle)
  DrawNotification(false, false)
end

RegisterNetEvent("NewWeatherCycle")
AddEventHandler("NewWeatherCycle", function(NewWeatherHash, NewWeatherName, WeatherTransition)
  print(NewWeatherName.." | "..NewWeatherHash)
  sendNotificationDetail(NewWeatherName)
  local percent = 0.025
  repeat
    percent = percent+0.025
    print(percent)
    SetWeatherTypeTransition(GetPrevWeatherTypeHashName(), NewWeatherHash, percent)
    Wait(WeatherTransition/40)
  until percent > 1.0
end)

RegisterNetEvent("WeatherOnJoin")
AddEventHandler("WeatherOnJoin", function(CurrentWeatherName, CurrentWeatherHash)
  SetWeatherTypeNow(tostring(CurrentWeatherName))
  print("Set weather OnJoin: "..CurrentWeatherName.." | "..CurrentWeatherName)
end)
