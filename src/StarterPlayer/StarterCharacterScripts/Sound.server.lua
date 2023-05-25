-- Functions
local function CreateSound(Name: string, ID: string, Looped: boolean)
	local Sound = Instance.new("Sound", script.Parent.HumanoidRootPart)
	Sound.Name = Name
	Sound.SoundId = ID
	Sound.Looped = Looped
	Sound.Volume = 0.65
	Sound.Archivable = false

	return Sound
end

local function SoundState(State, Sound: Sound)
	if State then
		Sound:Play()
	else
		Sound:Stop()
	end
end

-- Declarations
local Humanoid = script.Parent:FindFirstChildOfClass("Humanoid")

local Died = CreateSound("Died", "rbxassetid://13112674056", false)
local Running = CreateSound("Running", "rbxasset://sounds/bfsl-minifigfoots1.mp3", true)
local Jumping = CreateSound("Jumping", "rbxasset://sounds/button.wav", false)
local GettingUp = CreateSound("GettingUp", "rbxasset://sounds/hit.wav", false)
local FreeFalling = CreateSound("FreeFalling", "rbxassetid://12222200", false)
local FallingDown = CreateSound("FallingDown", "rbxasset://sounds/splat.wav", false)

-- Connections
Humanoid.Died:Connect(function()
	Died:Play()
end)

Humanoid.Running:Connect(function()
	if Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
		Running:Play()
	else
		Running:Stop()
	end
end)

Humanoid.Jumping:Connect(function(state)
	SoundState(state, Jumping)
end)

Humanoid.GettingUp:Connect(function(state)
	SoundState(state, GettingUp)
end)

Humanoid.FreeFalling:Connect(function(state)
	SoundState(state, FreeFalling)
end)

Humanoid.FallingDown:Connect(function(state)
	SoundState(state, FallingDown)
end)