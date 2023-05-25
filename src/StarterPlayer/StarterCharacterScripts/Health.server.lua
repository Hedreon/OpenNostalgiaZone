-- Declarations
local Humanoid = script.Parent:FindFirstChildOfClass("Humanoid")

-- Regeneration
while true do
	local second = task.wait(1)
	local health = Humanoid.Health

	if health > 0 and health < Humanoid.MaxHealth then
		health = health + 0.01 * second * Humanoid.MaxHealth

		if health * 1.05 < Humanoid.MaxHealth then
			Humanoid.Health = health
		else
			Humanoid.Health = Humanoid.MaxHealth
		end
	end
end