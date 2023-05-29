local Rainbow = {}

local Sequence = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 1)),
	ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
})

local function LerpSequence(Sequence: ColorSequence, Speed: number)
	local KeyPoints = Sequence.Keypoints
	
	for Key, Value in KeyPoints do
		if Value.Time > Speed then
			local Difference = Value.Time - KeyPoints[Key - 1].Time
			local Sepparation = Value.Time - Speed
			local Proportion = Sepparation / Difference
			
			return KeyPoints[Key - 1].Value:Lerp(Value.Value, Proportion)
		end
	end

	return nil
end

function Rainbow:Rain(Selection: SelectionBox, Speed: number)
	Selection.Color3 = LerpSequence(Sequence, Speed)
end

return Rainbow