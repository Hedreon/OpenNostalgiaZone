game.Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAppearanceLoaded:Connect(function(Character)
		local Humanoid = Character:WaitForChild("Humanoid")
		local HumanoidDescription = Humanoid:GetAppliedDescription()

		HumanoidDescription.Head = 0
		HumanoidDescription.Torso = 0
		HumanoidDescription.LeftArm = 0
		HumanoidDescription.RightArm = 0
		HumanoidDescription.LeftLeg = 0
		HumanoidDescription.RightLeg = 0

		Humanoid:ApplyDescription(HumanoidDescription)
	end)
end)