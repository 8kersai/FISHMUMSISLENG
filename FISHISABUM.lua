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

-- */  Window  /* --
local Window = WindUI:CreateWindow({
    Title = "Twistzz Script | TPS STREET SOCCER Premium V0.01",
    Folder = "Twistzz Script",
    IconSize = 22 * 2,
    NewElements = true,
    Size = UDim2.fromOffset(550, 500),
    HideSearchBar = false,

    OpenButton = {
        Title = "Atlantic.dev",
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


do
    Window:Tag({
        Title = "Join Discord For W Script" ,
        Icon = "gamepad-2",
        Color = Color3.fromHex("#0000FF")
    })
end

do
    WindUI:AddTheme({
        Name = "CosmicBlue",
        
        -- Core Colors
        Accent = Color3.fromHex("#00FFFF"),         -- Bright Electric Blue for emphasis (links, highlights, active states)
        Dialog = Color3.fromHex("#030A1F"),         -- Deepest Blue for dialogs/pop-ups
        Outline = Color3.fromHex("#00FFFF"),        -- Matching accent for outlines
        Text = Color3.fromHex("#E0E0E0"),           -- Light Gray for main text
        Placeholder = Color3.fromHex("#A0A0A0"),    -- Neutral Gray for hints
        Button = Color3.fromHex("#1A1A1A"),         -- Slightly lighter than ElementBackground for interactive buttons
        Icon = Color3.fromHex("#66FFFF"),           -- Lighter Electric Blue for general icons
        
        -- Window & Main Background
        WindowBackground = Color3.fromHex("#030A1F"), -- Very deep, dark blue for the main application background
        
        -- Top Bar
        TopbarButtonIcon = Color3.fromHex("#66FFFF"),
        TopbarTitle = Color3.fromHex("#E0E0E0"),
        TopbarAuthor = Color3.fromHex("#A0A0A0"),
        TopbarIcon = Color3.fromHex("#00FFFF"),
        
        -- Tabs
        TabBackground = Color3.fromHex("#121212"),   -- Near-black background for the tab container
        TabTitle = Color3.fromHex("#E0E0E0"),
        TabIcon = Color3.fromHex("#66FFFF"),
        
        -- Elements (Buttons, Input Fields, Toggles)
        ElementBackground = Color3.fromHex("#66FFFF"), -- **High Contrast Black/Dark Gray** - This makes all elements clearly visible
        ElementTitle = Color3.fromHex("#E0E0E0"),
        ElementDesc = Color3.fromHex("#AAAAAA"),      -- Muted description text
        ElementIcon = Color3.fromHex("#66FFFF"),
    })

    WindUI:SetTheme("CosmicBlue")
end
local ST1 = Window:Section({
    Title = "Read",
})

local M = Window:Section({
    Title = "Main",
})

local MI = Window:Section({
    Title = "Misc",
})

local ST = Window:Section({
    Title = "Settings",
})
    local Read = ST1:Tab({
        Title = "Read",
        Icon = "info",
        IconColor = blue,
    })

        local R = M:Tab({
        Title = "Reach",
        Icon = "volleyball",
        IconColor = blue,
    })
            local MS = M:Tab({
        Title = "Mossing",
        Icon = "user",
        IconColor = blue,
    })

                local VS = M:Tab({
        Title = "Volleying",
        Icon = "footprints",
        IconColor = blue,
    })

    
                local RC = M:Tab({
        Title = "Reacts",
        Icon = "apple",
        IconColor = blue,
    })

        
                local P = MI:Tab({
        Title = "Player",
        Icon = "user-round-cog",
        IconColor = blue,
    })

                    local PP = MI:Tab({
        Title = "Ping & Performance",
        Icon = "ethernet-port",
        IconColor = blue,
    })

                        local H = MI:Tab({
        Title = "Helpers",
        Icon = "heart-handshake",
        IconColor = blue,
    })
    
                        local BM = MI:Tab({
        Title = "Ball Modifications",
        Icon = "pencil-off",
        IconColor = blue,
    })

                            local FG = MI:Tab({
        Title = "Gamepass",
        Icon = "banknote-x",
        IconColor = blue,
    })

                                local TL = MI:Tab({
        Title = "Teleporting",
        Icon = "bird",
        IconColor = blue,
    })

                                    local SC = MI:Tab({
        Title = "Sky Changer",
        Icon = "cloud",
        IconColor = blue,
    })

                                        local STT = ST:Tab({
        Title = "Settings",
        Icon = "settings",
        IconColor = blue,
    })


    
  ------------------------------------------------ READ TAB ----------------------------------------------
    local InviteCode = "B6rMyJXg4m"
            local DiscordServerParagraph = Read:Paragraph({
            Title = "Important",
            Desc = "This is the BETA version of this script, please join the Discord server to report any bugs or issues.",
            Buttons = {
                {
                    Title = "Copy link",
                    Icon = "link",
                    Callback = function()
                        setclipboard("https://discord.gg/" .. InviteCode)
                    end
                }
            }
        })
        

        
  ------------------------------------------------ REACH TAB ----------------------------------------------
local reachEnabled = false
local reachDistance = 1
local reachConnection

      R:Section({
        Title = [[Reach Legs (Normal) (Firetouchinterest)]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })
    


        R:Toggle({ Title = "Enable / Disable Reach (Firetouchinterest)",  Callback = function(Value) 
reachEnabled = Value

    if not Value and reachConnection then
        reachConnection:Disconnect()
        reachConnection = nil
    end


    if Value then
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
         end })


    R:Slider({
        Title = "Reach Size",
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
    R:Space()

          R:Section({
        Title = [[Reach Legs (Editing Size)]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })
    
    R:Space()
        R:Input({
        Flag = "InputTest",
        Title = "Legs Size (R6)",
        Desc = "This reach method is supported by solara / xeno.   Minimum Size is 1 if your put 0 you cant move anumore.",
        Value = "1",
        Type = "Textarea", -- or "Textarea"
        Placeholder = "Reach",
        Callback = function(Value) 
    game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(Value, 2, Value)
    game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(Value, 2, Value)
        game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
    game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
    game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(Value,2,Value)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        end
    })



        R:Input({
        Flag = "InputTest",
        Title = "Legs Size (R15)",
        Desc = "This reach method is supported by solara / xeno.   Minimum Size is 1 if your put 0 you cant move anymore.",
        Value = "1",
        Type = "Textarea", -- or "Textarea"
        Placeholder = "Reach",
        Callback = function(Value) 
    game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(Value, 2, Value)
    game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(Value, 2, Value)
        game.Players.LocalPlayer.Character["RightLowerLeg"].CanCollide = false
    game.Players.LocalPlayer.Character["LeftLowerLeg"].CanCollide = false
    game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(Value,2,Value)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        end
    })



R:Button({
    Title = "Fake legs (Appear Normal)",
    Icon = "",
    Justify = "Center",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        if humanoid.RigType == Enum.HumanoidRigType.R6 then
            WindUI:Notify({
                Title = "Applied",
                Desc = "",
                Icon = "check",
            })

            -- Your original code, untouched
            game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
            game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

            game.Players.LocalPlayer.Character["Left Leg"].Massless = true
            LeftLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
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
            RightLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
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
            WindUI:Notify({
                Title = "Applied",
                Desc = "",
                Icon = "check",
            })

            game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = 1
            game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = 1
        end
    end
})
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local headReachEnabled = false
local headReachSize = Vector3.new(1, 1.5, 1)
local headTransparency = 0.5
local headOffset = Vector3.new(0, 0, 0) -- offset relative to Head
local headBoxPart
local headConnection

local function updateHeadBox()
    if headBoxPart then headBoxPart:Destroy() end
    headBoxPart = Instance.new("Part")
    headBoxPart.Size = headReachSize
    headBoxPart.Transparency = headTransparency
    headBoxPart.Anchored = true
    headBoxPart.CanCollide = false
    headBoxPart.Color = Color3.fromRGB(255, 105, 180) -- Pink color
    headBoxPart.Material = Enum.Material.Neon -- Neon material
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

--------------------------------------------------------
-- UI WITH MS
--------------------------------------------------------

MS:Toggle({
    Flag = "EnableHeadReach",
    Title = "Enable / Disable Moss & Head Reach",
    Desc = "",
    Default = false,
    Callback = function(state)
        headReachEnabled = state
        if state then startHeadReach() else stopHeadReach() end
    end
})

-- X SLIDER
MS:Slider({
    Title = "Reach X",
    Desc = "",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = { Min = 0, Max = 50, Default = 1 },
    Callback = function(val)
        headReachSize = Vector3.new(val, headReachSize.Y, headReachSize.Z)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

-- Y SLIDER (with automatic offset)
MS:Slider({
    Title = "Reach Y",
    Desc = "",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = { Min = 0, Max = 50, Default = 1.5 },
    Callback = function(val)
        headReachSize = Vector3.new(headReachSize.X, val, headReachSize.Z)
        headOffset = Vector3.new(headOffset.X, val / 2.5, headOffset.Z)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

-- Z SLIDER
MS:Slider({
    Title = "Reach Z",
    Desc = "",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = { Min = 0, Max = 50, Default = 1 },
    Callback = function(val)
        headReachSize = Vector3.new(headReachSize.X, headReachSize.Y, val)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

-- Appear Normal Toggle
MS:Toggle({
    Flag = "AppearNormal",
    Title = "Appear Normal",
    Desc = "",
    Default = false,
    Callback = function(v)
        headTransparency = v and 1 or 0.5
        if headReachEnabled and headBoxPart then
            headBoxPart.Transparency = headTransparency
        end
    end
})


--------------------------------------------------------
-- SECTION: Percentage
--------------------------------------------------------

MS:Section({ Title = "Percentage" })

MS:Toggle({
    Flag = "EnablePercentage",
    Title = "Enable / Disable Percentage",
    Desc = "",
    Default = false,
    Callback = function(state)
        usePercentage = state
        if state then
            local size = percentageValue * 0.1
            headReachSize = getAdjustedSize(size, headReachSize.Y, size)
            updateHeadOffset()
            startHeadReach()
        end
    end
})

MS:Slider({
    Title = "Percentage",
    Desc = "",
    Width = 200,
    Step = 1,
    Value = { Min = 1, Max = 100, Default = 1 },
    Callback = function(value)
        percentageValue = value
        if usePercentage then
            local size = value * 0.1
            headReachSize = getAdjustedSize(size, headReachSize.Y, size)
            updateHeadOffset()
            startHeadReach()
        end
    end
})


--------------------------------------------------------
-- SECTION: Moss Configs
--------------------------------------------------------

MS:Section({ Title = "Moss Configs" })

local function createMossReachButton(title, percentage)
    MS:Button({
        Title = title,
        Justify = "Center",
        Callback = function()
            local size = percentage * 0.2
            headReachSize = getAdjustedSize(size, headReachSize.Y, size)
            updateHeadOffset()
            startHeadReach()
        end
    })
end

for percent = 25, 100, 5 do
    createMossReachButton("Moss " .. percent .. "%", percent)
end



          VS:Section({
        Title = [[Volley Reach]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })
    

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Default values
local reachEnabled = false
local reachDistance = 10
local reachConnection = nil
local volleyPart = nil -- Will be set based on team selection
local insideVolley = false

-- Function to check if player is inside volley part
local function checkInsideZone()
    if not volleyPart then return false end
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    local pos = root.Position
    local min = volleyPart.Position - (volleyPart.Size / 2)
    local max = volleyPart.Position + (volleyPart.Size / 2)

    return pos.X >= min.X and pos.X <= max.X and
           pos.Y >= min.Y and pos.Y <= max.Y and
           pos.Z >= min.Z and pos.Z <= max.Z
end

-- Function to start reach loop
local function startReachLoop()
    if reachConnection then
        reachConnection:Disconnect()
        reachConnection = nil
    end

    if not reachEnabled or not volleyPart then return end

    reachConnection = RunService.RenderStepped:Connect(function()
        insideVolley = checkInsideZone()
        if not insideVolley then return end -- only reach inside zone

        local character = player.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        local humanoid = character and character:FindFirstChild("Humanoid")
        if not (character and rootPart and humanoid) then return end

        local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
        if not tps then return end

        local distance = (rootPart.Position - tps.Position).Magnitude
        if distance <= reachDistance then
            local prefFolder = game.Lighting:FindFirstChild(player.Name)
            local preferredFoot = prefFolder and prefFolder:FindFirstChild("PreferredFoot")
            if not preferredFoot then return end

            local limbName
            if humanoid.RigType == Enum.HumanoidRigType.R6 then
                limbName = (preferredFoot.Value == 1) and "Right Leg" or "Left Leg"
            else
                limbName = (preferredFoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg"
            end

            local limb = character:FindFirstChild(limbName)
            if limb then
                firetouchinterest(limb, tps, 0)
                firetouchinterest(limb, tps, 1)
            end
        end
    end)
end

-- Loop to continuously update insideVolley state
task.spawn(function()
    while true do
        task.wait(0.1)
        insideVolley = checkInsideZone()
    end
end)

local S = VS:Paragraph({
    Title = "What is Volley Reach",
    Desc = "Volley Reach only activates when you are inside the box. Please make sure to select your team before enabling it, so the reach is applied to the correct box."
})


-- ==== UI ====
VS:Button({
    Title = "Blue Team",
    Icon = "",
    Justify = "Center",
    Callback = function()
        volleyPart = workspace.GKSystem:FindFirstChild("Fix1")
        if volleyPart then
            volleyPart.Size = Vector3.new(85, 15.479999542236328, 34.80000305175781)
        end

    end
})

VS:Button({
    Title = "Red Team",
    Icon = "",
    Justify = "Center",
    Callback = function()
        volleyPart = workspace.GKSystem:FindFirstChild("Fix2")
        if volleyPart then
            volleyPart.Size = Vector3.new(85, 15.479999542236328, 34.80000305175781)
        end

    end
})

VS:Toggle({
    Flag = "Enable / Disable Volley Reach",
    Title = "Enable / Disable Volley Reach",
    Desc = "Enable or disable volley reach when in zone",
    Default = false,
    Callback = function(state)
        reachEnabled = state
        startReachLoop()
    end
})

VS:Slider({
    Title = "Volley Reach Size",
    Desc = "Adjust your reach distance",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = {
        Min = 0,
        Max = 15,
        Default = 1,
    },
    Callback = function(value)
        reachDistance = value
    end
})


          VS:Section({
        Title = [[Volleying Reacts (More Soon...)]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })
    
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

VS:Button({
    Title = "Volley React",
    Icon = "",
    Justify = "Center",
    Callback = function()
        local reachEnabled = true
        local reachDistance = 3.75
        local reachConnection = nil
        local insideVolley = false

        -- Determine the correct volley part based on team
        local function getTeamVolleyPart()
            if player.Team then
                if player.Team.Name == "Blue" then
                    return workspace.GKSystem:FindFirstChild("Fix1")
                elseif player.Team.Name == "Red" then
                    return workspace.GKSystem:FindFirstChild("Fix2")
                end
            end
            return nil
        end

        local volleyPart = getTeamVolleyPart()
        if not volleyPart then

            return
        end

        -- Optional: set size for clarity
        volleyPart.Size = Vector3.new(85, 15.479999542236328, 34.80000305175781)

        -- Function to check if player is inside the zone
        local function checkInsideZone()
            local char = player.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if not root then return false end

            local pos = root.Position
            local min = volleyPart.Position - (volleyPart.Size / 2)
            local max = volleyPart.Position + (volleyPart.Size / 2)

            return pos.X >= min.X and pos.X <= max.X and
                   pos.Y >= min.Y and pos.Y <= max.Y and
                   pos.Z >= min.Z and pos.Z <= max.Z
        end

        -- Function to start the reach loop
        local function startReachLoop()
            if reachConnection then
                reachConnection:Disconnect()
                reachConnection = nil
            end

            if not reachEnabled or not volleyPart then return end

            reachConnection = RunService.RenderStepped:Connect(function()
                insideVolley = checkInsideZone()
                if not insideVolley then return end

                local character = player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                local humanoid = character and character:FindFirstChild("Humanoid")
                if not (character and rootPart and humanoid) then return end

                local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
                if not tps then return end

                local distance = (rootPart.Position - tps.Position).Magnitude
                if distance <= reachDistance then
                    local prefFolder = game.Lighting:FindFirstChild(player.Name)
                    local preferredFoot = prefFolder and prefFolder:FindFirstChild("PreferredFoot")
                    if not preferredFoot then return end

                    local limbName
                    if humanoid.RigType == Enum.HumanoidRigType.R6 then
                        limbName = (preferredFoot.Value == 1) and "Right Leg" or "Left Leg"
                    else
                        limbName = (preferredFoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg"
                    end

                    local limb = character:FindFirstChild(limbName)
                    if limb then
                        firetouchinterest(limb, tps, 0)
                        firetouchinterest(limb, tps, 1)
                    end
                end
            end)
        end

        -- Start the loop
        startReachLoop()

        -- Optional: continuously update insideVolley (for safety)
        task.spawn(function()
            while reachEnabled do
                task.wait(0.1)
                insideVolley = checkInsideZone()
            end
        end)


    end
})



VS:Toggle({
    Flag = "EnableVolleyReact2",
    Title = "Enable / Disable Ball Collision",
    Desc = "",
    Default = false,
    Callback = function(state)
        if state then
local TPS = workspace:WaitForChild("TPSSystem"):WaitForChild("TPS")

-- Create the part
local follower = Instance.new("Part")
follower.Name = "FollowerPart"
follower.Shape = Enum.PartType.Ball
follower.Anchored = true
follower.CanCollide = true
follower.Material = Enum.Material.Air
follower.Color = TPS.Color -- Start with same color
follower.Parent = workspace

-- Sync function
local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function()
    if TPS then
        -- Match size
        follower.Size = TPS.Size
        
        -- Match position (and rotation)
        follower.CFrame = TPS.CFrame
        
        -- Match color
        follower.Color = TPS.Color
    end
end)

else 

    if workspace.FollowerPart then 
        workspace.FollowerPart:Destroy()
    end

end

    end
})


          RC:Section({
        Title = [[Old Ball Collision]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })



RC:Toggle({
    Flag = "",
    Title = "Enable / Disable Ball Collision",
    Desc = "",
    Default = false,
    Callback = function(state)
        if state then
local TPS = workspace:WaitForChild("TPSSystem"):WaitForChild("TPS")

-- Create the part
local follower = Instance.new("Part")
follower.Name = "FollowerPart"
follower.Shape = Enum.PartType.Ball
follower.Anchored = true
follower.CanCollide = true
follower.Material = Enum.Material.Air
follower.Color = TPS.Color -- Start with same color
follower.Parent = workspace

-- Sync function
local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function()
    if TPS then
        -- Match size
        follower.Size = TPS.Size
        
        -- Match position (and rotation)
        follower.CFrame = TPS.CFrame
        
        -- Match color
        follower.Color = TPS.Color
    end
end)

else 

    if workspace.FollowerPart then 
        workspace.FollowerPart:Destroy()
    end

end

    end
})


          RC:Section({
        Title = [[Reduce Ball Delay]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

RC:Button({
    Title = "Reduce Ball Delay",
    Icon = "",
    Justify = "Center",
    Callback = function()

						workspace.TPSSystem.TPS.MainAttachment:Destroy()


    end
})


          RC:Section({
        Title = [[Better React]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

RC:Button({
    Title = "Better React",
    Icon = "",
    Justify = "Center",
    Callback = function()

					game.Workspace.TPSSystem.TPS.Velocity = Vector3.new(100, 100, 100)

    end
})




          RC:Section({
        Title = [[Alz React]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

RC:Button({
    Title = "Alz React",
    Icon = "",
    Justify = "Center",
    Callback = function()

    game.Workspace.TPSSystem.TPS.Velocity = Vector3.new(100, 100, 100)

    end
})

          RC:Section({
        Title = [[Foxtede React]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

RC:Button({
    Title = "Foxtede React",
    Icon = "",
    Justify = "Center",
    Callback = function()

    game.Workspace.TPSSystem.TPS.Velocity = Vector3.new(110, 110, 110)

    end
})


          RC:Section({
        Title = [[Goalkeeper React]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

RC:Button({
    Title = "Goalkeeper React",
    Icon = "",
    Justify = "Center",
    Callback = function()

        local gkActions = {"SaveRA", "SaveLA", "SaveRL", "SaveLL", "SaveT", "Tackle", "Header"}

        for _, action in ipairs(gkActions) do
            local meta = getrawmetatable(game)
            local oldNamecall = meta.namecall
            setreadonly(meta, false)

            meta.namecall = newcclosure(function(self, ...)
                local method = tostring(getnamecallmethod())
                if method == "FireServer" and tostring(self) == action then
                    local args = {...}
                    args[2] = player.Character.Humanoid.LLCL
                    return oldNamecall(self, unpack(args))
                end
                return oldNamecall(self, ...)
            end)

            setreadonly(meta, true)
        end

    end
})

          P:Section({
        Title = [[Walkspeed]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })


local WalkspeedEnabled = false
local CurrentSpeed = 23 
    

P:Toggle({
    Flag = "Enable / Disable Walkspeed",
    Title = "Enable / Disable Walkspeed",
    Desc = "",
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

P:Slider({
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


        P:Keybind({
        Flag = "Reset Walkspeed back",
        Title = "Reset Walkspeed Back To Default",
        Desc = "",
        Value = "",
        Callback = function(v)
               local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = 23
            end
        end
    })


P:Keybind({
    Flag = "",
    Title = "Restore Walkspeed from Slider",
    Desc = "",
    Value = "",
    Callback = function(v)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            -- enable walkspeed and apply slider value
            WalkspeedEnabled = true
            character:FindFirstChildOfClass("Humanoid").WalkSpeed = CurrentSpeed
        end
    end
})

          P:Section({
        Title = [[Jump Power]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })


local JumpEnabled = false
local CurrentJump = 50 
    

P:Toggle({
    Flag = "",
    Title = "Enable / Disable Jump Power",
    Desc = "",
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

P:Slider({
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


        P:Keybind({
        Flag = "R",
        Title = "Reset Jump Power Back To Default",
        Desc = "",
        Value = "",
        Callback = function(v)
           local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                character:FindFirstChildOfClass("Humanoid").JumpPower = 50
            end
        end
    })

P:Keybind({
    Flag = "",
    Title = "Restore Jump Power from Slider",
    Desc = "Sets your Jump Power to the value currently selected in the slider",
    Value = "",
    Callback = function(v)
        JumpEnabled = true
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            character:FindFirstChildOfClass("Humanoid").JumpPower = CurrentJump
        end
    end
})

          P:Section({
        Title = [[Avatar Stolen]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

    

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

-- Automatically reapply disguise when character respawns
lplr.CharacterAdded:Connect(function(char)
    if Disguise.Enabled then
        DisguiseCharacter(char)
    else
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ApplyDescriptionClientServer(Players:GetHumanoidDescriptionAsync(lplr.UserId))
        end
    end
end)

-- Toggle UI
P:Toggle({
    Flag = "",
    Title = "Enable / Disable Avatar Stolen",
    Desc = "",
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

-- Input UI for username
P:Input({
    Flag = "Avatar Stolen",
    Title = "Avatar Stolen",
    Desc = "Write user here.",
    Value = "Default value",
    InputIcon = "bird",
    Type = "Input",
    Placeholder = "Enter user...",
    Callback = function(input)
        DisguiseUsername.Value = input
        if Disguise.Enabled and lplr.Character then
            DisguiseCharacter(lplr.Character)
        end
    end
})


          PP:Section({
        Title = [[Clumsy]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })


    PP:Input({
    Flag = "Clumsy",
    Title = "Clumsy",
    Desc = "Only use numbers between 0.01 - 0.10",
    Value = "0",
    InputIcon = "",
    Type = "Input",
    Placeholder = "",
    Callback = function(Value)
            settings():GetService("NetworkSettings").IncomingReplicationLag = tonumber(Value)
    end
})



          PP:Section({
        Title = [[FPS Unlocker]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })
PP:Button({ Title = "Unlock FPS", Justify = "Center", Icon = "", Callback = function() 
setfpscap(10000) 
end })
PP:Button({
    Title = "Track FPS",
    Justify = "Center",
    Icon = "",
    Callback = function()

        -- UI
        local ScreenGui = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local FPSLabel = Instance.new("TextLabel")
        local TitleLabel = Instance.new("TextLabel")

        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        ScreenGui.ResetOnSpawn = false

        Frame.Parent = ScreenGui
        Frame.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
        Frame.Position = UDim2.new(0.0228, 0, 0.0541, 0)
        Frame.Size = UDim2.new(0, 79, 0, 56)
        Frame.Active = true
        Frame.Draggable = true

        UICorner.Parent = Frame

        FPSLabel.Parent = Frame
        FPSLabel.BackgroundTransparency = 1
        FPSLabel.Position = UDim2.new(0, 0, 0.35, 0)
        FPSLabel.Size = UDim2.new(1, 0, 0.6, 0)
        FPSLabel.Font = Enum.Font.SourceSansBold
        FPSLabel.Text = "0"
        FPSLabel.TextSize = 34
        FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        FPSLabel.TextWrapped = true

        TitleLabel.Parent = Frame
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Position = UDim2.new(0, 0, 0.05, 0)
        TitleLabel.Size = UDim2.new(1, 0, 0.3, 0)
        TitleLabel.Font = Enum.Font.SourceSansBold
        TitleLabel.Text = "FPS"
        TitleLabel.TextScaled = true
        TitleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)

        -- FPS LOGIC (REAL FPS)
        local RunService = game:GetService("RunService")
        local lastTime = tick()
        local frames = 0

        RunService.RenderStepped:Connect(function()
            frames += 1
            local now = tick()

            if now - lastTime >= 1 then
                local fps = math.floor(frames / (now - lastTime))
                FPSLabel.Text = tostring(fps)

                -- Color logic
                if fps >= 120 then
                    FPSLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                elseif fps >= 60 then
                    FPSLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
                else
                    FPSLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                end

                lastTime = now
                frames = 0
            end
        end)
    end
})

PP:Button({ Title = "Fake Ping 20-30", Justify = "Center", Icon = "", Callback = function() 
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local PerfStats = CoreGui:WaitForChild("RobloxGui"):WaitForChild("PerformanceStats")

local valueLabel
local barFrame

-- Find NetworkPing PS_Button
for _, button in ipairs(PerfStats:GetChildren()) do
    if button.Name == "PS_Button" then
        local panel = button:FindFirstChild("StatsMiniTextPanelClass")
        if panel then
            local title = panel:FindFirstChild("TitleLabel")
            local value = panel:FindFirstChild("ValueLabel")

            if title and value and title.Text == "NetworkPing" then
                valueLabel = value

                -- Get PS_BarFrame
                local graph = value.Parent.Parent:FindFirstChild("PS_AnnotatedGraph")
                if graph then
                    barFrame = graph:FindFirstChild("PS_BarFrame")
                end
                break
            end
        end
    end
end

if not valueLabel then
    warn("NetworkPing ValueLabel not found")
    return
end

-- Fake ping state
local fakePing = math.random(20, 25)
local decimal = math.random(0, 99)
local timer = 0
local changeInterval = 0.7 -- how often ping value changes

-- FORCE override every frame
RunService.RenderStepped:Connect(function(dt)
    timer += dt
    if timer >= changeInterval then
        timer = 0
        fakePing += math.random(-1, 1)
        fakePing = math.clamp(fakePing, 18, 30)
        decimal = math.random(0, 99)
    end

    -- Always force text (prevents real ping coming back)
    valueLabel.Text = string.format("%d.%02d ms", fakePing, decimal)

    -- Force graph bar yellow
    if barFrame then
        for _, v in ipairs(barFrame:GetDescendants()) do
            if v:IsA("Frame") then
                v.BackgroundColor3 = Color3.fromRGB(255, 221, 0) -- yellow
            elseif v:IsA("UIStroke") then
                v.Color = Color3.fromRGB(255, 221, 0)
            elseif v:IsA("ImageLabel") then
                v.ImageColor3 = Color3.fromRGB(255, 221, 0)
            end
        end
    end
end)

end })
PP:Button({ Title = "FPS Boost", Justify = "Center", Icon = "", Callback = function() 
              getgenv().Kitten = 5
local function applyOptimizations()
    local workspace = game.Workspace
    local lighting = game.Lighting
    local terrain = workspace.Terrain
    local starterGui = game:GetService("StarterGui")

    terrain.WaterWaveSize = 0
    terrain.WaterWaveSpeed = 0
    terrain.WaterReflectance = 0
    terrain.WaterTransparency = 0

    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    lighting.Brightness = 0

    settings().Rendering.QualityLevel = "Level01"

    for _, descendant in pairs(game:GetDescendants()) do
        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            descendant.Material = "SmoothPlastic"
            descendant.Reflectance = 0
            descendant.CastShadow = false
        elseif descendant:IsA("Decal") then
            descendant.Transparency = 1
        elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
            descendant.Lifetime = NumberRange.new(0)
        elseif descendant:IsA("Explosion") then
            descendant.BlastPressure = 1
            descendant.BlastRadius = 1
        elseif descendant:IsA("Fire") or descendant:IsA("SpotLight") or descendant:IsA("Smoke") then
            descendant.Enabled = false
        end
    end

    for _, effect in pairs(lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("DepthOfFieldEffect") then
            effect.Enabled = false
        end
    end


    starterGui:SetCore("SendNotification", {
        Title = "FPS Boost",
        Text = "The FPS Boost has applied!",
        Duration = 7,
        Style = {
            Title = {
                Font = Enum.Font.SourceSansBold,
                TextSize = 20,
                TextStrokeTransparency = 0,
                TextColor = Color3.new(1, 1, 1),
            },
            Background = {
                Transparency = 0.1,
                BackgroundColor3 = Color3.new(0, 0.7, 1),
                BorderSizePixel = 0,
            },
        },
    })


end

applyOptimizations()
end })

          H:Section({
        Title = [[ZZZZ Helper]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

    H:Toggle({
    Flag = "",
    Title = "Enable / Disable ZZZZ Helper",
    Desc = "",
    Default = false,
    Callback = function(state)
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

         H:Section({
        Title = [[Air Dribble Helper]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

        H:Toggle({
    Flag = "",
    Title = "Enable / Disable Air Dribble Helper",
    Desc = "",
    Default = false,
    Callback = function(state)
if Value then
       warn("Enabled ")
    else 
        for _, child in ipairs(game.Workspace:GetChildren()) do
            if child.Name == "TPS" then
                child:Destroy()
            end
        end
    end
    end
})


  
    H:Slider({
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
    })


             H:Section({
        Title = [[Inf Dribble Helper]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

    




local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local ball = game.Workspace.TPSSystem.TPS
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local followBall = false
local isMovingManually = false
local toggleEnabled = false 

local function follow()
    if followBall and not isMovingManually and toggleEnabled then
        character.Humanoid:MoveTo(ball.Position)
    end
end


userInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType == Enum.UserInputType.MouseMovement then
        isMovingManually = false
    end
end)


userInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.B and not gameProcessed and toggleEnabled then
        followBall = not followBall
        if followBall then
            print("Following the ball")
        else
            print("Stopped following the ball")
        end
    end
end)


runService.RenderStepped:Connect(function()
    if followBall and toggleEnabled then
        follow()
    end
end)


player.CharacterAdded:Connect(function(char)
    character = char
end)
        H:Toggle({
    Flag = "",
    Title = "Enable / Disable Air Dribble Helper [PC]",
    Desc = "Toggle it by pressing (B)",
    Default = false,
    Callback = function(state)
    toggleEnabled = Value
    if toggleEnabled then

    else
        followBall = false


    end
    end
})

        H:Toggle({
    Flag = "",
    Title = "Enable / Disable Air Dribble Helper [MOB]",
    Desc = "it will make a GUI in your screen to control it.",
    Default = false,
    Callback = function(Value)
toggleEnabled = Value


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




             BM:Section({
        Title = [[Ball Modifications]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })


        BM:Input({
        Flag = "I",
        Title = "Ball Size",
        Desc = "",
        Value = "2.6",
        Type = "Textarea", -- or "Textarea"
        Placeholder = "Reach",
        Callback = function(size) 
            workspace.TPSSystem.TPS.Size = Vector3.new(size, size, size)
        end
    })

    BM:Button({
        Title = "Anti-Ball Fling ",
        Justify = "Center",
        IconAlign = "Left",
        Icon = "", -- removing icon
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

        BM:Toggle({
    Flag = "",
    Title = "Enable / Disable Ball Prediction",
    Desc = "",
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




BM:Toggle({
    Flag = "",
    Title = "Enable / Disable Ball Collision",
    Desc = "",
    Default = false,
    Callback = function(state)
        if state then
local TPS = workspace:WaitForChild("TPSSystem"):WaitForChild("TPS")

-- Create the part
local follower = Instance.new("Part")
follower.Name = "FollowerPart"
follower.Shape = Enum.PartType.Ball
follower.Anchored = true
follower.CanCollide = true
follower.Material = Enum.Material.Air
follower.Color = TPS.Color -- Start with same color
follower.Parent = workspace

-- Sync function
local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function()
    if TPS then
        -- Match size
        follower.Size = TPS.Size
        
        -- Match position (and rotation)
        follower.CFrame = TPS.CFrame
        
        -- Match color
        follower.Color = TPS.Color
    end
end)

else 

    if workspace.FollowerPart then 
        workspace.FollowerPart:Destroy()
    end

end

    end
})



   BM:Dropdown({
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


       BM:Dropdown({
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
            },          {
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


                 FG:Section({
        Title = [[Free Gamepasses]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

    
    local Players = game:GetService("Players")
local player = Players.LocalPlayer
local workspace = game:GetService("Workspace")

local AnimationCurveLoop
local AnimationTackleLoop

--------------------------------------------------
-- MORE CURVE
--------------------------------------------------
FG:Toggle({
    Flag = "MoreCurve",
    Title = "More Curve",
    Desc = "",
    Default = false,
    Callback = function(state)
        local gui = player.PlayerGui.Start.GamePassMenu.Items.WoodenFloor
        gui.Tick.Visible = state
        gui.WoodenFloor.Style = state and "RobloxRoundButton" or "RobloxRoundDefaultButton"

        if state then
            local Humanoid = player.Character:WaitForChild("Humanoid")
            AnimationCurveLoop = Humanoid.AnimationPlayed:Connect(function(AnimationTrack)
                local trackNames = {
                    "OldMKickL","OldMKick","OldLKickL","OldLKick",
                    "MKickL","MKick","LKickL","LKick",
                    "OldDribbleL","OldDribble","DribbleL","Dribble"
                }

                if table.find(trackNames, AnimationTrack.Name) then
                    if (player.Character.HumanoidRootPart.Position - workspace.TPSSystem.TPS.Position).Magnitude < 3.45 then
                        local event = workspace.FE.Actions[state and "KickC1" or "KickC2"]
                        local A_1, A_2 = workspace.TPSSystem.TPS, player.Character.HumanoidRootPart
                        event:FireServer(A_1, A_2)
                        task.wait(0.2)
                        event:FireServer(A_1, A_2)
                    end
                end
            end)
        else
            if AnimationCurveLoop then
                AnimationCurveLoop:Disconnect()
                AnimationCurveLoop = nil
            end
        end
    end
})

--------------------------------------------------
-- BLUE FLAME
--------------------------------------------------
FG:Toggle({
    Flag = "BlueFlame",
    Title = "Blue Flame",
    Desc = "",
    Default = false,
    Callback = function(state)
        if not state then return end

        local start = player.PlayerGui:WaitForChild("Start")
        start.PowerShot.Flame.Image = "rbxassetid://15316155280"
        start.PowerShot.Flame.Flame.Image = "rbxassetid://15316155280"

        player.Backpack.FValue.Value = 2

        local item = start.GamePassMenu.Items.BlueFlame
        item.Tick.Visible = true
        item.BlueFlame.Image = ""
        item.BlueFlame.HoverImage = ""
        item.BlueFlame.PressedImage = ""
        item.BlueFlame.Text.Visible = false
    end
})

--------------------------------------------------
-- UNLOCK COOLDOWN
--------------------------------------------------
FG:Toggle({
    Flag = "UnlockCooldown",
    Title = "Unlock Cooldown",
    Desc = "",
    Default = false,
    Callback = function(state)
        if not state then return end

        local start = player.PlayerGui:WaitForChild("Start")
        start.PowerShot.PowerValue.Value = 30

        local item = start.GamePassMenu.Items.Cooldown
        item.Tick.Visible = true
        item.Cooldown.Image = ""
        item.Cooldown.HoverImage = ""
        item.Cooldown.PressedImage = ""
        item.Cooldown.Text.Visible = false
    end
})

--------------------------------------------------
-- POWERFUL TACKLE
--------------------------------------------------
FG:Toggle({
    Flag = "PowerfulTackle",
    Title = "Powerful Tackle",
    Desc = "",
    Default = false,
    Callback = function(state)
        local gui = player.PlayerGui.Start.GamePassMenu.Items.RandomWeather
        gui.Tick.Visible = state
        gui.RandomWeather.Style = state and "RobloxRoundButton" or "RobloxRoundDefaultButton"
        player.Backpack.TackleGamePass.Value = state

        if state then
            local Humanoid = player.Character:WaitForChild("Humanoid")
            AnimationTackleLoop = Humanoid.AnimationPlayed:Connect(function(AnimationTrack)
                if AnimationTrack.Name:match("Tackle") then
                    if (player.Character.HumanoidRootPart.Position - workspace.TPSSystem.TPS.Position).Magnitude < 4.87 then
                        task.wait(0.8)
                        workspace.FE.Actions.KickG1:FireServer(
                            workspace.TPSSystem.TPS,
                            player.Character.HumanoidRootPart,
                            30,
                            Vector3.new(4000000, 700, 4000000)
                        )
                    end
                end
            end)
        else
            if AnimationTackleLoop then
                AnimationTackleLoop:Disconnect()
                AnimationTackleLoop = nil
            end
        end
    end
})


                 TL:Section({
        Title = [[Teleporting]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })


    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local TPS = workspace:WaitForChild("TPSSystem"):WaitForChild("TPS")

local Target = nil
local teleporting = false
local connection

--// Loop Teleport To Ball
TL:Toggle({
    Flag = "LoopTeleportBall",
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

--// Target Player Input
TL:Input({
    Title = "Target Player Username",
    Icon = "user",
    Callback = function(value)
        local targetPlayer = Players:FindFirstChild(value)
        Target = targetPlayer
    end
})

--// Teleport To Player
TL:Button({
    Title = "Teleport To Player",
    Icon = "",
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

--// Teleport Above Player
TL:Button({
    Title = "Teleport Above Player",
    Icon = "",
    Justify = "Center",
    Callback = function()
        if Target
        and player.Character
        and Target.Character
        and player.Character:FindFirstChild("HumanoidRootPart")
        and Target.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame =
                Target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
        end
    end
})

--// Teleport Under Player
TL:Button({
    Title = "Teleport Under Player",
    Icon = "",
    Justify = "Center",
    Callback = function()
        if Target
        and player.Character
        and Target.Character
        and player.Character:FindFirstChild("HumanoidRootPart")
        and Target.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame =
                Target.Character.HumanoidRootPart.CFrame + Vector3.new(0, -5, 0)
        end
    end
})

--// Teleport To Random Player
TL:Button({
    Title = "Teleport To Random Player",
    Icon = "",
    Justify = "Center",
    Callback = function()
        local others = {}

        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(others, p)
            end
        end

        if #others > 0 then
            local target = others[math.random(#others)]
            player.Character.HumanoidRootPart.CFrame =
                target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        else
            warn("Teleportation Failed: No other players found")
        end
    end
})

--// Teleport To Closest Player
TL:Button({
    Title = "Teleport To Closest Player",
    Icon = "",
    Justify = "Center",
    Callback = function()
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end

        local hrp = char.HumanoidRootPart
        local closest, dist = nil, math.huge

        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local d = (hrp.Position - p.Character.HumanoidRootPart.Position).Magnitude
                if d < dist then
                    dist = d
                    closest = p
                end
            end
        end

        if closest then
            hrp.CFrame = closest.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        else
            warn("Teleportation Failed: No other players found")
        end
    end
})

--// Teleport To Red Goal
TL:Button({
    Title = "Teleport To Red Goal",
    Icon = "",
    Justify = "Center",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        hrp.CFrame = workspace.RedGoal.Part.CFrame + Vector3.new(0, 3, 0)
    end
})

--// Teleport To Blue Goal
TL:Button({
    Title = "Teleport To Blue Goal",
    Icon = "",
    Justify = "Center",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        hrp.CFrame = workspace.BlueGoal.Part.CFrame + Vector3.new(0, 3, 0)
    end
})

local Lighting = game:GetService("Lighting")

local function SetSky(data, stars)
    if Lighting:FindFirstChildOfClass("Sky") then
        Lighting:FindFirstChildOfClass("Sky"):Destroy()
    end

    local sky = Instance.new("Sky")
    sky.SkyboxBk = data.Bk
    sky.SkyboxDn = data.Dn
    sky.SkyboxFt = data.Ft
    sky.SkyboxLf = data.Lf
    sky.SkyboxRt = data.Rt
    sky.SkyboxUp = data.Up
    sky.StarCount = stars or 3000
    sky.Parent = Lighting
end



         SC:Section({
        Title = [[Sky Changer]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

    SC:Button({
    Title = "Night Sky",
    Icon = "",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=12064107",
            Dn="http://www.roblox.com/asset/?id=12064152",
            Ft="http://www.roblox.com/asset/?id=12064121",
            Lf="http://www.roblox.com/asset/?id=12063984",
            Rt="http://www.roblox.com/asset/?id=12064115",
            Up="http://www.roblox.com/asset/?id=12064131",
        }, 0)
    end
})

SC:Button({
    Title = "Scary Night",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=48020371",
            Dn="http://www.roblox.com/asset/?id=48020144",
            Ft="http://www.roblox.com/asset/?id=48020234",
            Lf="http://www.roblox.com/asset/?id=48020211",
            Rt="http://www.roblox.com/asset/?id=48020254",
            Up="http://www.roblox.com/asset/?id=48020383",
        }, 3000)
    end
})

SC:Button({
    Title = "Sakura Sky",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=271042516",
            Dn="http://www.roblox.com/asset/?id=271077243",
            Ft="http://www.roblox.com/asset/?id=271042556",
            Lf="http://www.roblox.com/asset/?id=271042310",
            Rt="http://www.roblox.com/asset/?id=271042467",
            Up="http://www.roblox.com/asset/?id=271077958",
        }, 1334)
    end
})

SC:Button({
    Title = "Galaxy Planets",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=15983968922",
            Dn="http://www.roblox.com/asset/?id=15983966825",
            Ft="http://www.roblox.com/asset/?id=15983965025",
            Lf="http://www.roblox.com/asset/?id=15983967420",
            Rt="http://www.roblox.com/asset/?id=15983966246",
            Up="http://www.roblox.com/asset/?id=15983964246",
        })
    end
})

SC:Button({
    Title = "Purple Night Sky",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=5084575798",
            Dn="http://www.roblox.com/asset/?id=5084575916",
            Ft="http://www.roblox.com/asset/?id=5103949679",
            Lf="http://www.roblox.com/asset/?id=5103948542",
            Rt="http://www.roblox.com/asset/?id=5103948784",
            Up="http://www.roblox.com/asset/?id=5084576400",
        })
    end
})

SC:Button({
    Title = "Sunset Orange",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=458016711",
            Dn="http://www.roblox.com/asset/?id=458016826",
            Ft="http://www.roblox.com/asset/?id=458016532",
            Lf="http://www.roblox.com/asset/?id=458016655",
            Rt="http://www.roblox.com/asset/?id=458016782",
            Up="http://www.roblox.com/asset/?id=458016792",
        })
    end
})

SC:Button({
    Title = "Purple Sky",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=570557514",
            Dn="http://www.roblox.com/asset/?id=570557775",
            Ft="http://www.roblox.com/asset/?id=570557559",
            Lf="http://www.roblox.com/asset/?id=570557620",
            Rt="http://www.roblox.com/asset/?id=570557672",
            Up="http://www.roblox.com/asset/?id=570557727",
        })
    end
})

SC:Button({
    Title = "Gray Sky",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=18703245834",
            Dn="http://www.roblox.com/asset/?id=18703243349",
            Ft="http://www.roblox.com/asset/?id=18703240532",
            Lf="http://www.roblox.com/asset/?id=18703237556",
            Rt="http://www.roblox.com/asset/?id=18703235430",
            Up="http://www.roblox.com/asset/?id=18703232671",
        }, 3500)
    end
})

SC:Button({
    Title = "Mountain Sky",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=160188495",
            Dn="http://www.roblox.com/asset/?id=160188614",
            Ft="http://www.roblox.com/asset/?id=160188609",
            Lf="http://www.roblox.com/asset/?id=160188589",
            Rt="http://www.roblox.com/asset/?id=160188597",
            Up="http://www.roblox.com/asset/?id=160188588",
        })
    end
})

SC:Button({
    Title = "Pinkie Preppy Sky",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=11555017034",
            Dn="http://www.roblox.com/asset/?id=11555013415",
            Ft="http://www.roblox.com/asset/?id=11555010145",
            Lf="http://www.roblox.com/asset/?id=11555006545",
            Rt="http://www.roblox.com/asset/?id=11555000712",
            Up="http://www.roblox.com/asset/?id=11554996247",
        })
    end
})

SC:Button({
    Title = "Mountain Sky 2",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=368385273",
            Dn="http://www.roblox.com/asset/?id=48015300",
            Ft="http://www.roblox.com/asset/?id=368388290",
            Lf="http://www.roblox.com/asset/?id=368390615",
            Rt="http://www.roblox.com/asset/?id=368385190",
            Up="http://www.roblox.com/asset/?id=48015387",
        })
    end
})

SC:Button({
    Title = "Sunset Mountain Sky",
    Justify = "Center",
    Callback = function()
        SetSky({
            Bk="http://www.roblox.com/asset/?id=17901353811",
            Dn="http://www.roblox.com/asset/?id=17901366771",
            Ft="http://www.roblox.com/asset/?id=17901356262",
            Lf="http://www.roblox.com/asset/?id=17901359687",
            Rt="http://www.roblox.com/asset/?id=17901362326",
            Up="http://www.roblox.com/asset/?id=17901365106",
        })
    end
})


         STT:Section({
        Title = [[Settings]],
        TextSize = 18,
        TextTransparency = .35,
        FontWeight = Enum.FontWeight.Medium,
    })

        STT:Keybind({
        Flag = "KeybindTest",
        Title = "Keybind",
        Desc = "Keybind to open ui",
        Value = "End",
        Callback = function(v)
            Window:SetToggleKey(Enum.KeyCode[v])
        end
    })

    
do -- config panel


    local ConfigManager = Window.ConfigManager
    local ConfigName = "default"

    local ConfigNameInput = STT:Input({
        Title = "Config Name",
        Icon = "file-cog",
        Callback = function(value)
            ConfigName = value
        end
    })

    STT:Space()
    
    -- local AutoLoadToggle = STT:Toggle({
    --     Title = "Enable Auto Load to Selected Config",
    --     Value = false,
    --     Callback = function(v)
    --         Window.CurrentConfig:SetAutoLoad(v)
    --     end
    -- })

    STT:Space()

    local AllConfigs = ConfigManager:AllConfigs()
    local DefaultValue = table.find(AllConfigs, ConfigName) and ConfigName or nil

    local AllConfigsDropdown = STT:Dropdown({
        Title = "All Configs",
        Desc = "Select existing configs",
        Values = AllConfigs,
        Value = DefaultValue,
        Callback = function(value)
            ConfigName = value
            ConfigNameInput:Set(value)
            
            AutoLoadToggle:Set(ConfigManager:GetConfig(ConfigName).AutoLoad or false)
        end
    })

    STT:Space()

    STT:Button({
        Title = "Save Config",
        Icon = "",
        Justify = "Center",
        Callback = function()
            Window.CurrentConfig = ConfigManager:Config(ConfigName)
            if Window.CurrentConfig:Save() then
                WindUI:Notify({
                    Title = "Config Saved",
                    Desc = "Config '" .. ConfigName .. "' saved",
                    Icon = "check",
                })
            end
            
            AllConfigsDropdown:Refresh(ConfigManager:AllConfigs())
        end
    })

    STT:Space()

    STT:Button({
        Title = "Load Config",
        Icon = "",
        Justify = "Center",
        Callback = function()
            Window.CurrentConfig = ConfigManager:CreateConfig(ConfigName)
            if Window.CurrentConfig:Load() then
                WindUI:Notify({
                    Title = "Config Loaded",
                    Desc = "Config '" .. ConfigName .. "' loaded",
                    Icon = "refresh-cw",
                })
            end
        end
    })

    STT:Space()

    STT:Button({
        Title = "Print AutoLoad Configs",
        Icon = "",
        Justify = "Center",
        Callback = function()
            print(HttpService:JSONDecode(ConfigManager:GetAutoLoadConfigs()))
        end
    })
end
