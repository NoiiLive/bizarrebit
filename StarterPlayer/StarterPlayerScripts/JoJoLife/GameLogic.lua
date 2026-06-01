-- @ScriptType: ModuleScript
local GameLogic = {}
local UIBuilder = require(script.Parent:WaitForChild("UIBuilder"))
local UIManager = require(script.Parent:WaitForChild("UIManager"))
local EncounterData = require(script.Parent:WaitForChild("EncounterData"))
local StatsManager = require(script.Parent:WaitForChild("StatsManager"))

function GameLogic.Start(player)
	StatsManager.ResetStats()
	local gui = UIBuilder.Build(player)
	local mainFrame = gui:WaitForChild("MainFrame")
	local actionFrame = mainFrame:WaitForChild("ActionFrame")
	local ageUpButton = actionFrame:WaitForChild("AgeUpButton")

	local relButton = actionFrame:WaitForChild("RelationshipsButton")
	local actButton = actionFrame:WaitForChild("ActionsButton")

	local popupOverlay = mainFrame:WaitForChild("PopupOverlay")
	local relOverlay = mainFrame:WaitForChild("RelationshipsOverlay")
	local actOverlay = mainFrame:WaitForChild("ActionsOverlay")

	local relCloseBtn = relOverlay:WaitForChild("RelationshipsFrame"):WaitForChild("CloseButton")
	local relListFrame = relOverlay:WaitForChild("RelationshipsFrame"):WaitForChild("ListFrame")

	local actCloseBtn = actOverlay:WaitForChild("ActionsFrame"):WaitForChild("CloseButton")
	local actListFrame = actOverlay:WaitForChild("ActionsFrame"):WaitForChild("ListFrame")

	UIManager.UpdateStatsUI(gui, StatsManager)

	local logFrame = mainFrame:WaitForChild("LogFrame")
	UIBuilder.AddLogTitle(logFrame, "YEAR " .. StatsManager.Stats.Year)
	UIBuilder.AddLogText(logFrame, "You were born into a bizarre world as " .. StatsManager.Stats.FirstName .. " " .. StatsManager.Stats.LastName .. ".", Color3.fromRGB(220, 220, 220))

	ageUpButton.MouseButton1Click:Connect(function()
		if popupOverlay.Visible or relOverlay.Visible or actOverlay.Visible then return end

		if StatsManager.Stats.IsDead then
			GameLogic.RestartGame(gui, logFrame)
		else
			GameLogic.AgeUp(gui, logFrame)
		end
	end)

	relButton.MouseButton1Click:Connect(function()
		if popupOverlay.Visible or actOverlay.Visible then return end
		UIManager.PopulateRelationships(relListFrame, gui, logFrame, relOverlay, GameLogic, StatsManager)
		relOverlay.Visible = true
	end)

	relCloseBtn.MouseButton1Click:Connect(function()
		relOverlay.Visible = false
	end)

	actButton.MouseButton1Click:Connect(function()
		if popupOverlay.Visible or relOverlay.Visible then return end
		UIManager.PopulateActions(actListFrame, gui, logFrame, actOverlay, GameLogic, StatsManager)
		actOverlay.Visible = true
	end)

	actCloseBtn.MouseButton1Click:Connect(function()
		actOverlay.Visible = false
	end)
end

function GameLogic.RestartGame(gui, logFrame)
	StatsManager.ResetStats()
	UIBuilder.ClearLogs(logFrame)

	local mainFrame = gui:WaitForChild("MainFrame")
	local actionFrame = mainFrame:WaitForChild("ActionFrame")
	local ageUpButton = actionFrame:WaitForChild("AgeUpButton")

	ageUpButton.Text = "AGE UP"
	ageUpButton.BackgroundColor3 = Color3.fromRGB(80, 30, 140)

	UIManager.UpdateStatsUI(gui, StatsManager)
	UIBuilder.AddLogTitle(logFrame, "YEAR " .. StatsManager.Stats.Year)
	UIBuilder.AddLogText(logFrame, "You were born anew as " .. StatsManager.Stats.FirstName .. " " .. StatsManager.Stats.LastName .. ".", Color3.fromRGB(220, 220, 220))
end

function GameLogic.Die(gui, logFrame, reason)
	StatsManager.Stats.IsDead = true
	UIBuilder.AddLogTitle(logFrame, "DEATH")
	UIBuilder.AddLogText(logFrame, reason, Color3.fromRGB(220, 60, 60))

	local mainFrame = gui:WaitForChild("MainFrame")
	local actionFrame = mainFrame:WaitForChild("ActionFrame")
	local ageUpButton = actionFrame:WaitForChild("AgeUpButton")

	ageUpButton.Text = "PLAY AGAIN"
	ageUpButton.BackgroundColor3 = Color3.fromRGB(200, 50, 60)
	logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)
end

function GameLogic.ForceEncounter(gui, logFrame)
	local validEvents = {}
	for _, event in ipairs(EncounterData.Events) do
		local minAge = event.MinAge or 0
		local maxAge = event.MaxAge or 9999
		local minYear = event.MinYear or 0
		local maxYear = event.MaxYear or 9999

		local isAvailable = true
		if type(event.IsAvailable) == "function" then
			isAvailable = event.IsAvailable(StatsManager.Stats)
		end

		if StatsManager.Stats.Age >= minAge and StatsManager.Stats.Age <= maxAge and StatsManager.Stats.Year >= minYear and StatsManager.Stats.Year <= maxYear and isAvailable then
			table.insert(validEvents, event)
		end
	end

	if #validEvents > 0 then
		local randomEvent = validEvents[math.random(1, #validEvents)]
		local eventKey = randomEvent.ID or randomEvent.Text
		if type(eventKey) ~= "string" then eventKey = tostring(eventKey) end
		StatsManager.Stats.SeenEvents[eventKey] = true

		if randomEvent.Setup then
			randomEvent.Setup(StatsManager.Stats)
		end
		GameLogic.ShowPopup(gui, logFrame, randomEvent)
	else
		UIBuilder.AddLogText(logFrame, "You wandered around, but nothing interesting happened.", Color3.fromRGB(150, 150, 150))
		logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)
	end
end

function GameLogic.AgeUp(gui, logFrame)
	StatsManager.Stats.Age = StatsManager.Stats.Age + 1
	StatsManager.Stats.Year = StatsManager.Stats.Year + 1
	StatsManager.Stats.EventTarget = nil

	local deadRelative = nil
	local mother = nil

	if StatsManager.Stats.Relationships then
		for _, rel in ipairs(StatsManager.Stats.Relationships) do
			if not rel.IsDead then
				rel.Age = rel.Age + 1
				rel.Closeness = math.clamp(rel.Closeness - math.random(3, 6), 0, 100)

				if rel.Role == "Mother" then
					mother = rel
				end

				local raceMaxAges = { Human = 110, ["Hamon User"] = 150, Zombie = 200, Vampire = 300 }
				local maxAgeForRace = raceMaxAges[rel.Race] or 110
				local actualLifespan = math.floor(maxAgeForRace * rel.LifespanRoll)

				if rel.Age > actualLifespan then
					if not deadRelative then
						rel.IsDead = true
						deadRelative = rel
					else
						rel.Age = rel.Age - 1
					end
				end
			end
		end
	end

	if mother and mother.Age <= 40 and not mother.IsDead then
		if math.random(1, 100) <= 8 then
			local sibGender = math.random() > 0.5 and "Male" or "Female"
			local sibNamePool = sibGender == "Male" and StatsManager.FirstNames.Male or StatsManager.FirstNames.Female
			local sibName = sibNamePool[math.random(1, #sibNamePool)]
			local sibRole = sibGender == "Male" and "Brother" or "Sister"
			table.insert(StatsManager.Stats.Relationships, {
				Name = sibName .. " " .. StatsManager.Stats.LastName,
				Role = sibRole,
				Age = 0,
				Race = "Human",
				LifespanRoll = 0.8 + (math.random() * 0.2),
				IsDead = false,
				Gender = sibGender,
				Stand = "None",
				Closeness = 50
			})
			UIBuilder.AddLogText(logFrame, "Your parents had a new baby! You have a new " .. string.lower(sibRole) .. " named " .. sibName .. ".", Color3.fromRGB(240, 200, 200))
		end
	end

	StatsManager.Stats.LifeForce = math.min(100, StatsManager.Stats.LifeForce + 10)

	UIBuilder.AddLogTitle(logFrame, "AGE " .. StatsManager.Stats.Age .. " - " .. StatsManager.Stats.Year)

	if StatsManager.Stats.Salary > 0 then
		StatsManager.Stats.Money = StatsManager.Stats.Money + StatsManager.Stats.Salary
		UIBuilder.AddLogText(logFrame, "You earned $" .. StatsManager.Stats.Salary .. " from your job.", Color3.fromRGB(80, 220, 100))
	end

	UIManager.UpdateStatsUI(gui, StatsManager)

	local raceMaxAges = { Human = 110, ["Hamon User"] = 150, Zombie = 200, Vampire = 300 }
	local maxAgeForRace = raceMaxAges[StatsManager.Stats.Race] or 110
	local actualLifespan = math.floor(maxAgeForRace * StatsManager.Stats.LifespanRoll)

	if StatsManager.Stats.Age > actualLifespan then
		GameLogic.Die(gui, logFrame, "Your natural lifespan has been reached. You passed away.")
		return
	end

	if deadRelative then
		local deathEncounter = {
			Text = "Tragedy strikes. Your " .. string.lower(deadRelative.Role) .. ", " .. deadRelative.Name .. ", has passed away at the age of " .. deadRelative.Age .. ".",
			Options = {
				{
					Text = "Attend the funeral",
					Outcomes = {
						{Weight = 10, ResultText = "You paid your respects to " .. deadRelative.Name .. ". It was a heartbreaking ceremony.", StatChanges = {Happiness = -25}}
					}
				},
				{
					Text = "Mourn in private",
					Outcomes = {
						{Weight = 10, ResultText = "You stayed home and cried. The grief weighs heavily on you.", StatChanges = {Happiness = -30}}
					}
				},
				{
					Text = "Check for an inheritance",
					Outcomes = {
						{Weight = 5, ResultText = "They left you a generous sum of money in their will.", StatChanges = {Happiness = -10, Money = 2500}},
						{Weight = 5, ResultText = "They left all their money to a cat shelter. You got absolutely nothing.", StatChanges = {Happiness = -30}}
					}
				},
				{
					Text = "Crazy Diamond: Fix them!",
					IsAvailable = function(stats) return stats.Stand == "Crazy Diamond" end,
					Outcomes = {
						{Weight = 10, ResultText = "You desperately try to heal them, but Crazy Diamond cannot bring back the dead.", StatChanges = {Happiness = -40, LifeForce = -10}}
					}
				}
			}
		}
		GameLogic.ShowPopup(gui, logFrame, deathEncounter)
		logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)
		return
	end

	if math.random() <= 0.35 then
		UIBuilder.AddLogText(logFrame, "A quiet, uneventful year passes.", Color3.fromRGB(150, 150, 150))
		logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)
		return
	end

	local validEvents = {}
	local unseenEvents = {}

	for _, event in ipairs(EncounterData.Events) do
		local minAge = event.MinAge or 0
		local maxAge = event.MaxAge or 9999
		local minYear = event.MinYear or 0
		local maxYear = event.MaxYear or 9999

		local isAvailable = true
		if type(event.IsAvailable) == "function" then
			isAvailable = event.IsAvailable(StatsManager.Stats)
		end

		if StatsManager.Stats.Age >= minAge and StatsManager.Stats.Age <= maxAge and StatsManager.Stats.Year >= minYear and StatsManager.Stats.Year <= maxYear and isAvailable then
			table.insert(validEvents, event)
			local eventKey = event.ID or event.Text
			if type(eventKey) ~= "string" then eventKey = tostring(eventKey) end
			if not StatsManager.Stats.SeenEvents[eventKey] then
				table.insert(unseenEvents, event)
			end
		end
	end

	local poolToPullFrom = #unseenEvents > 0 and unseenEvents or validEvents

	if #poolToPullFrom > 0 then
		local eventWeights = {}
		local totalEventWeight = 0

		for _, event in ipairs(poolToPullFrom) do
			local ew = 1
			if event.IsBizarre then
				ew = 1 + (StatsManager.Stats.Bizarreness / 20)
			end
			table.insert(eventWeights, {event = event, weight = ew})
			totalEventWeight = totalEventWeight + ew
		end

		local roll = math.random() * totalEventWeight
		local curr = 0
		local randomEvent = poolToPullFrom[#poolToPullFrom]

		for _, ew in ipairs(eventWeights) do
			curr = curr + ew.weight
			if roll <= curr then
				randomEvent = ew.event
				break
			end
		end

		local eventKey = randomEvent.ID or randomEvent.Text
		if type(eventKey) ~= "string" then eventKey = tostring(eventKey) end
		StatsManager.Stats.SeenEvents[eventKey] = true

		if randomEvent.Setup then
			randomEvent.Setup(StatsManager.Stats)
		end

		GameLogic.ShowPopup(gui, logFrame, randomEvent)
	else
		UIBuilder.AddLogText(logFrame, "Nothing particularly bizarre happened this year.", Color3.fromRGB(150, 150, 150))
	end

	logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)
end

function GameLogic.ShowPopup(gui, logFrame, encounterData)
	local mainFrame = gui:WaitForChild("MainFrame")
	local popupOverlay = mainFrame:WaitForChild("PopupOverlay")
	local popupFrame = popupOverlay:WaitForChild("PopupFrame")
	local popupText = popupFrame:WaitForChild("PopupText")
	local optionsFrame = popupFrame:WaitForChild("OptionsFrame")

	local popupTextStr = type(encounterData.Text) == "function" and encounterData.Text(StatsManager.Stats) or encounterData.Text
	popupText.Text = popupTextStr
	UIBuilder.ClearOptions(optionsFrame)

	for _, option in ipairs(encounterData.Options) do
		local isAvailable = true
		if type(option.IsAvailable) == "function" then
			isAvailable = option.IsAvailable(StatsManager.Stats)
		end

		if isAvailable then
			local optText = type(option.Text) == "function" and option.Text(StatsManager.Stats) or option.Text
			local btn = UIBuilder.CreateOptionButton(optionsFrame, optText)
			btn.MouseButton1Click:Connect(function()
				popupOverlay.Visible = false
				GameLogic.ResolveEncounter(gui, logFrame, option)
			end)
		end
	end

	popupOverlay.Visible = true
end

function GameLogic.ResolveEncounter(gui, logFrame, option)
	local rollMax = 0
	for _, outcome in ipairs(option.Outcomes) do
		local w = type(outcome.Weight) == "function" and outcome.Weight(StatsManager.Stats) or outcome.Weight

		local score = 0
		if outcome.StatChanges then
			for k, v in pairs(outcome.StatChanges) do
				if type(v) == "number" and (k == "Happiness" or k == "Money" or k == "Intelligence" or k == "Strength" or k == "Body" or k == "LifeForce") then
					score = score + v
				end
			end
		end

		if score > 0 then
			w = w * (1 + ((StatsManager.Stats.Luck + StatsManager.Stats.Happiness) / 200))
		elseif score < 0 then
			w = w * (1 - ((StatsManager.Stats.Luck + StatsManager.Stats.Happiness) / 400))
		end

		outcome._calcWeight = math.max(w, 0.1)
		rollMax = rollMax + outcome._calcWeight
	end

	local roll = math.random() * rollMax
	local cumulative = 0
	local selectedOutcome = option.Outcomes[#option.Outcomes]

	for _, outcome in ipairs(option.Outcomes) do
		cumulative = cumulative + outcome._calcWeight
		if roll <= cumulative then
			selectedOutcome = outcome
			break
		end
	end

	local resText = type(selectedOutcome.ResultText) == "function" and selectedOutcome.ResultText(StatsManager.Stats) or selectedOutcome.ResultText
	UIBuilder.AddLogText(logFrame, resText, Color3.fromRGB(255, 255, 255))

	local preHealth = math.floor((StatsManager.Stats.Strength + StatsManager.Stats.Body + StatsManager.Stats.LifeForce) / 3)

	if selectedOutcome.StatChanges then
		for stat, value in pairs(selectedOutcome.StatChanges) do
			if stat == "Closeness" and StatsManager.Stats.EventTarget then
				StatsManager.Stats.EventTarget.Closeness = math.clamp(StatsManager.Stats.EventTarget.Closeness + value, 0, 100)
				local sign = value > 0 and "+" or ""
				local color = value > 0 and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(200, 50, 60)
				UIBuilder.AddLogText(logFrame, sign .. value .. " Closeness with " .. StatsManager.Stats.EventTarget.Name, color)
			elseif StatsManager.Stats[stat] ~= nil then
				if type(value) == "number" then
					StatsManager.Stats[stat] = StatsManager.Stats[stat] + value

					if StatsManager.MaxStats[stat] and StatsManager.Stats[stat] > StatsManager.MaxStats[stat] then
						StatsManager.Stats[stat] = StatsManager.MaxStats[stat]
					end

					local sign = value > 0 and "+" or ""
					local color = value > 0 and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(200, 50, 60)

					local hiddenStats = {LifeForce=true, Strength=true, Body=true, Luck=true, Bizarreness=true, LifespanRoll=true, Salary=true}
					if not hiddenStats[stat] then
						UIBuilder.AddLogText(logFrame, sign .. value .. " " .. stat, color)
					end
				elseif type(value) == "string" then
					if stat == "NewFriend" then
						local friendGender = math.random() > 0.5 and "Male" or "Female"
						local friendPool = friendGender == "Male" and StatsManager.FirstNames.Male or StatsManager.FirstNames.Female
						local fName = friendPool[math.random(1, #friendPool)]
						local lName = StatsManager.LastNames[math.random(1, #StatsManager.LastNames)]
						table.insert(StatsManager.Stats.Relationships, {
							Name = fName .. " " .. lName,
							Role = "Friend",
							Age = StatsManager.Stats.Age,
							Race = "Human",
							LifespanRoll = 0.8 + (math.random() * 0.2),
							IsDead = false,
							Gender = friendGender,
							Stand = "None",
							Closeness = math.random(40, 70)
						})
						UIBuilder.AddLogText(logFrame, "You made a new friend named " .. fName .. " " .. lName .. "!", Color3.fromRGB(100, 200, 255))
					else
						StatsManager.Stats[stat] = value
						if stat == "Stand" then
							UIBuilder.AddLogText(logFrame, "You awakened a Stand: " .. value .. "!", Color3.fromRGB(150, 150, 255))
						elseif stat == "Job" then
							UIBuilder.AddLogText(logFrame, "You were hired as a " .. value .. ".", Color3.fromRGB(80, 220, 100))
						else
							UIBuilder.AddLogText(logFrame, "You are now a " .. value .. "!", Color3.fromRGB(240, 200, 50))
						end
					end
				end
			end
		end
	end

	local postHealth = math.floor((StatsManager.Stats.Strength + StatsManager.Stats.Body + StatsManager.Stats.LifeForce) / 3)
	local healthDiff = postHealth - preHealth

	if healthDiff ~= 0 then
		local sign = healthDiff > 0 and "+" or ""
		local color = healthDiff > 0 and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(200, 50, 60)
		UIBuilder.AddLogText(logFrame, sign .. healthDiff .. " Health", color)
	end

	UIManager.UpdateStatsUI(gui, StatsManager)
	logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)

	if StatsManager.Stats.LifeForce <= 0 then
		StatsManager.Stats.LifeForce = 0
		UIManager.UpdateStatsUI(gui, StatsManager)
		GameLogic.Die(gui, logFrame, "Your life force faded away. You died.")
	end
end

return GameLogic