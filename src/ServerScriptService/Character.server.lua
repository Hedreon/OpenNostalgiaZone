game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		
		task.wait(1)

		local humanoidDescription = humanoid:GetAppliedDescription()

		humanoidDescription.Head = 0
		humanoidDescription.Torso = 0
		humanoidDescription.LeftArm = 0
		humanoidDescription.RightArm = 0
		humanoidDescription.LeftLeg = 0
		humanoidDescription.RightLeg = 0

		humanoid:ApplyDescription(humanoidDescription)
	end)
end)