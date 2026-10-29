-- ==============================================================================
-- PROJE: Evade Script Pro Hub (V2 - Orijinal "Mod by Ömer" İmzalı Sürüm)
-- TASARLAYAN VE KODLAYAN: Ömer 🇹🇷 ⚡
-- ==============================================================================

local success, runtimeError = pcall(function()
    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    local RS = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    
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
        return Create("UICorner", parent, { CornerRadius = UDim.new(0, r or 8) })
    end

    local function MakeDraggable(bar, frame)
        local dragging, dragInput, dragStart, startPos
        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging, dragStart, startPos = true, input.Position, frame.Position
                input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
            end
        end)
        bar.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
        end)
        UIS.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    local SG = Create("ScreenGui", PlrGui, { Name = "EvadeProHubWindow", ResetOnSpawn = false, DisplayOrder = 99999 })
    local Main = Create("Frame", SG, { Size = UDim2.new(0, 480, 0, 330), Position = UDim2.new(0.5, -240, 0.5, -165), BackgroundColor3 = Color3.fromRGB(18, 18, 24), BorderSizePixel = 0 })
    Corner(Main, 10)

    -- Üst Başlık ve Orijinal Gri "Mod by Ömer" İmzası
    local TopBar = Create("Frame", Main, { Size = UDim2.new(1, 0, 0, 52), BackgroundColor3 = Color3.fromRGB(25, 25, 35), BorderSizePixel = 0 })
    Corner(TopBar, 10)
    Create("Frame", TopBar, { Size = UDim2.new(1, 0, 0, 6), Position = UDim2.new(0, 0, 1, -6), BackgroundColor3 = Color3.fromRGB(25, 25, 35), BorderSizePixel = 0 })

    Create("TextLabel", TopBar, { Size = UDim2.new(1, -50, 0, 22), Position = UDim2.new(0, 10, 0, 4), BackgroundTransparency = 1, Text = "👤 " .. Plr.Name .. " | Evade Pro Hub V2 🇹🇷 ⚡", TextColor3 = Color3.fromRGB(240, 240, 245), TextSize = 11, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left })
    Create("TextLabel", TopBar, { Size = UDim2.new(1, -20, 0, 20), Position = UDim2.new(0, 0, 0, 26), BackgroundTransparency = 1, Text = "Mod by Ömer", TextColor3 = Color3.fromRGB(160, 160, 175), TextSize = 10, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Center })

    local MinBtn = Create("TextButton", TopBar, { Size = UDim2.new(0, 32, 0, 26), Position = UDim2.new(1, -38, 0, 4), BackgroundColor3 = Color3.fromRGB(40, 40, 55), BorderSizePixel = 0, Text = "-", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 16, Font = Enum.Font.GothamBold })
    Corner(MinBtn, 6)

    local OpenBtn = Create("TextButton", SG, { Size = UDim2.new(0, 40, 0, 40), Position = UDim2.new(0, 150, 0, 55), BackgroundColor3 = Color3.fromRGB(25, 25, 35), BorderSizePixel = 0, Text = "⚡", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 20, Visible = false })
    Corner(OpenBtn, 8)

    local TabContainer = Create("ScrollingFrame", Main, { Size = UDim2.new(0, 130, 1, -58), Position = UDim2.new(0, 0, 0, 54), BackgroundTransparency = 1, BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 280), ScrollBarThickness = 2 })
    Create("UIListLayout", TabContainer, { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6) })
    Create("UIPadding", TabContainer, { PaddingTop = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8) })

    Create("Frame", Main, { Size = UDim2.new(0, 1, 1, -58), Position = UDim2.new(0, 132, 0, 54), BackgroundColor3 = Color3.fromRGB(40, 40, 55), BorderSizePixel = 0 })

    local ContentArea = Create("Frame", Main, { Size = UDim2.new(1, -140, 1, -58), Position = UDim2.new(0, 138, 0, 54), BackgroundTransparency = 1 })

    local pages = {}
    local function createPage(name)
        local page = Create("ScrollingFrame", ContentArea, { Size = UDim2.new(1, -6, 1, -6), Position = UDim2.new(0, 3, 0, 3), BackgroundTransparency = 1, BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 450), ScrollBarThickness = 3, Visible = false })
        Create("UIListLayout", page, { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) })
        pages[name] = page
        return page
    end

    createPage("InfoPlayer")
    createPage("V3Info")
    createPage("Main")
    createPage("Players")
    createPage("Visuals")
    createPage("Soon2")
    createPage("Updates")

    local function switchPage(target)
        for name, page in pairs(pages) do page.Visible = (name == target) end
    end
    switchPage("InfoPlayer")

    local function createTabButton(text, target, order)
        local btn = Create("TextButton", TabContainer, { Size = UDim2.new(1, -10, 0, 35), BackgroundColor3 = Color3.fromRGB(28, 28, 38), BorderSizePixel = 0, Text = text, TextColor3 = Color3.fromRGB(190, 190, 200), TextSize = 11, Font = Enum.Font.GothamMedium, LayoutOrder = order })
        Corner(btn, 6)
        btn.MouseButton1Click:Connect(function() switchPage(target) end)
    end

    createTabButton("📊 Info Player", "InfoPlayer", 1)
    createTabButton("🏠 Ana Menü", "Main", 2)
    createTabButton("🚀 V3 Hakkında", "V3Info", 3)
    createTabButton("👤 Players", "Players", 4)
    createTabButton("👁️ Visuals", "Visuals", 5)
    createTabButton("⏳ Yakında", "Soon2", 6)
    createTabButton("📢 Güncellemeler", "Updates", 7)

    -- 1. Info Player
    local infoPage = pages["InfoPlayer"]
    local avatarFrame = Create("Frame", infoPage, { Size = UDim2.new(1, -6, 0, 95), BackgroundColor3 = Color3.fromRGB(24, 24, 32), BorderSizePixel = 0 })
    Corner(avatarFrame, 8)
    local avatarImage = Create("ImageLabel", avatarFrame, { Size = UDim2.new(0, 70, 0, 70), Position = UDim2.new(0.5, -35, 0.5, -35), BackgroundTransparency = 1, Image = "rbxthumb://type=AvatarHeadShot&id=" .. Plr.UserId .. "&w=420&h=420" })
    Corner(avatarImage, 35)

    local infoBox = Create("Frame", infoPage, { Size = UDim2.new(1, -6, 0, 105), BackgroundColor3 = Color3.fromRGB(24, 24, 32), BorderSizePixel = 0 })
    Corner(infoBox, 8)
    Create("TextLabel", infoBox, { 
        Size = UDim2.new(1, -10, 1, 0), Position = UDim2.new(0, 5, 0, 0), BackgroundTransparency = 1, 
        Text = "👤 İsim: " .. Plr.Name .. " | ID: " .. Plr.UserId .. "\n📅 Yaş: " .. Plr.AccountAge .. " Gün\n⭐ Ana Grup: Evade\n🛡️ Topluluk: Sikliyorum komutan", 
        TextColor3 = Color3.fromRGB(210, 230, 255), TextSize = 10, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Center, TextYAlignment = Enum.TextYAlignment.Center, TextWrapped = true 
    })

    -- 2. V3 Bilgi Sayfası
    local v3Page = pages["V3Info"]
    local v3Box = Create("Frame", v3Page, { Size = UDim2.new(1, -6, 0, 280), BackgroundColor3 = Color3.fromRGB(24, 24, 32), BorderSizePixel = 0 })
    Corner(v3Box, 8)
    Create("TextLabel", v3Box, { 
        Size = UDim2.new(1, -10, 0, 120), Position = UDim2.new(0, 5, 0, 5), BackgroundTransparency = 1, 
        Text = "🚀 V3 PLANLARI:\n• GUI yenilenecek\n• VIP özellik eklenecek\n• Bhop geliştirilecek\n• Korblox Headless eklenecek", 
        TextColor3 = Color3.fromRGB(255, 220, 100), TextSize = 10, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true 
    })
    Create("TextLabel", v3Box, { 
        Size = UDim2.new(1, -10, 0, 20), Position = UDim2.new(0, 5, 0, 130), BackgroundTransparency = 1, 
        Text = "Mod by Ömer", TextColor3 = Color3.fromRGB(160, 160, 175), TextSize = 10, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Center, TextYAlignment = Enum.TextYAlignment.Center, TextWrapped = true 
    })
    Create("TextLabel", v3Box, { 
        Size = UDim2.new(1, -10, 0, 100), Position = UDim2.new(0, 5, 0, 155), BackgroundTransparency = 1, 
        Text = "Bu resmi yapılıştır. Bu kod emek verilerek yazılmıştır. Lütfen başkasının hilesi sanmayın!!!!", 
        TextColor3 = Color3.fromRGB(255, 50, 50), TextSize = 11, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Center, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true 
    })

    -- 3. Ana Menü
    local mainPage = pages["Main"]
    local OpenBhopWinBtn = Create("TextButton", mainPage, { Size = UDim2.new(1, -6, 0, 40), BackgroundColor3 = Color3.fromRGB(35, 35, 48), BorderSizePixel = 0, Text = "Bhop Kontrol Penceresini Aç", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(OpenBhopWinBtn, 6)

    -- 4. Players Sayfası
    local playersPage = pages["Players"]
    local SpeedToggleBtn = Create("TextButton", playersPage, { Size = UDim2.new(1, -6, 0, 36), BackgroundColor3 = Color3.fromRGB(35, 35, 48), BorderSizePixel = 0, Text = "Özel Hız (Speed): OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(SpeedToggleBtn, 6)
    local SpeedTextBox = Create("TextBox", playersPage, { Size = UDim2.new(1, -6, 0, 34), BackgroundColor3 = Color3.fromRGB(24, 24, 32), BorderSizePixel = 0, Text = "60", PlaceholderText = "Hız Değeri", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamMedium })
    Corner(SpeedTextBox, 6)

    local JumpToggleBtn = Create("TextButton", playersPage, { Size = UDim2.new(1, -6, 0, 36), BackgroundColor3 = Color3.fromRGB(35, 35, 48), BorderSizePixel = 0, Text = "Mega Jump: OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(JumpToggleBtn, 6)
    local JumpTextBox = Create("TextBox", playersPage, { Size = UDim2.new(1, -6, 0, 34), BackgroundColor3 = Color3.fromRGB(24, 24, 32), BorderSizePixel = 0, Text = "100", PlaceholderText = "Jump Değeri", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamMedium })
    Corner(JumpTextBox, 6)

    -- 5. Visuals Sayfası
    local visualsPage = pages["Visuals"]
    local FovToggleBtn = Create("TextButton", visualsPage, { Size = UDim2.new(1, -6, 0, 36), BackgroundColor3 = Color3.fromRGB(35, 35, 48), BorderSizePixel = 0, Text = "Özel FOV Ayarı: OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(FovToggleBtn, 6)
    local FovTextBox = Create("TextBox", visualsPage, { Size = UDim2.new(1, -6, 0, 34), BackgroundColor3 = Color3.fromRGB(24, 24, 32), BorderSizePixel = 0, Text = "90", PlaceholderText = "FOV Değeri", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamMedium })
    Corner(FovTextBox, 6)

    local StretchedToggleBtn = Create("TextButton", visualsPage, { Size = UDim2.new(1, -6, 0, 36), BackgroundColor3 = Color3.fromRGB(35, 35, 48), BorderSizePixel = 0, Text = "Basık Ekran (Stretched): OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(StretchedToggleBtn, 6)

    -- 6. Yakında Sayfası
    local soonPage = pages["Soon2"]
    local soonBox = Create("Frame", soonPage, { Size = UDim2.new(1, -6, 0, 120), BackgroundColor3 = Color3.fromRGB(24, 24, 32), BorderSizePixel = 0 })
    Corner(soonBox, 8)
    Create("TextLabel", soonBox, { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "⏳ Yakında Gelecek...", TextColor3 = Color3.fromRGB(220, 180, 50), TextSize = 11, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Center, TextYAlignment = Enum.TextYAlignment.Center })

    -- 7. Güncellemeler Sayfası
    local updatesPage = pages["Updates"]
    local UpdateInfoBox = Create("TextLabel", updatesPage, { 
        Size = UDim2.new(1, -6, 0, 180), BackgroundColor3 = Color3.fromRGB(24, 24, 32), BorderSizePixel = 0, 
        Text = " 📢 UPDATE:\n1. FOV ve Basık Ekran aktif.\n2. V3 Bilgi sekmesi eklendi.\n3. Info players aktif.\n\n Mod by Ömer", 
        TextColor3 = Color3.fromRGB(190, 190, 205), TextSize = 10, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true 
    })
    Corner(UpdateInfoBox, 6)

    -- Bhop Mini Pencere
    local BhopSG = Create("ScreenGui", PlrGui, { Name = "BhopMenuGUI", ResetOnSpawn = false, DisplayOrder = 99999 })
    local BhopWindow = Create("Frame", BhopSG, { Size = UDim2.new(0, 160, 0, 100), Position = UDim2.new(0.5, 150, 0.5, -165), BackgroundColor3 = Color3.fromRGB(18, 18, 24), BorderSizePixel = 0, Visible = false })
    Corner(BhopWindow, 8)
    local BhopTopBar = Create("Frame", BhopWindow, { Size = UDim2.new(1, 0, 0, 28), BackgroundColor3 = Color3.fromRGB(25, 25, 35), BorderSizePixel = 0 })
    Corner(BhopTopBar, 8)
    Create("TextLabel", BhopTopBar, { Size = UDim2.new(1, -10, 1, 0), Position = UDim2.new(0, 8, 0, 0), BackgroundTransparency = 1, Text = "Bhop Kontrol", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 10, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left })
    local BhopStateButton = Create("TextButton", BhopWindow, { Size = UDim2.new(0.9, 0, 0, 42), Position = UDim2.new(0.05, 0, 0, 38), BackgroundColor3 = Color3.fromRGB(200, 50, 50), BorderSizePixel = 0, Text = "Durum: OFF", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 11, Font = Enum.Font.GothamBold })
    Corner(BhopStateButton, 6)

    MakeDraggable(TopBar, Main)
    MakeDraggable(BhopTopBar, BhopWindow)

    MinBtn.MouseButton1Click:Connect(function() Main.Visible, OpenBtn.Visible = false, true end)
    OpenBtn.MouseButton1Click:Connect(function() Main.Visible, OpenBtn.Visible = true, false end)
    OpenBhopWinBtn.MouseButton1Click:Connect(function() BhopWindow.Visible = not BhopWindow.Visible end)

    local bOn, sOn, jOn, fOn, strOn = false, false, false, false, false

    BhopStateButton.MouseButton1Click:Connect(function()
        bOn = not bOn
        BhopStateButton.Text = bOn and "Durum: ON" or "Durum: OFF"
        BhopStateButton.BackgroundColor3 = bOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(200, 50, 50)
    end)

    SpeedToggleBtn.MouseButton1Click:Connect(function()
        sOn = not sOn
        SpeedToggleBtn.Text = sOn and "Özel Hız: ON" or "Özel Hız (Speed): OFF"
        SpeedToggleBtn.BackgroundColor3 = sOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(35, 35, 48)
    end)

    JumpToggleBtn.MouseButton1Click:Connect(function()
        jOn = not jOn
        JumpToggleBtn.Text = jOn and "Mega Jump: ON" or "Mega Jump: OFF"
        JumpToggleBtn.BackgroundColor3 = jOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(35, 35, 48)
    end)

    FovToggleBtn.MouseButton1Click:Connect(function()
        fOn = not fOn
        FovToggleBtn.Text = fOn and "Özel FOV: ON" or "Özel FOV Ayarı: OFF"
        FovToggleBtn.BackgroundColor3 = fOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(35, 35, 48)
        if not fOn then Camera.FieldOfView = 70 end
    end)

    StretchedToggleBtn.MouseButton1Click:Connect(function()
        strOn = not strOn
        StretchedToggleBtn.Text = strOn and "Basık Ekran: ON" or "Basık Ekran (Stretched): OFF"
        StretchedToggleBtn.BackgroundColor3 = strOn and Color3.fromRGB(50, 180, 90) or Color3.fromRGB(35, 35, 48)
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

                if sOn or bOn then
                    hum.WalkSpeed = sVal
                    local md = hum.MoveDirection
                    if md.Magnitude > 0 and not bOn then
                        root.CFrame = root.CFrame + (md * (sVal / 150))
                    end
                else
                    hum.WalkSpeed = 16
                end

                if jOn then
                    hum.JumpPower = jVal
                    hum.UseJumpPower = true
                    if hum.FloorMaterial ~= Enum.Material.Air and UIS:IsKeyDown(Enum.KeyCode.Space) then
                        root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, jVal / 2, root.AssemblyLinearVelocity.Z)
                    end
                else
                    hum.JumpPower = 50
                end

                if fOn then Camera.FieldOfView = math.clamp(fVal, 10, 300) end
                if strOn then Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.82, 0, 0, 0, 1) end

                if bOn then
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

    Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
        if fOn and not strOn then
            local fVal = tonumber(FovTextBox.Text) or 90
            if Camera.FieldOfView ~= fVal then Camera.FieldOfView = math.clamp(fVal, 10, 300) end
        end
    end)
end)

if runtimeError then warn("Hata: "..tostring(runtimeError)) end
