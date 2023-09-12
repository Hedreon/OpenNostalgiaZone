local GUI = {}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players: Players = game:GetService("Players")

local LocalPlayer: Player? = Players.LocalPlayer
local PlayerGui: PlayerGui? = if LocalPlayer then LocalPlayer:FindFirstChildOfClass("PlayerGui") else nil

local Packages: Instance? = ReplicatedStorage:FindFirstChild("Packages")

local Fusion: any = if Packages then require(Packages:WaitForChild("fusion")) else nil
local New: any = Fusion.New
local Children: any = Fusion.Children

local Creator = require(script.Parent.Creator)
local ContainerFrame = require(script.Parent.Creator.Addons.ContainerFrame)

function GUI:Initialize()
	local _UI = New "ScreenGui" {
		Name = "MainGui",
		Parent = PlayerGui,
		ScreenInsets = Enum.ScreenInsets.None,

		[Children] = {
			ContainerFrame:Create {
				Name = "Main",
				Size = UDim2.new(0.95, 0, 1, 0),
				Position = UDim2.new(0.05, 0, 0, 0),

				[Children] = {
					Creator:ControlFrame(),
					Creator:ListFrame()
				}
			},

			ContainerFrame:Create {
				Name = "Bypass",
				AnchorPoint = Vector2.new(0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0)
			}
		}
	}
end

function GUI:Find(Name: string)
	if PlayerGui then
		local MainGui: Instance = PlayerGui:WaitForChild("MainGui")
	
		for _, Descendant: Instance in MainGui:GetDescendants() do
			if Descendant.Name == Name then
				return Descendant
			end
		end
	end

	return nil
end

return GUI