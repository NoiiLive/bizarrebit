-- @ScriptType: ModuleScript
local UIPopupMenu = {}

function UIPopupMenu.Create(mainFrame)
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
end

return UIPopupMenu