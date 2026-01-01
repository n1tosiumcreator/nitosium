-- NITOSIUM v1.3 - COMPLETE WORKING VERSION
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Activation GUI
local ActivateGui = Instance.new("ScreenGui")
ActivateGui.Name = "ActivateGUI"
ActivateGui.Parent = game:GetService("CoreGui") or game.CoreGui
ActivateGui.ResetOnSpawn = false

local ActivateFrame = Instance.new("Frame")
ActivateFrame.Name = "ActivateFrame"
ActivateFrame.Parent = ActivateGui
ActivateFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
ActivateFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
ActivateFrame.BorderSizePixel = 2
ActivateFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
ActivateFrame.Size = UDim2.new(0, 400, 0, 250)
ActivateFrame.Active = true
ActivateFrame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = ActivateFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 40)
Title.Size = UDim2.new(1, 0, 0, 80)
Title.Font = Enum.Font.GothamBlack
Title.Text = "NITOSIUM"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 48

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Parent = ActivateFrame
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(0, 0, 0, 110)
VersionLabel.Size = UDim2.new(1, 0, 0, 30)
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.Text = "v1.3"
VersionLabel.TextColor3 = Color3.fromRGB(200, 0, 0)
VersionLabel.TextSize = 20

local LoadBtn = Instance.new("TextButton")
LoadBtn.Name = "LoadBtn"
LoadBtn.Parent = ActivateFrame
LoadBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
LoadBtn.BorderColor3 = Color3.fromRGB(150, 0, 0)
LoadBtn.BorderSizePixel = 1
LoadBtn.Position = UDim2.new(0.25, 0, 0.6, 0)
LoadBtn.Size = UDim2.new(0.5, 0, 0, 50)
LoadBtn.Font = Enum.Font.GothamBold
LoadBtn.Text = "LOAD"
LoadBtn.TextColor3 = Color3.new(1, 1, 1)
LoadBtn.TextSize = 22

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = ActivateFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.85, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Ready to load..."
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.TextSize = 14

-- Rainbow effect
local titleRainbow = spawn(function()
    while ActivateGui.Parent do
        for hue = 0, 1, 0.01 do
            if not ActivateGui.Parent then break end
            Title.TextColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.03)
        end
    end
end)

-- Load button
LoadBtn.MouseButton1Click:Connect(function()
    StatusLabel.Text = "LOADING..."
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    LoadBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    LoadBtn.Text = "PLEASE WAIT..."
    wait(1.0)
    ActivateGui:Destroy()
    StartCheat()
end)

-- Keybinding system
local KeybindNames = {
    [Enum.KeyCode.RightShift] = "RightShift",
    [Enum.KeyCode.RightAlt] = "RightAlt",
    [Enum.KeyCode.Insert] = "Insert",
    [Enum.KeyCode.F1] = "F1",
    [Enum.KeyCode.F2] = "F2",
    [Enum.KeyCode.F3] = "F3",
    [Enum.KeyCode.F4] = "F4",
    [Enum.KeyCode.F5] = "F5",
    [Enum.KeyCode.F6] = "F6",
    [Enum.KeyCode.F7] = "F7",
    [Enum.KeyCode.F8] = "F8",
    [Enum.KeyCode.F9] = "F9",
    [Enum.KeyCode.F10] = "F10",
    [Enum.KeyCode.F11] = "F11",
    [Enum.KeyCode.F12] = "F12",
    [Enum.KeyCode.Q] = "Q",
    [Enum.KeyCode.W] = "W",
    [Enum.KeyCode.E] = "E",
    [Enum.KeyCode.R] = "R",
    [Enum.KeyCode.T] = "T",
    [Enum.KeyCode.Y] = "Y",
    [Enum.KeyCode.U] = "U",
    [Enum.KeyCode.P] = "P",
    [Enum.KeyCode.A] = "A",
    [Enum.KeyCode.S] = "S",
    [Enum.KeyCode.D] = "D",
    [Enum.KeyCode.F] = "F",
    [Enum.KeyCode.G] = "G",
    [Enum.KeyCode.H] = "H",
    [Enum.KeyCode.J] = "J",
    [Enum.KeyCode.K] = "K",
    [Enum.KeyCode.L] = "L",
    [Enum.KeyCode.Z] = "Z",
    [Enum.KeyCode.X] = "X",
    [Enum.KeyCode.C] = "C",
    [Enum.KeyCode.V] = "V",
    [Enum.KeyCode.B] = "B",
    [Enum.KeyCode.N] = "N",
    [Enum.KeyCode.M] = "M",
    [Enum.KeyCode.LeftControl] = "LCtrl",
    [Enum.KeyCode.RightControl] = "RCtrl",
    [Enum.KeyCode.LeftAlt] = "LAlt",
    [Enum.KeyCode.LeftShift] = "LShift",
    [Enum.KeyCode.CapsLock] = "Caps",
    [Enum.KeyCode.Tab] = "Tab",
    [Enum.KeyCode.Space] = "Space",
    [Enum.KeyCode.One] = "1",
    [Enum.KeyCode.Two] = "2",
    [Enum.KeyCode.Three] = "3",
    [Enum.KeyCode.Four] = "4",
    [Enum.KeyCode.Five] = "5",
    [Enum.KeyCode.Six] = "6",
    [Enum.KeyCode.Seven] = "7",
    [Enum.KeyCode.Eight] = "8",
    [Enum.KeyCode.Nine] = "9",
    [Enum.KeyCode.Zero] = "0"
}

-- Main cheat function
function StartCheat()
    -- States
    local ESPEnabled = false
    local BoxEnabled = false
    local ChamsEnabled = false
    local AntiAimEnabled = false
    local FlyEnabled = false
    local NoclipEnabled = false
    local HitboxEnabled = false
    local GodModeEnabled = false
    local ShowDistance = false
    local ShowHealth = false
    local CustomSkyEnabled = false
    local TeamCheck = true
    
    -- Current preset
    local CurrentPreset = "Red-Black"
    
    -- Values
    local HitboxSize = 50
    local FlySpeed = 50
    
    -- RGB Mode
    local RGBModeEnabled = false
    local RGBThread = nil
    
    -- Keybind storage
    local KeybindStorage = {
        ToggleMenu = Enum.KeyCode.RightShift,
        ToggleWatermark = Enum.KeyCode.RightAlt,
        UnloadScript = Enum.KeyCode.Insert,
        ESP = Enum.KeyCode.F1,
        Fly = Enum.KeyCode.F2,
        Noclip = Enum.KeyCode.F3,
        GodMode = Enum.KeyCode.F4,
        Hitbox = Enum.KeyCode.F5,
        BoxESP = Enum.KeyCode.F6,
        Chams = Enum.KeyCode.F7,
        CustomSky = Enum.KeyCode.F8,
        AntiAim = Enum.KeyCode.F9
    }

    -- Color Presets
    local ColorPresets = {
        ["Red-Black"] = {
            MainColor = Color3.fromRGB(255, 0, 0),
            SecondaryColor = Color3.fromRGB(20, 0, 0),
            TextColor = Color3.fromRGB(255, 200, 200),
            AccentColor = Color3.fromRGB(150, 0, 0)
        },
        ["Orange-Black"] = {
            MainColor = Color3.fromRGB(255, 150, 0),
            SecondaryColor = Color3.fromRGB(20, 10, 0),
            TextColor = Color3.fromRGB(255, 220, 180),
            AccentColor = Color3.fromRGB(180, 90, 0)
        },
        ["Blue-Black"] = {
            MainColor = Color3.fromRGB(0, 150, 255),
            SecondaryColor = Color3.fromRGB(0, 10, 20),
            TextColor = Color3.fromRGB(180, 220, 255),
            AccentColor = Color3.fromRGB(0, 100, 180)
        },
        ["Green-Black"] = {
            MainColor = Color3.fromRGB(0, 255, 100),
            SecondaryColor = Color3.fromRGB(0, 20, 5),
            TextColor = Color3.fromRGB(200, 255, 220),
            AccentColor = Color3.fromRGB(0, 180, 70)
        },
        ["Purple-Black"] = {
            MainColor = Color3.fromRGB(180, 0, 255),
            SecondaryColor = Color3.fromRGB(20, 0, 20),
            TextColor = Color3.fromRGB(220, 180, 255),
            AccentColor = Color3.fromRGB(120, 0, 180)
        },
        ["RGB"] = {
            MainColor = Color3.fromRGB(255, 0, 0),
            SecondaryColor = Color3.fromRGB(10, 0, 10),
            TextColor = Color3.fromRGB(255, 255, 255),
            AccentColor = Color3.fromRGB(150, 0, 150),
            IsRGB = true
        }
    }

    -- Main GUI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NitosiumCore"
    ScreenGui.Parent = game:GetService("CoreGui") or game.CoreGui
    ScreenGui.ResetOnSpawn = false

    -- Draggable Watermark
    local WatermarkFrame = Instance.new("Frame")
    WatermarkFrame.Name = "WatermarkFrame"
    WatermarkFrame.Parent = ScreenGui
    WatermarkFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    WatermarkFrame.BackgroundTransparency = 0.5
    WatermarkFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    WatermarkFrame.BorderSizePixel = 1
    WatermarkFrame.Position = UDim2.new(0.5, -100, 0, 5)
    WatermarkFrame.AnchorPoint = Vector2.new(0.5, 0)
    WatermarkFrame.Size = UDim2.new(0, 200, 0, 40)
    WatermarkFrame.Active = true
    WatermarkFrame.Draggable = true
    
    local WatermarkText = Instance.new("TextLabel")
    WatermarkText.Name = "WatermarkText"
    WatermarkText.Parent = WatermarkFrame
    WatermarkText.BackgroundTransparency = 1
    WatermarkText.Size = UDim2.new(1, 0, 1, 0)
    WatermarkText.Font = Enum.Font.GothamBold
    WatermarkText.Text = "nitosium v1.3"
    WatermarkText.TextColor3 = Color3.new(1, 1, 1)
    WatermarkText.TextSize = 14

    -- Main Menu
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    Main.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Main.BorderSizePixel = 2
    Main.Position = UDim2.new(0.3, 0, 0.2, 0)
    Main.Size = UDim2.new(0, 600, 0, 500)
    Main.Active = true
    Main.Draggable = true
    Main.Visible = false

    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 40)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.Size = UDim2.new(0, 150, 1, 0)
    TitleLabel.Font = Enum.Font.GothamBlack
    TitleLabel.Text = "nitosium"
    TitleLabel.TextColor3 = Color3.new(1, 0, 0)
    TitleLabel.TextSize = 24
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local VersionLabel = Instance.new("TextLabel")
    VersionLabel.Name = "VersionLabel"
    VersionLabel.Parent = TopBar
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Position = UDim2.new(1, -120, 0, 0)
    VersionLabel.Size = UDim2.new(0, 110, 1, 0)
    VersionLabel.Font = Enum.Font.Gotham
    VersionLabel.Text = "v1.3"
    VersionLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    VersionLabel.TextSize = 12
    VersionLabel.TextXAlignment = Enum.TextXAlignment.Right

    -- Tabs
    local Tabs = {"RAGE", "VISUAL", "WORLD", "MISC", "STOCK", "INFO"}
    local TabFrames = {}
    local CurrentTab = "RAGE"

    -- Left Panel
    local LeftPanel = Instance.new("Frame")
    LeftPanel.Name = "LeftPanel"
    LeftPanel.Parent = Main
    LeftPanel.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
    LeftPanel.BorderSizePixel = 0
    LeftPanel.Position = UDim2.new(0, 0, 0, 40)
    LeftPanel.Size = UDim2.new(0, 120, 1, -40)

    -- Right Panel
    local RightPanel = Instance.new("Frame")
    RightPanel.Name = "RightPanel"
    RightPanel.Parent = Main
    RightPanel.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    RightPanel.BorderSizePixel = 0
    RightPanel.Position = UDim2.new(0, 120, 0, 40)
    RightPanel.Size = UDim2.new(1, -120, 1, -40)

    for i, tabName in ipairs(Tabs) do
        local TabBtn = Instance.new("TextButton")
        TabBtn.Name = tabName
        TabBtn.Parent = LeftPanel
        TabBtn.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
        TabBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
        TabBtn.BorderSizePixel = 1
        TabBtn.Position = UDim2.new(0, 5, 0, 10 + (i-1)*38)
        TabBtn.Size = UDim2.new(1, -10, 0, 35)
        TabBtn.Font = Enum.Font.GothamSemibold
        TabBtn.Text = tabName
        TabBtn.TextColor3 = Color3.fromRGB(255, 150, 150)
        TabBtn.TextSize = 14
        
        local TabFrame = Instance.new("ScrollingFrame")
        TabFrame.Name = tabName .. "Frame"
        TabFrame.Parent = RightPanel
        TabFrame.BackgroundTransparency = 1
        TabFrame.BorderSizePixel = 0
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.CanvasSize = UDim2.new(0, 0, 4, 0)
        TabFrame.ScrollBarThickness = 4
        TabFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
        TabFrame.Visible = tabName == "RAGE"
        
        local UIList = Instance.new("UIListLayout")
        UIList.Parent = TabFrame
        UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIList.SortOrder = Enum.SortOrder.LayoutOrder
        UIList.Padding = UDim.new(0, 10)
        
        TabFrames[tabName] = TabFrame
        
        TabBtn.MouseButton1Click:Connect(function()
            CurrentTab = tabName
            for name, frame in pairs(TabFrames) do
                frame.Visible = false
            end
            TabFrame.Visible = true
            
            for _, btn in pairs(LeftPanel:GetChildren()) do
                if btn:IsA("TextButton") then
                    btn.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
                end
            end
            TabBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
        end)
        
        if tabName == "RAGE" then
            TabBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
        end
    end

    -- Preset function
    local function ApplyPreset(presetName)
        CurrentPreset = presetName
        local preset = ColorPresets[presetName]
        
        if not preset then return end
        
        if RGBThread then
            RGBThread:Disconnect()
            RGBThread = nil
        end
        
        RGBModeEnabled = (presetName == "RGB")
        
        if RGBModeEnabled then
            RGBThread = spawn(function()
                while RGBModeEnabled and ScreenGui.Parent do
                    for hue = 0, 1, 0.01 do
                        if not RGBModeEnabled or not ScreenGui.Parent then break end
                        
                        local rainbowColor = Color3.fromHSV(hue, 0.9, 1)
                        local darkColor = Color3.fromHSV(hue, 0.9, 0.1)
                        local textColor = Color3.fromHSV((hue + 0.5) % 1, 0.7, 1)
                        
                        Main.BorderColor3 = rainbowColor
                        Main.BackgroundColor3 = darkColor
                        
                        LeftPanel.BackgroundColor3 = Color3.fromHSV(hue, 0.9, 0.15)
                        RightPanel.BackgroundColor3 = darkColor
                        
                        WatermarkFrame.BorderColor3 = rainbowColor
                        WatermarkText.TextColor3 = rainbowColor
                        
                        for _, btn in pairs(LeftPanel:GetChildren()) do
                            if btn:IsA("TextButton") then
                                btn.BorderColor3 = rainbowColor
                                btn.TextColor3 = textColor
                                
                                if btn.Text == CurrentTab then
                                    btn.BackgroundColor3 = Color3.fromHSV(hue, 0.9, 0.3)
                                else
                                    btn.BackgroundColor3 = Color3.fromHSV(hue, 0.9, 0.15)
                                end
                            end
                        end
                        
                        for _, frame in pairs(TabFrames) do
                            frame.ScrollBarImageColor3 = rainbowColor
                        end
                        
                        TitleLabel.TextColor3 = rainbowColor
                        
                        wait(0.05)
                    end
                end
            end)
        else
            Main.BorderColor3 = preset.MainColor
            Main.BackgroundColor3 = preset.SecondaryColor
            
            LeftPanel.BackgroundColor3 = Color3.fromRGB(
                math.clamp(preset.SecondaryColor.R * 255 * 0.75, 0, 255),
                math.clamp(preset.SecondaryColor.G * 255 * 0.75, 0, 255),
                math.clamp(preset.SecondaryColor.B * 255 * 0.75, 0, 255)
            )
            
            RightPanel.BackgroundColor3 = preset.SecondaryColor
            
            WatermarkFrame.BorderColor3 = preset.MainColor
            WatermarkText.TextColor3 = preset.MainColor
            
            for _, btn in pairs(LeftPanel:GetChildren()) do
                if btn:IsA("TextButton") then
                    btn.BorderColor3 = preset.MainColor
                    btn.TextColor3 = preset.TextColor
                    
                    if btn.Text == CurrentTab then
                        btn.BackgroundColor3 = Color3.fromRGB(
                            math.clamp(preset.MainColor.R * 255 * 0.2, 0, 255),
                            math.clamp(preset.MainColor.G * 255 * 0.2, 0, 255),
                            math.clamp(preset.MainColor.B * 255 * 0.2, 0, 255)
                        )
                    else
                        btn.BackgroundColor3 = Color3.fromRGB(
                            math.clamp(preset.SecondaryColor.R * 255 * 0.15, 0, 255),
                            math.clamp(preset.SecondaryColor.G * 255 * 0.15, 0, 255),
                            math.clamp(preset.SecondaryColor.B * 255 * 0.15, 0, 255)
                        )
                    end
                end
            end
            
            for _, frame in pairs(TabFrames) do
                frame.ScrollBarImageColor3 = preset.MainColor
            end
            
            TitleLabel.TextColor3 = preset.MainColor
        end
    end

    -- UI Functions with Keybinds
    local ActiveKeybinds = {}
    local BindingInProgress = false

    local function CreateToggle(parent, text, default, callback, defaultKey)
        local frame = Instance.new("Frame")
        frame.Parent = parent
        frame.BackgroundTransparency = 1
        frame.Size = UDim2.new(0.9, 0, 0, 40)
        
        local btn = Instance.new("TextButton")
        btn.Parent = frame
        btn.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
        btn.BorderColor3 = Color3.fromRGB(255, 0, 0)
        btn.BorderSizePixel = 1
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.Font = Enum.Font.Gotham
        btn.Text = "  " .. text
        btn.TextColor3 = Color3.fromRGB(255, 200, 200)
        btn.TextSize = 14
        btn.TextXAlignment = Enum.TextXAlignment.Left
        
        local status = Instance.new("TextLabel")
        status.Parent = btn
        status.BackgroundTransparency = 1
        status.Position = UDim2.new(1, -80, 0, 0)
        status.Size = UDim2.new(0, 35, 1, 0)
        status.Font = Enum.Font.GothamBold
        status.Text = default and "ON" or "OFF"
        status.TextColor3 = default and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 50, 50)
        status.TextSize = 13
        
        -- Keybind button
        local keybindBtn = Instance.new("TextButton")
        keybindBtn.Parent = btn
        keybindBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
        keybindBtn.BorderColor3 = Color3.fromRGB(100, 0, 0)
        keybindBtn.BorderSizePixel = 1
        keybindBtn.Position = UDim2.new(1, -120, 0.15, 0)
        keybindBtn.Size = UDim2.new(0, 35, 0, 25)
        keybindBtn.Font = Enum.Font.Gotham
        keybindBtn.Text = KeybindNames[defaultKey] or "Bind"
        keybindBtn.TextColor3 = Color3.fromRGB(200, 200, 255)
        keybindBtn.TextSize = 11
        
        local state = default
        local currentKey = defaultKey
        
        local function toggleState()
            state = not state
            status.Text = state and "ON" or "OFF"
            status.TextColor3 = state and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 50, 50)
            btn.BackgroundColor3 = state and Color3.fromRGB(40, 0, 0) or Color3.fromRGB(30, 0, 0)
            callback(state)
        end
        
        btn.MouseButton1Click:Connect(toggleState)
        
        -- Keybind functionality
        keybindBtn.MouseButton1Click:Connect(function()
            if BindingInProgress then return end
            BindingInProgress = true
            
            keybindBtn.Text = "..."
            keybindBtn.TextColor3 = Color3.fromRGB(255, 255, 0)
            
            -- Remove old keybind
            if currentKey and ActiveKeybinds[currentKey] then
                ActiveKeybinds[currentKey][text] = nil
            end
            
            local connection
            connection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    currentKey = input.KeyCode
                    keybindBtn.Text = KeybindNames[currentKey] or tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
                    keybindBtn.TextColor3 = Color3.fromRGB(200, 200, 255)
                    
                    -- Store keybind
                    if not ActiveKeybinds[currentKey] then
                        ActiveKeybinds[currentKey] = {}
                    end
                    ActiveKeybinds[currentKey][text] = toggleState
                    
                    -- Update storage
                    KeybindStorage[text] = currentKey
                    
                    connection:Disconnect()
                    BindingInProgress = false
                end
            end)
            
            delay(3, function()
                if connection.Connected then
                    connection:Disconnect()
                    keybindBtn.Text = KeybindNames[currentKey] or "Bind"
                    keybindBtn.TextColor3 = Color3.fromRGB(200, 200, 255)
                    BindingInProgress = false
                end
            end)
        end)
        
        -- Store initial keybind
        if defaultKey then
            if not ActiveKeybinds[defaultKey] then
                ActiveKeybinds[defaultKey] = {}
            end
            ActiveKeybinds[defaultKey][text] = toggleState
            KeybindStorage[text] = defaultKey
        end
        
        if default then
            btn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
        end
        
        callback(default)
        
        return btn
    end

    local function CreateSlider(parent, text, min, max, default, callback)
        local frame = Instance.new("Frame")
        frame.Parent = parent
        frame.BackgroundTransparency = 1
        frame.Size = UDim2.new(0.9, 0, 0, 70)
        
        local label = Instance.new("TextLabel")
        label.Parent = frame
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 0, 25)
        label.Font = Enum.Font.Gotham
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255, 200, 200)
        label.TextSize = 14
        
        local bar = Instance.new("Frame")
        bar.Name = "bar"
        bar.Parent = frame
        bar.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
        bar.BorderColor3 = Color3.fromRGB(255, 0, 0)
        bar.BorderSizePixel = 1
        bar.Position = UDim2.new(0, 0, 0, 30)
        bar.Size = UDim2.new(1, 0, 0, 8)
        
        local fill = Instance.new("Frame")
        fill.Parent = bar
        fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        fill.BorderSizePixel = 0
        fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
        
        local valueBox = Instance.new("TextBox")
        valueBox.Parent = frame
        valueBox.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
        valueBox.BorderColor3 = Color3.fromRGB(255, 0, 0)
        valueBox.BorderSizePixel = 1
        valueBox.Position = UDim2.new(1, -60, 0, 30)
        valueBox.Size = UDim2.new(0, 55, 0, 25)
        valueBox.Font = Enum.Font.Code
        valueBox.Text = tostring(default)
        valueBox.TextColor3 = Color3.new(1, 1, 1)
        valueBox.TextSize = 14
        
        local sizeLabel = Instance.new("TextLabel")
        sizeLabel.Name = "SizeLabel"
        sizeLabel.Parent = frame
        sizeLabel.BackgroundTransparency = 1
        sizeLabel.Position = UDim2.new(0, 0, 0, 50)
        sizeLabel.Size = UDim2.new(1, 0, 0, 20)
        sizeLabel.Font = Enum.Font.Gotham
        sizeLabel.Text = "Size: Medium (50)"
        sizeLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        sizeLabel.TextSize = 12
        
        local function update(val)
            val = math.clamp(val, min, max)
            fill.Size = UDim2.new((val-min)/(max-min), 0, 1, 0)
            valueBox.Text = tostring(math.floor(val))
            
            local sizeText = ""
            local color = Color3.fromRGB(0, 200, 255)
            
            if val >= 1 and val <= 20 then
                sizeText = "Small (" .. val .. ")"
                color = Color3.fromRGB(0, 255, 0)
            elseif val > 20 and val <= 60 then
                sizeText = "Medium (" .. val .. ")"
                color = Color3.fromRGB(255, 255, 0)
            elseif val > 60 and val <= 100 then
                sizeText = "Large (" .. val .. ")"
                color = Color3.fromRGB(255, 150, 0)
            elseif val > 100 and val <= 200 then
                sizeText = "Very Large (" .. val .. ")"
                color = Color3.fromRGB(255, 50, 50)
            end
            
            sizeLabel.Text = "Size: " .. sizeText
            sizeLabel.TextColor3 = color
            
            callback(val)
        end
        
        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local percent = (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X
                local val = min + (percent * (max - min))
                update(val)
                
                local conn
                conn = UserInputService.InputChanged:Connect(function(move)
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
        
        return frame
    end

    -- Create toggles with working keybinds
    CreateToggle(TabFrames["RAGE"], "Hitbox Expand", false, function(state)
        HitboxEnabled = state
        print("Hitbox:", state)
    end, Enum.KeyCode.F5)

    CreateSlider(TabFrames["RAGE"], "Hitbox Size", 1, 300, 50, function(value)
        HitboxSize = value
    end)

    CreateToggle(TabFrames["VISUAL"], "ESP", false, function(state)
        ESPEnabled = state
        print("ESP:", state)
    end, Enum.KeyCode.F1)

    CreateToggle(TabFrames["VISUAL"], "Box ESP", false, function(state)
        BoxEnabled = state
        print("Box ESP:", state)
    end, Enum.KeyCode.F6)

    CreateToggle(TabFrames["VISUAL"], "Chams", false, function(state)
        ChamsEnabled = state
        print("Chams:", state)
    end, Enum.KeyCode.F7)

    CreateToggle(TabFrames["VISUAL"], "Show Distance", false, function(state)
        ShowDistance = state
    end, nil)

    CreateToggle(TabFrames["VISUAL"], "Show Health", false, function(state)
        ShowHealth = state
    end, nil)

    CreateToggle(TabFrames["VISUAL"], "Team Check", true, function(state)
        TeamCheck = state
    end, nil)

    CreateToggle(TabFrames["WORLD"], "Custom Sky", false, function(state)
        CustomSkyEnabled = state
        print("Custom Sky:", state)
    end, Enum.KeyCode.F8)

    CreateToggle(TabFrames["MISC"], "Anti-Aim", false, function(state)
        AntiAimEnabled = state
        print("Anti-Aim:", state)
    end, Enum.KeyCode.F9)

    CreateToggle(TabFrames["MISC"], "God Mode", false, function(state)
        GodModeEnabled = state
        print("God Mode:", state)
    end, Enum.KeyCode.F4)

    CreateSlider(TabFrames["MISC"], "Fly Speed", 1, 200, 50, function(value)
        FlySpeed = value
    end)

    CreateToggle(TabFrames["MISC"], "Fly Mode", false, function(state)
        FlyEnabled = state
        print("Fly Mode:", state)
    end, Enum.KeyCode.F2)

    CreateToggle(TabFrames["MISC"], "Noclip", false, function(state)
        NoclipEnabled = state
        print("Noclip:", state)
    end, Enum.KeyCode.F3)

    -- Stock Tab
    local StockFrame = TabFrames["STOCK"]
    
    local StockTitle = Instance.new("TextLabel")
    StockTitle.Parent = StockFrame
    StockTitle.BackgroundTransparency = 1
    StockTitle.Size = UDim2.new(0.9, 0, 0, 40)
    StockTitle.Font = Enum.Font.GothamBold
    StockTitle.Text = "COLOR PRESETS"
    StockTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    StockTitle.TextSize = 18
    
    local CreditLabel = Instance.new("TextLabel")
    CreditLabel.Parent = StockFrame
    CreditLabel.BackgroundTransparency = 1
    CreditLabel.Size = UDim2.new(0.9, 0, 0, 20)
    CreditLabel.Font = Enum.Font.Gotham
    CreditLabel.Text = "Credit: Elena"
    CreditLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    CreditLabel.TextSize = 12

    -- Preset buttons
    local function CreatePresetButton(parent, presetName, presetData)
        local frame = Instance.new("Frame")
        frame.Parent = parent
        frame.BackgroundTransparency = 1
        frame.Size = UDim2.new(0.9, 0, 0, 45)
        
        local btn = Instance.new("TextButton")
        btn.Parent = frame
        btn.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
        btn.BorderColor3 = presetData.MainColor
        btn.BorderSizePixel = 2
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.Font = Enum.Font.GothamBold
        btn.Text = presetName
        if presetName == "RGB" then
            btn.Text = "RGB 🌈"
        end
        btn.TextColor3 = presetData.TextColor
        btn.TextSize = 14
        
        local preview = Instance.new("Frame")
        preview.Parent = btn
        preview.BackgroundColor3 = presetData.MainColor
        preview.BorderColor3 = Color3.new(1, 1, 1)
        preview.BorderSizePixel = 1
        preview.Position = UDim2.new(0.8, 5, 0.2, 0)
        preview.Size = UDim2.new(0, 20, 0, 20)
        
        btn.MouseButton1Click:Connect(function()
            ApplyPreset(presetName)
        end)
    end

    for presetName, presetData in pairs(ColorPresets) do
        CreatePresetButton(StockFrame, presetName, presetData)
    end

    -- INFO Tab
    local InfoFrame = TabFrames["INFO"]
    
    local InfoTitle = Instance.new("TextLabel")
    InfoTitle.Parent = InfoFrame
    InfoTitle.BackgroundTransparency = 1
    InfoTitle.Size = UDim2.new(0.9, 0, 0, 40)
    InfoTitle.Font = Enum.Font.GothamBold
    InfoTitle.Text = "KEYBIND INFORMATION"
    InfoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    InfoTitle.TextSize = 18
    
    local keybindInfo = {
        "Insert - Unload Script",
        "RightAlt - Toggle Watermark",
        "RightShift - Toggle Menu",
        "F1 - Toggle ESP",
        "F2 - Toggle Fly Mode",
        "F3 - Toggle Noclip",
        "F4 - Toggle God Mode",
        "F5 - Toggle Hitbox",
        "F6 - Toggle Box ESP",
        "F7 - Toggle Chams",
        "F8 - Toggle Custom Sky",
        "F9 - Toggle Anti-Aim",
        "",
        "Click 'Bind' buttons to change keybinds"
    }
    
    for i, infoText in ipairs(keybindInfo) do
        local infoLabel = Instance.new("TextLabel")
        infoLabel.Parent = InfoFrame
        infoLabel.BackgroundTransparency = 1
        infoLabel.Size = UDim2.new(0.9, 0, 0, 25)
        infoLabel.Font = Enum.Font.Gotham
        infoLabel.Text = infoText
        infoLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
        infoLabel.TextSize = 14
        infoLabel.TextXAlignment = Enum.TextXAlignment.Left
    end

    -- TEAM CHECK FUNCTION
    local function IsEnemy(player)
        if player == LocalPlayer then return false end
        if not TeamCheck then return true end
        
        if LocalPlayer.Team == nil or player.Team == nil then
            return true
        end
        
        return LocalPlayer.Team ~= player.Team
    end

    -- ESP SYSTEM (WORKING)
    local ESPData = {}
    
    local function SetupESP(player)
        if player == LocalPlayer then return end
        
        ESPData[player] = {
            Text = Drawing.new("Text"),
            Box = {},
            DistanceText = Drawing.new("Text"),
            HealthText = Drawing.new("Text"),
            Chams = nil
        }
        
        ESPData[player].Text.Text = player.Name
        ESPData[player].Text.Size = 16
        ESPData[player].Text.Center = true
        ESPData[player].Text.Outline = true
        ESPData[player].Text.Color = Color3.new(1, 0, 0)
        ESPData[player].Text.Visible = false
        
        ESPData[player].DistanceText.Text = "0m"
        ESPData[player].DistanceText.Size = 14
        ESPData[player].DistanceText.Center = true
        ESPData[player].DistanceText.Outline = true
        ESPData[player].DistanceText.Color = Color3.new(1, 1, 1)
        ESPData[player].DistanceText.Visible = false
        
        ESPData[player].HealthText.Text = "100HP"
        ESPData[player].HealthText.Size = 14
        ESPData[player].HealthText.Center = true
        ESPData[player].HealthText.Outline = true
        ESPData[player].HealthText.Color = Color3.new(0, 1, 0)
        ESPData[player].HealthText.Visible = false
        
        for i = 1, 4 do
            ESPData[player].Box[i] = Drawing.new("Line")
            ESPData[player].Box[i].Thickness = 2
            ESPData[player].Box[i].Color = Color3.new(0, 1, 0)
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
                highlight.FillColor = Color3.fromRGB(255, 0, 255)
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
            highlight.FillColor = Color3.fromRGB(255, 0, 255)
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

    -- UPDATE ESP LOOP
    spawn(function()
        while ScreenGui.Parent do
            for player, data in pairs(ESPData) do
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local root = player.Character.HumanoidRootPart
                    local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                    local isEnemy = IsEnemy(player)
                    local showESP = ESPEnabled and (isEnemy or not TeamCheck)
                    local showBox = BoxEnabled and (isEnemy or not TeamCheck)
                    
                    if showESP and onScreen then
                        local distance = math.floor((root.Position - Camera.CFrame.Position).Magnitude)
                        data.DistanceText.Text = tostring(distance) .. "m"
                        
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        local health = humanoid and math.floor(humanoid.Health) or 0
                        local maxHealth = humanoid and humanoid.MaxHealth or 100
                        data.HealthText.Text = tostring(health) .. "HP"
                        
                        if humanoid then
                            local healthPercent = health / maxHealth
                            if healthPercent > 0.5 then
                                data.HealthText.Color = Color3.new(0, 1, 0)
                            elseif healthPercent > 0.25 then
                                data.HealthText.Color = Color3.new(1, 1, 0)
                            else
                                data.HealthText.Color = Color3.new(1, 0, 0)
                            end
                        end
                        
                        data.Text.Position = Vector2.new(pos.X, pos.Y - 60)
                        data.Text.Visible = true
                        
                        if ShowDistance then
                            data.DistanceText.Position = Vector2.new(pos.X, pos.Y - 40)
                            data.DistanceText.Visible = true
                        else
                            data.DistanceText.Visible = false
                        end
                        
                        if ShowHealth then
                            data.HealthText.Position = Vector2.new(pos.X, pos.Y - 20)
                            data.HealthText.Visible = true
                        else
                            data.HealthText.Visible = false
                        end
                    else
                        data.Text.Visible = false
                        data.DistanceText.Visible = false
                        data.HealthText.Visible = false
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
                    end
                else
                    data.Text.Visible = false
                    data.DistanceText.Visible = false
                    data.HealthText.Visible = false
                    for i = 1, 4 do
                        data.Box[i].Visible = false
                    end
                    if data.Chams then
                        data.Chams.Enabled = false
                    end
                end
            end
            wait()
        end
    end)

    -- HITBOX SYSTEM (WORKING)
    spawn(function()
        local OriginalSizes = {}
        
        while ScreenGui.Parent do
            if HitboxEnabled then
                for _, player in pairs(Players:GetPlayers()) do
                    if (IsEnemy(player) or not TeamCheck) and player.Character then
                        for _, part in pairs(player.Character:GetChildren()) do
                            if part:IsA("BasePart") then
                                if not OriginalSizes[part] then
                                    OriginalSizes[part] = part.Size
                                end
                                
                                local multiplier = 1
                                if HitboxSize >= 1 and HitboxSize <= 20 then
                                    multiplier = 1 + (HitboxSize * 0.05)
                                elseif HitboxSize > 20 and HitboxSize <= 60 then
                                    multiplier = 2 + ((HitboxSize - 20) * 0.075)
                                elseif HitboxSize > 60 and HitboxSize <= 120 then
                                    multiplier = 5 + ((HitboxSize - 60) * 0.1)
                                elseif HitboxSize > 120 and HitboxSize <= 300 then
                                    multiplier = 11 + ((HitboxSize - 120) * 0.08)
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
            wait(0.1)
        end
    end)

    -- ANTI-AIM SYSTEM (WORKING)
    spawn(function()
        while ScreenGui.Parent do
            if AntiAimEnabled and LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                
                if humanoid and root then
                    humanoid.AutoRotate = false
                    local time = tick()
                    root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(time * 180), 0)
                end
            elseif LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.AutoRotate = true
                end
            end
            wait()
        end
    end)

    -- GOD MODE SYSTEM (WORKING)
    spawn(function()
        while ScreenGui.Parent do
            if GodModeEnabled and LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Health = humanoid.MaxHealth
                end
            end
            wait(0.5)
        end
    end)

    -- FLY SYSTEM (WORKING)
    spawn(function()
        local FlyVelocity
        
        while ScreenGui.Parent do
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
                        local speedMultiplier = 1
                        if FlySpeed >= 1 and FlySpeed <= 20 then
                            speedMultiplier = 0.5
                        elseif FlySpeed > 20 and FlySpeed <= 60 then
                            speedMultiplier = 1.0
                        elseif FlySpeed > 60 and FlySpeed <= 100 then
                            speedMultiplier = 2.0
                        elseif FlySpeed > 100 and FlySpeed <= 200 then
                            speedMultiplier = 4.0
                        end
                        
                        move = move.Unit * (FlySpeed * speedMultiplier)
                    end
                    FlyVelocity.Velocity = move
                end
            elseif FlyVelocity then
                FlyVelocity:Destroy()
                FlyVelocity = nil
            end
            wait()
        end
    end)

    -- NOCLIP SYSTEM (WORKING)
    spawn(function()
        while ScreenGui.Parent do
            if NoclipEnabled and LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
            wait(0.1)
        end
    end)

    -- CUSTOM SKY SYSTEM (WORKING)
    spawn(function()
        while ScreenGui.Parent do
            if CustomSkyEnabled then
                Lighting.FogColor = Color3.fromRGB(100, 150, 255)
                Lighting.Ambient = Color3.fromRGB(100, 150, 255)
                Lighting.ClockTime = 14
                Lighting.Brightness = 2
            else
                Lighting.Brightness = 1
            end
            wait()
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
            ESPData[player].DistanceText:Remove()
            ESPData[player].HealthText:Remove()
            for i = 1, 4 do
                ESPData[player].Box[i]:Remove()
            end
            if ESPData[player].Chams then
                ESPData[player].Chams:Destroy()
            end
            ESPData[player] = nil
        end
    end)

    -- GLOBAL KEYBIND HANDLER
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            -- Default keybinds
            if input.KeyCode == KeybindStorage.ToggleMenu then
                Main.Visible = not Main.Visible
            elseif input.KeyCode == KeybindStorage.ToggleWatermark then
                WatermarkFrame.Visible = not WatermarkFrame.Visible
            elseif input.KeyCode == KeybindStorage.UnloadScript then
                ScreenGui:Destroy()
                print("Nitosium v1.3 unloaded")
                return
            end
            
            -- Feature keybinds
            if ActiveKeybinds[input.KeyCode] then
                for featureName, toggleFunc in pairs(ActiveKeybinds[input.KeyCode]) do
                    toggleFunc()
                end
            end
        end
    end)

    -- Apply default preset
    ApplyPreset("Red-Black")
    
    print("NITOSIUM v1.3 FULLY LOADED - ALL SYSTEMS WORKING")
end

print("NITOSIUM v1.3 READY - CLICK LOAD BUTTON")
