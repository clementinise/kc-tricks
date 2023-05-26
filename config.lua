Config                      = Config or {}

Config.Eject                = true      -- This value determines whether the player will be ejected if they land while doing a trick or not (The default value is true)
Config.InstantAnimStop      = true      -- This value determines whether the anim should instantly stopped, otherwise it will just go back to the sitting position gradually (The default value is true)

Config.SpecificVehicle      = true      -- If set to true, you will be able to do tricks only on some specific bikes from the 'Config.Vehicles' list
Config.Vehicles             = {         -- Don't use "Model Name" since there is no native to get model name from vehicle in GTA, only use "Text Label Name(s)". You can found them here: https://gta.fandom.com/wiki/Category:Motorcycles_Vehicle_Class
    "ENDURO",
    "ESSKEY",
    "MANCHEZ",
    "SANCHEZ01",
    "SANCHEZ02"
}

Config.SimpleKey            = 76        -- Set the key used for the simple tricks (76 is 'INPUT_VEH_HANDBRAKE' aka SPACEBAR per default)
-- You can find those value here: https://docs.fivem.net/docs/game-references/controls/