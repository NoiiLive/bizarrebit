-- @ScriptType: ModuleScript
local UIRelationshipsMenu = {}

function UIRelationshipsMenu.Create(mainFrame)
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

	local tabFrame = Instance.new("Frame")
	tabFrame.Name = "TabFrame"
	tabFrame.Size = UDim2.new(1, -40, 0, 40)
	tabFrame.Position = UDim2.new(0, 20, 0, 60)
	tabFrame.BackgroundTransparency = 1
	tabFrame.Parent = relFrame

	local tabLayout = Instance.new("UIListLayout")
	tabLayout.FillDirection = Enum.FillDirection.Horizontal
	tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tabLayout.Padding = UDim.new(0, 10)
	tabLayout.Parent = tabFrame

	local function createTabBtn(name, order)
		local btn = Instance.new("TextButton")
		btn.Name = name .. "Button"
		btn.Size = UDim2.new(0.3, 0, 1, 0)
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
		btn.TextColor3 = Color3.fromRGB(220, 220, 220)
		btn.Text = name
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 14
		btn.LayoutOrder = order
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
		btn.Parent = tabFrame
		return btn
	end

	createTabBtn("Relatives", 1)
	createTabBtn("Friends", 2)
	createTabBtn("Family", 3)

	local relListFrame = Instance.new("ScrollingFrame")
	relListFrame.Name = "ListFrame"
	relListFrame.Size = UDim2.new(1, -40, 1, -120)
	relListFrame.Position = UDim2.new(0, 20, 0, 110)
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
end

return UIRelationshipsMenu