local Creator = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Fusion = require(ReplicatedStorage.Packages.fusion)
local Children = Fusion.Children

local TransparentFrame = require(script.Addons.TransparentFrame)
local Button = require(script.Addons.Button)
local Folder = require(script.Addons.Folder)
local Message = require(script.Addons.Message)
local Label = require(script.Addons.Label)

local ClickDebounce = false

function Creator:ControlBar()
	return TransparentFrame:Create {
		Name = "ControlBar",
		Size = UDim2.new(1, 0, 0.04, 0),

		[Children] = {
			Button:Create {
				Name = "HelpButton",
				Text = "Help...",
				Size = UDim2.new(0.125, 0, 1, 0),

				OnClick = function()
					if not ClickDebounce then
						ClickDebounce = true
						Message:Create("Aesthetic purposes only.", 3)
						task.wait(0.2)
						ClickDebounce = false
					end
				end
			},

			Button:Create {
				Name = "FullscreenButton",
				Text = "Fullscreen",
				Size = UDim2.new(0.125, 0, 1, 0),
				Position = UDim2.new(0.125, 0, 0, 0),

				OnClick = function()
					if not ClickDebounce then
						ClickDebounce = true
						Message:Create("Aesthetic purposes only.", 3)
						task.wait(0.2)
						ClickDebounce = false
					end
				end
			},

			Button:Create {
				Name = "ExitButton",
				Text = "Exit",
				Size = UDim2.new(0.125, 0, 1, 0),
				Position = UDim2.new(0.25, 0, 0, 0),

				OnClick = function()
					LocalPlayer:Kick('You "exited" the game.')
				end
			}
		}
	}
end

function Creator:PlayerList()
	return TransparentFrame:Create {
		Name = "PlayerList",
		Size = UDim2.new(0.1, 0, 0.96, 0),
		AnchorPoint = Vector2.new(0.96, 0),
		Position = UDim2.new(0.98, 0, 0.04, 0),

		[Children] = {
			Label:Create {
				Name = "TitleLabel",
				Text = "Player List",
				Size = UDim2.new(1, 0, 0.04, 0),
			},

			Label:Create {
				Name = "SeparatorLabel",
				Text = "",
				Size = UDim2.new(1, 0, 0.04, 0),
				Position = UDim2.new(0, 0, 0.04, 0),
			},

			Label:Create {
				Name = "Template",
				Text = "Player",
				Size = UDim2.new(1, 0, 0.04, 0),
				Position = UDim2.new(0, 0, 0.1, 0),
				Visible = false
			},

			Folder:Create("Slots")
		}
	}
end

return Creator