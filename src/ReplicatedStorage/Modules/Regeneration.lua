local Regeneration = {}

function Regeneration:Regenerate(Model, Backup: Model, Location)
	Model = Backup:Clone()
	Model.Parent = Location
	Model:MakeJoints()
end

return Regeneration