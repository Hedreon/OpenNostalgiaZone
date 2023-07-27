local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService: RunService = game:GetService("RunService")

local Boxes: {SelectionBox} = {}

local Modules: Instance? = ReplicatedStorage:WaitForChild("Modules")
local Rainbow = if Modules then require(Modules:FindFirstChild("Rainbow")) else nil

function CreateBoxes(ForceField: Instance?)
	if ForceField then
		for _, Child: Instance in script.Parent:GetChildren() do
			if Child:IsA("BasePart") and Child.Name ~= "HumanoidRootPart" then
				local Box: SelectionBox = Instance.new("SelectionBox")
				Box.Color3 = Color3.new(1, 0, 0)
				Box.Adornee = Child
				Box.Parent = ForceField
	
				table.insert(Boxes, Box)
			end
		end
	else
		warn("[Forcefield]", "Forcefield argument wasn't given!")
	end
end

function CycleBoxes()
	while true do
		local NoBoxes: boolean = true

		for Index: number, Box: SelectionBox in Boxes do
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

local ForceField: ForceField? = script.Parent:FindFirstChildOfClass("ForceField")

if ForceField then
	ForceField.Visible = false
	CreateBoxes(ForceField)
	CycleBoxes()
end

script.Parent.ChildAdded:Connect(function(Child: Instance)
	if Child:IsA("ForceField") then
		Child.Visible = false
		CreateBoxes(Child)
		CycleBoxes()
	end
end)