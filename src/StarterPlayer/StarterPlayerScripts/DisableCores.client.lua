local MarketplaceService: MarketplaceService = game:GetService("MarketplaceService")
local Players: Players = game:GetService("Players")
local StarterGui: StarterGui = game:GetService("StarterGui")

local LocalPlayer: Player? = Players.LocalPlayer

local GamepassId: number = 182835749

if LocalPlayer then
	if MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, GamepassId) then
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	else
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
	end
end