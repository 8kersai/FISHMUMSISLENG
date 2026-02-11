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
        ButtonsType = "Windows", -- CHANGED FROM "Mac" TO "Windows" FOR X - □ BUTTONS
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
local Teleport = MI:Tab({ Title = "Teleporting", Icon = "bird" })
local Cezar5 = MI:Tab({ Title = "Cezar 5%", Icon = "star" })

-- ====================== REACH TAB (Fixed Sliders) ======================
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

-- FIXED SLIDER SYNTAX
Reach:Slider({
    Title = "Reach Distance",
    Desc = "The Size Of The Reach",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 1,
        Max = 15,
        Default = 1,
    },
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

-- ====================== MOSS TAB (Fixed Sliders) ======================
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local headReachEnabled = false
local headReachSize = Vector3.new(1, 1.5, 1)
local headTransparency = 0.5
local headOffset = Vector3.new(0, 0, 0)
local headBoxPart
local headConnection

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

-- FIXED SLIDER SYNTAX
Moss:Slider({
    Title = "Header X",
    Desc = "",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 0,
        Max = 20,
        Default = 2,
    },
    Callback = function(val)
        headReachSize = Vector3.new(val, headReachSize.Y, headReachSize.Z)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

Moss:Slider({
    Title = "Header Y",
    Desc = "",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 0,
        Max = 20,
        Default = 3,
    },
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
    Desc = "",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 0,
        Max = 20,
        Default = 2,
    },
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
    Desc = "Jump leg reach distance",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 1,
        Max = 20,
        Default = 5,
    },
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

-- ====================== GK REACT TAB ======================
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

-- ====================== PLAYER TAB ======================
Player:Section({ Title = "Walkspeed" })

local WalkspeedEnabled = false
local CurrentSpeed = 23 

Player:Toggle({
    Title = "Enable / Disable Walkspeed",
    Default = false,
    Callback = function(v)
        WalkspeedEnabled = v
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            if v then
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = CurrentSpeed
            else
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = 23 
            end
        end
    end
})

Player:Slider({
    Title = "Walkspeed Size",
    Desc = "",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = {
        Min = 23,
        Max = 75,
        Default = 23,
    },
    Callback = function(v)
        CurrentSpeed = v
        if WalkspeedEnabled then
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = v
            end
        end
    end
})

Player:Section({ Title = "Jump Power" })

local JumpEnabled = false
local CurrentJump = 50 

Player:Toggle({
    Title = "Enable / Disable Jump Power",
    Default = false,
    Callback = function(v)
        JumpEnabled = v
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            if v then
                character:FindFirstChildOfClass("Humanoid").JumpPower = CurrentJump
            else
                character:FindFirstChildOfClass("Humanoid").JumpPower = 50 
            end
        end
    end
})

Player:Slider({
    Title = "Jump Power",
    Desc = "",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = {
        Min = 50,
        Max = 120,
        Default = 50,
    },
    Callback = function(v)
        CurrentJump = v
        if JumpEnabled then
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                character:FindFirstChildOfClass("Humanoid").JumpPower = v
            end
        end
    end
})

Player:Section({ Title = "Avatar Stealer" })

local Players = game:GetService("Players")
local lplr = Players.LocalPlayer

local Disguise = {Enabled = false}
local DisguiseUsername = {Value = ""}
local DisguiseDescription = nil

local function RemoveOldParts(character)
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Accessory") or child:IsA("Clothing") or child:IsA("ShirtGraphic") then
            child:Destroy()
        elseif child:IsA("BodyColors") then
            child:Destroy()
        end
    end
end

local function FetchDisguiseDescription()
    if DisguiseUsername.Value == "" then return end
    local success
    repeat
        success = pcall(function()
            local userId = Players:GetUserIdFromNameAsync(DisguiseUsername.Value)
            DisguiseDescription = Players:GetHumanoidDescriptionFromUserId(userId)
        end)
        if not success then
            task.wait(1)
        end
    until success or not Disguise.Enabled
end

local function DisguiseCharacter(char)
    task.spawn(function()
        if not char then return end
        local hum = char:WaitForChild("Humanoid", 9e9)
        RemoveOldParts(char)

        if not DisguiseDescription then
            FetchDisguiseDescription()
        end

        if Disguise.Enabled and DisguiseDescription then
            hum:ApplyDescriptionClientServer(DisguiseDescription)
        end
    end)
end

lplr.CharacterAdded:Connect(function(char)
    if Disguise.Enabled then
        DisguiseCharacter(char)
    else
        local hum = char:FindFirstChildOfClass("Humanoid")
        if             hum:ApplyDescriptionClientServer(Players:GetHumanoidDescriptionAsync(lplr.UserId))
        end
    end
end)

Player:Toggle({
    Title = "Enable / Disable Avatar Stealer",
    Default = false,
    Callback = function(state)
        Disguise.Enabled = state
        if state and DisguiseUsername.Value ~= "" and lplr.Character then
            DisguiseCharacter(lplr.Character)
        elseif not state and lplr.Character then
            local hum = lplr.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                hum:ApplyDescriptionClientServer(Players:GetHumanoidDescriptionAsync(lplr.UserId))
            end
        end
    end
})

Player:Input({
    Title = "Avatar Stealer Username",
    Desc = "Write user here.",
    Value = "",
    Type = "Input",
    Placeholder = "Enter username...",
    Callback = function(input)
        DisguiseUsername.Value = input
        if Disguise.Enabled and lplr.Character then
            DisguiseCharacter(lplr.Character)
        end
    end
})

-- ====================== HELPERS TAB ======================
Helpers:Section({ Title = "ZZZZ Helper" })

local zzzzEnabled = false

Helpers:Toggle({
    Title = "Enable / Disable ZZZZ Helper",
    Default = false,
    Callback = function(state)
        zzzzEnabled = state
        if state then
            local part = Instance.new("Part")
            part.Name = "TPS1"
            part.Size = Vector3.new(9, 0.1, 9)  
            part.Anchored = true
            part.BrickColor = BrickColor.new("Bright red")
            part.Transparency = 1 
            part.Parent = game.Workspace

            local tpsSystem = game:GetService("Workspace"):FindFirstChild("TPSSystem")
            local tpsTarget = tpsSystem and tpsSystem:FindFirstChild("TPS")

            local function updatePartPosition()
                if tpsTarget then
                    part.Position = tpsTarget.Position - Vector3.new(0, 1, 0)
                end
            end

            updatePartPosition()
            local runService = game:GetService("RunService")
            runService.RenderStepped:Connect(updatePartPosition)
        else
            for _, child in ipairs(game.Workspace:GetChildren()) do
                if child.Name == "TPS1" then
                    child:Destroy()
                end
            end
        end
    end
})

Helpers:Section({ Title = "Air Dribble Helper" })

local airDribbleEnabled = false
local airDribbleSize = 1

Helpers:Toggle({
    Title = "Enable / Disable Air Dribble Helper",
    Default = false,
    Callback = function(state)
        airDribbleEnabled = state
        if state then
            local part = Instance.new("Part")
            part.Name = "TPS"
            part.Size = Vector3.new(airDribbleSize, 0.1, airDribbleSize)  
            part.Anchored = true
            part.BrickColor = BrickColor.new("Bright red")
            part.Transparency = 1  
            part.Parent = game.Workspace

            local tpsSystem = game:GetService("Workspace"):FindFirstChild("TPSSystem")
            local tpsTarget = tpsSystem and tpsSystem:FindFirstChild("TPS")

            local function updatePartPosition()
                if tpsTarget then
                    part.Position = tpsTarget.Position - Vector3.new(0, 1, 0)
                end
            end

            updatePartPosition()
            local runService = game:GetService("RunService")
            runService.RenderStepped:Connect(updatePartPosition)
        else
            for _, child in ipairs(game.Workspace:GetChildren()) do
                if child.Name == "TPS" then
                    child:Destroy()
                end
            end
        end
    end
})

Helpers:Slider({
    Title = "Air Dribble Helper Size",
    Desc = "The Size Of The Reach",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 1,
        Max = 15,
        Default = 1,
    },
    Callback = function(val)
        airDribbleSize = val
        if airDribbleEnabled then
            for _, child in ipairs(game.Workspace:GetChildren()) do
                if child.Name == "TPS" then
                    child:Destroy()
                end
            end
            
            local part = Instance.new("Part")
            part.Name = "TPS"
            part.Size = Vector3.new(val, 0.1, val)  
            part.Anchored = true
            part.BrickColor = BrickColor.new("Bright red")
            part.Transparency = 1  
            part.Parent = game.Workspace

            local tpsSystem = game:GetService("Workspace"):FindFirstChild("TPSSystem")
            local tpsTarget = tpsSystem and tpsSystem:FindFirstChild("TPS")

            local function updatePartPosition()
                if tpsTarget then
                    part.Position = tpsTarget.Position - Vector3.new(0, 1, 0)
                end
            end

            updatePartPosition()
            local runService = game:GetService("RunService")
            runService.RenderStepped:Connect(updatePartPosition)
        end
    end
})

Helpers:Section({ Title = "Inf Dribble Helper" })

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local ball = game.Workspace.TPSSystem.TPS
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local followBall = false
local isMovingManually = false
local infDribbleEnabled = false 

local function follow()
    if followBall and not isMovingManually and infDribbleEnabled then
        character.Humanoid:MoveTo(ball.Position)
    end
end

userInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType == Enum.UserInputType.MouseMovement then
        isMovingManually = false
    end
end)

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.B and not gameProcessed and infDribbleEnabled then
        followBall = not followBall
    end
end)

runService.RenderStepped:Connect(function()
    if followBall and infDribbleEnabled then
        follow()
    end
end)

player.CharacterAdded:Connect(function(char)
    character = char
end)

Helpers:Toggle({
    Title = "Enable / Disable Inf Dribble Helper [PC]",
    Desc = "Toggle it by pressing (B)",
    Default = false,
    Callback = function(state)
        infDribbleEnabled = state
        if not state then
            followBall = false
        end
    end
})

Helpers:Toggle({
    Title = "Enable / Disable Inf Dribble Helper [MOB]",
    Desc = "it will make a GUI in your screen to control it.",
    Default = false,
    Callback = function(Value)
        infDribbleEnabled = Value

        if Value then
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "InfDribbleGui"
            screenGui.ResetOnSpawn = false
            screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

            local toggleButton = Instance.new("TextButton")
            toggleButton.Name = "InfDribbleButton"
            toggleButton.Size = UDim2.new(0, 120, 0, 40)
            toggleButton.Position = UDim2.new(0, 20, 0.5, -20)
            toggleButton.Text = "Inf Dribble: OFF"
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            toggleButton.TextColor3 = Color3.new(1, 1, 1)
            toggleButton.TextScaled = true
            toggleButton.Parent = screenGui

            toggleButton.MouseButton1Click:Connect(function()
                followBall = not followBall
                if followBall then
                    toggleButton.Text = "Inf Dribble: ON"
                else
                    toggleButton.Text = "Inf Dribble: OFF"
                end
            end)
        else
            followBall = false
            local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
            if playerGui then
                local screenGui = playerGui:FindFirstChild("InfDribbleGui")
                if screenGui then
                    screenGui:Destroy()
                end
            end
        end
    end
})

-- ====================== BALL MODS TAB ======================
BallMods:Section({ Title = "Ball Modifications" })

BallMods:Input({
    Title = "Ball Size",
    Desc = "",
    Value = "2.6",
    Type = "Textarea",
    Placeholder = "Size",
    Callback = function(size) 
        workspace.TPSSystem.TPS.Size = Vector3.new(size, size, size)
    end
})

BallMods:Button({
    Title = "Anti-Ball Fling",
    Justify = "Center",
    Callback = function()
        local player = game.Players.LocalPlayer
        local runService = game:GetService("RunService")
        local Clip = false
        wait(0.1)
        
        local function noclipFunction()
            if not Clip and player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide and (part.Name == "Right Leg" or part.Name == "Right Arm" or part.Name == "Left Arm" or part.Name == "Torso") then
                        part.CanCollide = false
                    end
                end
            end
        end
        
        local noclipConnection = runService.Stepped:Connect(noclipFunction)  
    end
})

local RunService = game:GetService("RunService")
local ball = workspace.TPSSystem.TPS
local gravity = workspace.Gravity or 196.2

local predictionDuration = 0.5   
local timeStep = 0.05            
local predictionParts = {}
local lineParts = {}

local function createOrGetPart(list, index, size, color, transparency)
    if list[index] then
        return list[index]
    else
        local part = Instance.new("Part")
        part.Anchored = true
        part.CanCollide = false
        part.Size = size
        part.Material = Enum.Material.Neon
        part.Color = color
        part.Transparency = transparency
        part.CastShadow = false
        part.Parent = workspace
        list[index] = part
        return part
    end
end

local connection

BallMods:Toggle({
    Title = "Enable / Disable Ball Prediction",
    Default = false,
    Callback = function(state)
        if state then
            if connection then connection:Disconnect() end

            connection = RunService.Heartbeat:Connect(function()
                if not ball or not ball:IsA("BasePart") then return end

                local startPos = ball.Position
                local startVel = ball.Velocity
                local pointsCount = math.floor(predictionDuration / timeStep)
                local positions = {}

                for i = 1, pointsCount do
                    local t = i * timeStep
                    local predictedPos = startPos + (startVel * t) + Vector3.new(0, -0.5 * gravity * t * t, 0)
                    positions[i] = predictedPos

                    local pointPart = createOrGetPart(predictionParts, i, Vector3.new(0.3,0.3,0.3), Color3.fromRGB(0,255,0), 0.4)
                    pointPart.CFrame = CFrame.new(predictedPos)
                    pointPart.Transparency = 0.4
                end

                for i = 1, pointsCount - 1 do
                    local pos1 = positions[i]
                    local pos2 = positions[i + 1]
                    local direction = pos2 - pos1
                    local distance = direction.Magnitude
                    local midPoint = pos1 + direction / 2
                    local linePart = createOrGetPart(lineParts, i, Vector3.new(0.1,0.1,distance), Color3.fromRGB(0,255,0), 0.6)
                    linePart.CFrame = CFrame.new(midPoint, pos2)
                    linePart.Transparency = 0.6
                end

                for i = pointsCount + 1, #predictionParts do
                    predictionParts[i].Transparency = 1
                end
                for i = pointsCount, #lineParts do
                    lineParts[i].Transparency = 1
                end
            end)
        else
            if connection then connection:Disconnect() end
            connection = nil
            for _, part in pairs(predictionParts) do
                part.Transparency = 1
            end
            for _, part in pairs(lineParts) do
                part.Transparency = 1
            end
        end
    end
})

BallMods:Toggle({
    Title = "Enable / Disable Ball Collision",
    Default = false,
    Callback = function(state)
        if state then
            local TPS = workspace:WaitForChild("TPSSystem"):WaitForChild("TPS")

            local follower = Instance.new("Part")
            follower.Name = "FollowerPart"
            follower.Shape = Enum.PartType.Ball
            follower.Anchored = true
            follower.CanCollide = true
            follower.Material = Enum.Material.Air
            follower.Color = TPS.Color
            follower.Parent = workspace

            local RunService = game:GetService("RunService")

            RunService.Heartbeat:Connect(function()
                if TPS then
                    follower.Size = TPS.Size
                    follower.CFrame = TPS.CFrame
                    follower.Color = TPS.Color
                end
            end)
        else 
            if workspace:FindFirstChild("FollowerPart") then 
                workspace.FollowerPart:Destroy()
            end
        end
    end
})

BallMods:Dropdown({
    Title = "Ball Texture",
    Values = {
        {
            Title = "Default",
            Desc = "",
            Icon = "",
            Callback = function() 
                local ball = game.Workspace.TPSSystem.TPS
                ball.Decal1.Texture = "rbxassetid://1731401359"
                ball.Decal2.Texture = "rbxassetid://1731401359"
                ball.Decal3.Texture = "rbxassetid://1731401811"
                ball.Decal4.Texture = "rbxassetid://1731401811"
                ball.Decal5.Texture = "rbxassetid://1731401359"
                ball.Decal6.Texture = "rbxassetid://1731401359"
            end
        },
        {
            Title = "Addidas Brazuca",
            Desc = "",
            Icon = "",
            Callback = function() 
                local ball = game.Workspace.TPSSystem.TPS
                ball.Decal1.Texture = "http://www.roblox.com/asset/?id=137668136"
                ball.Decal2.Texture = "http://www.roblox.com/asset/?id=137668129"
                ball.Decal3.Texture = "http://www.roblox.com/asset/?id=137668136"
                ball.Decal4.Texture = "http://www.roblox.com/asset/?id=137668136"
                ball.Decal5.Texture = "http://www.roblox.com/asset/?id=137668136"
            end
        },
        {
            Title = "Addidas Jabulani",
            Desc = "",
            Icon = "",
            Callback = function() 
                local ball = game.Workspace.TPSSystem.TPS
                ball.Decal1.Texture = "http://www.roblox.com/asset/?id=76614961"
                ball.Decal2.Texture = "http://www.roblox.com/asset/?id=76614961"
                ball.Decal3.Texture = "http://www.roblox.com/asset/?id=76614961"
                ball.Decal4.Texture = "http://www.roblox.com/asset/?id=76614961"
                ball.Decal5.Texture = "http://www.roblox.com/asset/?id=76614961"
                ball.Decal6.Texture = "http://www.roblox.com/asset/?id=76614961"
            end
        },
    }
})

BallMods:Dropdown({
    Title = "Ball Sound",
    Values = {
        {
            Title = "Default",
            Desc = "",
            Icon = "",
            Callback = function() 
                local ballSound = game.Workspace.TPSSystem.TPS.Sound
                ballSound.SoundId = "rbxassetid://2516069845"
                ballSound.PlaybackSpeed = 0.7
                ballSound.Volume = 0.7
            end
        },
        {
            Title = "OOF !",
            Desc = "",
            Icon = "",
            Callback = function() 
                local ballSound = game.Workspace.TPSSystem.TPS.Sound
                ballSound.SoundId = "rbxassetid://5143383166"
                ballSound.PlaybackSpeed = 1
                ballSound.Volume = 2
            end
        },
        {
            Title = "Neverloose",
            Desc = "",
            Icon = "",
            Callback = function() 
                local ballSound = game.Workspace.TPSSystem.TPS.Sound
                ballSound.SoundId = "rbxassetid://6607204501"
                ballSound.PlaybackSpeed = 0.7
                ballSound.Volume = 0.7
            end
        },
        {
            Title = "Rust",
            Desc = "",
            Icon = "",
            Callback = function() 
                local ballSound = game.Workspace.TPSSystem.TPS.Sound
                ballSound.SoundId = "rbxassetid://1255040462"
                ballSound.PlaybackSpeed = 0.7
                ballSound.Volume = 0.7
            end
        },
        {
            Title = "Bruh",
            Desc = "",
            Icon = "",
            Callback = function() 
                local ballSound = game.Workspace.TPSSystem.TPS.Sound
                ballSound.SoundId = "rbxassetid://4275842574"
                ballSound.PlaybackSpeed = 0.7
                ballSound.Volume = 0.7
            end
        },
    }
})

-- ====================== TELEPORTING TAB ======================
Teleport:Section({ Title = "Ball Teleporting" })

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local TPS = workspace:WaitForChild("TPSSystem"):WaitForChild("TPS")

local Target = nil
local teleporting = false
local connection

Teleport:Toggle({
    Title = "Loop Teleporting to the Ball",
    Desc = "Continuously teleports you near the ball",
    Default = false,
    Callback = function(state)
        teleporting = state

        if teleporting then
            connection = RunService.Heartbeat:Connect(function()
                local character = player.Character
                if character then
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if hrp and TPS then
                        local offset = -TPS.CFrame.LookVector * 5 + Vector3.new(0, 3, 0)
                        hrp.CFrame = TPS.CFrame + offset
                    end
                end
            end)
        else
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
})

Teleport:Section({ Title = "Player Teleporting" })

Teleport:Input({
    Title = "Target Player Username",
    Callback = function(value)
        local targetPlayer = Players:FindFirstChild(value)
        Target = targetPlayer
    end
})

Teleport:Button({
    Title = "Teleport To Player",
    Justify = "Center",
    Callback = function()
        if Target
        and player.Character
        and Target.Character
        and player.Character:FindFirstChild("HumanoidRootPart")
        and Target.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame =
                Target.Character.HumanoidRootPart.CFrame
        end
    end
})

Teleport:Button({
    Title = "Teleport To Red Goal",
    Justify = "Center",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        hrp.CFrame = workspace.RedGoal.Part.CFrame + Vector3.new(0, 3, 0)
    end
})

Teleport:Button({
    Title = "Teleport To Blue Goal",
    Justify = "Center",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        hrp.CFrame = workspace.BlueGoal.Part.CFrame + Vector3.new(0, 3, 0)
    end
})

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

Window:Open()

