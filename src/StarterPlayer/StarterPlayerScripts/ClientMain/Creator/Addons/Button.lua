local Button = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New
local OnEvent = Fusion.OnEvent

function Button:Create(Properties)
	return New "TextButton" {
		BackgroundColor3 = Color3.fromRGB(163, 162, 165),
		BackgroundTransparency = 0.5,
		TextColor3 = Color3.fromRGB(77, 77, 77),
		TextTransparency = 0.3,
		TextStrokeColor3 = Color3.fromRGB(77, 77, 77),
		TextStrokeTransparency = 0.9,
		TextSize = 24,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic),

		Name = Properties.Name,
		Text = Properties.Text,
		Size = Properties.Size,
		Position = Properties.Position or UDim2.new(0, 0, 0, 0),

		[OnEvent "Activated"] = Properties.OnClick
	}
end

return Button