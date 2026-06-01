-- @ScriptType: LocalScript
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local GameLogic = require(script.Parent:WaitForChild("GameLogic"))

GameLogic.Start(player)