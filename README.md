# kc-tricks [![Release](https://img.shields.io/badge/Release-V%201.3-blue)](https://github.com/clementinise/kc-tricks/releases/latest)

Motocross/Bike tricks resource for FiveM servers - https://forum.cfx.re/t/standalone-motocross-tricks-kc-tricks-free/4773158

## FEATURES
* Motocross/Bike tricks using SPACEBAR (Left Click/Right Click/4th or 5th mouse button)
* Run at 0.00ms on idle and 0.02ms max when doing a trick
## kc-tricks is easily configurable: 
* **Config.Eject**
Player will be ejected if they land while doing a trick. If set to false, they will not fall but the anim will stop
* **Config.InstantAnimStop**
This value determines whether the anim should instantly stopped, otherwise it will just go back to the sitting position gradually
* **Config.SimpleKey**
Set the key used for the simple tricks (Default is 76, 'INPUT_VEH_HANDBRAKE' aka SPACEBAR)
* **Config.SpecificVehicle**
You will be able to do tricks only on some specific bikes from the 'Config.Vehicles' list

**Preview:** [Streamable](https://streamable.com/tr4ozn)

### Installation
Download the [latest release](https://github.com/clementinise/kc-tricks/releases/latest).

Drag the folder into your `<server-data>/resources` folder
Add ``start kc-tricks`` in your server.cfg
