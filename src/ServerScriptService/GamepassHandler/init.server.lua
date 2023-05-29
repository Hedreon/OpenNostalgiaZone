local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local ID = 182835749

Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Character)
		if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, ID) then
			local ToolClone = script.RocketLauncher:Clone()
			ToolClone.Parent = Player.Backpack
		end
	end)
end)