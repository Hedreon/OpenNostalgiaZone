local RunService = game:GetService("RunService")

local Humanoid = script.Parent:FindFirstChildOfClass("Humanoid")
local Torso = script.Parent:WaitForChild("Torso")

local RightShoulder = Torso:WaitForChild("Right Shoulder")
local LeftShoulder = Torso:WaitForChild("Left Shoulder")
local RightHip = Torso:WaitForChild("Right Hip")
local LeftHip = Torso:WaitForChild("Left Hip")

local Pose = "Standing"

local ToolAnimation = "None"
local ToolAnimationTime = 0

local IsSeated = false

-- Functions
local function GetTool()
	for _, tools in script.Parent:GetChildren() do
		if tools:IsA("Tool") then
			return tools
		end
	end

	return nil
end

local function GetToolAnimation(Tool: Tool)
	for _, animation in Tool:GetChildren() do
		if animation.Name == "toolanim" and animation:IsA("StringValue") then
			return animation
		end
	end

	return nil
end

local function AnimateTool()
	if ToolAnimation == "None" then
		RightShoulder.DesiredAngle = 1.57

		return
	end

	if ToolAnimation == "Slash" then
		RightShoulder.MaxVelocity = 0.5
		RightShoulder.DesiredAngle = 0

		return
	end

	if ToolAnimation == "Lunge" then
		RightShoulder.MaxVelocity = 0.5
		LeftShoulder.MaxVelocity = 0.5
		RightHip.MaxVelocity = 0.5
		LeftHip.MaxVelocity = 0.5
		RightShoulder.DesiredAngle = 1.57
		LeftShoulder.DesiredAngle = 1.0
		RightHip.DesiredAngle = 1.57
		LeftHip.DesiredAngle = 1.0

		return
	end
end

local function Move(Time)
	local amplitude
	local frequency

	if Pose == "Jumping" then
		RightShoulder.MaxVelocity = 0.5
		LeftShoulder.MaxVelocity = 0.5
		RightShoulder.DesiredAngle = 3.14
		LeftShoulder.DesiredAngle = -3.14
		RightHip.DesiredAngle = 0
		LeftHip.DesiredAngle = 0

		return
	end

	if Pose == "FreeFall" then
		RightShoulder.MaxVelocity = 0.5
		LeftShoulder.MaxVelocity = 0.5
		RightShoulder.DesiredAngle = 3.14
		LeftShoulder.DesiredAngle = -3.14
		RightHip.DesiredAngle = 0
		LeftHip.DesiredAngle = 0

		return
	end

	if Pose == "Climbing" then
		RightShoulder.MaxVelocity = 0.5
		LeftShoulder.MaxVelocity = 0.5
		RightShoulder.DesiredAngle = -3.14
		LeftShoulder.DesiredAngle = 3.14
		RightHip.DesiredAngle = 0
		LeftHip.DesiredAngle = 0

		return
	end

	if Pose == "Seated" then
		RightShoulder.MaxVelocity = 0.15
		LeftShoulder.MaxVelocity = 0.15
		RightShoulder.DesiredAngle = 3.14 / 2
		LeftShoulder.DesiredAngle = -3.14 / 2
		RightHip.DesiredAngle = 3.14 / 2
		LeftHip.DesiredAngle = -3.14 / 2

		return
	end

	RightShoulder.MaxVelocity = 0.15
	LeftShoulder.MaxVelocity = 0.15

	if Pose == "Running" then
		amplitude = 1
		frequency = 9
	else
		amplitude = 0.1
		frequency = 1
	end

	local desiredAngle = amplitude * math.sin(Time * frequency)

	RightShoulder.DesiredAngle = desiredAngle
	LeftShoulder.DesiredAngle = desiredAngle
	RightHip.DesiredAngle = -desiredAngle
	LeftHip.DesiredAngle = -desiredAngle

	local tool = GetTool()

	if tool then
		local animationStringObject = GetToolAnimation(tool)

		if animationStringObject then
			ToolAnimation = animationStringObject.Value

			-- Message recieved, delete StringValue
			animationStringObject:Destroy()

			ToolAnimationTime = Time + 0.3
		end

		if Time > ToolAnimationTime then
			ToolAnimationTime = 0
			ToolAnimation = "None"
		end

		AnimateTool()
	else
		ToolAnimation = "None"
		ToolAnimationTime = 0
	end
end

-- Connections
Humanoid.Running:Connect(function()
	if IsSeated then
		return
	end

	if Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
		Pose = "Running"
	else
		Pose = "Standing"
	end
end)

Humanoid.Died:Connect(function()
	Pose = "Dead"
end)

Humanoid.Jumping:Connect(function()
	IsSeated = false
	Pose = "Jumping"
end)

Humanoid.Climbing:Connect(function()
	Pose = "Climbing"
end)

Humanoid.GettingUp:Connect(function()
	Pose = "GettingUp"
end)

Humanoid.FreeFalling:Connect(function()
	Pose = "FreeFall"
end)

Humanoid.FallingDown:Connect(function()
	Pose = "FallingDown"
end)

Humanoid.Seated:Connect(function()
	IsSeated = true
	Pose = "Seated"
end)

-- Main
local NextTime = 0

while script.Parent.Parent do
	local Time = RunService.Stepped:Wait()

	if Time > NextTime then
		Move(Time)
		NextTime = Time + 0.1
	end
end