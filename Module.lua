local GSM = {}
local TweenService = game:GetService("TweenService")
local TweenInfoSpike = TweenInfo.new(1)
local Down = 4

GSM.CheckValue = function(num)
	if num < 0 then
		return num
	elseif num > 0 then
		return math.abs(num)
	end
end

GSM.ValidateValue = function(num)
	if num < 0 then
		return math.abs(num)
	elseif num > 0 then
		return num
	end
end

GSM.Generate = function(AssignedModelSpike,Character)
	local Humanoid = Character:WaitForChild("Humanoid")
	local OldWS = Humanoid.WalkSpeed
	local OldJP = Humanoid.JumpPower
	Humanoid.WalkSpeed = 0
	Humanoid.JumpPower = 0
	local AssignedModel = AssignedModelSpike:Clone()
	local StartingPosition = Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,GSM.CheckValue(Down) + GSM.CheckValue(Character:WaitForChild("HumanoidRootPart").Position.Y),0)
	local ToVector = Vector3.new(StartingPosition.X,StartingPosition.Y,StartingPosition.Z)
	local UpPosition = GSM.CheckValue(StartingPosition.Y) + GSM.ValidateValue(Character:WaitForChild("HumanoidRootPart").Position.Y)
	local TweenToUp = TweenService:Create(AssignedModel.PrimaryPart,TweenInfoSpike,{Position = ToVector})
	AssignedModel.PrimaryPart.Position = StartingPosition
	AssignedModel.Parent = workspace
	wait(0.1)
	TweenToUp:Play()
	TweenToUp.Completed:Connect(function()
		Humanoid.WalkSpeed = OldWS
		Humanoid.JumpPower = OldJP
	end)
end

return GSM
