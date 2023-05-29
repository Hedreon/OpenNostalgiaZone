local Messages = {}

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local MessageLabel = script.MessageLabel

function Messages:Create(Messsage: string, Length: number)
	local MesssageClone = MessageLabel:Clone()
	MesssageClone.Parent = PlayerGui.MainGui.BypassFrame
	MesssageClone.Text = Messsage

	task.wait(Length)

	MesssageClone:Destroy()
end

return Messages