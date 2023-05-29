local TransparentFrame = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New
local Children = Fusion.Children

function TransparentFrame:Create(Properties)
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