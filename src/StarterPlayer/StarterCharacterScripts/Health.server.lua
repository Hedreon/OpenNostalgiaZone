-- Declarations
local Humanoid = script.Parent:FindFirstChildOfClass("Humanoid")

-- Regeneration
while true do
	local Second = task.wait(1)
	local Health = Humanoid.Health

	if Health > 0 and Health < Humanoid.MaxHealth then
		Health = Health + 0.01 * Second * Humanoid.MaxHealth

		if Health * 1.05 < Humanoid.MaxHealth then
			Humanoid.Health = Health
		else
			Humanoid.Health = Humanoid.MaxHealth
		end
	end
end