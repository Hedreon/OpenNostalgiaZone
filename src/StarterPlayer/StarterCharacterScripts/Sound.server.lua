-- Functions
local function CreateSound(Name: string, ID: string, Looped: boolean)
	local Sound = Instance.new("Sound")
	Sound.Name = Name
	Sound.SoundId = ID
	Sound.Looped = Looped
	Sound.Volume = 0.65
	Sound.Archivable = false
	Sound.Parent = script.Parent.HumanoidRootPart

	return Sound
end

local function SoundState(State: boolean, Sound: Sound)
	if State then
		Sound:Play()
	else
		Sound:Stop()
	end
end

-- Declarations
local Humanoid: Humanoid? = script.Parent:FindFirstChildOfClass("Humanoid")

local Died: Sound = CreateSound("Died", "rbxassetid://13112674056", false)
local Running: Sound = CreateSound("Running", "rbxasset://sounds/bfsl-minifigfoots1.mp3", true)
local Jumping: Sound = CreateSound("Jumping", "rbxasset://sounds/button.wav", false)
local GettingUp: Sound = CreateSound("GettingUp", "rbxasset://sounds/hit.wav", false)
local FreeFalling: Sound = CreateSound("FreeFalling", "rbxassetid://12222200", false)
local FallingDown: Sound = CreateSound("FallingDown", "rbxasset://sounds/splat.wav", false)

-- Connections
if Humanoid then
	Humanoid.Died:Connect(function()
		Died:Play()
	end)
	
	Humanoid.Running:Connect(function()
		if Humanoid.MoveDirection.Magnitude > 0 and Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
			Running:Play()
		else
			Running:Stop()
		end
	end)
	
	Humanoid.Jumping:Connect(function(State: boolean)
		SoundState(State, Jumping)
	end)
	
	Humanoid.GettingUp:Connect(function(State: boolean)
		SoundState(State, GettingUp)
	end)
	
	Humanoid.FreeFalling:Connect(function(State: boolean)
		SoundState(State, FreeFalling)
	end)
	
	Humanoid.FallingDown:Connect(function(State: boolean)
		SoundState(State, FallingDown)
	end)
end