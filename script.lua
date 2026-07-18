-- ============================================
-- XIYZ CHEATS v14.0 - RAGE & LEGIT AIMBOT
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Drawing = Drawing

local THEMES = {
    Blue = {
        Background = Color3.fromRGB(8, 12, 28),
        Secondary = Color3.fromRGB(18, 26, 52),
        Accent1 = Color3.fromRGB(30, 120, 255),
        Accent2 = Color3.fromRGB(65, 135, 255),
        Accent3 = Color3.fromRGB(0, 200, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(150, 170, 200),
        Success = Color3.fromRGB(0, 255, 150),
        Error = Color3.fromRGB(255, 70, 90),
        Warning = Color3.fromRGB(255, 200, 70),
        Discord = Color3.fromRGB(88, 101, 242)
    },
    Red = {
        Background = Color3.fromRGB(28, 8, 8),
        Secondary = Color3.fromRGB(52, 18, 18),
        Accent1 = Color3.fromRGB(255, 50, 50),
        Accent2 = Color3.fromRGB(255, 80, 80),
        Accent3 = Color3.fromRGB(255, 120, 120),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(200, 150, 150),
        Success = Color3.fromRGB(0, 255, 150),
        Error = Color3.fromRGB(255, 70, 90),
        Warning = Color3.fromRGB(255, 200, 70),
        Discord = Color3.fromRGB(88, 101, 242)
    },
    Green = {
        Background = Color3.fromRGB(8, 28, 12),
        Secondary = Color3.fromRGB(18, 52, 26),
        Accent1 = Color3.fromRGB(0, 255, 100),
        Accent2 = Color3.fromRGB(50, 255, 120),
        Accent3 = Color3.fromRGB(100, 255, 150),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(150, 200, 170),
        Success = Color3.fromRGB(0, 255, 150),
        Error = Color3.fromRGB(255, 70, 90),
        Warning = Color3.fromRGB(255, 200, 70),
        Discord = Color3.fromRGB(88, 101, 242)
    },
    Purple = {
        Background = Color3.fromRGB(20, 8, 28),
        Secondary = Color3.fromRGB(40, 18, 52),
        Accent1 = Color3.fromRGB(150, 0, 255),
        Accent2 = Color3.fromRGB(180, 50, 255),
        Accent3 = Color3.fromRGB(200, 100, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(180, 150, 200),
        Success = Color3.fromRGB(0, 255, 150),
        Error = Color3.fromRGB(255, 70, 90),
        Warning = Color3.fromRGB(255, 200, 70),
        Discord = Color3.fromRGB(88, 101, 242)
    },
    Orange = {
        Background = Color3.fromRGB(28, 16, 8),
        Secondary = Color3.fromRGB(52, 30, 18),
        Accent1 = Color3.fromRGB(255, 140, 0),
        Accent2 = Color3.fromRGB(255, 170, 50),
        Accent3 = Color3.fromRGB(255, 200, 100),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(200, 170, 150),
        Success = Color3.fromRGB(0, 255, 150),
        Error = Color3.fromRGB(255, 70, 90),
        Warning = Color3.fromRGB(255, 200, 70),
        Discord = Color3.fromRGB(88, 101, 242)
    },
    Black = {
        Background = Color3.fromRGB(15, 15, 15),
        Secondary = Color3.fromRGB(35, 35, 35),
        Accent1 = Color3.fromRGB(200, 200, 200),
        Accent2 = Color3.fromRGB(255, 255, 255),
        Accent3 = Color3.fromRGB(180, 180, 180),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(150, 150, 150),
        Success = Color3.fromRGB(0, 255, 100),
        Error = Color3.fromRGB(255, 50, 50),
        Warning = Color3.fromRGB(255, 200, 50),
        Discord = Color3.fromRGB(88, 101, 242)
    }
}

local COLORS = THEMES.Blue

local Config = {
    Aimbot = {
        Enabled = false,
        Mode = "Head",
        AimbotMode = "Legit",
        LegitSmoothness = 0.15,
        LegitFOV = 150,
        LegitPrediction = 0.165,
        RageSmoothness = 1,
        RageFOV = 1000,
        RagePrediction = 0.05,
        TeamCheck = true,
        VisibilityCheck = false,
        ShowFOV = true,
        LegitKey = Enum.UserInputType.MouseButton2,
        RageKey = Enum.KeyCode.LeftShift
    },
    ESP = {
        Enabled = false, Boxes = true, BoxesFilled = false, Names = true,
        Distance = true, HealthBar = true, HealthText = true,
        Tracers = false, TeamColor = false, MaxDistance = 2000
    },
    Movement = {
        SpeedHack = false, SpeedValue = 100, Fly = false, FlySpeed = 50,
        NoClip = false, InfiniteJump = false, BunnyHop = false
    },
    Weapon = {
        NoRecoil = false, NoSpread = false, RapidFire = false,
        InstantReload = false, InfiniteAmmo = false
    },
    Player = {
        GodMode = false, AntiAFK = true, FullBright = false,
        FOVChanger = false, FOVValue = 100
    },
    Misc = {
        AutoFarm = false, ClickTP = false, AutoClick = false, ClickSpeed = 0.1
    },
    Settings = {
        MenuKey = Enum.KeyCode.Insert, Theme = "Blue"
    }
}

local State = {
    IsOpen = true, CurrentTab = "Aimbot",
    IsAimingLegit = false,
    IsAimingRage = false,
    Target = nil
}

local ESP = { Drawings = {} }

function ESP:CreateDrawing(type, props)
    local drawing = Drawing.new(type)
    for k, v in pairs(props) do
        pcall(function() drawing[k] = v end)
    end
    return drawing
end

function ESP:CreatePlayerESP(player)
    if player == LocalPlayer then return end
    if self.Drawings[player] then return end
    
    self.Drawings[player] = {
        Box = self:CreateDrawing("Square", {Thickness = 1, Filled = false, Visible = false, ZIndex = 2}),
        BoxFill = self:CreateDrawing("Square", {Thickness = 1, Filled = true, Visible = false, Transparency = 0.2, ZIndex = 1}),
        Name = self:CreateDrawing("Text", {Size = 13, Center = true, Outline = true, Visible = false, ZIndex = 3}),
        Distance = self:CreateDrawing("Text", {Size = 12, Center = true, Outline = true, Visible = false, ZIndex = 3}),
        HealthBar = self:CreateDrawing("Square", {Thickness = 1, Filled = true, Visible = false, ZIndex = 2}),
        HealthBarBg = self:CreateDrawing("Square", {Thickness = 1, Filled = true, Visible = false, Color = Color3.new(0, 0, 0), ZIndex = 1}),
        Tracer = self:CreateDrawing("Line", {Thickness = 1, Visible = false, ZIndex = 1})
    }
end

function ESP:RemovePlayerESP(player)
    if self.Drawings[player] then
        for _, d in pairs(self.Drawings[player]) do
            if d and d.Remove then d:Remove() end
        end
        self.Drawings[player] = nil
    end
end

function ESP:Update()
    if not Config.ESP.Enabled then
        for _, drawings in pairs(self.Drawings) do
            for _, d in pairs(drawings) do
                if d then d.Visible = false end
            end
        end
        return
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            self:CreatePlayerESP(player)
        end
    end
    
    for player, _ in pairs(self.Drawings) do
        if not player.Parent then
            self:RemovePlayerESP(player)
        end
    end
    
    for player, drawings in pairs(self.Drawings) do
        local success = pcall(function()
            local character = player.Character
            local humanoid = character and character:FindFirstChild("Humanoid")
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            local head = character and character:FindFirstChild("Head")
            
            if not (character and humanoid and rootPart and head) or humanoid.Health <= 0 then
                for _, d in pairs(drawings) do if d then d.Visible = false end end
                return
            end
            
            local pos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            if not onScreen then
                for _, d in pairs(drawings) do if d then d.Visible = false end end
                return
            end
            
            local distance = 0
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
            end
            
            if distance > Config.ESP.MaxDistance then
                for _, d in pairs(drawings) do if d then d.Visible = false end end
                return
            end
            
            if Config.ESP.TeamCheck and player.Team == LocalPlayer.Team then
                for _, d in pairs(drawings) do if d then d.Visible = false end end
                return
            end
            
            local color = Config.ESP.TeamColor and (player.TeamColor and player.TeamColor.Color or COLORS.Accent1) or COLORS.Accent1
            
            local size = math.clamp(2000 / pos.Z, 20, 150)
            local boxSize = Vector2.new(size * 0.6, size * 1.4)
            local boxPos = Vector2.new(pos.X - boxSize.X / 2, pos.Y - boxSize.Y / 2)
            
            if Config.ESP.Boxes then
                drawings.Box.Size = boxSize
                drawings.Box.Position = boxPos
                drawings.Box.Color = color
                drawings.Box.Visible = true
                
                if Config.ESP.BoxesFilled then
                    drawings.BoxFill.Size = boxSize
                    drawings.BoxFill.Position = boxPos
                    drawings.BoxFill.Color = color
                    drawings.BoxFill.Visible = true
                else
                    drawings.BoxFill.Visible = false
                end
            else
                drawings.Box.Visible = false
                drawings.BoxFill.Visible = false
            end
            
            if Config.ESP.Names then
                drawings.Name.Text = player.Name
                drawings.Name.Position = Vector2.new(pos.X, boxPos.Y - 18)
                drawings.Name.Color = COLORS.Text
                drawings.Name.Visible = true
            else
                drawings.Name.Visible = false
            end
            
            if Config.ESP.Distance then
                local distText = math.floor(distance) .. "m"
                if Config.ESP.HealthText then
                    distText = distText .. " | " .. math.floor(humanoid.Health) .. " HP"
                end
                drawings.Distance.Text = distText
                drawings.Distance.Position = Vector2.new(pos.X, boxPos.Y + boxSize.Y + 3)
                drawings.Distance.Color = COLORS.TextDark
                drawings.Distance.Visible = true
            else
                drawings.Distance.Visible = false
            end
            
            if Config.ESP.HealthBar then
                local healthPercent = humanoid.Health / humanoid.MaxHealth
                local barHeight = boxSize.Y * healthPercent
                
                drawings.HealthBarBg.Size = Vector2.new(4, boxSize.Y)
                drawings.HealthBarBg.Position = Vector2.new(boxPos.X - 10, boxPos.Y)
                drawings.HealthBarBg.Visible = true
                
                drawings.HealthBar.Size = Vector2.new(4, barHeight)
                drawings.HealthBar.Position = Vector2.new(boxPos.X - 10, boxPos.Y + boxSize.Y - barHeight)
                drawings.HealthBar.Color = Color3.fromRGB(255 * (1 - healthPercent), 255 * healthPercent, 0)
                drawings.HealthBar.Visible = true
            else
                drawings.HealthBar.Visible = false
                drawings.HealthBarBg.Visible = false
            end
            
            if Config.ESP.Tracers then
                drawings.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                drawings.Tracer.To = Vector2.new(pos.X, pos.Y + boxSize.Y / 2)
                drawings.Tracer.Color = color
                drawings.Tracer.Visible = true
            else
                drawings.Tracer.Visible = false
            end
        end)
        
        if not success then
            for _, d in pairs(drawings) do if d then d.Visible = false end end
        end
    end
end

local Aimbot = {
    FOVDrawing = nil,
    Target = nil,
    CurrentMode = "Legit"
}

function Aimbot:Init()
    if not self.FOVDrawing then
        self.FOVDrawing = Drawing.new("Circle")
        self.FOVDrawing.Thickness = 2
        self.FOVDrawing.NumSides = 64
        self.FOVDrawing.Filled = false
        self.FOVDrawing.Visible = false
    end
end

function Aimbot:GetClosestPlayer(mode)
    local settings = mode == "Rage" and {
        FOV = Config.Aimbot.RageFOV,
        TeamCheck = false
    } or {
        FOV = Config.Aimbot.LegitFOV,
        TeamCheck = Config.Aimbot.TeamCheck
    }
    
    local closest = nil
    local shortestDistance = settings.FOV
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
    local centerPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local checkPos = mode == "Rage" and centerPos or mousePos
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetPart = player.Character:FindFirstChild(Config.Aimbot.Mode) or player.Character:FindFirstChild("Head")
            
            if targetPart then
                if settings.TeamCheck and player.Team == LocalPlayer.Team then
                    -- skip
                else
                    local pos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                    if onScreen then
                        local distance = (Vector2.new(pos.X, pos.Y) - checkPos).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            closest = player
                        end
                    end
                end
            end
        end
    end
    
    return closest
end

function Aimbot:Update()
    self:Init()
    
    local showFOV = Config.Aimbot.ShowFOV and self.CurrentMode == "Legit"
    
    if showFOV then
        self.FOVDrawing.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
        self.FOVDrawing.Radius = Config.Aimbot.LegitFOV
        self.FOVDrawing.Color = COLORS.Accent1
        self.FOVDrawing.Visible = true
    else
        self.FOVDrawing.Visible = false
    end
    
    local isAiming = State.IsAimingLegit or State.IsAimingRage
    local currentMode = State.IsAimingRage and "Rage" or "Legit"
    self.CurrentMode = currentMode
    
    if Config.Aimbot.Enabled and isAiming then
        if not self.Target or not self.Target.Character then
            self.Target = self:GetClosestPlayer(currentMode)
        end
        
        if self.Target and self.Target.Character then
            local targetPart = self.Target.Character:FindFirstChild(Config.Aimbot.Mode) or self.Target.Character:FindFirstChild("Head")
            
            if targetPart then
                if currentMode == "Rage" then
                    local targetPos = targetPart.Position + (targetPart.Velocity * Config.Aimbot.RagePrediction)
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
                else
                    local targetPos = targetPart.Position + (targetPart.Velocity * Config.Aimbot.LegitPrediction)
                    local targetCFrame = CFrame.new(Camera.CFrame.Position, targetPos)
                    Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, Config.Aimbot.LegitSmoothness)
                end
            end
        end
    else
        self.Target = nil
    end
end

local function Tween(obj, info, props)
    local tween = TweenService:Create(obj, info, props)
    tween:Play()
    return tween
end

local function Ripple(btn, x, y)
    local ripple = Instance.new("Frame")
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.Position = UDim2.new(0, x, 0, y)
    ripple.BackgroundColor3 = COLORS.Text
    ripple.BackgroundTransparency = 0.6
    ripple.BorderSizePixel = 0
    ripple.ZIndex = 10
    ripple.Parent = btn
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = ripple
    
    local maxSize = math.max(btn.AbsoluteSize.X, btn.AbsoluteSize.Y) * 2
    
    Tween(ripple, TweenInfo.new(0.6), {
        Size = UDim2.new(0, maxSize, 0, maxSize),
        Position = UDim2.new(0, x - maxSize/2, 0, y - maxSize/2),
        BackgroundTransparency = 1
    })
    
    game:GetService("Debris"):AddItem(ripple, 0.6)
end

local function CreateKeySystem()
    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Name = "XIYZKeySystem"
    KeyGui.Parent = game.CoreGui
    
    local BG = Instance.new("Frame")
    BG.Size = UDim2.new(1, 0, 1, 0)
    BG.BackgroundColor3 = Color3.new(0, 0, 0)
    BG.BackgroundTransparency = 0.4
    BG.BorderSizePixel = 0
    BG.Parent = KeyGui
    
    spawn(function()
        while KeyGui.Parent do
            local p = Instance.new("Frame")
            p.Size = UDim2.new(0, math.random(3, 8), 0, math.random(3, 8))
            p.Position = UDim2.new(math.random(), 0, 1.2, 0)
            p.BackgroundColor3 = math.random() > 0.5 and COLORS.Accent1 or COLORS.Accent3
            p.BackgroundTransparency = 0.7
            p.BorderSizePixel = 0
            p.Parent = BG
            
            local c = Instance.new("UICorner")
            c.CornerRadius = UDim.new(1, 0)
            c.Parent = p
            
            Tween(p, TweenInfo.new(math.random(8, 15)), {
                Position = UDim2.new(p.Position.X.Scale, 0, -0.2, 0),
                BackgroundTransparency = 1
            })
            
            game:GetService("Debris"):AddItem(p, 15)
            wait(math.random(2, 6) / 10)
        end
    end)
    
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 420, 0, 520)
    Main.Position = UDim2.new(0.5, -210, 0.5, -260)
    Main.BackgroundColor3 = COLORS.Background
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.Parent = KeyGui
    
    Main.Position = UDim2.new(0.5, -210, 1, 0)
    Tween(Main, TweenInfo.new(0.7, Enum.EasingStyle.Back), {
        Position = UDim2.new(0.5, -210, 0.5, -260)
    })
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 20)
    Corner.Parent = Main
    
    local Glow = Instance.new("ImageLabel")
    Glow.Size = UDim2.new(1, 60, 1, 60)
    Glow.Position = UDim2.new(0, -30, 0, -30)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://4996893366"
    Glow.ImageColor3 = COLORS.Accent1
    Glow.ImageTransparency = 0.9
    Glow.Parent = Main
    
    spawn(function()
        while Main.Parent do
            Tween(Glow, TweenInfo.new(2), {ImageTransparency = 0.7})
            wait(2)
            if not Main.Parent then break end
            Tween(Glow, TweenInfo.new(2), {ImageTransparency = 0.9})
            wait(2)
        end
    end)
    
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 6)
    TopBar.BackgroundColor3 = COLORS.Accent1
    TopBar.BorderSizePixel = 0
    TopBar.Parent = Main
    
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, COLORS.Accent1),
        ColorSequenceKeypoint.new(0.5, COLORS.Accent3),
        ColorSequenceKeypoint.new(1, COLORS.Accent1)
    })
    Gradient.Parent = TopBar
    
    spawn(function()
        while TopBar.Parent do
            Tween(Gradient, TweenInfo.new(3), {Rotation = 180})
            wait(3)
            if not TopBar.Parent then break end
            Tween(Gradient, TweenInfo.new(3), {Rotation = 0})
            wait(3)
        end
    end)
    
    local LogoContainer = Instance.new("Frame")
    LogoContainer.Size = UDim2.new(0, 110, 0, 110)
    LogoContainer.Position = UDim2.new(0.5, -55, 0, 35)
    LogoContainer.BackgroundColor3 = COLORS.Secondary
    LogoContainer.BorderSizePixel = 0
    LogoContainer.Parent = Main
    
    LogoContainer.Size = UDim2.new(0, 0, 0, 0)
    Tween(LogoContainer, TweenInfo.new(0.6, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 110, 0, 110)
    })
    
    local LC = Instance.new("UICorner")
    LC.CornerRadius = UDim.new(1, 0)
    LC.Parent = LogoContainer
    
    local Ring = Instance.new("Frame")
    Ring.Size = UDim2.new(1, 20, 1, 20)
    Ring.Position = UDim2.new(0, -10, 0, -10)
    Ring.BackgroundColor3 = COLORS.Accent1
    Ring.BackgroundTransparency = 0.9
    Ring.BorderSizePixel = 0
    Ring.Parent = LogoContainer
    
    local RC = Instance.new("UICorner")
    RC.CornerRadius = UDim.new(1, 0)
    RC.Parent = Ring
    
    spawn(function()
        while LogoContainer.Parent do
            Tween(Ring, TweenInfo.new(1.5), {
                Size = UDim2.new(1, 40, 1, 40),
                Position = UDim2.new(0, -20, 0, -20),
                BackgroundTransparency = 1
            })
            wait(1.5)
            if not LogoContainer.Parent then break end
            Ring.Size = UDim2.new(1, 20, 1, 20)
            Ring.Position = UDim2.new(0, -10, 0, -10)
            Ring.BackgroundTransparency = 0.9
        end
    end)
    
    local Logo = Instance.new("TextLabel")
    Logo.Size = UDim2.new(1, 0, 1, 0)
    Logo.BackgroundTransparency = 1
    Logo.Text = "⚡"
    Logo.TextColor3 = COLORS.Accent1
    Logo.TextSize = 55
    Logo.Font = Enum.Font.GothamBlack
    Logo.Parent = LogoContainer
    
    spawn(function()
        while Logo.Parent do
            Tween(Logo, TweenInfo.new(2), {TextColor3 = COLORS.Accent3})
            wait(2)
            if not Logo.Parent then break end
            Tween(Logo, TweenInfo.new(2), {TextColor3 = COLORS.Accent1})
            wait(2)
        end
    end)
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Position = UDim2.new(0, 0, 0, 155)
    Title.BackgroundTransparency = 1
    Title.Text = "XIYZ CHEATS"
    Title.TextColor3 = COLORS.Text
    Title.TextSize = 34
    Title.Font = Enum.Font.GothamBlack
    Title.TextTransparency = 1
    Title.Parent = Main
    
    Tween(Title, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0.3), {
        TextTransparency = 0
    })
    
    local Sub = Instance.new("TextLabel")
    Sub.Size = UDim2.new(1, 0, 0, 25)
    Sub.Position = UDim2.new(0, 0, 0, 195)
    Sub.BackgroundTransparency = 1
    Sub.Text = "ENTER ACCESS KEY"
    Sub.TextColor3 = COLORS.TextDark
    Sub.TextSize = 14
    Sub.Font = Enum.Font.GothamSemibold
    Sub.TextTransparency = 1
    Sub.Parent = Main
    
    Tween(Sub, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0.5), {
        TextTransparency = 0
    })
    
    local InputContainer = Instance.new("Frame")
    InputContainer.Size = UDim2.new(0, 340, 0, 60)
    InputContainer.Position = UDim2.new(0.5, -170, 0, 250)
    InputContainer.BackgroundColor3 = COLORS.Secondary
    InputContainer.BorderSizePixel = 0
    InputContainer.Parent = Main
    
    InputContainer.Position = UDim2.new(0.5, -170, 0, 300)
    Tween(InputContainer, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0.4), {
        Position = UDim2.new(0.5, -170, 0, 250)
    })
    
    local ICC = Instance.new("UICorner")
    ICC.CornerRadius = UDim.new(0, 14)
    ICC.Parent = InputContainer
    
    local Border = Instance.new("Frame")
    Border.Size = UDim2.new(1, 6, 1, 6)
    Border.Position = UDim2.new(0, -3, 0, -3)
    Border.BackgroundColor3 = COLORS.Accent1
    Border.BorderSizePixel = 0
    Border.Parent = InputContainer
    
    local BC = Instance.new("UICorner")
    BC.CornerRadius = UDim.new(0, 16)
    BC.Parent = Border
    
    local Input = Instance.new("TextBox")
    Input.Size = UDim2.new(1, -70, 1, 0)
    Input.Position = UDim2.new(0, 15, 0, 0)
    Input.BackgroundTransparency = 1
    Input.Text = ""
    Input.PlaceholderText = "Enter key..."
    Input.TextColor3 = COLORS.Text
    Input.PlaceholderColor3 = COLORS.TextDark
    Input.TextSize = 20
    Input.Font = Enum.Font.GothamSemibold
    Input.ClearTextOnFocus = false
    Input.Parent = InputContainer
    
    local RealText = ""
    local IsHidden = true
    
    Input:GetPropertyChangedSignal("Text"):Connect(function()
        local current = Input.Text
        if current == string.rep("•", #RealText) then return end
        
        if IsHidden then
            if #current > #RealText then
                local newChar = current:sub(-1)
                RealText = RealText .. newChar
            elseif #current < #RealText then
                RealText = RealText:sub(1, #current)
            end
            Input.Text = string.rep("•", #RealText)
        else
            RealText = current
        end
    end)
    
    local EyeBtn = Instance.new("TextButton")
    EyeBtn.Size = UDim2.new(0, 40, 0, 40)
    EyeBtn.Position = UDim2.new(1, -50, 0.5, -20)
    EyeBtn.BackgroundTransparency = 1
    EyeBtn.Text = "👁️"
    EyeBtn.TextColor3 = COLORS.TextDark
    EyeBtn.TextSize = 22
    EyeBtn.Parent = InputContainer
    
    EyeBtn.MouseButton1Click:Connect(function()
        IsHidden = not IsHidden
        if IsHidden then
            EyeBtn.Text = "👁️"
            EyeBtn.TextColor3 = COLORS.TextDark
            Input.Text = string.rep("•", #RealText)
        else
            EyeBtn.Text = "👁️‍🗨️"
            EyeBtn.TextColor3 = COLORS.Accent1
            Input.Text = RealText
        end
    end)
    
    Input.Focused:Connect(function()
        Tween(InputContainer, TweenInfo.new(0.3), {BackgroundColor3 = COLORS.Background})
        Tween(Border, TweenInfo.new(0.3), {BackgroundColor3 = COLORS.Accent3})
    end)
    
    Input.FocusLost:Connect(function()
        Tween(InputContainer, TweenInfo.new(0.3), {BackgroundColor3 = COLORS.Secondary})
        Tween(Border, TweenInfo.new(0.3), {BackgroundColor3 = COLORS.Accent1})
    end)
    
    local Submit = Instance.new("TextButton")
    Submit.Size = UDim2.new(0, 340, 0, 55)
    Submit.Position = UDim2.new(0.5, -170, 0, 340)
    Submit.BackgroundColor3 = COLORS.Accent1
    Submit.Text = "AUTHENTICATE"
    Submit.TextColor3 = COLORS.Text
    Submit.TextSize = 18
    Submit.Font = Enum.Font.GothamBlack
    Submit.AutoButtonColor = false
    Submit.Parent = Main
    
    Submit.Position = UDim2.new(0.5, -170, 0, 400)
    Tween(Submit, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0.5), {
        Position = UDim2.new(0.5, -170, 0, 340)
    })
    
    local SC = Instance.new("UICorner")
    SC.CornerRadius = UDim.new(0, 14)
    SC.Parent = Submit
    
    Submit.MouseEnter:Connect(function()
        Tween(Submit, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Accent2, Size = UDim2.new(0, 350, 0, 57), Position = UDim2.new(0.5, -175, 0, 339)}):Play()
    end)
    Submit.MouseLeave:Connect(function()
        Tween(Submit, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Accent1, Size = UDim2.new(0, 340, 0, 55), Position = UDim2.new(0.5, -170, 0, 340)}):Play()
    end)
    Submit.MouseButton1Down:Connect(function()
        Ripple(Submit, Mouse.X - Submit.AbsolutePosition.X, Mouse.Y - Submit.AbsolutePosition.Y)
    end)
    
    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(1, 0, 0, 30)
    Status.Position = UDim2.new(0, 0, 0, 410)
    Status.BackgroundTransparency = 1
    Status.Text = ""
    Status.TextColor3 = COLORS.Error
    Status.TextSize = 16
    Status.Font = Enum.Font.GothamBold
    Status.Parent = Main
    
    local DiscordContainer = Instance.new("Frame")
    DiscordContainer.Size = UDim2.new(0, 280, 0, 50)
    DiscordContainer.Position = UDim2.new(0.5, -140, 0, 460)
    DiscordContainer.BackgroundColor3 = COLORS.Discord
    DiscordContainer.BorderSizePixel = 0
    DiscordContainer.Parent = Main
    
    DiscordContainer.Position = UDim2.new(0.5, -140, 0, 520)
    Tween(DiscordContainer, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0.6), {
        Position = UDim2.new(0.5, -140, 0, 460)
    })
    
    local DCC = Instance.new("UICorner")
    DCC.CornerRadius = UDim.new(0, 12)
    DCC.Parent = DiscordContainer
    
    local DiscordLogo = Instance.new("ImageLabel")
    DiscordLogo.Size = UDim2.new(0, 32, 0, 32)
    DiscordLogo.Position = UDim2.new(0, 15, 0.5, -16)
    DiscordLogo.BackgroundTransparency = 1
    DiscordLogo.Image = "rbxassetid://11156755716"
    DiscordLogo.ImageColor3 = Color3.new(1, 1, 1)
    DiscordLogo.Parent = DiscordContainer
    
    local DiscordText = Instance.new("TextLabel")
    DiscordText.Size = UDim2.new(1, -60, 1, 0)
    DiscordText.Position = UDim2.new(0, 55, 0, 0)
    DiscordText.BackgroundTransparency = 1
    DiscordText.Text = "Join our Discord!"
    DiscordText.TextColor3 = COLORS.Text
    DiscordText.TextSize = 16
    DiscordText.Font = Enum.Font.GothamBold
    DiscordText.Parent = DiscordContainer
    
    local Tooltip = Instance.new("TextLabel")
    Tooltip.Size = UDim2.new(0, 280, 0, 28)
    Tooltip.Position = UDim2.new(0.5, -140, 0, 425)
    Tooltip.BackgroundColor3 = COLORS.Background
    Tooltip.Text = "discord.gg/Kt9KRHQvK"
    Tooltip.TextColor3 = COLORS.Text
    Tooltip.TextSize = 13
    Tooltip.Font = Enum.Font.GothamBold
    Tooltip.Visible = false
    Tooltip.Parent = Main
    
    local TTC = Instance.new("UICorner")
    TTC.CornerRadius = UDim.new(0, 8)
    TTC.Parent = Tooltip
    
    DiscordContainer.MouseEnter:Connect(function()
        Tooltip.Visible = true
        Tween(DiscordContainer, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Discord:Lerp(Color3.new(1,1,1), 0.2)}):Play()
    end)
    
    DiscordContainer.MouseLeave:Connect(function()
        Tooltip.Visible = false
        Tween(DiscordContainer, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Discord}):Play()
    end)
    
    DiscordContainer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Ripple(DiscordContainer, Mouse.X - DiscordContainer.AbsolutePosition.X, Mouse.Y - DiscordContainer.AbsolutePosition.Y)
            setclipboard("https://discord.gg/Kt9KRHQvK")
            Status.TextColor3 = COLORS.Success
            Status.Text = "✓ Discord link copied!"
            wait(2)
            Status.Text = ""
        end
    end)
    
    local Attempts = 0
    local Validating = false
    
    local function Validate()
        if Validating then return end
        Validating = true
        
        if RealText:lower():gsub("%s+", "") == "xiyz" then
            Status.TextColor3 = COLORS.Success
            Status.Text = "✓ ACCESS GRANTED"
            
            Tween(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Rotation = 720
            }):Play()
            
            Tween(BG, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
            
            wait(0.6)
            KeyGui:Destroy()
            wait(0.1)
            LoadMainUI()
        else
            Attempts = Attempts + 1
            Status.Text = "✗ INVALID KEY (" .. Attempts .. "/3)"
            
            local orig = Main.Position
            for i = 1, 10 do
                Main.Position = orig + UDim2.new(0, math.random(-8, 8), 0, 0)
                wait(0.03)
            end
            Main.Position = orig
            
            Tween(Main, TweenInfo.new(0.1), {BackgroundColor3 = COLORS.Error}):Play()
            wait(0.1)
            Tween(Main, TweenInfo.new(0.3), {BackgroundColor3 = COLORS.Background}):Play()
            
            Validating = false
            
            if Attempts >= 3 then
                Status.Text = "✗ ACCESS DENIED"
                wait(1)
                LocalPlayer:Kick("Authentication Failed")
            end
        end
    end
    
    Submit.MouseButton1Click:Connect(Validate)
    Input.FocusLost:Connect(function(enterPressed)
        if enterPressed then Validate() end
    end)
end

function LoadMainUI()
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "XIYZMain"
    Gui.Parent = game.CoreGui
    
    COLORS = THEMES[Config.Settings.Theme] or THEMES.Blue
    
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 850, 0, 550)
    Main.Position = UDim2.new(0.5, -425, 0.5, -275)
    Main.BackgroundColor3 = COLORS.Background
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Parent = Gui
    
    Main.Size = UDim2.new(0, 0, 0, 0)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Tween(Main, TweenInfo.new(0.7, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 850, 0, 550),
        Position = UDim2.new(0.5, -425, 0.5, -275)
    })
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 18)
    Corner.Parent = Main
    
    local Glow = Instance.new("ImageLabel")
    Glow.Size = UDim2.new(1, 40, 1, 40)
    Glow.Position = UDim2.new(0, -20, 0, -20)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://4996893366"
    Glow.ImageColor3 = COLORS.Accent1
    Glow.ImageTransparency = 0.85
    Glow.Parent = Main
    
    spawn(function()
        while Main.Parent do
            Tween(Glow, TweenInfo.new(2), {ImageTransparency = 0.65})
            wait(2)
            if not Main.Parent then break end
            Tween(Glow, TweenInfo.new(2), {ImageTransparency = 0.85})
            wait(2)
        end
    end)
    
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 65)
    TopBar.BackgroundColor3 = COLORS.Secondary
    TopBar.BackgroundTransparency = 0.3
    TopBar.BorderSizePixel = 0
    TopBar.Parent = Main
    
    local TBC = Instance.new("UICorner")
    TBC.CornerRadius = UDim.new(0, 18)
    TBC.Parent = TopBar
    
    local Fix = Instance.new("Frame")
    Fix.Size = UDim2.new(1, 0, 0, 20)
    Fix.Position = UDim2.new(0, 0, 1, -20)
    Fix.BackgroundColor3 = COLORS.Secondary
    Fix.BackgroundTransparency = 0.3
    Fix.BorderSizePixel = 0
    Fix.Parent = TopBar
    
    local LogoIcon = Instance.new("TextLabel")
    LogoIcon.Size = UDim2.new(0, 45, 0, 45)
    LogoIcon.Position = UDim2.new(0, 20, 0, 10)
    LogoIcon.BackgroundColor3 = COLORS.Accent1
    LogoIcon.Text = "⚡"
    LogoIcon.TextColor3 = COLORS.Text
    LogoIcon.TextSize = 28
    LogoIcon.Font = Enum.Font.GothamBlack
    LogoIcon.Parent = TopBar
    
    local LIC = Instance.new("UICorner")
    LIC.CornerRadius = UDim.new(0, 12)
    LIC.Parent = LogoIcon
    
    local LogoText = Instance.new("TextLabel")
    LogoText.Size = UDim2.new(0, 100, 1, 0)
    LogoText.Position = UDim2.new(0, 75, 0, 0)
    LogoText.BackgroundTransparency = 1
    LogoText.Text = "XIYZ"
    LogoText.TextColor3 = COLORS.Text
    LogoText.TextSize = 32
    LogoText.Font = Enum.Font.GothamBlack
    LogoText.Parent = TopBar
    
    local Ver = Instance.new("TextLabel")
    Ver.Size = UDim2.new(0, 55, 0, 24)
    Ver.Position = UDim2.new(0, 175, 0, 20)
    Ver.BackgroundColor3 = COLORS.Accent1
    Ver.Text = "v14.0"
    Ver.TextColor3 = COLORS.Text
    Ver.TextSize = 14
    Ver.Font = Enum.Font.GothamBold
    Ver.Parent = TopBar
    
    local VC = Instance.new("UICorner")
    VC.CornerRadius = UDim.new(0, 12)
    VC.Parent = Ver
    
    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 38, 0, 38)
    MinBtn.Position = UDim2.new(1, -95, 0, 13)
    MinBtn.BackgroundColor3 = COLORS.Warning
    MinBtn.Text = "−"
    MinBtn.TextColor3 = COLORS.Text
    MinBtn.TextSize = 24
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.Parent = TopBar
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 38, 0, 38)
    CloseBtn.Position = UDim2.new(1, -50, 0, 13)
    CloseBtn.BackgroundColor3 = COLORS.Error
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = COLORS.Text
    CloseBtn.TextSize = 26
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Parent = TopBar
    
    for _, btn in pairs({MinBtn, CloseBtn}) do
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 10)
        c.Parent = btn
    end
    
    local DiscordContainer = Instance.new("Frame")
    DiscordContainer.Size = UDim2.new(0, 50, 0, 35)
    DiscordContainer.Position = UDim2.new(1, -160, 0, 15)
    DiscordContainer.BackgroundColor3 = COLORS.Discord
    DiscordContainer.BorderSizePixel = 0
    DiscordContainer.Parent = TopBar
    
    local DCC = Instance.new("UICorner")
    DCC.CornerRadius = UDim.new(0, 8)
    DCC.Parent = DiscordContainer
    
    local DiscordLogo = Instance.new("ImageLabel")
    DiscordLogo.Size = UDim2.new(0, 24, 0, 24)
    DiscordLogo.Position = UDim2.new(0.5, -12, 0.5, -12)
    DiscordLogo.BackgroundTransparency = 1
    DiscordLogo.Image = "rbxassetid://11156755716"
    DiscordLogo.ImageColor3 = Color3.new(1, 1, 1)
    DiscordLogo.Parent = DiscordContainer
    
    local DiscordTooltip = Instance.new("TextLabel")
    DiscordTooltip.Size = UDim2.new(0, 200, 0, 30)
    DiscordTooltip.Position = UDim2.new(1, -235, 0, 52)
    DiscordTooltip.BackgroundColor3 = COLORS.Background
    DiscordTooltip.Text = "discord.gg/Kt9KRHQvK"
    DiscordTooltip.TextColor3 = COLORS.Text
    DiscordTooltip.TextSize = 12
    DiscordTooltip.Font = Enum.Font.GothamBold
    DiscordTooltip.Visible = false
    DiscordTooltip.Parent = TopBar
    
    local DTTC = Instance.new("UICorner")
    DTTC.CornerRadius = UDim.new(0, 8)
    DTTC.Parent = DiscordTooltip
    
    local DiscordTextLabel = nil
    
    DiscordContainer.MouseEnter:Connect(function()
        DiscordTooltip.Visible = true
        Tween(DiscordContainer, TweenInfo.new(0.2), {Size = UDim2.new(0, 180, 0, 35), Position = UDim2.new(1, -240, 0, 15)}):Play()
        
        DiscordTextLabel = Instance.new("TextLabel")
        DiscordTextLabel.Name = "DiscordText"
        DiscordTextLabel.Size = UDim2.new(1, -40, 1, 0)
        DiscordTextLabel.Position = UDim2.new(0, 40, 0, 0)
        DiscordTextLabel.BackgroundTransparency = 1
        DiscordTextLabel.Text = "Join Discord"
        DiscordTextLabel.TextColor3 = COLORS.Text
        DiscordTextLabel.TextSize = 13
        DiscordTextLabel.Font = Enum.Font.GothamBold
        DiscordTextLabel.Parent = DiscordContainer
    end)
    
    DiscordContainer.MouseLeave:Connect(function()
        DiscordTooltip.Visible = false
        Tween(DiscordContainer, TweenInfo.new(0.2), {Size = UDim2.new(0, 50, 0, 35), Position = UDim2.new(1, -160, 0, 15)}):Play()
        
        if DiscordTextLabel then
            DiscordTextLabel:Destroy()
            DiscordTextLabel = nil
        end
    end)
    
    DiscordContainer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            setclipboard("https://discord.gg/Kt9KRHQvK")
            DiscordTooltip.Text = "✓ Copied!"
            wait(1)
            DiscordTooltip.Text = "discord.gg/Kt9KRHQvK"
        end
    end)
    
    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 180, 1, -65)
    Sidebar.Position = UDim2.new(0, 0, 0, 65)
    Sidebar.BackgroundColor3 = COLORS.Secondary
    Sidebar.BackgroundTransparency = 0.5
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = Main
    
    local SC = Instance.new("UICorner")
    SC.CornerRadius = UDim.new(0, 0)
    SC.Parent = Sidebar
    
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Size = UDim2.new(1, -200, 1, -85)
    ContentContainer.Position = UDim2.new(0, 190, 0, 75)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Parent = Main
    
    local Tabs = {"Aimbot", "ESP", "Movement", "Weapon", "Player", "Misc", "Settings"}
    local TabBtns = {}
    local TabContents = {}
    local Icons = {Aimbot = "🎯", ESP = "👁️", Movement = "🏃", Weapon = "🔫", Player = "👤", Misc = "⚙️", Settings = "🔧"}
    
    for i, name in ipairs(Tabs) do
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(1, -20, 0, 48)
        Btn.Position = UDim2.new(0, 10, 0, (i-1) * 58 + 15)
        Btn.BackgroundColor3 = name == "Aimbot" and COLORS.Accent1 or COLORS.Background
        Btn.BackgroundTransparency = name == "Aimbot" and 0 or 0.6
        Btn.Text = ""
        Btn.AutoButtonColor = false
        Btn.Parent = Sidebar
        
        local BC = Instance.new("UICorner")
        BC.CornerRadius = UDim.new(0, 12)
        BC.Parent = Btn
        
        local Icon = Instance.new("TextLabel")
        Icon.Size = UDim2.new(0, 38, 0, 38)
        Icon.Position = UDim2.new(0, 8, 0.5, -19)
        Icon.BackgroundColor3 = name == "Aimbot" and COLORS.Accent2 or COLORS.Accent1
        Icon.Text = Icons[name]
        Icon.TextColor3 = COLORS.Text
        Icon.TextSize = 20
        Icon.Font = Enum.Font.GothamBlack
        Icon.Parent = Btn
        
        local IC = Instance.new("UICorner")
        IC.CornerRadius = UDim.new(0, 10)
        IC.Parent = Icon
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1, -60, 1, 0)
        Label.Position = UDim2.new(0, 55, 0, 0)
        Label.BackgroundTransparency = 1
        Label.Text = name
        Label.TextColor3 = COLORS.Text
        Label.TextSize = 16
        Label.Font = Enum.Font.GothamBold
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = Btn
        
        TabBtns[name] = {Btn = Btn, Icon = Icon}
        
        local Content = Instance.new("ScrollingFrame")
        Content.Name = name .. "Content"
        Content.Size = UDim2.new(1, 0, 1, 0)
        Content.BackgroundTransparency = 1
        Content.BorderSizePixel = 0
        Content.ScrollBarThickness = 6
        Content.ScrollBarImageColor3 = COLORS.Accent1
        Content.Visible = name == "Aimbot"
        Content.CanvasSize = UDim2.new(0, 0, 0, 1200)
        Content.Parent = ContentContainer
        
        TabContents[name] = Content
        
        Btn.MouseButton1Click:Connect(function()
            if State.CurrentTab == name then return end
            
            local oldContent = TabContents[State.CurrentTab]
            Tween(oldContent, TweenInfo.new(0.2), {Position = UDim2.new(0.02, 0, 0, 0)})
            wait(0.1)
            oldContent.Visible = false
            
            for n, data in pairs(TabBtns) do
                Tween(data.Btn, TweenInfo.new(0.3), {BackgroundColor3 = COLORS.Background, BackgroundTransparency = 0.6})
                Tween(data.Icon, TweenInfo.new(0.3), {BackgroundColor3 = COLORS.Accent1})
            end
            
            Tween(Btn, TweenInfo.new(0.3), {BackgroundColor3 = COLORS.Accent1, BackgroundTransparency = 0})
            Tween(Icon, TweenInfo.new(0.3), {BackgroundColor3 = COLORS.Accent2})
            
            Content.Position = UDim2.new(-0.02, 0, 0, 0)
            Content.Visible = true
            Tween(Content, TweenInfo.new(0.3), {Position = UDim2.new(0, 0, 0, 0)})
            
            State.CurrentTab = name
        end)
    end
    
    local function CreateToggle(parent, text, config, key, yPos, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, -20, 0, 58)
        Frame.Position = UDim2.new(0, 10, 0, yPos)
        Frame.BackgroundColor3 = COLORS.Secondary
        Frame.BackgroundTransparency = 0.2
        Frame.BorderSizePixel = 0
        Frame.Parent = parent
        
        local FC = Instance.new("UICorner")
        FC.CornerRadius = UDim.new(0, 12)
        FC.Parent = Frame
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0.6, 0, 1, 0)
        Label.Position = UDim2.new(0, 18, 0, 0)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.TextColor3 = COLORS.Text
        Label.TextSize = 15
        Label.Font = Enum.Font.GothamSemibold
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = Frame
        
        local Switch = Instance.new("TextButton")
        Switch.Size = UDim2.new(0, 58, 0, 30)
        Switch.Position = UDim2.new(1, -78, 0.5, -15)
        Switch.BackgroundColor3 = config[key] and COLORS.Accent1 or COLORS.Background
        Switch.Text = ""
        Switch.AutoButtonColor = false
        Switch.Parent = Frame
        
        local SC = Instance.new("UICorner")
        SC.CornerRadius = UDim.new(1, 0)
        SC.Parent = Switch
        
        local Circle = Instance.new("Frame")
        Circle.Size = UDim2.new(0, 24, 0, 24)
        Circle.Position = config[key] and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)
        Circle.BackgroundColor3 = COLORS.Text
        Circle.BorderSizePixel = 0
        Circle.Parent = Switch
        
        local CC = Instance.new("UICorner")
        CC.CornerRadius = UDim.new(1, 0)
        CC.Parent = Circle
        
        local Status = Instance.new("TextLabel")
        Status.Size = UDim2.new(0, 40, 1, 0)
        Status.Position = UDim2.new(1, -38, 0, 0)
        Status.BackgroundTransparency = 1
        Status.Text = config[key] and "ON" or "OFF"
        Status.TextColor3 = config[key] and COLORS.Success or COLORS.TextDark
        Status.TextSize = 13
        Status.Font = Enum.Font.GothamBold
        Status.Parent = Frame
        
        Switch.MouseButton1Click:Connect(function()
            config[key] = not config[key]
            
            Tween(Circle, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                Position = config[key] and UDim2.new(1, -27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)
            })
            
            Tween(Switch, TweenInfo.new(0.25), {
                BackgroundColor3 = config[key] and COLORS.Accent1 or COLORS.Background
            })
            
            Status.Text = config[key] and "ON" or "OFF"
            Status.TextColor3 = config[key] and COLORS.Success or COLORS.TextDark
            
            if callback then callback(config[key]) end
        end)
        
        return Frame
    end
    
    local function CreateSlider(parent, text, config, key, min, max, yPos, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, -20, 0, 80)
        Frame.Position = UDim2.new(0, 10, 0, yPos)
        Frame.BackgroundColor3 = COLORS.Secondary
        Frame.BackgroundTransparency = 0.2
        Frame.BorderSizePixel = 0
        Frame.Parent = parent
        
        local FC = Instance.new("UICorner")
        FC.CornerRadius = UDim.new(0, 12)
        FC.Parent = Frame
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0.5, 0, 0, 30)
        Label.Position = UDim2.new(0, 18, 0, 10)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.TextColor3 = COLORS.Text
        Label.TextSize = 15
        Label.Font = Enum.Font.GothamSemibold
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = Frame
        
        local ValueBox = Instance.new("TextLabel")
        ValueBox.Size = UDim2.new(0, 80, 0, 30)
        ValueBox.Position = UDim2.new(1, -95, 0, 10)
        ValueBox.BackgroundColor3 = COLORS.Background
        ValueBox.Text = tostring(config[key])
        ValueBox.TextColor3 = COLORS.Accent1
        ValueBox.TextSize = 14
        ValueBox.Font = Enum.Font.GothamBold
        ValueBox.Parent = Frame
        
        local VBC = Instance.new("UICorner")
        VBC.CornerRadius = UDim.new(0, 8)
        VBC.Parent = ValueBox
        
        local SliderBG = Instance.new("Frame")
        SliderBG.Size = UDim2.new(1, -36, 0, 10)
        SliderBG.Position = UDim2.new(0, 18, 0, 52)
        SliderBG.BackgroundColor3 = COLORS.Background
        SliderBG.BorderSizePixel = 0
        SliderBG.Parent = Frame
        
        local SBC = Instance.new("UICorner")
        SBC.CornerRadius = UDim.new(0, 5)
        SBC.Parent = SliderBG
        
        local percent = (config[key] - min) / (max - min)
        
        local Fill = Instance.new("Frame")
        Fill.Size = UDim2.new(percent, 0, 1, 0)
        Fill.BackgroundColor3 = COLORS.Accent1
        Fill.BorderSizePixel = 0
        Fill.Parent = SliderBG
        
        local FC2 = Instance.new("UICorner")
        FC2.CornerRadius = UDim.new(0, 5)
        FC2.Parent = Fill
        
        local Knob = Instance.new("Frame")
        Knob.Size = UDim2.new(0, 22, 0, 22)
        Knob.Position = UDim2.new(percent, -11, 0.5, -11)
        Knob.BackgroundColor3 = COLORS.Text
        Knob.BorderSizePixel = 0
        Knob.Parent = SliderBG
        
        local KC = Instance.new("UICorner")
        KC.CornerRadius = UDim.new(1, 0)
        KC.Parent = Knob
        
        local dragging = false
        
        SliderBG.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local pos = math.clamp((input.Position.X - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X, 0, 1)
                local val = min + (max - min) * pos
                
                if key == "Smoothness" or key == "Prediction" or key == "ClickSpeed" then
                    val = math.floor(val * 100) / 100
                else
                    val = math.floor(val)
                end
                
                config[key] = val
                ValueBox.Text = tostring(val)
                Fill.Size = UDim2.new(pos, 0, 1, 0)
                Knob.Position = UDim2.new(pos, -11, 0.5, -11)
                
                if callback then callback(val) end
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        return Frame
    end
    
    local function CreateButton(parent, text, yPos, callback)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(1, -20, 0, 52)
        Btn.Position = UDim2.new(0, 10, 0, yPos)
        Btn.BackgroundColor3 = COLORS.Accent1
        Btn.Text = text
        Btn.TextColor3 = COLORS.Text
        Btn.TextSize = 15
        Btn.Font = Enum.Font.GothamBold
        Btn.AutoButtonColor = false
        Btn.Parent = parent
        
        local BC = Instance.new("UICorner")
        BC.CornerRadius = UDim.new(0, 12)
        BC.Parent = Btn
        
        Btn.MouseEnter:Connect(function()
            Tween(Btn, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Accent2})
        end)
        Btn.MouseLeave:Connect(function()
            Tween(Btn, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Accent1})
        end)
        
        Btn.MouseButton1Click:Connect(function()
            Ripple(Btn, Mouse.X - Btn.AbsolutePosition.X, Mouse.Y - Btn.AbsolutePosition.Y)
            if callback then callback() end
        end)
        
        return Btn
    end
    
    local function CreateDropdown(parent, text, options, config, key, yPos, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, -20, 0, 58)
        Frame.Position = UDim2.new(0, 10, 0, yPos)
        Frame.BackgroundColor3 = COLORS.Secondary
        Frame.BackgroundTransparency = 0.2
        Frame.BorderSizePixel = 0
        Frame.Parent = parent
        
        local FC = Instance.new("UICorner")
        FC.CornerRadius = UDim.new(0, 12)
        FC.Parent = Frame
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0.4, 0, 1, 0)
        Label.Position = UDim2.new(0, 18, 0, 0)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.TextColor3 = COLORS.Text
        Label.TextSize = 15
        Label.Font = Enum.Font.GothamSemibold
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = Frame
        
        local DropdownBtn = Instance.new("TextButton")
        DropdownBtn.Size = UDim2.new(0, 180, 0, 38)
        DropdownBtn.Position = UDim2.new(1, -195, 0.5, -19)
        DropdownBtn.BackgroundColor3 = COLORS.Background
        DropdownBtn.Text = config[key]
        DropdownBtn.TextColor3 = COLORS.Text
        DropdownBtn.TextSize = 14
        DropdownBtn.Font = Enum.Font.Gotham
        DropdownBtn.Parent = Frame
        
        local DBC = Instance.new("UICorner")
        DBC.CornerRadius = UDim.new(0, 10)
        DBC.Parent = DropdownBtn
        
        local Arrow = Instance.new("TextLabel")
        Arrow.Size = UDim2.new(0, 25, 1, 0)
        Arrow.Position = UDim2.new(1, -30, 0, 0)
        Arrow.BackgroundTransparency = 1
        Arrow.Text = "▼"
        Arrow.TextColor3 = COLORS.TextDark
        Arrow.TextSize = 14
        Arrow.Font = Enum.Font.GothamBold
        Arrow.Parent = DropdownBtn
        
        local OptionsFrame = Instance.new("Frame")
        OptionsFrame.Size = UDim2.new(1, 0, 0, 0)
        OptionsFrame.Position = UDim2.new(0, 0, 1, 5)
        OptionsFrame.BackgroundColor3 = COLORS.Background
        OptionsFrame.BorderSizePixel = 0
        OptionsFrame.ClipsDescendants = true
        OptionsFrame.Visible = false
        OptionsFrame.ZIndex = 10
        OptionsFrame.Parent = DropdownBtn
        
        local OFC = Instance.new("UICorner")
        OFC.CornerRadius = UDim.new(0, 10)
        OFC.Parent = OptionsFrame
        
        for i, opt in ipairs(options) do
            local OptBtn = Instance.new("TextButton")
            OptBtn.Size = UDim2.new(1, 0, 0, 32)
            OptBtn.Position = UDim2.new(0, 0, 0, (i-1) * 32)
            OptBtn.BackgroundColor3 = i % 2 == 0 and COLORS.Secondary or COLORS.Background
            OptBtn.Text = opt
            OptBtn.TextColor3 = COLORS.Text
            OptBtn.TextSize = 13
            OptBtn.Font = Enum.Font.Gotham
            OptBtn.ZIndex = 11
            OptBtn.Parent = OptionsFrame
            
            OptBtn.MouseButton1Click:Connect(function()
                config[key] = opt
                DropdownBtn.Text = opt
                
                if key == "Theme" and THEMES[opt] then
                    COLORS = THEMES[opt]
                    Main.BackgroundColor3 = COLORS.Background
                    TopBar.BackgroundColor3 = COLORS.Secondary
                    Fix.BackgroundColor3 = COLORS.Secondary
                    Sidebar.BackgroundColor3 = COLORS.Secondary
                    for _, data in pairs(TabBtns) do
                        if data.Btn.BackgroundTransparency > 0.5 then
                            data.Btn.BackgroundColor3 = COLORS.Background
                        else
                            data.Btn.BackgroundColor3 = COLORS.Accent1
                        end
                        data.Icon.BackgroundColor3 = COLORS.Accent1
                    end
                    Glow.ImageColor3 = COLORS.Accent1
                    if TabBtns[State.CurrentTab] then
                        TabBtns[State.CurrentTab].Btn.BackgroundColor3 = COLORS.Accent1
                        TabBtns[State.CurrentTab].Icon.BackgroundColor3 = COLORS.Accent2
                    end
                end
                
                Tween(OptionsFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)}):Play()
                OptionsFrame.Visible = false
                Arrow.Text = "▼"
                if callback then callback(opt) end
            end)
        end
        
        local open = false
        DropdownBtn.MouseButton1Click:Connect(function()
            open = not open
            if open then
                OptionsFrame.Visible = true
                Tween(OptionsFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                    Size = UDim2.new(1, 0, 0, math.min(#options * 32, 160))
                }):Play()
                Arrow.Text = "▲"
            else
                Tween(OptionsFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)}):Play()
                wait(0.2)
                OptionsFrame.Visible = false
                Arrow.Text = "▼"
            end
        end)
        
        return Frame
    end
    
    local function FillAimbot()
        local y = 15
        
        local ModeFrame = Instance.new("Frame")
        ModeFrame.Size = UDim2.new(1, -20, 0, 70)
        ModeFrame.Position = UDim2.new(0, 10, 0, y)
        ModeFrame.BackgroundColor3 = COLORS.Secondary
        ModeFrame.BackgroundTransparency = 0.2
        ModeFrame.BorderSizePixel = 0
        ModeFrame.Parent = TabContents.Aimbot
        
        local MFC = Instance.new("UICorner")
        MFC.CornerRadius = UDim.new(0, 12)
        MFC.Parent = ModeFrame
        
        local ModeLabel = Instance.new("TextLabel")
        ModeLabel.Size = UDim2.new(1, 0, 0, 25)
        ModeLabel.Position = UDim2.new(0, 0, 0, 8)
        ModeLabel.BackgroundTransparency = 1
        ModeLabel.Text = "AIMBOT MODE"
        ModeLabel.TextColor3 = COLORS.TextDark
        ModeLabel.TextSize = 12
        ModeLabel.Font = Enum.Font.GothamBold
        ModeLabel.Parent = ModeFrame
        
        local RageBtn = Instance.new("TextButton")
        RageBtn.Size = UDim2.new(0, 140, 0, 32)
        RageBtn.Position = UDim2.new(0.5, -145, 0, 32)
        RageBtn.BackgroundColor3 = Config.Aimbot.AimbotMode == "Rage" and COLORS.Accent1 or COLORS.Background
        RageBtn.Text = "🔥 RAGE"
        RageBtn.TextColor3 = COLORS.Text
        RageBtn.TextSize = 14
        RageBtn.Font = Enum.Font.GothamBold
        RageBtn.Parent = ModeFrame
        
        local RBC = Instance.new("UICorner")
        RBC.CornerRadius = UDim.new(0, 8)
        RBC.Parent = RageBtn
        
        local LegitBtn = Instance.new("TextButton")
        LegitBtn.Size = UDim2.new(0, 140, 0, 32)
        LegitBtn.Position = UDim2.new(0.5, 5, 0, 32)
        LegitBtn.BackgroundColor3 = Config.Aimbot.AimbotMode == "Legit" and COLORS.Accent1 or COLORS.Background
        LegitBtn.Text = "🎯 LEGIT"
        LegitBtn.TextColor3 = COLORS.Text
        LegitBtn.TextSize = 14
        LegitBtn.Font = Enum.Font.GothamBold
        LegitBtn.Parent = ModeFrame
        
        local LBC = Instance.new("UICorner")
        LBC.CornerRadius = UDim.new(0, 8)
        LBC.Parent = LegitBtn
        
        local function SetMode(mode)
            Config.Aimbot.AimbotMode = mode
            if mode == "Rage" then
                Tween(RageBtn, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Accent1})
                Tween(LegitBtn, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Background})
            else
                Tween(RageBtn, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Background})
                Tween(LegitBtn, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.Accent1})
            end
        end
        
        RageBtn.MouseButton1Click:Connect(function() SetMode("Rage") end)
        LegitBtn.MouseButton1Click:Connect(function() SetMode("Legit") end)
        
        y = y + 80
        
        CreateDropdown(TabContents.Aimbot, "Target Part", {"Head", "HumanoidRootPart", "Torso"}, Config.Aimbot, "Mode", y)
        y = y + 78
        CreateToggle(TabContents.Aimbot, "Enable Aimbot", Config.Aimbot, "Enabled", y)
        y = y + 68
        CreateToggle(TabContents.Aimbot, "Show FOV (Legit)", Config.Aimbot, "ShowFOV", y)
        y = y + 78
        
        local RageLabel = Instance.new("TextLabel")
        RageLabel.Size = UDim2.new(1, -20, 0, 30)
        RageLabel.Position = UDim2.new(0, 10, 0, y)
        RageLabel.BackgroundColor3 = COLORS.Error
        RageLabel.BackgroundTransparency = 0.8
        RageLabel.Text = "🔥 RAGE SETTINGS (Hold SHIFT)"
        RageLabel.TextColor3 = COLORS.Text
        RageLabel.TextSize = 14
        RageLabel.Font = Enum.Font.GothamBold
        RageLabel.Parent = TabContents.Aimbot
        
        local RLC = Instance.new("UICorner")
        RLC.CornerRadius = UDim.new(0, 8)
        RLC.Parent = RageLabel
        
        y = y + 40
        CreateSlider(TabContents.Aimbot, "Rage FOV", Config.Aimbot, "RageFOV", 100, 2000, y)
        y = y + 90
        
        local LegitLabel = Instance.new("TextLabel")
        LegitLabel.Size = UDim2.new(1, -20, 0, 30)
        LegitLabel.Position = UDim2.new(0, 10, 0, y)
        LegitLabel.BackgroundColor3 = COLORS.Success
        LegitLabel.BackgroundTransparency = 0.8
        LegitLabel.Text = "🎯 LEGIT SETTINGS (Hold RMB)"
        LegitLabel.TextColor3 = COLORS.Text
        LegitLabel.TextSize = 14
        LegitLabel.Font = Enum.Font.GothamBold
        LegitLabel.Parent = TabContents.Aimbot
        
        local LLC = Instance.new("UICorner")
        LLC.CornerRadius = UDim.new(0, 8)
        LLC.Parent = LegitLabel
        
        y = y + 40
        CreateSlider(TabContents.Aimbot, "Legit Smoothness", Config.Aimbot, "LegitSmoothness", 0.01, 1, y)
        y = y + 90
        CreateSlider(TabContents.Aimbot, "Legit FOV", Config.Aimbot, "LegitFOV", 30, 500, y)
        y = y + 90
        CreateSlider(TabContents.Aimbot, "Prediction", Config.Aimbot, "LegitPrediction", 0, 0.5, y)
        y = y + 90
        CreateToggle(TabContents.Aimbot, "Team Check", Config.Aimbot, "TeamCheck", y)
        y = y + 68
        CreateToggle(TabContents.Aimbot, "Visibility Check (Legit)", Config.Aimbot, "VisibilityCheck", y)
    end
    
    local function FillESP()
        local y = 15
        CreateToggle(TabContents.ESP, "Enable ESP", Config.ESP, "Enabled", y)
        y = y + 68
        CreateToggle(TabContents.ESP, "Boxes", Config.ESP, "Boxes", y)
        y = y + 68
        CreateToggle(TabContents.ESP, "Filled Boxes", Config.ESP, "BoxesFilled", y)
        y = y + 68
        CreateToggle(TabContents.ESP, "Names", Config.ESP, "Names", y)
        y = y + 68
        CreateToggle(TabContents.ESP, "Distance", Config.ESP, "Distance", y)
        y = y + 68
        CreateToggle(TabContents.ESP, "Health Bar", Config.ESP, "HealthBar", y)
        y = y + 68
        CreateToggle(TabContents.ESP, "Health Text", Config.ESP, "HealthText", y)
        y = y + 68
        CreateToggle(TabContents.ESP, "Tracers", Config.ESP, "Tracers", y)
        y = y + 68
        CreateToggle(TabContents.ESP, "Team Color", Config.ESP, "TeamColor", y)
        y = y + 78
        CreateSlider(TabContents.ESP, "Max Distance", Config.ESP, "MaxDistance", 100, 5000, y)
    end
    
    local function FillMovement()
        local y = 15
        CreateToggle(TabContents.Movement, "Speed Hack", Config.Movement, "SpeedHack", y, function(val)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = val and Config.Movement.SpeedValue or 16
            end
        end)
        y = y + 68
        CreateSlider(TabContents.Movement, "Speed Value", Config.Movement, "SpeedValue", 16, 500, y, function(val)
            if Config.Movement.SpeedHack and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = val
            end
        end)
        y = y + 90
        CreateToggle(TabContents.Movement, "Fly (F)", Config.Movement, "Fly", y)
        y = y + 68
        CreateSlider(TabContents.Movement, "Fly Speed", Config.Movement, "FlySpeed", 10, 200, y)
        y = y + 90
        CreateToggle(TabContents.Movement, "NoClip (V)", Config.Movement, "NoClip", y)
        y = y + 68
        CreateToggle(TabContents.Movement, "Infinite Jump", Config.Movement, "InfiniteJump", y)
        y = y + 68
        CreateToggle(TabContents.Movement, "Bunny Hop", Config.Movement, "BunnyHop", y)
    end
    
    local function FillWeapon()
        local y = 15
        CreateToggle(TabContents.Weapon, "No Recoil", Config.Weapon, "NoRecoil", y)
        y = y + 68
        CreateToggle(TabContents.Weapon, "No Spread", Config.Weapon, "NoSpread", y)
        y = y + 68
        CreateToggle(TabContents.Weapon, "Rapid Fire", Config.Weapon, "RapidFire", y)
        y = y + 68
        CreateToggle(TabContents.Weapon, "Instant Reload", Config.Weapon, "InstantReload", y)
        y = y + 68
        CreateToggle(TabContents.Weapon, "Infinite Ammo", Config.Weapon, "InfiniteAmmo", y)
    end
    
    local function FillPlayer()
        local y = 15
        CreateToggle(TabContents.Player, "God Mode", Config.Player, "GodMode", y)
        y = y + 68
        CreateToggle(TabContents.Player, "Anti AFK", Config.Player, "AntiAFK", y)
        y = y + 68
        CreateToggle(TabContents.Player, "Full Bright", Config.Player, "FullBright", y, function(val)
            Lighting.Brightness = val and 10 or 1
            Lighting.GlobalShadows = not val
        end)
        y = y + 68
        CreateToggle(TabContents.Player, "FOV Changer", Config.Player, "FOVChanger", y, function(val)
            Camera.FieldOfView = val and Config.Player.FOVValue or 70
        end)
        y = y + 78
        CreateSlider(TabContents.Player, "FOV Value", Config.Player, "FOVValue", 30, 150, y, function(val)
            if Config.Player.FOVChanger then Camera.FieldOfView = val end
        end)
    end
    
    local function FillMisc()
        local y = 15
        CreateToggle(TabContents.Misc, "Auto Farm", Config.Misc, "AutoFarm", y)
        y = y + 68
        CreateToggle(TabContents.Misc, "Click TP", Config.Misc, "ClickTP", y)
        y = y + 68
        CreateToggle(TabContents.Misc, "Auto Click", Config.Misc, "AutoClick", y)
        y = y + 78
        CreateSlider(TabContents.Misc, "Click Speed", Config.Misc, "ClickSpeed", 0.01, 1, y)
        y = y + 95
        CreateButton(TabContents.Misc, "Rejoin Server", y, function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
        y = y + 62
        CreateButton(TabContents.Misc, "Server Hop", y, function()
            local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            for _, s in ipairs(servers.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id)
                    break
                end
            end
        end)
    end
    
    local function FillSettings()
        local y = 15
        CreateDropdown(TabContents.Settings, "Theme", {"Blue", "Red", "Green", "Purple", "Orange", "Black"}, Config.Settings, "Theme", y)
        y = y + 78
        CreateToggle(TabContents.Settings, "Notifications", Config.Settings, "Notifications", y)
        y = y + 68
        CreateToggle(TabContents.Settings, "Sounds", Config.Settings, "Sounds", y)
        y = y + 78
        CreateButton(TabContents.Settings, "Destroy UI", y, function()
            Gui:Destroy()
            for _, drawings in pairs(ESP.Drawings) do
                for _, d in pairs(drawings) do
                    if d and d.Remove then d:Remove() end
                end
            end
            if Aimbot.FOVDrawing then Aimbot.FOVDrawing:Remove() end
        end)
    end
    
    FillAimbot()
    FillESP()
    FillMovement()
    FillWeapon()
    FillPlayer()
    FillMisc()
    FillSettings()
    
    local minimized = false
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Tween(Main, TweenInfo.new(0.4), {Size = UDim2.new(0, 850, 0, 65)}):Play()
        else
            Tween(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Size = UDim2.new(0, 850, 0, 550)}):Play()
        end
    end)
    
    CloseBtn.MouseButton1Click:Connect(function()
        Tween(Main, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Wait()
        Gui:Destroy()
        for _, drawings in pairs(ESP.Drawings) do
            for _, d in pairs(drawings) do
                if d and d.Remove then d:Remove() end
            end
        end
        if Aimbot.FOVDrawing then Aimbot.FOVDrawing:Remove() end
    end)
    
    local dragStart, startPos, dragging
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Config.Settings.MenuKey then
            State.IsOpen = not State.IsOpen
            Main.Visible = State.IsOpen
            
        elseif input.UserInputType == Enum.UserInputType.MouseButton2 and Config.Aimbot.Enabled then
            if Config.Aimbot.AimbotMode == "Legit" then
                State.IsAimingLegit = true
            end
            
        elseif input.KeyCode == Enum.KeyCode.LeftShift and Config.Aimbot.Enabled then
            State.IsAimingRage = true
            
        elseif input.KeyCode == Enum.KeyCode.F and Config.Movement.Fly then
            State.FlyEnabled = not State.FlyEnabled
            if State.FlyEnabled then
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local bg = Instance.new("BodyGyro")
                    bg.P = 9e4
                    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                    bg.CFrame = char.HumanoidRootPart.CFrame
                    bg.Parent = char.HumanoidRootPart
                    
                    local bp = Instance.new("BodyPosition")
                    bp.P = 9e9
                    bp.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    bp.Position = char.HumanoidRootPart.Position
                    bp.Parent = char.HumanoidRootPart
                    
                    State.FlyBodyGyro = bg
                    State.FlyBodyPos = bp
                end
            else
                if State.FlyBodyGyro then State.FlyBodyGyro:Destroy() end
                if State.FlyBodyPos then State.FlyBodyPos:Destroy() end
            end
            
        elseif input.KeyCode == Enum.KeyCode.V then
            Config.Movement.NoClip = not Config.Movement.NoClip
            State.NoClipEnabled = Config.Movement.NoClip
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            State.IsAimingLegit = false
        elseif input.KeyCode == Enum.KeyCode.LeftShift then
            State.IsAimingRage = false
        end
    end)
    
    RunService.RenderStepped:Connect(function()
        if State.FlyEnabled and State.FlyBodyPos and State.FlyBodyGyro then
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local camCF = Camera.CFrame
                local moveDir = Vector3.new(0, 0, 0)
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveDir = moveDir + camCF.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveDir = moveDir - camCF.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveDir = moveDir - camCF.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveDir = moveDir + camCF.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveDir = moveDir + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveDir = moveDir - Vector3.new(0, 1, 0)
                end
                
                if moveDir.Magnitude > 0 then
                    moveDir = moveDir.Unit * Config.Movement.FlySpeed
                end
                
                State.FlyBodyPos.Position = hrp.Position + moveDir
                State.FlyBodyGyro.CFrame = camCF
            end
        end
        
        if State.NoClipEnabled and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
        
        ESP:Update()
        Aimbot:Update()
    end)
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if Config.Movement.InfiniteJump and input.KeyCode == Enum.KeyCode.Space then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
    
    spawn(function()
        while wait(0.1) do
            if Config.Movement.BunnyHop and LocalPlayer.Character then
                local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
                if hum and hum.FloorMaterial ~= Enum.Material.Air then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end
    end)
    
    LocalPlayer.Idled:Connect(function()
        if Config.Player.AntiAFK then
            VirtualUser:Button2Down(Vector2.new(0,0), Camera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0,0), Camera.CFrame)
        end
    end)
    
    Mouse.Button1Down:Connect(function()
        if Config.Misc.ClickTP and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 5, 0))
            end
        end
    end)
    
    spawn(function()
        while wait(Config.Misc.ClickSpeed) do
            if Config.Misc.AutoClick then
                mouse1click()
            end
        end
    end)
    
    print("XIYZ v14.0 Loaded!")
    print("RAGE: Hold SHIFT | LEGIT: Hold RMB")
end

CreateKeySystem()
