-- NITOSIUM LOADER v1.1 - FIXED DUPLICATE GUI
print("🔐 NITOSIUM LOADER INITIALIZING...")

-- CLEAN UP ANY EXISTING GUI FIRST
local CoreGui = game:GetService("CoreGui")

-- Remove old loader if exists
if CoreGui:FindFirstChild("NitosiumLoader") then
    CoreGui.NitosiumLoader:Destroy()
end

if CoreGui:FindFirstChild("NitosiumCore") then
    CoreGui.NitosiumCore:Destroy()
end

-- ENCRYPTED KEYS (10 keys)
local validKeys = {
    ["N1T2024"] = true,
    ["C0R3V1"] = true,
    ["STRUC1D"] = true,
    ["X3N0INJ"] = true,
    ["H4CK3R"] = true,
    ["PR0G4M"] = true,
    ["V1LL4G3"] = true,
    ["SURV1V3"] = true,
    ["PL4N3CR"] = true,
    ["CH33T3R"] = true
}

-- Create NEW GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NitosiumLoader"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 280)
MainFrame.Active = true
MainFrame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 20)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Font = Enum.Font.GothamBold
Title.Text = "NITOSIUM CORE LOADER"
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.TextSize = 24

local Info = Instance.new("TextLabel")
Info.Name = "Info"
Info.Parent = MainFrame
Info.BackgroundTransparency = 1
Info.Position = UDim2.new(0, 0, 0, 90)
Info.Size = UDim2.new(1, 0, 0, 60)
Info.Font = Enum.Font.Gotham
Info.Text = "Enter encrypted key from supplier\n\n10 encrypted keys available"
Info.TextColor3 = Color3.fromRGB(180, 180, 180)
Info.TextSize = 14
Info.TextYAlignment = Enum.TextYAlignment.Top

local KeyBox = Instance.new("TextBox")
KeyBox.Name = "KeyBox"
KeyBox.Parent = MainFrame
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyBox.BorderSizePixel = 0
KeyBox.Position = UDim2.new(0.1, 0, 0.45, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Font = Enum.Font.Code
KeyBox.PlaceholderText = "Enter encrypted key..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.new(1, 1, 1)
KeyBox.TextSize = 16

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Name = "VerifyBtn"
VerifyBtn.Parent = MainFrame
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
VerifyBtn.BorderSizePixel = 0
VerifyBtn.Position = UDim2.new(0.25, 0, 0.65, 0)
VerifyBtn.Size = UDim2.new(0.5, 0, 0, 45)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.Text = "VERIFY & LOAD"
VerifyBtn.TextColor3 = Color3.new(1, 1, 1)
VerifyBtn.TextSize = 16

local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Parent = MainFrame
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0, 0, 0.85, 0)
Status.Size = UDim2.new(1, 0, 0, 30)
Status.Font = Enum.Font.Gotham
Status.Text = "🔒 Encrypted key system"
Status.TextColor3 = Color3.fromRGB(150, 150, 150)
Status.TextSize = 13

-- Verification function
VerifyBtn.MouseButton1Click:Connect(function()
    local inputKey = KeyBox.Text:upper()
    
    if validKeys[inputKey] then
        Status.Text = "✓ Key verified! Loading cheat..."
        Status.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        wait(1)
        ScreenGui:Destroy()
        
        -- Load main cheat (ЗАМЕНИ ColinSurvivor НА СВОЙ GITHUB USERNAME)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/n1tosiumcreator/nitosium/main/cheat.lua"))()
    else
        Status.Text = "✗ Invalid encrypted key"
        Status.TextColor3 = Color3.fromRGB(255, 50, 50)
        KeyBox.Text = ""
    end
end)

KeyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        VerifyBtn:Activate()
    end
end)

print("LOADER READY - AWAITING KEY")
