local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players: Players = game:GetService("Players")

local Misc: Instance = ReplicatedStorage:WaitForChild("Misc")
local GUI: Instance? = Misc:FindFirstChild("NameGui")

Players.PlayerAdded:Connect(function(Player: Player)
	Player.CharacterAdded:Connect(function(Character: Model)
		local Head: Instance? = Character:FindFirstChild("Head")

		if GUI and Head then
			local GUIClone: Instance = GUI:Clone()
			local NameLabel: Instance? = GUIClone:FindFirstChild("NameLabel")

			if GUIClone:IsA("BillboardGui") and NameLabel and NameLabel:IsA("TextLabel") then
				GUIClone.Parent = Head
				GUIClone.Adornee = Head

				NameLabel.Text = Player.Name
			end
		end
	end)
end)