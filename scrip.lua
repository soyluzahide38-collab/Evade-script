--// ====================================================================
--// ÖMER - PİGGY MASTER CHEAT V1 [FINAL RELEASE EDITION]
--// ====================================================================

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

if CoreGui:FindFirstChild("OmerPiggyUltimateV1") then
	CoreGui.OmerPiggyUltimateV1:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OmerPiggyUltimateV1"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

--// ⚠️ PİGGY YAKLAŞMA UYARI EKRANI
local warningLabel = Instance.new("TextLabel")
warningLabel.Size = UDim2.new(0, 450, 0, 50)
warningLabel.Position = UDim2.new(0.5, 0, 0.15, 0)
warningLabel.AnchorPoint = Vector2.new(0.5, 0.5)
warningLabel.BackgroundTransparency = 0.3
warningLabel.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
warningLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
warningLabel.TextSize = 15
warningLabel.Font = Enum.Font.GothamBold
warningLabel.Text = "⚠️ DİKKAT: PİGGY YAKLAŞIYOR, UZAKLAŞ!"
warningLabel.Visible = false
warningLabel.Parent = screenGui
Instance.new("UICorner", warningLabel).CornerRadius = UDim.new(0, 8)

--// 1. SİNEMATİK AÇILIŞ İNTROSU
local introFrame = Instance.new("Frame")
introFrame.Size = UDim2.new(1, 0, 1, 0)
introFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
introFrame.BackgroundTransparency = 0.1
introFrame.ZIndex = 100
introFrame.Parent = screenGui

local introCard = Instance.new("Frame")
introCard.Size = UDim2.new(0, 420, 0, 200)
introCard.Position = UDim2.new(0.5, 0, 0.5, 0)
introCard.AnchorPoint = Vector2.new(0.5, 0.5)
introCard.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
introCard.BorderSizePixel = 0
introCard.ZIndex = 101
introCard.Parent = introFrame

Instance.new("UICorner", introCard).CornerRadius = UDim.new(0, 14)
local introStroke = Instance.new("UIStroke", introCard)
introStroke.Color = Color3.fromRGB(0, 150, 255)
introStroke.Thickness = 2

local introTitle = Instance.new("TextLabel")
introTitle.Size = UDim2.new(1, 0, 0, 40)
introTitle.Position = UDim2.new(0, 0, 0.2, 0)
introTitle.BackgroundTransparency = 1
introTitle.Text = "⚡ PİGGY MASTER V1 ⚡"
introTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
introTitle.TextSize, introTitle.Font = 16, Enum.Font.GothamBold
introTitle.ZIndex = 102
introTitle.Parent = introCard

local introSub = Instance.new("TextLabel")
introSub.Size = UDim2.new(1, 0, 0, 25)
introSub.Position = UDim2.new(0, 0, 0.45, 0)
introSub.BackgroundTransparency = 1
introSub.Text = "Yükleniyor"
introSub.TextColor3 = Color3.fromRGB(0, 200, 255)
introSub.TextSize, introSub.Font = 13, Enum.Font.GothamMedium
introSub.ZIndex = 102
introSub.Parent = introCard

task.spawn(function()
	local dots = {"", ".", "..", "..."}
	local i = 1
	while introFrame and introFrame.Parent do
		introSub.Text = "Yükleniyor" .. dots[i]
		i = i + 1
		if i > #dots then i = 1 end
		task.wait(0.4)
	end
end)

local introCredits = Instance.new("TextLabel")
introCredits.Size = UDim2.new(1, 0, 0, 25)
introCredits.Position = UDim2.new(0, 0, 0.75, 0)
introCredits.BackgroundTransparency = 1
introCredits.Text = "✨ Geliştirici: Ömer ✨"
introCredits.TextColor3 = Color3.fromRGB(180, 180, 200)
introCredits.TextSize, introCredits.Font = 11, Enum.Font.GothamBold
introCredits.ZIndex = 102
introCredits.Parent = introCard

--// 2. SOL TARAFTAKİ SABİT KÜÇÜK MENÜ BUTONU
local sideTabBtn = Instance.new("TextButton")
sideTabBtn.Size = UDim2.new(0, 40, 0, 100)
sideTabBtn.Position = UDim2.new(0, 0, 0.5, -50)
sideTabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
sideTabBtn.BackgroundTransparency = 0.2
sideTabBtn.Text = "⚡\nM\nE\nN\nÜ"
sideTabBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
sideTabBtn.TextSize, sideTabBtn.Font = 12, Enum.Font.GothamBold
sideTabBtn.Visible = false
sideTabBtn.Active = true
sideTabBtn.Draggable = false
sideTabBtn.Parent = screenGui

Instance.new("UICorner", sideTabBtn).CornerRadius = UDim.new(0, 6)
local tabStroke = Instance.new("UIStroke", sideTabBtn)
tabStroke.Color = Color3.fromRGB(0, 140, 255)
tabStroke.Thickness = 1.5

--// 3. ANA PENCERE
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 380, 0, 300)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(0, 150, 255)
mainStroke.Thickness = 1.8

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 34)
topBar.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 10)

local titleLbl = Instance.new("TextLabel")
titleLbl.Size = UDim2.new(1, -40, 1, 0)
titleLbl.Position = UDim2.new(0, 12, 0, 0)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "👑 PİGGY MASTER V1"
titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLbl.TextSize, titleLbl.Font = 12, Enum.Font.GothamBold
titleLbl.TextXAlignment = Enum.TextXAlignment.Left
titleLbl.Parent = topBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -30, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize, closeBtn.Font = 11, Enum.Font.GothamBold
closeBtn.Parent = mainFrame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 5)

--// 4. UÇMA (FLY) PENCERESİ
local flyWindow = Instance.new("Frame")
flyWindow.Size = UDim2.new(0, 380, 0, 240)
flyWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
flyWindow.AnchorPoint = Vector2.new(0.5, 0.5)
flyWindow.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
flyWindow.BackgroundTransparency = 0.08
flyWindow.Visible = false
flyWindow.Active = true
flyWindow.Draggable = true
flyWindow.Parent = screenGui

Instance.new("UICorner", flyWindow).CornerRadius = UDim.new(0, 10)
local flyStroke = Instance.new("UIStroke", flyWindow)
flyStroke.Color = Color3.fromRGB(0, 255, 120)
flyStroke.Thickness = 1.5

local flyTopBar = Instance.new("Frame")
flyTopBar.Size = UDim2.new(1, 0, 0, 34)
flyTopBar.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
flyTopBar.BorderSizePixel = 0
flyTopBar.Parent = flyWindow
Instance.new("UICorner", flyTopBar).CornerRadius = UDim.new(0, 10)

local flyTitle = Instance.new("TextLabel")
flyTitle.Size = UDim2.new(1, -70, 1, 0)
flyTitle.Position = UDim2.new(0, 12, 0, 0)
flyTitle.BackgroundTransparency = 1
flyTitle.Text = "🕊️ UÇMA & NOCLIP"
flyTitle.TextColor3 = Color3.fromRGB(0, 255, 120)
flyTitle.TextSize, flyTitle.Font = 11, Enum.Font.GothamBold
flyTitle.TextXAlignment = Enum.TextXAlignment.Left
flyTitle.Parent = flyTopBar

local backToMainBtn2 = Instance.new("TextButton")
backToMainBtn2.Size = UDim2.new(0, 60, 0, 24)
backToMainBtn2.Position = UDim2.new(1, -66, 0, 5)
backToMainBtn2.BackgroundColor3 = Color3.fromRGB(160, 40, 40)
backToMainBtn2.Text = "⬅ GERİ"
backToMainBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
backToMainBtn2.TextSize, backToMainBtn2.Font = 10, Enum.Font.GothamBold
backToMainBtn2.Parent = flyWindow
Instance.new("UICorner", backToMainBtn2).CornerRadius = UDim.new(0, 5)

local flyScroll = Instance.new("ScrollingFrame")
flyScroll.Size = UDim2.new(1, -20, 1, -46)
flyScroll.Position = UDim2.new(0, 10, 0, 38)
flyScroll.BackgroundTransparency = 1
flyScroll.BorderSizePixel = 0
flyScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
flyScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
flyScroll.ScrollBarThickness = 3
flyScroll.Parent = flyWindow

local flyLayout = Instance.new("UIListLayout", flyScroll)
flyLayout.SortOrder = Enum.SortOrder.LayoutOrder
flyLayout.Padding = UDim.new(0, 6)

local flying = false
local flySpeed = 50
local noclipActive = false
local bodyVelocity, bodyGyro, connection

local flyToggleBtn = Instance.new("TextButton")
flyToggleBtn.Size = UDim2.new(1, 0, 0, 36)
flyToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
flyToggleBtn.Text = "🕊️ Uçma (Fly): [ KAPALI ]"
flyToggleBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
flyToggleBtn.TextSize, flyToggleBtn.Font = 11, Enum.Font.GothamBold
flyToggleBtn.Parent = flyScroll
Instance.new("UICorner", flyToggleBtn).CornerRadius = UDim.new(0, 6)

local speedContainer = Instance.new("Frame")
speedContainer.Size = UDim2.new(1, 0, 0, 36)
speedContainer.BackgroundTransparency = 1
speedContainer.Parent = flyScroll

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.6, 0, 1, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "⚡ Hız: " .. flySpeed
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.TextSize, speedLabel.Font = 11, Enum.Font.GothamBold
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = speedContainer

local speedMinus = Instance.new("TextButton")
speedMinus.Size = UDim2.new(0, 30, 0, 30)
speedMinus.Position = UDim2.new(0.68, 0, 0, 3)
speedMinus.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
speedMinus.Text = "-"
speedMinus.TextColor3 = Color3.fromRGB(255, 255, 255)
speedMinus.TextSize, speedMinus.Font = 12, Enum.Font.GothamBold
speedMinus.Parent = speedContainer
Instance.new("UICorner", speedMinus).CornerRadius = UDim.new(0, 5)

local speedPlus = Instance.new("TextButton")
speedPlus.Size = UDim2.new(0, 30, 0, 30)
speedPlus.Position = UDim2.new(0.84, 0, 0, 3)
speedPlus.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
speedPlus.Text = "+"
speedPlus.TextColor3 = Color3.fromRGB(255, 255, 255)
speedPlus.TextSize, speedPlus.Font = 12, Enum.Font.GothamBold
speedPlus.Parent = speedContainer
Instance.new("UICorner", speedPlus).CornerRadius = UDim.new(0, 5)

local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(1, 0, 0, 36)
noclipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
noclipBtn.Text = "👻 Duvar Geçme (NoClip): [ KAPALI ]"
noclipBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
noclipBtn.TextSize, noclipBtn.Font = 11, Enum.Font.GothamBold
noclipBtn.Parent = flyScroll
Instance.new("UICorner", noclipBtn).CornerRadius = UDim.new(0, 6)

flyToggleBtn.MouseButton1Click:Connect(function()
	flying = not flying
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local hum = char:FindFirstChildOfClass("Humanoid")
	
	if flying then
		flyToggleBtn.Text = "🕊️ Uçma (Fly): [ AÇIK ]"
		flyToggleBtn.TextColor3 = Color3.fromRGB(100, 255, 100)
		bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Velocity = Vector3.new(0, 0, 0)
		bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bodyVelocity.Parent = hrp
		bodyGyro = Instance.new("BodyGyro")
		bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		bodyGyro.CFrame = hrp.CFrame
		bodyGyro.Parent = hrp
		if hum then hum.PlatformStand = true end
		
		if connection then connection:Disconnect() end
		connection = RunService.RenderStepped:Connect(function()
			if flying and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local cam = Workspace.CurrentCamera
				local moveDir = hum and hum.MoveDirection or Vector3.new(0,0,0)
				if bodyVelocity and bodyGyro then
					bodyGyro.CFrame = cam.CFrame
					if moveDir.Magnitude > 0 then
						bodyVelocity.Velocity = (cam.CFrame.LookVector * (moveDir.Z * flySpeed)) + (cam.CFrame.RightVector * (moveDir.X * flySpeed)) + (Vector3.new(0, cam.CFrame.LookVector.Y * flySpeed * math.abs(moveDir.Z), 0))
					else
						bodyVelocity.Velocity = Vector3.new(0, 0, 0)
					end
				end
			end
		end)
	else
		flyToggleBtn.Text = "🕊️ Uçma (Fly): [ KAPALI ]"
		flyToggleBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
		if connection then connection:Disconnect() end
		if bodyVelocity then bodyVelocity:Destroy() end
		if bodyGyro then bodyGyro:Destroy() end
		if hum then hum.PlatformStand = false end
	end
end)

speedPlus.MouseButton1Click:Connect(function()
	flySpeed = math.min(flySpeed + 10, 200)
	speedLabel.Text = "⚡ Hız: " .. flySpeed
end)

speedMinus.MouseButton1Click:Connect(function()
	flySpeed = math.max(flySpeed - 10, 10)
	speedLabel.Text = "⚡ Hız: " .. flySpeed
end)

noclipBtn.MouseButton1Click:Connect(function()
	noclipActive = not noclipActive
	if noclipActive then
		noclipBtn.Text = "👻 Duvar Geçme (NoClip): [ AÇIK ]"
		noclipBtn.TextColor3 = Color3.fromRGB(100, 255, 100)
	else
		noclipBtn.Text = "👻 Duvar Geçme (NoClip): [ KAPALI ]"
		noclipBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
	end
end)

RunService.Stepped:Connect(function()
	if noclipActive and player.Character then
		for _, part in ipairs(player.Character:GetDescendants()) do
			if part:IsA("BasePart") then part.CanCollide = false end
		end
	end
end)

--// 5. TRACER & KAPI ESP PENCERESİ
local espWindow = Instance.new("Frame")
espWindow.Size = UDim2.new(0, 380, 0, 260)
espWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
espWindow.AnchorPoint = Vector2.new(0.5, 0.5)
espWindow.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
espWindow.BackgroundTransparency = 0.08
espWindow.Visible = false
espWindow.Active = true
espWindow.Draggable = true
espWindow.Parent = screenGui

Instance.new("UICorner", espWindow).CornerRadius = UDim.new(0, 10)
local espStroke = Instance.new("UIStroke", espWindow)
espStroke.Color = Color3.fromRGB(255, 165, 0)
espStroke.Thickness = 1.5

local espTopBar = Instance.new("Frame")
espTopBar.Size = UDim2.new(1, 0, 0, 34)
espTopBar.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
espTopBar.BorderSizePixel = 0
espTopBar.Parent = espWindow
Instance.new("UICorner", espTopBar).CornerRadius = UDim.new(0, 10)

local espTitle = Instance.new("TextLabel")
espTitle.Size = UDim2.new(1, -70, 1, 0)
espTitle.Position = UDim2.new(0, 12, 0, 0)
espTitle.BackgroundTransparency = 1
espTitle.Text = "👁️ TRACER & KAPI ESP PANELİ"
espTitle.TextColor3 = Color3.fromRGB(255, 165, 0)
espTitle.TextSize, espTitle.Font = 11, Enum.Font.GothamBold
espTitle.TextXAlignment = Enum.TextXAlignment.Left
espTitle.Parent = espTopBar

local backToMainBtn3 = Instance.new("TextButton")
backToMainBtn3.Size = UDim2.new(0, 60, 0, 24)
backToMainBtn3.Position = UDim2.new(1, -66, 0, 5)
backToMainBtn3.BackgroundColor3 = Color3.fromRGB(160, 40, 40)
backToMainBtn3.Text = "⬅ GERİ"
backToMainBtn3.TextColor3 = Color3.fromRGB(255, 255, 255)
backToMainBtn3.TextSize, backToMainBtn3.Font = 10, Enum.Font.GothamBold
backToMainBtn3.Parent = espWindow
Instance.new("UICorner", backToMainBtn3).CornerRadius = UDim.new(0, 5)

local espScroll = Instance.new("ScrollingFrame")
espScroll.Size = UDim2.new(1, -20, 1, -46)
espScroll.Position = UDim2.new(0, 10, 0, 38)
espScroll.BackgroundTransparency = 1
espScroll.BorderSizePixel = 0
espScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
espScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
espScroll.ScrollBarThickness = 3
espScroll.Parent = espWindow

local espLayout = Instance.new("UIListLayout", espScroll)
espLayout.SortOrder = Enum.SortOrder.LayoutOrder
espLayout.Padding = UDim.new(0, 6)

--// 6. DOKUNULMAZLIK & GÖRSEL MODLAR PENCERESİ
local visualWindow = Instance.new("Frame")
visualWindow.Size = UDim2.new(0, 380, 0, 260)
visualWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
visualWindow.AnchorPoint = Vector2.new(0.5, 0.5)
visualWindow.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
visualWindow.BackgroundTransparency = 0.08
visualWindow.Visible = false
visualWindow.Active = true
visualWindow.Draggable = true
visualWindow.Parent = screenGui

Instance.new("UICorner", visualWindow).CornerRadius = UDim.new(0, 10)
local visualStroke = Instance.new("UIStroke", visualWindow)
visualStroke.Color = Color3.fromRGB(150, 0, 255)
visualStroke.Thickness = 1.5

local visualTopBar = Instance.new("Frame")
visualTopBar.Size = UDim2.new(1, 0, 0, 34)
visualTopBar.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
visualTopBar.BorderSizePixel = 0
visualTopBar.Parent = visualWindow
Instance.new("UICorner", visualTopBar).CornerRadius = UDim.new(0, 10)

local visualTitle = Instance.new("TextLabel")
visualTitle.Size = UDim2.new(1, -70, 1, 0)
visualTitle.Position = UDim2.new(0, 12, 0, 0)
visualTitle.BackgroundTransparency = 1
visualTitle.Text = "✨ DOKUNULMAZLIK & ÖLÜMSÜZLÜK"
visualTitle.TextColor3 = Color3.fromRGB(180, 100, 255)
visualTitle.TextSize, visualTitle.Font = 11, Enum.Font.GothamBold
visualTitle.TextXAlignment = Enum.TextXAlignment.Left
visualTitle.Parent = visualTopBar

local backToMainBtn4 = Instance.new("TextButton")
backToMainBtn4.Size = UDim2.new(0, 60, 0, 24)
backToMainBtn4.Position = UDim2.new(1, -66, 0, 5)
backToMainBtn4.BackgroundColor3 = Color3.fromRGB(160, 40, 40)
backToMainBtn4.Text = "⬅ GERİ"
backToMainBtn4.TextColor3 = Color3.fromRGB(255, 255, 255)
backToMainBtn4.TextSize, backToMainBtn4.Font = 10, Enum.Font.GothamBold
backToMainBtn4.Parent = visualWindow
Instance.new("UICorner", backToMainBtn4).CornerRadius = UDim.new(0, 5)

local visualScroll = Instance.new("ScrollingFrame")
visualScroll.Size = UDim2.new(1, -20, 1, -46)
visualScroll.Position = UDim2.new(0, 10, 0, 38)
visualScroll.BackgroundTransparency = 1
visualScroll.BorderSizePixel = 0
visualScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
visualScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
visualScroll.ScrollBarThickness = 3
visualScroll.Parent = visualWindow

local visualLayout = Instance.new("UIListLayout", visualScroll)
visualLayout.SortOrder = Enum.SortOrder.LayoutOrder
visualLayout.Padding = UDim.new(0, 6)

local espStates = {
	Piggy = false,
	Bot = false,
	Traitor = false,
	Player = false,
	Item = false,
	DoorMatch = false,
	NightVision = false,
	Invisibility = false,
	GodMode = false,
	AntiTouch = false
}

local activeTracers = {}

local function createSmartTracer(targetObj, color, labelText)
	if Drawing and not activeTracers[targetObj] then
		local line = Drawing.new("Line")
		line.Visible = false
		line.Color = color
		line.Thickness = 1.5
		line.Transparency = 0.8
		
		local text = Drawing.new("Text")
		text.Visible = false
		text.Color = color
		text.Size = 13
		text.Center = true
		text.Outline = true
		
		activeTracers[targetObj] = {Line = line, Text = text, Label = labelText}
	end
end

local function removeTracer(targetObj)
	if activeTracers[targetObj] then
		if activeTracers[targetObj].Line then activeTracers[targetObj].Line:Remove() end
		if activeTracers[targetObj].Text then activeTracers[targetObj].Text:Remove() end
		activeTracers[targetObj] = nil
	end
end

-- Render Döngüsü (Dokunulmazlık, Ölümsüzlük ve ESP Yönetimi)
RunService.RenderStepped:Connect(function()
	local localChar = player.Character
	local localHrp = localChar and localChar:FindFirstChild("HumanoidRootPart")
	local localHum = localChar and localChar:FindFirstChildOfClass("Humanoid")
	
	-- 1. Piggy ESP
	if espStates.Piggy then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= player and p.Character then
				local char = p.Character
				local nameL = p.Name:lower()
				local isPiggyRole = nameL:find("piggy") or nameL:find("infected") or nameL:find("killer") or char:FindFirstChild("Hammer") or char:FindFirstChild("Sword") or char:FindFirstChild("Bat") or char:FindFirstChild("Gun")
				if isPiggyRole then
					if not char:FindFirstChild("OmerPiggyHL") then
						local hl = Instance.new("Highlight")
						hl.Name = "OmerPiggyHL"
						hl.Adornee = char
						hl.FillColor = Color3.fromRGB(255, 0, 0)
						hl.FillTransparency = 0.2
						hl.Parent = char
						createSmartTracer(char, Color3.fromRGB(255, 0, 0), "Piggy")
					end
				end
			end
		end
	else
		for _, p in ipairs(Players:GetPlayers()) do
			if p.Character then
				if p.Character:FindFirstChild("OmerPiggyHL") then p.Character.OmerPiggyHL:Destroy() end
				if p.Name:lower():find("piggy") or p.Name:lower():find("infected") then removeTracer(p.Character) end
			end
		end
	end

	-- 2. Bot ESP
	if espStates.Bot then
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("Model") and obj.Name:lower():find("bot") then
				if obj:FindFirstChild("HumanoidRootPart") and not obj:FindFirstChild("OmerBotHL") then
					local hl = Instance.new("Highlight")
					hl.Name = "OmerBotHL"
					hl.Adornee = obj
					hl.FillColor = Color3.fromRGB(255, 128, 0)
					hl.FillTransparency = 0.2
					hl.Parent = obj
					createSmartTracer(obj, Color3.fromRGB(255, 128, 0), "Bot")
				end
			end
		end
	else
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:FindFirstChild("OmerBotHL") then obj.OmerBotHL:Destroy() end
			if obj.Name:lower():find("bot") then removeTracer(obj) end
		end
	end

	-- 3. Traitor ESP
	if espStates.Traitor then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= player and p.Character then
				local char = p.Character
				local nameL = p.Name:lower()
				if nameL:find("traitor") or char:FindFirstChild("Knife") then
					if not char:FindFirstChild("OmerTraitorHL") then
						local hl = Instance.new("Highlight")
						hl.Name = "OmerTraitorHL"
						hl.Adornee = char
						hl.FillColor = Color3.fromRGB(150, 0, 255)
						hl.FillTransparency = 0.2
						hl.Parent = char
						createSmartTracer(char, Color3.fromRGB(150, 0, 255), "Traitor")
					end
				end
			end
		end
	else
		for _, p in ipairs(Players:GetPlayers()) do
			if p.Character then
				if p.Character:FindFirstChild("OmerTraitorHL") then p.Character.OmerTraitorHL:Destroy() end
			end
		end
	end

	-- 4. Oyuncu ESP
	if espStates.Player then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= player and p.Character then
				local char = p.Character
				if not char:FindFirstChild("OmerPlayerHL") then
					local hl = Instance.new("Highlight")
					hl.Name = "OmerPlayerHL"
					hl.Adornee = char
					hl.FillColor = Color3.fromRGB(0, 150, 255)
					hl.FillTransparency = 0.4
					hl.Parent = char
					createSmartTracer(char, Color3.fromRGB(0, 150, 255), p.Name)
				end
			end
		end
	else
		for _, p in ipairs(Players:GetPlayers()) do
			if p.Character then
				if p.Character:FindFirstChild("OmerPlayerHL") then p.Character.OmerPlayerHL:Destroy() end
				removeTracer(p.Character)
			end
		end
	end

	-- 5. Eşya ESP
	if espStates.Item then
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("BasePart") or obj:IsA("Model") then
				local nameL = obj.Name:lower()
				if nameL:find("key") or nameL:find("hammer") or nameL:find("wrench") or nameL:find("gun") or nameL:find("screwdriver") or nameL:find("carrot") then
					if not obj:FindFirstChild("OmerItemHL") then
						local hl = Instance.new("Highlight")
						hl.Name = "OmerItemHL"
						hl.Adornee = obj
						hl.FillColor = Color3.fromRGB(0, 255, 0)
						hl.FillTransparency = 0.3
						hl.Parent = obj
						createSmartTracer(obj, Color3.fromRGB(0, 255, 0), obj.Name)
					end
				end
			end
		end
	else
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:FindFirstChild("OmerItemHL") then obj.OmerItemHL:Destroy() end
		end
		for obj, _ in pairs(activeTracers) do
			if obj and obj.Parent then
				local n = obj.Name:lower()
				if n:find("key") or n:find("hammer") or n:find("wrench") or n:find("gun") or n:find("screwdriver") or n:find("carrot") then
					removeTracer(obj)
				end
			end
		end
	end

	-- 6. Akıllı Kapı ESP
	if espStates.DoorMatch then
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("BasePart") or obj:IsA("Model") then
				local nameL = obj.Name:lower()
				if (nameL:find("door") or nameL:find("gate") or nameL:find("lock")) and not nameL:find("block") and not nameL:find("decor") then
					if not obj:FindFirstChild("OmerDoorHL") then
						local hl = Instance.new("Highlight")
						hl.Name = "OmerDoorHL"
						hl.Adornee = obj
						hl.FillColor = Color3.fromRGB(255, 255, 0)
						hl.FillTransparency = 0.3
						hl.Parent = obj
						createSmartTracer(obj, Color3.fromRGB(255, 255, 0), "Kapı: " .. obj.Name)
					end
				end
			end
		end
	else
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:FindFirstChild("OmerDoorHL") then obj.OmerDoorHL:Destroy() end
		end
		for obj, _ in pairs(activeTracers) do
			if obj and obj.Parent and obj.Name:lower():find("door") then
				removeTracer(obj)
			end
		end
	end

	-- 7. Gece Görüşü
	if espStates.NightVision then
		Lighting.Brightness = 3
		Lighting.ClockTime = 14
		Lighting.GlobalShadows = false
	else
		Lighting.Brightness = 1
		Lighting.GlobalShadows = true
	end

	-- 8. Görünmezlik
	if espStates.Invisibility and localChar then
		for _, part in ipairs(localChar:GetDescendants()) do
			if part:IsA("BasePart") or part:IsA("Decal") then
				part.Transparency = 1
			end
		end
	elseif not espStates.Invisibility and localChar then
		for _, part in ipairs(localChar:GetDescendants()) do
			if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
				part.Transparency = 0
			end
		end
	end

	-- 9. Ölümsüzlük
	if espStates.GodMode and localHum then
		localHum.Health = localHum.MaxHealth
	end

	-- 10. Dokunulmazlık & Savurma (Anti-Touch)
	if espStates.AntiTouch and localHrp then
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= player and p.Character then
				local enemyHrp = p.Character:FindFirstChild("HumanoidRootPart")
				local nameL = p.Name:lower()
				if enemyHrp and (nameL:find("piggy") or nameL:find("infected") or nameL:find("killer") or p.Character:FindFirstChild("Hammer") or p.Character:FindFirstChild("Sword")) then
					local dist = (localHrp.Position - enemyHrp.Position).Magnitude
					if dist < 8 then
						p.Character:PivotTo(enemyHrp.CFrame + Vector3.new(0, 50, 0))
					end
				end
			end
		end
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("Model") and obj.Name:lower():find("bot") then
				local botHrp = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")
				if botHrp then
					local dist = (localHrp.Position - botHrp.Position).Magnitude
					if dist < 8 then
						obj:PivotTo(botHrp.CFrame + Vector3.new(0, 50, 0))
					end
				end
			end
		end
	end

	-- Tracer Çizgilerini Güncelle
	for targetObj, data in pairs(activeTracers) do
		local isValid = targetObj and targetObj.Parent ~= nil
		local targetPart = nil
		
		if targetObj:IsA("Model") then
			targetPart = targetObj.PrimaryPart or targetObj:FindFirstChild("HumanoidRootPart") or targetObj:FindFirstChildWhichIsA("BasePart")
		elseif targetObj:IsA("BasePart") then
			targetPart = targetObj
		end
		
		if isValid and targetPart and localHrp and data.Line then
			local vector, onScreen = camera:WorldToViewportPoint(targetPart.Position)
			if onScreen then
				data.Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
				data.Line.To = Vector2.new(vector.X, vector.Y)
				data.Line.Visible = true
				
				local dist = math.floor((localHrp.Position - targetPart.Position).Magnitude)
				data.Text.Position = Vector2.new(vector.X, vector.Y - 18)
				data.Text.Text = "[" .. (data.Label or "Hedef") .. " - " .. dist .. "m]"
				data.Text.Visible = true
			else
				data.Line.Visible = false
				data.Text.Visible = false
			end
		else
			if data.Line then data.Line.Visible = false end
			if data.Text then data.Text.Visible = false end
			if not isValid then
				removeTracer(targetObj)
			end
		end
	end
end)

local function addToggleToScroll(scrollFrame, displayName, keyName)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1, 0, 0, 36)
	b.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
	b.Text = "  📌 " .. displayName .. ": [ KAPALI ]"
	b.TextColor3 = Color3.fromRGB(255, 100, 100)
	b.TextSize, b.Font = 11, Enum.Font.GothamBold
	b.TextXAlignment = Enum.TextXAlignment.Left
	b.Parent = scrollFrame
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
	
	b.MouseButton1Click:Connect(function()
		espStates[keyName] = not espStates[keyName]
		local active = espStates[keyName]
		b.Text = "  📌 " .. displayName .. ": " .. (active and "[ AÇIK ]" or "[ KAPALI ]")
		b.TextColor3 = active and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
	end)
end

addToggleToScroll(espScroll, "Piggy ESP", "Piggy")
addToggleToScroll(espScroll, "Bot ESP", "Bot")
addToggleToScroll(espScroll, "Hain (Traitor) ESP", "Traitor")
addToggleToScroll(espScroll, "Oyuncular ESP", "Player")
addToggleToScroll(espScroll, "Eşyalar (Anahtar vb.)", "Item")
addToggleToScroll(espScroll, "🔑 Akıllı Kapı ESP", "DoorMatch")

addToggleToScroll(visualScroll, "🛡️ Dokunulmazlık (Anti-Touch)", "AntiTouch")
addToggleToScroll(visualScroll, "🛡️ Ölümsüzlük (God Mode)", "GodMode")
addToggleToScroll(visualScroll, "🟢 Gece Görüşü (Night Vision)", "NightVision")
addToggleToScroll(visualScroll, "👻 Görünmezlik (Invisibility)", "Invisibility")

--// 7. ANA MENÜ BUTONLARI (Animasyonlu Geçişler)
local mainScroll = Instance.new("ScrollingFrame")
mainScroll.Size = UDim2.new(1, -20, 1, -75)
mainScroll.Position = UDim2.new(0, 10, 0, 40)
mainScroll.BackgroundTransparency = 1
mainScroll.BorderSizePixel = 0
mainScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
mainScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
mainScroll.ScrollBarThickness = 3
mainScroll.Parent = mainFrame

local mainLayout = Instance.new("UIListLayout", mainScroll)
mainLayout.SortOrder = Enum.SortOrder.LayoutOrder
mainLayout.Padding = UDim.new(0, 6)

local function addMenuButton(text, color, onClick)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 38)
	btn.BackgroundColor3 = color
	btn.BackgroundTransparency = 0.15
	btn.Text = "  " .. text .. " ➔"
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize, btn.Font = 11, Enum.Font.GothamBold
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.Parent = mainScroll
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	btn.MouseButton1Click:Connect(onClick)
end

addMenuButton("🕊️ UÇMA & NOCLIP MODÜLÜ", Color3.fromRGB(0, 140, 70), function()
	mainFrame.Visible = false
	flyWindow.Visible = true
	flyWindow.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(flyWindow, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 380, 0, 240)}):Play()
end)

addMenuButton("👁️ TRACER & KAPI ESP PANELİ", Color3.fromRGB(180, 100, 0), function()
	mainFrame.Visible = false
	espWindow.Visible = true
	espWindow.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(espWindow, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 380, 0, 260)}):Play()
end)

addMenuButton("✨ DOKUNULMAZLIK & GÖRSEL MODLAR", Color3.fromRGB(120, 0, 200), function()
	mainFrame.Visible = false
	visualWindow.Visible = true
	visualWindow.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(visualWindow, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 380, 0, 260)}):Play()
end)

-- Alt İmza
local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, 0, 0, 22)
creditLabel.Position = UDim2.new(0, 0, 1, -24)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "✨ Geliştirici: Ömer ✨"
creditLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
creditLabel.TextSize, creditLabel.Font = 10, Enum.Font.GothamBold
creditLabel.TextXAlignment = Enum.TextXAlignment.Center
creditLabel.Parent = mainFrame

--// 8. AÇILIŞ SİNEMATİK ANİMASYON AKIŞI
task.spawn(function()
	introCard.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(introCard, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 420, 0, 200)}):Play()
	
	task.wait(2.2)
	
	local fadeOut = TweenService:Create(introFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {BackgroundTransparency = 1})
	TweenService:Create(introCard, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
	fadeOut:Play()
	
	fadeOut.Completed:Connect(function()
		introFrame:Destroy()
		mainFrame.Visible = true
		mainFrame.Size = UDim2.new(0, 0, 0, 0)
		TweenService:Create(mainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 380, 0, 300)}):Play()
	end)
end)

closeBtn.MouseButton1Click:Connect(function()
	local closeAnim = TweenService:Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
	closeAnim:Play()
	closeAnim.Completed:Connect(function()
		mainFrame.Visible = false
		sideTabBtn.Visible = true
		sideTabBtn.Size = UDim2.new(0, 0, 0, 0)
		TweenService:Create(sideTabBtn, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 40, 0, 100)}):Play()
	end)
end)

sideTabBtn.MouseButton1Click:Connect(function()
	sideTabBtn.Visible = false
	mainFrame.Visible = true
	mainFrame.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 380, 0, 300)}):Play()
end)

backToMainBtn2.MouseButton1Click:Connect(function()
	flyWindow.Visible = false
	mainFrame.Visible = true
end)

backToMainBtn3.MouseButton1Click:Connect(function()
	espWindow.Visible = false
	mainFrame.Visible = true
end)

backToMainBtn4.MouseButton1Click:Connect(function()
	visualWindow.Visible = false
	mainFrame.Visible = true
end)

