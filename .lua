local success, err = pcall(function()
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local CoreGui = game:GetService("CoreGui")

    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- Mobil executor uyumlu kök dizin seçimi
    local parent = (gethui and gethui()) or CoreGui or playerGui

    if parent:FindFirstChild("EvadeScriptGUI") then
        parent:FindFirstChild("EvadeScriptGUI"):Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "EvadeScriptGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = parent

    -- Kompakt Ana Pencere
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 240, 0, 150)
    MainFrame.Position = UDim2.new(0.5, -120, 0.5, -75)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    -- Üst Başlık Çubuğu
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 32)
    TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame

    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 8)
    TopBarCorner.Parent = TopBar

    -- Başlık Yazısı
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -45, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "⚡ Evade Script"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 13
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar

    -- Küçült (- / Kapat) Butonu
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

    -- Ekranın köşesinde çıkacak Açma Butonu
    local OpenButton = Instance.new("TextButton")
    OpenButton.Size = UDim2.new(0, 45, 0, 45)
    OpenButton.Position = UDim2.new(0, 15, 0, 15)
    OpenButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    OpenButton.BorderSizePixel = 0
    OpenButton.Text = "⚡"
    OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenButton.TextSize = 18
    OpenButton.Visible = false
    OpenButton.Parent = ScreenGui

    local OpenCorner = Instance.new("UICorner")
    OpenCorner.CornerRadius = UDim.new(0, 8)
    OpenCorner.Parent = OpenButton

    -- Bhop & Kademeli Hız Butonu
    local BhopButton = Instance.new("TextButton")
    BhopButton.Size = UDim2.new(0.9, 0, 0, 45)
    BhopButton.Position = UDim2.new(0.05, 0, 0, 45)
    BhopButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    BhopButton.BorderSizePixel = 0
    BhopButton.Text = "Bhop + Speed (Max 60): OFF"
    BhopButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    BhopButton.TextSize = 12
    BhopButton.Font = Enum.Font.GothamMedium
    BhopButton.Parent = MainFrame

    local BhopCorner = Instance.new("UICorner")
    BhopCorner.CornerRadius = UDim.new(0, 6)
    BhopCorner.Parent = BhopButton

    -- Alt Kısım: Yapımcı İmzası
    local CreditsLabel = Instance.new("TextLabel")
    CreditsLabel.Size = UDim2.new(1, 0, 0, 20)
    CreditsLabel.Position = UDim2.new(0, 0, 1, -22)
    CreditsLabel.BackgroundTransparency = 1
    CreditsLabel.Text = "Made by Ömer"
    CreditsLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
    CreditsLabel.TextSize = 11
    CreditsLabel.Font = Enum.Font.GothamMedium
    CreditsLabel.Parent = MainFrame

    -- Sürükleme (Dragging) Mantığı
    local dragging, dragInput, dragStart, startPos

    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Aç / Kapat İşlevleri
    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        OpenButton.Visible = true
    end)

    OpenButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        OpenButton.Visible = false
    end)

    -- Değişkenler
    local bHopEnabled = false
    local currentSpeed = 16

    BhopButton.MouseButton1Click:Connect(function()
        bHopEnabled = not bHopEnabled
        if bHopEnabled then
            BhopButton.Text = "Bhop + Speed (Max 60): ON"
            BhopButton.TextColor3 = Color3.fromRGB(0, 255, 128)
            BhopButton.BackgroundColor3 = Color3.fromRGB(30, 60, 45)
        else
            BhopButton.Text = "Bhop + Speed (Max 60): OFF"
            BhopButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            BhopButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            
            currentSpeed = 16
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 16
                end
            end
        end
    end)

    -- Ana Döngü: Hız asla düşmez, her zıplamada 2'şer tık artarak 60'a sabitlenir
    RunService.RenderStepped:Connect(function()
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then
                if bHopEnabled then
                    -- Hızı hiçbir şekilde düşürmez, ulaştığı en yüksek kademede tutar
                    humanoid.WalkSpeed = currentSpeed

                    -- Otomatik Zıplama (Bhop) ve Kademeli Hız Artışı
                    local currentState = humanoid:GetState()
                    local isEmoting = (currentState == Enum.HumanoidStateType.Physics or currentState == Enum.HumanoidStateType.PlatformStanding)
                    
                    if humanoid.FloorMaterial ~= Enum.Material.Air and not isEmoting then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        
                        -- Hata yapılsa veya yokuş çıkılsa bile zıplama tetiklendiğinde hız 2'şer tık artar (Max 60)
                        if currentSpeed < 60 then
                            currentSpeed = math.min(60, currentSpeed + 2)
                        end
                    end
                end
            end
        end
    end)
end)

if not success then
    warn("GUI Yüklenirken Hata Oluştu: " .. tostring(err))
end
