local ContainerFrame = {}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages: Instance? = ReplicatedStorage:FindFirstChild("Packages")
local Fusion = if Packages then require(Packages:WaitForChild("fusion")) else nil
local New = Fusion.New
local Children = Fusion.Children

function ContainerFrame:Create(Properties: {Name: string, Size: UDim2, AnchorPoint: Vector2, Position: UDim2, [any]: any})
	return New "Frame" {
		BackgroundTransparency = 1,

		Name = Properties.Name .. "Frame",
		Size = Properties.Size,
		AnchorPoint = Properties.AnchorPoint,
		Position = Properties.Position,

		[Children] = Properties[Children]
	}
end

return ContainerFrame