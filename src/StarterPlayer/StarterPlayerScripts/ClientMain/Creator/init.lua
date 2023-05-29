local Creator = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Fusion = require(ReplicatedStorage.Packages.fusion)
local Messages = require(script.Messages)

local New = Fusion.New
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent

local ClickDebounce = false

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

		Position = Properties.Position,
		Size = Properties.Size,
		Name = Properties.ButtonName,
		Text = Properties.ButtonText,

		[OnEvent "Activated"] = Properties.OnClick
	}
end

function Creator:ControlBar()
	return New "Frame" {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.05, 0),
		Name = "ControlFrame",

		[Children] = {
			Creator:ClassicButton {
				ButtonName = "HelpButton",
				ButtonText = "Help...",
				Size = UDim2.new(0.125, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),

				OnClick = function()
					if not ClickDebounce then
						ClickDebounce = true
						Messages:Show("Aesthetic purposes only.", 3)
						task.wait(0.2)
						ClickDebounce = false
					end
				end
			},

			Creator:ClassicButton {
				ButtonName = "FullscreenButton",
				ButtonText = "Fullscreen",
				Size = UDim2.new(0.125, 0, 1, 0),
				Position = UDim2.new(0.125, 0, 0, 0),

				OnClick = function()
					if not ClickDebounce then
						ClickDebounce = true
						Messages:Show("Aesthetic purposes only.", 3)
						task.wait(0.2)
						ClickDebounce = false
					end
				end
			},

			Creator:ClassicButton {
				ButtonName = "ExitButton",
				ButtonText = "Exit",
				Size = UDim2.new(0.125, 0, 1, 0),
				Position = UDim2.new(0.25, 0, 0, 0),

				OnClick = function()
					LocalPlayer:Kick('You "exited" the game.')
				end
			}
		}
	}
end

function Creator:ClassicLabel(Properties)
	return New "TextLabel" {
		BackgroundColor3 = Color3.fromRGB(163, 162, 165),
		BackgroundTransparency = 0.5,
		FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic),
		TextColor3 = Color3.new(1, 1, 1),
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		
		Position = Properties.Position,
		Size = Properties.Size,
		Visible = Properties.Visible,
		RichText = Properties.RichText,
		Name = Properties.LabelName,
		Text = Properties.LabelText
	}
end

function Creator:PlayerList()
	return New "Frame" {
		Name = "PlayerFrame",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.96, 0),
		Size = UDim2.new(0.2, 0, 0.96, 0),
		Position = UDim2.new(0.98, 0, 0.04, 0),

		[Children] = {
			Creator:ClassicLabel {
				LabelName = "TitleLabel",
				LabelText = "Player List",
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0.05, 0),
				Visible = true
			},

			Creator:ClassicLabel {
				LabelName = "SeparatorLabel",
				LabelText = "",
				Position = UDim2.new(0, 0, 0.05, 0),
				Size = UDim2.new(1, 0, 0.05, 0),
				Visible = true
			},

			Creator:ClassicLabel {
				LabelName = "Template",
				LabelText = "Player",
				Position = UDim2.new(0, 0, 0.1, 0),
				Size = UDim2.new(1, 0, 0.05, 0),
				Visible = false
			},

			New "Folder" {
				Name = "Slots"
			}
		}
	}
end

return Creator