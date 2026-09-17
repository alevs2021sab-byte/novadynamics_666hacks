repeat task.wait() until game:IsLoaded()

-- 666 HACK — TP 3 PISOS / MEJOR VALOR
do
	local Players = game:GetService("Players")
	local LP2 = Players.LocalPlayer
	local TweenService2 = game:GetService("TweenService")
	local SoundService2 = game:GetService("SoundService")

	local splashGui = Instance.new("ScreenGui")
	splashGui.Name = "666_H4CK"
	splashGui.ResetOnSpawn = false
	splashGui.DisplayOrder = 999
	splashGui.IgnoreGuiInset = true
	splashGui.Parent = LP2:WaitForChild("PlayerGui")

	local overlay = Instance.new("Frame", splashGui)
	overlay.Size = UDim2.new(1,0,1,0)
	overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
	overlay.BackgroundTransparency = 0
	overlay.BorderSizePixel = 0
	overlay.ZIndex = 1

	local skipZone = Instance.new("TextButton", splashGui)
	skipZone.Size = UDim2.new(1,0,1,0)
	skipZone.BackgroundTransparency = 1
	skipZone.Text = ""
	skipZone.ZIndex = 9

	local container = Instance.new("Frame", splashGui)
	container.Size = UDim2.new(0,320,0,120)
	container.Position = UDim2.new(0.5,-160,0,-140)
	container.BackgroundTransparency = 1
	container.BorderSizePixel = 0
	container.ZIndex = 2
	container.ClipsDescendants = false

	local titleSplash = Instance.new("TextLabel", container)
	titleSplash.Size = UDim2.new(1,0,0,70)
	titleSplash.Position = UDim2.new(0,0,0,0)
	titleSplash.BackgroundTransparency = 1
	titleSplash.Text = "666 HACK"
	titleSplash.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleSplash.Font = Enum.Font.GothamBlack
	titleSplash.TextSize = 48
	titleSplash.TextTransparency = 0
	titleSplash.ZIndex = 3
	do
		local g = Instance.new("UIGradient", titleSplash)
		g.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 0, 0)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 60, 60)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 0))
		})
	end

	local fragments = {}
	local fragTexts = {"666"," ","HAC","K  "}
	local fragColors = {Color3.fromRGB(200,0,0),Color3.fromRGB(255,40,40),Color3.fromRGB(255,0,0),Color3.fromRGB(200,0,0)}
	for i, txt in ipairs(fragTexts) do
		local frag = Instance.new("TextLabel", splashGui)
		frag.Size = UDim2.new(0,90,0,60)
		frag.AnchorPoint = Vector2.new(0.5,0.5)
		frag.Position = UDim2.new(0.5, (i-2.5)*52, 0.5, -30)
		frag.BackgroundTransparency = 1
		frag.Text = txt
		frag.TextColor3 = fragColors[i]
		frag.Font = Enum.Font.GothamBlack
		frag.TextSize = 44
		frag.TextTransparency = 1
		frag.ZIndex = 5
		frag.Rotation = 0
		table.insert(fragments, frag)
	end

	local function playSound(id, pitch, vol, parent, delay)
		task.delay(delay or 0, function()
			local s = Instance.new("Sound")
			s.SoundId = id
			s.PlaybackSpeed = pitch
			s.Volume = vol
			s.Parent = parent
			s.RollOffMinDistance = 0
			s:Play()
			game:GetService("Debris"):AddItem(s, 3)
		end)
	end

	local function playGlitchImpact()
		pcall(function()
			playSound("rbxassetid://1588058260", 1.0, 0.9, SoundService2, 0)
			playSound("rbxassetid://8627516764", 0.8, 0.7, SoundService2, 0.02)
			playSound("rbxassetid://1588058260", 1.4, 0.5, SoundService2, 0.05)
			playSound("rbxassetid://8627516764", 1.2, 0.4, SoundService2, 0.1)
		end)
	end

	local function doShatterEffect()
		playGlitchImpact()
		local flash = Instance.new("Frame", splashGui)
		flash.Size = UDim2.new(1,0,1,0)
		flash.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
		flash.BackgroundTransparency = 0.3
		flash.BorderSizePixel = 0
		flash.ZIndex = 8
		TweenService2:Create(flash, TweenInfo.new(0.18), {BackgroundTransparency=1}):Play()
		game:GetService("Debris"):AddItem(flash, 0.3)
		titleSplash.TextTransparency = 1
		local RunService2 = game:GetService("RunService")
		for i, frag in ipairs(fragments) do
			frag.TextTransparency = 0
			local dirX = (i - 2.5) * 60 + math.random(-80, 80)
			local dirY = math.random(120, 280)
			local rot = math.random(-180, 180)
			local startPosX = frag.Position.X.Offset
			local startPosY = frag.Position.Y.Offset
			local t = 0
			local conn
			conn = RunService2.RenderStepped:Connect(function(dt)
				t = t + dt
				if t > 0.8 then frag.TextTransparency = 1; conn:Disconnect(); return end
				local alpha = t / 0.8
				local px = startPosX + dirX * alpha
				local py = startPosY - dirY * alpha + 300 * alpha * alpha
				local fade = math.clamp(alpha * 1.4 - 0.3, 0, 1)
				frag.Position = UDim2.new(0.5, px, 0.5, py - 30)
				frag.Rotation = rot * alpha
				frag.TextTransparency = fade
				frag.TextSize = math.clamp(44 - alpha * 20, 10, 44)
			end)
		end
		for li = 1, 8 do
			task.delay(li * 0.025, function()
				local line = Instance.new("Frame", splashGui)
				line.Size = UDim2.new(1, 0, 0, math.random(2,6))
				line.Position = UDim2.new(0, 0, math.random(), 0)
				line.BackgroundColor3 = Color3.fromRGB(255, math.random(0,60), math.random(0,60))
				line.BackgroundTransparency = math.random() * 0.3
				line.BorderSizePixel = 0
				line.ZIndex = 7
				TweenService2:Create(line, TweenInfo.new(0.12), {BackgroundTransparency=1}):Play()
				game:GetService("Debris"):AddItem(line, 0.2)
			end)
		end
	end

	local splashDone = false
	local function finishSplash()
		if splashDone then return end
		splashDone = true
		TweenService2:Create(overlay, TweenInfo.new(0.4), {BackgroundTransparency=1}):Play()
	end

	skipZone.MouseButton1Click:Connect(function()
		titleSplash.TextTransparency = 1
		finishSplash()
	end)

	task.spawn(function()
		TweenService2:Create(overlay, TweenInfo.new(0.2), {BackgroundTransparency=0.1}):Play()
		task.wait(0.15)
		TweenService2:Create(container, TweenInfo.new(0.45, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
			{Position=UDim2.new(0.5,-160,0.5,-60)}):Play()
		task.wait(0.5)
		doShatterEffect()
		task.wait(0.85)
		finishSplash()
		task.wait(0.45)
		if splashGui and splashGui.Parent then splashGui:Destroy() end
	end)

	local _t0 = tick()
	while not splashDone and (tick() - _t0) < 3.0 do
		task.wait(0.05)
	end
end

-- FUNCIONES PRINCIPALES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local LOCAL_NAME_LOW = LP.Name:lower()
local UserInputService = game:GetService("UserInputService")

local function getChar() return LP.Character end
local function getRoot() local c = getChar() return c and c:FindFirstChild("HumanoidRootPart") end
local function getHum() local c = getChar() return c and c:FindFirstChildOfClass("Humanoid") end

local function click()
	pcall(function()
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://6895079853"
		s.Volume = 0.4
		s.Parent = SoundService
		s:Play()
		Debris:AddItem(s, 1)
	end)
end

-- Velocidades ajustadas
local SPEED_STEAL_VAL = 38
local TP_SPEED_VAL = 65

local Config = {
	AntiRagdoll = false,
	SpeedSteal = false,
	BoostJump = false,
	AutoGrab = false,
	FPSBoost = false,
	Float = false,
	DropBrainrot = false,
	AutoReset = false,
	InvisSteal = true
}

local antiConn, jumpConn, floatConn, floatBase, dropConn, resetConn, speedControlConn

-- INVIS STEAL
local invisData = {
	connections = { SemiInvisible = {} },
	isInvisible = false,
	clone = nil, oldRoot = nil, hip = nil, animTrack = nil,
	connection = nil, characterConnection = nil,
	DEPTH_OFFSET = 0.09
}

local function removeFoldersInvis()
	local playerName = LP.Name
	local playerFolder = workspace:FindFirstChild(playerName)
	if not playerFolder then return end
	local doubleRig = playerFolder:FindFirstChild("DoubleRig")
	if doubleRig then doubleRig:Destroy() end
	local constraints = playerFolder:FindFirstChild("Constraints")
	if constraints then constraints:Destroy() end
	local childAddedConn = playerFolder.ChildAdded:Connect(function(child)
		if child.Name == "DoubleRig" or child.Name == "Constraints" then child:Destroy() end
	end)
	table.insert(invisData.connections.SemiInvisible, childAddedConn)
end

local function doCloneInvis()
	if LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then
		invisData.hip = LP.Character.Humanoid.HipHeight
		invisData.oldRoot = LP.Character:FindFirstChild("HumanoidRootPart")
		if not invisData.oldRoot or not invisData.oldRoot.Parent then return false end
		local tempParent = Instance.new("Model")
		tempParent.Parent = game
		LP.Character.Parent = tempParent
		invisData.clone = invisData.oldRoot:Clone()
		invisData.clone.Parent = LP.Character
		invisData.oldRoot.Parent = workspace.CurrentCamera
		invisData.clone.CFrame = invisData.oldRoot.CFrame
		LP.Character.PrimaryPart = invisData.clone
		LP.Character.Parent = workspace
		for _, v in pairs(LP.Character:GetDescendants()) do
			if v:IsA("Weld") or v:IsA("Motor6D") then
				if v.Part0 == invisData.oldRoot then v.Part0 = invisData.clone end
				if v.Part1 == invisData.oldRoot then v.Part1 = invisData.clone end
			end
		end
		tempParent:Destroy()
		return true
	end
	return false
end

local function revertCloneInvis()
	if not invisData.oldRoot or not invisData.oldRoot:IsDescendantOf(workspace) or not LP.Character or LP.Character.Humanoid.Health <= 0 then return false end
	local tempParent = Instance.new("Model")
	tempParent.Parent = game
	LP.Character.Parent = tempParent
	invisData.oldRoot.Parent = LP.Character
	LP.Character.PrimaryPart = invisData.oldRoot
	LP.Character.Parent = workspace
	invisData.oldRoot.CanCollide = true
	for _, v in pairs(LP.Character:GetDescendants()) do
		if v:IsA("Weld") or v:IsA("Motor6D") then
			if v.Part0 == invisData.clone then v.Part0 = invisData.oldRoot end
			if v.Part1 == invisData.clone then v.Part1 = invisData.oldRoot end
		end
	end
	if invisData.clone then
		local oldPos = invisData.clone.CFrame
		invisData.clone:Destroy()
		invisData.clone = nil
		invisData.oldRoot.CFrame = oldPos
	end
	invisData.oldRoot = nil
	if LP.Character and LP.Character.Humanoid then
		LP.Character.Humanoid.HipHeight = invisData.hip
	end
end

local function animationTrickeryInvis()
	if LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then
		local anim = Instance.new("Animation")
		anim.AnimationId = "http://www.roblox.com/asset/?id=18537363391"
		local humanoid = LP.Character.Humanoid
		local animator = humanoid:FindFirstChild("Animator") or Instance.new("Animator", humanoid)
		invisData.animTrack = animator:LoadAnimation(anim)
		invisData.animTrack.Priority = Enum.AnimationPriority.Action4
		invisData.animTrack:Play(0, 1, 0)
		anim:Destroy()
		local animStoppedConn = invisData.animTrack.Stopped:Connect(function()
			if invisData.isInvisible then animationTrickeryInvis() end
		end)
		table.insert(invisData.connections.SemiInvisible, animStoppedConn)
		task.delay(0, function()
			invisData.animTrack.TimePosition = 0.7
			task.delay(1, function()
				invisData.animTrack:AdjustSpeed(math.huge)
			end)
		end)
	end
end

local function setupGodmodeInvis()
	local char = LP.Character or LP.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")
	local mt = getrawmetatable(game)
	local oldNC = mt.__namecall
	local oldNI = mt.__newindex
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(self, ...)
		local m = getnamecallmethod()
		if self == hum then
			if m == "ChangeState" and select(1, ...) == Enum.HumanoidStateType.Dead then return end
			if m == "SetStateEnabled" then
				local st, en = ...
				if st == Enum.HumanoidStateType.Dead and en == true then return end
			end
			if m == "Destroy" then return end
		end
		if self == char and m == "BreakJoints" then return end
		return oldNC(self, ...)
	end)
	mt.__newindex = newcclosure(function(self, k, v)
		if self == hum then
			if k == "Health" and type(v) == "number" and v <= 0 then return end
			if k == "MaxHealth" and type(v) == "number" and v < hum.MaxHealth then return end
			if k == "BreakJointsOnDeath" and v == true then return end
			if k == "Parent" and v == nil then return end
		end
		return oldNI(self, k, v)
	end)
	setreadonly(mt, true)
end

local function enableInvisibility()
	if not LP.Character or LP.Character.Humanoid.Health <= 0 then return false end
	removeFoldersInvis()
	local success = doCloneInvis()
	if success then
		task.wait(0.1)
		animationTrickeryInvis()
		invisData.connection = RunService.PreSimulation:Connect(function(dt)
			if LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 and invisData.oldRoot then
				local root = LP.Character.PrimaryPart or LP.Character:FindFirstChild("HumanoidRootPart")
				if root then
					local cf = root.CFrame - Vector3.new(0, LP.Character.Humanoid.HipHeight + (root.Size.Y / 2) - 1 + invisData.DEPTH_OFFSET, 0)
					invisData.oldRoot.CFrame = cf * CFrame.Angles(math.rad(180), 0, 0)
					invisData.oldRoot.Velocity = root.Velocity
					invisData.oldRoot.CanCollide = false
				end
			end
		end)
		table.insert(invisData.connections.SemiInvisible, invisData.connection)
		invisData.characterConnection = LP.CharacterAdded:Connect(function(newChar)
			if invisData.isInvisible then
				if invisData.animTrack then invisData.animTrack:Stop(); invisData.animTrack:Destroy(); invisData.animTrack = nil end
				if invisData.connection then invisData.connection:Disconnect() end
				revertCloneInvis()
				removeFoldersInvis()
				invisData.isInvisible = false
				for _, conn in ipairs(invisData.connections.SemiInvisible) do if conn then conn:Disconnect() end end
				invisData.connections.SemiInvisible = {}
			end
		end)
		table.insert(invisData.connections.SemiInvisible, invisData.characterConnection)
		return true
	end
	return false
end

local function disableInvisibility()
	if invisData.animTrack then invisData.animTrack:Stop(); invisData.animTrack:Destroy(); invisData.animTrack = nil end
	if invisData.connection then invisData.connection:Disconnect() end
	if invisData.characterConnection then invisData.characterConnection:Disconnect() end
	revertCloneInvis()
	removeFoldersInvis()
end

local function setInvisSteal(on)
	if on then
		if not invisData.isInvisible then
			removeFoldersInvis()
			setupGodmodeInvis()
			if enableInvisibility() then
				invisData.isInvisible = true
			end
		end
	else
		if invisData.isInvisible then
			disableInvisibility()
			invisData.isInvisible = false
			for _, conn in ipairs(invisData.connections.SemiInvisible) do if conn then conn:Disconnect() end end
			invisData.connections.SemiInvisible = {}
		end
	end
end

-- ANTI RAGDOLL
local cachedAnti = {}
local function cacheCharacterAnti()
    local char = LP.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return false end
    cachedAnti = {character = char, humanoid = hum, root = root}
    return true
end
local function isRagdolledAnti()
    local hum = cachedAnti.humanoid
    if not hum then return false end
    local state = hum:GetState()
    return state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown
end
local function removeRagdollConstraintsAnti()
    if not cachedAnti.character then return end
    for _, v in ipairs(cachedAnti.character:GetDescendants()) do
        if v:IsA("BallSocketConstraint") or (v:IsA("Attachment") and v.Name:find("RagdollAttachment")) then pcall(function() v:Destroy() end) end
    end
end
local function forceExitRagdollAnti()
    local hum = cachedAnti.humanoid
    if not hum then return end
    if hum.Health > 0 then hum:ChangeState(Enum.HumanoidStateType.Running) end
end
local function setAntiRagdoll(on)
	if antiConn then antiConn:Disconnect() antiConn = nil end
	if not on then cachedAnti = {} return end
	if not cacheCharacterAnti() then return end
	antiConn = RunService.RenderStepped:Connect(function()
		if not cachedAnti.humanoid or not cachedAnti.humanoid.Parent then return end
		if isRagdolledAnti() then removeRagdollConstraintsAnti() forceExitRagdollAnti() end
	end)
end
LP.CharacterAdded:Connect(function() task.wait(0.5) if Config.AntiRagdoll then cacheCharacterAnti() end end)

-- SPEED STEAL
local function applySpeed()
	local h = getHum()
	if not h then return end
	h.WalkSpeed = Config.SpeedSteal and SPEED_STEAL_VAL or 16
	h.JumpPower = Config.BoostJump and 60 or 50
	h.UseJumpPower = true
	h.AutoRotate = true
	h.PlatformStand = false
end

local function setSpeedControl(on)
	if speedControlConn then speedControlConn:Disconnect() speedControlConn = nil end
	if not on then return end
	speedControlConn = RunService.Heartbeat:Connect(function()
		local root = getRoot()
		if not root then return end
		local cam = workspace.CurrentCamera
		local cf = cam.CFrame
		local forward = Vector3.new(cf.LookVector.X,0,cf.LookVector.Z).Unit
		local right = Vector3.new(cf.RightVector.X,0,cf.RightVector.Z).Unit
		local moveDir = Vector3.zero
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += forward end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= forward end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= right end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += right end
		if moveDir.Magnitude > 0.01 then
			moveDir = moveDir.Unit
			root.AssemblyLinearVelocity = Vector3.new(moveDir.X * SPEED_STEAL_VAL, root.AssemblyLinearVelocity.Y, moveDir.Z * SPEED_STEAL_VAL)
		end
	end)
end

-- JUMP BOOST
local function setBoostJump(on)
	if jumpConn then jumpConn:Disconnect() jumpConn = nil end
	if not on then local h = getHum() if h then h.UseJumpPower = true h.JumpPower = 50 end return end
	local h = getHum()
	if h then h.UseJumpPower = true h.JumpPower = 60 end
	jumpConn = RunService.Heartbeat:Connect(function()
		if not Config.BoostJump then return end
		local r = getRoot()
		if r and r.AssemblyLinearVelocity.Y < -2 then
			r.AssemblyLinearVelocity = Vector3.new(r.AssemblyLinearVelocity.X, math.max(r.AssemblyLinearVelocity.Y * 0.92, -12), r.AssemblyLinearVelocity.Z)
		end
	end)
end

-- FPS BOOST
local function setFPS(on)
	if on then
		pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 settings().Rendering.Mode = Enum.RenderMode.ForcePerformance settings().Physics.Throttle = Enum.PhysicsThrottle.Minimum end)
		Lighting.TimeOfDay = "14:00:00" Lighting.Brightness = 1.5 Lighting.Ambient = Color3.fromRGB(200,200,200) Lighting.FogEnd = 500 Lighting.GlobalShadows = false Lighting.OutdoorAmbient = Color3.fromRGB(200,200,200)
		local char = getChar()
		if char then for _,v in ipairs(char:GetChildren()) do if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") then pcall(function() v:Destroy() end) end end end
		for _,v in ipairs(workspace:GetDescendants()) do
			if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Light") or v:IsA("SmokeEmitter") or v:IsA("Fire") or v:IsA("Explosion") then v.Enabled = false
			elseif v:IsA("BasePart") then v.CastShadow = false v.Material = Enum.Material.Plastic v.Reflectance = 0
			elseif v:IsA("Decal") or v:IsA("Texture") or v:IsA("SurfaceLight") then v.Transparency = 1
			elseif v:IsA("Sound") then v.Volume = 0 end
		end
		for _,v in ipairs(Lighting:GetChildren()) do if v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("GrainEffect") then v:Destroy() end end
	else
		Lighting.TimeOfDay = "14:00:00" Lighting.Brightness = 2 Lighting.FogEnd = 100000 Lighting.GlobalShadows = true
		pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level10 end)
	end
end

-- FLOAT
local function setFloat(on)
	if floatConn then floatConn:Disconnect() floatConn = nil end
	if floatBase then floatBase:Destroy() floatBase = nil end
	if not on then return end
	local MAX_HEIGHT = 12; local SPEED = 22
	floatBase = Instance.new("Part")
	floatBase.Name = "FloatPlatform"
	floatBase.Shape = Enum.PartType.Block
	floatBase.Size = Vector3.new(3.2, 0.25, 3.2)
	floatBase.BrickColor = BrickColor.new("Bright red")
floatBase.CanCollide = false
floatBase.CanTouch = false
floatBase.Massless = true
floatBase.Parent = workspace

floatConn = RunService.Heartbeat:Connect(function()
	if not Config.Float then return end
	local root = getRoot()
	if not root then return end
	floatBase.Position = Vector3.new(root.Position.X, root.Position.Y - 1.8, root.Position.Z)
	floatBase.CFrame = CFrame.new(floatBase.Position)
	if root.Position.Y < root.Position.Y + MAX_HEIGHT - 0.5 then
		root.AssemblyLinearVelocity = Vector3.new(0, SPEED, 0)
	else
		root.AssemblyLinearVelocity = Vector3.zero
	end
end)
end

-- DROP BRAINROT
local dropConns = {}
local function setDropBrainrot(on)
	for _,c in ipairs(dropConns) do
		if typeof(c)=="RBXScriptConnection" then c:Disconnect() end
	end
	dropConns = {}
	if not on then return end
	task.spawn(function()
		while Config.DropBrainrot do
			RunService.Heartbeat:Wait()
			local c = getChar()
			local root = c and c:FindFirstChild("HumanoidRootPart")
			if not root then continue end
			local vel = root.Velocity
			root.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
			RunService.RenderStepped:Wait()
			if root and root.Parent then root.Velocity = vel end
			RunService.Stepped:Wait()
			if root and root.Parent then root.Velocity = vel + Vector3.new(0, 0.1, 0) end
		end
	end)
end

-- AUTO RESET
local resetConn
local function setAutoReset(on)
	if resetConn then resetConn:Disconnect() resetConn = nil end
	if not on then return end
	resetConn = RunService.Heartbeat:Connect(function()
		local root = getRoot()
		if not root then return end
		local pos = root.Position
		if pos.Y < 5 or pos.Y > 250 or math.abs(pos.X) > 450 or math.abs(pos.Z) > 450 then
			root.CFrame = CFrame.new(Vector3.new(0, 40, 0))
			task.wait(2)
		end
	end)
end

-- BLOQUEO ROBUX
local function blockRobuxPrompts()
	local blockList = {"abrir base", "unlock base", "buy", "comprar", "cobrar", "robux", "open base", "desbloquear", "purchase", "pay", "cost"}
	local function isBadPrompt(text)
		if not text then return false end
		local t = text:lower()
		for _, word in ipairs(blockList) do if t:find(word) then return true end end
		return false
	end
	task.spawn(function()
		while true do
			task.wait(0.25)
			for _, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("ProximityPrompt") and isBadPrompt(v.ActionText) then
					v.Enabled = false
					v.Triggered:DisconnectAll()
					v.Name = "BLOCKED_SAFE"
				end
			end
			for _, v in ipairs(PlayerGui:GetDescendants()) do
				if v:IsA("TextButton") or v:IsA("ImageButton") then
					local txt = ((v.Text or ""):lower() .. (v.Name or ""):lower())
					if isBadPrompt(txt) then
						v.Active = false
						v.Interactable = false
						v.BackgroundTransparency = 1
					end
				end
			end
		end
	end)
end
blockRobuxPrompts()

-- AUTO GRAB
local PlayersAG = game:GetService("Players")
local RunServiceAG = game:GetService("RunService")
local lpAG = PlayersAG.LocalPlayer
local STEAL_RADIUS = 60
local STEAL_DURATION = 1.4
local isStealingAG = false
local StealDataAG = {}

local function getHRP()
	local c = lpAG.Character
	if c then return c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso") end
	return nil
end

local function isMyPlotByName(pn)
	local nm = (pn or ""):lower()
	return nm:find("your base") or nm:find("mi base") or nm:find("yourbase") or nm:find(LOCAL_NAME_LOW)
end

local function findNearestPrompt()
	local hrp = getHRP(); if not hrp then return nil end
	local plots = workspace:FindFirstChild("Plots"); if not plots then return nil end
	local nearest, dist = nil, math.huge
	for _, plot in ipairs(plots:GetChildren()) do
		if isMyPlotByName(plot.Name) then continue end
		local pods = plot:FindFirstChild("AnimalPodiums"); if not pods then continue end
		for _, pod in ipairs(pods:GetChildren()) do
			local base = pod:FindFirstChild("Base"); if not base then continue end
			local spawn = base:FindFirstChild("Spawn"); if not spawn then continue end
			local d = (spawn.Position - hrp.Position).Magnitude
			if d <= STEAL_RADIUS and d < dist then
				local att = spawn:FindFirstChild("PromptAttachment")
				if att then
					for _, p in ipairs(att:GetChildren()) do
						if p:IsA("ProximityPrompt") and p.ActionText and p.ActionText:find("Steal") then
							nearest, dist = p, d
						end
					end
				end
			end
		end
	end
	return nearest
end

local function executeSteal(prompt)
	if isStealingAG then return end
	if not StealDataAG[prompt] then
		StealDataAG[prompt] = {hold = {}, trigger = {}, ready = true}
		if getconnections then
			for _, c in ipairs(getconnections(prompt.PromptButtonHoldBegan)) do
				if c.Function then table.insert(StealDataAG[prompt].hold, c.Function) end
			end
			for _, c in ipairs(getconnections(prompt.Triggered)) do
				if c.Function then table.insert(StealDataAG[prompt].trigger, c.Function) end
			end
		end
	end
	local data = StealDataAG[prompt]; if not data.ready then return end
	data.ready = false; isStealingAG = true
	local startTime = tick()
	task.spawn(function()
		for _, f in ipairs(data.hold) do pcall(f) end
		while tick() - startTime < STEAL_DURATION do task.wait() end
		for _, f in ipairs(data.trigger) do pcall(f) end
		task.wait(0.05); data.ready = true; isStealingAG = false
	end)
end

local heartbeatConnAG
local function setAutoGrab(on)
	if heartbeatConnAG then heartbeatConnAG:Disconnect() heartbeatConnAG = nil end
	if not on then isStealingAG = false return end
	heartbeatConnAG = RunServiceAG.Heartbeat:Connect(function()
		if isStealingAG then return end
		local success, prompt = pcall(findNearestPrompt)
		if success and prompt then pcall(executeSteal, prompt) end
	end)
end

-- TP 3 PISOS / MEJOR VALOR
local flying, flyConn, active = false, nil, false

local function parseMoney(str)
	if not str then return 0 end
	str = string.lower(tostring(str)):gsub(",", ""):gsub("%s", ""):gsub("%$", ""):gsub("/s", "")
	local num, suf = str:match("([%d%.]+)([kmbtq]a?)")
	if not num then return 0 end
	local n = tonumber(num) or 0
	if suf == "k" then n = n * 1e3
	elseif suf == "m" then n = n * 1e6
	elseif suf == "b" then n = n * 1e9
	elseif suf == "t" then n = n * 1e12
	elseif suf == "q" or suf == "qa" then n = n * 1e15
	end
	if (not suf or suf == "") and n < 500 then return 0 end
	return n
end

local function rarity(text)
	text = string.lower(tostring(text or ""))
	if text:find("og") and not text:find("dog") then return 5 end
	if text:find("secret") or text:find("secreto") then return 4 end
	if text:find("god") or text:find("dios") then return 3 end
	if text:find("mitico") or text:find("mythic") then return 2 end
	return 1
end

local function getGen(pod)
	local maxV = 0
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("TextLabel") or d:IsA("TextButton") then
			local v = parseMoney(d.Text)
			if v > maxV then maxV = v end
		end
	end
	return maxV
end

local function getRarity(pod)
	local best = rarity(pod.Name)
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("TextLabel") then
			local r = rarity(d.Text)
			if r > best then best = r end
		end
	end
	return best
end

local function score(pod)
	local g, r = getGen(pod), getRarity(pod)
	return g * 10 + r, g, r
end

local function isMine(plot)
	local n = string.lower(plot.Name)
	local me = LP.Name:lower()
	return n:find(me) or n:find("your base") or n:find("mi base") or n:find("base de")
end

local function isStealPrompt(p)
	local a = string.lower(tostring(p.ActionText or "") .. tostring(p.ObjectText or ""))
	return a:find("steal") or a:find("robar") or a:find("recoger") or a:find("collect")
end

local function findBest()
	local plots = workspace:FindFirstChild("Plots")
	if not plots then return nil end
	local best, bestScore = nil, -1
	for _, plot in ipairs(plots:GetChildren()) do
		if not isMine(plot) then
			local pods = plot:FindFirstChild("AnimalPodiums")
			if pods then
				for _, pod in ipairs(pods:GetChildren()) do
					local prompt
					for _, d in ipairs(pod:GetDescendants()) do
						if d:IsA("ProximityPrompt") and isStealPrompt(d) then
							prompt = d
							break
						end
					end
					if prompt then
						local base = pod:FindFirstChild("Base")
						local spawn = base and base:FindFirstChild("Spawn")
						local part = spawn or pod:FindFirstChildWhichIsA("BasePart", true)
						local total, gen, rar = score(pod)
						if total > bestScore and part then
							bestScore = total
							best = { part = part, prompt = prompt, name = pod.Name, gen = gen }
						end
					end
				end
			end
		end
	end
	return best
end

local function equip(name)
	local char, bag = LP.Character, LP:FindFirstChild("Backpack")
	local tool = (char and char:FindFirstChild(name)) or (bag and bag:FindFirstChild(name))
	if not tool then return nil end
	local h = getHum()
	if h and tool.Parent == bag then
		pcall(function() h:EquipTool(tool) end)
		task.wait(0.1)
	end
	return tool
end

local function stopFly()
	flying = false
	if flyConn then flyConn:Disconnect() flyConn = nil end
	local r = getRoot()
	if r then r.AssemblyLinearVelocity = Vector3.zero end
end

local function startFly()
	if flying then return end
	equip("Flying Carpet")
	local best = findBest()
	if not best or not best.part then return end

	flying = true
	local target, prompt = best.part, best.prompt
	local speed = TP_SPEED_VAL
	local arrived = false

	flyConn = RunService.Heartbeat:Connect(function()
		if not flying or not active then return end
		local r = getRoot()
		if not r or not target.Parent then stopFly() return end

		local goal = target.Position + Vector3.new(0, 3, 0)
		local offset = goal - r.Position
		local dist = offset.Magnitude
		local needUp = goal.Y - r.Position.Y

		if dist < 7 then
			r.AssemblyLinearVelocity = Vector3.new(offset.X * 3, math.clamp(offset.Y * 3, -12, 16), offset.Z * 3)
			if dist < 4 and not arrived then
				arrived = true
				r.AssemblyLinearVelocity = Vector3.zero
				task.spawn(function()
					for i = 1, 5 do
						local cl = equip("Quantum Cloner")
						if cl then pcall(function() cl:Activate() end) end
						task.wait(0.12)
					end
					for i = 1, 8 do
						if not active then break end
						local r2 = getRoot()
						if r2 and target.Parent then
							local o2 = (target.Position + Vector3.new(0, 3, 0)) - r2.Position
							r2.AssemblyLinearVelocity = o2.Magnitude > 2 and o2.Unit * 12 or Vector3.zero
						end
						if prompt then
							pcall(function()
								if fireproximityprompt then
									fireproximityprompt(prompt)
								else
									prompt:InputHoldBegin()
									task.wait(0.9)
									prompt:InputHoldEnd()
								end
							end)
						end
						task.wait(0.45)
					end
					stopFly()
				end)
			end
			return
		end

		local dir = offset.Unit
		local vx, vz = dir.X * speed, dir.Z * speed
		local vy
		if needUp > 6 then
			vy = 28
		elseif needUp > 2.5 then
			vy = 22
		else
			vy = math.clamp(dir.Y * speed, -18, 20)
		end
		r.AssemblyLinearVelocity = Vector3.new(vx, vy, vz)
	end)
end

-- Anti muerte
RunService.Heartbeat:Connect(function()
	local hum = getHum()
	if hum and hum.Health > 0 and hum.Health < hum.MaxHealth * 0.25 then
		hum.Health = hum.MaxHealth
	end
end)

-- Reactivar tras respawn
LP.CharacterAdded:Connect(function()
	task.wait(1)
	if active then startFly() end
end)

-- INTERFAZ
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "666_HACK"
MainGui.ResetOnSpawn = false
MainGui.IgnoreGuiInset = true
MainGui.DisplayOrder = 50
MainGui.Parent = PlayerGui

local MainBtn = Instance.new("TextButton")
MainBtn.Size = UDim2.new(0,44,0,44)
MainBtn.Position = UDim2.new(0,10,0.42,0)
MainBtn.BackgroundColor3 = Color3.fromRGB(18,18,18)
MainBtn.Text = "666"
MainBtn.TextColor3 = Color3.fromRGB(255,60,150)
MainBtn.TextSize = 15
MainBtn.Font = Enum.Font.GothamBlack
MainBtn.Parent = MainGui
Instance.new("UICorner",MainBtn).CornerRadius = UDim.new(1,0)

local Panel = Instance.new("Frame")
Panel.Size = UDim2.new(0,130,0,250)
Panel.Position = UDim2.new(0,60,0.25,0)
Panel.BackgroundColor3 = Color3.fromRGB(8,8,12)
Panel.BackgroundTransparency = 0.05
Panel.Visible = false
Panel.Active = true
Panel.Draggable = true
Panel.Parent = MainGui
Instance.new("UICorner",Panel).CornerRadius = UDim.new(0,12)

local Title = Instance.new("TextLabel",Panel)
Title.Size = UDim2.new(1,0,0,25)
Title.BackgroundTransparency = 1
Title.Text = "666 HACK"
Title.TextColor3 = Color3.fromRGB(255,45,75)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 14
Title.Parent = Panel

MainBtn.MouseButton1Click:Connect(function() click() Panel.Visible = not Panel.Visible end)

-- Botones lado derecho
local function makeSideBtn(name,y,configKey,func)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0,44,0,44)
	b.Position = UDim2.new(1,-54,0,y)
	b.BackgroundColor3 = Color3.fromRGB(20,20,20)
	b.Text = name
	b.TextColor3 = Color3.fromRGB(255,255,255)
	b.TextSize = 8
	b.Font = Enum.Font.GothamBold
	b.Parent = MainGui
	Instance.new("UICorner",b).CornerRadius = UDim.new(1,0)

	b.MouseButton1Click:Connect(function()
		click()
		if configKey == "Teleport" then
			active = not active
			if active then
				b.BackgroundColor3 = Color3.fromRGB(30,180,70)
				startFly()
			else
				b.BackgroundColor3 = Color3.fromRGB(20,20,20)
				stopFly()
			end
		else
			Config[configKey] = not Config[configKey]
			func()
			TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = Config[configKey] and Color3.fromRGB(25, 180, 25) or Color3.fromRGB(20,20,20)}):Play()
		end
	end)
end

makeSideBtn("DROP", 10, "DropBrainrot", function() setDropBrainrot(Config.DropBrainrot) end)
makeSideBtn("RESET", 62, "AutoReset", function() setAutoReset(Config.AutoReset) end)
makeSideBtn("FLOAT", 114, "Float", function() setFloat(Config.Float) end)
makeSideBtn("TP", 166, "Teleport", function() end)
makeSideBtn("INVIS", 218, "InvisSteal", function() setInvisSteal(Config.InvisSteal) end)

-- Botones del panel
local function makeToggle(name,key,y,func)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,-16,0,26)
	b.Position = UDim2.new(0,8,0,y)
	b.BackgroundColor3 = Color3.fromRGB(22,22,28)
	b.Text = name
	b.TextColor3 = Color3.fromRGB(210,210,210)
	b.TextSize = 10
	b.Font = Enum.Font.GothamBold
	b.Parent = Panel
	Instance.new("UICorner",b).CornerRadius = UDim.new(0,7)

	b.MouseButton1Click:Connect(function()
		click()
		Config[key] = not Config[key]
		func()
		TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = Config[key] and Color3.fromRGB(28,180,60) or Color3.fromRGB(22,22,28)}):Play()
	end)
end

makeToggle("AntiRagdoll", "AntiRagdoll", 30, function() setAntiRagdoll(Config.AntiRagdoll) end)
makeToggle("SpeedSteal", "SpeedSteal", 62, function() applySpeed() setSpeedControl(Config.SpeedSteal) end)
makeToggle("BoostJump", "BoostJump", 94, function() setBoostJump(Config.BoostJump) end)
makeToggle("AutoGrab", "AutoGrab", 126, function() setAutoGrab(Config.AutoGrab) end)
makeToggle("FPSBoost", "FPSBoost", 158, function() setFPS(Config.FPSBoost) end)

print("TP 3 PISOS / MEJOR VALOR — ACTIVO")
