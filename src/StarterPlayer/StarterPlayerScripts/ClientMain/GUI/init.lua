local GUI = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New
local Children = Fusion.Children
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local Creator = require(script.Parent.Creator)
local Messages = require(script.Parent.Creator.Messages)
local clickDebounce = false

function GUI:Initialize()
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
					},

					Creator:ContainerFrame {
						FramePoint = Vector2.new(0.96, 0),
						FrameName = "PlayerFrame",
						FramePosition = UDim2.new(0.98, 0, 0.04, 0),
						FrameSize = UDim2.new(0.2, 0, 0.96, 0),
						
						[Children] = {
							Creator:ClassicBackgroundLabel {
								LabelName = "TitleLabel",
								LabelPosition = UDim2.new(0, 0, 0, 0),
								LabelSize = UDim2.new(1, 0, 0.05, 0),
								LabelText = "Player List",
								LabelVisible = true
							},

							Creator:ClassicBackgroundLabel {
								LabelName = "SeparatorLabel",
								LabelPosition = UDim2.new(0, 0, 0.05, 0),
								LabelSize = UDim2.new(1, 0, 0.05, 0),
								LabelText = "",
								LabelVisible = true
							},

							Creator:ClassicBackgroundLabel {
								LabelName = "Template",
								LabelPosition = UDim2.new(0, 0, 0.1, 0),
								LabelSize = UDim2.new(1, 0, 0.05, 0),
								LabelText = "Player",
								LabelVisible = false
							},

							New "Folder" {
								Name = "Slots"
							}
						}
					}

					-- Creator:ChatBar {},

					-- Creator:ChatWindow {}
				}
			}
		}
	}
end

function GUI:Find(Name: string)
	local MainGui = PlayerGui:WaitForChild("MainGui")
	
    for _, v in pairs(MainGui:GetDescendants()) do
		if v.Name == Name then
			return v
		end
    end

	return nil
end

return GUI