-- @ScriptType: ModuleScript
local GameLogic = {}
local UIBuilder = require(script.Parent:WaitForChild("UIBuilder"))
local EncounterData = require(script.Parent:WaitForChild("EncounterData"))

GameLogic.FirstNames = {
	Male = {
		"Jotaro", "Joseph", "Josuke", "Giorno", "Jonathan", "Dio", "Bruno", "Guido", "Narancia",
		"Koichi", "Okuyasu", "Rohan", "Caesar", "Kakyoin", "Polnareff", "Johnny", "Jodio",
		"Muhammad", "Iggy", "Hol", "Jail", "Weather", "Enrico", "Diavolo", "Vinegar", "Risotto",
		"Prosciutto", "Illuso", "Pesci", "Formaggio", "Melone", "Ghiaccio", "Leone", "Pannacotta",
		"Diego", "Gyro", "Funny", "Hot", "Sandman", "Jobin", "Tsurugi", "Norisuke", "Joshu",
		"James", "Robert", "Richard", "Thomas", "Charles", "Christopher", "Daniel", "Matthew",
		"Anthony", "Mark", "Donald", "Steven", "Paul", "Kenneth", "Kevin", "Brian", "George",
		"Edward", "Ronald", "Timothy", "Jason", "Jeffrey", "Ryan", "Gary", "Nicholas", "Eric", "Stephen"
	},
	Female = {
		"Jolyne", "Erina", "Lisa", "Suzi", "Holly", "Reimi", "Trish", "Hermes", "Lucy", "Yasuho",
		"Yukako", "Shizuka", "Tomoko", "Holy", "Anne", "Enya", "Mariah", "Midler", "Hot",
		"Sarah", "Emma", "Emily", "Jessica", "Ashley", "Amanda", "Megan", "Hannah", "Elizabeth",
		"Linda", "Barbara", "Susan", "Margaret", "Dorothy", "Alice", "Nancy", "Karen", "Betty",
		"Helen", "Sandra", "Donna", "Carol", "Ruth", "Sharon", "Michelle", "Laura", "Kimberly",
		"Deborah", "Cynthia", "Kathleen", "Amy", "Shirley", "Angela", "Anna", "Brenda", "Pamela"
	}
}

GameLogic.LastNames = {
	"Kujo", "Joestar", "Higashikata", "Giovanna", "Cujoh", "Brando", "Bucciarati", "Mista", "Ghirga", "Zeppeli",
	"Hirose", "Nijimura", "Kishibe", "Pendleton", "Pucci", "Joestar", "Anvol", "Kakyoin", "Polnareff",
	"Joestar", "Brando", "Zeppeli", "Speedwagon", "Stroheim", "Valentine", "Higashikata", "Kira",
	"Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Garcia", "Rodriguez", "Wilson",
	"Martinez", "Anderson", "Taylor", "Thomas", "Moore", "Jackson", "Martin", "Lee", "Perez", "Thompson",
	"White", "Harris", "Clark", "Lewis", "Robinson", "Walker", "Young", "Allen", "King", "Wright",
	"Scott", "Torres", "Nguyen", "Hill", "Flores", "Green", "Adams", "Nelson", "Baker", "Hall", "Steel"
}

GameLogic.StartingYears = {1868, 1920, 1971, 1983, 1992}

GameLogic.Stats = {
	IsDead = false,
	FirstName = "",
	LastName = "",
	Gender = "Male",
	Race = "Human",
	Stand = "None",
	Job = "Unemployed",
	Salary = 0,
	Year = 2026,
	Age = 0,
	Happiness = 100,
	Intelligence = 50,
	Money = 0,
	Strength = 50,
	Body = 100,
	LifeForce = 100,
	Luck = 50,
	Bizarreness = 0,
	LifespanRoll = 1.0,
	SeenEvents = {},
	Relationships = {}
}

GameLogic.MaxStats = {
	Happiness = 100,
	Intelligence = 100,
	Strength = 100,
	Body = 100,
	LifeForce = 100
}

function GameLogic.ResetStats()
	GameLogic.Stats.IsDead = false
	GameLogic.Stats.Gender = math.random() > 0.5 and "Male" or "Female"

	local namePool = GameLogic.Stats.Gender == "Male" and GameLogic.FirstNames.Male or GameLogic.FirstNames.Female
	GameLogic.Stats.FirstName = namePool[math.random(1, #namePool)]
	GameLogic.Stats.LastName = GameLogic.LastNames[math.random(1, #GameLogic.LastNames)]

	GameLogic.Stats.Race = "Human"
	GameLogic.Stats.Stand = "None"
	GameLogic.Stats.Job = "Unemployed"
	GameLogic.Stats.Salary = 0
	GameLogic.Stats.Year = GameLogic.StartingYears[math.random(1, #GameLogic.StartingYears)]
	GameLogic.Stats.Age = 0

	GameLogic.Stats.Happiness = 100
	GameLogic.Stats.Intelligence = math.random(20, 80)
	GameLogic.Stats.Money = 0

	GameLogic.Stats.Strength = math.random(20, 80)
	GameLogic.Stats.Body = math.random(40, 100)
	GameLogic.Stats.LifeForce = math.random(50, 100)

	GameLogic.Stats.Luck = math.random(1, 100)
	GameLogic.Stats.Bizarreness = 0
	GameLogic.Stats.LifespanRoll = 0.8 + (math.random() * 0.2)

	GameLogic.Stats.SeenEvents = {}

	local fatherFirstName = GameLogic.FirstNames.Male[math.random(1, #GameLogic.FirstNames.Male)]
	local motherFirstName = GameLogic.FirstNames.Female[math.random(1, #GameLogic.FirstNames.Female)]

	GameLogic.Stats.Relationships = {
		{Name = fatherFirstName .. " " .. GameLogic.Stats.LastName, Role = "Father", Age = math.random(22, 45), Race = "Human", LifespanRoll = 0.8 + (math.random() * 0.2), IsDead = false},
		{Name = motherFirstName .. " " .. GameLogic.Stats.LastName, Role = "Mother", Age = math.random(20, 42), Race = "Human", LifespanRoll = 0.8 + (math.random() * 0.2), IsDead = false}
	}
end

function GameLogic.UpdateStatsUI(gui)
	local mainFrame = gui:WaitForChild("MainFrame")
	local topBar = mainFrame:WaitForChild("TopBar")
	local statsFrame = mainFrame:WaitForChild("StatsFrame")

	topBar:WaitForChild("NameLabel").Text = GameLogic.Stats.FirstName .. " " .. GameLogic.Stats.LastName
	topBar:WaitForChild("YearLabel").Text = "Year: " .. GameLogic.Stats.Year
	topBar:WaitForChild("InfoLabel").Text = "Gender: " .. GameLogic.Stats.Gender .. " | Race: " .. GameLogic.Stats.Race
	topBar:WaitForChild("AgeLabel").Text = "Age: " .. GameLogic.Stats.Age
	topBar:WaitForChild("StandJobLabel").Text = "Stand: " .. GameLogic.Stats.Stand .. " | Job: " .. GameLogic.Stats.Job
	topBar:WaitForChild("BalanceLabel").Text = "Balance: $" .. GameLogic.Stats.Money

	local compositeHealth = math.floor((GameLogic.Stats.Strength + GameLogic.Stats.Body + GameLogic.Stats.LifeForce) / 3)

	local function updateBar(name, currentOverride)
		local container = statsFrame:FindFirstChild(name .. "Container")
		if container then
			local bg = container:WaitForChild("BarBackground")
			local fill = bg:WaitForChild("BarFill")
			local valLabel = bg:WaitForChild("ValueLabel")

			local current = currentOverride or GameLogic.Stats[name]
			local max = GameLogic.MaxStats[name] or 100
			local pct = math.clamp(current / max, 0, 1)

			fill.Size = UDim2.new(pct, 0, 1, 0)
			valLabel.Text = tostring(current) .. " / " .. tostring(max)
		end
	end

	updateBar("Health", compositeHealth)
	updateBar("Happiness")
	updateBar("Intelligence")
end

function GameLogic.Start(player)
	GameLogic.ResetStats()
	local gui = UIBuilder.Build(player)
	local mainFrame = gui:WaitForChild("MainFrame")
	local actionFrame = mainFrame:WaitForChild("ActionFrame")
	local ageUpButton = actionFrame:WaitForChild("AgeUpButton")

	local relButton = actionFrame:WaitForChild("RelationshipsButton")
	local relOverlay = mainFrame:WaitForChild("RelationshipsOverlay")
	local relCloseBtn = relOverlay:WaitForChild("RelationshipsFrame"):WaitForChild("CloseButton")
	local relListFrame = relOverlay:WaitForChild("RelationshipsFrame"):WaitForChild("ListFrame")

	GameLogic.UpdateStatsUI(gui)

	local logFrame = mainFrame:WaitForChild("LogFrame")
	UIBuilder.AddLogTitle(logFrame, "YEAR " .. GameLogic.Stats.Year)
	UIBuilder.AddLogText(logFrame, "You were born into a bizarre world as " .. GameLogic.Stats.FirstName .. " " .. GameLogic.Stats.LastName .. ".", Color3.fromRGB(220, 220, 220))

	ageUpButton.MouseButton1Click:Connect(function()
		local popupOverlay = mainFrame:WaitForChild("PopupOverlay")
		if popupOverlay.Visible or relOverlay.Visible then return end

		if GameLogic.Stats.IsDead then
			GameLogic.RestartGame(gui, logFrame)
		else
			GameLogic.AgeUp(gui, logFrame)
		end
	end)

	relButton.MouseButton1Click:Connect(function()
		local popupOverlay = mainFrame:WaitForChild("PopupOverlay")
		if popupOverlay.Visible then return end

		UIBuilder.UpdateRelationshipsMenu(relListFrame, GameLogic.Stats.Relationships)
		relOverlay.Visible = true
	end)

	relCloseBtn.MouseButton1Click:Connect(function()
		relOverlay.Visible = false
	end)
end

function GameLogic.RestartGame(gui, logFrame)
	GameLogic.ResetStats()
	UIBuilder.ClearLogs(logFrame)

	local mainFrame = gui:WaitForChild("MainFrame")
	local actionFrame = mainFrame:WaitForChild("ActionFrame")
	local ageUpButton = actionFrame:WaitForChild("AgeUpButton")

	ageUpButton.Text = "AGE UP"
	ageUpButton.BackgroundColor3 = Color3.fromRGB(80, 30, 140)

	GameLogic.UpdateStatsUI(gui)
	UIBuilder.AddLogTitle(logFrame, "YEAR " .. GameLogic.Stats.Year)
	UIBuilder.AddLogText(logFrame, "You were born anew as " .. GameLogic.Stats.FirstName .. " " .. GameLogic.Stats.LastName .. ".", Color3.fromRGB(220, 220, 220))
end

function GameLogic.Die(gui, logFrame, reason)
	GameLogic.Stats.IsDead = true
	UIBuilder.AddLogTitle(logFrame, "DEATH")
	UIBuilder.AddLogText(logFrame, reason, Color3.fromRGB(220, 60, 60))

	local mainFrame = gui:WaitForChild("MainFrame")
	local actionFrame = mainFrame:WaitForChild("ActionFrame")
	local ageUpButton = actionFrame:WaitForChild("AgeUpButton")

	ageUpButton.Text = "PLAY AGAIN"
	ageUpButton.BackgroundColor3 = Color3.fromRGB(200, 50, 60)
	logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)
end

function GameLogic.AgeUp(gui, logFrame)
	GameLogic.Stats.Age = GameLogic.Stats.Age + 1
	GameLogic.Stats.Year = GameLogic.Stats.Year + 1

	local deadRelative = nil

	if GameLogic.Stats.Relationships then
		for _, rel in ipairs(GameLogic.Stats.Relationships) do
			if not rel.IsDead then
				rel.Age = rel.Age + 1

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

	GameLogic.Stats.LifeForce = math.min(100, GameLogic.Stats.LifeForce + 10)

	UIBuilder.AddLogTitle(logFrame, "AGE " .. GameLogic.Stats.Age .. " - " .. GameLogic.Stats.Year)

	if GameLogic.Stats.Salary > 0 then
		GameLogic.Stats.Money = GameLogic.Stats.Money + GameLogic.Stats.Salary
		UIBuilder.AddLogText(logFrame, "You earned $" .. GameLogic.Stats.Salary .. " from your job.", Color3.fromRGB(80, 220, 100))
	end

	GameLogic.UpdateStatsUI(gui)

	local raceMaxAges = { Human = 110, ["Hamon User"] = 150, Zombie = 200, Vampire = 300 }
	local maxAgeForRace = raceMaxAges[GameLogic.Stats.Race] or 110
	local actualLifespan = math.floor(maxAgeForRace * GameLogic.Stats.LifespanRoll)

	if GameLogic.Stats.Age > actualLifespan then
		GameLogic.Die(gui, logFrame, "Your natural lifespan has been reached. You passed away.")
		return
	end

	if deadRelative then
		local deathEncounter = {
			Text = "Tragedy strikes. Your " .. deadRelative.Role .. ", " .. deadRelative.Name .. ", has passed away at the age of " .. deadRelative.Age .. ".",
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
			isAvailable = event.IsAvailable(GameLogic.Stats)
		end

		if GameLogic.Stats.Age >= minAge and GameLogic.Stats.Age <= maxAge and GameLogic.Stats.Year >= minYear and GameLogic.Stats.Year <= maxYear and isAvailable then
			table.insert(validEvents, event)
			if not GameLogic.Stats.SeenEvents[event.Text] then
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
				ew = 1 + (GameLogic.Stats.Bizarreness / 20)
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

		GameLogic.Stats.SeenEvents[randomEvent.Text] = true
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

	popupText.Text = encounterData.Text
	UIBuilder.ClearOptions(optionsFrame)

	for _, option in ipairs(encounterData.Options) do
		local isAvailable = true
		if type(option.IsAvailable) == "function" then
			isAvailable = option.IsAvailable(GameLogic.Stats)
		end

		if isAvailable then
			local btn = UIBuilder.CreateOptionButton(optionsFrame, option.Text)
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
		local w = type(outcome.Weight) == "function" and outcome.Weight(GameLogic.Stats) or outcome.Weight

		local score = 0
		if outcome.StatChanges then
			for k, v in pairs(outcome.StatChanges) do
				if type(v) == "number" and (k == "Happiness" or k == "Money" or k == "Intelligence" or k == "Strength" or k == "Body" or k == "LifeForce") then
					score = score + v
				end
			end
		end

		if score > 0 then
			w = w * (1 + ((GameLogic.Stats.Luck + GameLogic.Stats.Happiness) / 200))
		elseif score < 0 then
			w = w * (1 - ((GameLogic.Stats.Luck + GameLogic.Stats.Happiness) / 400))
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

	UIBuilder.AddLogText(logFrame, selectedOutcome.ResultText, Color3.fromRGB(255, 255, 255))

	local preHealth = math.floor((GameLogic.Stats.Strength + GameLogic.Stats.Body + GameLogic.Stats.LifeForce) / 3)

	if selectedOutcome.StatChanges then
		for stat, value in pairs(selectedOutcome.StatChanges) do
			if GameLogic.Stats[stat] ~= nil then
				if type(value) == "number" then
					GameLogic.Stats[stat] = GameLogic.Stats[stat] + value

					if GameLogic.MaxStats[stat] and GameLogic.Stats[stat] > GameLogic.MaxStats[stat] then
						GameLogic.Stats[stat] = GameLogic.MaxStats[stat]
					end

					local sign = value > 0 and "+" or ""
					local color = value > 0 and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(200, 50, 60)

					local hiddenStats = {LifeForce=true, Strength=true, Body=true, Luck=true, Bizarreness=true, LifespanRoll=true, Salary=true}
					if not hiddenStats[stat] then
						UIBuilder.AddLogText(logFrame, sign .. value .. " " .. stat, color)
					end
				elseif type(value) == "string" then
					GameLogic.Stats[stat] = value
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

	local postHealth = math.floor((GameLogic.Stats.Strength + GameLogic.Stats.Body + GameLogic.Stats.LifeForce) / 3)
	local healthDiff = postHealth - preHealth

	if healthDiff ~= 0 then
		local sign = healthDiff > 0 and "+" or ""
		local color = healthDiff > 0 and Color3.fromRGB(80, 220, 100) or Color3.fromRGB(200, 50, 60)
		UIBuilder.AddLogText(logFrame, sign .. healthDiff .. " Health", color)
	end

	GameLogic.UpdateStatsUI(gui)
	logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)

	if GameLogic.Stats.LifeForce <= 0 then
		GameLogic.Stats.LifeForce = 0
		GameLogic.UpdateStatsUI(gui)
		GameLogic.Die(gui, logFrame, "Your life force faded away. You died.")
	end
end

return GameLogic