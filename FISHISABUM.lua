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

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local Workspace = game:GetService("Workspace")
local Camera = workspace.CurrentCamera
local player = Players.LocalPlayer
local MAIN_COLOR = Color3.fromRGB(12, 35, 64)

-- Loading Screen (kept from provided script)
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BackgroundTransparency = 1
bg.Parent = gui
TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()

-- (rest of loading screen code omitted for brevity, keep as is from your provided script)

task.delay(5, function()
    TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    task.wait(0.6)
    gui:Destroy()
end)

-- Main UI
local TS = TweenService
local UIS = UserInputService
local CoreGui = game:GetService("CoreGui")

local executorName = identifyexecutor and identifyexecutor() or "Unknown"
local lowerName = string.lower(executorName)
local isSolara = string.find(lowerName, "solara") ~= nil
local isXeno = string.find(lowerName, "xeno") ~= nil
local isSupportedExecutor = isSolara or isXeno

local isTPSLike = false
local isRealTPS = false
local success, productInfo = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)
if success and productInfo and productInfo.Name then
    local nameUpper = string.upper(productInfo.Name)
    if string.find(nameUpper, "TPS") or string.find(nameUpper, "67") or string.find(nameUpper, "UWU") or string.find(nameUpper, "CRINGE") then
        isTPSLike = true
    end
    if string.sub(nameUpper, 1, 3) == "TPS" then
        isRealTPS = true
    end
end

local UI = Instance.new("ScreenGui")
UI.Name = "CezarHub"
UI.ResetOnSpawn = false
UI.Parent = CoreGui

local isMobile = UIS.TouchEnabled and not UIS.MouseEnabled
local scale = isMobile and 0.9 or 1
local mainSize = UDim2.new(0, 640 * scale, 0, 470 * scale)

-- (rest of UI creation code from provided script, including FloatButton, Main, Title, etc.)

-- Tabs
local TabButtons = {}
local TabContainers = {}
local CurrentContainer = nil

local function AddTab(name)
    -- (AddTab function from provided script)
end

local HomeTab = AddTab("Home")
local LegTab = nil
local MossTab = AddTab("Moss")
local VolleyTab = AddTab("Volley")
local KhalidTab = AddTab("Khalid")
local ReactTab = AddTab("React")
local GKTab = AddTab("Goalkeeper React")
local PlayerTab = AddTab("Player")

if isTPSLike and isSupportedExecutor then
    LegTab = AddTab("R6 Leg Reach")
else
    LegTab = AddTab("Leg Reach")
end

-- Home Tab content (keep as is)

-- Player Tab - Speed & Jump
local WalkspeedEnabled = false
local CurrentSpeed = 23

CreateToggle(PlayerTab, "Enable Walkspeed", function(v)
    WalkspeedEnabled = v
    local character = player.Character
    if character and character:FindFirstChildOfClass("Humanoid") then
        character:FindFirstChildOfClass("Humanoid").WalkSpeed = v and CurrentSpeed or 23
    end
end)

CreateSlider(PlayerTab, "Walkspeed", 23, 100, 23, 1, function(v)
    CurrentSpeed = v
    if WalkspeedEnabled then
        local character = player.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            character:FindFirstChildOfClass("Humanoid").WalkSpeed = v
        end
    end
end)

local JumpEnabled = false
local CurrentJump = 50

CreateToggle(PlayerTab, "Enable Jump Power", function(v)
    JumpEnabled = v
    local character = player.Character
    if character and character:FindFirstChildOfClass("Humanoid") then
        character:FindFirstChildOfClass("Humanoid").JumpPower = v and CurrentJump or 50
    end
end)

CreateSlider(PlayerTab, "Jump Power", 50, 150, 50, 1, function(v)
    CurrentJump = v
    if JumpEnabled then
        local character = player.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            character:FindFirstChildOfClass("Humanoid").JumpPower = v
        end
    end
end)

-- (keep avatar steal from provided script)

-- Moss Tab (universal head reach with box)
local headReachEnabled = false
local headReachX = 2
local headReachY = 3
local headReachZ = 2
local headTransparency = 0.5
local headBoxPart = nil
local headConnection = nil

local function updateHeadBox()
    if headBoxPart then headBoxPart:Destroy() end
    headBoxPart = Instance.new("Part")
    headBoxPart.Size = Vector3.new(headReachX, headReachY, headReachZ)
    headBoxPart.Transparency = headTransparency
    headBoxPart.Anchored = true
    headBoxPart.CanCollide = false
    headBoxPart.Color = Color3.fromRGB(255, 105, 180)
    headBoxPart.Material = Enum.Material.Neon
    headBoxPart.Name = "MossBox"
    headBoxPart.Parent = Workspace
end

local function startMoss()
    if headConnection then headConnection:Disconnect() end
    updateHeadBox()
    headConnection = RunService.RenderStepped:Connect(function()
        local character = player.Character
        if not character then return end
        local head = character:FindFirstChild("Head")
        local tps = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
        if not (head and tps and headBoxPart) then return end
        headBoxPart.CFrame = head.CFrame
        local rel = headBoxPart.CFrame:PointToObjectSpace(tps.Position)
        local hs = headBoxPart.Size / 2
        if math.abs(rel.X) <= hs.X and math.abs(rel.Y) <= hs.Y and math.abs(rel.Z) <= hs.Z then
            firetouchinterest(head, tps, 0)
            firetouchinterest(head, tps, 1)
        end
    end)
end

local function stopMoss()
    if headConnection then headConnection:Disconnect() headConnection = nil end
    if headBoxPart then headBoxPart:Destroy() headBoxPart = nil end
end

CreateToggle(MossTab, "Enable Moss & Head Reach", function(v)
    headReachEnabled = v
    if v then startMoss() else stopMoss() end
end)

CreateSlider(MossTab, "Header X", 0, 20, 2, 0.1, function(v)
    headReachX = v
    if headReachEnabled then updateHeadBox() end
end)

CreateSlider(MossTab, "Header Y", 0, 20, 3, 0.1, function(v)
    headReachY = v
    if headReachEnabled then updateHeadBox() end
end)

CreateSlider(MossTab, "Header Z", 0, 20, 2, 0.1, function(v)
    headReachZ = v
    if headReachEnabled then updateHeadBox() end
end)

CreateToggle(MossTab, "Appear Normal", function(v)
    headTransparency = v and 1 or 0.5
    if headBoxPart then headBoxPart.Transparency = headTransparency end
end)

-- Percentage buttons for moss
local percentages = {10, 25, 50, 75, 100}
for _, p in ipairs(percentages) do
    local btn = Instance.new("TextButton")
    btn.Text = p .. "%"
    -- style
    btn.Parent = MossTab
    btn.MouseButton1Click:Connect(function()
        local size = p * 0.1
        headReachX = size
        headReachZ = size
        if headReachEnabled then updateHeadBox() end
    end)
end

-- Khalid Tab
local khalidEnabled = false
local G_REACH = 4
local J_REACH = 5
local AIR_X = 3.5
local AIR_Y = 5
local AIR_Z = 3

CreateToggle(KhalidTab, "Enable Khalid", function(v)
    khalidEnabled = v
end)

CreateSlider(KhalidTab, "Ground Reach", 0, 30, 4, 0.5, function(v) G_REACH = v end)
CreateSlider(KhalidTab, "Jump Reach", 0, 30, 5, 0.5, function(v) J_REACH = v end)
CreateSlider(KhalidTab, "Air X", 0, 30, 3.5, 0.5, function(v) AIR_X = v end)
CreateSlider(KhalidTab, "Air Y", 0, 30, 5, 0.5, function(v) AIR_Y = v end)
CreateSlider(KhalidTab, "Air Z", 0, 30, 3, 0.5, function(v) AIR_Z = v end)

local function setKhalidPercent(p)
    local mult = 1 + p / 100
    G_REACH = 4 * mult
    J_REACH = 5 * mult
    AIR_X = 3.5 * mult
    AIR_Y = 5 * mult
    AIR_Z = 3 * mult
end

for _, p in ipairs({15, 25, 50, 75, 100}) do
    local btn = Instance.new("TextButton")
    btn.Text = p .. "%"
    -- style
    btn.Parent = KhalidTab
    btn.MouseButton1Click:Connect(function() setKhalidPercent(p) end)
end

local buffBtn = Instance.new("TextButton")
buffBtn.Text = "Buff by 20%"
-- style
buffBtn.Parent = KhalidTab
buffBtn.MouseButton1Click:Connect(function()
    G_REACH = G_REACH * 1.2
    J_REACH = J_REACH * 1.2
    AIR_X = AIR_X * 1.2
    AIR_Y = AIR_Y * 1.2
    AIR_Z = AIR_Z * 1.2
end)

-- Khalid physics
RunService.Heartbeat:Connect(function()
    if khalidEnabled then
        local char = player.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        local ball = Workspace:FindFirstChild("TPS") or (Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS"))
        if root and ball and hum then
            local rel = root.CFrame:PointToObjectSpace(ball.Position)
            local isAir = hum.FloorMaterial == Enum.Material.Air
            if isAir then
                if (math.abs(rel.X) <= AIR_X and rel.Y <= AIR_Y and rel.Y >= -1.5 and math.abs(rel.Z) <= AIR_Z) or (ball.Position - root.Position).Magnitude <= J_REACH then
                    firetouchinterest(ball, root, 0)
                    firetouchinterest(ball, root, 1)
                    ball.AssemblyLinearVelocity = (Camera.CFrame.LookVector * 135) + Vector3.new(0, 8, 0)
                end
            else
                if (ball.Position - root.Position).Magnitude <= G_REACH then
                    firetouchinterest(ball, root, 0)
                    firetouchinterest(ball, root, 1)
                    ball.AssemblyLinearVelocity = (Camera.CFrame.LookVector * 135) + Vector3.new(0, 8, 0)
                end
            end
        end
    end
end)

-- Volley Tab
local volleyEnabled = false
local volleyDistance = 10
local volleyPart = nil
local volleyConnection = nil

CreateButton(VolleyTab, "Blue Team", function()
    volleyPart = Workspace.GKSystem:FindFirstChild("Fix1")
    if volleyPart then volleyPart.Size = Vector3.new(85, 15.48, 34.8) end
end)

CreateButton(VolleyTab, "Red Team", function()
    volleyPart = Workspace.GKSystem:FindFirstChild("Fix2")
    if volleyPart then volleyPart.Size = Vector3.new(85, 15.48, 34.8) end
end)

CreateToggle(VolleyTab, "Enable Volley Reach", function(v)
    volleyEnabled = v
    if v and volleyPart then
        if volleyConnection then volleyConnection:Disconnect() end
        volleyConnection = RunService.RenderStepped:Connect(function()
            -- volley loop code from previous
        end)
    else
        if volleyConnection then volleyConnection:Disconnect() end
    end
end)

CreateSlider(VolleyTab, "Volley Reach Distance", 0, 20, 10, 1, function(v) volleyDistance = v end)

-- (add volley react button if wanted)

-- React Tab - Percentages & Reduce Delay
local function setReactPercent(p)
    local speed = 100 * (p / 100)
    local tps = Workspace.TPSSystem.TPS
    if tps then tps.Velocity = Vector3.new(speed, speed, speed) end
end

for _, p in ipairs({10, 25, 50, 75, 100}) do
    CreateButton(ReactTab, p .. "% React", function() setReactPercent(p) end)
end)

CreateButton(ReactTab, "Reduce Ball Delay", function()
    local tps = Workspace.TPSSystem.TPS
    if tps and tps:FindFirstChild("MainAttachment") then
        tps.MainAttachment:Destroy()
    end
end)

-- Goalkeeper React Tab (move the GK toggle here from provided code)

-- (keep the rest of the provided script: leg reach for supported/non, heartbeats, inputs, bypass, etc.)

Window:Open()
