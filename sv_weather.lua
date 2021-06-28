local WeatherTable = {
    ["clear"] = {num = 1},
    ["extrasunny"] = {num = 2},
    ["clouds"] = {num = 3},
    ["overcast"] = {num = 4},
    ["rain"] = {num = 5},
    ["clearing"] = {num = 6},
    ["thunder"] = {num = 7},
    ["smog"] = {num = 8},
    ["foggy"] = {num = 9},
    ["xmas"] = {num = 10},
    ["snowlight"] = {num = 11},
    ["blizzard"] = {num = 12}

}

local InChange = false
CurrentWeatherName = ""
CurrentWeatherHash = ""

function tableHasKey(table,key)
    return table[key] ~= nil
end

Citizen.CreateThread(function()
    InitialWeather = math.random(1,#Config.InitialWeatherType)
    while not Config.InitialWeatherType[InitialWeather].use do
        print(Config.InitialWeatherType[InitialWeather].name.." | Can use: "..tostring(Config.InitialWeatherType[InitialWeather].use))
        Wait(1)
        InitialWeather = math.random(1,#Config.InitialWeatherType)
    end
    print(Config.InitialWeatherType[InitialWeather].name.." | Can use: "..tostring(Config.InitialWeatherType[InitialWeather].use))
    CurrentWeatherName = Config.InitialWeatherType[InitialWeather].name
    CurrentWeatherHash = Config.InitialWeatherType[InitialWeather].hash
    while not Config.Lock do
        Wait(Config.NewWeatherMs)
        NewWeather = math.random(1,#Config.WeatherType)
        while not Config.WeatherType[NewWeather].use do
            print(Config.WeatherType[NewWeather].name.." | Can use: "..tostring(Config.WeatherType[NewWeather].use))
            Wait(1)
            NewWeather = math.random(1,#Config.WeatherType)
        end
        CurrentWeatherName = Config.WeatherType[NewWeather].name
        CurrentWeatherHash = Config.WeatherType[NewWeather].hash
        WeatherTransition = Config.TransitionMs
        print("New weather: "..CurrentWeatherName.." | "..CurrentWeatherHash)
        TriggerClientEvent("NewWeatherCycle", -1, CurrentWeatherHash, CurrentWeatherName, WeatherTransition)
        InChange = true
        Wait(WeatherTransition)
        InChange = false
        print("Weather Change Finish")
    end
end)

RegisterCommand("weather", function(source, args, rawCommand)
    if args[1] == nil then
        print(_U("Invalid:usage"))
        return
    elseif args[2] ~= nil then
        print(_U("Invalid:usage"))
        return
    elseif InChange == true then
        print(_U("Weather:AlreadyChanging"))
        return
    elseif Config.Lock == false then
        print(_U("Invalid:Config.Lock"))
        return
    elseif tableHasKey(WeatherTable, args[1]) == false then
        print(_U("Invalid:usage"))
        return
    elseif Config.WeatherType[WeatherTable[args[1]].num].use == false then
        print(_U("Invalid:WeatherType.false"))
        return
    else
        print(_U("Weather:changing").." "..args[1])
        NewWeatherHash = Config.WeatherType[WeatherTable[args[1]].num].hash
        NewWeatherName = Config.WeatherType[WeatherTable[args[1]].num].name
        CurrentWeatherHash = NewWeatherHash
        CurrentWeatherName = NewWeatherName
        WeatherTransition = Config.TransitionMs
        TriggerClientEvent("NewWeatherCycle", -1, NewWeatherHash, NewWeatherName, WeatherTransition)
        InChange = true
        Wait(WeatherTransition)
        InChange = false
        print("Weather Change Finish")
    end
end, Config.Admin)

RegisterCommand("getweather", function(source, args, rawCommand)
    print(CurrentWeatherName.." | "..CurrentWeatherHash)
end, Config.Admin)

RegisterNetEvent("OnJoin")
AddEventHandler("OnJoin", function()
    local _src = source
    Wait(1000)
    print("Set weather OnJoin for "..GetPlayerName(_src).. ": "..CurrentWeatherName.." | "..CurrentWeatherHash)
    TriggerClientEvent("WeatherOnJoin", _src, CurrentWeatherName, CurrentWeatherHash)
end)