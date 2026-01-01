NITOSIUM LOADER v1.3

local function LoadNitosium()
    print("Loading Nitosium v1.3 from GitHub...")
    
 
    local githubURL = "https://raw.githubusercontent.com/n1tosiumcreator/nitosium/main/nitosium.lua"
    

    local success, err = pcall(function()
        local scriptContent = game:HttpGet(githubURL)
        
        if scriptContent and #scriptContent > 100 then -- Check if we got actual content
            print("Successfully downloaded Nitosium v1.3")
            print("Script size: " .. #scriptContent .. " bytes")
            
       
            loadstring(scriptContent)()
            
            print("Nitosium v1.3 loaded successfully!")
        else
            error("Failed to download script from GitHub")
        end
    end)
    
    if not success then
        print("GitHub load failed: " .. err)
        print("Trying alternative method...")
        
   
    end
end

local function LoadAlternative()
    print("Loading via alternative method...")
    
 
    local pastebinURL = "https://pastebin.com/raw/XXXXXX" -- Replace with your Pastebin code
    
    local success, err = pcall(function()
        local scriptContent = game:HttpGet(pastebinURL)
        
        if scriptContent then
            loadstring(scriptContent)()
            print("Nitosium v1.3 loaded from alternative source!")
        end
    end)
    
    if not success then
        print("Alternative load failed: " .. err)
        print("Loading from script...")
        
        -- Direct script as fallback
        LoadDirect()
    end
end

local function LoadDirect()
    print("Loading Nitosium directly...")
    
 
    print("NITOSIUM DIRECT LOADER")
    print("For full version, use GitHub or Pastebin method")
    

end


local LoaderGui = Instance.new("ScreenGui")
LoaderGui.Name = "NitosiumLoader"
LoaderGui.Parent = game:GetService("CoreGui")
LoaderGui.ResetOnSpawn = false

local LoaderFrame = Instance.new("Frame")
LoaderFrame.Name = "LoaderFrame"
LoaderFrame.Parent = LoaderGui
LoaderFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
LoaderFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
LoaderFrame.BorderSizePixel = 2
LoaderFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
LoaderFrame.Size = UDim2.new(0, 400, 0, 300)
LoaderFrame.Active = true
LoaderFrame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = LoaderFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 20)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Font = Enum.Font.GothamBlack
Title.Text = "NITOSIUM LOADER"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 32

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Parent = LoaderFrame
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(0, 0, 0, 70)
VersionLabel.Size = UDim2.new(1, 0, 0, 30)
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.Text = "v1.3"
VersionLabel.TextColor3 = Color3.fromRGB(200, 0, 0)
VersionLabel.TextSize = 20

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = LoaderFrame
InfoLabel.BackgroundTransparency = 1
InfoLabel.Position = UDim2.new(0, 0, 0, 100)
InfoLabel.Size = UDim2.new(1, 0, 0, 80)
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.Text = "Select load method:"
InfoLabel.TextColor3 = Color3.fromRGB(255, 200, 200)
InfoLabel.TextSize = 16
InfoLabel.TextWrapped = true


local GitHubBtn = Instance.new("TextButton")
GitHubBtn.Name = "GitHubBtn"
GitHubBtn.Parent = LoaderFrame
GitHubBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
GitHubBtn.BorderColor3 = Color3.fromRGB(150, 0, 0)
GitHubBtn.BorderSizePixel = 1
GitHubBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
GitHubBtn.Size = UDim2.new(0.35, 0, 0, 45)
GitHubBtn.Font = Enum.Font.GothamBold
GitHubBtn.Text = "GitHub"
GitHubBtn.TextColor3 = Color3.new(1, 1, 1)
GitHubBtn.TextSize = 18

local AltBtn = Instance.new("TextButton")
AltBtn.Name = "AltBtn"
AltBtn.Parent = LoaderFrame
AltBtn.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
AltBtn.BorderColor3 = Color3.fromRGB(150, 80, 0)
AltBtn.BorderSizePixel = 1
AltBtn.Position = UDim2.new(0.55, 0, 0.45, 0)
AltBtn.Size = UDim2.new(0.35, 0, 0, 45)
AltBtn.Font = Enum.Font.GothamBold
AltBtn.Text = "Alternative"
AltBtn.TextColor3 = Color3.new(1, 1, 1)
AltBtn.TextSize = 18


local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = LoaderFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.85, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 40)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Ready to load..."
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.TextSize = 14


spawn(function()
    while LoaderGui.Parent do
        for hue = 0, 1, 0.01 do
            if not LoaderGui.Parent then break end
            Title.TextColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.03)
        end
    end
end)


GitHubBtn.MouseButton1Click:Connect(function()
    StatusLabel.Text = "Loading from GitHub..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    GitHubBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    GitHubBtn.Text = "LOADING..."
    
    wait(0.5)
    
    LoadNitosium()
    
    StatusLabel.Text = "GitHub load attempted!"
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    

    wait(2)
    LoaderGui:Destroy()
end)

AltBtn.MouseButton1Click:Connect(function()
    StatusLabel.Text = "Loading from alternative source..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    AltBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    AltBtn.Text = "LOADING..."
    
    wait(0.5)
    
    LoadAlternative()
    
    StatusLabel.Text = "Alternative load attempted!"
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    

    wait(2)
    LoaderGui:Destroy()
end)


spawn(function()
    wait(10)
    if LoaderGui.Parent then
        StatusLabel.Text = "Auto-loading from GitHub..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        
        wait(1)
        
        LoadNitosium()
        
        wait(1)
        LoaderGui:Destroy()
    end
end)

print("NITOSIUM LOADER v1.3 INITIALIZED")
print("GitHub: https:/n1tosiumcreator/github.com//nitosium")
print("Script will auto-load in 10 seconds...")
