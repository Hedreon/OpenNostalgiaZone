local Folder = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New

function Folder:Create(FolderName: string)
	return New "Folder" {
		Name = FolderName
	}
end

return Folder