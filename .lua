local success, runtimeError = pcall(function()
    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    local RS = game:GetService("RunService")
    local Lighting = game:GetService("Lighting")
    local Camera = workspace.CurrentCamera
    local HttpService = game:GetService("HttpService")
    
    local Plr = Players.LocalPlayer
    local PlrGui = Plr:WaitForChild("PlayerGui")

    for _, v in ipairs({"EvadeProHubWindow", "BhopMenuGUI"}) do
        if PlrGui:FindFirstChild(v) then PlrGui[v]:Destroy() end
    end

    local function Create(cls, parent, props)
        local inst = Instance.new(cls)
        if props then for k, v in pairs(props) do inst[k] = v end end
        inst.Parent = parent
        return inst
    end

    local function Corner(parent, r)
        return Create("UICorner", parent, { CornerRadius = UDim.new(0, r or 14) })
    end

    local function Stroke(parent, col, thick)
        return Create("UIStroke", parent, { Color = col or Color3.fromRGB(255, 255, 255), Thickness = thick or 1.2, Transparency = 0.4 })
    end

    local function MakeDraggable(bar, frame)
        local dragging, dragStart, startPos
        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging, dragStart, startPos = true, input.Position, frame.Position
                input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
            end
        end)
        UIS.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    local SG = Create("ScreenGui", PlrGui, { Name = "EvadeProHubWindow", ResetOnSpawn = false, DisplayOrder = 99999 })
    
    local Main = Create("Frame", SG, { Size = UDim2.new(0, 500, 0, 350), Position = UDim2.new(0.5, -250, 0.5, -175), BackgroundColor3 = Color3.fromRGB(10, 10, 18), BackgroundTransparency = 0.45, BorderSizePixel = 0 })
    Corner(Main, 16)
    Stroke(Main, Color3.fromRGB(200, 220, 255), 1.4)

    local TopBar = Create("Frame", Main, { Size = UDim2.new(1, 0, 0, 56), BackgroundColor3 = Color3.fromRGB(18, 18, 28), BackgroundTransparency = 0.4, BorderSizePixel = 0 })
    Corner(TopBar, 16)
    Create("Frame", TopBar, { Size = UDim2.new(1, 0, 0, 8), Position = UDim2.new(0, 0, 1, -8), BackgroundColor3 = Color3.fromRGB(18, 18, 28), BackgroundTransparency = 0.4, BorderSizePixel = 0 })
    Stroke(TopBar, Color3.fromRGB(255, 255, 255), 1)

    local TitleLbl = Create("TextLabel", TopBar, { Size = UDim2.new(1, -90, 0, 22), Position = UDim2.new(0, 14, 0, 6), BackgroundTransparency = 1, Text = "⚡ " .. Plr.Name .. " | Evade Pro Hub V3", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left })
    Create("UIStroke", TitleLbl, { Color = Color3.fromRGB(100, 180, 255), Thickness = 0.8, Transparency = 0.2 })

    local SubTitleLbl = Create("TextLabel", TopBar, { Size = UDim2.new(1, -90, 0, 20), Position = UDim2.new(0, 14, 0, 28), BackgroundTransparency = 1, Text = "Mod by Ömer • Herkese Açık Sürüm", TextColor3 = Color3.fromRGB(200, 200, 220), TextSize = 10, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Left })

    local MinBtn = Create("TextButton", TopBar, { Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(1, -70, 0, 14), BackgroundColor3 = Color3.fromRGB(45, 45, 65), BackgroundTransparency = 0.3, Text = "—", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13, Font = Enum.Font.GothamBold })
    Corner(MinBtn, 8) Stroke(MinBtn)

    local CloseBtn = Create("TextButton", TopBar, { Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(1, -36, 0, 14), BackgroundColor3 = Color3.fromRGB(200, 50, 50), BackgroundTransparency = 0.2, Text = "✕", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13, Font = Enum.Font.GothamBold })
    Corner(CloseBtn, 8) Stroke(CloseBtn)

    local OpenBtn = Create("TextButton", SG, { Size = UDim2.new(0, 44, 0, 44), Position = UDim2.new(0, 20, 0, 100), BackgroundColor3 = Color3.fromRGB(20, 20, 30), BackgroundTransparency = 0.3, Text = "⚡", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 22, Visible = false })
    Corner(OpenBtn, 12) Stroke(OpenBtn)

    local TabContainer = Create("ScrollingFrame", Main, { Size = UDim2.new(0, 145, 1, -66), Position = UDim2.new(0, 0, 0, 60), BackgroundTransparency = 1, CanvasSize = UDim2.new(0, 0, 0, 340), ScrollBarThickness = 2 })
    Create("UIListLayout", TabContainer, { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6) })
    Create("UIPadding", TabContainer, { PaddingTop = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8) })

    Create("Frame", Main, { Size = UDim2.new(0, 1, 1, -66), Position = UDim2.new(0, 152, 0, 60), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.7, BorderSizePixel = 0 })

    local ContentArea = Create("Frame", Main, { Size = UDim2.new(1, -160, 1, -66), Position = UDim2.new(0, 158, 0, 60), BackgroundTransparency = 1 })

    local pages = {}
    local function createPage(name)
        local page = Create("ScrollingFrame", ContentArea, { Size = UDim2.new(1, -6, 1, -6), Position = UDim2.new(0, 3, 0, 3), BackgroundTransparency = 1, CanvasSize = UDim2.new(0, 0, 0, 500), ScrollBarThickness = 3, Visible = false })
        Create("UIListLayout", page, { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10) })
        pages[name] = page
        return page
    end

    createPage("InfoPlayer")
    createPage("Main")
    createPage("Players")
    createPage("Visuals")
    createPage("ESP")
    createPage("Updates")

    local function switchPage(target)
        for name, page in pairs(pages) do page.Visible = (name == target) end
    end
    switchPage("InfoPlayer")

    local function createTabButton(text, target, order)
        local btn = Create("TextButton", TabContainer, { Size = UDim2.new(1, -12, 0, 32), BackgroundColor3 = Color3.fromRGB(25, 25, 40), BackgroundTransparency = 0.4, Text = text, TextColor3 = Color3.fromRGB(220, 220, 240), TextSize = 10, Font = Enum.Font.GothamMedium, LayoutOrder = order })
        Corner(btn, 10) 
        Stroke(btn, Color3.fromRGB(255, 255, 255), 1.2)
        btn.MouseButton1Click:Connect(function() switchPage(target) end)
    end

    createTabButton("📊 Info Player", "InfoPlayer", 1)
    createTabButton("🏠 Ana Menü", "Main", 2)
    createTabButton("👤 Players", "Players", 3)
    createTabButton("👁️ Visuals", "Visuals", 4)
    createTabButton("⭐ ESP", "ESP", 5)
    createTabButton("📢 Güncellemeler", "Updates", 6)

    -- 1. Info Player
    local infoPage = pages["InfoPlayer"]
    local avatarFrame = Create("Frame", infoPage, { Size = UDim2.new(1, -6, 0, 95), BackgroundColor3 = Color3.fromRGB(20, 20, 30), BackgroundTransparency = 0.5 })
    Corner(avatarFrame, 12) Stroke(avatarFrame, Color3.fromRGB(255, 255, 255), 1.2)
    local avatarImage = Create("ImageLabel", avatarFrame, { Size = UDim2.new(0, 70, 0, 70), Position = UDim2.new(0.5, -35, 0.5, -35), BackgroundTransparency = 1, Image = "rbxthumb://type=AvatarHeadShot&id=" .. Plr.UserId .. "&w=420&h=420" })
    Corner(avatarImage, 35)

    local infoBox = Create("Frame", infoPage, { Size = UDim2.new(1, -6, 0, 105), BackgroundColor3 = Color3.fromRGB(20, 20, 30), BackgroundTransparency = 0.5 })
    Corner(infoBox, 12) Stroke(infoBox, Color3.fromRGB(255, 255, 255), 1.2)
    
    local infoLabel = Create("TextLabel", infoBox, { 
        Size = UDim2.new(1, -10, 1, 0), Position = UDim2.new(0, 5, 0, 0), BackgroundTransparency = 1, 
        Text = "👤 İsim: " .. Plr.Name .. " | ID: " .. Plr.UserId .. "\n📅 Yaş: " .. Plr.AccountAge .. " Gün\n⭐ Durum: Herkese Açık Sürüm", 
        TextColor3 = Color3.fromRGB(220, 240, 255), TextSize = 10, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Center, TextYAlignment = Enum.TextYAlignment.Center, TextWrapped = true 
    })

    -- 2. Ana Menü
    local mainPage = pages["Main"]
    local OpenBhopWinBtn = Create("TextButton", mainPage, { Size = UDim2.new(1, -6, 0, 42), BackgroundColor3 = Color3.fromRGB(25, 25, 40), BackgroundTransparency = 0.4, Text = "⭐ Bhop Kontrol Penceresini Aç", TextColor3 = Color3.fromRGB(255, 220, 100), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(OpenBhopWinBtn, 10) Stroke(OpenBhopWinBtn, Color3.fromRGB(255, 215, 0), 1.4)

    -- 3. Players
    local playersPage = pages["Players"]
    local SpeedToggleBtn = Create("TextButton", playersPage, { Size = UDim2.new(1, -6, 0, 38), BackgroundColor3 = Color3.fromRGB(25, 25, 40), BackgroundTransparency = 0.4, Text = "Özel Hız (Speed): OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(SpeedToggleBtn, 10) Stroke(SpeedToggleBtn, Color3.fromRGB(255, 255, 255), 1.2)
    
    local SpeedTextBox = Create("TextBox", playersPage, { Size = UDim2.new(1, -6, 0, 36), BackgroundColor3 = Color3.fromRGB(15, 15, 25), BackgroundTransparency = 0.5, Text = "60", PlaceholderText = "Hız Değeri", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamMedium })
    Corner(SpeedTextBox, 10) Stroke(SpeedTextBox, Color3.fromRGB(255, 255, 255), 1.2)

    local JumpToggleBtn = Create("TextButton", playersPage, { Size = UDim2.new(1, -6, 0, 38), BackgroundColor3 = Color3.fromRGB(25, 25, 40), BackgroundTransparency = 0.4, Text = "Mega Jump: OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(JumpToggleBtn, 10) Stroke(JumpToggleBtn, Color3.fromRGB(255, 255, 255), 1.2)
    
    local JumpTextBox = Create("TextBox", playersPage, { Size = UDim2.new(1, -6, 0, 36), BackgroundColor3 = Color3.fromRGB(15, 15, 25), BackgroundTransparency = 0.5, Text = "100", PlaceholderText = "Jump Değeri", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamMedium })
    Corner(JumpTextBox, 10) Stroke(JumpTextBox, Color3.fromRGB(255, 255, 255), 1.2)

    -- 4. Visuals
    local visualsPage = pages["Visuals"]
    local FovToggleBtn = Create("TextButton", visualsPage, { Size = UDim2.new(1, -6, 0, 38), BackgroundColor3 = Color3.fromRGB(25, 25, 40), BackgroundTransparency = 0.4, Text = "Özel FOV Ayarı: OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(FovToggleBtn, 10) Stroke(FovToggleBtn, Color3.fromRGB(255, 255, 255), 1.2)
    
    local FovTextBox = Create("TextBox", visualsPage, { Size = UDim2.new(1, -6, 0, 36), BackgroundColor3 = Color3.fromRGB(15, 15, 25), BackgroundTransparency = 0.5, Text = "90", PlaceholderText = "FOV Değeri", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamMedium })
    Corner(FovTextBox, 10) Stroke(FovTextBox, Color3.fromRGB(255, 255, 255), 1.2)

    local StretchedToggleBtn = Create("TextButton", visualsPage, { Size = UDim2.new(1, -6, 0, 38), BackgroundColor3 = Color3.fromRGB(25, 25, 40), BackgroundTransparency = 0.4, Text = "Basık Ekran (Stretched): OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(StretchedToggleBtn, 10) Stroke(StretchedToggleBtn, Color3.fromRGB(255, 255, 255), 1.2)

    -- 5. ESP Sekmesi (Herkes İçin Açık)
    local espPage = pages["ESP"]
    local espBox = Create("Frame", espPage, { Size = UDim2.new(1, -6, 0, 290), BackgroundColor3 = Color3.fromRGB(20, 20, 30), BackgroundTransparency = 0.5 })
    Corner(espBox, 12) 
    Stroke(espBox, Color3.fromRGB(255, 215, 0), 1.6)

    Create("UIListLayout", espBox, { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8), HorizontalAlignment = Enum.HorizontalAlignment.Center })
    Create("UIPadding", espBox, { PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10) })

    local EspBigTitle = Create("TextLabel", espBox, { Size = UDim2.new(1, 0, 0, 24), BackgroundTransparency = 1, Text = "⭐ EVADE ESP KONTROLÜ ⭐", TextColor3 = Color3.fromRGB(255, 215, 0), TextSize = 11, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Center, LayoutOrder = 1 })
    Create("UIStroke", EspBigTitle, { Color = Color3.fromRGB(255, 100, 0), Thickness = 0.8, Transparency = 0.2 })

    local PlayersEspBtn = Create("TextButton", espBox, { Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = Color3.fromRGB(200, 50, 50), BackgroundTransparency = 0.3, Text = "Players ESP: OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 10, Font = Enum.Font.GothamBold, LayoutOrder = 2 })
    Corner(PlayersEspBtn, 8) Stroke(PlayersEspBtn, Color3.fromRGB(255, 215, 0), 1.2)

    local NextbotEspBtn = Create("TextButton", espBox, { Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = Color3.fromRGB(100, 100, 100), BackgroundTransparency = 0.5, Text = "Nextbot ESP (Kullanım Dışı): OFF", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 9, Font = Enum.Font.GothamBold, LayoutOrder = 3 })
    Corner(NextbotEspBtn, 8) Stroke(NextbotEspBtn, Color3.fromRGB(150, 150, 150), 1.2)

    local NightVisionBtn = Create("TextButton", espBox, { Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = Color3.fromRGB(25, 25, 40), BackgroundTransparency = 0.4, Text = "Gece Görüşü: OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 10, Font = Enum.Font.GothamBold, LayoutOrder = 4 })
    Corner(NightVisionBtn, 8) Stroke(NightVisionBtn, Color3.fromRGB(255, 215, 0), 1.2)

    local EspDesc = Create("TextLabel", espBox, { 
        Size = UDim2.new(1, 0, 0, 45), BackgroundTransparency = 1, 
        Text = "• Canlılar Yeşil, Ölüler Kırmızı, Sen hariç!", 
        TextColor3 = Color3.fromRGB(210, 230, 255), TextSize = 9, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Center, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, LayoutOrder = 5 
    })
    
    local playersEspOn = false
    PlayersEspBtn.MouseButton1Click:Connect(function()
        playersEspOn = not playersEspOn
        PlayersEspBtn.Text = playersEspOn and "Players ESP: ON" or "Players ESP: OFF"
        PlayersEspBtn.BackgroundColor3 = playersEspOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(200, 50, 50)
    end)

    NextbotEspBtn.MouseButton1Click:Connect(function()
        NextbotEspBtn.Text = "❌ BU ÖZELLİK KULLANIM DIŞI!"
        task.delay(1.5, function()
            NextbotEspBtn.Text = "Nextbot ESP (Kullanım Dışı): OFF"
        end)
    end)

    local nvOn = false
    NightVisionBtn.MouseButton1Click:Connect(function()
        nvOn = not nvOn
        NightVisionBtn.Text = nvOn and "Gece Görüşü: ON" or "Gece Görüşü: OFF"
        NightVisionBtn.BackgroundColor3 = nvOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(25, 25, 40)
        if nvOn then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        else
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end
    end)

    RS.RenderStepped:Connect(function()
        if playersEspOn then
            for _, otherPlr in ipairs(Players:GetPlayers()) do
                if otherPlr ~= Plr and otherPlr.Character then
                    local char = otherPlr.Character
                    local hl = char:FindFirstChild("PlayerHighlight")
                    if not hl then
                        hl = Instance.new("Highlight")
                        hl.Name = "PlayerHighlight"
                        hl.Adornee = char
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        hl.FillTransparency = 0.4
                        hl.Parent = char
                    end
                    hl.FillColor = Color3.fromRGB(0, 255, 0)
                end
            end
            
            for _, obj in ipairs(workspace:GetChildren()) do
                if obj:IsA("Model") and not Players:GetPlayerFromCharacter(obj) then
                    if obj:FindFirstChild("Head") and not obj:FindFirstChildOfClass("Humanoid") then
                        local hl = obj:FindFirstChild("PlayerHighlight")
                        if not hl then
                            hl = Instance.new("Highlight")
                            hl.Name = "PlayerHighlight"
                            hl.Adornee = obj
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                            hl.FillTransparency = 0.4
                            hl.Parent = obj
                        end
                        hl.FillColor = Color3.fromRGB(255, 0, 0)
                    end
                end
            end
        else
            for _, otherPlr in ipairs(Players:GetPlayers()) do
                if otherPlr.Character and otherPlr.Character:FindFirstChild("PlayerHighlight") then
                    otherPlr.Character.PlayerHighlight:Destroy()
                end
            end
            for _, obj in ipairs(workspace:GetChildren()) do
                if obj.Name == "PlayerHighlight" then
                    obj:Destroy()
                end
            end
        end
    end)

    -- 6. Güncellemeler
    local updatesPage = pages["Updates"]
    local UpdateInfoBox = Create("TextLabel", updatesPage, { 
        Size = UDim2.new(1, -6, 0, 180), BackgroundColor3 = Color3.fromRGB(20, 20, 30), BackgroundTransparency = 0.5, 
        Text = "-UPDATE-\n-Guı baştan aşağıya değişti\n-Espler herkes için açıldı\n-Bütün özellikler serbest bırakıldı\n\n-V4 de Key sistemi gelecektir!\n\nMod by Ömer", 
        TextColor3 = Color3.fromRGB(210, 210, 230), TextSize = 10, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true 
    })
    Corner(UpdateInfoBox, 12) Stroke(UpdateInfoBox, Color3.fromRGB(255, 255, 255), 1.2)

    -- Bhop Mini Pencere (Herkese Açık)
    local BhopSG = Create("ScreenGui", PlrGui, { Name = "BhopMenuGUI", ResetOnSpawn = false, DisplayOrder = 99999 })
    local BhopWindow = Create("Frame", BhopSG, { Size = UDim2.new(0, 170, 0, 110), Position = UDim2.new(0.5, 160, 0.5, -175), BackgroundColor3 = Color3.fromRGB(10, 10, 18), BackgroundTransparency = 0.45, Visible = false })
    Corner(BhopWindow, 14) Stroke(BhopWindow, Color3.fromRGB(255, 215, 0), 1.4)

    local BhopTopBar = Create("Frame", BhopWindow, { Size = UDim2.new(1, 0, 0, 32), BackgroundColor3 = Color3.fromRGB(18, 18, 28), BackgroundTransparency = 0.4 })
    Corner(BhopTopBar, 14) Stroke(BhopTopBar, Color3.fromRGB(255, 215, 0), 1.2)
    Create("TextLabel", BhopTopBar, { Size = UDim2.new(1, -10, 1, 0), Position = UDim2.new(0, 8, 0, 0), BackgroundTransparency = 1, Text = "⭐ Bhop Kontrol", TextColor3 = Color3.fromRGB(255, 220, 100), TextSize = 10, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left })
    
    local BhopStateButton = Create("TextButton", BhopWindow, { Size = UDim2.new(0.9, 0, 0, 44), Position = UDim2.new(0.05, 0, 0, 44), BackgroundColor3 = Color3.fromRGB(200, 50, 50), BackgroundTransparency = 0.3, Text = "Durum: OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(BhopStateButton, 10) Stroke(BhopStateButton, Color3.fromRGB(255, 255, 255), 1.2)

    MakeDraggable(TopBar, Main)
    MakeDraggable(BhopTopBar, BhopWindow)

    MinBtn.MouseButton1Click:Connect(function() Main.Visible, OpenBtn.Visible = false, true end)
    CloseBtn.MouseButton1Click:Connect(function() SG:Destroy() BhopSG:Destroy() end)
    OpenBtn.MouseButton1Click:Connect(function() Main.Visible, OpenBtn.Visible = true, false end)
    
    OpenBhopWinBtn.MouseButton1Click:Connect(function()
        BhopWindow.Visible = not BhopWindow.Visible
    end)

    local bOn, sOn, jOn, fOn, strOn = false, false, false, false, false

    BhopStateButton.MouseButton1Click:Connect(function()
        bOn = not bOn
        BhopStateButton.Text = bOn and "Durum: ON" or "Durum: OFF"
        BhopStateButton.BackgroundColor3 = bOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(200, 50, 50)
    end)

    SpeedToggleBtn.MouseButton1Click:Connect(function()
        sOn = not sOn
        SpeedToggleBtn.Text = sOn and "Özel Hız: ON" or "Özel Hız (Speed): OFF"
        SpeedToggleBtn.BackgroundColor3 = sOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(25, 25, 40)
    end)

    JumpToggleBtn.MouseButton1Click:Connect(function()
        jOn = not jOn
        JumpToggleBtn.Text = jOn and "Mega Jump: ON" or "Mega Jump: OFF"
        JumpToggleBtn.BackgroundColor3 = jOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(25, 25, 40)
    end)

    FovToggleBtn.MouseButton1Click:Connect(function()
        fOn = not fOn
        FovToggleBtn.Text = fOn and "Özel FOV: ON" or "Özel FOV Ayarı: OFF"
        FovToggleBtn.BackgroundColor3 = fOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(25, 25, 40)
        if not fOn then Camera.FieldOfView = 70 end
    end)

    StretchedToggleBtn.MouseButton1Click:Connect(function()
        strOn = not strOn
        StretchedToggleBtn.Text = strOn and "Basık Ekran: ON" or "Basık Ekran (Stretched): OFF"
        StretchedToggleBtn.BackgroundColor3 = strOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(25, 25, 40)
    end)

    RS.RenderStepped:Connect(function()
        local char = Plr.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            local root = char:FindFirstChild("HumanoidRootPart")
            if hum and root and hum.Health > 0 then
                local sVal = tonumber(SpeedTextBox.Text) or 60
                local jVal = tonumber(JumpTextBox.Text) or 100
                local fVal = tonumber(FovTextBox.Text) or 90

                if sOn then
                    hum.WalkSpeed = sVal
                    local md = hum.MoveDirection
                    if md.Magnitude > 0 then
                        root.CFrame = root.CFrame + (md * (sVal / 150))
                    end
                else
                    hum.WalkSpeed = 16
                end

                if jOn then
                    hum.JumpPower = jVal
                    hum.UseJumpPower = true
                else
                    hum.JumpPower = 50
                end

                if fOn then Camera.FieldOfView = math.clamp(fVal, 10, 300) end
                if strOn then Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.82, 0, 0, 0, 1) end

                if bOn then
                    hum.WalkSpeed = sVal
                    local md = hum.MoveDirection
                    if md.Magnitude > 0 then
                        root.AssemblyLinearVelocity = Vector3.new(md.X * sVal, root.AssemblyLinearVelocity.Y, md.Z * sVal)
                    end
                    if hum.FloorMaterial ~= Enum.Material.Air and md.Magnitude > 0 then
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end
        end
    end)
end)

if runtimeError then warn("V3 Çalışma Hatası: "..tostring(runtimeError)) end
