-- @ScriptType: ModuleScript
local UIActionsMenu = {}

function UIActionsMenu.Create(mainFrame)
	local actOverlay = Instance.new("Frame")
	actOverlay.Name = "ActionsOverlay"
	actOverlay.Size = UDim2.new(1, 0, 1, 0)
	actOverlay.Position = UDim2.new(0, 0, 0, 0)
	actOverlay.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
	actOverlay.BackgroundTransparency = 0.6
	actOverlay.Visible = false
	actOverlay.Active = true
	actOverlay.Parent = mainFrame

	local actFrame = Instance.new("Frame")
	actFrame.Name = "ActionsFrame"
	actFrame.Size = UDim2.new(0.9, 0, 0.85, 0)
	actFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	actFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	actFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
	actFrame.BorderSizePixel = 0
	actFrame.Parent = actOverlay

	local actConstraint = Instance.new("UISizeConstraint")
	actConstraint.MaxSize = Vector2.new(600, 500)
	actConstraint.Parent = actFrame

	local actCorner = Instance.new("UICorner")
	actCorner.CornerRadius = UDim.new(0, 12)
	actCorner.Parent = actFrame

	local actStroke = Instance.new("UIStroke")
	actStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	actStroke.Color = Color3.fromRGB(75, 60, 40)
	actStroke.Thickness = 2
	actStroke.Parent = actFrame

	local actTitle = Instance.new("TextLabel")
	actTitle.Name = "Title"
	actTitle.Size = UDim2.new(1, -60, 0, 40)
	actTitle.Position = UDim2.new(0, 20, 0, 10)
	actTitle.BackgroundTransparency = 1
	actTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	actTitle.Text = "Actions"
	actTitle.Font = Enum.Font.GothamBlack
	actTitle.TextSize = 24
	actTitle.TextXAlignment = Enum.TextXAlignment.Left
	actTitle.Parent = actFrame

	local closeActBtn = Instance.new("TextButton")
	closeActBtn.Name = "CloseButton"
	closeActBtn.Size = UDim2.new(0, 40, 0, 40)
	closeActBtn.Position = UDim2.new(1, -50, 0, 10)
	closeActBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 60)
	closeActBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeActBtn.Text = "X"
	closeActBtn.Font = Enum.Font.GothamBold
	closeActBtn.TextSize = 20
	closeActBtn.Parent = actFrame

	local closeActCorner = Instance.new("UICorner")
	closeActCorner.CornerRadius = UDim.new(0, 8)
	closeActCorner.Parent = closeActBtn

	local actListFrame = Instance.new("ScrollingFrame")
	actListFrame.Name = "ListFrame"
	actListFrame.Size = UDim2.new(1, -40, 1, -70)
	actListFrame.Position = UDim2.new(0, 20, 0, 60)
	actListFrame.BackgroundTransparency = 1
	actListFrame.ScrollBarThickness = 6
	actListFrame.ScrollBarImageColor3 = Color3.fromRGB(95, 80, 60)
	actListFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	actListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	actListFrame.Parent = actFrame

	local uiPaddingAct = Instance.new("UIPadding")
	uiPaddingAct.PaddingLeft = UDim.new(0, 4)
	uiPaddingAct.PaddingRight = UDim.new(0, 4)
	uiPaddingAct.PaddingTop = UDim.new(0, 4)
	uiPaddingAct.PaddingBottom = UDim.new(0, 4)
	uiPaddingAct.Parent = actListFrame

	local uiListLayoutAct = Instance.new("UIListLayout")
	uiListLayoutAct.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayoutAct.FillDirection = Enum.FillDirection.Vertical
	uiListLayoutAct.Padding = UDim.new(0, 10)
	uiListLayoutAct.Parent = actListFrame
end

return UIActionsMenu