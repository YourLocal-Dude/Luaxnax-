# 🌐 Luaxnax Roblox Scripting Language

Luaxnax is a beginner-friendly scripting language for Roblox that uses `.lxn` files with simple commands like Say, Set, Add, and Teleport.

## ⚙️ Features

- Lua-like syntax simplified for newcomers  
- Loadstring-compatible: converts `.lxn` to real Lua on the fly  
- Only `.lxn` files are executed — adds safety  
- Supports: Say, Set, Add, Wait, Loop, and Teleport

## 🚀 How to Use

Paste this into your Roblox executor:

loadstring(
  game:HttpGet("https://raw.githubusercontent.com/YourLocal-Dude/Luaxnax-/main/roblox/LuaxnaxLoader.lua")
)()("https://raw.githubusercontent.com/YourLocal-Dude/Luaxnax-/main/examples/welcome.lxn")

Your `.lxn` script will be downloaded, converted, and run immediately.

## 🧰 Supported Commands

Command | Description
------- | -----------
Say "message" | Prints a message to the console
Set <Var> = <Value> | Sets a global variable
Add <Var> +<Value> | Increases a variable's value
Wait <seconds> | Waits/delays execution
Loop <count> <command> | Repeats a command multiple times
Teleport <playername> <x> <y> <z> | Teleports a player to coordinates

Full syntax: see docs/COMMANDS.md

## 💡 Create Your Own `.lxn`

Create a file ending in `.lxn` with beginner-style commands like:

Say "Welcome!"
Set Coins = 100
Add Coins +50

Then host it publicly and load it using the loader.

## 📄 License

This project is open-source under the MIT License. See LICENSE for details.

## 🌍 Created by

YourLocal-Dude — making scripting simple for everyone.
