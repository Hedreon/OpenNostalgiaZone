local Message = {}

local Players: Players = game:GetService("Players")

local LocalPlayer: Player? = Players.LocalPlayer
local PlayerGui: PlayerGui? = if LocalPlayer then LocalPlayer:FindFirstChildOfClass("PlayerGui") else nil

local MessageLabel: TextLabel = script.MessageLabel

function Message:Create(Messsage: string, Length: number)
	if PlayerGui then
		local MesssageClone: TextLabel = MessageLabel:Clone()
		MesssageClone.Text = Messsage
		MesssageClone.Parent = PlayerGui:WaitForChild("MainGui"):FindFirstChild("BypassFrame")

		task.wait(Length)

		MesssageClone:Destroy()
	end
end

return Message