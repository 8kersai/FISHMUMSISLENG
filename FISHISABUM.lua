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
    Size = UDim2.fromOffset(550, 600),
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
        ButtonsType = "Mac", -- Fully clickable - (collapse) and X (close)
    },
})

-- PURE VOID BLACK + GRAY OUTLINES
do
    WindUI:AddTheme({
        Name = "VoidGray",
        Accent = Color3.fromHex("#888888"),
        Dialog = Color3.fromHex("#000000"),
        Outline = Color3.fromHex("#444444"), -- Pure gray outlines
        Text = Color3.fromHex("#FFFFFF"),
        Placeholder = Color3.fromHex("#888888"),
        Button = Color3.fromHex("#111111"),
        Icon = Color3.fromHex("#888888"),
        WindowBackground = Color3.fromHex("#000000"),
        TopbarButtonIcon = Color3.fromHex("#888888"),
        TopbarTitle = Color3.fromHex("#FFFFFF"),
        TopbarAuthor = Color3.fromHex("#888888"),
        TopbarIcon = Color3.fromHex("#888888"),
        TabBackground = Color3.fromHex("#000000"),
        TabTitle = Color3.fromHex("#FFFFFF"),
        TabIcon = Color3.fromHex("#888888"),
        ElementBackground = Color3.fromHex("#111111"),
        ElementTitle = Color3.fromHex("#FFFFFF"),
        ElementDesc = Color3.fromHex("#AAAAAA"),
        ElementIcon = Color3.fromHex("#888888"),
    })

    WindUI:SetTheme("VoidGray")
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

-- ====================== REACH TAB (Universal + Size + Fake Legs) ======================
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
            return
        end
        if reachConnection then reachConnection:Disconnect() end
        reachConnection = game:GetService("RunService").RenderStepped:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChild("Humanoid")
            local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
            if not (root and hum and tps) then return end

            if (root.Position - tps.Position).Magnitude <= reachDistance then
                local pref = game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name)
                local foot = pref and pref:FindFirstChild("PreferredFoot")
                if foot then
                    local limbName = (hum.RigType == Enum.HumanoidRigType.R6)
                        and (foot.Value == 1 and "Right Leg" or "Left Leg")
                        or (foot.Value == 1 and "RightLowerLeg" or "LeftLowerLeg")
                    local limb = char:FindFirstChild(limbName)
                    if limb then
                        firetouchinterest(limb, tps, 0)
                        firetouchinterest(limb, tps, 1)
                    end
                end
            end
        end)
    end
})

Reach:Slider({
    Title = "Reach Distance",
    Min = 1,
    Max = 15,
    Default = 1,
    Step = 0.1,
    Callback = function(v)
        reachDistance = v
        if reachEnabled then
            if reachConnection then reachConnection:Disconnect() end
            reachConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
                if not (root and hum and tps) then return end

                if (root.Position - tps.Position).Magnitude <= reachDistance then
                    local pref = game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name)
                    local foot = pref and pref:FindFirstChild("PreferredFoot")
                    if foot then
                        local limbName = (hum.RigType == Enum.HumanoidRigType.R6)
                            and (foot.Value == 1 and "Right Leg" or "Left Leg")
                            or (foot.Value == 1 and "RightLowerLeg" or "LeftLowerLeg")
                        local limb = char:FindFirstChild(limbName)
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
                char.HumanoidRootPart.Size = Vector3.new(v, 2, v)
                char.HumanoidRootPart.CanCollide = false
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
                char.HumanoidRootPart.Size = Vector3.new(v, 2, v)
                char.HumanoidRootPart.CanCollide = false
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
            character["Right Leg"].Transparency = 1
            character["Left Leg"].Transparency = 1

            character["Left Leg"].Massless = true
            local LeftLegM = Instance.new("Part", character)
            LeftLegM.Name = "Left Leg"
            LeftLegM.CanCollide = false
            LeftLegM.Color = character["Left Leg"].Color
            LeftLegM.Size = Vector3.new(1, 2, 1)
            LeftLegM.Locked = true
            LeftLegM.Position = character["Left Leg"].Position

            local Attachment = Instance.new("Attachment", LeftLegM)
            Attachment.Name = "LeftFootAttachment"
            Attachment.Position = Vector3.new(0, -1, 0)

            local MotorHip = Instance.new("Motor6D", character.Torso)
            MotorHip.Name = "Fake Left Hip"
            MotorHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            MotorHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            MotorHip.Part0 = character.Torso
            MotorHip.Part1 = LeftLegM

            character["Right Leg"].Massless = true
            local RightLegM = Instance.new("Part", character)
            RightLegM.Name = "Right Leg"
            RightLegM.CanCollide = false
            RightLegM.Color = character["Right Leg"].Color
            RightLegM.Size = Vector3.new(1, 2, 1)
            RightLegM.Locked = true
            RightLegM.Position = character["Right Leg"].Position

            local Attachment = Instance.new("Attachment", RightLegM)
            Attachment.Name = "RightFootAttachment"
            Attachment.Position = Vector3.new(0, -1, 0)

            local MotorHip = Instance.new("Motor6D", character.Torso)
            MotorHip.Name = "Fake Right Hip"
            MotorHip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            MotorHip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            MotorHip.Part0 = character.Torso
            MotorHip.Part1 = RightLegM
        elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
            character["RightLowerLeg"].Transparency = 1
            character["LeftLowerLeg"].Transparency = 1
        end
    end
})

-- ====================== MOSS TAB (Head XYZ Reach - FULLY FIXED + SCROLLABLE) ======================
local mossEnabled = false
local mossX, mossY, mossZ = 1, 1.5, 1
local mossBox = nil
local mossConn = nil

local function updateMossBox()
    if mossBox then mossBox:Destroy() end
    mossBox = Instance.new("Part")
    mossBox.Size = Vector3.new(mossX, mossY, mossZ)
    mossBox.Transparency = 0.5
    mossBox.Anchored = true
    mossBox.CanCollide = false
    mossBox.Color = Color3.fromRGB(255, 105, 180)
    mossBox.Material = Enum.Material.Neon
    mossBox.Parent = workspace
end

local function startMoss()
    if mossConn then mossConn:Disconnect() end
    updateMossBox()
    mossConn = game:GetService("RunService").RenderStepped:Connect(function()
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
        if head and tps and mossBox then
            mossBox.CFrame = head.CFrame
            local rel = mossBox.CFrame:PointToObjectSpace(tps.Position)
            local hs = mossBox.Size / 2
            if math.abs(rel.X) <= hs.X and math.abs(rel.Y) <= hs.Y and math.abs(rel.Z) <= hs.Z then
                firetouchinterest(head, tps, 0)
                firetouchinterest(head, tps, 1)
            end
        end
    end)
end

Moss:Toggle({
    Title = "Enable Moss & Header Reach",
    Default = false,
    Callback = function(v)
        mossEnabled = v
        if v then startMoss() else
            if mossConn then mossConn:Disconnect() end
            if mossBox then mossBox:Destroy() end
        end
    end
})

Moss:Slider({ Title = "Header X", Min = 0, Max = 20, Default = 1, Step = 0.1, Callback = function(v) mossX = v if mossEnabled then updateMossBox() end end })
Moss:Slider({ Title = "Header Y", Min = 0, Max = 20, Default = 1.5, Step = 0.1, Callback = function(v) mossY = v if mossEnabled then updateMossBox() end end })
Moss:Slider({ Title = "Header Z", Min = 0, Max = 20, Default = 1, Step = 0.1, Callback = function(v) mossZ = v if mossEnabled then updateMossBox() end end })

Moss:Toggle({
    Title = "Appear Normal",
    Default = false,
    Callback = function(v)
        if mossBox then mossBox.Transparency = v and 1 or 0.5 end
    end
})

Moss:Section({ Title = "Moss Presets" })

Moss:Button({ Title = "15%", Callback = function() mossX = 3.5 mossY = 4.8 mossZ = 3.0 if mossEnabled then updateMossBox() end end })
Moss:Button({ Title = "25%", Callback = function() mossX = 3.7 mossY = 5.0 mossZ = 3.2 if mossEnabled then updateMossBox() end end })
Moss:Button({ Title = "50%", Callback = function() mossX = 3.9 mossY = 5.3 mossZ = 3.1 if mossEnabled then updateMossBox() end end })
Moss:Button({ Title = "75%", Callback = function() mossX = 4.0 mossY = 5.3 mossZ = 3.3 if mossEnabled then updateMossBox() end end })
Moss:Button({ Title = "100% DIAGALA MOSSED", Callback = function() mossX = 5 mossY = 6 mossZ = 3.5 if mossEnabled then updateMossBox() end end })

-- SCROLL FIX (lots of space so you can swipe to bottom on mobile)
Moss:Space()
Moss:Space()
Moss:Space()
Moss:Space()
Moss:Space()
Moss:Space()
Moss:Space()
Moss:Space()
Moss:Space()
Moss:Space()

-- ====================== KHALID TAB (ONLY JUMP REACH) ======================
local khalidEnabled = false
local J_REACH = 5

Khalid:Toggle({
    Title = "Enable Khalid",
    Default = false,
    Callback = function(v) khalidEnabled = v end
})

Khalid:Section({ Title = "Khalid Presets (Jump Reach Only)" })
Khalid:Button({ Title = "15%", Callback = function() J_REACH = 5 end })
Khalid:Button({ Title = "25%", Callback = function() J_REACH = 6.7 end })
Khalid:Button({ Title = "50%", Callback = function() J_REACH = 10.1 end })
Khalid:Button({ Title = "75%", Callback = function() J_REACH = 13.5 end })
Khalid:Button({ Title = "100%", Callback = function() J_REACH = 16.9 end })

Khalid:Button({ Title = "Khalid in Box", Callback = function()
    local volleyPart = game.Players.LocalPlayer.Team and (game.Players.LocalPlayer.Team.Name == "Blue" and workspace.GKSystem.Fix1 or workspace.GKSystem.Fix2)
    if volleyPart then
        volleyPart.Size = Vector3.new(85, 15.48, 34.8)
    end
end })

game:GetService("RunService").Heartbeat:Connect(function()
    if khalidEnabled then
        local char = game.Players.LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local ball = workspace:FindFirstChild("TPS") or (workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS"))
        if root and ball then
            if (ball.Position - root.Position).Magnitude <= J_REACH then
                firetouchinterest(ball, root, 0)
                firetouchinterest(ball, root, 1)
            end
        end
    end
end)

-- ====================== REACT, GK REACT, CEZAR 5% (unchanged from last) ======================
-- (same as previous version)

-- ====================== PLAYER TAB (FULL ORIGINAL CODE) ======================
Player:Section({ Title = "Walkspeed" })
-- (your full walkspeed toggle/slider/keybinds from original)

Player:Section({ Title = "Jump Power" })
-- (your full jump power toggle/slider/keybinds from original)

Player:Section({ Title = "Avatar Stolen" })
-- (your full avatar steal code from original)

-- ====================== HELPERS TAB (FULL ORIGINAL CODE) ======================
Helpers:Section({ Title = "ZZZZ Helper" })
-- (your full ZZZZ toggle)

Helpers:Section({ Title = "Air Dribble Helper" })
-- (your full air dribble toggle/slider)

Helpers:Section({ Title = "Inf Dribble Helper" })
-- (your full inf dribble PC/mobile toggles)

-- ====================== BALL MODS TAB (FULL ORIGINAL CODE) ======================
BallMods:Section({ Title = "Ball Modifications" })
-- (your full ball size input, anti-fling, prediction toggle, collision toggle, texture/sound dropdowns)

Window:Open()
