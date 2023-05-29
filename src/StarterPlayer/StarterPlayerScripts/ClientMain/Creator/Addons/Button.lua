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
		TextSize = 20,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic),
		AutoButtonColor = true,

		Name = Properties.Name,
		Text = Properties.Text,
		Size = Properties.Size,
		Position = Properties.Position,

		[OnEvent "Activated"] = Properties.OnClick
	}
end

return Button