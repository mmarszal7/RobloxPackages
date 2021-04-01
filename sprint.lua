local userInput = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
--player.DevEnableMouseLock = false

local sprintSpeed = 30
local walkSpeed = 16

local function beginSprint(input, gameProcessed)
	if not gameProcessed then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			player.Character.Humanoid.WalkSpeed = sprintSpeed 
		end
	end
end

local function endSprint(input, gameProcessed)
	if not gameProcessed then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			player.Character.Humanoid.WalkSpeed = walkSpeed
		end
	end
end

userInput.InputBegan:Connect(beginSprint)
userInput.InputEnded:Connect(endSprint)

