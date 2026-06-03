-- @ScriptType: Script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local RunService = game:GetService("RunService")

local rf = Instance.new("RemoteFunction")
rf.Name = "FilterTextRF"
rf.Parent = ReplicatedStorage

rf.OnServerInvoke = function(player, text)
	if RunService:IsStudio() then
		if string.lower(text):match("badword") then
			return false
		end
		return true
	end

	local success, result = pcall(function()
		local filterResult = TextService:FilterStringAsync(text, player.UserId)
		return filterResult:GetNonChatStringForBroadcastAsync()
	end)

	if success and result then
		if result ~= text then
			return false 
		end
		return true 
	end

	return false 
end