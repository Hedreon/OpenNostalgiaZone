local Regeneration = {}

function Regeneration:Regenerate(Clone: Instance, CloneLocation: Instance)
	for _, Children in CloneLocation:GetDescendants() do
		if Children.Name == Clone.Name and Children:IsA("Model") then
			Children:Destroy()
		end
	end

	task.wait(0.5)
	
	local RegenClone: Instance = Clone:Clone()
	RegenClone.Parent = CloneLocation
end

return Regeneration