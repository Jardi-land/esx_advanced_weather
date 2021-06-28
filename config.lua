Config = {}
Config.Locale = "en" --"en" or "fr"

Config.Lock = false --lock the weather
Config.Admin = true --Only admin can access to commands
Config.TransitionMs = math.random(25000,40000) --This is how quick you want the weather transition to be (Keep in mind this is in ms !!!)
Config.NewWeatherMs = math.random(720000,1200000) --This is used only if Config.Lock = True (It's the duration of a cycle)

Config.InitialWeatherType = { --The Weather when the script start 
    {name = "CLEAR", hash = 0x36A83D84, use = true},
    {name = "EXTRASUNNY", hash = 0x97AA0A79, use = true},
    {name = "CLOUDS", hash = 0x30FDAF5C, use = true},
    {name = "OVERCAST", hash = 0xBB898D2D, use = true},
    {name = "RAIN", hash = 0x54A69840, use = false},
    {name = "CLEARING", hash = 0x6DB1A50D, use = false},
    {name = "THUNDER", hash = 0xB677829F, use = false},
    {name = "SMOG", hash = 0x10DCF4B5, use = false},
    {name = "FOGGY", hash = 0xAE737644, use = false},
    {name = "XMAS", hash = 0xAAC9C895, use = false},
    {name = "SNOWLIGHT", hash = 0x23FB812B, use = false},
    {name = "BLIZZARD", hash = 0x27EA2814, use = false}
  }

Config.WeatherType = { --Put use = false if you want to deactivated a type of weather --DO NOT CHANGE THE ORDER !!!
    {name = "CLEAR", hash = 0x36A83D84, use = true},
    {name = "EXTRASUNNY", hash = 0x97AA0A79, use = true},
    {name = "CLOUDS", hash = 0x30FDAF5C, use = true},
    {name = "OVERCAST", hash = 0xBB898D2D, use = true},
    {name = "RAIN", hash = 0x54A69840, use = true},
    {name = "CLEARING", hash = 0x6DB1A50D, use = true},
    {name = "THUNDER", hash = 0xB677829F, use = true},
    {name = "SMOG", hash = 0x10DCF4B5, use = true},
    {name = "FOGGY", hash = 0xAE737644, use = true},
    {name = "XMAS", hash = 0xAAC9C895, use = false},
    {name = "SNOWLIGHT", hash = 0x23FB812B, use = false},
    {name = "BLIZZARD", hash = 0x27EA2814, use = false}
  }
