-- @ScriptType: ModuleScript
local EncounterData = {}
EncounterData.Events = {}

local function loadEvents(moduleName)
	local mod = require(script.Parent:WaitForChild(moduleName))
	for _, event in ipairs(mod) do
		table.insert(EncounterData.Events, event)
	end
end

loadEvents("ChildEncounters")
loadEvents("TeenEncounters")
loadEvents("AdultEncounters")
loadEvents("BizarreEncounters")

return EncounterData