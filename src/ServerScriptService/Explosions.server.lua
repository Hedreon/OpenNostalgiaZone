workspace.DescendantAdded:Connect(function(Descendant: Instance)
	if Descendant:IsA("Explosion") then
		local Position: Vector3 = Descendant.Position
		local BlastRadius: number = Descendant.BlastRadius
		
		if Descendant.Visible then
			Descendant.Visible = false
		end
		
		local Ball: Part = Instance.new("Part")
		Ball.Anchored=true
		Ball.Color = Color3.new(1, 0, 0)
		Ball.Material = Enum.Material.Neon
		Ball.CanCollide = false
		Ball.Shape = Enum.PartType.Ball
		Ball.Size = Vector3.new(BlastRadius, BlastRadius, BlastRadius)
		Ball.CFrame = CFrame.new(Position)
		Ball.Parent = workspace
		
		task.wait(1)
		
		Ball:Destroy()
	end
end)