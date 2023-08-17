local TextBox = {}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages: Instance? = ReplicatedStorage:FindFirstChild("Packages")

local Fusion: any = if Packages then require(Packages:WaitForChild("fusion")) else nil
local New: any = Fusion.New
local OnEvent: any = Fusion.OnEvent

function TextBox:Create(Properties: {Name: string, OnEnter: any})
	return New "TextBox" {
		AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = Color3.fromRGB(64, 64, 64),
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0.05, 0),
		FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Regular, Enum.FontStyle.Italic),
		PlaceholderColor3 = Color3.fromRGB(255, 255, 200),
		PlaceholderText = "To chat click here or press the \"/\" key",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,

		Name = Properties.Name .. "Box",

		[OnEvent "FocusLost"] = Properties.OnEnter
	}
end

return TextBox