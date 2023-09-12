local Label = {}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages: Instance? = ReplicatedStorage:FindFirstChild("Packages")
local Fusion = if Packages then require(Packages:WaitForChild("fusion")) else nil
local New = Fusion.New

function Label:Create(Properties: {Name: string, Text: string, Size: UDim2, Position: UDim2, Visible: boolean})
	return New "TextLabel" {
		BackgroundColor3 = Color3.fromRGB(163, 162, 165),
		BackgroundTransparency = 0.5,
		FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic),
		TextColor3 = Color3.new(1, 1, 1),
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,

		Name = Properties.Name .. "Label",
		Text = Properties.Text,
		Size = Properties.Size,
		Position = Properties.Position,
		Visible = Properties.Visible
	}
end

return Label