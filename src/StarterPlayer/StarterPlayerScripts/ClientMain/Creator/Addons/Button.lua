local Button = {}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages: Instance? = ReplicatedStorage:FindFirstChild("Packages")

local Fusion: any = if Packages then require(Packages:WaitForChild("fusion")) else nil
local New: any = Fusion.New
local OnEvent: any = Fusion.OnEvent

function Button:Create(Properties: {Name: string, Text: string, Size: UDim2, Position: UDim2, OnClick: any})
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

		Name = Properties.Name .. "Button",
		Text = Properties.Text,
		Size = Properties.Size,
		Position = Properties.Position,

		[OnEvent "Activated"] = Properties.OnClick
	}
end

return Button