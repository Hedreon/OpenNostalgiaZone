game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAppearanceLoaded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
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