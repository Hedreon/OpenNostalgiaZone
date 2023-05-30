local MarketplaceService = game:GetService("MarketplaceService")

local GamepassId = 182835749
local Tool = script.RocketLauncher

game.Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Character)
		if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, GamepassId) then
			local ToolClone = Tool:Clone()
			ToolClone.Parent = Player.Backpack
		end
	end)
end)