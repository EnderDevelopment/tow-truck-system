# Tow Truck System

Enhance your FiveM server with a realistic tow truck system featuring towing, boss menu, and clothing options.

## Features

- Realistic towing experience with a lifting and lowering platform in a tow truck
- Boss menu for managing the towing service
- Clothing menu for tow truck drivers

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script from the [releases page](https://github.com/EnderDevelopment/tow-truck-system/releases)
2. Extract the files into your FiveM server's `resources` directory
3. Add `start tow-truck-system` to your server.cfg file
4. Run the `database.sql` file in your MySQL database

## Usage

### Towing

- Enter a tow truck
- Press the E key to start towing
- Press the E key again to stop towing

### Boss Menu

- Access the boss menu by typing `/bossmenu` in the chat
- Use the boss menu to manage the towing service

### Clothing Menu

- Access the clothing menu by typing `/clothingmenu` in the chat
- Use the clothing menu to change your tow truck driver outfit

## Configuration

The script can be configured by editing the `config.lua` file. The following options are available:

```lua
Config = {}

-- Tow Truck Settings
Config.TowTruckModel = 'flatbed'
Config.TowRopeModel = 'prop_rope'
Config.TowRopeLength = 10.0

-- Boss Menu Settings
Config.BossMenu = {
    enabled = true,
    jobName = 'towtruck'
}

-- Clothing Menu Settings
Config.ClothingMenu = {
    enabled = true,
    jobName = 'towtruck'
}

-- Database Settings
Config.Database = {
    tableName = 'towtruck_system'
}
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=tow-truck-system&utm_content=bottom) — describe it in one sentence and get the full source code.