local Creator = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent

function Creator:ContainerFrame(Properties)
	return New "Frame" {
		AnchorPoint = Properties.FramePoint,
		BackgroundTransparency = 1,
		Name = Properties.FrameName,
		Size = Properties.FrameSize,
		Position = Properties.FramePosition,
		[Children] = Properties[Children]
	}
end

function Creator:ClassicFrame(Properties)
	return New "Frame" {
		BackgroundColor3 = Color3.fromRGB(163, 162, 165),
		BackgroundTransparency = 0.5,
		AnchorPoint = Properties.FramePoint,
		Name = Properties.FrameName,
		Position = Properties.FramePosition,
		Size = Properties.FrameSize,
		[Children] = Properties[Children]
	}
end

function Creator:ClassicButton(Properties)
	return New "TextButton" {
		BackgroundColor3 = Color3.fromRGB(163, 162, 165),
		BackgroundTransparency = 0.5,
		TextColor3 = Color3.fromRGB(77, 77, 77),
		TextTransparency = 0.3,
		TextStrokeColor3 = Color3.fromRGB(77, 77, 77),
		TextStrokeTransparency = 0.9,
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic),
		AutoButtonColor = true,
		Name = Properties.ButtonName,
		Position = Properties.ButtonPosition,
		Size = Properties.ButtonSize,
		Text = Properties.ButtonText,
		[OnEvent "Activated"] = Properties.OnClick
	}
end

function Creator:ClassicLabel(Properties)
	return New "TextLabel" {
		FontFace = Font.fromName("Arial", Enum.FontWeight.Bold, Enum.FontStyle.Italic),
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundColor3 = Properties.Background,
		BackgroundTransparency = Properties.Transparency,
		Name = Properties.LabelName,
		Position = Properties.LabelPosition,
		Size = Properties.LabelSize,
		Text = Properties.LabelText,
		TextColor3 = Properties.LabelColor,
		Visible = Properties.LabelVisible
	}
end

function Creator:ClassicBackgroundLabel(Properties)
	return New "TextLabel" {
		BackgroundColor3 = Color3.fromRGB(163, 162, 165),
		BackgroundTransparency = 0.5,
		FontFace = Font.fromName("Arial", Enum.FontWeight.Bold, Enum.FontStyle.Italic),
		TextColor3 = Color3.new(1, 1, 1),
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		Name = Properties.LabelName,
		Position = Properties.LabelPosition,
		Size = Properties.LabelSize,
		Text = Properties.LabelText,
		Visible = Properties.LabelVisible
	}
end

return Creator