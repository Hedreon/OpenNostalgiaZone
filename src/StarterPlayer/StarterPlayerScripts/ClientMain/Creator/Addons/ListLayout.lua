local ListLayout = {}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages: Instance? = ReplicatedStorage:FindFirstChild("Packages")
local Fusion = if Packages then require(Packages:WaitForChild("fusion")) else nil
local New = Fusion.New

function ListLayout:Create()
	return New "UIListLayout" {
		Name = "ListLayout",
		SortOrder = "LayoutOrder"
	}
end

return ListLayout