local success, err = pcall(function()
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")

    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local parent = playerGui

    if parent:FindFirstChild("EvadeScriptGUI") then
        parent:FindFirstChild("EvadeScriptGUI"):Destroy()
    end

    if parent:FindFirstChild("BhopMenuGUI") then
        parent:FindFirstChild("BhopMenuGUI"):Destroy()
    end

    if parent:FindFirstChild("UpdateMenuGUI") then
        parent:FindFirstChild("UpdateMenuGUI"):Destroy()
    end

    -- ==================== 1. ANA MENÜ GUI ====================
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "EvadeScriptGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 99999
    ScreenGui.Parent = parent

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 240, 0, 240)
    MainFrame.Position = UDim2.new(0.5, -120, 0.5, -120)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = true
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 32)
    TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame

    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 8)
    TopBarCorner.Parent = TopBar

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -45, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "Evade Script 🇹🇷"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 13
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 28, 0, 24)
    MinimizeButton.Position = UDim2.new(1, -32, 0, 4)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 14
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = TopBar

    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 4)
    MinCorner.Parent = MinimizeButton

    local OpenButton = Instance.new("TextButton")
    OpenButton.Size = UDim2.new(0, 36, 0, 36)
    OpenButton.Position = UDim2.new(0, 150, 0, 55)
    OpenButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    OpenButton.BorderSizePixel = 0
    OpenButton.Text = "⚡"
    OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenButton.TextSize = 18
    OpenButton.Visible = false
    OpenButton.Parent = ScreenGui

    local OpenCorner = Instance.new("UICorner")
    OpenCorner.CornerRadius = UDim.new(0, 6)
    OpenCorner.Parent = OpenButton

    -- Bhop Butonu
    local BhopButton = Instance.new("TextButton")
    BhopButton.Size = UDim2.new(0.9, 0, 0, 32)
    BhopButton.Position = UDim2.new(0.05, 0, 0, 45)
    BhopButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    BhopButton.BorderSizePixel = 0
    BhopButton.Text = "Bhop"
    BhopButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    BhopButton.TextSize = 11
    BhopButton.Font = Enum.Font.GothamMedium
    BhopButton.Parent = MainFrame

    local BhopCorner = Instance.new("UICorner")
    BhopCorner.CornerRadius = UDim.new(0, 6)
    BhopCorner.Parent = BhopButton

    -- Güncelleme Butonu
    local UpdateButton = Instance.new("TextButton")
    UpdateButton.Size = UDim2.new(0.9, 0, 0, 32)
    UpdateButton.Position = UDim2.new(0.05, 0, 0, 85)
    UpdateButton.BackgroundColor3 = Color3.fromRGB(50, 40, 70)
    UpdateButton.BorderSizePixel = 0
    UpdateButton.Text = "Getirilen Güncelleme"
    UpdateButton.TextColor3 = Color3.fromRGB(220, 180, 255)
    UpdateButton.TextSize = 10
    UpdateButton.Font = Enum.Font.GothamMedium
    UpdateButton.Parent = MainFrame

    local UpdateCorner = Instance.new("UICorner")
    UpdateCorner.CornerRadius = UDim.new(0, 6)
    UpdateCorner.Parent = UpdateButton

    -- FOV Bilgilendirme Kutusu (Butonlar kaldırıldı)
    local FovFrame = Instance.new("Frame")
    FovFrame.Size = UDim2.new(0.9, 0, 0, 38)
    FovFrame.Position = UDim2.new(0.05, 0, 0, 125)
    FovFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    FovFrame.BorderSizePixel = 0
    FovFrame.Parent = MainFrame

    local FovCorner = Instance.new("UICorner")
    FovCorner.CornerRadius = UDim.new(0, 6)
    FovCorner.Parent = FovFrame

    local FovLabel = Instance.new("TextLabel")
    FovLabel.Size = UDim2.new(1, -10, 1, 0)
    FovLabel.Position = UDim2.new(0, 8, 0, 0)
    FovLabel.BackgroundTransparency = 1
    FovLabel.Text = "FOV: Şu anlık iptal edilmiştir. Sonradan güncellemelerde geri getirilecektir."
    FovLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    FovLabel.TextSize = 9
    FovLabel.Font = Enum.Font.GothamMedium
    FovLabel.TextXAlignment = Enum.TextXAlignment.Left
    FovLabel.TextWrapped = true
    FovLabel.Parent = FovFrame

    local CreditsLabel = Instance.new("TextLabel")
    CreditsLabel.Size = UDim2.new(1, 0, 0, 20)
    CreditsLabel.Position = UDim2.new(0, 0, 1, -22)
    CreditsLabel.BackgroundTransparency = 1
    CreditsLabel.Text = "Made by Ömer | Update Yapılmıştır"
    CreditsLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
    CreditsLabel.TextSize = 11
    CreditsLabel.Font = Enum.Font.GothamMedium
    CreditsLabel.Parent = MainFrame


    -- ==================== 2. BHOP KONTROL PENCERESİ ====================
    local BhopGui = Instance.new("ScreenGui")
    BhopGui.Name = "BhopMenuGUI"
    BhopGui.ResetOnSpawn = false
    BhopGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BhopGui.DisplayOrder = 99999
    BhopGui.Parent = parent

    local BhopWindow = Instance.new("Frame")
    BhopWindow.Size = UDim2.new(0, 160, 0, 100)
    BhopWindow.Position = UDim2.new(0.5, 125, 0.5, -120)
    BhopWindow.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    BhopWindow.BorderSizePixel = 0
    BhopWindow.Visible = false
    BhopWindow.Parent = BhopGui

    local BhopWinCorner = Instance.new("UICorner")
    BhopWinCorner.CornerRadius = UDim.new(0, 8)
    BhopWinCorner.Parent = BhopWindow

    local BhopTopBar = Instance.new("Frame")
    BhopTopBar.Size = UDim2.new(1, 0, 0, 28)
    BhopTopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    BhopTopBar.BorderSizePixel = 0
    BhopTopBar.Parent = BhopWindow

    local BhopTopCorner = Instance.new("UICorner")
    BhopTopCorner.CornerRadius = UDim.new(0, 8)
    BhopTopCorner.Parent = BhopTopBar

    local BhopWinTitle = Instance.new("TextLabel")
    BhopWinTitle.Size = UDim2.new(1, -10, 1, 0)
    BhopWinTitle.Position = UDim2.new(0, 8, 0, 0)
    BhopWinTitle.BackgroundTransparency = 1
    BhopWinTitle.Text = "Bhop Kontrol"
    BhopWinTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    BhopWinTitle.TextSize = 10
    BhopWinTitle.Font = Enum.Font.GothamBold
    BhopWinTitle.TextXAlignment = Enum.TextXAlignment.Left
    BhopWinTitle.Parent = BhopTopBar

    local BhopToggleBtn = Instance.new("TextButton")
    BhopToggleBtn.Size = UDim2.new(0.9, 0, 0, 42)
    BhopToggleBtn.Position = UDim2.new(0.05, 0, 0, 38)
    BhopToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    BhopToggleBtn.BorderSizePixel = 0
    BhopToggleBtn.Text = "Durum: OFF"
    BhopToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    BhopToggleBtn.TextSize = 11
    BhopToggleBtn.Font = Enum.Font.GothamBold
    BhopToggleBtn.Parent = BhopWindow

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 6)
    ToggleCorner.Parent = BhopToggleBtn


    -- ==================== 3. GÜNCELLEME PENCERESİ ====================
    local UpdateGui = Instance.new("ScreenGui")
    UpdateGui.Name = "UpdateMenuGUI"
    UpdateGui.ResetOnSpawn = false
    UpdateGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    UpdateGui.DisplayOrder = 99999
    UpdateGui.Parent = parent

    local UpdateWindow = Instance.new("Frame")
    UpdateWindow.Size = UDim2.new(0, 220, 0, 160)
    UpdateWindow.Position = UDim2.new(0.5, 125, 0.5, -120)
    UpdateWindow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    UpdateWindow.BorderSizePixel = 0
    UpdateWindow.Visible = false
    UpdateWindow.Parent = UpdateGui

    local UpdateWinCorner = Instance.new("UICorner")
    UpdateWinCorner.CornerRadius = UDim.new(0, 8)
    UpdateWinCorner.Parent = UpdateWindow

    local UpdateTopBar = Instance.new("Frame")
    UpdateTopBar.Size = UDim2.new(1, 0, 0, 28)
    UpdateTopBar.BackgroundColor3 = Color3.fromRGB(40, 35, 55)
    UpdateTopBar.BorderSizePixel = 0
    UpdateTopBar.Parent = UpdateWindow

    local UpdateTopCorner = Instance.new("UICorner")
    UpdateTopCorner.CornerRadius = UDim.new(0, 8)
    UpdateTopCorner.Parent = UpdateTopBar

    local InfoTitle = Instance.new("TextLabel")
    InfoTitle.Size = UDim2.new(1, -10, 1, 0)
    InfoTitle.Position = UDim2.new(0, 8, 0, 0)
    InfoTitle.BackgroundTransparency = 1
    InfoTitle.Text = "Getirilen Güncelleme"
    InfoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    InfoTitle.TextSize = 10
    InfoTitle.Font = Enum.Font.GothamBold
    InfoTitle.TextXAlignment = Enum.TextXAlignment.Left
    InfoTitle.Parent = UpdateTopBar

    local InfoText = Instance.new("TextLabel")
    InfoText.Size = UDim2.new(1, -20, 1, -38)
    InfoText.Position = UDim2.new(0, 10, 0, 34)
    InfoText.BackgroundTransparency = 1
    InfoText.Text = "- UPDATE -\n\n" ..
                    "- FOV geçici olarak iptal edildi.\n" ..
                    "- Bhop + Speed yazısı Bhop olarak değiştirildi.\n" ..
                    "- Evade Script yanına Türk bayrağı eklendi.\n\n" ..
                    "🗂️ Yakında key sistemi gelecektir."
    InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
    InfoText.TextSize = 10
    InfoText.Font = Enum.Font.GothamMedium
    InfoText.TextXAlignment = Enum.TextXAlignment.Left
    InfoText.TextYAlignment = Enum.TextYAlignment.Top
    InfoText.TextWrapped = true
    InfoText.Parent = UpdateWindow


    -- ==================== SÜRÜKLEME FONKSİYONLARI ====================
    local function makeDraggable(topBar, frame)
        local dragging, dragInput, dragStart, startPos

        topBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        topBar.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    makeDraggable(TopBar, MainFrame)
    makeDraggable(BhopTopBar, BhopWindow)
    makeDraggable(UpdateTopBar, UpdateWindow)


    -- ==================== MENÜ AÇ/KAPAT MANTIKLARI ====================
    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        OpenButton.Visible = true
    end)

    OpenButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        OpenButton.Visible = false
    end)

    UpdateButton.MouseButton1Click:Connect(function()
        UpdateWindow.Visible = not UpdateWindow.Visible
    end)

    BhopButton.MouseButton1Click:Connect(function()
        BhopWindow.Visible = not BhopWindow.Visible
    end)


    -- ==================== Bhop ON/OFF Mantığı ====================
    local bHopEnabled = false

    BhopToggleBtn.MouseButton1Click:Connect(function()
        bHopEnabled = not bHopEnabled
        if bHopEnabled then
            BhopToggleBtn.Text = "Durum: ON"
            BhopToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
            BhopButton.TextColor3 = Color3.fromRGB(0, 255, 128)
            BhopButton.BackgroundColor3 = Color3.fromRGB(30, 60, 45)
            
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 60
                end
            end
        else
            BhopToggleBtn.Text = "Durum: OFF"
            BhopToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
            BhopButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            BhopButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 16
                end
            end
        end
    end)

    RunService.RenderStepped:Connect(function()
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and rootPart and humanoid.Health > 0 then
                if bHopEnabled then
                    humanoid.WalkSpeed = 60

                    local moveDir = humanoid.MoveDirection
                    if moveDir.Magnitude > 0 then
                        rootPart.AssemblyLinearVelocity = Vector3.new(
                            moveDir.X * 60,
                            rootPart.AssemblyLinearVelocity.Y,
                            moveDir.Z * 60
                        )
                    end

                    if humanoid.FloorMaterial ~= Enum.Material.Air and moveDir.Magnitude > 0 then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end
        end
    end)
end)

if err then
    warn("GUI Yüklenirken Hata Oluştu: " .. tostring(err))
end
