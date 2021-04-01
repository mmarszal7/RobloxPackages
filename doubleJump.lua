local userInput = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer

--[[
-- Multi-jump
local function onJumpRequest2()
	player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end
]]

local canDoubleJump = false
local hasDoubleJumped = false
local TIME_BETWEEN_JUMPS = 0.2

function onJumpRequest()
	if canDoubleJump and not hasDoubleJumped then
		hasDoubleJumped = true
		player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end

local function characterAdded(newCharacter)
	humanoid = newCharacter:WaitForChild("Humanoid")
	humanoid.StateChanged:connect(function(old, new)
		if new == Enum.HumanoidStateType.Landed then
			canDoubleJump = false
			hasDoubleJumped = false
		elseif new == Enum.HumanoidStateType.Freefall then
			wait(TIME_BETWEEN_JUMPS)
			canDoubleJump = true
		end
	end)
end

player.CharacterAdded:Connect(characterAdded)
userInput.JumpRequest:Connect(onJumpRequest)