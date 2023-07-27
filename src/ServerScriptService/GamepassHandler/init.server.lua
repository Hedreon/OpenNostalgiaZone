local MarketplaceService: MarketplaceService = game:GetService("MarketplaceService")
local Players: Players = game:GetService("Players")

local Tool: Instance = script.RocketLauncher

local GamepassId: number = 182835749

Players.PlayerAdded:Connect(function(Player: Player)
	Player.CharacterAdded:Connect(function(Character: Model)
		if MarketplaceService:UserOwnsGamePassAsync(Player.UserId, GamepassId) then
			local ToolClone: Instance = Tool:Clone()
			ToolClone.Parent = Player:FindFirstChildOfClass("Backpack")
		end
	end)
end)