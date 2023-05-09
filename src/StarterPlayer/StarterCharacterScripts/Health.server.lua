function waitForChild(parent, childName)
	local child = parent:findFirstChild(childName)
	if child then return child end
	while true do
		child = parent.ChildAdded:wait()
		if child.Name==childName then return child end
	end
end

-- declarations

local Figure = script.Parent
local Head = waitForChild(Figure, "Head")
local Humanoid = waitForChild(Figure, "Humanoid")

-- regeneration
while true do
	local s = wait(1)
	local health = Humanoid.Health
	if health > 0 and health < Humanoid.MaxHealth then
		health = health + 0.01 * s * Humanoid.MaxHealth
		if health * 1.05 < Humanoid.MaxHealth then
			Humanoid.Health = health
		else
			Humanoid.Health = Humanoid.MaxHealth
		end
	end
end