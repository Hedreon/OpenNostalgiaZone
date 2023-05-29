local TransparentFrame = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New
local Children = Fusion.Children

function TransparentFrame:Create(Properties)
	return New "Frame" {
		BackgroundTransparency = 1,

		Name = Properties.Name,
		Size = Properties.Size or UDim2.new(1, 0, 1, 0),
		AnchorPoint = Properties.AnchorPoint or Vector2.new(0, 0),
		Position = Properties.Position or UDim2.new(0, 0, 0, 0),

		[Children] = Properties[Children]
	}
end

return TransparentFrame