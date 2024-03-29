local Players: Players = game:GetService("Players")

local Colors: {Color3} = {
	Color3.fromRGB(255, 255, 153),
	Color3.fromRGB(0, 0, 204),
	Color3.fromRGB(255, 255, 0),
	Color3.fromRGB(204, 0, 0),
	Color3.fromRGB(0, 51, 204),
	Color3.fromRGB(102, 0, 102),
	Color3.fromRGB(255, 102, 255),
	Color3.fromRGB(255, 0, 0)
}

local function ApplyRandomColor()
	for _, Value: Color3 in Colors do
		return Colors[math.random(1, #Colors)]
	end

	return nil
end

Players.PlayerAdded:Connect(function(Player: Player)
	local AssignedColor: Color3Value = Instance.new("Color3Value")
	AssignedColor.Name = "AssignedColor"
	AssignedColor.Value = ApplyRandomColor()
	AssignedColor.Parent = Player
end)