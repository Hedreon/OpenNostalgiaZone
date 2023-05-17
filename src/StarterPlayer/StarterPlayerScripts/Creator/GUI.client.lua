local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New
local Children = Fusion.Children
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local Creator = require(script.Parent)
local Messages = require(script.Parent.Messages)
local clickDebounce = false

local _UI = New "ScreenGui" {
	Name = "MainGui",
	Parent = PlayerGui,
	ScreenInsets = Enum.ScreenInsets.None,

	[Children] = {
		Creator:ContainerFrame {
			FrameName = "MainFrame",
			FrameSize = UDim2.new(0.96, 0, 1, 0),
			FramePosition = UDim2.new(0.04, 0, 0, 0),

			[Children] = {
				Creator:ContainerFrame {
					FrameName = "ControlFrame",
					FrameSize = UDim2.new(1, 0, 0.05, 0),

					[Children] = {
						Creator:ClassicButton {
							ButtonName = "HelpButton",
							ButtonPosition = UDim2.new(0, 0, 0, 0),
							ButtonSize = UDim2.new(0.125, 0, 1, 0),
							ButtonText = "Help...",

							OnClick = function()
								if not clickDebounce then
									clickDebounce = true
									Messages:Show("Aesthetic purposes only.", 3)
									task.wait(0.2)
									clickDebounce = false
								end
							end
						},
						
						Creator:ClassicButton {
							ButtonName = "FullscreenButton",
							ButtonPosition = UDim2.new(0.125, 0, 0, 0),
							ButtonSize = UDim2.new(0.125, 0, 1, 0),
							ButtonText = "Fullscreen",

							OnClick = function()
								if not clickDebounce then
									clickDebounce = true
									Messages:Show("Aesthetic purposes only.", 3)
									task.wait(0.2)
									clickDebounce = false
								end
							end
						},
						
						Creator:ClassicButton {
							ButtonName = "ExitButton",
							ButtonPosition = UDim2.new(0.25, 0, 0, 0),
							ButtonSize = UDim2.new(0.125, 0, 1, 0),
							ButtonText = "Exit",

							OnClick = function()
								LocalPlayer:Kick('You "exited" the game.')
							end
						}
					}
				}
			}
		}
	}
}