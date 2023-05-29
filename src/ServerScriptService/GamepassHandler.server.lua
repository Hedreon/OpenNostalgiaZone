local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Tools = ReplicatedStorage:FindFirstChild("Tools")
local Tool = Tools:FindFirstChild("RocketLauncher")

local ID = 182835749

Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Character)
		if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, ID) then
			local ToolClone = Tool:Clone()
			ToolClone.Parent = Player.Backpack
		end
	end)
end)