local Messages = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local MessageLabel = script.MessageLabel

function Messages:Show(Messsage: string, TimeShown: number)
	local labelClone = MessageLabel:Clone()
	labelClone.Parent = PlayerGui.MainGui.MainFrame
	labelClone.Text = Messsage

	task.wait(TimeShown)

	labelClone:Destroy()
end

return Messages