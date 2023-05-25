-- Player List Handler
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local GUI = require(script.Parent)

local Frame = GUI:Find("PlayerFrame")
local Slots = Frame.Slots
local Template = Frame.Template

local colorValue = LocalPlayer:FindFirstChildOfClass("Color3Value")

local PlayerTable = {}

local function Clean(Slot)
	Slot:Destroy()
end

local function Remove(Player)
	if Player then
		PlayerTable[Player] = nil

		local slot = Slots:FindFirstChild(Player)
		local wrap = coroutine.wrap(Clean)

		wrap(slot)
	end
end

local function Add()
	local children = Players:GetChildren()

	for child = 1, #children do
		if not PlayerTable[children[child].Name] then
			PlayerTable[children[child].Name] = 1

			local slot = Template:Clone()
			slot.Name = children[child].Name
			slot.Text = slot.Name
			slot.TextColor3 = colorValue.Value
			slot.Parent = Slots
		end
	end
end

local function Adjust(Player)
	Add()
	Remove(Player)

	local count = 0

	for key, value in pairs(PlayerTable) do
		count = count + 1

		local slot = Slots:FindFirstChild(key)
		local newY = 0.1 + 0.05 * (count - 1)

		slot.Position = UDim2.new(0, 0, newY, 0)
		slot.Visible = true
	end
end

Players.PlayerAdded:Connect(function()
	Adjust(nil)
end)

Players.PlayerRemoving:Connect(function(player)
	Adjust(player.Name)
end)

Adjust()