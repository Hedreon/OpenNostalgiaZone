local Players = game:GetService("Players")

local GUI = require(script.Parent)

local Frame = GUI:Find("PlayerList")
local Slots = Frame.Slots
local Template = Frame.Template

local PlayerTable = {}

local function Clean(Slot)
	Slot:Destroy()
end

local function Remove(Player)
	if Player then
		PlayerTable[Player] = nil

		local Slot = Slots:FindFirstChild(Player)
		local Wrap = coroutine.wrap(Clean)

		Wrap(Slot)
	end
end

local function Add()
	local Children = Players:GetChildren()

	for Child = 1, #Children do
		if not PlayerTable[Children[Child].Name] then
			PlayerTable[Children[Child].Name] = 1

			local TemplateClone = Template:Clone()
			TemplateClone.Name = Children[Child].Name
			TemplateClone.Text = TemplateClone.Name
			TemplateClone.TextColor3 = Children[Child]:WaitForChild("AssignedColor").Value
			TemplateClone.Parent = Slots
		end
	end
end

local function Adjust(Player)
	Add()
	Remove(Player)

	local Count = 0

	for Key, Value in PlayerTable do
		Count = Count + 1

		local Slot = Slots:FindFirstChild(Key)
		local NewYPosition = 0.1 + 0.05 * (Count - 1)

		Slot.Position = UDim2.new(0, 0, NewYPosition, 0)
		Slot.Visible = true
	end
end

Players.PlayerAdded:Connect(function()
	Adjust(nil)
end)

Players.PlayerRemoving:Connect(function(Player)
	Adjust(Player.Name)
end)

Adjust()