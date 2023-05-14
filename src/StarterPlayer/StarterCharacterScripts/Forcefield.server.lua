local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Rainbow = require(ReplicatedStorage.Rainbow)

--..In case someone didn't even read that last line in the header...
if not script.Parent:FindFirstChildOfClass("Humanoid") then
	--This script only runs when in its character
	local GoalParent = game:GetService("StarterPlayer"):FindFirstChildOfClass("StarterCharacterScripts")
	if not GoalParent then
		error("[OldForceField] Script will not run! Not parented to StarterCharacterScripts, cannot automatically set parent.", 0)
	elseif GoalParent and not GoalParent:FindFirstChild(script.Name) then
		warn("[OldForceField] Script was not parented to StarterCharacterScripts! (It has been moved to there just now.) - Please put this in StarterCharacterScripts while in studio.")
		script.Parent = GoalParent
	end
end

local Boxes = {}

function CreateBoxes(ForceField)
	for Index, Value in ipairs(script.Parent:GetChildren()) do
		if Value:IsA("BasePart") and Value.Name ~= "HumanoidRootPart" then
			local Box = Instance.new("SelectionBox")
			Box.Color3 = Color3.new(1, 0, 0)
			Box.Adornee = Value
			Box.Parent = ForceField
			table.insert(Boxes, Box)
		end
	end
end

function CycleBoxes()
	while true do
		local NoBoxes = true
		for Index, Box in ipairs(Boxes) do
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
		
		game:GetService("RunService").Stepped:Wait()
	end
end

local FF = script.Parent:FindFirstChildOfClass("ForceField")
if FF then
	FF.Visible = false
	CreateBoxes(FF)
	CycleBoxes()
end

script.Parent.ChildAdded:Connect(function(child)
	if child:IsA("ForceField") then
		child.Visible = false
		CreateBoxes(child)
		CycleBoxes()
	end
end)