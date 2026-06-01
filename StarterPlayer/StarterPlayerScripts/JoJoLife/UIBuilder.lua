-- @ScriptType: ModuleScript
local UIBuilder = {}

function UIBuilder.Build(player)
	local bgGui = Instance.new("ScreenGui")
	bgGui.Name = "JoJoLifeBgGui"
	bgGui.ResetOnSpawn = false
	bgGui.IgnoreGuiInset = true
	bgGui.DisplayOrder = 0
	bgGui.Parent = player:WaitForChild("PlayerGui")

	local bgFrame = Instance.new("Frame")
	bgFrame.Name = "BackgroundFrame"
	bgFrame.Size = UDim2.new(1, 0, 1, 0)
	bgFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
	bgFrame.BorderSizePixel = 0
	bgFrame.Parent = bgGui

	local gui = Instance.new("ScreenGui")
	gui.Name = "JoJoLifeGui"
	gui.ResetOnSpawn = false
	gui.IgnoreGuiInset = false
	gui.DisplayOrder = 1
	gui.Parent = player:WaitForChild("PlayerGui")

	local mainFrame = Instance.new("Frame")
	mainFrame.Name = "MainFrame"
	mainFrame.Size = UDim2.new(1, 0, 1, 0)
	mainFrame.Position = UDim2.new(0, 0, 0, 0)
	mainFrame.BackgroundTransparency = 1
	mainFrame.BorderSizePixel = 0
	mainFrame.Parent = gui

	local topBar = Instance.new("Frame")
	topBar.Name = "TopBar"
	topBar.Size = UDim2.new(1, -20, 0.18, 0)
	topBar.Position = UDim2.new(0, 10, 0.02, 0)
	topBar.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
	topBar.BorderSizePixel = 0
	topBar.Parent = mainFrame

	local topBarCorner = Instance.new("UICorner")
	topBarCorner.CornerRadius = UDim.new(0, 8)
	topBarCorner.Parent = topBar

	local topBarStroke = Instance.new("UIStroke")
	topBarStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	topBarStroke.Color = Color3.fromRGB(45, 45, 55)
	topBarStroke.Thickness = 1
	topBarStroke.Parent = topBar

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Name = "NameLabel"
	nameLabel.Size = UDim2.new(0.45, 0, 0.25, 0)
	nameLabel.Position = UDim2.new(0.025, 0, 0.05, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.TextScaled = true
	nameLabel.Font = Enum.Font.GothamBold
	nameLabel.TextXAlignment = Enum.TextXAlignment.Left
	nameLabel.Parent = topBar

	local yearLabel = Instance.new("TextLabel")
	yearLabel.Name = "YearLabel"
	yearLabel.Size = UDim2.new(0.45, 0, 0.25, 0)
	yearLabel.Position = UDim2.new(0.525, 0, 0.05, 0)
	yearLabel.BackgroundTransparency = 1
	yearLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	yearLabel.TextScaled = true
	yearLabel.Font = Enum.Font.GothamBold
	yearLabel.TextXAlignment = Enum.TextXAlignment.Right
	yearLabel.Parent = topBar

	local infoLabel = Instance.new("TextLabel")
	infoLabel.Name = "InfoLabel"
	infoLabel.Size = UDim2.new(0.45, 0, 0.25, 0)
	infoLabel.Position = UDim2.new(0.025, 0, 0.35, 0)
	infoLabel.BackgroundTransparency = 1
	infoLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
	infoLabel.TextScaled = true
	infoLabel.Font = Enum.Font.Gotham
	infoLabel.TextXAlignment = Enum.TextXAlignment.Left
	infoLabel.Parent = topBar

	local ageLabel = Instance.new("TextLabel")
	ageLabel.Name = "AgeLabel"
	ageLabel.Size = UDim2.new(0.45, 0, 0.25, 0)
	ageLabel.Position = UDim2.new(0.525, 0, 0.35, 0)
	ageLabel.BackgroundTransparency = 1
	ageLabel.TextColor3 = Color3.fromRGB(240, 200, 50)
	ageLabel.TextScaled = true
	ageLabel.Font = Enum.Font.GothamBold
	ageLabel.TextXAlignment = Enum.TextXAlignment.Right
	ageLabel.Parent = topBar

	local standJobLabel = Instance.new("TextLabel")
	standJobLabel.Name = "StandJobLabel"
	standJobLabel.Size = UDim2.new(0.45, 0, 0.25, 0)
	standJobLabel.Position = UDim2.new(0.025, 0, 0.65, 0)
	standJobLabel.BackgroundTransparency = 1
	standJobLabel.TextColor3 = Color3.fromRGB(150, 150, 255)
	standJobLabel.TextScaled = true
	standJobLabel.Font = Enum.Font.Gotham
	standJobLabel.TextXAlignment = Enum.TextXAlignment.Left
	standJobLabel.Parent = topBar

	local balanceLabel = Instance.new("TextLabel")
	balanceLabel.Name = "BalanceLabel"
	balanceLabel.Size = UDim2.new(0.45, 0, 0.25, 0)
	balanceLabel.Position = UDim2.new(0.525, 0, 0.65, 0)
	balanceLabel.BackgroundTransparency = 1
	balanceLabel.TextColor3 = Color3.fromRGB(80, 220, 100)
	balanceLabel.TextScaled = true
	balanceLabel.Font = Enum.Font.GothamBold
	balanceLabel.TextXAlignment = Enum.TextXAlignment.Right
	balanceLabel.Parent = topBar

	local statsFrame = Instance.new("Frame")
	statsFrame.Name = "StatsFrame"
	statsFrame.Size = UDim2.new(0.95, 0, 0.2, 0)
	statsFrame.Position = UDim2.new(0.025, 0, 0.22, 0)
	statsFrame.BackgroundTransparency = 1
	statsFrame.Parent = mainFrame

	local uiListLayoutStats = Instance.new("UIListLayout")
	uiListLayoutStats.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayoutStats.FillDirection = Enum.FillDirection.Vertical
	uiListLayoutStats.Padding = UDim.new(0, 10)
	uiListLayoutStats.Parent = statsFrame

	local function createStatBar(name, color)
		local container = Instance.new("Frame")
		container.Name = name .. "Container"
		container.Size = UDim2.new(1, 0, 0.25, 0)
		container.BackgroundTransparency = 1
		container.Parent = statsFrame

		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Size = UDim2.new(0.2, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.TextColor3 = Color3.fromRGB(220, 220, 220)
		label.TextScaled = true
		label.Font = Enum.Font.GothamMedium
		label.Text = name
		label.TextXAlignment = Enum.TextXAlignment.Right
		label.Parent = container

		local barBackground = Instance.new("Frame")
		barBackground.Name = "BarBackground"
		barBackground.Size = UDim2.new(0.75, 0, 0.8, 0)
		barBackground.Position = UDim2.new(0.22, 0, 0.1, 0)
		barBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
		barBackground.BorderSizePixel = 0
		barBackground.Parent = container

		local cornerBg = Instance.new("UICorner")
		cornerBg.CornerRadius = UDim.new(0, 6)
		cornerBg.Parent = barBackground

		local strokeBg = Instance.new("UIStroke")
		strokeBg.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		strokeBg.Color = Color3.fromRGB(50, 50, 60)
		strokeBg.Thickness = 1
		strokeBg.Parent = barBackground

		local barFill = Instance.new("Frame")
		barFill.Name = "BarFill"
		barFill.Size = UDim2.new(0, 0, 1, 0)
		barFill.BackgroundColor3 = color
		barFill.BorderSizePixel = 0
		barFill.Parent = barBackground

		local cornerFill = Instance.new("UICorner")
		cornerFill.CornerRadius = UDim.new(0, 6)
		cornerFill.Parent = barFill

		local valueLabel = Instance.new("TextLabel")
		valueLabel.Name = "ValueLabel"
		valueLabel.Size = UDim2.new(1, 0, 1, 0)
		valueLabel.BackgroundTransparency = 1
		valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		valueLabel.TextScaled = true
		valueLabel.Font = Enum.Font.GothamBold
		valueLabel.Parent = barBackground
	end

	createStatBar("Health", Color3.fromRGB(200, 50, 60))
	createStatBar("Happiness", Color3.fromRGB(220, 180, 40))
	createStatBar("Intelligence", Color3.fromRGB(50, 140, 220))

	local logFrame = Instance.new("ScrollingFrame")
	logFrame.Name = "LogFrame"
	logFrame.Size = UDim2.new(1, -20, 0.4, 0)
	logFrame.Position = UDim2.new(0, 10, 0.43, 0)
	logFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
	logFrame.BorderSizePixel = 0
	logFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	logFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	logFrame.ScrollBarThickness = 6
	logFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 70)
	logFrame.Parent = mainFrame

	local cornerLog = Instance.new("UICorner")
	cornerLog.CornerRadius = UDim.new(0, 8)
	cornerLog.Parent = logFrame

	local logStroke = Instance.new("UIStroke")
	logStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	logStroke.Color = Color3.fromRGB(45, 45, 55)
	logStroke.Thickness = 1
	logStroke.Parent = logFrame

	local uiListLayoutLog = Instance.new("UIListLayout")
	uiListLayoutLog.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayoutLog.Padding = UDim.new(0, 8)
	uiListLayoutLog.Parent = logFrame

	local uiPaddingLog = Instance.new("UIPadding")
	uiPaddingLog.PaddingLeft = UDim.new(0, 15)
	uiPaddingLog.PaddingRight = UDim.new(0, 15)
	uiPaddingLog.PaddingTop = UDim.new(0, 15)
	uiPaddingLog.PaddingBottom = UDim.new(0, 15)
	uiPaddingLog.Parent = logFrame

	local actionFrame = Instance.new("Frame")
	actionFrame.Name = "ActionFrame"
	actionFrame.Size = UDim2.new(1, 0, 0.13, 0)
	actionFrame.Position = UDim2.new(0, 0, 0.85, 0)
	actionFrame.BackgroundTransparency = 1
	actionFrame.BorderSizePixel = 0
	actionFrame.Parent = mainFrame

	local ageUpButton = Instance.new("TextButton")
	ageUpButton.Name = "AgeUpButton"
	ageUpButton.Size = UDim2.new(0.3, 0, 0.6, 0)
	ageUpButton.Position = UDim2.new(0.35, 0, 0.2, 0)
	ageUpButton.BackgroundColor3 = Color3.fromRGB(80, 30, 140)
	ageUpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ageUpButton.Text = "AGE UP"
	ageUpButton.Font = Enum.Font.GothamBlack
	ageUpButton.TextScaled = true
	ageUpButton.BorderSizePixel = 0
	ageUpButton.Parent = actionFrame

	local cornerBtn = Instance.new("UICorner")
	cornerBtn.CornerRadius = UDim.new(0, 8)
	cornerBtn.Parent = ageUpButton

	local btnStroke = Instance.new("UIStroke")
	btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	btnStroke.Color = Color3.fromRGB(120, 60, 200)
	btnStroke.Thickness = 2
	btnStroke.Parent = ageUpButton

	local relButton = Instance.new("TextButton")
	relButton.Name = "RelationshipsButton"
	relButton.Size = UDim2.new(0.2, 0, 0.45, 0)
	relButton.Position = UDim2.new(0.1, 0, 0.275, 0)
	relButton.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
	relButton.TextColor3 = Color3.fromRGB(220, 220, 220)
	relButton.Text = "RELATIONSHIPS"
	relButton.Font = Enum.Font.GothamBold
	relButton.TextScaled = true
	relButton.BorderSizePixel = 0
	relButton.Parent = actionFrame

	local cornerRelBtn = Instance.new("UICorner")
	cornerRelBtn.CornerRadius = UDim.new(0, 8)
	cornerRelBtn.Parent = relButton

	local relBtnStroke = Instance.new("UIStroke")
	relBtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	relBtnStroke.Color = Color3.fromRGB(60, 60, 75)
	relBtnStroke.Thickness = 1
	relBtnStroke.Parent = relButton

	local popupOverlay = Instance.new("Frame")
	popupOverlay.Name = "PopupOverlay"
	popupOverlay.Size = UDim2.new(1, 0, 1, 0)
	popupOverlay.Position = UDim2.new(0, 0, 0, 0)
	popupOverlay.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
	popupOverlay.BackgroundTransparency = 0.6
	popupOverlay.Visible = false
	popupOverlay.Active = true
	popupOverlay.Parent = mainFrame

	local popupFrame = Instance.new("Frame")
	popupFrame.Name = "PopupFrame"
	popupFrame.Size = UDim2.new(0.9, 0, 0.85, 0)
	popupFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	popupFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	popupFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
	popupFrame.BorderSizePixel = 0
	popupFrame.Parent = popupOverlay

	local popupConstraint = Instance.new("UISizeConstraint")
	popupConstraint.MaxSize = Vector2.new(600, 500)
	popupConstraint.Parent = popupFrame

	local cornerPopup = Instance.new("UICorner")
	cornerPopup.CornerRadius = UDim.new(0, 12)
	cornerPopup.Parent = popupFrame

	local popupStroke = Instance.new("UIStroke")
	popupStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	popupStroke.Color = Color3.fromRGB(60, 60, 75)
	popupStroke.Thickness = 2
	popupStroke.Parent = popupFrame

	local popupText = Instance.new("TextLabel")
	popupText.Name = "PopupText"
	popupText.Size = UDim2.new(1, -40, 0.35, 0)
	popupText.Position = UDim2.new(0, 20, 0, 15)
	popupText.BackgroundTransparency = 1
	popupText.TextColor3 = Color3.fromRGB(240, 240, 240)
	popupText.TextScaled = true
	popupText.Font = Enum.Font.GothamBold
	popupText.TextWrapped = true
	popupText.Parent = popupFrame

	local optionsFrame = Instance.new("ScrollingFrame")
	optionsFrame.Name = "OptionsFrame"
	optionsFrame.Size = UDim2.new(1, -40, 0.6, -20)
	optionsFrame.Position = UDim2.new(0, 20, 0.4, 0)
	optionsFrame.BackgroundTransparency = 1
	optionsFrame.ScrollBarThickness = 4
	optionsFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 95)
	optionsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	optionsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	optionsFrame.Parent = popupFrame

	local uiPaddingOptions = Instance.new("UIPadding")
	uiPaddingOptions.PaddingLeft = UDim.new(0, 4)
	uiPaddingOptions.PaddingRight = UDim.new(0, 4)
	uiPaddingOptions.PaddingTop = UDim.new(0, 4)
	uiPaddingOptions.PaddingBottom = UDim.new(0, 4)
	uiPaddingOptions.Parent = optionsFrame

	local uiListLayoutOptions = Instance.new("UIListLayout")
	uiListLayoutOptions.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayoutOptions.FillDirection = Enum.FillDirection.Vertical
	uiListLayoutOptions.Padding = UDim.new(0, 12)
	uiListLayoutOptions.Parent = optionsFrame

	local relOverlay = Instance.new("Frame")
	relOverlay.Name = "RelationshipsOverlay"
	relOverlay.Size = UDim2.new(1, 0, 1, 0)
	relOverlay.Position = UDim2.new(0, 0, 0, 0)
	relOverlay.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
	relOverlay.BackgroundTransparency = 0.6
	relOverlay.Visible = false
	relOverlay.Active = true
	relOverlay.Parent = mainFrame

	local relFrame = Instance.new("Frame")
	relFrame.Name = "RelationshipsFrame"
	relFrame.Size = UDim2.new(0.9, 0, 0.85, 0)
	relFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	relFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	relFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
	relFrame.BorderSizePixel = 0
	relFrame.Parent = relOverlay

	local relConstraint = Instance.new("UISizeConstraint")
	relConstraint.MaxSize = Vector2.new(600, 500)
	relConstraint.Parent = relFrame

	local relCorner = Instance.new("UICorner")
	relCorner.CornerRadius = UDim.new(0, 12)
	relCorner.Parent = relFrame

	local relStroke = Instance.new("UIStroke")
	relStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	relStroke.Color = Color3.fromRGB(60, 60, 75)
	relStroke.Thickness = 2
	relStroke.Parent = relFrame

	local relTitle = Instance.new("TextLabel")
	relTitle.Name = "Title"
	relTitle.Size = UDim2.new(1, -60, 0, 40)
	relTitle.Position = UDim2.new(0, 20, 0, 10)
	relTitle.BackgroundTransparency = 1
	relTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	relTitle.Text = "Relationships"
	relTitle.Font = Enum.Font.GothamBlack
	relTitle.TextSize = 24
	relTitle.TextXAlignment = Enum.TextXAlignment.Left
	relTitle.Parent = relFrame

	local closeRelBtn = Instance.new("TextButton")
	closeRelBtn.Name = "CloseButton"
	closeRelBtn.Size = UDim2.new(0, 40, 0, 40)
	closeRelBtn.Position = UDim2.new(1, -50, 0, 10)
	closeRelBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 60)
	closeRelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeRelBtn.Text = "X"
	closeRelBtn.Font = Enum.Font.GothamBold
	closeRelBtn.TextSize = 20
	closeRelBtn.Parent = relFrame

	local closeRelCorner = Instance.new("UICorner")
	closeRelCorner.CornerRadius = UDim.new(0, 8)
	closeRelCorner.Parent = closeRelBtn

	local relListFrame = Instance.new("ScrollingFrame")
	relListFrame.Name = "ListFrame"
	relListFrame.Size = UDim2.new(1, -40, 1, -70)
	relListFrame.Position = UDim2.new(0, 20, 0, 60)
	relListFrame.BackgroundTransparency = 1
	relListFrame.ScrollBarThickness = 6
	relListFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 95)
	relListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	relListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	relListFrame.Parent = relFrame

	local uiPaddingRel = Instance.new("UIPadding")
	uiPaddingRel.PaddingLeft = UDim.new(0, 4)
	uiPaddingRel.PaddingRight = UDim.new(0, 4)
	uiPaddingRel.PaddingTop = UDim.new(0, 4)
	uiPaddingRel.PaddingBottom = UDim.new(0, 4)
	uiPaddingRel.Parent = relListFrame

	local uiListLayoutRel = Instance.new("UIListLayout")
	uiListLayoutRel.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayoutRel.FillDirection = Enum.FillDirection.Vertical
	uiListLayoutRel.Padding = UDim.new(0, 10)
	uiListLayoutRel.Parent = relListFrame

	return gui
end

function UIBuilder.AddLogTitle(logFrame, text)
	local logEntry = Instance.new("TextLabel")
	logEntry.Size = UDim2.new(1, 0, 0, 40)
	logEntry.BackgroundTransparency = 1
	logEntry.TextColor3 = Color3.fromRGB(255, 215, 0)
	logEntry.Text = text
	logEntry.TextXAlignment = Enum.TextXAlignment.Left
	logEntry.Font = Enum.Font.GothamBlack
	logEntry.TextSize = 28
	logEntry.Parent = logFrame
end

function UIBuilder.AddLogText(logFrame, text, color)
	local logEntry = Instance.new("TextLabel")
	logEntry.Size = UDim2.new(1, 0, 0, 22)
	logEntry.BackgroundTransparency = 1
	logEntry.TextColor3 = color or Color3.fromRGB(200, 200, 210)
	logEntry.Text = text
	logEntry.TextXAlignment = Enum.TextXAlignment.Left
	logEntry.Font = Enum.Font.Gotham
	logEntry.TextSize = 18
	logEntry.TextWrapped = true
	logEntry.AutomaticSize = Enum.AutomaticSize.Y
	logEntry.Parent = logFrame
end

function UIBuilder.ClearOptions(optionsFrame)
	for _, child in ipairs(optionsFrame:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
end

function UIBuilder.ClearLogs(logFrame)
	for _, child in ipairs(logFrame:GetChildren()) do
		if child:IsA("TextLabel") then
			child:Destroy()
		end
	end
end

function UIBuilder.CreateOptionButton(optionsFrame, text)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 48)
	btn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
	btn.TextColor3 = Color3.fromRGB(230, 230, 240)
	btn.Text = text
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 20
	btn.BorderSizePixel = 0
	btn.Parent = optionsFrame

	local cornerBtn = Instance.new("UICorner")
	cornerBtn.CornerRadius = UDim.new(0, 6)
	cornerBtn.Parent = btn

	local btnStroke = Instance.new("UIStroke")
	btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	btnStroke.Color = Color3.fromRGB(65, 65, 80)
	btnStroke.Thickness = 1
	btnStroke.Parent = btn

	return btn
end

function UIBuilder.UpdateRelationshipsMenu(listFrame, relationships)
	for _, child in ipairs(listFrame:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end

	if not relationships or #relationships == 0 then
		local emptyLabel = Instance.new("TextLabel")
		emptyLabel.Size = UDim2.new(1, 0, 0, 40)
		emptyLabel.BackgroundTransparency = 1
		emptyLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
		emptyLabel.Text = "You have no relationships."
		emptyLabel.Font = Enum.Font.GothamMedium
		emptyLabel.TextSize = 18
		emptyLabel.Parent = listFrame
		return
	end

	for _, rel in ipairs(relationships) do
		local entryFrame = Instance.new("Frame")
		entryFrame.Size = UDim2.new(1, 0, 0, 50)
		entryFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
		entryFrame.BorderSizePixel = 0
		entryFrame.Parent = listFrame

		local entryCorner = Instance.new("UICorner")
		entryCorner.CornerRadius = UDim.new(0, 6)
		entryCorner.Parent = entryFrame

		local entryStroke = Instance.new("UIStroke")
		entryStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		entryStroke.Color = Color3.fromRGB(50, 50, 60)
		entryStroke.Thickness = 1
		entryStroke.Parent = entryFrame

		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, -20, 1, 0)
		textLabel.Position = UDim2.new(0, 10, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Font = Enum.Font.GothamMedium
		textLabel.TextSize = 18
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = entryFrame

		if rel.IsDead then
			textLabel.Text = rel.Role .. " - " .. rel.Name .. " (Deceased)"
			textLabel.TextColor3 = Color3.fromRGB(120, 120, 130)
		else
			textLabel.Text = rel.Role .. " - " .. rel.Name .. " (Age: " .. rel.Age .. ")"
			textLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
		end
	end
end

return UIBuilder