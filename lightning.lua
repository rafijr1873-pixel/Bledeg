--// ⚡ THOR'S WRATH — Lightning Strike Tool
--// Paste ini ke GitHub → Jalankan via loadstring

local USERNAME = "kafian21" -- ← GANTI INI!

--════════════════════════════════════════
-- SERVICES
--════════════════════════════════════════
local Players   = game:GetService("Players")
local Debris    = game:GetService("Debris")

local player = Players:FindFirstChild(USERNAME)
if not player then
    warn("[⚡] Player '" .. USERNAME .. "' tidak ditemukan!")
    return
end

--════════════════════════════════════════
-- SETTINGS
--════════════════════════════════════════
local BOLT_HEIGHT    = 250
local SEGMENTS       = 25
local BOLT_THICKNESS = 0.5
local MAX_SPREAD     = 14
local KILL_RADIUS    = 22
local COOLDOWN_TIME  = 2
local BRANCH_MIN     = 2
local BRANCH_MAX     = 5

local isOnCooldown = false

--════════════════════════════════════════
-- ZIGZAG POINT GENERATOR
--════════════════════════════════════════
local function generatePoints(startPos, endPos, segs, spread)
    local pts = {startPos}
    for i = 1, segs - 1 do
        local t    = i / segs
        local base = startPos:Lerp(endPos, t)
        local factor = math.sin(t * math.pi)
        local offset = Vector3.new(
            (math.random() * 2 - 1) * spread * factor,
            0,
            (math.random() * 2 - 1) * spread * factor
        )
        pts[#pts + 1] = base + offset
    end
    pts[#pts + 1] = endPos
    return pts
end

--════════════════════════════════════════
-- BOLT PART CREATOR
--════════════════════════════════════════
local function createBoltParts(points, thickness, color, trans, parent)
    local parts = {}
    for i = 1, #points - 1 do
        local a, b = points[i], points[i + 1]
        local dist = (b - a).Magnitude

        local p       = Instance.new("Part")
        p.Name        = "Bolt"
        p.Anchored    = true
        p.CanCollide  = false
        p.Material    = Enum.Material.Neon
        p.Color       = color
        p.Transparency = trans
        p.Size        = Vector3.new(thickness, thickness, dist)
        p.CFrame      = CFrame.lookAt((a + b) / 2, b)
        p.Parent      = parent
        parts[#parts + 1] = p
    end
    return parts
end

--════════════════════════════════════════
-- ⚡ FULL LIGHTNING STRIKE
--════════════════════════════════════════
local function strikeLightning(targetPos)
    local folder   = Instance.new("Folder")
    folder.Name    = "LightningStrike"
    folder.Parent  = workspace

    local skyPos = targetPos + Vector3.new(0, BOLT_HEIGHT, 0)

    -- MAIN BOLT
    local mainPts  = generatePoints(skyPos, targetPos, SEGMENTS, MAX_SPREAD)
    local mainBolt = createBoltParts(
        mainPts, BOLT_THICKNESS,
        Color3.fromRGB(170, 220, 255), 0, folder
    )

    -- INNER CORE
    local corePts = generatePoints(skyPos, targetPos, SEGMENTS, MAX_SPREAD * 0.4)
    createBoltParts(
        corePts, BOLT_THICKNESS * 3.5,
        Color3.fromRGB(255, 255, 255), 0.55, folder
    )

    -- BRANCH BOLTS
    local numBranches = math.random(BRANCH_MIN, BRANCH_MAX)
    for _ = 1, numBranches do
        local splitT = math.random(15, 65) / 100
        local origin = skyPos:Lerp(targetPos, splitT)
        local branchEnd = origin + Vector3.new(
            (math.random() * 2 - 1) * 40,
            -math.random(15, 55),
            (math.random() * 2 - 1) * 40
        )
        local bPts = generatePoints(origin, branchEnd, 8, 6)
        createBoltParts(
            bPts, BOLT_THICKNESS * 0.3,
            Color3.fromRGB(140, 200, 255), 0.1, folder
        )
    end

    -- IMPACT GLOW
    local impact       = Instance.new("Part")
    impact.Name        = "Impact"
    impact.Anchored    = true
    impact.CanCollide  = false
    impact.Shape       = Enum.PartType.Ball
    impact.Material    = Enum.Material.Neon
    impact.Color       = Color3.fromRGB(220, 240, 255)
    impact.Size        = Vector3.new(10, 10, 10)
    impact.Transparency = 0.2
    impact.Position    = targetPos
    impact.Parent      = folder

    -- SHOCKWAVE RING
    local ring       = Instance.new("Part")
    ring.Name        = "ShockRing"
    ring.Anchored    = true
    ring.CanCollide  = false
    ring.Shape       = Enum.PartType.Cylinder
    ring.Material    = Enum.Material.Neon
    ring.Color       = Color3.fromRGB(100, 180, 255)
    ring.Size        = Vector3.new(0.3, 4, 4)
    ring.CFrame      = CFrame.new(targetPos) * CFrame.Angles(0, 0, math.rad(90))
    ring.Transparency = 0.3
    ring.Parent      = folder

    -- LIGHTS
    local mainLight       = Instance.new("PointLight")
    mainLight.Color       = Color3.fromRGB(180, 225, 255)
    mainLight.Brightness  = 30
    mainLight.Range       = 120
    mainLight.Parent      = impact

    local midIdx = math.floor(#mainBolt / 2)
    if mainBolt[midIdx] then
        local midLight      = Instance.new("PointLight")
        midLight.Color      = Color3.fromRGB(180, 225, 255)
        midLight.Brightness = 12
        midLight.Range      = 80
        midLight.Parent     = mainBolt[midIdx]
    end

    -- SOUNDS
    local crack       = Instance.new("Sound")
    crack.SoundId     = "rbxassetid://517040733"
    crack.Volume      = 3
    crack.RollOffMaxDistance = 600
    crack.Parent      = impact
    crack:Play()

    task.delay(0.25, function()
        local rumble       = Instance.new("Sound")
        rumble.SoundId     = "rbxassetid://130818250"
        rumble.Volume      = 2.5
        rumble.RollOffMaxDistance = 600
        rumble.Parent      = impact
        rumble:Play()
    end)

    -- EXPLOSION
    local exp = Instance.new("Explosion")
    exp.Position                = targetPos
    exp.BlastRadius             = KILL_RADIUS
    exp.BlastPressure           = 400000
    exp.DestroyJointRadiusPercent = 0
    exp.Parent                  = workspace

    exp.Hit:Connect(function(hitPart)
        if player.Character and hitPart:IsDescendantOf(player.Character) then
            hitPart.Anchored = false
        end
    end)

    -- KILL PLAYERS
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                if (hrp.Position - targetPos).Magnitude <= KILL_RADIUS then
                    hum.Health = 0
                end
            end
        end
    end

    -- FLASH + FADE
    task.spawn(function()
        for _ = 1, 5 do
            for _, obj in ipairs(folder:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.Transparency = math.min(obj.Transparency + 0.6, 1)
                end
            end
            task.wait(0.035)
            for _, obj in ipairs(folder:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.Transparency = math.max(obj.Transparency - 0.6, 0)
                end
            end
            task.wait(0.035)
        end

        for step = 1, 25 do
            local alpha = step / 25
            for _, obj in ipairs(folder:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.Transparency = alpha
                elseif obj:IsA("PointLight") then
                    obj.Brightness = obj.Brightness * 0.82
                end
            end
            ring.Size = ring.Size + Vector3.new(0, 2, 2)
            ring.Transparency = 0.3 + (0.7 * alpha)
            task.wait(0.035)
        end

        folder:Destroy()
    end)
end

--════════════════════════════════════════
-- 🔨 TOOL CREATION
--════════════════════════════════════════
local tool          = Instance.new("Tool")
tool.Name           = "⚡ Thor's Wrath ⚡"
tool.RequiresHandle = true
tool.ToolTip        = "Klik untuk memanggil petir!"

local handle      = Instance.new("Part")
handle.Name       = "Handle"
handle.Size       = Vector3.new(0.5, 0.5, 6)
handle.Material   = Enum.Material.Neon
handle.Color      = Color3.fromRGB(255, 230, 80)
handle.Parent     = tool

local hGlow       = Instance.new("PointLight")
hGlow.Color       = Color3.fromRGB(255, 240, 150)
hGlow.Brightness  = 3
hGlow.Range       = 15
hGlow.Parent      = handle

local sparks = Instance.new("ParticleEmitter")
sparks.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 215, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 200))
})
sparks.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.4),
    NumberSequenceKeypoint.new(1, 0)
})
sparks.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(1, 1)
})
sparks.Lifetime      = NumberRange.new(0.1, 0.4)
sparks.Rate          = 35
sparks.Speed         = NumberRange.new(3, 8)
sparks.SpreadAngle   = Vector2.new(180, 180)
sparks.LightEmission = 1
sparks.LightInfluence = 0
sparks.Parent        = handle

--════════════════════════════════════════
-- 🎯 TOOL ACTIVATION
--════════════════════════════════════════
tool.Activated:Connect(function()
    if isOnCooldown then return end
    isOnCooldown = true

    local char = player.Character
    if not char then isOnCooldown = false return end
    local head = char:FindFirstChild("Head")
    if not head then isOnCooldown = false return end

    local mouse = player:GetMouse()
    local hitPos

    if mouse and mouse.Hit then
        hitPos = mouse.Hit.Position
    else
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = {char}
        params.FilterType = Enum.RaycastFilterType.Exclude

        local result = workspace:Raycast(
            head.Position,
            head.CFrame.LookVector * 500,
            params
        )

        if result then
            hitPos = result.Position
        else
            hitPos = head.Position + head.CFrame.LookVector * 300
        end
    end

    strikeLightning(hitPos)

    task.delay(COOLDOWN_TIME, function()
        isOnCooldown = false
    end)
end)

--════════════════════════════════════════
-- BERIKAN TOOL
--════════════════════════════════════════
tool.Parent = player.Backpack

print("══════════════════════════════════════════")
print("  ⚡  THOR'S WRATH LOADED!")
print("  Player: " .. USERNAME)
print("  Equip tool → Klik target → ⚡ PETIR!")
print("══════════════════════════════════════════")
