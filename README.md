# esx_advanced_weather
This is one of the most advanced weather script for FiveM servers. (work for non esx servers too.)\n
You can customise literally everything !  
Keep in mind this is a pre-release, the final version is still in development.  
You can see the development progress [here](https://github.com/Jardi-land/esx_advanced_weather/projects/1).  

**REQUIREMENTS**

Nothing special

**INSTALATION**

Put resource esx_advanced_weather in your server.
Add this in your server.cfg:  
```ensure esx_illegal_drugs```   
If your getting errors, It's most likely that you have your start order wrong.

**CONFIGURATION**

Go into config.lua and change what you want. (Only two languages for the moment)
!! Keep in mind that the biggest value for ```Config.TransitionMs``` must be smaller than the smallest value for ```Config.NewWeatherMs```.
If you want to use the command ```/weather 'WeatherName'``` ```Config.Lock``` must be set to false.

**COMMANDS**

```
/weather 'WeatherName' (Can be: {clear, clouds, overcast, rain, clearing, thunder, smog, foggy, xmas, snowlight, blizzard})
/getweather
```

**HOW THIS WORKS**

If ```Config.Lock = false``` the weather will change to a random one every ```Config.NewWeatherMs``` with a smooth transition.
You can change the weather manually by setting ```Config.Lock = true```.
Commands only work for ```group.admin``` if ```Config.Admin = true```

**ISSUES**

If you find issues please report them [here](https://github.com/Jardi-land/esx_advanced_weather/issues).