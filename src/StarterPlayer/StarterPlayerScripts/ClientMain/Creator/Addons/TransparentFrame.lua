local TransparentFrame = {}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages: Instance? = ReplicatedStorage:FindFirstChild("Packages")

local Fusion: any = if Packages then require(Packages:WaitForChild("fusion")) else nil
local New: any = Fusion.New
local Children: any = Fusion.Children

function TransparentFrame:Create(Properties: {Name: string, Size: UDim2, AnchorPoint: Vector2, Position: UDim2, [any]: any})
	return New "Frame" {
		BackgroundTransparency = 1,

		Name = Properties.Name,
		Size = Properties.Size,
		AnchorPoint = Properties.AnchorPoint,
		Position = Properties.Position,

		[Children] = Properties[Children]
	}
end

return TransparentFrame