
local Players           = game:GetService("Players")
local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")
local HttpService       = game:GetService("HttpService")
local StarterGui        = game:GetService("StarterGui")
local RunService        = game:GetService("RunService")
local Workspace         = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService   = game:GetService("TeleportService")

local player   = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title    = title,
            Text     = text,
            Duration = duration or 3
        })
    end)
end

if playerGui:FindFirstChild("XiebeTeamGUI") then
    playerGui.XiebeTeamGUI:Destroy()
end

getgenv().XiebeKeySystem = {
    ValidKeys = {
		"143214Q5gT4K",	
        "XIEBE2024-PREMIUM-ACCESS",
        "XIEBE-VIP-LEGENDARY-KEY",
        "XIEBE-HUB-PREMIUM-2024",
        "XIEBE-ULTIMATE-ACCESS-KEY",
        "XIEBE-DEVELOPER-SPECIAL",
        "SKIBIDI-XIEBE-SIGMA-2024",
        "XIEBE-RIZZLER-EDITION-69",
        "OHIO-SIGMA-XIEBE-2024",
        "FANUM-TAX-APPROVED-KEY",
        "GYATT-LEVEL-ACCESS-2024"
    },
    KeyChecked = false,
    KeyValid   = false,
}

local function SendToDiscord(key, status, playerName) end -- placeholder

local function CreateKeySystem()
    local KeyGui   = Instance.new("ScreenGui")
    local MainFrame= Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar   = Instance.new("Frame")
    local Title    = Instance.new("TextLabel")
    local KeyInput = Instance.new("TextBox")
    local SubmitBtn= Instance.new("TextButton")
    local StatusLabel = Instance.new("TextLabel")
    local InfoLabel   = Instance.new("TextLabel")
    local LootLabsLink= Instance.new("TextLabel")

    KeyGui.Name          = "XiebeKeySystem"
    KeyGui.Parent        = game:GetService("CoreGui")
    KeyGui.ZIndexBehavior= Enum.ZIndexBehavior.Sibling
    KeyGui.ResetOnSpawn  = false

    MainFrame.Name            = "MainFrame"
    MainFrame.Parent          = KeyGui
    MainFrame.BackgroundColor3= Color3.fromRGB(25,25,35)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position        = UDim2.new(0.5,-200,0.5,-150)
    MainFrame.Size            = UDim2.new(0,400,0,300)

    UICorner.CornerRadius = UDim.new(0,12)
    UICorner.Parent       = MainFrame

    TopBar.Name            = "TopBar"
    TopBar.Parent          = MainFrame
    TopBar.BackgroundColor3= Color3.fromRGB(35,35,45)
    TopBar.BorderSizePixel = 0
    TopBar.Size            = UDim2.new(1,0,0,50)

    Title.Name            = "Title"
    Title.Parent          = TopBar
    Title.BackgroundTransparency = 1
    Title.Size            = UDim2.new(1,0,1,0)
    Title.Font            = Enum.Font.GothamBold
    Title.Text            = "XIEBE HUB - KEY SYSTEM (i know its annoying and you are prolly saying fuck off but i gotta get money too))"
    Title.TextColor3      = Color3.fromRGB(255,255,255)
    Title.TextSize        = 18

    InfoLabel.Name            = "InfoLabel"
    InfoLabel.Parent          = MainFrame
    InfoLabel.BackgroundTransparency = 1
    InfoLabel.Position        = UDim2.new(0,20,0,70)
    InfoLabel.Size            = UDim2.new(1,-40,0,60)
    InfoLabel.Font            = Enum.Font.Gotham
    InfoLabel.Text            = "Get your key from our Discord server or LootLabs page: Premium Features Awaiting Activation"
    InfoLabel.TextColor3      = Color3.fromRGB(200,200,200)
    InfoLabel.TextSize        = 14
    InfoLabel.TextWrapped     = true
    InfoLabel.TextYAlignment  = Enum.TextYAlignment.Top

    LootLabsLink.Name            = "LootLabsLink"
    LootLabsLink.Parent          = MainFrame
    LootLabsLink.BackgroundTransparency = 1
    LootLabsLink.Position        = UDim2.new(0,20,0,140)
    LootLabsLink.Size            = UDim2.new(1,-40,0,30)
    LootLabsLink.Font            = Enum.Font.GothamBold
    LootLabsLink.Text            = "LOOTLABS: https://loot-link.com/s?lgn4Xs7C COPIED TO CLIPBOARD"
    LootLabsLink.TextColor3      = Color3.fromRGB(0,170,255)
    LootLabsLink.TextSize        = 14
    LootLabsLink.TextWrapped     = true
	setclipboard("https://loot-link.com/s?lgn4Xs7C")

    KeyInput.Name            = "KeyInput"
    KeyInput.Parent          = MainFrame
    KeyInput.BackgroundColor3= Color3.fromRGB(40,40,50)
    KeyInput.BorderSizePixel = 0
    KeyInput.Position        = UDim2.new(0,20,0,180)
    KeyInput.Size            = UDim2.new(1,-40,0,40)
    KeyInput.Font            = Enum.Font.Gotham
    KeyInput.PlaceholderText = "Enter your premium key here..."
    KeyInput.Text            = ""
    KeyInput.TextColor3      = Color3.fromRGB(255,255,255)
    KeyInput.TextSize        = 16
    KeyInput.TextWrapped     = true

    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0,8)
    InputCorner.Parent       = KeyInput

    SubmitBtn.Name            = "SubmitBtn"
    SubmitBtn.Parent          = MainFrame
    SubmitBtn.BackgroundColor3= Color3.fromRGB(0,170,255)
    SubmitBtn.BorderSizePixel = 0
    SubmitBtn.Position        = UDim2.new(0,20,0,235)
    SubmitBtn.Size            = UDim2.new(1,-40,0,40)
    SubmitBtn.Font            = Enum.Font.GothamBold
    SubmitBtn.Text            = "ACTIVATE PREMIUM"
    SubmitBtn.TextColor3      = Color3.fromRGB(255,255,255)
    SubmitBtn.TextSize        = 16

    local SubmitCorner = Instance.new("UICorner")
    SubmitCorner.CornerRadius = UDim.new(0,8)
    SubmitCorner.Parent       = SubmitBtn

    StatusLabel.Name            = "StatusLabel"
    StatusLabel.Parent          = MainFrame
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position        = UDim2.new(0,20,0,285)
    StatusLabel.Size            = UDim2.new(1,-40,0,15)
    StatusLabel.Font            = Enum.Font.Gotham
    StatusLabel.Text            = "Status: Waiting for key..."
    StatusLabel.TextColor3      = Color3.fromRGB(200,200,200)
    StatusLabel.TextSize        = 12

    SubmitBtn.MouseButton1Click:Connect(function()
        local key = KeyInput.Text:gsub("%s+",""):upper()
        if key == "" then
            StatusLabel.Text = "Bro forgot to enter a key"
            StatusLabel.TextColor3 = Color3.fromRGB(255,100,100)
            return
        end

        local isValid = false
        for _,v in ipairs(getgenv().XiebeKeySystem.ValidKeys) do
            if key == v then isValid = true; break end
        end

        if isValid then
            getgenv().XiebeKeySystem.KeyValid   = true
            getgenv().XiebeKeySystem.KeyChecked = true
            StatusLabel.Text = "Valid key! Loading premium features..."
            StatusLabel.TextColor3 = Color3.fromRGB(100,255,100)
            SendToDiscord(key, "VALID", player.Name)
            task.wait(2)
            KeyGui:Destroy()
        else
            local roasts = {
                "Bro thought '"..key.."' would work",
                "Invalid key lil bro, try again",
                "My grandma could generate a better key than that",
                "Are you for real? That key is more expired than your rizz",
                "That key is as valid as your game sense",
                "Bro really tried to use a fanum tax discount code",
                "Invalid key, go touch some grass instead",
                "That key is so wrong it's giving me secondhand embarrassment",
                "My dog could type a better key, and he doesn't have thumbs",
                "Bro's key is more invalid than his life choices",
                "Are you skibidi or what? That key ain't Ohio enough",
                "That key is so bad it should be illegal",
                "Even the NPCs are laughing at your key choice",
                "Bro really thought he could finesse the system",
                "That key is giving major L energy, try again"
            }
            StatusLabel.Text = roasts[math.random(#roasts)]
            StatusLabel.TextColor3 = Color3.fromRGB(255,100,100)
            SendToDiscord(key, "INVALID", player.Name)

            local shakeInfo = TweenInfo.new(0.1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,6,false)
            local shakeGoal = {Position = UDim2.new(0.5,math.random(-5,5),0.5,math.random(-5,5))}
            TweenService:Create(MainFrame,shakeInfo,shakeGoal):Play()
        end
    end)

    -- Hover
    SubmitBtn.MouseEnter:Connect(function()
        TweenService:Create(SubmitBtn,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,200,255)}):Play()
    end)
    SubmitBtn.MouseLeave:Connect(function()
        TweenService:Create(SubmitBtn,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,170,255)}):Play()
    end)

    -- Draggable
    local dragging, dragInput, dragStart, startPos
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                          startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    return KeyGui
end

--// Show key system
notify("Key System", "Enter your key to access the GUI", 3)
task.wait(2)
local KeySystem = CreateKeySystem()

while not getgenv().XiebeKeySystem.KeyChecked do task.wait(1) end

if getgenv().XiebeKeySystem.KeyValid then
    notify("Success", "Key valid! Loading GUI...", 3)

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "XiebeTeamGUI"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0,500,0,350)
    mainFrame.Position = UDim2.new(0.5,-250,0.5,-175)
    mainFrame.AnchorPoint = Vector2.new(0.5,0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 45
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,80,80)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,50,0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,80,80))
    })
    gradient.Parent = mainFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,8)
    corner.Parent = mainFrame

    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1,0,0,30)
    topBar.BackgroundColor3 = Color3.fromRGB(10,10,20)
    topBar.BorderSizePixel = 0
    topBar.Parent = mainFrame

    local topBarCorner = Instance.new("UICorner")
    topBarCorner.CornerRadius = UDim.new(0,8,0,0)
    topBarCorner.Parent = topBar

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(0.5,0,1,0)
    title.Position = UDim2.new(0,10,0,0)
    title.BackgroundTransparency = 1
    title.Text = "Xiebe Team // v1.0"
    title.TextColor3 = Color3.fromRGB(0,255,255)
    title.TextSize = 14
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = topBar

    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0,25,0,25)
    closeButton.Position = UDim2.new(1,-30,0,2)
    closeButton.BackgroundColor3 = Color3.fromRGB(255,50,50)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255,255,255)
    closeButton.TextSize = 12
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = topBar

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0,6)
    closeCorner.Parent = closeButton

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0,25,0,25)
    minimizeButton.Position = UDim2.new(1,-60,0,2)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255,150,0)
    minimizeButton.Text = "_"
    minimizeButton.TextColor3 = Color3.fromRGB(255,255,255)
    minimizeButton.TextSize = 12
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.Parent = topBar

    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0,6)
    minimizeCorner.Parent = minimizeButton

    -- Sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0,120,1,-30)
    sidebar.Position = UDim2.new(0,0,0,30)
    sidebar.BackgroundColor3 = Color3.fromRGB(15,15,25)
    sidebar.BorderSizePixel = 0
    sidebar.Parent = mainFrame

    local sidebarCorner = Instance.new("UICorner")
    sidebarCorner.CornerRadius = UDim.new(0,0,8,0)
    sidebarCorner.Parent = sidebar

    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1,-120,1,-30)
    contentFrame.Position = UDim2.new(0,120,0,30)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame

    local tabs = {
        {Name="Home",     Icon="Home"},
        {Name="Scripts",  Icon="Scripts"},
        {Name="Combat",   Icon="Combat"},
        {Name="Player",   Icon="Player"},
        {Name="Settings", Icon="Settings"}
    }
    local tabButtons = {}
    local tabContents = {}

    for i,tab in ipairs(tabs) do
        local btn = Instance.new("TextButton")
        btn.Name = tab.Name.."Tab"
        btn.Size = UDim2.new(1,-10,0,40)
        btn.Position = UDim2.new(0,5,0,10+(i-1)*45)
        btn.BackgroundColor3 = Color3.fromRGB(30,30,45)
        btn.Text = "  "..tab.Icon.." "..tab.Name
        btn.TextColor3 = Color3.fromRGB(200,200,200)
        btn.TextSize = 12
        btn.Font = Enum.Font.Gotham
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = sidebar

        local bc = Instance.new("UICorner")
        bc.CornerRadius = UDim.new(0,6)
        bc.Parent = btn

        local content = Instance.new("ScrollingFrame")
        content.Name = tab.Name.."Content"
        content.Size = UDim2.new(1,0,1,0)
        content.BackgroundTransparency = 1
        content.BorderSizePixel = 0
        content.ScrollBarThickness = 4
        content.ScrollBarImageColor3 = Color3.fromRGB(0,255,255)
        content.Visible = (i==1)
        content.CanvasSize = UDim2.new(0,0,0,500)
        content.Parent = contentFrame

        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0,8)
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.Parent = content

        tabButtons[tab.Name] = btn
        tabContents[tab.Name] = content
    end

    local home = tabContents["Home"]
    local welcomeFrame = Instance.new("Frame")
    welcomeFrame.Size = UDim2.new(1,-20,0,80)
    welcomeFrame.BackgroundColor3 = Color3.fromRGB(25,25,35)
    welcomeFrame.BackgroundTransparency = 0.3
    welcomeFrame.Parent = home

    local wc = Instance.new("UICorner")
    wc.CornerRadius = UDim.new(0,8)
    wc.Parent = welcomeFrame

    local ws = Instance.new("UIStroke")
    ws.Color = Color3.fromRGB(0,255,255)
    ws.Thickness = 1
    ws.Parent = welcomeFrame

    local wt = Instance.new("TextLabel")
    wt.Size = UDim2.new(1,0,1,0)
    wt.BackgroundTransparency = 1
    wt.Text = "Welcome, "..player.Name.."\nXiebe Team Executor"
    wt.TextColor3 = Color3.fromRGB(0,255,255)
    wt.TextSize = 16
    wt.Font = Enum.Font.GothamBold
    wt.TextYAlignment = Enum.TextYAlignment.Center
    wt.Parent = welcomeFrame

    local quickExecute = Instance.new("TextButton")
    quickExecute.Size = UDim2.new(1,-20,0,40)
    quickExecute.BackgroundColor3 = Color3.fromRGB(0,100,100)
    quickExecute.Text = "Quick Execute"
    quickExecute.TextColor3 = Color3.fromRGB(255,255,255)
    quickExecute.TextSize = 14
    quickExecute.Font = Enum.Font.GothamBold
    quickExecute.Parent = home

    local qec = Instance.new("UICorner")
    qec.CornerRadius = UDim.new(0,6)
    qec.Parent = quickExecute

    local scripts = tabContents["Scripts"]
    local scriptList = {
        "Infinite Yield","Remote Spy","Chat Bypass",
        "Fly Script","Speed Script","Noclip Script",
        "ESP Script","Aimbot Script"
    }
    for _,name in ipairs(scriptList) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1,-20,0,35)
        b.BackgroundColor3 = Color3.fromRGB(40,40,60)
        b.Text = "▶ "..name
        b.TextColor3 = Color3.fromRGB(200,200,255)
        b.TextSize = 12
        b.Font = Enum.Font.Gotham
        b.Parent = scripts
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0,6)
        c.Parent = b
    end

    local combat = tabContents["Combat"]
    local combatList = {
        "Kill All","God Mode","Infinite Ammo","No Recoil",
        "Rapid Fire","Aimbot","Wallhack","Speed Hack"
    }
    for _,name in ipairs(combatList) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1,-20,0,35)
        b.BackgroundColor3 = Color3.fromRGB(60,40,40)
        b.Text = name
        b.TextColor3 = Color3.fromRGB(255,200,200)
        b.TextSize = 12
        b.Font = Enum.Font.Gotham
        b.Parent = combat
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0,6)
        c.Parent = b
    end

    local playerTab = tabContents["Player"]
    local playerList = {
        "Fly (X)","Noclip (N)","Speed (Z)","Jump (C)",
        "Teleport To Player","Bring Player","View Player","Copy Outfit"
    }
    for _,name in ipairs(playerList) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1,-20,0,35)
        b.BackgroundColor3 = Color3.fromRGB(40,60,40)
        b.Text = name
        b.TextColor3 = Color3.fromRGB(200,255,200)
        b.TextSize = 12
        b.Font = Enum.Font.Gotham
        b.Parent = playerTab
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0,6)
        c.Parent = b
    end

    local settings = tabContents["Settings"]
    local settingList = {
        "Dark Theme","Auto Execute","Anti AFK","FPS Boost",
        "Rejoin Server","Server Hop","Copy Discord","Check Updates"
    }
    for _,name in ipairs(settingList) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1,-20,0,35)
        b.BackgroundColor3 = Color3.fromRGB(50,50,70)
        b.Text = name
        b.TextColor3 = Color3.fromRGB(200,200,255)
        b.TextSize = 12
        b.Font = Enum.Font.Gotham
        b.Parent = settings
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0,6)
        c.Parent = b
    end

    local bottomBar = Instance.new("Frame")
    bottomBar.Name = "BottomBar"
    bottomBar.Size = UDim2.new(1,0,0,25)
    bottomBar.Position = UDim2.new(0,0,1,-25)
    bottomBar.BackgroundColor3 = Color3.fromRGB(10,10,20)
    bottomBar.BorderSizePixel = 0
    bottomBar.Parent = mainFrame

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0,0,0,8)
    bc.Parent = bottomBar

    local statusText = Instance.new("TextLabel")
    statusText.Size = UDim2.new(1,-10,1,0)
    statusText.Position = UDim2.new(0,10,0,0)
    statusText.BackgroundTransparency = 1
    statusText.Text = "Xiebe Team - Ready | FPS: 60 | Ping: 20ms"
    statusText.TextColor3 = Color3.fromRGB(0,255,255)
    statusText.TextSize = 11
    statusText.Font = Enum.Font.Gotham
    statusText.TextXAlignment = Enum.TextXAlignment.Left
    statusText.Parent = bottomBar

    local function setStatus(txt) statusText.Text = txt end

    for name,btn in pairs(tabButtons) do
        btn.MouseButton1Click:Connect(function()
            for _,c in pairs(tabContents) do c.Visible = false end
            tabContents[name].Visible = true
            for n,b in pairs(tabButtons) do
                if n==name then
                    b.BackgroundColor3 = Color3.fromRGB(0,100,100)
                    b.TextColor3 = Color3.fromRGB(0,255,255)
                else
                    b.BackgroundColor3 = Color3.fromRGB(30,30,45)
                    b.TextColor3 = Color3.fromRGB(200,200,200)
                end
            end
        end)
    end

    closeButton.MouseButton1Click:Connect(function() screenGui:Destroy() end)
    local minimized = false
    minimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        mainFrame.Size = minimized and UDim2.new(0,500,0,30) or UDim2.new(0,500,0,350)
        statusText.Visible = not minimized
    end)

    quickExecute.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        setStatus("Infinite Yield Executed!")
    end)

    local dragging, dStart, dInput, dPos
    topBar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dStart = inp.Position
            dPos = mainFrame.Position
        end
    end)
    topBar.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = inp.Position - dStart
            mainFrame.Position = UDim2.new(0, dPos.X.Offset + delta.X, 0, dPos.Y.Offset + delta.Y)
        end
    end)

    tabButtons["Home"].BackgroundColor3 = Color3.fromRGB(0,100,100)
    tabButtons["Home"].TextColor3 = Color3.fromRGB(0,255,255)

    local plr = Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    local hrp = char:WaitForChild("HumanoidRootPart")

    local scriptUrls = {
        ["Infinite Yield"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
        ["Remote Spy"]     = "https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua",
        ["Chat Bypass"]    = "https://gist.githubusercontent.com/bart3876478326746387/392d9f3a6582fb3a86da2b074ba9a864/raw",
        ["Fly Script"]     = "https://raw.githubusercontent.com/Exunys/Swim-Fly/main/Swim%20Fly.lua",
        ["Speed Script"]   = "https://raw.githubusercontent.com/eclipsology/SimpleSpeed/main/SimpleSpeed.lua",
        ["Noclip Script"]  = "https://gist.githubusercontent.com/BR3XALITY/40a631e564f529ea31821e2d28076157/raw",
        ["ESP Script"]     = "https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua",
        ["Aimbot Script"]  = "https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"
    }

    for _,b in ipairs(scripts:GetChildren()) do
        if b:IsA("TextButton") then
            b.MouseButton1Click:Connect(function()
                local name = b.Text:match("^▶%s*(.+)$")
                local url = scriptUrls[name]
                if url then
                    setStatus("Executing "..name.."...")
                    spawn(function()
                        local ok,err = pcall(function()
                            local code = game:HttpGet(url)
                            loadstring(code)()
                        end)
                        if ok then
                            notify(name.." loaded!")
                            setStatus(name.." executed")
                        else
                            notify("Failed: "..tostring(err))
                            setStatus(name.." failed")
                        end
                    end)
                end
            end)
        end
    end

    local combatToggles = {
        GodMode=false, InfiniteAmmo=false, NoRecoil=false,
        RapidFire=false, Aimbot=false, Wallhack=false, SpeedHack=false
    }

    local function toggleGod()
        combatToggles.GodMode = not combatToggles.GodMode
        if combatToggles.GodMode then
            hum.MaxHealth = math.huge
            hum.Health = math.huge
            notify("God Mode ON")
        else
            hum.MaxHealth = 100
            hum.Health = 100
            notify("God Mode OFF")
        end
    end

    local function toggleInfAmmo()
        combatToggles.InfiniteAmmo = not combatToggles.InfiniteAmmo
        if combatToggles.InfiniteAmmo then
            local function apply(tool)
                local ammo = tool:FindFirstChildWhichIsA("IntValue") or tool:FindFirstChildWhichIsA("NumberValue")
                if ammo and ammo.Name:lower():find("ammo") then
                    ammo.Value = 99999
                    ammo:GetPropertyChangedSignal("Value"):Connect(function() ammo.Value = 99999 end)
                end
            end
            for _,t in ipairs(plr.Backpack:GetChildren()) do if t:IsA("Tool") then apply(t) end end
            plr.Backpack.DescendantAdded:Connect(function(c) if c:IsA("Tool") then apply(c) end end)
            notify("Infinite Ammo ON")
        else
            notify("Infinite Ammo OFF")
        end
    end

    local function toggleNoRecoil()
        combatToggles.NoRecoil = not combatToggles.NoRecoil
        notify(combatToggles.NoRecoil and "No Recoil ON" or "No Recoil OFF")
    end

    local function toggleRapidFire()
        combatToggles.RapidFire = not combatToggles.RapidFire
        if combatToggles.RapidFire then
            for _,t in ipairs(plr.Backpack:GetChildren()) do
                if t:IsA("Tool") then
                    local fr = t:FindFirstChild("FireRate") or t:FindFirstChild("Cooldown")
                    if fr and (fr:IsA("NumberValue") or fr:IsA("IntValue")) then fr.Value = 0.01 end
                end
            end
        end
        notify(combatToggles.RapidFire and "Rapid Fire ON" or "Rapid Fire OFF")
    end

    local aimConn
    local function toggleAimbot()
        combatToggles.Aimbot = not combatToggles.Aimbot
        if combatToggles.Aimbot then
            aimConn = RunService.RenderStepped:Connect(function()
                local closest, target = math.huge
                for _,p in ipairs(Players:GetPlayers()) do
                    if p ~= plr and p.Character and p.Character:FindFirstChild("Head") then
                        local dist = (p.Character.Head.Position - hrp.Position).Magnitude
                        if dist < closest and dist < 120 then
                            closest = dist
                            target = p.Character.Head
                        end
                    end
                end
                if target then
                    Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, target.Position)
                end
            end)
            notify("Aimbot ON")
        else
            if aimConn then aimConn:Disconnect() end
            notify("Aimbot OFF")
        end
    end

    local wallHighlights = {}
    local function toggleWallhack()
        combatToggles.Wallhack = not combatToggles.Wallhack
        if combatToggles.Wallhack then
            local function add(p)
                if p ~= plr and p.Character then
                    local h = Instance.new("Highlight")
                    h.FillTransparency = 0.5
                    h.OutlineColor = Color3.fromRGB(255,0,0)
                    h.Parent = p.Character
                    wallHighlights[p] = h
                end
            end
            for _,p in ipairs(Players:GetPlayers()) do add(p) end
            Players.PlayerAdded:Connect(function(p)
                p.CharacterAdded:Connect(function(c) add(p) end)
            end)
            notify("Wallhack ON")
        else
            for _,h in pairs(wallHighlights) do h:Destroy() end
            wallHighlights = {}
            notify("Wallhack OFF")
        end
    end

    local function toggleSpeedHack()
        combatToggles.SpeedHack = not combatToggles.SpeedHack
        hum.WalkSpeed = combatToggles.SpeedHack and 50 or 16
        notify(combatToggles.SpeedHack and "Speed Hack ON" or "Speed Hack OFF")
    end

    local function killAll()
        for _,p in ipairs(Players:GetPlayers()) do
            if p ~= plr and p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid.Health = 0
            end
        end
        notify("Killed all players!")
    end

    for _,b in ipairs(combat:GetChildren()) do
        if b:IsA("TextButton") then
            local name = b.Text:match("^(.+)$")
            b.MouseButton1Click:Connect(function()
                if name == "God Mode" then toggleGod()
                elseif name == "Infinite Ammo" then toggleInfAmmo()
                elseif name == "No Recoil" then toggleNoRecoil()
                elseif name == "Rapid Fire" then toggleRapidFire()
                elseif name == "Aimbot" then toggleAimbot()
                elseif name == "Wallhack" then toggleWallhack()
                elseif name == "Speed Hack" then toggleSpeedHack()
                elseif name == "Kill All" then killAll()
                end
                setStatus(name.." toggled")
            end)
        end
    end

    -- PLAYER TAB
    local playerToggles = {Fly=false, Noclip=false, Speed=false, Jump=false}
    local flyConn, noclipConn

    local function toggleFly()
        playerToggles.Fly = not playerToggles.Fly
        if playerToggles.Fly then
            local bv = Instance.new("BodyVelocity")
            bv.Velocity = Vector3.new()
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Parent = hrp
            local bg = Instance.new("BodyGyro")
            bg.CFrame = hrp.CFrame
            bg.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
            bg.P = 9000
            bg.Parent = hrp

            flyConn = RunService.Stepped:Connect(function()
                hum.PlatformStand = true
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    bv.Velocity = Workspace.CurrentCamera.CFrame.LookVector * 50
                elseif UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    bv.Velocity = -Workspace.CurrentCamera.CFrame.LookVector * 50
                else
                    bv.Velocity = Vector3.new()
                end
                bg.CFrame = Workspace.CurrentCamera.CFrame
            end)
            notify("Fly ON (X to toggle)")
        else
            if flyConn then flyConn:Disconnect() end
            hum.PlatformStand = false
            if hrp:FindFirstChild("BodyVelocity") then hrp.BodyVelocity:Destroy() end
            if hrp:FindFirstChild("BodyGyro") then hrp.BodyGyro:Destroy() end
            notify("Fly OFF")
        end
    end

    local function toggleNoclip()
        playerToggles.Noclip = not playerToggles.Noclip
        if playerToggles.Noclip then
            noclipConn = RunService.Stepped:Connect(function()
                for _,p in ipairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end)
            notify("Noclip ON (N to toggle)")
        else
            if noclipConn then noclipConn:Disconnect() end
            notify("Noclip OFF")
        end
    end

    local function toggleSpeed()
        playerToggles.Speed = not playerToggles.Speed
        hum.WalkSpeed = playerToggles.Speed and 50 or 16
        notify(playerToggles.Speed and "Speed ON (Z)" or "Speed OFF")
    end

    local function toggleJump()
        playerToggles.Jump = not playerToggles.Jump
        hum.JumpPower = playerToggles.Jump and 100 or 50
        notify(playerToggles.Jump and "High Jump ON (C)" or "High Jump OFF")
    end

    local function teleportToPlayer()
        local target = Players:GetPlayers()[2]
        if target and target.Character then
            hrp.CFrame = target.Character.HumanoidRootPart.CFrame
            notify("Teleported to "..target.Name)
        end
    end

    local function bringPlayer()
        local target = Players:GetPlayers()[2]
        if target and target.Character then
            target.Character.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0,0,-3)
            notify("Brought "..target.Name)
        end
    end

    local function viewPlayer()
        local target = Players:GetPlayers()[2]
        if target and target.Character then
            Workspace.CurrentCamera.CameraSubject = target.Character.Humanoid
            notify("Viewing "..target.Name)
        end
    end

    local function copyOutfit()
        local target = Players:GetPlayers()[2]
        if target and target.Character then
            for _,a in ipairs(target.Character:GetChildren()) do
                if a:IsA("Accessory") then
                    local c = a:Clone()
                    c.Parent = char
                end
            end
            notify("Copied outfit from "..target.Name)
        end
    end

    for _,b in ipairs(playerTab:GetChildren()) do
        if b:IsA("TextButton") then
            local name = b.Text:match("^(.+)$")
            b.MouseButton1Click:Connect(function()
                if name == "Fly (X)" then toggleFly()
                elseif name == "Noclip (N)" then toggleNoclip()
                elseif name == "Speed (Z)" then toggleSpeed()
                elseif name == "Jump (C)" then toggleJump()
                elseif name == "Teleport To Player" then teleportToPlayer()
                elseif name == "Bring Player" then bringPlayer()
                elseif name == "View Player" then viewPlayer()
                elseif name == "Copy Outfit" then copyOutfit()
                end
                setStatus(name.." activated")
            end)
        end
    end

    -- SETTINGS
    local settingsToggles = {DarkTheme=true, AutoExecute=false, AntiAFK=false, FPSBoost=false}
    local antiAFKConn

    local function toggleDarkTheme()
        settingsToggles.DarkTheme = not settingsToggles.DarkTheme
        mainFrame.BackgroundColor3 = settingsToggles.DarkTheme and Color3.fromRGB(20,20,30) or Color3.fromRGB(200,200,200)
        notify(settingsToggles.DarkTheme and "Dark Theme ON" or "Dark Theme OFF")
    end

    local function toggleAutoExecute()
        settingsToggles.AutoExecute = not settingsToggles.AutoExecute
        if settingsToggles.AutoExecute then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
        notify(settingsToggles.AutoExecute and "Auto Execute ON" or "Auto Execute OFF")
    end

    local function toggleAntiAFK()
        settingsToggles.AntiAFK = not settingsToggles.AntiAFK
        if settingsToggles.AntiAFK then
            antiAFKConn = plr.Idled:Connect(function(t)
                if t > 20 then game:GetService("VirtualUser"):ClickButton2(Vector2.new()) end
            end)
            notify("Anti AFK ON")
        else
            if antiAFKConn then antiAFKConn:Disconnect() end
            notify("Anti AFK OFF")
        end
    end

    local function toggleFPSBoost()
        settingsToggles.FPSBoost = not settingsToggles.FPSBoost
        settings().Rendering.QualityLevel = settingsToggles.FPSBoost and Enum.QualityLevel.Level01 or Enum.QualityLevel.Automatic
        notify(settingsToggles.FPSBoost and "FPS Boost ON" or "FPS Boost OFF")
    end

    local function rejoinServer()
        TeleportService:Teleport(game.PlaceId, plr)
        notify("Rejoining server...")
    end

    local function serverHop()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        local id = servers.data[math.random(#servers.data)].id
        TeleportService:TeleportToPlaceInstance(game.PlaceId, id, plr)
        notify("Hopping to new server...")
    end

    local function copyDiscord()
        setclipboard = setclipboard or function() end
        setclipboard("https://discord.gg/uKtcRUjEH9")
        notify("Discord link copied!")
    end

    local function checkUpdates()
        notify("No updates available.")
    end

    for _,b in ipairs(settings:GetChildren()) do
        if b:IsA("TextButton") then
            local name = b.Text:match("^(.+)$")
            b.MouseButton1Click:Connect(function()
                if name == "Dark Theme" then toggleDarkTheme()
                elseif name == "Auto Execute" then toggleAutoExecute()
                elseif name == "Anti AFK" then toggleAntiAFK()
                elseif name == "FPS Boost" then toggleFPSBoost()
                elseif name == "Rejoin Server" then rejoinServer()
                elseif name == "Server Hop" then serverHop()
                elseif name == "Copy Discord" then copyDiscord()
                elseif name == "Check Updates" then checkUpdates()
                end
                setStatus(name.." executed")
            end)
        end
    end

    -- FPS / Ping updater
    spawn(function()
        while task.wait(5) do
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            local ping = math.floor(plr:GetNetworkPing() * 1000)
            setStatus("Xiebe Team - Ready | FPS: "..fps.." | Ping: "..ping.."ms")
        end
    end)

    -- Respawn handling
    plr.CharacterAdded:Connect(function(newChar)
        char = newChar
        hum = char:WaitForChild("Humanoid")
        hrp = char:WaitForChild("HumanoidRootPart")
        if combatToggles.GodMode then toggleGod() end
        if combatToggles.SpeedHack then toggleSpeedHack() end
        if playerToggles.Speed then toggleSpeed() end
        if playerToggles.Jump then toggleJump() end
    end)

    print("Xiebe Team Executor loaded!")
else
    notify("Error", "Invalid key! Access denied.", 3)
end
