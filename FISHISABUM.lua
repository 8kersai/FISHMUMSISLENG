
local AC = workspace.FE.Actions:FindFirstChild("KeepYourHeadUp_")
local p = workspace.FE.Actions

if AC then
    AC:Destroy()

    local r = Instance.new("RemoteEvent")
    r.Name = "KeepYourHeadUp_"
    r.Parent = p
end


local function a(n)
	return string.match(n,"^[a-zA-Z]+%-%d+%a*%-%d+%a*$")~=nil
end

local function b(o)
	for _,c in pairs(o:GetChildren()) do
		if c:IsA("RemoteEvent") and a(c.Name) then
			c:Destroy()
		end
		b(c)
	end
end

b(game)


--//Scripts\\--
local blueflme = false

local function bflame(value)
    local player = game:GetService("Players").LocalPlayer
    local gui = player:WaitForChild("PlayerGui"):WaitForChild("Start").GamePassMenu.Items.BlueFlame
    gui.Tick.Visible = value
    gui.BlueFlame.Style = value and "RobloxRoundButton" or "RobloxRoundDefaultButton"
    player.PlayerGui.Start.PowerShot.Image = "rbxassetid://0"
    player:WaitForChild("Backpack"):WaitForChild("FValue").Value = value and 2 or 1
end

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    repeat wait() until game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game:GetService("Players").LocalPlayer:FindFirstChild("Backpack") 
    bflame(blueflme) 
end)

--//^^^^^BlueFlame^^^^^\\--

local function FasterCooldown(value)
    local player = game:GetService("Players").LocalPlayer
    local gui = player.PlayerGui.Start
    local gamePassMenu = gui.GamePassMenu.Items.Cooldown
    local powerShot = gui.PowerShot.PowerValue

    gamePassMenu.Tick.Visible = value
    gamePassMenu.Cooldown.Style = value and "RobloxRoundButton" or "RobloxRoundDefaultButton"
    powerShot.Value = value and 30 or 60
end

--//^^^^^FasterCooldown^^^^^\\--

local function MoreCurve(value)
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local backpack = player:FindFirstChild("Backpack")
    local gui = player.PlayerGui.Start
    local gamePassMenu = gui.GamePassMenu.Items.WoodenFloor

    gamePassMenu.Tick.Visible = value
    gamePassMenu.WoodenFloor.Style = value and "RobloxRoundButton" or "RobloxRoundDefaultButton"

    if humanoid and backpack then
        if value then
            local AnimationCurveLoop
            AnimationCurveLoop = humanoid.AnimationPlayed:Connect(function(AnimationTrack)
                local trackNames = {
                    "OldMKickL", "OldMKick", "OldLKickL", "OldLKick", "MKickL",
                    "MKick", "LKickL", "LKick", "OldDribbleL", "OldDribble",
                    "DribbleL", "Dribble"
                }
                if table.find(trackNames, AnimationTrack.Name) then
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    local tps = game.Workspace:FindFirstChild("TPSSystem") and game.Workspace.TPSSystem:FindFirstChild("TPS")

                    if rootPart and tps and (rootPart.Position - tps.Position).Magnitude < 9e9 then
                        local curving = backpack:FindFirstChild("Curving")
                        if curving then
                            local eventName = curving.Value == 2 and "Dribble" or curving.Value == 1 and "Tackle" or nil
                            if eventName then
                                local event = game:GetService("Workspace").FE.Actions:FindFirstChild(eventName)
                                if event then
                                    task.wait(0.1)
                                    event:FireServer(tps, rootPart)
                                    task.wait(0.2)
                                    event:FireServer(tps, rootPart)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end
--//^^^^^MoreCurve^^^^^\\--

local function GamepassController()
    local oldIndex
    oldIndex = hookmetamethod(game, "__index", function(self, key)
        local targetNames = { "GamePassController", "GamePassControllerFix", "GamePassC" }
        if table.find(targetNames, tostring(self)) then
            if key == "Enabled" then return true end
            if key == "Disabled" then return false end
        end
        return oldIndex(self, key)
    end)
    task.wait(0.5)
    game.Workspace.FE.Store.Check:FireServer()
end

--//^^^^^GamepassController^^^^^\\--

function Antiballfling()
    if Config.Antiballfling then
        local speaker = game.Players.LocalPlayer
        local RunService = game:GetService("RunService")
        local Clip = false
        local function NoclipLoop()
            if not Clip and speaker.Character then
                for _, child in pairs(speaker.Character:GetDescendants()) do
                    if child:IsA("BasePart") and 
                       (child.Name == "Right Leg" or 
                        child.Name == "Right Arm" or 
                        child.Name == "Left Arm" or 
                        child.Name == "Torso") then
                        child.CanCollide = false
                    end
                end
            end
        end
        Noclipping = RunService.Stepped:Connect(NoclipLoop)
    else
        if Noclipping then
            Noclipping:Disconnect()
            Noclipping = nil
        end
    end
end


--///^^AntiBallFling^^\\--

local Players = game:GetService("Players")
local lplr = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local Disguise = {Enabled = false}
local DisguiseUsername = {Value = ""}
local function RemoveOldParts(character)
   for _, child in ipairs(character:GetChildren()) do
      if child:IsA("Accessory") or child:IsA("Clothing") or child:IsA("ShirtGraphic") then
         child:Destroy()
      elseif child:IsA("BodyColors") then
         child:Destroy()
      end
   end
end
local function DisguiseCharacter(char)
   task.spawn(function()
      if not char then return end
      local hum = char:WaitForChild("Humanoid", 9e9)
      local DisguiseDescription
      RemoveOldParts(char)
      if DisguiseDescription == nil then
         local success = false
         repeat
            success = pcall(function()
               local userId = Players:GetUserIdFromNameAsync(DisguiseUsername.Value)
               DisguiseDescription = Players:GetHumanoidDescriptionFromUserId(userId)
            end)
            if success then break end
            task.wait(1)
         until success or not Disguise.Enabled
        end
      if not Disguise.Enabled then return end
      hum:ApplyDescriptionClientServer(DisguiseDescription)
   end)
end
--//^^AvatarStolen^^\\--

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function KillTeam(color)
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    LocalPlayer.CharacterAdded:Wait()
end
    local Character = LocalPlayer.Character
    local RootPart = Character:WaitForChild("HumanoidRootPart")
workspace:WaitForChild("FE"):WaitForChild("Powers"):WaitForChild("Power"):FireServer(4)
task.wait(0.25)
    for _, effectName in ipairs({"Fire", "PointLight"}) do
        local effect = RootPart:FindFirstChild(effectName)
        if effect then effect:Destroy() end
    end
for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= LocalPlayer and (not color or otherPlayer.TeamColor == BrickColor.new(color)) then
            local TargetRootPart = otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if TargetRootPart then
                TargetRootPart.Anchored = true
                TargetRootPart.CFrame = RootPart.CFrame
            end
        end
    end
end

--//^^Kill All^^\\--

local bxsize = 0
local atlasaircnt, marker
local heathKL 
local TargPlayer

local Version = "1.5.3"
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = 'Atlas.<font color="rgb(19, 122, 177)">dev</font>',
    Icon = "star", -- Url or rbxassetid or lucide
    Author = "Developed by Skinny", -- Author & Creator
    Folder = "AtlasDevMobile", -- Folder name for saving data (And key)
    Size = UDim2.fromOffset(580, 390),
    Transparent = true, -- UI Transparency
    Theme = "Dark", -- UI Theme
    SideBarWidth = 200, -- UI Sidebar Width (number)
    Background = "rbxassetid://90920013879296", -- 79007687190950
})

Window:EditOpenButton({
    Title = "Open Example UI",
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    Enabled = false
})

local Tabs =  {
    Infos = Window:Tab({Title = "Social Media",Icon = "youtube", Desc = "Informations about script & Update Logs" }),
    a = Window:Divider(),
    Reach = Window:Tab({Title = "Reach",Icon = "ruler", Desc = "Allows you to have a greater reach over the ball, if you are far from it you can still touch it" }),
    OReach = Window:Tab({Title = "Others Part Reach",Icon = "pencil-ruler", Desc = "Even from the reach, but for other parts of the body" }),
    Reacts = Window:Tab({Title = "Reacts",Icon = "swords", Desc = "It takes away your delay when touching the ball, practically" }),
    Gamepass = Window:Tab({Title = "Gamepasses",Icon = "wallet", Desc = "Gives you A lot of gamepasses for free" }),
    Helpers = Window:Tab({Title = "Skills Helpers",Icon = "message-circle-question", Desc = "Functions that help you to make skills and tricks easy" }),
    Misc = Window:Tab({Title = "Miscellaneous",Icon = "list-collapse", Desc = "Variations of other functions that many do not use" }),
    Game = Window:Tab({Title = "Game Changes",Icon = "palette", Desc = "Things to modify the game and change its current aesthetics" }),
    Troll = Window:Tab({Title = "Troll Functions",Icon = "drama", Desc = "Features that allow you to destroy a server or at least have fun" }),
    Skyes = Window:Tab({Title = "Skyes",Icon = "cloud-snow", Desc = "Allows you to change the game's sky to make it more pleasant to look at" }),
    b = Window:Divider(),
    Configs = Window:Tab({Title = "UI Configs",Icon = "settings", Desc = "Basically UI Visual Changes" })

}
Window:SelectTab(1)
--//////Social Media 
Tabs.Infos:Section({ Title = "Discord Info",TextXAlignment = "Left",TextSize = 17})

Tabs.Infos:Paragraph({
    Title = "Atlas.dev Discord",
    Desc = 'Join Atlas.<font color="rgb(0, 16, 194)">dev</font> discord for stay informed',
    Image = "rbxassetid://107220332374464", -- lucide or URL or rbxassetid://
    ImageSize = 50,
    Buttons = {
        {
            Title = "Copy discord link",
            Callback = function() 
                setclipboard("https://discord.gg/UPWPdPNHbd")
            end
        }
    } 
}) 

Tabs.Infos:Section({ Title = "Changelogs",TextXAlignment = "Left",TextSize = 17})

Tabs.Infos:Paragraph({Title = "30/02/2025",Desc = "- Fixed Reach\n- Fixed Lag(Constantly)\n- Fixed Bugs in Reach\n- New User Interface\n- Added New Functions"})
--////////Reach
Tabs.Reach:Section({ Title = "Reach",TextXAlignment = "Left",TextSize = 20})
Tabs.Reach:Paragraph({Title = "Alert about Reach",Desc = "Be careful with the number of studs you use, the higher the number the higher the chance of you being banned by an individual report. I recommend using between 2-6"})

getgenv().TPSReach = false
getgenv().ReachStuds = 0

function legreach()
	if getgenv().TPSReach then
		if Runstepped2 then Runstepped2:Disconnect() end 
		Runstepped2 = game:GetService("RunService").RenderStepped:Connect(function()
			local player = game.Players.LocalPlayer
			local char = player.Character
			if not char then 
                return 
            end
			local humanoid = char:FindFirstChild("Humanoid")
			local rootPart = char:FindFirstChild("HumanoidRootPart")
			local TpsS = game.Workspace.TPSSystem:FindFirstChild("TPS") 
			local prefoot = game.Lighting[player.Name]:FindFirstChild("PreferredFoot")

			if humanoid and rootPart and TpsS and prefoot then
				if (rootPart.Position - TpsS.Position).Magnitude <= getgenv().ReachStuds then
					local foot = nil
					if humanoid.RigType == Enum.HumanoidRigType.R6 then
						foot = (prefoot.Value == 1) and "Right Leg" or "Left Leg"
					elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
						foot = (prefoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg"
					end
					
					if foot and char:FindFirstChild(foot) then
						firetouchinterest(char[foot], TpsS, 0)
						firetouchinterest(char[foot], TpsS, 1)
					end
				end
			end
		end)
	end
end

Tabs.Reach:Toggle({
    Title = "Enable Reach",
    Default = false,
    Icon = "check",
    Callback = function(value) 
		getgenv().TPSReach = value
		if value then
			legreach()
		else
			if Runstepped2 then 
                Runstepped2:Disconnect() 
            end
		end
    end
})

Tabs.Reach:Slider({
    Title = "Reach Studs",
    Desc = "Read the warning before use",
    Value = {
        Min = 0,
        Max = 25,
        Default = getgenv().ReachStuds,
    },
    Callback = function(value) 
        getgenv().ReachStuds = value 
    end
})

----//////body part rech
Tabs.OReach:Section({ Title = "Another Parts Reach",TextXAlignment = "Left",TextSize = 20})
Tabs.OReach:Paragraph({Title = "Alert about Other Part Rrach",Desc = "Use low values â€‹â€‹mainly with the torso and head, if you use high values â€‹â€‹it can be totally blatant"})

local player = game:GetService("Players").LocalPlayer

local ReachSets = {
    leg = {enabled = false, distance = 1, parts = {"LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot"}},
    arm = {enabled = false, distance = 1, parts = {"LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm", "RightHand"}},
    head = {enabled = false, distance = 1, parts = {"Head"}},
    chest = {enabled = false, distance = 1, parts = {"UpperTorso", "LowerTorso"}}
}

local BdPart = {}
local ball

local function frstltt(str)
    return str:sub(1,1):upper() .. str:sub(2)
end

local function setupdChtr()
    if not player.Character or not player.Character.Parent then
        player.CharacterAdded:Wait()
    end
    local char = player.Character
    for category, config in pairs(ReachSets) do
        BdPart[category] = {} 
        for _, partName in ipairs(config.parts) do
            local part = char:FindFirstChild(partName)
            if part then
                table.insert(BdPart[category], part)
            else
                warn("Error part:", partName)
            end
        end
    end
    ball = workspace:WaitForChild("TPSSystem"):WaitForChild("TPS")
end

local function checkReach(category)
    while ReachSets[category].enabled do
        task.wait()
        if ball then
            for _, part in ipairs(BdPart[category]) do
                local distance = (ball.Position - part.Position).Magnitude
                if distance <= ReachSets[category].distance then
                    firetouchinterest(part, ball, 0)
                    firetouchinterest(part, ball, 1)
                end
            end
        end
    end
end

setupdChtr()
player.CharacterAdded:Connect(setupdChtr)

for category, config in pairs(ReachSets) do
local cattegoryy = frstltt(category)

--// Configs \--
Tabs.OReach:Section({ Title = cattegoryy .. " Reach", TextXAlignment = "Left", TextSize = 20 })

Tabs.OReach:Toggle({
    Title = "Enable " .. cattegoryy .. " Reach",
    Default = false,
    Icon = "check",
    Callback = function(value) 
    config.enabled = value
        if value then
            task.spawn(checkReach, category)
        end
    end
})

Tabs.OReach:Slider({
    Title = cattegoryy .. " Reach Studs",
    Desc = "Read the warning before use",
    Value = {
        Min = 0,
        Max = 25,
        Default = config.distance,
    },
    Callback = function(value) 
            config.distance = tonumber(value) or config.distance
        end
    })
end

---/////Reacts
Tabs.Reacts:Section({ Title = "Reacts",TextXAlignment = "Left",TextSize = 20})
Tabs.Reacts:Paragraph({Title = "Information About Reacts",Desc = "Basically it gives you an extra react, depending on your ping. This may not make a difference, I recommend using it if you have 100-150 ping"})

--//Script\\--
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local workspaceTPS = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
local _G = _G or {}
local function hookMeta(targetName, paramIndex, replaceValue)
    local old
    old = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        if getnamecallmethod() == "FireServer" and tostring(self) == targetName then
            args[paramIndex] = replaceValue
            return old(self, unpack(args))
        end
        return old(self, ...)
    end)
end
--Configs--
Tabs.Reacts:Section({ Title = "ðŸ›¡ï¸Goalkeeper ReactsðŸ›¡ï¸",TextXAlignment = "Left",TextSize = 17})
Tabs.Reacts:Button({
    Title = "Save React",
    Desc = "Give you Best react for saving 90% shots",
    Callback = function() 
        _G.Vector = Vector3.new(math.huge, math.huge, math.huge)
        hookMeta("KickGoalKeeper", 6, _G.Vector)
    end
})

Tabs.Reacts:Button({
    Title = "Kick React",
    Desc = "Give you Best react for kick ball from gk area",
    Callback = function() 
        _G.Vector = Vector3.new(math.huge, math.huge, math.huge)
        hookMeta("Kick", 6, _G.Vector)
    end
})

Tabs.Reacts:Slider({
    Title = "Save Force",
    Desc = "Combines with save react",
    Value = { 
        Min = 800, 
        Max = 1500, 
        Default = 920
    },
    Callback = function(value)
        if workspaceTPS then
            workspaceTPS.Force.Force = Vector3.new(value, value, value)
        end
    end
})

Tabs.Reacts:Section({ Title = "ðŸ¹Field ReactsðŸ¹",TextXAlignment = "Left",TextSize = 17})

Tabs.Reacts:Button({
    Title = "Shot React",
    Desc = "Make your kick a little faster and more accurate",
    Callback = function() 
        _G.Vector = Vector3.new(math.huge, math.huge, math.huge)
        hookMeta("Shoot", 6, _G.Vector)
    end
})

Tabs.Reacts:Button({
    Title = "Dribble React",
    Desc = "Make your dribble more accurate",
    Callback = function() 
        hookMeta("Dribble", 2, player.Character.Humanoid)
    end
})

Tabs.Reacts:Button({
    Title = "Flick React",
    Desc = "Make your Flick w [G] more BEST",
    Callback = function() 
        if _G.OldFlickReact then return end
        _G.OldFlickReact = true
        hookMeta("Flick", nil, nil)
    end
})

Tabs.Reacts:Slider({
    Title = "AvgSkillProbabillity",
    Desc = "Combines with save react",
    Value = { 
        Min = 1000, 
        Max = 2000, 
        Default = 1500
    },
    Callback = function(value)
        if workspaceTPS then
            workspaceTPS.Velocity = Vector3.new(value, value, value)
        end
    end
})

Tabs.Reacts:Section({ Title = "âš”ï¸Player Reactsâš”ï¸",TextXAlignment = "Left",TextSize = 17})

Tabs.Reacts:Button({
    Title = "Less Delay in Ball",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/Atlas.dev/refs/heads/main/Misc/LessDelay.lua"))()
    end,
})

local function tpspp(Value)
    local tpsSystem = workspace:FindFirstChild("TPSSystem")
    if tpsSystem then
        local tps = tpsSystem:FindFirstChild("TPS")
        if tps and tps:IsA("Part") then
            local properties = Value and PhysicalProperties.new(0.05, 0.3, 0.5, 1, 0.5) 
            or PhysicalProperties.new(0.7, 0.3, 0.5, 1, 1)
            tps.CustomPhysicalProperties = properties
        end
    end
end

Tabs.Reacts:Toggle({
    Title = "Fszinn React",
    Value = false,
    Icon = "check",
    Callback = function(Value)
        tpspp(Value) 
    end
})

Tabs.Reacts:Toggle({
    Title = "Nexus React",
    Value = false,
    Icon = "check",
    Callback = function(Value)
        tpspp(Value) 
    end
})

-----////////////////gamepasses
Tabs.Gamepass:Section({ Title = "Gamepasses", TextXAlignment = "Left", TextSize = 20 })
Tabs.Gamepass:Paragraph({Title = "Information About Gamepasses",Desc = "Basically it gives you some gamepasses for free, I didn't put the cards and captain ones because they are useless and will only be used to steal your robux lol"})

Tabs.Gamepass:Toggle({
    Title = "Blue Flame",
    Value = false,
    Icon = "check",
    Callback = function(value)
        blueflme = value
        bflame(value)
    end
})

Tabs.Gamepass:Toggle({
    Title = "Faster Cooldown",
    Value = false,
    Icon = "check",
    Callback = function(value)
        FasterCooldown(value) 
    end
})

Tabs.Gamepass:Toggle({
    Title = "More Curve",
    Value = false,
    Icon = "check",
    Callback = function(value)
        MoreCurve(value)
    end
})

Tabs.Gamepass:Button({
    Title = "Gamepass Controller",
    Icon = "check",
    Callback = function()
        GamepassController()  
    end
})

--////Skills Helpers

Tabs.Helpers:Section({ Title = "Skills Helpers", TextXAlignment = "Left", TextSize = 20 })
Tabs.Helpers:Paragraph({Title = "Simple Guide",Desc = "Basically it helps you skill more easily, I recommend you use it wisely. Because if you don't know how to use it, you will be accused of scripting and with proof",})
Tabs.Helpers:Section({ Title = "Helpers", TextXAlignment = "Left", TextSize = 17 })

Tabs.Helpers:Toggle({
    Title = "Enable Air Dribble Helper",
    Value = false,
    Icon = "check",
    Callback = function(value)
        local Ball = game.Workspace.TPSSystem.TPS
        if value then
            getgenv().boxsettings = {
                box = {
                    bxsize = Vector3.new(bxsize, bxsize, bxsize),
                    markerOffset = Vector3.new(0, -1, 0),
                    boxtransparency = 1,
                },
            }
            marker = Instance.new("Part")
            marker.Name = "TPS"
            marker.Anchored = true
            marker.Transparency = getgenv().boxsettings.box.boxtransparency
            marker.Parent = Ball.Parent
            atlasaircnt = game:GetService("RunService").Heartbeat:Connect(function()
                marker.Size = Vector3.new(bxsize, 0, bxsize)
                marker.CFrame = CFrame.new(Ball.Position + getgenv().boxsettings.box.markerOffset)
            end)
        else
            if atlasaircnt then atlasaircnt:Disconnect() end
            if marker then marker:Destroy() end
        end
    end
})

Tabs.Helpers:Input({
    Title = "Air Dribble Size",
    PlaceholderText = "Input Size",
    ClearTextOnFocus = false,
    Callback = function(value)
        bxsize = tonumber(value) or 0
        if getgenv().boxsettings then
            getgenv().boxsettings.box.bxsize = Vector3.new(bxsize, bxsize, bxsize)
            if marker then
                marker.Size = Vector3.new(bxsize, 0, bxsize)
            end
        end
    end
})

Tabs.Helpers:Toggle({
    Title = "Infinite Head Helper",
    Value = false,
    Icon = "check",
    Callback = function(value)
        if value then
			game.Workspace.TPSSystem.TPS.CanCollide = false
		else
			game.Workspace.TPSSystem.TPS.CanCollide = true
		end
    end
})

Tabs.Helpers:Button({
    Title = "ZZZ Helper",
    Callback = function()
        local Ball = game.Workspace.TPSSystem.TPS
        Ball.Size = Vector3.new(2.89, 2.89, 2.89)
        getgenv().boxsettings = {
          box = {
            boxsize = Vector3.new(5, 0, 5),
            markerOffset = Vector3.new(0, -1, 0),
            boxtransparency = 1,
          },
        }
        local marker = Instance.new("Part", Ball.Parent)
        marker.Name = "TPS"
        marker.Size = getgenv().boxsettings.box.boxsize
        marker.Anchored = true
        marker.Transparency = getgenv().boxsettings.box.boxtransparency
        game:GetService("RunService").Stepped:Connect(function()
          marker.CFrame = CFrame.new(Ball.Position + getgenv().boxsettings.box.markerOffset)
        end)
    end,
})

Tabs.Helpers:Button({
    Title = "Infinite Fast Helper",
    Callback = function()
        loadstring(game:HttpGet("https://paste.ee/r/gqMgxDMB"))()
    end,
})

--//////Miscellaneous
Tabs.Misc:Section({ Title = "Miscellaneous", TextXAlignment = "Left", TextSize = 20 })
Tabs.Misc:Paragraph({Title = "Guide",Desc = "Basically some functions that many people don't use, so I put them in a separate tab, I don't know why people don't use this. But I guarantee that they are useful things :)",})
Tabs.Misc:Section({ Title = "Humanoid Changes", TextXAlignment = "Left", TextSize = 17 })
Tabs.Misc:Slider({
    Title = "Walkspeed Changer",
    Step = 1,
    Value = {
        Min = 22,
        Max = 100,
        Default = 22,
    },
    Callback = function(value) 
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})
Tabs.Misc:Slider({
    Title = "JumpPower Changer",
    Step = 1,
    Value = {
        Min = 50,
        Max = 100,
        Default = 50,
    },
    Callback = function(value) 
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

Tabs.Misc:Section({ Title = "Level Changer", TextXAlignment = "Left", TextSize = 17 })

Tabs.Misc:Input({
    Title = "Level Changer",
    PlaceholderText = "Input Number",
    ClearTextOnFocus = false,
    Callback = function(value)
        local Targets
        Targets = tonumber(value)
        task.wait(0.1)
    local mt = getrawmetatable(game);
    setreadonly(mt, false);
    local old_index = mt.__index;
    mt.__index = function(a, b)
        if tostring(a) == "PPLevel" or tostring(a) == "Level" then
            if tostring(b) == "Value" then
                return Targets;
            end
        end
            return old_index(a, b);
        end
    end
})

Tabs.Misc:Section({ Title = "Ball Modifications", TextXAlignment = "Left", TextSize = 17 })

Tabs.Misc:Button({
    Title = "Anti Ball Fling",
    Callback = function()
        loadstring(game:HttpGet("https://paste.ee/r/EPwFBNOx"))()
    end,
})

Tabs.Misc:Slider({
    Title = "Ball Size",
    Step = 0.01,
    Value = {
        Min = 2,
        Max = 10,
        Default = 2.6,
    },
    Callback = function(value) 
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            if heathKL then
                heathKL:Disconnect()
                heathKL = nil
            end
            heathKL = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                if humanoid.Health == 0 then
                    humanoid.Health = 100 
                end
            end)
        end
        game.Workspace.TPSSystem.TPS.Size = Vector3.new(value, value, value)
        task.delay(1, function()
            if heathKL then
                heathKL:Disconnect()
                heathKL = nil
            end
        end)
    end
})

Tabs.Misc:Section({ Title = "Anothers Miscellaneous Funcs", TextXAlignment = "Left", TextSize = 17 })

Tabs.Misc:Input({
    Title = "Avatar Stolen",
    PlaceholderText = "Input Nickname",
    ClearTextOnFocus = false,
    Callback = function(value)
        DisguiseUsername.Value = value
        Disguise.Enabled = true
        DisguiseCharacter(lplr.Character)
    end
})

Tabs.Misc:Toggle({
    Title = "Allow you Shot in Gk Box",
    Default = false,
    Icon = "check",
    Callback = function(value)
        if value then
            game:GetService("Workspace").GKSystem.Fix1.CanTouch = false
            game:GetService("Workspace").GKSystem.Fix2.CanTouch = false
        else
            game:GetService("Workspace").GKSystem.Fix1.CanTouch = true
            game:GetService("Workspace").GKSystem.Fix2.CanTouch = true
      end
    end
})

Tabs.Misc:Toggle({
    Title = "Break through the walls of power",
    Default = false,
    Icon = "check",
    Callback = function(value)
        if value then
            _G.Wall = true
                while _G.Wall do
                wait()
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Wall" then
                       v.CanCollide = false
                    end
                end
            end
        else
            _G.Wall = false
        end
    end
})

Tabs.Misc:Dropdown({
    Title = "Select an Shiftlock",
    Values = {"None", "Default", "Ipad/Tablet", "Left"},
    Value = "None", 
    Callback = function(value) 
        local urls = {
            None = '',
            Default = 'https://raw.githubusercontent.com/Unknownproootest/Permanent-Shift-Lock-Alt/alt/PermShiftlockAlt',
            ["Ipad/Tablet"] = 'https://raw.githubusercontent.com/Unknownproootest/Permanent-Shift-Lock-Beta/alt/PermShiftlockV2-alt',
            Left = 'https://raw.githubusercontent.com/Unknownproootest/Permanent-Shift-Lock-Beta/alt/PermShiftlockLeft'
        }
        if urls[value] and urls[value] ~= '' then  
            loadstring(game:HttpGet(urls[value]))()
        else
            warn("Error: " .. tostring(value))
        end
    end
})

--////Game Changers
Tabs.Game:Section({ Title = "Game - Changers", TextXAlignment = "Left", TextSize = 20 })
Tabs.Game:Paragraph({Title = "Guide",Desc = "Functions that will change the game, such as removing textures, changing them, optimizing, changing certain things that cannot be done, and so on. I will soon bring a feature to change things on the cards, but I don't have time most of the week.",})
Tabs.Game:Section({ Title = "Functions", TextXAlignment = "Left", TextSize = 17 })

local default = game.Workspace.SoccerFieldParts.SoccerField.Color

Tabs.Game:Colorpicker({
    Title = "Grass Color",
    Desc = "Change gram color",
    Transparency = 0.2,
    Default = default,
    Callback = function(Value)
        local soccerField = game.Workspace.SoccerFieldParts:FindFirstChild("SoccerField")
        if soccerField then
            soccerField.Color = Value
        end
    end
})

Tabs.Game:Button({
    Title = "FPS Booster",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/Atlas.dev/refs/heads/main/Src/FPSBooster.lua"))()
    end,
})

Tabs.Game:Button({
    Title = "Nostaligc TPS Version",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/Atlas.dev/refs/heads/main/Misc/OldTPS.lua"))()
    end,
})

Tabs.Game:Button({
    Title = "Remove Map",
    Callback = function()
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "Map" then
            v:Destroy()
        end
    end
    end,
})

---/===/// Troll Functions
Tabs.Troll:Section({ Title = "Troll Functions", TextXAlignment = "Left", TextSize = 20 })
Tabs.Troll:Paragraph({Title = "Why it has few functions",Desc = "Basically Tayfun is releasing several updates to destroy the game in order to fix these troll functions, but wait because soon there will be more functions to troll :p",})

Tabs.Troll:Section({ Title = "Kill Function", TextXAlignment = "Left", TextSize = 17 })

Tabs.Troll:Input({
    Title = "Player's Name",
    PlaceholderText = "Input Nickname",
    ClearTextOnFocus = false,
    Callback = function(value)
        TargPlayer = unpack(GetPlayer(value))
    end
})

Tabs.Troll:Button({
    Title = "Kill Player",
    Desc = "Kill Player In The Server",
    Callback = function()
        local PowerEvent = workspace:WaitForChild("FE"):WaitForChild("Powers"):WaitForChild("Power")
        PowerEvent:FireServer(4)
        task.wait(0.25)
              game.Players.LocalPlayer.Character.HumanoidRootPart.Fire:Destroy()
              game.Players.LocalPlayer.Character.HumanoidRootPart.PointLight:Destroy()
               for i,v in pairs(TargPlayer.Character:GetChildren()) do
               if v:IsA("BasePart") then
               v.Anchored = true
               v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end,
})

Tabs.Troll:Section({ Title = "Another Options for Kill", TextXAlignment = "Left", TextSize = 17 })

Tabs.Troll:Button({ Title = "Kill All", Callback = function() KillTeam(nil) end })
Tabs.Troll:Button({ Title = "Kill Blue Team", Callback = function() KillTeam("Bright blue") end })
Tabs.Troll:Button({ Title = "Kill Red Team", Callback = function() KillTeam("Bright red") end })

Tabs.Troll:Section({ Title = "Don't abuse it so much", TextXAlignment = "Left", TextSize = 17 })

Tabs.Troll:Button({
    Title = "Crash The Ball",
    Desc = "Basically performs a movement that crashes the ball, Very overpowered function",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/Atlas.dev/refs/heads/main/Misc/CrashBall.lua"))()
    end
})

-- // Skyes // --
Tabs.Skyes:Section({ Title = "Skyes", TextXAlignment = "Left", TextSize = 20 })
local function ApplySkybox(skyData)
    local skybox = Instance.new("Sky")
    skybox.Parent = game.Lighting
    skybox.SkyboxBk = "rbxassetid://" .. skyData.Bk
    skybox.SkyboxDn = "rbxassetid://" .. skyData.Dn
    skybox.SkyboxFt = "rbxassetid://" .. skyData.Ft
    skybox.SkyboxLf = "rbxassetid://" .. skyData.Lf
    skybox.SkyboxRt = "rbxassetid://" .. skyData.Rt
    skybox.SkyboxUp = "rbxassetid://" .. skyData.Up
    skybox.StarCount = skyData.StarCount or 0
end

local skyboxes = {
    NightSky = {Bk="12064107", Dn="12064152", Ft="12064121", Lf="12063984", Rt="12064115", Up="12064131", StarCount=0},
    ScaryNight = {Bk="48020371", Dn="48020144", Ft="48020234", Lf="48020211", Rt="48020254", Up="48020383", StarCount=3000},
    SakuraSky = {Bk="271042516", Dn="271077243", Ft="271042556", Lf="271042310", Rt="271042467", Up="271077958", StarCount=1334},
    CakeUpNightSkyGalaxyPlanets = {Bk="15983968922", Dn="15983966825", Ft="15983965025", Lf="15983967420", Rt="15983966246", Up="15983964246", StarCount=3000},
    PurpleNightSky = {Bk="5084575798", Dn="5084575916", Ft="5103949679", Lf="5103948542", Rt="5103948784", Up="5084576400", StarCount=3000},
    SunsetOrange = {Bk="458016711", Dn="458016826", Ft="458016532", Lf="458016655", Rt="458016782", Up="458016792", StarCount=3000},
    PurpleSky = {Bk="570557514", Dn="570557775", Ft="570557559", Lf="570557620", Rt="570557672", Up="570557727", StarCount=3000},
    GraySky = {Bk="18703245834", Dn="18703243349", Ft="18703240532", Lf="18703237556", Rt="18703235430", Up="18703232671", StarCount=3500},
    MountainSky = {Bk="160188495", Dn="160188614", Ft="160188609", Lf="160188589", Rt="160188597", Up="160188588", StarCount=3000},
    PinkiePreppySky = {Bk="11555017034", Dn="11555013415", Ft="11555010145", Lf="11555006545", Rt="11555000712", Up="11554996247", StarCount=3000},
    MountainSky2 = {Bk="368385273", Dn="48015300", Ft="368388290", Lf="368390615", Rt="368385190", Up="48015387", StarCount=3000},
    SunsetMountainSky = {Bk="17901353811", Dn="17901366771", Ft="17901356262", Lf="17901359687", Rt="17901362326", Up="17901365106", StarCount=3000}
}

local function AddSkyboxButton(name, title)
    Tabs.Skyes:Button({
        Title = title,
        Callback = function()
            ApplySkybox(skyboxes[name])
        end
    })
end
AddSkyboxButton("NightSky", "Night Sky")
AddSkyboxButton("ScaryNight", "Scary Night")
AddSkyboxButton("SakuraSky", "Sakura Sky")
AddSkyboxButton("CakeUpNightSkyGalaxyPlanets", "Cake Up Night Sky Galaxy Planets")
AddSkyboxButton("PurpleNightSky", "Purple Night Sky")
AddSkyboxButton("SunsetOrange", "Sunset Orange")
AddSkyboxButton("PurpleSky", "Purple Sky")
AddSkyboxButton("GraySky", "Gray Sky")
AddSkyboxButton("MountainSky", "Mountain Sky")
AddSkyboxButton("PinkiePreppySky", "Pinkie Preppy Sky")
AddSkyboxButton("MountainSky2", "Mountain Sky 2")
AddSkyboxButton("SunsetMountainSky", "Sunset Mountain Sky")

local v99 = Instance.new("ScreenGui")
local v100 = Instance.new("ImageButton")
local v101 = Instance.new("UICorner") 

v99.Parent = game.CoreGui
v99.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

v100.Parent = v99
v100.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
v100.BackgroundTransparency = 1
v100.BorderSizePixel = 0
v100.Position = UDim2.new(3.3908420959960495e-07, 209, 0, -47)
v100.Size = UDim2.new(0, 45, 0, 45)
v100.Draggable = true
v100.Image = "http://www.roblox.com/asset/?id=113410311161374"

v101.CornerRadius = UDim.new(1, 0) 
v101.Parent = v100 

v100.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.G, false, game)
end)

Tabs.Configs:Button({
    Title = "Make The 'Atlas' Logo invisible",
    Desc = "You can still click on it to open the script but it will be invisible",
    Callback = function()
        if v100 then
			v100.Image = "" 
		end
    end
})
