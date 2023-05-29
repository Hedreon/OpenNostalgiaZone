local Label = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New

function Label:Create(Properties)
	return New "TextLabel" {
		BackgroundColor3 = Color3.fromRGB(163, 162, 165),
		BackgroundTransparency = 0.5,
		FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic),
		TextColor3 = Color3.new(1, 1, 1),
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,

		Name = Properties.Name,
		Text = Properties.Text,
		Size = Properties.Size,
		Position = Properties.Position or UDim2.new(0, 0, 0, 0),
		Visible = Properties.Visible or true
	}
end

return Label