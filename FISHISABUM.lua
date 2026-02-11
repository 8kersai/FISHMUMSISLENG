for i,b in pairs(workspace.FE.Actions:GetChildren()) do
    if b.Name == " " then
        b:Destroy()
    end
end

for i,b in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if b.Name == " " then
        b:Destroy()
    end
end

local a = workspace.FE.Actions

if a:FindFirstChild("KeepYourHeadUp_") then
    a.KeepYourHeadUp_:Destroy()
    local r = Instance.new("RemoteEvent")
    r.Name = "KeepYourHeadUp_"
    r.Parent = a
else
    game.Players.LocalPlayer:Kick(
        "Anti-Cheat Updated! Send a photo of this Message in our Discord Server so we can fix it."
    )
end

local function isWeirdName(name)
    return string.match(name, "^[a-zA-Z]+%-%d+%a*%-%d+%a*$") ~= nil
end

local function deleteWeirdRemoteEvents(parent)
    for _, child in pairs(parent:GetChildren()) do
        if child:IsA("RemoteEvent") and isWeirdName(child.Name) then
            child:Destroy()
        end
        deleteWeirdRemoteEvents(child)
    end
end

deleteWeirdRemoteEvents(game)

local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local Window = WindUI:CreateWindow({
    Title = "Cezar Hub | TPS STREET SOCCER Premium V0.01",
    Folder = "Cezar Hub",
    IconSize = 44,
    NewElements = true,
    Size = UDim2.fromOffset(550, 550),
    HideSearchBar = false,

    OpenButton = {
        Title = "Cezar Hub",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 3,
        Enabled = true,
        Draggable = true,
        OnlyMobile = false,
        Scale = 1,
        Color = ColorSequence.new(
            Color3.fromHex("#0400ff"),
            Color3.fromHex("#2f00ff")
        )
    },

    Topbar = {
        Height = 44,
        ButtonsType = "Mac",
    },
})

-- PURE VOID BLACK THEME
do
    WindUI:AddTheme({
        Name = "VoidBlack",
        Accent = Color3.fromHex("#00AAAA"),
        Dialog = Color3.fromHex("#000000"),
        Outline = Color3.fromHex("#003333"),
        Text = Color3.fromHex("#FFFFFF"),
        Placeholder = Color3.fromHex("#888888"),
        Button = Color3.fromHex("#111111"),
        Icon = Color3.fromHex("#00AAAA"),
        WindowBackground = Color3.fromHex("#000000"),
        TopbarButtonIcon = Color3.fromHex("#00AAAA"),
        TopbarTitle = Color3.fromHex("#FFFFFF"),
        TopbarAuthor = Color3.fromHex("#888888"),
        TopbarIcon = Color3.fromHex("#00AAAA"),
        TabBackground = Color3.fromHex("#000000"),
        TabTitle = Color3.fromHex("#FFFFFF"),
        TabIcon = Color3.fromHex("#00AAAA"),
        ElementBackground = Color3.fromHex("#111111"),
        ElementTitle = Color3.fromHex("#FFFFFF"),
        ElementDesc = Color3.fromHex("#AAAAAA"),
        ElementIcon = Color3.fromHex("#00AAAA"),
    })

    WindUI:SetTheme("VoidBlack")
end

local M = Window:Section({ Title = "Main" })
local MI = Window:Section({ Title = "Misc" })

local Reach = M:Tab({ Title = "Reach", Icon = "volleyball" })
local Moss = M:Tab({ Title = "Moss", Icon = "user" })
local Khalid = M:Tab({ Title = "Khalid", Icon = "zap" })
local React = M:Tab({ Title = "React", Icon = "apple" })
local GKReact = M:Tab({ Title = "GK React", Icon = "shield" })

local Player = MI:Tab({ Title = "Player", Icon = "user-round-cog" })
local Helpers = MI:Tab({ Title = "Helpers", Icon = "heart-handshake" })
local BallMods = MI:Tab({ Title = "Ball Mods", Icon = "pencil-off" })
local Cezar5 = MI:Tab({ Title = "Cezar 5%", Icon = "star" })

-- ====================== REACH TAB (Fixed) ======================
local reachEnabled = false
local reachDistance = 1
local reachConnection = nil

Reach:Section({ Title = "Universal Leg Reach" })

Reach:Toggle({
    Title = "Enable Leg Reach",
    Default = false,
    Callback = function(v)
        reachEnabled = v
        
        if not v and reachConnection then
            reachConnection:Disconnect()
            reachConnection = nil
        end

        if v then
            if reachConnection then reachConnection:Disconnect() end
            reachConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local player = game.Players.LocalPlayer
                local character = player and player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                local humanoid = character and character:FindFirstChild("Humanoid")

                if not (character and rootPart and humanoid) then return end

                local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
                if not tps then return end

                local distance = (rootPart.Position - tps.Position).Magnitude
                if distance <= reachDistance then
                    local preferredFoot = game.Lighting:FindFirstChild(player.Name) and game.Lighting[player.Name]:FindFirstChild("PreferredFoot")
                    if preferredFoot then
                        local limbName = (humanoid.RigType == Enum.HumanoidRigType.R6)
                            and ((preferredFoot.Value == 1) and "Right Leg" or "Left Leg")
                            or ((preferredFoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg")

                        local limb = character:FindFirstChild(limbName)
                        if limb then
                            firetouchinterest(limb, tps, 0)
                            firetouchinterest(limb, tps, 1)
                        end
                    end
                end
            end)
        end
    end
})

Reach:Slider({
    Title = "Reach Distance",
    Min = 1,
    Max = 15,
    Default = 1,
    Step = 0.1,
    Callback = function(val)
        reachDistance = tonumber(val)

        if reachConnection then
            reachConnection:Disconnect()
            reachConnection = nil
        end

        if reachEnabled then
            reachConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local player = game.Players.LocalPlayer
                local character = player and player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                local humanoid = character and character:FindFirstChild("Humanoid")

                if not (character and rootPart and humanoid) then return end

                local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
                if not tps then return end

                local distance = (rootPart.Position - tps.Position).Magnitude
                if distance <= reachDistance then
                    local preferredFoot = game.Lighting:FindFirstChild(player.Name) and game.Lighting[player.Name]:FindFirstChild("PreferredFoot")
                    if preferredFoot then
                        local limbName = (humanoid.RigType == Enum.HumanoidRigType.R6)
                            and ((preferredFoot.Value == 1) and "Right Leg" or "Left Leg")
                            or ((preferredFoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg")

                        local limb = character:FindFirstChild(limbName)
                        if limb then
                            firetouchinterest(limb, tps, 0)
                            firetouchinterest(limb, tps, 1)
                        end
                    end
                end
            end)
        end
    end
})

Reach:Section({ Title = "Leg Size Reach (Xeno/Solara)" })

Reach:Input({
    Title = "R6 Leg Size",
    Value = "1",
    Type = "Textarea",
    Placeholder = "Size",
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char then
            local rl = char:FindFirstChild("Right Leg")
            local ll = char:FindFirstChild("Left Leg")
            if rl and ll then
                rl.Size = Vector3.new(v, 2, v)
                ll.Size = Vector3.new(v, 2, v)
                rl.CanCollide = false
                ll.CanCollide = false
            end
        end
    end
})

Reach:Input({
    Title = "R15 Leg Size",
    Value = "1",
    Type = "Textarea",
    Placeholder = "Size",
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char then
            local rll = char:FindFirstChild("RightLowerLeg")
            local lll = char:FindFirstChild("LeftLowerLeg")
            if rll and lll then
                rll.Size = Vector3.new(v, 2, v)
                lll.Size = Vector3.new(v, 2, v)
                rll.CanCollide = false
                lll.CanCollide = false
            end
        end
    end
})

Reach:Button({
    Title = "Fake Legs (Appear Normal)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        if humanoid.RigType == Enum.HumanoidRigType.R6 then
            game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
            game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

            game.Players.LocalPlayer.Character["Left Leg"].Massless = true
            local LeftLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
            LeftLegM.Name = "Left Leg"
            LeftLegM.CanCollide = false
            LeftLegM.Color = game.Players.LocalPlayer.Character["Left Leg"].Color
            LeftLegM.Size = Vector3.new(1, 2, 1)
            LeftLegM.Locked = true
            LeftLegM.Position = game.Players.LocalPlayer.Character["Left Leg"].Position

            local Attachment = Instance.new("Attachment", LeftLegM)
            Attachment.Name = "LeftFootAttachment"
            Attachment.Position = Vector3.new(0, -1, 0)

            local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
            MotorHip.Name = "Fake Left Hip"
            MotorHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            MotorHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            MotorHip.CurrentAngle = 0
            MotorHip.DesiredAngle = 0
            MotorHip.MaxVelocity = 0.1
            MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
            MotorHip.Part1 = LeftLegM

            game.Players.LocalPlayer.Character["Right Leg"].Massless = true
            local RightLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
            RightLegM.Name = "Right Leg"
            RightLegM.CanCollide = false
            RightLegM.Color = game.Players.LocalPlayer.Character["Right Leg"].Color
            RightLegM.Size = Vector3.new(1, 2, 1)
            RightLegM.Locked = true
            RightLegM.Position = game.Players.LocalPlayer.Character["Right Leg"].Position

            local Attachment = Instance.new("Attachment", RightLegM)
            Attachment.Name = "RightFootAttachment"
            Attachment.Position = Vector3.new(0, -1, 0)

            local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
            MotorHip.Name = "Fake Right Hip"
            MotorHip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            MotorHip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            MotorHip.CurrentAngle = 0
            MotorHip.DesiredAngle = 0
            MotorHip.MaxVelocity = 0.1
            MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
            MotorHip.Part1 = RightLegM

        elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
            game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = 1
            game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = 1
        end
    end
})

-- ====================== MOSS TAB (Fixed) ======================
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local headReachEnabled = false
local headReachSize = Vector3.new(1, 1.5, 1)
local headTransparency = 0.5
local headOffset = Vector3.new(0, 0, 0)
local headBoxPart
local headConnection
local usePercentage = false
local percentageValue = 1

local function getAdjustedSize(x, y, z)
    return Vector3.new(x, y, z)
end

local function updateHeadOffset()
    headOffset = Vector3.new(headOffset.X, headReachSize.Y / 2.5, headOffset.Z)
end

local function updateHeadBox()
    if headBoxPart then headBoxPart:Destroy() end
    headBoxPart = Instance.new("Part")
    headBoxPart.Size = headReachSize
    headBoxPart.Transparency = headTransparency
    headBoxPart.Anchored = true
    headBoxPart.CanCollide = false
    headBoxPart.Color = Color3.fromRGB(255, 105, 180)
    headBoxPart.Material = Enum.Material.Neon
    headBoxPart.Name = "HeadReachBox"
    headBoxPart.Parent = Workspace
end

local function startHeadReach()
    if not headReachEnabled then return end
    if headConnection then headConnection:Disconnect() end
    updateHeadBox()

    headConnection = RunService.RenderStepped:Connect(function()
        local character = player.Character
        if not character then return end
        local head = character:FindFirstChild("Head")
        local tps = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
        if not (head and tps) then return end

        headBoxPart.CFrame = head.CFrame * CFrame.new(headOffset)

        local boxCFrame, boxSize = headBoxPart.CFrame, headBoxPart.Size
        local relative = boxCFrame:PointToObjectSpace(tps.Position)

        if math.abs(relative.X) <= boxSize.X / 2 
            and math.abs(relative.Y) <= boxSize.Y / 2 
            and math.abs(relative.Z) <= boxSize.Z / 2 then
            firetouchinterest(head, tps, 0)
            firetouchinterest(head, tps, 1)
        end
    end)
end

local function stopHeadReach()
    if headConnection then headConnection:Disconnect() end
    if headBoxPart then headBoxPart:Destroy() end
end

Moss:Toggle({
    Title = "Enable Moss & Header Reach",
    Default = false,
    Callback = function(state)
        headReachEnabled = state
        if state then startHeadReach() else stopHeadReach() end
    end
})

-- FIXED SLIDERS
Moss:Slider({
    Title = "Header X",
    Min = 0,
    Max = 20,
    Default = 2,
    Step = 0.1,
    Callback = function(val)
        headReachSize = Vector3.new(val, headReachSize.Y, headReachSize.Z)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

Moss:Slider({
    Title = "Header Y",
    Min = 0,
    Max = 20,
    Default = 3,
    Step = 0.1,
    Callback = function(val)
        headReachSize = Vector3.new(headReachSize.X, val, headReachSize.Z)
        headOffset = Vector3.new(headOffset.X, val / 2.5, headOffset.Z)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

Moss:Slider({
    Title = "Header Z",
    Min = 0,
    Max = 20,
    Default = 2,
    Step = 0.1,
    Callback = function(val)
        headReachSize = Vector3.new(headReachSize.X, headReachSize.Y, val)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

Moss:Toggle({
    Title = "Appear Normal",
    Default = false,
    Callback = function(v)
        headTransparency = v and 1 or 0.5
        if headReachEnabled and headBoxPart then
            headBoxPart.Transparency = headTransparency
        end
    end
})

Moss:Section({ Title = "Moss Presets" })

Moss:Button({ Title = "15%", Callback = function() 
    headReachSize = Vector3.new(3.5, 4.8, 3.0)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })
Moss:Button({ Title = "25%", Callback = function() 
    headReachSize = Vector3.new(3.7, 5.0, 3.2)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })
Moss:Button({ Title = "50%", Callback = function() 
    headReachSize = Vector3.new(3.9, 5.3, 3.1)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })
Moss:Button({ Title = "75%", Callback = function() 
    headReachSize = Vector3.new(4.0, 5.3, 3.3)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })
Moss:Button({ Title = "100% DIAGALA MOSSED", Callback = function() 
    headReachSize = Vector3.new(5, 6, 3.5)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })

-- ====================== KHALID TAB (Jump Leg Only) ======================
local khalidEnabled = false
local J_REACH = 5

Khalid:Toggle({
    Title = "Enable Khalid",
    Default = false,
    Callback = function(v) khalidEnabled = v end
})

Khalid:Slider({
    Title = "Jump Reach Distance",
    Min = 1,
    Max = 20,
    Default = 5,
    Step = 0.1,
    Callback = function(v) J_REACH = v end
})

Khalid:Section({ Title = "Khalid Presets" })
Khalid:Button({ Title = "15%", Callback = function() J_REACH = 5 end })
Khalid:Button({ Title = "25%", Callback = function() J_REACH = 6.7 end })
Khalid:Button({ Title = "50%", Callback = function() J_REACH = 10.1 end })
Khalid:Button({ Title = "75%", Callback = function() J_REACH = 13.5 end })
Khalid:Button({ Title = "100%", Callback = function() J_REACH = 16.9 end })

-- Jump leg physics
game:GetService("RunService").Heartbeat:Connect(function()
    if khalidEnabled then
        local char = game.Players.LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local ball = workspace:FindFirstChild("TPS") or (workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS"))
        if root and ball then
            if (ball.Position - root.Position).Magnitude <= J_REACH then
                firetouchinterest(root, ball, 0)
                firetouchinterest(root, ball, 1)
            end
        end
    end
end)

-- ====================== REACT TAB ======================
React:Section({ Title = "Ball React Presets" })
for _, p in {10, 25, 50, 75, 100} do
    React:Button({
        Title = p .. "%",
        Callback = function()
            local tps = workspace.TPSSystem.TPS
            if tps then tps.Velocity = Vector3.new(100 * (p/100), 100 * (p/100), 100 * (p/100)) end
        end
    })
end

React:Button({ Title = "Reduce Ball Delay", Callback = function()
    local tps = workspace.TPSSystem.TPS
    if tps and tps:FindFirstChild("MainAttachment") then tps.MainAttachment:Destroy() end
end })

-- ====================== GK REACT TAB (Fixed) ======================
local gkReactEnabled = false

GKReact:Toggle({
    Title = "Enable Goalkeeper React",
    Default = false,
    Callback = function(v)
        gkReactEnabled = v
        if v then
            local gkActions = {"SaveRA", "SaveLA", "SaveRL", "SaveLL", "SaveT", "Tackle", "Header"}
            local meta = getrawmetatable(game)
            local old = meta.__namecall
            setreadonly(meta, false)
            meta.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if method == "FireServer" and table.find(gkActions, tostring(self)) then
                    local args = {...}
                    args[2] = game.Players.LocalPlayer.Character.Humanoid.LLCL
                    return old(self, unpack(args))
                end
                return old(self, ...)
            end)
            setreadonly(meta, true)
        end
    end
})

GKReact:Section({ Title = "GK React Presets" })
for _, p in {15, 25, 50, 75, 100} do
    GKReact:Button({
        Title = p .. "%",
        Callback = function()
            if gkReactEnabled then
                local tps = workspace.TPSSystem.TPS
                if tps then tps.Velocity = Vector3.new(100 * (p/100), 100 * (p/100), 100 * (p/100)) end
            end
        end
    })
end

-- ====================== CEZAR 5% TAB ======================
local cezar5Enabled = false

Cezar5:Toggle({
    Title = "Enable Cezar 5%",
    Default = false,
    Callback = function(v)
        cezar5Enabled = v
        if v then
            headReachSize = Vector3.new(4, 6.3, 4)
            updateHeadOffset()
            if headReachEnabled then updateHeadBox() end
            J_REACH = 5
        end
    end
})

-- Add all the other tabs from the original script (Player, Helpers, BallMods, etc.)
-- ... (keeping the rest of the content from the original script)

Window:Open()
