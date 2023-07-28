local Players: Players = game:GetService("Players")

local GUI = require(script.Parent)

local PlayerList: Instance? = GUI:Find("PlayerList")
local Template: Instance? = if PlayerList then PlayerList:FindFirstChild("TemplateLabel") else nil

local function CreateEntry(Player: Player)
	if PlayerList and Template then
		local AssignedColor: Instance = Player:WaitForChild("AssignedColor")
		local ListEntry: Instance? = Template:Clone()

		if AssignedColor:IsA("Color3Value") and ListEntry and ListEntry:IsA("TextLabel") then
			ListEntry.Name = Player.Name
			ListEntry.Text = ListEntry.Name
			ListEntry.TextColor3 = AssignedColor.Value
			ListEntry.Visible = true
			ListEntry.Parent = PlayerList
		end
	end
end

Players.PlayerAdded:Connect(function(Player: Player)
	CreateEntry(Player)
end)

for _, Player: Player in Players:GetPlayers() do
	task.spawn(CreateEntry, Player)
end

Players.PlayerRemoving:Connect(function(Player: Player)
	if PlayerList then
		local FoundEntry: Instance? = PlayerList:FindFirstChild(Player.Name)

		if FoundEntry then
			FoundEntry:Destroy()
		end
	end
end)