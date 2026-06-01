-- @ScriptType: ModuleScript
local UIManager = {}
local UIBuilder = require(script.Parent:WaitForChild("UIBuilder"))

function UIManager.UpdateStatsUI(gui, StatsManager)
	local mainFrame = gui:WaitForChild("MainFrame")
	local topBar = mainFrame:WaitForChild("TopBar")
	local statsFrame = mainFrame:WaitForChild("StatsFrame")

	topBar:WaitForChild("NameLabel").Text = StatsManager.Stats.FirstName .. " " .. StatsManager.Stats.LastName
	topBar:WaitForChild("YearLabel").Text = "Year: " .. StatsManager.Stats.Year
	topBar:WaitForChild("InfoLabel").Text = "Gender: " .. StatsManager.Stats.Gender .. " | Race: " .. StatsManager.Stats.Race
	topBar:WaitForChild("AgeLabel").Text = "Age: " .. StatsManager.Stats.Age
	topBar:WaitForChild("StandJobLabel").Text = "Stand: " .. StatsManager.Stats.Stand .. " | Job: " .. StatsManager.Stats.Job
	topBar:WaitForChild("BalanceLabel").Text = "Balance: $" .. StatsManager.Stats.Money

	local compositeHealth = math.floor((StatsManager.Stats.Strength + StatsManager.Stats.Body + StatsManager.Stats.LifeForce) / 3)

	local function updateBar(name, currentOverride)
		local container = statsFrame:FindFirstChild(name .. "Container")
		if container then
			local bg = container:WaitForChild("BarBackground")
			local fill = bg:WaitForChild("BarFill")
			local valLabel = bg:WaitForChild("ValueLabel")

			local current = currentOverride or StatsManager.Stats[name]
			local max = StatsManager.MaxStats[name] or 100
			local pct = math.clamp(current / max, 0, 1)

			fill.Size = UDim2.new(pct, 0, 1, 0)
			valLabel.Text = tostring(current) .. " / " .. tostring(max)
		end
	end

	updateBar("Health", compositeHealth)
	updateBar("Happiness")
	updateBar("Intelligence")
end

function UIManager.PopulateActions(listFrame, gui, logFrame, actOverlay, GameLogic, StatsManager)
	for _, child in ipairs(listFrame:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end

	local actions = {
		{
			Name = "Wander the Town",
			Desc = "Walk around the city. Who knows what you might find?",
			Callback = function()
				actOverlay.Visible = false
				GameLogic.ForceEncounter(gui, logFrame)
			end
		},
		{
			Name = "Read a Book",
			Desc = "Spend some time studying to increase your intelligence.",
			Callback = function()
				actOverlay.Visible = false
				StatsManager.Stats.Intelligence = math.clamp(StatsManager.Stats.Intelligence + math.random(2, 5), 0, 100)
				StatsManager.Stats.Happiness = math.clamp(StatsManager.Stats.Happiness - math.random(1, 3), 0, 100)
				UIBuilder.AddLogText(logFrame, "You spent a few hours reading. You feel slightly smarter.", Color3.fromRGB(150, 200, 255))
				UIManager.UpdateStatsUI(gui, StatsManager)
				logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)
			end
		},
		{
			Name = "Hit the Gym",
			Desc = "Work on your physical strength.",
			Callback = function()
				actOverlay.Visible = false
				StatsManager.Stats.Strength = math.clamp(StatsManager.Stats.Strength + math.random(2, 5), 0, 100)
				StatsManager.Stats.Happiness = math.clamp(StatsManager.Stats.Happiness - math.random(2, 4), 0, 100)
				UIBuilder.AddLogText(logFrame, "You pushed yourself at the gym. Your muscles ache, but you feel stronger.", Color3.fromRGB(150, 200, 255))
				UIManager.UpdateStatsUI(gui, StatsManager)
				logFrame.CanvasPosition = Vector2.new(0, logFrame.AbsoluteCanvasSize.Y)
			end
		}
	}

	for i, act in ipairs(actions) do
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, 0, 0, 80)
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		btn.BorderSizePixel = 0
		btn.Text = ""
		btn.LayoutOrder = i
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

		local title = Instance.new("TextLabel")
		title.Size = UDim2.new(1, -20, 0, 30)
		title.Position = UDim2.new(0, 10, 0, 10)
		title.BackgroundTransparency = 1
		title.Text = act.Name
		title.TextColor3 = Color3.fromRGB(255, 255, 255)
		title.TextSize = 20
		title.Font = Enum.Font.GothamBold
		title.TextXAlignment = Enum.TextXAlignment.Left
		title.Parent = btn

		local desc = Instance.new("TextLabel")
		desc.Size = UDim2.new(1, -20, 0, 30)
		desc.Position = UDim2.new(0, 10, 0, 40)
		desc.BackgroundTransparency = 1
		desc.Text = act.Desc
		desc.TextColor3 = Color3.fromRGB(200, 200, 200)
		desc.TextSize = 14
		desc.Font = Enum.Font.Gotham
		desc.TextXAlignment = Enum.TextXAlignment.Left
		desc.TextWrapped = true
		desc.Parent = btn

		btn.MouseButton1Click:Connect(act.Callback)
		btn.Parent = listFrame
	end
end

function UIManager.PopulateRelationships(listFrame, gui, logFrame, relOverlay, GameLogic, StatsManager)
	for _, child in ipairs(listFrame:GetChildren()) do
		if child:IsA("TextButton") or child:IsA("Frame") then
			child:Destroy()
		end
	end

	local cardControllers = {}

	for i, rel in ipairs(StatsManager.Stats.Relationships) do
		if not rel.IsDead then
			local item = Instance.new("TextButton")
			item.Size = UDim2.new(1, 0, 0, 100)
			item.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			item.BorderSizePixel = 0
			item.LayoutOrder = i
			item.Text = ""
			item.AutoButtonColor = false

			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0, 8)
			corner.Parent = item

			local nameLabel = Instance.new("TextLabel")
			nameLabel.Size = UDim2.new(1, -20, 0, 30)
			nameLabel.Position = UDim2.new(0, 10, 0, 5)
			nameLabel.BackgroundTransparency = 1
			nameLabel.Text = rel.Name .. " (" .. rel.Role .. ")"
			nameLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
			nameLabel.TextSize = 20
			nameLabel.Font = Enum.Font.GothamBold
			nameLabel.TextXAlignment = Enum.TextXAlignment.Left
			nameLabel.Parent = item

			local infoLabel = Instance.new("TextLabel")
			infoLabel.Size = UDim2.new(1, -20, 0, 20)
			infoLabel.Position = UDim2.new(0, 10, 0, 35)
			infoLabel.BackgroundTransparency = 1
			infoLabel.Text = "Age: " .. rel.Age .. " | Gender: " .. rel.Gender .. " | Race: " .. rel.Race .. " | Stand: " .. rel.Stand
			infoLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
			infoLabel.TextSize = 14
			infoLabel.Font = Enum.Font.Gotham
			infoLabel.TextXAlignment = Enum.TextXAlignment.Left
			infoLabel.Parent = item

			local closeTitle = Instance.new("TextLabel")
			closeTitle.Size = UDim2.new(0, 100, 0, 20)
			closeTitle.Position = UDim2.new(0, 10, 0, 65)
			closeTitle.BackgroundTransparency = 1
			closeTitle.Text = "Closeness:"
			closeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			closeTitle.TextSize = 14
			closeTitle.Font = Enum.Font.GothamBold
			closeTitle.TextXAlignment = Enum.TextXAlignment.Left
			closeTitle.Parent = item

			local barBg = Instance.new("Frame")
			barBg.Size = UDim2.new(1, -120, 0, 16)
			barBg.Position = UDim2.new(0, 110, 0, 67)
			barBg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			barBg.Parent = item
			Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 4)

			local barFill = Instance.new("Frame")
			local pct = math.clamp(rel.Closeness / 100, 0, 1)
			barFill.Size = UDim2.new(pct, 0, 1, 0)
			barFill.BackgroundColor3 = Color3.fromRGB(80, 220, 100)
			barFill.Parent = barBg
			Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 4)

			local buttonContainer = Instance.new("Frame")
			buttonContainer.Size = UDim2.new(1, -20, 0, 30)
			buttonContainer.Position = UDim2.new(0, 10, 0, 100)
			buttonContainer.BackgroundTransparency = 1
			buttonContainer.Visible = false
			buttonContainer.Parent = item

			local btnLayout = Instance.new("UIListLayout")
			btnLayout.FillDirection = Enum.FillDirection.Horizontal
			btnLayout.SortOrder = Enum.SortOrder.LayoutOrder
			btnLayout.Padding = UDim.new(0, 10)
			btnLayout.Parent = buttonContainer

			local function createActionBtn(text, order)
				local b = Instance.new("TextButton")
				b.Size = UDim2.new(0, 90, 1, 0)
				b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
				b.Text = text
				b.TextColor3 = Color3.fromRGB(255, 255, 255)
				b.Font = Enum.Font.Gotham
				b.TextSize = 13
				b.LayoutOrder = order
				Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
				b.Parent = buttonContainer
				return b
			end

			local talkBtn = createActionBtn("Talk", 1)
			local timeBtn = createActionBtn("Spend Time", 2)
			local compBtn = createActionBtn("Compliment", 3)

			local isExpanded = false

			local cardController = {
				Collapse = function()
					isExpanded = false
					item.Size = UDim2.new(1, 0, 0, 100)
					buttonContainer.Visible = false
				end
			}
			table.insert(cardControllers, cardController)

			item.MouseButton1Click:Connect(function()
				if isExpanded then
					cardController.Collapse()
				else
					for _, ctrl in ipairs(cardControllers) do ctrl.Collapse() end
					isExpanded = true
					item.Size = UDim2.new(1, 0, 0, 140)
					buttonContainer.Visible = true
				end
			end)

			local function doInteraction(actionName)
				relOverlay.Visible = false
				StatsManager.Stats.EventTarget = rel

				local encounter = {}

				if actionName == "Talk" then
					encounter = {
						Text = "You sit down to have a conversation with your " .. string.lower(rel.Role) .. ", " .. rel.Name .. ".",
						Options = {
							{Text="Discuss your day", Outcomes={{Weight=10, ResultText="You had a pleasant chat about recent events.", StatChanges={Closeness=3, Happiness=2}}}},
							{Text="Ask for advice", Outcomes={{Weight=8, ResultText="They gave you some solid life advice.", StatChanges={Closeness=5, Intelligence=2}}, {Weight=2, ResultText="They completely misunderstood your problem and gave bad advice.", StatChanges={Closeness=-2, Happiness=-3}}}}
						}
					}
				elseif actionName == "Spend Time" then
					encounter = {
						Text = "You ask your " .. string.lower(rel.Role) .. ", " .. rel.Name .. ", if they want to spend some time together.",
						Options = {
							{Text="Watch a movie", Outcomes={{Weight=10, ResultText="You watched a bizarre action movie together. It was fun!", StatChanges={Closeness=8, Happiness=5}}}},
							{Text="Go out to eat ($15)", IsAvailable=function(s) return s.Money>=15 end, Outcomes={{Weight=10, ResultText="You bought them lunch and bonded over a good meal.", StatChanges={Closeness=12, Happiness=10, Money=-15}}}},
							{Text="Go for a walk", Outcomes={{Weight=8, ResultText="You enjoyed a nice walk around town together.", StatChanges={Closeness=6, Body=2}}, {Weight=2, ResultText="It started raining unexpectedly and ruined the mood.", StatChanges={Closeness=-2, Happiness=-5}}}}
						}
					}
				elseif actionName == "Compliment" then
					encounter = {
						Text = "You walk up to your " .. string.lower(rel.Role) .. ", " .. rel.Name .. ", to give them a compliment.",
						Options = {
							{Text="Praise their outfit", Outcomes={{Weight=8, ResultText="They smiled broadly and thanked you.", StatChanges={Closeness=5, Happiness=2}}, {Weight=2, ResultText="They thought you were being sarcastic and rolled their eyes.", StatChanges={Closeness=-3, Happiness=-2}}}},
							{Text="Compliment their personality", Outcomes={{Weight=10, ResultText="They seemed genuinely touched by your kind words.", StatChanges={Closeness=8, Happiness=4}}}}
						}
					}
				end

				GameLogic.ShowPopup(gui, logFrame, encounter)
			end

			talkBtn.MouseButton1Click:Connect(function() doInteraction("Talk") end)
			timeBtn.MouseButton1Click:Connect(function() doInteraction("Spend Time") end)
			compBtn.MouseButton1Click:Connect(function() doInteraction("Compliment") end)

			item.Parent = listFrame
		end
	end
end

return UIManager