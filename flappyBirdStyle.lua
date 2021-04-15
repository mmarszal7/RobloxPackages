local RunService = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer

Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable

-- disable WSAD
local ContextActionService = game:GetService("ContextActionService")
local Arguments = {false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Left, Enum.KeyCode.Right}
ContextActionService:BindActionAtPriority("DisableArrowKeys", function() return Enum.ContextActionResult.Sink end, unpack(Arguments))

local function onRenderStep()
	if player.Character then
		-- fix camera at player
		local humanoidRootPart = player.Character.HumanoidRootPart
		local cameraPosition = humanoidRootPart.Position + Vector3.new(40,0,0)
		workspace.CurrentCamera.CoordinateFrame = CFrame.new(cameraPosition, humanoidRootPart.Position)
		
		-- fix player rotation
		humanoidRootPart.CFrame = (CFrame.new(humanoidRootPart.Position) * CFrame.Angles(0,0,0))
		
		-- move player with each render step
		local humanoid = player.Character:FindFirstChild("Humanoid")
		if humanoid then
			humanoid:Move(Vector3.new(1, 0, 0), true)
		end
	end
end

RunService:BindToRenderStep("move",	Enum.RenderPriority.Character.Value + 1, onRenderStep)
