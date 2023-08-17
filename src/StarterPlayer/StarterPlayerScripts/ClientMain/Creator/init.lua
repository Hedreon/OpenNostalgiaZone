local Creator = {}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players: Players = game:GetService("Players")

local LocalPlayer: Player? = Players.LocalPlayer

local Packages: Instance? = ReplicatedStorage:FindFirstChild("Packages")

local Fusion: any = if Packages then require(Packages:WaitForChild("fusion")) else nil
local Children: any = Fusion.Children

local ClickDebounce: boolean = false

local TransparentFrame = require(script.Addons.TransparentFrame)
local Button = require(script.Addons.Button)
local Message = require(script.Addons.Message)
local ChatBox = require(script.Addons.ChatBox)
local Label = require(script.Addons.Label)
local ListLayout = require(script.Addons.ListLayout)

function Creator:ControlFrame()
	return TransparentFrame:Create {
		Name = "Control",
		Size = UDim2.new(1, 0, 0.04, 0),

		[Children] = {
			Button:Create {
				Name = "Help",
				Text = "Help...",
				Size = UDim2.new(0.125, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),

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
				Name = "Fullscreen",
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
				Name = "Exit",
				Text = "Exit",
				Size = UDim2.new(0.125, 0, 1, 0),
				Position = UDim2.new(0.25, 0, 0, 0),

				OnClick = function()
					if LocalPlayer then
						LocalPlayer:Kick("You \"exited\" the game.")
					end
				end
			}
		}
	}
end

function Creator:ListFrame()
	return TransparentFrame:Create {
		Name = "List",
		Size = UDim2.new(0.1, 0, 0.96, 0),
		AnchorPoint = Vector2.new(0.96, 0),
		Position = UDim2.new(0.98, 0, 0.04, 0),

		[Children] = {
			Label:Create {
				Name = "Title",
				Text = "Player List",
				Size = UDim2.new(1, 0, 0.04, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Visible = true
			},

			Label:Create {
				Name = "Separator",
				Text = "",
				Size = UDim2.new(1, 0, 0.04, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Visible = true
			},

			Label:Create {
				Name = "Template",
				Text = "Player",
				Size = UDim2.new(1, 0, 0.04, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Visible = false
			},

			ListLayout:Create()
		}
	}
end

function Creator:ChatBox(GUI)
	return ChatBox:Create {
		OnFocus = function(Enter)
			if Enter then
				local ChatBoxObject = GUI:Find("ChatBox")

				ChatBoxObject.Text = ""
				print("Not fully developed yet!")
			end
		end
	}
end

return Creator