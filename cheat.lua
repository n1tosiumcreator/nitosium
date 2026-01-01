-- NITOSIUM CORE v1.2 - WORKING VERSION WITH KEYS
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ВАШИ 10 КЛЮЧЕЙ (дайте эти ключи деревне)
local VALID_KEYS = {
    "NITOSIUM-2024-1",
    "NITOSIUM-2024-2", 
    "NITOSIUM-2024-3",
    "NITOSIUM-2024-4",
    "NITOSIUM-2024-5",
    "NITOSIUM-2024-6",
    "NITOSIUM-2024-7",
    "NITOSIUM-2024-8",
    "NITOSIUM-2024-9",
    "NITOSIUM-2024-10"
}

-- Простая проверка ключа
local function CheckKey(key)
    for _, validKey in pairs(VALID_KEYS) do
        if key == validKey then
            return true
        end
    end
    return false
end

-- Создаем GUI для ввода ключа
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "KeyInputGUI"
KeyGui.Parent = game:GetService("CoreGui")
KeyGui.ResetOnSpawn = false

local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = KeyGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyFrame.BorderSizePixel = 0
KeyFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
KeyFrame.Size = UDim2.new(0, 400, 0, 250)
KeyFrame.Active = true
KeyFrame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = KeyFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 20)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "NITOSIUM CORE v1.2"
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.TextSize = 26

local InfoText = Instance.new("TextLabel")
InfoText.Name = "InfoText"
InfoText.Parent = KeyFrame
InfoText.BackgroundTransparency = 1
InfoText.Position = UDim2.new(0, 0, 0, 70)
InfoText.Size = UDim2.new(1, 0, 0, 40)
InfoText.Font = Enum.Font.Gotham
InfoText.Text = "Enter one of 10 license keys"
InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoText.TextSize = 14

local KeyBox = Instance.new("TextBox")
KeyBox.Name = "KeyBox"
KeyBox.Parent = KeyFrame
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyBox.BorderSizePixel = 0
KeyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Font = Enum.Font.Code
KeyBox.PlaceholderText = "Type license key here..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.new(1, 1, 1)
KeyBox.TextSize = 16

local ActivateBtn = Instance.new("TextButton")
ActivateBtn.Name = "ActivateBtn"
ActivateBtn.Parent = KeyFrame
ActivateBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
ActivateBtn.BorderSizePixel = 0
ActivateBtn.Position = UDim2.new(0.25, 0, 0.65, 0)
ActivateBtn.Size = UDim2.new(0.5, 0, 0, 45)
ActivateBtn.Font = Enum.Font.GothamBold
ActivateBtn.Text = "ACTIVATE"
ActivateBtn.TextColor3 = Color3.new(1, 1, 1)
ActivateBtn.TextSize = 18

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = KeyFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.85, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Waiting for key..."
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusLabel.TextSize = 13

-- Функция активации
ActivateBtn.MouseButton1Click:Connect(function()
    local inputKey = KeyBox.Text
    if CheckKey(inputKey) then
        StatusLabel.Text = "✓ Key accepted! Loading cheat..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(1)
        KeyGui:Destroy()
        StartCheat() -- Запускаем чит
    else
        StatusLabel.Text = "✗ Invalid key! Try another"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        KeyBox.Text = ""
    end
end)

-- Также активация по Enter
KeyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        ActivateBtn:Activate()
    end
end)

-- Функция запуска чита
function StartCheat()
    -- States
    local ESPEnabled = false
    local BoxEnabled = false
    local ChamsEnabled = false
    local AntiAimEnabled = false
    local FlyEnabled = false
    local NoclipEnabled = false
    local HitboxEnabled = false
    local HitboxSize = 50
    local TeamCheck = true
    local RainbowTitle = true
    local CustomSky = false
    
    -- Colors
    local ESPColor = Color3.new(1, 0, 0)
    local BoxColor = Color3.new(0, 1, 0)
    local ChamsColor = Color3.fromRGB(255, 0, 255)
    local SkyColor = Color3.fromRGB(100, 150, 255)

    -- Main GUI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NitosiumCore"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.35, 0, 0.25, 0)
    Main.Size = UDim2.new(0, 450, 0, 350)
    Main.Active = true
    Main.Draggable = true
    Main.Visible = true

    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 40)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.Size = UDim2.new(0, 150, 1, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "nitosium"
    TitleLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
    TitleLabel.TextSize = 24
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local VersionLabel = Instance.new("TextLabel")
    VersionLabel.Name = "VersionLabel"
    VersionLabel.Parent = TopBar
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Position = UDim2.new(1, -120, 0, 0)
    VersionLabel.Size = UDim2.new(0, 110, 1, 0)
    VersionLabel.Font = Enum.Font.Gotham
    VersionLabel.Text = "v1.2 | KEY: ✓"
    VersionLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    VersionLabel.TextSize = 12
    VersionLabel.TextXAlignment = Enum.TextXAlignment.Right

    -- Left Panel
    local LeftPanel = Instance.new("Frame")
    LeftPanel.Name = "LeftPanel"
    LeftPanel.Parent = Main
    LeftPanel.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    LeftPanel.BorderSizePixel = 0
    LeftPanel.Position = UDim2.new(0, 0, 0, 40)
    LeftPanel.Size = UDim2.new(0, 100, 1, -40)

    -- Right Panel
    local RightPanel = Instance.new("Frame")
    RightPanel.Name = "RightPanel"
    RightPanel.Parent = Main
    RightPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    RightPanel.BorderSizePixel = 0
    RightPanel.Position = UDim2.new(0, 100, 0, 40)
    RightPanel.Size = UDim2.new(1, -100, 1, -40)

    -- Hitbox Indicator
    local HitboxIndicator = Instance.new("Frame")
    HitboxIndicator.Name = "HitboxIndicator"
    HitboxIndicator.Parent = Main
    HitboxIndicator.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    HitboxIndicator.BorderSizePixel = 0
    HitboxIndicator.Position = UDim2.new(0, 5, 1, -35)
    HitboxIndicator.Size = UDim2.new(0, 90, 0, 30)
    HitboxIndicator.Visible = false

    local HitboxLabel = Instance.new("TextLabel")
    HitboxLabel.Name = "HitboxLabel"
    HitboxLabel.Parent = HitboxIndicator
    HitboxLabel.BackgroundTransparency = 1
    HitboxLabel.Size = UDim2.new(1, 0, 0, 15)
    HitboxLabel.Font = Enum.Font.Gotham
    HitboxLabel.Text = "HITBOX SIZE"
    HitboxLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    HitboxLabel.TextSize = 11

    local HitboxValue = Instance.new("TextLabel")
    HitboxValue.Name = "HitboxValue"
    HitboxValue.Parent = HitboxIndicator
    HitboxValue.BackgroundTransparency = 1
    HitboxValue.Position = UDim2.new(0, 0, 0.5, 0)
    HitboxValue.Size = UDim2.new(1, 0, 0.5, 0)
    HitboxValue.Font = Enum.Font.GothamBold
    HitboxValue.Text = "Medium (50)"
    HitboxValue.TextColor3 = Color3.fromRGB(0, 200, 255)
    HitboxValue.TextSize = 12

    -- Tabs
    local Tabs = {"VISUAL", "COLORS", "COMBAT", "MOVEMENT"}
    local TabFrames = {}
    local CurrentTab = "VISUAL"

    for i, tabName in ipairs(Tabs) do
        local TabBtn = Instance.new("TextButton")
        TabBtn.Name = tabName
        TabBtn.Parent = LeftPanel
        TabBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
        TabBtn.BorderSizePixel = 0
        TabBtn.Position = UDim2.new(0, 5, 0, 5 + (i-1)*40)
        TabBtn.Size = UDim2.new(1, -10, 0, 35)
        TabBtn.Font = Enum.Font.GothamSemibold
        TabBtn.Text = tabName
        TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabBtn.TextSize = 13
        TabBtn.AutoButtonColor = false
        
        local TabFrame = Instance.new("ScrollingFrame")
        TabFrame.Name = tabName .. "Frame"
        TabFrame.Parent = RightPanel
        TabFrame.BackgroundTransparency = 1
        TabFrame.BorderSizePixel = 0
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.CanvasSize = UDim2.new(0, 0, 3, 0)
        TabFrame.ScrollBarThickness = 4
        TabFrame.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 50)
        TabFrame.Visible = tabName == "VISUAL"
        
        local UIList = Instance.new("UIListLayout")
        UIList.Parent = TabFrame
        UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIList.SortOrder = Enum.SortOrder.LayoutOrder
        UIList.Padding = UDim.new(0, 8)
        
        TabFrames[tabName] = TabFrame
        
        TabBtn.MouseButton1Click:Connect(function()
            CurrentTab = tabName
            for name, frame in pairs(TabFrames) do
                frame.Visible = false
            end
            TabFrame.Visible = true
            
            for _, btn in pairs(LeftPanel:GetChildren()) do
                if btn:IsA("TextButton") then
                    btn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                end
            end
            TabBtn.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
        end)
        
        if tabName == "VISUAL" then
            TabBtn.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
        end
    end

    -- UI Functions
    function CreateToggle(parent, text, default, callback)
        local frame = Instance.new("Frame")
        frame.Parent = parent
        frame.BackgroundTransparency = 1
        frame.Size = UDim2.new(0.94, 0, 0, 35)
        
        local btn = Instance.new("TextButton")
        btn.Parent = frame
        btn.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
        btn.BorderSizePixel = 0
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.Font = Enum.Font.Gotham
        btn.Text = "  " .. text
        btn.TextColor3 = Color3.fromRGB(220, 220, 220)
        btn.TextSize = 14
        btn.TextXAlignment = Enum.TextXAlignment.Left
        
        local status = Instance.new("TextLabel")
        status.Parent = btn
        status.BackgroundTransparency = 1
        status.Position = UDim2.new(1, -40, 0, 0)
        status.Size = UDim2.new(0, 35, 1, 0)
        status.Font = Enum.Font.GothamBold
        status.Text = default and "ON" or "OFF"
        status.TextColor3 = default and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 50, 50)
        status.TextSize = 13
        
        local state = default
        btn.MouseButton1Click:Connect(function()
            state = not state
            status.Text = state and "ON" or "OFF"
            status.TextColor3 = state and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 50, 50)
            callback(state)
        end)
        
        callback(default)
    end

    function CreateSlider(parent, text, min, max, default, callback)
        local frame = Instance.new("Frame")
        frame.Parent = parent
        frame.BackgroundTransparency = 1
        frame.Size = UDim2.new(0.94, 0, 0, 60)
        
        local label = Instance.new("TextLabel")
        label.Parent = frame
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 0, 25)
        label.Font = Enum.Font.Gotham
        label.Text = text
        label.TextColor3 = Color3.fromRGB(220, 220, 220)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        
        local bar = Instance.new("Frame")
        bar.Parent = frame
        bar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        bar.BorderSizePixel = 0
        bar.Position = UDim2.new(0, 0, 0, 30)
        bar.Size = UDim2.new(1, 0, 0, 8)
        
        local fill = Instance.new("Frame")
        fill.Parent = bar
        fill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        fill.BorderSizePixel = 0
        fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
        
        local valueBox = Instance.new("TextBox")
        valueBox.Parent = frame
        valueBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        valueBox.BorderSizePixel = 0
        valueBox.Position = UDim2.new(1, -55, 0, 30)
        valueBox.Size = UDim2.new(0, 50, 0, 25)
        valueBox.Font = Enum.Font.Code
        valueBox.Text = tostring(default)
        valueBox.TextColor3 = Color3.new(1, 1, 1)
        valueBox.TextSize = 13
        valueBox.ClearTextOnFocus = false
        
        local function update(val)
            val = math.clamp(val, min, max)
            fill.Size = UDim2.new((val-min)/(max-min), 0, 1, 0)
            valueBox.Text = tostring(math.floor(val))
            
            local scaleText = ""
            local color = Color3.fromRGB(0, 200, 255)
            
            if val >= 1 and val <= 20 then
                scaleText = "Small (" .. val .. ")"
                color = Color3.fromRGB(0, 255, 0)
            elseif val > 20 and val <= 60 then
                scaleText = "Medium (" .. val .. ")"
                color = Color3.fromRGB(255, 255, 0)
            elseif val > 60 and val <= 100 then
                scaleText = "Large (" .. val .. ")"
                color = Color3.fromRGB(255, 150, 0)
            elseif val > 100 and val <= 150 then
                scaleText = "XL (" .. val .. ")"
                color = Color3.fromRGB(255, 50, 50)
            end
            
            HitboxValue.Text = scaleText
            HitboxValue.TextColor3 = color
            
            callback(val)
        end
        
        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local percent = (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X
                local val = min + (percent * (max - min))
                update(val)
                
                local conn = UserInputService.InputChanged:Connect(function(move)
                    if move.UserInputType == Enum.UserInputType.MouseMovement then
                        local percent = (move.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X
                        local val = min + (percent * (max - min))
                        update(val)
                    end
                end)
                
                UserInputService.InputEnded:Connect(function(endInput)
                    if endInput.UserInputType == Enum.UserInputType.MouseButton1 then
                        conn:Disconnect()
                    end
                end)
            end
        end)
        
        valueBox.FocusLost:Connect(function()
            local num = tonumber(valueBox.Text)
            if num then
                update(num)
            else
                valueBox.Text = tostring(default)
                update(default)
            end
        end)
        
        callback(default)
    end

    function CreateColorInput(parent, text, defaultColor, callback)
        local frame = Instance.new("Frame")
        frame.Parent = parent
        frame.BackgroundTransparency = 1
        frame.Size = UDim2.new(0.94, 0, 0, 40)
        
        local label = Instance.new("TextLabel")
        label.Parent = frame
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(0.6, 0, 1, 0)
        label.Font = Enum.Font.Gotham
        label.Text = "  " .. text
        label.TextColor3 = Color3.fromRGB(220, 220, 220)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        
        local colorBox = Instance.new("TextBox")
        colorBox.Parent = frame
        colorBox.BackgroundColor3 = defaultColor
        colorBox.BorderSizePixel = 0
        colorBox.Position = UDim2.new(0.65, 0, 0.2, 0)
        colorBox.Size = UDim2.new(0.3, 0, 0.6, 0)
        colorBox.Font = Enum.Font.Code
        colorBox.Text = "255,0,0"
        colorBox.TextColor3 = Color3.new(0, 0, 0)
        colorBox.TextSize = 12
        colorBox.ClearTextOnFocus = false
        
        colorBox.FocusLost:Connect(function()
            local text = colorBox.Text
            local r, g, b = text:match("(%d+)[,%s]+(%d+)[,%s]+(%d+)")
            
            if r and g and b then
                r = math.clamp(tonumber(r), 0, 255)
                g = math.clamp(tonumber(g), 0, 255)
                b = math.clamp(tonumber(b), 0, 255)
                
                local newColor = Color3.fromRGB(r, g, b)
                colorBox.BackgroundColor3 = newColor
                callback(newColor)
            end
        end)
        
        callback(defaultColor)
    end

    -- VISUAL Tab
    CreateToggle(TabFrames["VISUAL"], "ESP", false, function(state)
        ESPEnabled = state
    end)

    CreateToggle(TabFrames["VISUAL"], "Box ESP", false, function(state)
        BoxEnabled = state
    end)

    CreateToggle(TabFrames["VISUAL"], "Chams", false, function(state)
        ChamsEnabled = state
    end)

    CreateToggle(TabFrames["VISUAL"], "Team Check", true, function(state)
        TeamCheck = state
    end)

    CreateToggle(TabFrames["VISUAL"], "Rainbow Title", true, function(state)
        RainbowTitle = state
    end)

    CreateToggle(TabFrames["VISUAL"], "Custom Sky", false, function(state)
        CustomSky = state
        if state then
            Lighting.ClockTime = 14
            Lighting.Brightness = 2
        else
            Lighting.Brightness = 1
        end
    end)

    -- COLORS Tab
    CreateColorInput(TabFrames["COLORS"], "ESP Color", Color3.new(1, 0, 0), function(color)
        ESPColor = color
    end)

    CreateColorInput(TabFrames["COLORS"], "Box Color", Color3.new(0, 1, 0), function(color)
        BoxColor = color
    end)

    CreateColorInput(TabFrames["COLORS"], "Chams Color", Color3.fromRGB(255, 0, 255), function(color)
        ChamsColor = color
    end)

    CreateColorInput(TabFrames["COLORS"], "Sky Color", Color3.fromRGB(100, 150, 255), function(color)
        SkyColor = color
    end)

    -- COMBAT Tab
    CreateToggle(TabFrames["COMBAT"], "Hitbox Expand", false, function(state)
        HitboxEnabled = state
        HitboxIndicator.Visible = state
    end)

    CreateSlider(TabFrames["COMBAT"], "Hitbox Size", 1, 150, 50, function(value)
        HitboxSize = value
    end)

    -- MOVEMENT Tab
    CreateToggle(TabFrames["MOVEMENT"], "Fly Mode", false, function(state)
        FlyEnabled = state
    end)

    CreateToggle(TabFrames["MOVEMENT"], "Noclip", false, function(state)
        NoclipEnabled = state
    end)

    CreateToggle(TabFrames["MOVEMENT"], "Anti-Aim", false, function(state)
        AntiAimEnabled = state
    end)

    -- Rainbow Title
    spawn(function()
        while true do
            wait(0.1)
            if RainbowTitle then
                local hue = tick() % 5 / 5
                TitleLabel.TextColor3 = Color3.fromHSV(hue, 0.8, 1)
            else
                TitleLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
            end
        end
    end)

    -- TEAM CHECK
    function IsEnemy(player)
        if player == LocalPlayer then return false end
        if not TeamCheck then return true end
        
        if not LocalPlayer.Team or not player.Team then
            return true
        end
        
        return LocalPlayer.Team ~= player.Team
    end

    -- ESP SYSTEM
    local ESPData = {}

    local function SetupESP(player)
        if player == LocalPlayer then return end
        
        ESPData[player] = {
            Text = Drawing.new("Text"),
            Box = {},
            Chams = nil
        }
        
        ESPData[player].Text.Text = player.Name
        ESPData[player].Text.Size = 16
        ESPData[player].Text.Center = true
        ESPData[player].Text.Outline = true
        ESPData[player].Text.Color = ESPColor
        ESPData[player].Text.Visible = false
        
        for i = 1, 4 do
            ESPData[player].Box[i] = Drawing.new("Line")
            ESPData[player].Box[i].Thickness = 2
            ESPData[player].Box[i].Color = BoxColor
            ESPData[player].Box[i].Visible = false
        end
        
        player.CharacterAdded:Connect(function(char)
            wait(0.5)
            if ESPData[player].Chams then
                ESPData[player].Chams:Destroy()
            end
            
            if ChamsEnabled and IsEnemy(player) then
                local highlight = Instance.new("Highlight")
                highlight.Name = player.Name .. "_Chams"
                highlight.FillColor = ChamsColor
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.FillTransparency = 0.3
                highlight.OutlineTransparency = 0
                highlight.Parent = char
                ESPData[player].Chams = highlight
            end
        end)
        
        if player.Character and ChamsEnabled and IsEnemy(player) then
            local highlight = Instance.new("Highlight")
            highlight.Name = player.Name .. "_Chams"
            highlight.FillColor = ChamsColor
            highlight.OutlineColor = Color3.new(1, 1, 1)
            highlight.FillTransparency = 0.3
            highlight.OutlineTransparency = 0
            highlight.Parent = player.Character
            ESPData[player].Chams = highlight
        end
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            SetupESP(player)
        end
    end

    -- UPDATE ESP
    RunService.RenderStepped:Connect(function()
        for player, data in pairs(ESPData) do
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local root = player.Character.HumanoidRootPart
                local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                local isEnemy = IsEnemy(player)
                local showESP = ESPEnabled and (isEnemy or not TeamCheck)
                local showBox = BoxEnabled and (isEnemy or not TeamCheck)
                
                -- Update colors
                data.Text.Color = ESPColor
                for i = 1, 4 do
                    data.Box[i].Color = BoxColor
                end
                
                if showESP and onScreen then
                    data.Text.Position = Vector2.new(pos.X, pos.Y - 40)
                    data.Text.Visible = true
                else
                    data.Text.Visible = false
                end
                
                if showBox and onScreen then
                    local scale = math.clamp(2000 / pos.Z, 20, 60)
                    local size = Vector2.new(scale, scale * 1.8)
                    local corners = {
                        Vector2.new(pos.X - size.X/2, pos.Y - size.Y/2),
                        Vector2.new(pos.X + size.X/2, pos.Y - size.Y/2),
                        Vector2.new(pos.X + size.X/2, pos.Y + size.Y/2),
                        Vector2.new(pos.X - size.X/2, pos.Y + size.Y/2)
                    }
                    
                    for i = 1, 4 do
                        local nextIdx = i == 4 and 1 or i + 1
                        data.Box[i].From = corners[i]
                        data.Box[i].To = corners[nextIdx]
                        data.Box[i].Visible = true
                    end
                else
                    for i = 1, 4 do
                        data.Box[i].Visible = false
                    end
                end
                
                if data.Chams then
                    data.Chams.Enabled = ChamsEnabled and (isEnemy or not TeamCheck)
                    data.Chams.FillColor = ChamsColor
                end
            else
                data.Text.Visible = false
                for i = 1, 4 do
                    data.Box[i].Visible = false
                end
                if data.Chams then
                    data.Chams.Enabled = false
                end
            end
        end
    end)

    -- HITBOX SYSTEM
    local OriginalSizes = {}

    RunService.RenderStepped:Connect(function()
        if HitboxEnabled then
            for _, player in pairs(Players:GetPlayers()) do
                if (IsEnemy(player) or not TeamCheck) and player.Character then
                    for _, part in pairs(player.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            if not OriginalSizes[part] then
                                OriginalSizes[part] = part.Size
                            end
                            
                            local multiplier = 1
                            if HitboxSize <= 20 then
                                multiplier = 1 + (HitboxSize * 0.1)
                            elseif HitboxSize <= 60 then
                                multiplier = 3 + ((HitboxSize - 20) * 0.15)
                            elseif HitboxSize <= 100 then
                                multiplier = 9 + ((HitboxSize - 60) * 0.2)
                            else
                                multiplier = 17 + ((HitboxSize - 100) * 0.3)
                            end
                            part.Size = OriginalSizes[part] * multiplier
                        end
                    end
                end
            end
        else
            for part, size in pairs(OriginalSizes) do
                if part and part.Parent then
                    part.Size = size
                end
            end
        end
    end)

    -- ANTI-AIM
    RunService.RenderStepped:Connect(function()
        if AntiAimEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and root then
                humanoid.AutoRotate = false
                root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(tick() * 720 % 360), 0)
            end
        elseif LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.AutoRotate = true
            end
        end
    end)

    -- FLY SYSTEM
    local FlyVelocity
    RunService.RenderStepped:Connect(function()
        if FlyEnabled and LocalPlayer.Character then
            local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then
                if not FlyVelocity then
                    FlyVelocity = Instance.new("BodyVelocity")
                    FlyVelocity.Velocity = Vector3.new(0, 0, 0)
                    FlyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    FlyVelocity.Parent = root
                end
                
                local move = Vector3.new(0, 0, 0)
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - Camera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Camera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0, 1, 0) end
                
                if move.Magnitude > 0 then
                    move = move.Unit * 80
                end
                FlyVelocity.Velocity = move
            end
        elseif FlyVelocity then
            FlyVelocity:Destroy()
            FlyVelocity = nil
        end
    end)

    -- NOCLIP
    RunService.Stepped:Connect(function()
        if NoclipEnabled and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)

    -- CUSTOM SKY
    RunService.RenderStepped:Connect(function()
        if CustomSky then
            Lighting.FogColor = SkyColor
            Lighting.Ambient = SkyColor
        end
    end)

    -- PLAYER MANAGEMENT
    Players.PlayerAdded:Connect(function(player)
        wait(1)
        if player ~= LocalPlayer then
            SetupESP(player)
        end
    end)

    Players.PlayerRemoving:Connect(function(player)
        if ESPData[player] then
            ESPData[player].Text:Remove()
            for i = 1, 4 do
                ESPData[player].Box[i]:Remove()
            end
            if ESPData[player].Chams then
                ESPData[player].Chams:Destroy()
            end
            ESPData[player] = nil
        end
    end)

    -- HOTKEYS
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.RightShift then
            Main.Visible = not Main.Visible
        elseif input.KeyCode == Enum.KeyCode.Insert then
            ScreenGui:Destroy()
            for player, data in pairs(ESPData) do
                data.Text:Remove()
                for i = 1, 4 do
                    data.Box[i]:Remove()
                end
                if data.Chams then
                    data.Chams:Destroy()
                end
            end
            if FlyVelocity then FlyVelocity:Destroy() end
            Lighting.Brightness = 1
            Lighting.FogColor = Color3.new(1, 1, 1)
            Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
        end
    end)

    print("====================================")
    print("NITOSIUM CORE v1.2 ACTIVATED")
    print("10 VALID KEYS:")
    for i = 1, 10 do
        print(i .. ". " .. VALID_KEYS[i])
    end
    print("Features: ESP/Box/Chams with colors")
    print("Controls: RightShift (menu), Insert (close)")
    print("====================================")
end

-- Выведите ключи в консоль
print("NITOSIUM CORE v1.2 - 10 LICENSE KEYS:")
print("1. NITOSIUM-2024-1")
print("2. NITOSIUM-2024-2")
print("3. NITOSIUM-2024-3")
print("4. NITOSIUM-2024-4")
print("5. NITOSIUM-2024-5")
print("6. NITOSIUM-2024-6")
print("7. NITOSIUM-2024-7")
print("8. NITOSIUM-2024-8")
print("9. NITOSIUM-2024-9")
print("10. NITOSIUM-2024-10")
print("Enter any key above to activate")
