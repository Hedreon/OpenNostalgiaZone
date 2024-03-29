local Players: Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(Player: Player)
	Player.CharacterAppearanceLoaded:Connect(function(Character: Model)
		local Humanoid: Humanoid? = Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			local HumanoidDescription: HumanoidDescription = Humanoid:GetAppliedDescription()

			HumanoidDescription.Head = 0
			HumanoidDescription.Torso = 0
			HumanoidDescription.LeftArm = 0
			HumanoidDescription.RightArm = 0
			HumanoidDescription.LeftLeg = 0
			HumanoidDescription.RightLeg = 0

			Humanoid:ApplyDescription(HumanoidDescription)
		end
	end)
end)