local Regenerator = {}

function Regenerator:Regenerate(Clone: Instance, CloneLocation: Instance)
	for _, Descendant: Instance in CloneLocation:GetDescendants() do
		if Descendant.Name == Clone.Name and Descendant:IsA("Model") then
			Descendant:Destroy()
		end
	end

	task.wait(0.5)

	local RegenClone: Instance = Clone:Clone()
	RegenClone.Parent = CloneLocation
end

return Regenerator