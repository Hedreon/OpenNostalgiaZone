local ChatBox = {}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages: Instance? = ReplicatedStorage:FindFirstChild("Packages")

local Fusion: any = if Packages then require(Packages:WaitForChild("fusion")) else nil
local New: any = Fusion.New
local OnEvent: any = Fusion.OnEvent

local GUI = require(script.Parent.Parent.Parent.GUI)

local ChatBoxObject = GUI:Find("ChatBox")

function ChatBox:Create()
	return New "TextBox" {
		AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = Color3.fromRGB(64, 64, 64),
		Name = "ChatBox",
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0.05, 0),
		FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Regular, Enum.FontStyle.Italic),
		PlaceholderColor3 = Color3.fromRGB(255, 255, 200),
		PlaceholderText = "To chat click here or press the \"/\" key",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,

		[OnEvent "FocusLost"] = function(Enter)
			if Enter then
				ChatBoxObject.Text = ""
			end
		end
	}
end

return ChatBox