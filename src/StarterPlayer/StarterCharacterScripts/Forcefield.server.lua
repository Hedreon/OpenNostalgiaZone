local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Modules = ReplicatedStorage:FindFirstChild("Modules")

local Rainbow = require(Modules.Rainbow)

local Boxes = {}

function CreateBoxes(ForceField)
	for _, CharacterPart in script.Parent:GetChildren() do
		if CharacterPart:IsA("BasePart") and CharacterPart.Name ~= "HumanoidRootPart" then
			local Box = Instance.new("SelectionBox")
			Box.Color3 = Color3.new(1, 0, 0)
			Box.Adornee = CharacterPart
			Box.Parent = ForceField

			table.insert(Boxes, Box)
		end
	end
end

function CycleBoxes()
	while true do
		local NoBoxes = true

		for Index, Box in Boxes do
			if Box:IsDescendantOf(script.Parent) then
                Rainbow:Rain(Box, tick() % 1)
				NoBoxes = false
			else
				table.remove(Boxes, Index)
			end
		end
		
		if NoBoxes then
			break
		end
		
		RunService.Stepped:Wait()
	end
end

local ForceField = script.Parent:FindFirstChildOfClass("ForceField")

if ForceField then
	ForceField.Visible = false
	CreateBoxes(ForceField)
	CycleBoxes()
end

script.Parent.ChildAdded:Connect(function(Child)
	if Child:IsA("ForceField") then
		Child.Visible = false
		CreateBoxes(Child)
		CycleBoxes()
	end
end)