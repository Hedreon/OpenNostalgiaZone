local GUI = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New
local Children = Fusion.Children

local Creator = require(script.Parent.Creator)
local TransparentFrame = require(script.Parent.Creator.Addons.TransparentFrame)

function GUI:Initialize()
	local _UI = New "ScreenGui" {
		Name = "MainGui",
		Parent = PlayerGui,
		ScreenInsets = Enum.ScreenInsets.None,

		[Children] = {
			TransparentFrame:Create {
				Name = "MainFrame",
				Size = UDim2.new(0.96, 0, 1, 0),
				Position = UDim2.new(0.04, 0, 0, 0),

				[Children] = {
					Creator:ControlBar(),
					Creator:PlayerList()
				}
			},

			TransparentFrame:Create {
				Name = "BypassFrame",
				Size = UDim2.new(1, 0, 1, 0)
			}
		}
	}
end

function GUI:Find(Name: string)
	local MainGui = PlayerGui:WaitForChild("MainGui")
	
    for _, Descendant in MainGui:GetDescendants() do
		if Descendant.Name == Name then
			return Descendant
		end
    end

	return nil
end

return GUI