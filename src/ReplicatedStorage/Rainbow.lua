local Rainbow = {}

local colorSequence = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0)),ColorSequenceKeypoint.new(0.5,Color3.new(0,0,1)),ColorSequenceKeypoint.new(1,Color3.new(1,0,0))})

local function PointInSequence(sequence: ColorSequence, speed: number)
	local KeyPoints = sequence.Keypoints
	
	for key, value in pairs(KeyPoints) do
		if value.Time > speed then
			local Difference = value.Time - KeyPoints[key - 1].Time
			local Sepparation = value.Time - speed
			local Proportion = Sepparation / Difference
			
			return KeyPoints[key - 1].Value:Lerp(value.Value, Proportion)
		end
	end

	return nil
end

function Rainbow:Rain(selection, speed: number)
	selection.Color3 = PointInSequence(colorSequence, speed)
end

return Rainbow