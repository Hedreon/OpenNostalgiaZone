local Players: Players = game:GetService("Players")

local GUI = require(script.Parent)

local ListFrame: Instance? = GUI:Find("ListFrame")
local Template: Instance? = if ListFrame then ListFrame:FindFirstChild("TemplateLabel") else nil

local function CreateEntry(Player: Player)
	if ListFrame and Template then
		local AssignedColor: Instance = Player:WaitForChild("AssignedColor")
		local ListEntry: Instance? = Template:Clone()

		if AssignedColor:IsA("Color3Value") and ListEntry and ListEntry:IsA("TextLabel") then
			ListEntry.Name = Player.Name
			ListEntry.Text = ListEntry.Name
			ListEntry.TextColor3 = AssignedColor.Value
			ListEntry.Visible = true
			ListEntry.Parent = ListFrame
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
	if ListFrame then
		local FoundEntry: Instance? = ListFrame:FindFirstChild(Player.Name)

		if FoundEntry then
			FoundEntry:Destroy()
		end
	end
end)