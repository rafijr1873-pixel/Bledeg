--[[
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║    ███╗   ██╗ ██████╗ ███╗   ██╗███████╗███████╗███╗   ██╗███████╗███████╗   ║
║    ████╗  ██║██╔═══██╗████╗  ██║██╔════╝██╔════╝████╗  ██║██╔════╝██╔════╝   ║
║    ██╔██╗ ██║██║   ██║██╔██╗ ██║███████╗█████╗  ██╔██╗ ██║███████╗█████╗     ║
║    ██║╚██╗██║██║   ██║██║╚██╗██║╚════██║██╔══╝  ██║╚██╗██║╚════██║██╔══╝     ║
║    ██║ ╚████║╚██████╔╝██║ ╚████║███████║███████╗██║ ╚████║███████║███████╗   ║
║    ╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝   ║
║                                                                              ║
║              ██╗  ██╗    ██╗  ██╗██╗   ██╗██████╗                             ║
║              ╚██╗██╔╝    ██║  ██║██║   ██║██╔══██╗                            ║
║               ╚███╔╝     ███████║██║   ██║██████╔╝                            ║
║               ██╔██╗     ██╔══██║██║   ██║██╔══██╗                            ║
║              ██╔╝ ██╗    ██║  ██║╚██████╔╝██████╔╝                            ║
║              ╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝                            ║
║                                                                              ║
║                    ULTIMATE EDITION v4.0.0                                    ║
║                    Created with passion                                      ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
]]

-- ============================================================================
-- SECTION 1: INITIALIZATION & SECURITY
-- ============================================================================

-- Prevent double execution
if getgenv().NonsenseXHub_Loaded then
    warn("[Nonsense X Hub] Already loaded! Preventing double execution.")
    return
end
getgenv().NonsenseXHub_Loaded = true

-- ============================================================================
-- SECTION 2: SERVICES
-- ============================================================================

local Services = {}
Services.Players = game:GetService("Players")
Services.RunService = game:GetService("RunService")
Services.ReplicatedStorage = game:GetService("ReplicatedStorage")
Services.Workspace = game:GetService("Workspace")
Services.UserInputService = game:GetService("UserInputService")
Services.TweenService = game:GetService("TweenService")
Services.Lighting = game:GetService("Lighting")
Services.SoundService = game:GetService("SoundService")
Services.StarterGui = game:GetService("StarterGui")
Services.CoreGui = game:GetService("CoreGui")
Services.HttpService = game:GetService("HttpService")
Services.TeleportService = game:GetService("TeleportService")
Services.MarketplaceService = game:GetService("MarketplaceService")
Services.Chat = game:GetService("Chat")
Services.Teams = game:GetService("Teams")
Services.PathfindingService = game:GetService("PathfindingService")
Services.ProximityPromptService = game:GetService("ProximityPromptService")
Services.VirtualInputManager = game:GetService("VirtualInputManager")
Services.GuiService = game:GetService("GuiService")
Services.TextService = game:GetService("TextService")
Services.ContentProvider = game:GetService("ContentProvider")
Services.CollectionService = game:GetService("CollectionService")
Services.Debris = game:GetService("Debris")

-- ============================================================================
-- SECTION 3: LOCAL PLAYER REFERENCES
-- ============================================================================

local LocalPlayer = Services.Players.LocalPlayer
local Camera = Services.Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- ============================================================================
-- SECTION 4: CONFIGURATION SYSTEM
-- ============================================================================

local Config = {
    -- Hub Settings
    Hub = {
        Name = "Nonsense X Hub",
        Version = "4.0.0",
        Author = "Nonsense X Team",
        ToggleKey = Enum.KeyCode.RightShift,
        Theme = "Dark",
        Transparency = 0.05,
        CornerRadius = 8,
        AnimationSpeed = 0.3,
        NotificationDuration = 4,
        AutoSave = true,
        SaveInterval = 60,
        Language = "English",
        ShowFPS = true,
        ShowPing = true,
        ShowTime = true,
        ShowPlayerCount = true,
    },

    -- Color Palette
    Colors = {
        -- Primary
        Primary = Color3.fromRGB(88, 101, 242),
        PrimaryDark = Color3.fromRGB(71, 82, 196),
        PrimaryLight = Color3.fromRGB(114, 127, 255),

        -- Secondary
        Secondary = Color3.fromRGB(78, 84, 92),
        SecondaryDark = Color3.fromRGB(54, 57, 63),
        SecondaryLight = Color3.fromRGB(104, 111, 122),

        -- Accent
        Accent = Color3.fromRGB(87, 242, 135),
        AccentDark = Color3.fromRGB(59, 165, 93),
        AccentLight = Color3.fromRGB(128, 255, 170),

        -- Status
        Success = Color3.fromRGB(87, 242, 135),
        Warning = Color3.fromRGB(254, 231, 92),
        Error = Color3.fromRGB(237, 66, 69),
        Info = Color3.fromRGB(88, 101, 242),

        -- Background
        Background = Color3.fromRGB(32, 34, 37),
        BackgroundDark = Color3.fromRGB(24, 25, 28),
        BackgroundLight = Color3.fromRGB(47, 49, 54),
        BackgroundLighter = Color3.fromRGB(54, 57, 63),

        -- Text
        TextPrimary = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(185, 187, 190),
        TextMuted = Color3.fromRGB(114, 118, 125),
        TextDisabled = Color3.fromRGB(72, 75, 81),

        -- Roles (MM2)
        Murderer = Color3.fromRGB(255, 50, 50),
        Sheriff = Color3.fromRGB(50, 100, 255),
        Innocent = Color3.fromRGB(50, 255, 50),
        Hero = Color3.fromRGB(255, 215, 0),

        -- Special
        Rainbow = Color3.fromRGB(255, 0, 0),
        Neon = Color3.fromRGB(0, 255, 255),
        Gold = Color3.fromRGB(255, 215, 0),
        Silver = Color3.fromRGB(192, 192, 192),
        Bronze = Color3.fromRGB(205, 127, 50),
        Diamond = Color3.fromRGB(185, 242, 255),
        Platinum = Color3.fromRGB(229, 228, 226),
        Emerald = Color3.fromRGB(80, 200, 120),
        Ruby = Color3.fromRGB(224, 17, 95),
        Sapphire = Color3.fromRGB(15, 82, 186),
        Amethyst = Color3.fromRGB(153, 102, 204),
    },

    -- Feature States
    Features = {
        -- ESP
        ESP = {
            Enabled = false,
            Highlight = true,
            Box = false,
            Tracer = false,
            Name = true,
            Health = true,
            Distance = true,
            Weapon = false,
            Role = true,
            TeamCheck = false,
            ShowSelf = false,
            MaxDistance = 5000,
            RefreshRate = 0.1,
            HighlightTransparency = 0.5,
            BoxThickness = 1.5,
            TracerThickness = 1.5,
            TextSize = 14,
            TextFont = Drawing.Fonts.Plex,
            TextOutline = true,
            Filter = "All", -- All, Murderer, Sheriff, Innocent
            RainbowMode = false,
        },

        -- Aimbot
        Aimbot = {
            Enabled = false,
            TargetPart = "Head",
            FOV = 200,
            ShowFOV = true,
            FOVColor = Color3.fromRGB(255, 255, 255),
            FOVThickness = 1,
            Smoothness = 5,
            MaxDistance = 1000,
            TeamCheck = false,
            WallCheck = true,
            VisibleCheck = true,
            AutoShoot = false,
            Prediction = false,
            PredictionAmount = 0.165,
            StickyAim = false,
            AimKey = Enum.UserInputType.MouseButton2,
            TargetPriority = "Distance", -- Distance, Health, Crosshair
            SnapLines = false,
            SilentAim = false,
            AimNotification = true,
        },

        -- Character
        Character = {
            WalkSpeed = {Value = 16, Default = 16, Locked = false, Enabled = false},
            JumpPower = {Value = 50, Default = 50, Locked = false, Enabled = false},
            Gravity = {Value = 196.2, Default = 196.2, Enabled = false},
            HipHeight = {Value = 0, Default = 0, Enabled = false},
            Noclip = false,
            InfiniteJump = false,
            Fly = {Enabled = false, Speed = 50, ToggleKey = Enum.KeyCode.F},
            SpeedHack = {Enabled = false, Multiplier = 2},
            GodMode = false,
            NoFall = false,
            NoRagdoll = false,
            AutoJump = false,
            ClickTP = {Enabled = false, Key = Enum.KeyCode.T},
            Freeze = false,
            Invisible = false,
            NoClipKey = Enum.KeyCode.N,
        },

        -- Teleport
        Teleport = {
            SelectedPlayer = nil,
            AutoTP = false,
            TPDelay = 0.5,
            SafeTP = true,
            TPMethod = "Instant", -- Instant, Tween, Lerp
            TweenSpeed = 50,
            SavedPositions = {},
            TPHistory = {},
            MaxHistory = 20,
        },

        -- Combat
        Combat = {
            KillAll = false,
            KillAura = false,
            KillAuraRange = 15,
            AttackDelay = 0.3,
            AutoEquip = true,
            TargetPriority = "Distance", -- Distance, Health, Role
            AntiKill = false,
            HitboxExpander = {Enabled = false, Size = 10},
            Reach = {Enabled = false, Amount = 20},
        },

        -- AutoFarm
        AutoFarm = {
            Coins = {Enabled = false, Speed = 25, Method = "Tween"},
            Candy = {Enabled = false, Speed = 25, Method = "Tween"},
            Gems = {Enabled = false, Speed = 25, Method = "Tween"},
            XP = {Enabled = false, Method = "Auto"},
            AutoReset = {Enabled = false, Threshold = 40},
            AutoFling = {Enabled = false, Target = "Murderer"},
            NoCollision = true,
            ReturnToStart = true,
            FarmStatus = "Idle",
            TotalCollected = 0,
            SessionCollected = 0,
        },

        -- Visual
        Visual = {
            Fullbright = false,
            NoFog = false,
            CustomSkybox = false,
            SkyboxID = "",
            TimeOfDay = "Auto",
            CustomTime = 12,
            AmbientColor = Color3.fromRGB(128, 128, 128),
            FogEnd = 100000,
            FogColor = Color3.fromRGB(128, 128, 128),
            Bloom = {Enabled = false, Intensity = 0.5, Size = 24, Threshold = 0.8},
            DepthOfField = {Enabled = false, FarIntensity = 0.1, FocusDistance = 50, InFocusRadius = 30, NearIntensity = 0},
            ColorCorrection = {Enabled = false, Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.fromRGB(255, 255, 255)},
            SunRays = {Enabled = false, Intensity = 0.1, Spread = 0.5},
            Blur = {Enabled = false, Size = 10},
            NoParticles = false,
            NoTextures = false,
            NoDecals = false,
            WireframeMode = false,
            XRay = false,
            Chams = {Enabled = false, Color = Color3.fromRGB(255, 0, 255), Transparency = 0.3},
            ForceField = {Enabled = false, Color = Color3.fromRGB(0, 255, 0)},
            CustomCrosshair = {Enabled = false, Size = 10, Thickness = 2, Gap = 5, Color = Color3.fromRGB(0, 255, 0), Dot = true, DotSize = 3},
            ThirdPerson = {Enabled = false, Distance = 10},
            FOVChanger = {Enabled = false, Value = 70},
            Freecam = {Enabled = false, Speed = 1, Key = Enum.KeyCode.P},
        },

        -- Utility
        Utility = {
            AntiAFK = true,
            AntiKick = false,
            AntiTeleport = false,
            AntiSlow = false,
            ChatSpammer = {Enabled = false, Message = "Nonsense X Hub", Delay = 3, Messages = {}},
            ServerHop = {Enabled = false, MinPlayers = 1, MaxPlayers = 20},
            Rejoin = false,
            FPSBoost = false,
            FPSCap = 60,
            StreamerMode = false,
            Screenshot = false,
            RecordPosition = false,
            AutoRejoin = false,
            PingDisplay = true,
            FPSDisplay = true,
            Watermark = true,
            KeybindList = true,
            TargetInfo = false,
            PlayerList = false,
            Notifications = true,
            SoundAlerts = false,
            DiscordWebhook = {Enabled = false, URL = "", SendKills = false, SendDeaths = false},
        },

        -- World
        World = {
            DestroyParts = false,
            GrabParts = false,
            AnchParts = false,
            FireTouch = false,
            ProximityPrompt = {Enabled = false, Range = 50, HoldDuration = 0},
            DoorBreaker = false,
            LadderClimb = false,
            WaterWalk = false,
            SpiderClimb = false,
        },

        -- Gun System (MM2)
        Gun = {
            AutoGrab = false,
            NotifyDrop = true,
            AutoShoot = false,
            SilentAim = false,
            ShootMurderer = false,
            GrabDistance = 500,
        },

        -- Knife System (MM2)
        Knife = {
            AutoEquip = false,
            AutoKill = false,
            KillAll = false,
            ThrowAim = false,
            InstantThrow = false,
        },

        -- Trade System (MM2)
        Trade = {
            VisualTrade = false,
            TradeLogger = false,
            AutoDecline = false,
            AutoAccept = false,
            TradeNotify = true,
        },

        -- Weapon System (MM2)
        Weapon = {
            Spawner = {Enabled = false, ItemName = ""},
            Duplicator = {Enabled = false, ItemName = "", Amount = 1},
            Replacer = {Enabled = false, From = "", To = ""},
            InventoryDupe = false,
        },

        -- Player Info
        PlayerInfo = {
            ShowRole = true,
            ShowHealth = true,
            ShowDistance = true,
            ShowWeapon = true,
            ShowLevel = false,
            ShowAccount = false,
        },
    },

    -- Saved Data
    SavedData = {
        Positions = {},
        Configs = {},
        Keybinds = {},
        Favorites = {},
        Blacklist = {},
        Whitelist = {},
        Notes = {},
        Statistics = {
            TotalKills = 0,
            TotalDeaths = 0,
            TotalCoins = 0,
            TotalCandy = 0,
            SessionTime = 0,
            TotalSessions = 0,
            GamesPlayed = 0,
            Wins = 0,
            Losses = 0,
        },
    },
}

-- ============================================================================
-- SECTION 5: UTILITY FUNCTIONS
-- ============================================================================

local Utility = {}

-- Safe call wrapper
function Utility.SafeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        warn("[Nonsense X Hub] Error: " .. tostring(result))
    end
    return success, result
end

-- Deep copy table
function Utility.DeepCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        if type(value) == "table" then
            copy[key] = Utility.DeepCopy(value)
        else
            copy[key] = value
        end
    end
    return copy
end

-- Merge tables
function Utility.MergeTables(base, override)
    local result = Utility.DeepCopy(base)
    for key, value in pairs(override) do
        if type(value) == "table" and type(result[key]) == "table" then
            result[key] = Utility.MergeTables(result[key], value)
        else
            result[key] = value
        end
    end
    return result
end

-- Format number
function Utility.FormatNumber(num)
    if num >= 1000000000 then
        return string.format("%.1fB", num / 1000000000)
    elseif num >= 1000000 then
        return string.format("%.1fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.1fK", num / 1000)
    else
        return tostring(math.floor(num))
    end
end

-- Format time
function Utility.FormatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    if hours > 0 then
        return string.format("%02d:%02d:%02d", hours, minutes, secs)
    else
        return string.format("%02d:%02d", minutes, secs)
    end
end

-- Get distance between two positions
function Utility.GetDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

-- Check if player is alive
function Utility.IsAlive(player)
    local char = player and player.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return false end
    return hum.Health > 0
end

-- Get humanoid root part
function Utility.GetHRP(player)
    local char = player and player.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

-- Get humanoid
function Utility.GetHumanoid(player)
    local char = player and player.Character
    if not char then return nil end
    return char:FindFirstChildOfClass("Humanoid")
end

-- Get character
function Utility.GetCharacter(player)
    return player and player.Character
end

-- Is on screen
function Utility.IsOnScreen(position)
    local screenPos, onScreen = Camera:WorldToViewportPoint(position)
    return onScreen, Vector2.new(screenPos.X, screenPos.Y)
end

-- World to screen
function Utility.WorldToScreen(position)
    local screenPos, onScreen = Camera:WorldToViewportPoint(position)
    return Vector2.new(screenPos.X, screenPos.Y), onScreen, screenPos.Z
end

-- Ray cast
function Utility.RayCast(origin, direction, ignoreList)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = ignoreList or {}
    params.IgnoreWater = true
    return Services.Workspace:Raycast(origin, direction, params)
end

-- Check wall between two positions
function Utility.IsVisible(origin, target, ignoreList)
    local direction = (target - origin)
    local result = Utility.RayCast(origin, direction, ignoreList)
    if result then
        return (result.Position - target).Magnitude < 5
    end
    return true
end

-- Gradient text
function Utility.GradientText(text, color1, color2)
    local len = #text
    local result = ''
    for i = 1, len do
        local t = (i - 1) / math.max(len - 1, 1)
        local r = math.floor((color1.R + (color2.R - color1.R) * t) * 255)
        local g = math.floor((color1.G + (color2.G - color1.G) * t) * 255)
        local b = math.floor((color1.B + (color2.B - color1.B) * t) * 255)
        result = result .. '<font color="rgb(' .. r .. ', ' .. g .. ', ' .. b .. ')">' .. text:sub(i, i) .. '</font>'
    end
    return result
end

-- Rainbow color
function Utility.GetRainbowColor(speed)
    speed = speed or 1
    local t = tick() * speed
    return Color3.fromHSV(t % 1, 1, 1)
end

-- Lerp color
function Utility.LerpColor(color1, color2, alpha)
    return Color3.new(
        color1.R + (color2.R - color1.R) * alpha,
        color1.G + (color2.G - color1.G) * alpha,
        color1.B + (color2.B - color1.B) * alpha
    )
end

-- Clamp value
function Utility.Clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

-- Round value
function Utility.Round(value, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(value * mult + 0.5) / mult
end

-- Generate UUID
function Utility.GenerateUUID()
    local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function(c)
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format('%x', v)
    end)
end

-- Get timestamp
function Utility.GetTimestamp()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- Tween object
function Utility.TweenObject(object, properties, duration, style, direction)
    local tweenInfo = TweenInfo.new(
        duration or Config.Hub.AnimationSpeed,
        style or Enum.EasingStyle.Quint,
        direction or Enum.EasingDirection.Out
    )
    local tween = Services.TweenService:Create(object, tweenInfo, properties)
    tween:Play()
    return tween
end

-- Play sound
function Utility.PlaySound(soundId, volume, pitch)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. tostring(soundId)
    sound.Volume = volume or 0.5
    sound.PlaybackSpeed = pitch or 1
    sound.Parent = Services.SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
    return sound
end

-- Get game info
function Utility.GetGameInfo()
    return {
        PlaceId = game.PlaceId,
        GameId = game.GameId,
        JobId = game.JobId,
        PlaceName = Services.MarketplaceService:GetProductInfo(game.PlaceId).Name or "Unknown",
        PlayerCount = #Services.Players:GetPlayers(),
        MaxPlayers = Services.Players.MaxPlayers,
        ServerAge = Services.Workspace.DistributedGameTime,
    }
end

-- Get player info
function Utility.GetPlayerInfo(player)
    return {
        Name = player.Name,
        DisplayName = player.DisplayName,
        UserId = player.UserId,
        AccountAge = player.AccountAge,
        Team = player.Team and player.Team.Name or "None",
        Character = player.Character,
        IsAlive = Utility.IsAlive(player),
        Health = Utility.GetHumanoid(player) and Utility.GetHumanoid(player).Health or 0,
        MaxHealth = Utility.GetHumanoid(player) and Utility.GetHumanoid(player).MaxHealth or 100,
        Position = Utility.GetHRP(player) and Utility.GetHRP(player).Position or Vector3.new(0, 0, 0),
        Distance = Utility.GetHRP(player) and Utility.GetHRP(LocalPlayer) and Utility.GetDistance(Utility.GetHRP(player).Position, Utility.GetHRP(LocalPlayer).Position) or 0,
    }
end

-- Check executor
function Utility.GetExecutor()
    local executors = {
        {name = "Synapse X", check = function() return syn and syn.protect_gui end},
        {name = "Script-Ware", check = function() return identifyexecutor and identifyexecutor():find("Script-Ware") end},
        {name = "Fluxus", check = function() return identifyexecutor and identifyexecutor():find("Fluxus") end},
        {name = "KRNL", check = function() return identifyexecutor and identifyexecutor():find("KRNL") end},
        {name = "Arceus X", check = function() return identifyexecutor and identifyexecutor():find("Arceus") end},
        {name = "Delta", check = function() return identifyexecutor and identifyexecutor():find("Delta") end},
        {name = "Hydrogen", check = function() return identifyexecutor and identifyexecutor():find("Hydrogen") end},
        {name = "Solara", check = function() return identifyexecutor and identifyexecutor():find("Solara") end},
        {name = "Wave", check = function() return identifyexecutor and identifyexecutor():find("Wave") end},
        {name = "Codex", check = function() return identifyexecutor and identifyexecutor():find("Codex") end},
    }

    for _, executor in ipairs(executors) do
        local success, result = pcall(executor.check)
        if success and result then
            return executor.name
        end
    end

    if identifyexecutor then
        local success, name = pcall(identifyexecutor)
        if success then return name end
    end

    return "Unknown"
end

-- ============================================================================
-- SECTION 6: DRAWING LIBRARY
-- ============================================================================

local DrawingLib = {}
DrawingLib.Objects = {}
DrawingLib.ActiveObjects = {}

function DrawingLib.New(objectType, properties)
    local obj = Drawing.new(objectType)
    for prop, value in pairs(properties or {}) do
        pcall(function() obj[prop] = value end)
    end
    table.insert(DrawingLib.ActiveObjects, obj)
    return obj
end

function DrawingLib.Remove(obj)
    if obj then
        pcall(function() obj:Remove() end)
        for i, v in ipairs(DrawingLib.ActiveObjects) do
            if v == obj then
                table.remove(DrawingLib.ActiveObjects, i)
                break
            end
        end
    end
end

function DrawingLib.ClearAll()
    for _, obj in ipairs(DrawingLib.ActiveObjects) do
        pcall(function() obj:Remove() end)
    end
    DrawingLib.ActiveObjects = {}
end

function DrawingLib.CreateLine(from, to, color, thickness, visible)
    return DrawingLib.New("Line", {
        From = from or Vector2.new(0, 0),
        To = to or Vector2.new(0, 0),
        Color = color or Color3.new(1, 1, 1),
        Thickness = thickness or 1,
        Transparency = 1,
        Visible = visible ~= false,
    })
end

function DrawingLib.CreateCircle(position, radius, color, thickness, filled, visible)
    return DrawingLib.New("Circle", {
        Position = position or Vector2.new(0, 0),
        Radius = radius or 50,
        Color = color or Color3.new(1, 1, 1),
        Thickness = thickness or 1,
        Filled = filled or false,
        NumSides = 64,
        Transparency = 1,
        Visible = visible ~= false,
    })
end

function DrawingLib.CreateText(position, text, color, size, center, outline, visible)
    return DrawingLib.New("Text", {
        Position = position or Vector2.new(0, 0),
        Text = text or "",
        Color = color or Color3.new(1, 1, 1),
        Size = size or 14,
        Center = center ~= false,
        Outline = outline ~= false,
        OutlineColor = Color3.new(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Transparency = 1,
        Visible = visible ~= false,
    })
end

function DrawingLib.CreateSquare(position, size, color, thickness, filled, visible)
    return DrawingLib.New("Square", {
        Position = position or Vector2.new(0, 0),
        Size = size or Vector2.new(100, 100),
        Color = color or Color3.new(1, 1, 1),
        Thickness = thickness or 1,
        Filled = filled or false,
        Transparency = 1,
        Visible = visible ~= false,
    })
end

function DrawingLib.CreateTriangle(p1, p2, p3, color, thickness, filled, visible)
    return DrawingLib.New("Triangle", {
        PointA = p1 or Vector2.new(0, 0),
        PointB = p2 or Vector2.new(0, 0),
        PointC = p3 or Vector2.new(0, 0),
        Color = color or Color3.new(1, 1, 1),
        Thickness = thickness or 1,
        Filled = filled or false,
        Transparency = 1,
        Visible = visible ~= false,
    })
end

function DrawingLib.CreateImage(position, size, data, visible)
    return DrawingLib.New("Image", {
        Position = position or Vector2.new(0, 0),
        Size = size or Vector2.new(100, 100),
        Data = data or "",
        Transparency = 1,
        Visible = visible ~= false,
    })
end

-- ============================================================================
-- SECTION 7: UI LIBRARY
-- ============================================================================

local UILib = {}
UILib.Windows = {}
UILib.Flags = {}
UILib.Connections = {}
UILib.ScreenGui = nil
UILib.IsOpen = true

-- Create main screen GUI
function UILib.Initialize()
    -- Destroy old GUI if exists
    pcall(function()
        if Services.CoreGui:FindFirstChild("NonsenseXHub") then
            Services.CoreGui:FindFirstChild("NonsenseXHub"):Destroy()
        end
    end)

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NonsenseXHub"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 999999

    -- Try to parent to CoreGui, fallback to PlayerGui
    pcall(function()
        if syn and syn.protect_gui then
            syn.protect_gui(screenGui)
            screenGui.Parent = Services.CoreGui
        elseif gethui then
            screenGui.Parent = gethui()
        else
            screenGui.Parent = Services.CoreGui
        end
    end)

    if not screenGui.Parent then
        screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end

    UILib.ScreenGui = screenGui
    return screenGui
end

-- Create rounded frame
function UILib.CreateFrame(parent, properties)
    local frame = Instance.new("Frame")
    frame.BackgroundColor3 = properties.BackgroundColor3 or Config.Colors.Background
    frame.BorderSizePixel = 0
    frame.Size = properties.Size or UDim2.new(0, 100, 0, 100)
    frame.Position = properties.Position or UDim2.new(0, 0, 0, 0)
    frame.AnchorPoint = properties.AnchorPoint or Vector2.new(0, 0)
    frame.BackgroundTransparency = properties.BackgroundTransparency or 0
    frame.ClipsDescendants = properties.ClipsDescendants or false
    frame.Visible = properties.Visible ~= false
    frame.Name = properties.Name or "Frame"
    frame.ZIndex = properties.ZIndex or 1
    frame.Parent = parent

    if properties.CornerRadius then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, properties.CornerRadius)
        corner.Parent = frame
    end

    if properties.Stroke then
        local stroke = Instance.new("UIStroke")
        stroke.Color = properties.Stroke.Color or Config.Colors.BackgroundLighter
        stroke.Thickness = properties.Stroke.Thickness or 1
        stroke.Transparency = properties.Stroke.Transparency or 0
        stroke.Parent = frame
    end

    if properties.Gradient then
        local gradient = Instance.new("UIGradient")
        gradient.Color = properties.Gradient.Color or ColorSequence.new(Color3.new(1, 1, 1))
        gradient.Rotation = properties.Gradient.Rotation or 0
        gradient.Parent = frame
    end

    if properties.Shadow then
        local shadow = Instance.new("ImageLabel")
        shadow.Name = "Shadow"
        shadow.BackgroundTransparency = 1
        shadow.Position = UDim2.new(0, -15, 0, -15)
        shadow.Size = UDim2.new(1, 30, 1, 30)
        shadow.ZIndex = frame.ZIndex - 1
        shadow.Image = "rbxassetid://6015897843"
        shadow.ImageColor3 = Color3.new(0, 0, 0)
        shadow.ImageTransparency = 0.5
        shadow.ScaleType = Enum.ScaleType.Slice
        shadow.SliceCenter = Rect.new(49, 49, 450, 450)
        shadow.Parent = frame
    end

    return frame
end

-- Create text label
function UILib.CreateLabel(parent, properties)
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Text = properties.Text or ""
    label.TextColor3 = properties.TextColor3 or Config.Colors.TextPrimary
    label.TextSize = properties.TextSize or 14
    label.Font = properties.Font or Enum.Font.GothamSemibold
    label.Size = properties.Size or UDim2.new(1, 0, 0, 20)
    label.Position = properties.Position or UDim2.new(0, 0, 0, 0)
    label.TextXAlignment = properties.TextXAlignment or Enum.TextXAlignment.Left
    label.TextYAlignment = properties.TextYAlignment or Enum.TextYAlignment.Center
    label.RichText = properties.RichText ~= false
    label.TextWrapped = properties.TextWrapped or false
    label.Name = properties.Name or "Label"
    label.ZIndex = properties.ZIndex or 1
    label.Parent = parent
    return label
end

-- Create text button
function UILib.CreateButton(parent, properties)
    local button = Instance.new("TextButton")
    button.BackgroundColor3 = properties.BackgroundColor3 or Config.Colors.Primary
    button.BorderSizePixel = 0
    button.Text = properties.Text or "Button"
    button.TextColor3 = properties.TextColor3 or Config.Colors.TextPrimary
    button.TextSize = properties.TextSize or 14
    button.Font = properties.Font or Enum.Font.GothamSemibold
    button.Size = properties.Size or UDim2.new(0, 100, 0, 30)
    button.Position = properties.Position or UDim2.new(0, 0, 0, 0)
    button.AutoButtonColor = false
    button.Name = properties.Name or "Button"
    button.ZIndex = properties.ZIndex or 1
    button.Parent = parent

    if properties.CornerRadius then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, properties.CornerRadius)
        corner.Parent = button
    end

    -- Hover effect
    button.MouseEnter:Connect(function()
        Utility.TweenObject(button, {BackgroundColor3 = Utility.LerpColor(button.BackgroundColor3, Color3.new(1, 1, 1), 0.1)}, 0.2)
    end)

    button.MouseLeave:Connect(function()
        Utility.TweenObject(button, {BackgroundColor3 = properties.BackgroundColor3 or Config.Colors.Primary}, 0.2)
    end)

    -- Click effect
    button.MouseButton1Down:Connect(function()
        Utility.TweenObject(button, {BackgroundColor3 = Utility.LerpColor(button.BackgroundColor3, Color3.new(0, 0, 0), 0.15)}, 0.1)
    end)

    button.MouseButton1Up:Connect(function()
        Utility.TweenObject(button, {BackgroundColor3 = properties.BackgroundColor3 or Config.Colors.Primary}, 0.1)
    end)

    if properties.Callback then
        button.MouseButton1Click:Connect(properties.Callback)
    end

    return button
end

-- Create toggle
function UILib.CreateToggle(parent, properties)
    local toggleFrame = UILib.CreateFrame(parent, {
        Size = UDim2.new(1, -20, 0, 40),
        Position = properties.Position or UDim2.new(0, 10, 0, 0),
        BackgroundColor3 = Config.Colors.BackgroundLight,
        CornerRadius = 6,
        Name = properties.Name or "Toggle",
    })

    local label = UILib.CreateLabel(toggleFrame, {
        Text = properties.Title or "Toggle",
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(1, -60, 1, 0),
        TextSize = 13,
    })

    local toggleButton = UILib.CreateFrame(toggleFrame, {
        Size = UDim2.new(0, 40, 0, 20),
        Position = UDim2.new(1, -50, 0.5, -10),
        BackgroundColor3 = Config.Colors.SecondaryDark,
        CornerRadius = 10,
        Name = "ToggleButton",
    })

    local toggleCircle = UILib.CreateFrame(toggleButton, {
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(0, 2, 0.5, -8),
        BackgroundColor3 = Config.Colors.TextPrimary,
        CornerRadius = 8,
        Name = "Circle",
    })

    local state = properties.Default or false

    local function updateVisual()
        if state then
            Utility.TweenObject(toggleCircle, {Position = UDim2.new(1, -18, 0.5, -8)}, 0.2)
            Utility.TweenObject(toggleButton, {BackgroundColor3 = Config.Colors.Primary}, 0.2)
        else
            Utility.TweenObject(toggleCircle, {Position = UDim2.new(0, 2, 0.5, -8)}, 0.2)
            Utility.TweenObject(toggleButton, {BackgroundColor3 = Config.Colors.SecondaryDark}, 0.2)
        end
    end

    updateVisual()

    toggleFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            state = not state
            updateVisual()
            if properties.Flag then
                UILib.Flags[properties.Flag] = state
            end
            if properties.Callback then
                Utility.SafeCall(properties.Callback, state)
            end
        end
    end)

    if properties.Flag then
        UILib.Flags[properties.Flag] = state
    end

    return {
        Frame = toggleFrame,
        Set = function(newState)
            state = newState
            updateVisual()
            if properties.Flag then UILib.Flags[properties.Flag] = state end
            if properties.Callback then Utility.SafeCall(properties.Callback, state) end
        end,
        Get = function() return state end,
    }
end

-- Create slider
function UILib.CreateSlider(parent, properties)
    local sliderFrame = UILib.CreateFrame(parent, {
        Size = UDim2.new(1, -20, 0, 55),
        Position = properties.Position or UDim2.new(0, 10, 0, 0),
        BackgroundColor3 = Config.Colors.BackgroundLight,
        CornerRadius = 6,
        Name = properties.Name or "Slider",
    })

    local titleLabel = UILib.CreateLabel(sliderFrame, {
        Text = properties.Title or "Slider",
        Position = UDim2.new(0, 10, 0, 5),
        Size = UDim2.new(0.5, -10, 0, 20),
        TextSize = 13,
    })

    local valueLabel = UILib.CreateLabel(sliderFrame, {
        Text = tostring(properties.Default or properties.Min or 0),
        Position = UDim2.new(0.5, 0, 0, 5),
        Size = UDim2.new(0.5, -10, 0, 20),
        TextXAlignment = Enum.TextXAlignment.Right,
        TextSize = 13,
        TextColor3 = Config.Colors.Primary,
    })

    local sliderBG = UILib.CreateFrame(sliderFrame, {
        Size = UDim2.new(1, -20, 0, 6),
        Position = UDim2.new(0, 10, 0, 38),
        BackgroundColor3 = Config.Colors.SecondaryDark,
        CornerRadius = 3,
    })

    local sliderFill = UILib.CreateFrame(sliderBG, {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = Config.Colors.Primary,
        CornerRadius = 3,
    })

    local sliderKnob = UILib.CreateFrame(sliderBG, {
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(0, -7, 0.5, -7),
        BackgroundColor3 = Config.Colors.TextPrimary,
        CornerRadius = 7,
        ZIndex = 2,
    })

    local min = properties.Min or 0
    local max = properties.Max or 100
    local step = properties.Step or 1
    local value = properties.Default or min
    local dragging = false

    local function updateSlider(newValue)
        value = math.clamp(newValue, min, max)
        value = math.floor(value / step + 0.5) * step
        value = Utility.Round(value, 2)

        local percent = (value - min) / (max - min)
        Utility.TweenObject(sliderFill, {Size = UDim2.new(percent, 0, 1, 0)}, 0.1)
        Utility.TweenObject(sliderKnob, {Position = UDim2.new(percent, -7, 0.5, -7)}, 0.1)
        valueLabel.Text = tostring(value)

        if properties.Flag then UILib.Flags[properties.Flag] = value end
        if properties.Callback then Utility.SafeCall(properties.Callback, value) end
    end

    updateSlider(value)

    sliderBG.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)

    Services.UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    Services.UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local absPos = sliderBG.AbsolutePosition
            local absSize = sliderBG.AbsoluteSize
            local mousePos = Services.UserInputService:GetMouseLocation()
            local percent = math.clamp((mousePos.X - absPos.X) / absSize.X, 0, 1)
            updateSlider(min + (max - min) * percent)
        end
    end)

    return {
        Frame = sliderFrame,
        Set = function(newValue) updateSlider(newValue) end,
        Get = function() return value end,
    }
end

-- Create dropdown
function UILib.CreateDropdown(parent, properties)
    local dropdownFrame = UILib.CreateFrame(parent, {
        Size = UDim2.new(1, -20, 0, 40),
        Position = properties.Position or UDim2.new(0, 10, 0, 0),
        BackgroundColor3 = Config.Colors.BackgroundLight,
        CornerRadius = 6,
        ClipsDescendants = true,
        Name = properties.Name or "Dropdown",
    })

    local titleLabel = UILib.CreateLabel(dropdownFrame, {
        Text = properties.Title or "Dropdown",
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(0.5, -10, 0, 40),
        TextSize = 13,
    })

    local selectedLabel = UILib.CreateLabel(dropdownFrame, {
        Text = properties.Default or (properties.Values and properties.Values[1]) or "Select...",
        Position = UDim2.new(0.5, 0, 0, 0),
        Size = UDim2.new(0.5, -30, 0, 40),
        TextXAlignment = Enum.TextXAlignment.Right,
        TextSize = 13,
        TextColor3 = Config.Colors.Primary,
    })

    local arrowLabel = UILib.CreateLabel(dropdownFrame, {
        Text = "▼",
        Position = UDim2.new(1, -25, 0, 0),
        Size = UDim2.new(0, 20, 0, 40),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextSize = 10,
        TextColor3 = Config.Colors.TextMuted,
    })

    local optionsContainer = UILib.CreateFrame(dropdownFrame, {
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundColor3 = Config.Colors.BackgroundDark,
        Name = "Options",
    })

    local optionsLayout = Instance.new("UIListLayout")
    optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    optionsLayout.Padding = UDim.new(0, 2)
    optionsLayout.Parent = optionsContainer

    local isOpen = false
    local selectedValue = properties.Default or (properties.Values and properties.Values[1]) or ""

    local function createOption(optionText)
        local optionButton = UILib.CreateButton(optionsContainer, {
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = Config.Colors.BackgroundDark,
            Text = optionText,
            TextSize = 12,
            CornerRadius = 4,
        })

        optionButton.MouseButton1Click:Connect(function()
            selectedValue = optionText
            selectedLabel.Text = optionText
            isOpen = false
            local totalHeight = #properties.Values * 32
            Utility.TweenObject(dropdownFrame, {Size = UDim2.new(1, -20, 0, 40)}, 0.2)
            Utility.TweenObject(optionsContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
            arrowLabel.Text = "▼"
            if properties.Flag then UILib.Flags[properties.Flag] = selectedValue end
            if properties.Callback then Utility.SafeCall(properties.Callback, selectedValue) end
        end)

        return optionButton
    end

    if properties.Values then
        for _, val in ipairs(properties.Values) do
            createOption(tostring(val))
        end
    end

    dropdownFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isOpen = not isOpen
            if isOpen then
                local totalHeight = #properties.Values * 32
                Utility.TweenObject(dropdownFrame, {Size = UDim2.new(1, -20, 0, 40 + totalHeight)}, 0.2)
                Utility.TweenObject(optionsContainer, {Size = UDim2.new(1, 0, 0, totalHeight)}, 0.2)
                arrowLabel.Text = "▲"
            else
                Utility.TweenObject(dropdownFrame, {Size = UDim2.new(1, -20, 0, 40)}, 0.2)
                Utility.TweenObject(optionsContainer, {Size = UDim2.new(1, 0, 0, 0)}, 0.2)
                arrowLabel.Text = "▼"
            end
        end
    end)

    if properties.Flag then UILib.Flags[properties.Flag] = selectedValue end

    return {
        Frame = dropdownFrame,
        Set = function(val) selectedValue = val; selectedLabel.Text = val; if properties.Flag then UILib.Flags[properties.Flag] = val end end,
        Get = function() return selectedValue end,
        Refresh = function(newValues)
            for _, child in ipairs(optionsContainer:GetChildren()) do
                if child:IsA("TextButton") then child:Destroy() end
            end
            properties.Values = newValues
            for _, val in ipairs(newValues) do createOption(tostring(val)) end
        end,
    }
end

-- Create input
function UILib.CreateInput(parent, properties)
    local inputFrame = UILib.CreateFrame(parent, {
        Size = UDim2.new(1, -20, 0, 40),
        Position = properties.Position or UDim2.new(0, 10, 0, 0),
        BackgroundColor3 = Config.Colors.BackgroundLight,
        CornerRadius = 6,
        Name = properties.Name or "Input",
    })

    local label = UILib.CreateLabel(inputFrame, {
        Text = properties.Title or "Input",
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(0.4, -10, 1, 0),
        TextSize = 13,
    })

    local textBox = Instance.new("TextBox")
    textBox.BackgroundColor3 = Config.Colors.SecondaryDark
    textBox.BorderSizePixel = 0
    textBox.Size = UDim2.new(0.6, -10, 0, 28)
    textBox.Position = UDim2.new(0.4, 0, 0.5, -14)
    textBox.Text = properties.Default or ""
    textBox.PlaceholderText = properties.Placeholder or "Type here..."
    textBox.PlaceholderColor3 = Config.Colors.TextMuted
    textBox.TextColor3 = Config.Colors.TextPrimary
    textBox.TextSize = 13
    textBox.Font = Enum.Font.Gotham
    textBox.ClearTextOnFocus = properties.ClearOnFocus or false
    textBox.Parent = inputFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = textBox

    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 8)
    padding.PaddingRight = UDim.new(0, 8)
    padding.Parent = textBox

    textBox.FocusLost:Connect(function(enterPressed)
        if properties.Flag then UILib.Flags[properties.Flag] = textBox.Text end
        if properties.Callback then Utility.SafeCall(properties.Callback, textBox.Text, enterPressed) end
    end)

    if properties.Flag then UILib.Flags[properties.Flag] = properties.Default or "" end

    return {
        Frame = inputFrame,
        TextBox = textBox,
        Set = function(val) textBox.Text = val; if properties.Flag then UILib.Flags[properties.Flag] = val end end,
        Get = function() return textBox.Text end,
    }
end

-- Create keybind
function UILib.CreateKeybind(parent, properties)
    local keybindFrame = UILib.CreateFrame(parent, {
        Size = UDim2.new(1, -20, 0, 40),
        Position = properties.Position or UDim2.new(0, 10, 0, 0),
        BackgroundColor3 = Config.Colors.BackgroundLight,
        CornerRadius = 6,
        Name = properties.Name or "Keybind",
    })

    local label = UILib.CreateLabel(keybindFrame, {
        Text = properties.Title or "Keybind",
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(0.6, -10, 1, 0),
        TextSize = 13,
    })

    local currentKey = properties.Default or Enum.KeyCode.Unknown
    local listening = false

    local keyButton = UILib.CreateButton(keybindFrame, {
        Size = UDim2.new(0, 80, 0, 26),
        Position = UDim2.new(1, -90, 0.5, -13),
        BackgroundColor3 = Config.Colors.SecondaryDark,
        Text = currentKey.Name or "None",
        TextSize = 12,
        CornerRadius = 4,
        Callback = function()
            listening = true
            keyButton.Text = "..."
        end,
    })

    Services.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if listening then
            if input.UserInputType == Enum.UserInputType.Keyboard then
                currentKey = input.KeyCode
                keyButton.Text = currentKey.Name
                listening = false
                if properties.Flag then UILib.Flags[properties.Flag] = currentKey end
                if properties.Callback then Utility.SafeCall(properties.Callback, currentKey) end
            end
        elseif input.KeyCode == currentKey and not gameProcessed then
            if properties.OnPress then Utility.SafeCall(properties.OnPress) end
        end
    end)

    return {
        Frame = keybindFrame,
        Set = function(key) currentKey = key; keyButton.Text = key.Name end,
        Get = function() return currentKey end,
    }
end

-- Create color picker
function UILib.CreateColorPicker(parent, properties)
    local pickerFrame = UILib.CreateFrame(parent, {
        Size = UDim2.new(1, -20, 0, 40),
        Position = properties.Position or UDim2.new(0, 10, 0, 0),
        BackgroundColor3 = Config.Colors.BackgroundLight,
        CornerRadius = 6,
        Name = properties.Name or "ColorPicker",
    })

    local label = UILib.CreateLabel(pickerFrame, {
        Text = properties.Title or "Color",
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(0.6, -10, 1, 0),
        TextSize = 13,
    })

    local currentColor = properties.Default or Color3.fromRGB(255, 0, 0)

    local colorPreview = UILib.CreateFrame(pickerFrame, {
        Size = UDim2.new(0, 26, 0, 26),
        Position = UDim2.new(1, -36, 0.5, -13),
        BackgroundColor3 = currentColor,
        CornerRadius = 4,
        Stroke = {Color = Config.Colors.TextMuted, Thickness = 1},
    })

    return {
        Frame = pickerFrame,
        Set = function(color) currentColor = color; colorPreview.BackgroundColor3 = color; if properties.Callback then Utility.SafeCall(properties.Callback, color) end end,
        Get = function() return currentColor end,
    }
end

-- ============================================================================
-- SECTION 8: NOTIFICATION SYSTEM
-- ============================================================================

local NotificationSystem = {}
NotificationSystem.Active = {}
NotificationSystem.Queue = {}
NotificationSystem.MaxVisible = 5
NotificationSystem.Container = nil

function NotificationSystem.Initialize()
    if not UILib.ScreenGui then UILib.Initialize() end

    local container = UILib.CreateFrame(UILib.ScreenGui, {
        Size = UDim2.new(0, 320, 1, -40),
        Position = UDim2.new(1, -330, 0, 20),
        BackgroundTransparency = 1,
        Name = "NotificationContainer",
    })

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.Parent = container

    NotificationSystem.Container = container
end

function NotificationSystem.Notify(options)
    if not NotificationSystem.Container then NotificationSystem.Initialize() end

    local title = options.Title or "Notification"
    local content = options.Content or ""
    local duration = options.Duration or Config.Hub.NotificationDuration
    local notifType = options.Type or "Info" -- Info, Success, Warning, Error
    local icon = options.Icon or ""

    local typeColors = {
        Info = Config.Colors.Info,
        Success = Config.Colors.Success,
        Warning = Config.Colors.Warning,
        Error = Config.Colors.Error,
    }

    local accentColor = typeColors[notifType] or Config.Colors.Info

    -- Create notification frame
    local notifFrame = UILib.CreateFrame(NotificationSystem.Container, {
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = Config.Colors.BackgroundDark,
        CornerRadius = 8,
        ClipsDescendants = true,
        Shadow = true,
    })

    -- Accent line
    local accentLine = UILib.CreateFrame(notifFrame, {
        Size = UDim2.new(0, 4, 1, 0),
        BackgroundColor3 = accentColor,
    })

    -- Title
    local titleLabel = UILib.CreateLabel(notifFrame, {
        Text = title,
        Position = UDim2.new(0, 14, 0, 8),
        Size = UDim2.new(1, -50, 0, 20),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
    })

    -- Content
    local contentLabel = UILib.CreateLabel(notifFrame, {
        Text = content,
        Position = UDim2.new(0, 14, 0, 30),
        Size = UDim2.new(1, -24, 0, 32),
        TextSize = 12,
        TextColor3 = Config.Colors.TextSecondary,
        TextWrapped = true,
        TextYAlignment = Enum.TextYAlignment.Top,
    })

    -- Progress bar
    local progressBG = UILib.CreateFrame(notifFrame, {
        Size = UDim2.new(1, 0, 0, 3),
        Position = UDim2.new(0, 0, 1, -3),
        BackgroundColor3 = Config.Colors.BackgroundLighter,
    })

    local progressFill = UILib.CreateFrame(progressBG, {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = accentColor,
    })

    -- Slide in animation
    notifFrame.Position = UDim2.new(1, 50, 0, 0)
    Utility.TweenObject(notifFrame, {Position = UDim2.new(0, 0, 0, 0)}, 0.3, Enum.EasingStyle.Back)

    -- Progress animation
    Utility.TweenObject(progressFill, {Size = UDim2.new(0, 0, 1, 0)}, duration, Enum.EasingStyle.Linear)

    -- Auto remove
    task.delay(duration, function()
        Utility.TweenObject(notifFrame, {Position = UDim2.new(1, 50, 0, 0), BackgroundTransparency = 1}, 0.3)
        task.wait(0.35)
        pcall(function() notifFrame:Destroy() end)
    end)

    table.insert(NotificationSystem.Active, notifFrame)
    return notifFrame
end

-- Shortcut functions
function NotificationSystem.Info(title, content, duration)
    return NotificationSystem.Notify({Title = title, Content = content, Duration = duration, Type = "Info"})
end

function NotificationSystem.Success(title, content, duration)
    return NotificationSystem.Notify({Title = title, Content = content, Duration = duration, Type = "Success"})
end

function NotificationSystem.Warning(title, content, duration)
    return NotificationSystem.Notify({Title = title, Content = content, Duration = duration, Type = "Warning"})
end

function NotificationSystem.Error(title, content, duration)
    return NotificationSystem.Notify({Title = title, Content = content, Duration = duration, Type = "Error"})
end

-- ============================================================================
-- SECTION 9: ESP SYSTEM
-- ============================================================================

local ESPSystem = {}
ESPSystem.Objects = {}
ESPSystem.Connections = {}
ESPSystem.Running = false

function ESPSystem.CreatePlayerESP(player)
    if player == LocalPlayer and not Config.Features.ESP.ShowSelf then return end
    if ESPSystem.Objects[player] then ESPSystem.RemovePlayerESP(player) end

    local objects = {
        Highlight = nil,
        Box = {TopLeft = nil, TopRight = nil, BottomLeft = nil, BottomRight = nil, Top = nil, Bottom = nil, Left = nil, Right = nil},
        Tracer = nil,
        Name = nil,
        Health = nil,
        HealthBar = nil,
        HealthBarBG = nil,
        Distance = nil,
        Role = nil,
        Weapon = nil,
    }

    -- Highlight
    if Config.Features.ESP.Highlight then
        objects.Highlight = Instance.new("Highlight")
        objects.Highlight.Name = "NonsenseXESP"
        objects.Highlight.FillTransparency = Config.Features.ESP.HighlightTransparency
        objects.Highlight.OutlineTransparency = 0.3
        objects.Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end

    -- Box ESP
    if Config.Features.ESP.Box then
        for corner, _ in pairs(objects.Box) do
            objects.Box[corner] = DrawingLib.CreateLine(nil, nil, Config.Colors.TextPrimary, Config.Features.ESP.BoxThickness, false)
        end
    end

    -- Tracer
    if Config.Features.ESP.Tracer then
        objects.Tracer = DrawingLib.CreateLine(nil, nil, Config.Colors.TextPrimary, Config.Features.ESP.TracerThickness, false)
    end

    -- Name
    if Config.Features.ESP.Name then
        objects.Name = DrawingLib.CreateText(nil, "", Config.Colors.TextPrimary, Config.Features.ESP.TextSize, true, Config.Features.ESP.TextOutline, false)
    end

    -- Health
    if Config.Features.ESP.Health then
        objects.Health = DrawingLib.CreateText(nil, "", Config.Colors.Success, Config.Features.ESP.TextSize - 2, true, Config.Features.ESP.TextOutline, false)
    end

    -- Health Bar
    objects.HealthBarBG = DrawingLib.CreateLine(nil, nil, Color3.fromRGB(40, 40, 40), 4, false)
    objects.HealthBar = DrawingLib.CreateLine(nil, nil, Config.Colors.Success, 2, false)

    -- Distance
    if Config.Features.ESP.Distance then
        objects.Distance = DrawingLib.CreateText(nil, "", Config.Colors.TextSecondary, Config.Features.ESP.TextSize - 2, true, Config.Features.ESP.TextOutline, false)
    end

    -- Role
    if Config.Features.ESP.Role then
        objects.Role = DrawingLib.CreateText(nil, "", Config.Colors.TextSecondary, Config.Features.ESP.TextSize - 1, true, Config.Features.ESP.TextOutline, false)
    end

    -- Weapon
    if Config.Features.ESP.Weapon then
        objects.Weapon = DrawingLib.CreateText(nil, "", Config.Colors.Warning, Config.Features.ESP.TextSize - 2, true, Config.Features.ESP.TextOutline, false)
    end

    ESPSystem.Objects[player] = objects
end

function ESPSystem.RemovePlayerESP(player)
    local objects = ESPSystem.Objects[player]
    if not objects then return end

    if objects.Highlight then
        pcall(function() objects.Highlight:Destroy() end)
    end

    for _, v in pairs(objects.Box) do
        DrawingLib.Remove(v)
    end

    DrawingLib.Remove(objects.Tracer)
    DrawingLib.Remove(objects.Name)
    DrawingLib.Remove(objects.Health)
    DrawingLib.Remove(objects.HealthBar)
    DrawingLib.Remove(objects.HealthBarBG)
    DrawingLib.Remove(objects.Distance)
    DrawingLib.Remove(objects.Role)
    DrawingLib.Remove(objects.Weapon)

    ESPSystem.Objects[player] = nil
end

function ESPSystem.GetRoleColor(player)
    local role = ESPSystem.GetRole(player)
    if role == "Murderer" then return Config.Colors.Murderer
    elseif role == "Sheriff" then return Config.Colors.Sheriff
    elseif role == "Hero" then return Config.Colors.Hero
    else return Config.Colors.Innocent end
end

function ESPSystem.GetRole(player)
    local char = player and player.Character
    if not char then return "Unknown" end
    local backpack = player:FindFirstChild("Backpack")

    if (char:FindFirstChild("Knife") or (backpack and backpack:FindFirstChild("Knife"))) then
        return "Murderer"
    elseif (char:FindFirstChild("Gun") or (backpack and backpack:FindFirstChild("Gun"))) then
        return "Sheriff"
    end
    return "Innocent"
end

function ESPSystem.ShouldShow(player)
    if not Config.Features.ESP.Enabled then return false end
    if player == LocalPlayer and not Config.Features.ESP.ShowSelf then return false end
    if not Utility.IsAlive(player) then return false end

    local filter = Config.Features.ESP.Filter
    if filter == "All" then return true end

    local role = ESPSystem.GetRole(player)
    if filter == "Murderer" and role == "Murderer" then return true end
    if filter == "Sheriff" and role == "Sheriff" then return true end
    if filter == "Innocent" and role == "Innocent" then return true end

    return false
end

function ESPSystem.UpdatePlayerESP(player)
    local objects = ESPSystem.Objects[player]
    if not objects then return end

    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local head = char and char:FindFirstChild("Head")

    local shouldShow = ESPSystem.ShouldShow(player)

    if not shouldShow or not hrp or not hum or hum.Health <= 0 then
        -- Hide all
        if objects.Highlight and objects.Highlight.Parent then
            objects.Highlight.Parent = nil
        end
        for _, v in pairs(objects.Box) do if v then v.Visible = false end end
        if objects.Tracer then objects.Tracer.Visible = false end
        if objects.Name then objects.Name.Visible = false end
        if objects.Health then objects.Health.Visible = false end
        if objects.HealthBar then objects.HealthBar.Visible = false end
        if objects.HealthBarBG then objects.HealthBarBG.Visible = false end
        if objects.Distance then objects.Distance.Visible = false end
        if objects.Role then objects.Role.Visible = false end
        if objects.Weapon then objects.Weapon.Visible = false end
        return
    end

    local color = Config.Features.ESP.RainbowMode and Utility.GetRainbowColor(2) or ESPSystem.GetRoleColor(player)
    local role = ESPSystem.GetRole(player)
    local distance = Utility.GetHRP(LocalPlayer) and Utility.GetDistance(hrp.Position, Utility.GetHRP(LocalPlayer).Position) or 0

    if distance > Config.Features.ESP.MaxDistance then
        -- Too far, hide
        if objects.Highlight and objects.Highlight.Parent then objects.Highlight.Parent = nil end
        for _, v in pairs(objects.Box) do if v then v.Visible = false end end
        if objects.Tracer then objects.Tracer.Visible = false end
        if objects.Name then objects.Name.Visible = false end
        if objects.Health then objects.Health.Visible = false end
        if objects.HealthBar then objects.HealthBar.Visible = false end
        if objects.HealthBarBG then objects.HealthBarBG.Visible = false end
        if objects.Distance then objects.Distance.Visible = false end
        if objects.Role then objects.Role.Visible = false end
        if objects.Weapon then objects.Weapon.Visible = false end
        return
    end

    -- Update highlight
    if objects.Highlight then
        objects.Highlight.FillColor = color
        objects.Highlight.OutlineColor = color
        objects.Highlight.Adornee = char
        if not objects.Highlight.Parent then
            objects.Highlight.Parent = char
        end
    end

    -- Screen position
    local screenPos, onScreen = Utility.WorldToScreen(head and head.Position + Vector3.new(0, 2.5, 0) or hrp.Position + Vector3.new(0, 3, 0))

    if onScreen then
        -- Name
        if objects.Name then
            objects.Name.Visible = true
            objects.Name.Text = player.DisplayName .. " [" .. player.Name .. "]"
            objects.Name.Color = color
            objects.Name.Position = screenPos + Vector2.new(0, -25)
        end

        -- Role
        if objects.Role then
            objects.Role.Visible = true
            objects.Role.Text = "[" .. role .. "]"
            objects.Role.Color = color
            objects.Role.Position = screenPos + Vector2.new(0, -12)
        end

        -- Health
        if objects.Health then
            objects.Health.Visible = true
            local healthPercent = math.floor((hum.Health / hum.MaxHealth) * 100)
            objects.Health.Text = tostring(math.floor(hum.Health)) .. "/" .. tostring(math.floor(hum.MaxHealth)) .. " (" .. healthPercent .. "%)"
            objects.Health.Color = Utility.LerpColor(Config.Colors.Error, Config.Colors.Success, hum.Health / hum.MaxHealth)
            objects.Health.Position = screenPos + Vector2.new(0, 2)
        end

        -- Distance
        if objects.Distance then
            objects.Distance.Visible = true
            objects.Distance.Text = "[" .. Utility.FormatNumber(math.floor(distance)) .. " studs]"
            objects.Distance.Position = screenPos + Vector2.new(0, 16)
        end

        -- Tracer
        if objects.Tracer then
            objects.Tracer.Visible = true
            objects.Tracer.Color = color
            objects.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
            objects.Tracer.To = screenPos
        end
    else
        if objects.Name then objects.Name.Visible = false end
        if objects.Role then objects.Role.Visible = false end
        if objects.Health then objects.Health.Visible = false end
        if objects.Distance then objects.Distance.Visible = false end
        if objects.Tracer then objects.Tracer.Visible = false end
        if objects.HealthBar then objects.HealthBar.Visible = false end
        if objects.HealthBarBG then objects.HealthBarBG.Visible = false end
    end
end

function ESPSystem.Start()
    if ESPSystem.Running then return end
    ESPSystem.Running = true

    -- Create ESP for existing players
    for _, player in ipairs(Services.Players:GetPlayers()) do
        if player ~= LocalPlayer then
            ESPSystem.CreatePlayerESP(player)
        end
    end

    -- Handle new players
    table.insert(ESPSystem.Connections, Services.Players.PlayerAdded:Connect(function(player)
        ESPSystem.CreatePlayerESP(player)
    end))

    -- Handle leaving players
    table.insert(ESPSystem.Connections, Services.Players.PlayerRemoving:Connect(function(player)
        ESPSystem.RemovePlayerESP(player)
    end))

    -- Update loop
    table.insert(ESPSystem.Connections, Services.RunService.RenderStepped:Connect(function()
        if not Config.Features.ESP.Enabled then return end
        for _, player in ipairs(Services.Players:GetPlayers()) do
            if ESPSystem.Objects[player] then
                ESPSystem.UpdatePlayerESP(player)
            end
        end
    end))
end

function ESPSystem.Stop()
    ESPSystem.Running = false
    for _, conn in ipairs(ESPSystem.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    ESPSystem.Connections = {}
    for player, _ in pairs(ESPSystem.Objects) do
        ESPSystem.RemovePlayerESP(player)
    end
end

-- ============================================================================
-- SECTION 10: AIMBOT SYSTEM
-- ============================================================================

local AimbotSystem = {}
AimbotSystem.Target = nil
AimbotSystem.FOVCircle = nil
AimbotSystem.Active = false
AimbotSystem.Connections = {}

function AimbotSystem.Initialize()
    AimbotSystem.FOVCircle = DrawingLib.CreateCircle(
        Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2),
        Config.Features.Aimbot.FOV,
        Config.Features.Aimbot.FOVColor,
        Config.Features.Aimbot.FOVThickness,
        false,
        Config.Features.Aimbot.ShowFOV
    )
end

function AimbotSystem.GetClosestTarget()
    local closest = nil
    local closestValue = math.huge

    for _, player in ipairs(Services.Players:GetPlayers()) do
        if player ~= LocalPlayer and Utility.IsAlive(player) then
            local hrp = Utility.GetHRP(player)
            if not hrp then continue end

            local screenPos, onScreen = Utility.WorldToScreen(hrp.Position)
            if not onScreen then continue end

            local distance = Utility.GetDistance(hrp.Position, Camera.CFrame.Position)
            if distance > Config.Features.Aimbot.MaxDistance then continue end

            -- Wall check
            if Config.Features.Aimbot.WallCheck then
                local myHRP = Utility.GetHRP(LocalPlayer)
                if myHRP then
                    local ignoreList = {LocalPlayer.Character, player.Character}
                    if not Utility.IsVisible(myHRP.Position, hrp.Position, ignoreList) then
                        continue
                    end
                end
            end

            -- FOV check
            local mousePos = Services.UserInputService:GetMouseLocation()
            local distFromMouse = (screenPos - mousePos).Magnitude
            if distFromMouse > Config.Features.Aimbot.FOV then continue end

            -- Priority
            local value
            if Config.Features.Aimbot.TargetPriority == "Distance" then
                value = distance
            elseif Config.Features.Aimbot.TargetPriority == "Crosshair" then
                value = distFromMouse
            elseif Config.Features.Aimbot.TargetPriority == "Health" then
                local hum = Utility.GetHumanoid(player)
                value = hum and hum.Health or math.huge
            end

            if value < closestValue then
                closestValue = value
                closest = player
            end
        end
    end

    return closest
end

function AimbotSystem.GetTargetPart(player)
    local char = player and player.Character
    if not char then return nil end

    local partName = Config.Features.Aimbot.TargetPart
    local part = char:FindFirstChild(partName)

    if not part then
        part = char:FindFirstChild("HumanoidRootPart")
    end

    return part
end

function AimbotSystem.AimAt(target)
    if not target then return end

    local targetPart = AimbotSystem.GetTargetPart(target)
    if not targetPart then return end

    local targetPos = targetPart.Position

    -- Prediction
    if Config.Features.Aimbot.Prediction then
        local hrp = Utility.GetHRP(target)
        if hrp then
            targetPos = targetPos + hrp.Velocity * Config.Features.Aimbot.PredictionAmount
        end
    end

    -- Smooth aiming
    local smoothness = Config.Features.Aimbot.Smoothness
    if smoothness <= 1 then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
    else
        local currentLookVector = Camera.CFrame.LookVector
        local targetLookVector = (targetPos - Camera.CFrame.Position).Unit
        local newLookVector = currentLookVector:Lerp(targetLookVector, 1 / smoothness)
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + newLookVector)
    end
end

function AimbotSystem.Start()
    if AimbotSystem.Active then return end
    AimbotSystem.Active = true

    if not AimbotSystem.FOVCircle then AimbotSystem.Initialize() end

    table.insert(AimbotSystem.Connections, Services.RunService.RenderStepped:Connect(function()
        -- Update FOV circle
        if AimbotSystem.FOVCircle then
            local mousePos = Services.UserInputService:GetMouseLocation()
            AimbotSystem.FOVCircle.Position = mousePos
            AimbotSystem.FOVCircle.Radius = Config.Features.Aimbot.FOV
            AimbotSystem.FOVCircle.Visible = Config.Features.Aimbot.ShowFOV and Config.Features.Aimbot.Enabled
            AimbotSystem.FOVCircle.Color = Config.Features.Aimbot.FOVColor
        end

        if not Config.Features.Aimbot.Enabled then return end

        -- Check if aim key is held
        local aimKeyHeld = false
        if Config.Features.Aimbot.AimKey == Enum.UserInputType.MouseButton2 then
            aimKeyHeld = Services.UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        elseif typeof(Config.Features.Aimbot.AimKey) == "EnumItem" then
            aimKeyHeld = Services.UserInputService:IsKeyDown(Config.Features.Aimbot.AimKey)
        end

        if aimKeyHeld or Config.Features.Aimbot.StickyAim then
            local target = AimbotSystem.GetClosestTarget()
            if target then
                AimbotSystem.Target = target
                AimbotSystem.AimAt(target)
            end
        else
            AimbotSystem.Target = nil
        end
    end))
end

function AimbotSystem.Stop()
    AimbotSystem.Active = false
    for _, conn in ipairs(AimbotSystem.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    AimbotSystem.Connections = {}
    if AimbotSystem.FOVCircle then
        AimbotSystem.FOVCircle.Visible = false
    end
end

-- ============================================================================
-- SECTION 11: CHARACTER SYSTEM
-- ============================================================================

local CharacterSystem = {}
CharacterSystem.Connections = {}
CharacterSystem.FlyActive = false
CharacterSystem.FlyBody = nil
CharacterSystem.FlyGyro = nil

function CharacterSystem.SetWalkSpeed(speed)
    local hum = Utility.GetHumanoid(LocalPlayer)
    if hum then hum.WalkSpeed = speed end
end

function CharacterSystem.SetJumpPower(power)
    local hum = Utility.GetHumanoid(LocalPlayer)
    if hum then hum.JumpPower = power; hum.UseJumpPower = true end
end

function CharacterSystem.SetGravity(gravity)
    Services.Workspace.Gravity = gravity
end

function CharacterSystem.SetHipHeight(height)
    local hum = Utility.GetHumanoid(LocalPlayer)
    if hum then hum.HipHeight = height end
end

function CharacterSystem.ToggleNoclip(state)
    Config.Features.Character.Noclip = state
end

function CharacterSystem.ToggleInfiniteJump(state)
    Config.Features.Character.InfiniteJump = state
end

function CharacterSystem.ToggleFly(state)
    Config.Features.Character.Fly.Enabled = state
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end

    if state then
        CharacterSystem.FlyActive = true

        if CharacterSystem.FlyBody then CharacterSystem.FlyBody:Destroy() end
        if CharacterSystem.FlyGyro then CharacterSystem.FlyGyro:Destroy() end

        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = hrp
        CharacterSystem.FlyBody = bodyVelocity

        local bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bodyGyro.D = 200
        bodyGyro.P = 10000
        bodyGyro.Parent = hrp
        CharacterSystem.FlyGyro = bodyGyro

        hum.PlatformStand = true

        NotificationSystem.Success("Fly", "Fly mode enabled! Speed: " .. Config.Features.Character.Fly.Speed)
    else
        CharacterSystem.FlyActive = false

        if CharacterSystem.FlyBody then
            CharacterSystem.FlyBody:Destroy()
            CharacterSystem.FlyBody = nil
        end
        if CharacterSystem.FlyGyro then
            CharacterSystem.FlyGyro:Destroy()
            CharacterSystem.FlyGyro = nil
        end

        hum.PlatformStand = false

        NotificationSystem.Info("Fly", "Fly mode disabled")
    end
end

function CharacterSystem.ClickTP(position)
    local hrp = Utility.GetHRP(LocalPlayer)
    if hrp then
        hrp.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
        NotificationSystem.Info("Click TP", "Teleported!")
    end
end

function CharacterSystem.Start()
    -- Noclip loop
    table.insert(CharacterSystem.Connections, Services.RunService.Stepped:Connect(function()
        if Config.Features.Character.Noclip then
            local char = LocalPlayer.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
    end))

    -- Fly update
    table.insert(CharacterSystem.Connections, Services.RunService.RenderStepped:Connect(function()
        if CharacterSystem.FlyActive and CharacterSystem.FlyBody and CharacterSystem.FlyGyro then
            local speed = Config.Features.Character.Fly.Speed
            local moveDirection = Vector3.new(0, 0, 0)

            if Services.UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + Camera.CFrame.LookVector
            end
            if Services.UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - Camera.CFrame.LookVector
            end
            if Services.UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - Camera.CFrame.RightVector
            end
            if Services.UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + Camera.CFrame.RightVector
            end
            if Services.UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end

            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit
            end

            CharacterSystem.FlyBody.Velocity = moveDirection * speed
            CharacterSystem.FlyGyro.CFrame = Camera.CFrame
        end

        -- Character stats lock
        local hum = Utility.GetHumanoid(LocalPlayer)
        if hum then
            if Config.Features.Character.WalkSpeed.Enabled or Config.Features.Character.WalkSpeed.Locked then
                hum.WalkSpeed = Config.Features.Character.WalkSpeed.Value
            end
            if Config.Features.Character.JumpPower.Enabled or Config.Features.Character.JumpPower.Locked then
                hum.JumpPower = Config.Features.Character.JumpPower.Value
                hum.UseJumpPower = true
            end
        end

        if Config.Features.Character.Gravity.Enabled then
            Services.Workspace.Gravity = Config.Features.Character.Gravity.Value
        end
    end))

    -- Infinite Jump
    table.insert(CharacterSystem.Connections, Services.UserInputService.JumpRequest:Connect(function()
        if Config.Features.Character.InfiniteJump then
            local hum = Utility.GetHumanoid(LocalPlayer)
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end))

    -- Click TP
    table.insert(CharacterSystem.Connections, Mouse.Button1Down:Connect(function()
        if Config.Features.Character.ClickTP.Enabled then
            if Services.UserInputService:IsKeyDown(Config.Features.Character.ClickTP.Key) then
                CharacterSystem.ClickTP(Mouse.Hit.Position)
            end
        end
    end))

    -- Fly toggle key
    table.insert(CharacterSystem.Connections, Services.UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Config.Features.Character.Fly.ToggleKey then
            CharacterSystem.ToggleFly(not Config.Features.Character.Fly.Enabled)
        end
        if input.KeyCode == Config.Features.Character.NoClipKey then
            Config.Features.Character.Noclip = not Config.Features.Character.Noclip
            NotificationSystem.Info("Noclip", Config.Features.Character.Noclip and "Enabled" or "Disabled")
        end
    end))

    -- Respawn handler
    table.insert(CharacterSystem.Connections, LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(1)
        if Config.Features.Character.WalkSpeed.Enabled then
            CharacterSystem.SetWalkSpeed(Config.Features.Character.WalkSpeed.Value)
        end
        if Config.Features.Character.JumpPower.Enabled then
            CharacterSystem.SetJumpPower(Config.Features.Character.JumpPower.Value)
        end
        if Config.Features.Character.Fly.Enabled then
            task.wait(0.5)
            CharacterSystem.ToggleFly(true)
        end
    end))
end

function CharacterSystem.Stop()
    for _, conn in ipairs(CharacterSystem.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    CharacterSystem.Connections = {}
    CharacterSystem.ToggleFly(false)
end

-- ============================================================================
-- SECTION 12: VISUAL SYSTEM
-- ============================================================================

local VisualSystem = {}
VisualSystem.Connections = {}
VisualSystem.OriginalLighting = {}
VisualSystem.PostEffects = {}

function VisualSystem.SaveOriginalLighting()
    VisualSystem.OriginalLighting = {
        Ambient = Services.Lighting.Ambient,
        Brightness = Services.Lighting.Brightness,
        ClockTime = Services.Lighting.ClockTime,
        ColorShift_Bottom = Services.Lighting.ColorShift_Bottom,
        ColorShift_Top = Services.Lighting.ColorShift_Top,
        EnvironmentDiffuseScale = Services.Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Services.Lighting.EnvironmentSpecularScale,
        ExposureCompensation = Services.Lighting.ExposureCompensation,
        FogColor = Services.Lighting.FogColor,
        FogEnd = Services.Lighting.FogEnd,
        FogStart = Services.Lighting.FogStart,
        GeographicLatitude = Services.Lighting.GeographicLatitude,
        GlobalShadows = Services.Lighting.GlobalShadows,
        OutdoorAmbient = Services.Lighting.OutdoorAmbient,
        ShadowSoftness = Services.Lighting.ShadowSoftness,
    }
end

function VisualSystem.SetFullbright(state)
    Config.Features.Visual.Fullbright = state
    if state then
        Services.Lighting.Ambient = Color3.fromRGB(200, 200, 200)
        Services.Lighting.Brightness = 2
        Services.Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
        Services.Lighting.GlobalShadows = false
        Services.Lighting.FogEnd = 100000
    else
        if VisualSystem.OriginalLighting.Ambient then
            Services.Lighting.Ambient = VisualSystem.OriginalLighting.Ambient
            Services.Lighting.Brightness = VisualSystem.OriginalLighting.Brightness
            Services.Lighting.OutdoorAmbient = VisualSystem.OriginalLighting.OutdoorAmbient
            Services.Lighting.GlobalShadows = VisualSystem.OriginalLighting.GlobalShadows
            Services.Lighting.FogEnd = VisualSystem.OriginalLighting.FogEnd
        end
    end
end

function VisualSystem.SetNoFog(state)
    Config.Features.Visual.NoFog = state
    if state then
        Services.Lighting.FogEnd = 100000
        Services.Lighting.FogStart = 0
    else
        Services.Lighting.FogEnd = VisualSystem.OriginalLighting.FogEnd or 100000
        Services.Lighting.FogStart = VisualSystem.OriginalLighting.FogStart or 0
    end
end

function VisualSystem.SetTimeOfDay(time)
    Services.Lighting.ClockTime = time
end

function VisualSystem.SetFOV(fov)
    Camera.FieldOfView = fov
end

function VisualSystem.RemoveParticles()
    for _, obj in ipairs(Services.Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
            obj.Enabled = false
        end
    end
end

function VisualSystem.RemoveTextures()
    for _, obj in ipairs(Services.Workspace:GetDescendants()) do
        if obj:IsA("Texture") or obj:IsA("Decal") then
            obj.Transparency = 1
        end
    end
end

function VisualSystem.FPSBoost()
    local settings = settings()
    pcall(function()
        settings.Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)

    for _, obj in ipairs(Services.Workspace:GetDescendants()) do
        pcall(function()
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                obj.Enabled = false
            elseif obj:IsA("MeshPart") then
                obj.TextureID = ""
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Transparency = 1
            elseif obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                obj.Enabled = false
            elseif obj:IsA("PostEffect") then
                obj.Enabled = false
            end
        end)
    end

    Services.Lighting.GlobalShadows = false
    Services.Lighting.FogEnd = 9e9

    sethiddenproperty(Services.Lighting, "Technology", Enum.Technology.Compatibility)

    NotificationSystem.Success("FPS Boost", "Graphics optimized for better performance!")
end

function VisualSystem.CreateCrosshair()
    if not Config.Features.Visual.CustomCrosshair.Enabled then return end

    local cfg = Config.Features.Visual.CustomCrosshair
    local center = Camera.ViewportSize / 2

    local lines = {}
    local directions = {
        {Vector2.new(0, -1), "Top"},
        {Vector2.new(0, 1), "Bottom"},
        {Vector2.new(-1, 0), "Left"},
        {Vector2.new(1, 0), "Right"},
    }

    for _, dir in ipairs(directions) do
        local line = DrawingLib.CreateLine(
            center + dir[1] * cfg.Gap,
            center + dir[1] * (cfg.Gap + cfg.Size),
            cfg.Color,
            cfg.Thickness,
            true
        )
        table.insert(lines, line)
    end

    if cfg.Dot then
        local dot = DrawingLib.CreateCircle(center, cfg.DotSize, cfg.Color, 1, true, true)
        table.insert(lines, dot)
    end

    return lines
end

function VisualSystem.Start()
    VisualSystem.SaveOriginalLighting()

    table.insert(VisualSystem.Connections, Services.RunService.RenderStepped:Connect(function()
        if Config.Features.Visual.FOVChanger.Enabled then
            Camera.FieldOfView = Config.Features.Visual.FOVChanger.Value
        end
    end))
end

function VisualSystem.Stop()
    for _, conn in ipairs(VisualSystem.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    VisualSystem.Connections = {}

    -- Restore lighting
    if VisualSystem.OriginalLighting.Ambient then
        for key, value in pairs(VisualSystem.OriginalLighting) do
            pcall(function() Services.Lighting[key] = value end)
        end
    end
end

-- ============================================================================
-- SECTION 13: ANTI-AFK & UTILITY SYSTEM
-- ============================================================================

local UtilitySystem = {}
UtilitySystem.Connections = {}
UtilitySystem.SessionStartTime = tick()

function UtilitySystem.EnableAntiAFK()
    local vu = game:GetService("VirtualUser")
    table.insert(UtilitySystem.Connections, LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), Camera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0, 0), Camera.CFrame)
    end))
    NotificationSystem.Success("Anti-AFK", "Anti-AFK has been enabled!")
end

function UtilitySystem.EnableAntiKick()
    if hookfunction then
        local oldKick = Instance.new("RemoteEvent").FireServer
        hookfunction(LocalPlayer.Kick, function() return end)
        NotificationSystem.Success("Anti-Kick", "Anti-kick protection enabled!")
    else
        NotificationSystem.Warning("Anti-Kick", "Your executor doesn't support hookfunction")
    end
end

function UtilitySystem.ServerHop()
    local servers = {}
    local req = (syn and syn.request) or (http and http.request) or http_request or request

    if not req then
        NotificationSystem.Error("Server Hop", "HTTP requests not supported!")
        return
    end

    local success, response = pcall(function()
        return req({
            Url = string.format("https://games.roblox.com/v1/games/%d/servers/0?sortOrder=2&excludeFullGames=true&limit=100", game.PlaceId),
            Method = "GET",
        })
    end)

    if success and response and response.Body then
        local body = Services.HttpService:JSONDecode(response.Body)
        if body and body.data then
            for _, server in ipairs(body.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    table.insert(servers, server)
                end
            end
        end
    end

    if #servers > 0 then
        local randomServer = servers[math.random(1, #servers)]
        NotificationSystem.Info("Server Hop", "Joining server with " .. randomServer.playing .. " players...")
        task.wait(1)
        Services.TeleportService:TeleportToPlaceInstance(game.PlaceId, randomServer.id)
    else
        NotificationSystem.Error("Server Hop", "No available servers found!")
    end
end

function UtilitySystem.Rejoin()
    NotificationSystem.Info("Rejoin", "Rejoining server...")
    task.wait(1)
    Services.TeleportService:Teleport(game.PlaceId)
end

function UtilitySystem.GetSessionTime()
    return tick() - UtilitySystem.SessionStartTime
end

function UtilitySystem.GetPing()
    local ping = 0
    pcall(function()
        ping = LocalPlayer:GetNetworkPing() * 1000
    end)
    return math.floor(ping)
end

function UtilitySystem.GetFPS()
    local fps = 0
    pcall(function()
        fps = math.floor(1 / Services.RunService.RenderStepped:Wait())
    end)
    return fps
end

function UtilitySystem.Start()
    if Config.Features.Utility.AntiAFK then
        UtilitySystem.EnableAntiAFK()
    end
end

-- ============================================================================
-- SECTION 14: TELEPORT SYSTEM
-- ============================================================================

local TeleportSystem = {}
TeleportSystem.SavedPositions = {}
TeleportSystem.History = {}

function TeleportSystem.TeleportToPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then
        NotificationSystem.Error("Teleport", "Target player not found!")
        return false
    end

    local targetHRP = Utility.GetHRP(targetPlayer)
    local myHRP = Utility.GetHRP(LocalPlayer)

    if not targetHRP or not myHRP then
        NotificationSystem.Error("Teleport", "Cannot teleport!")
        return false
    end

    local method = Config.Features.Teleport.TPMethod

    if method == "Instant" then
        myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
    elseif method == "Tween" then
        local distance = Utility.GetDistance(myHRP.Position, targetHRP.Position)
        local duration = distance / Config.Features.Teleport.TweenSpeed
        local tween = Services.TweenService:Create(myHRP, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)})
        tween:Play()
        tween.Completed:Wait()
    elseif method == "Lerp" then
        local startCFrame = myHRP.CFrame
        local endCFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
        for i = 0, 1, 0.02 do
            myHRP.CFrame = startCFrame:Lerp(endCFrame, i)
            task.wait()
        end
    end

    -- Add to history
    table.insert(TeleportSystem.History, 1, {
        Player = targetPlayer.Name,
        Time = Utility.GetTimestamp(),
        Position = targetHRP.Position,
    })

    -- Keep history limited
    if #TeleportSystem.History > Config.Features.Teleport.MaxHistory then
        table.remove(TeleportSystem.History)
    end

    NotificationSystem.Success("Teleport", "Teleported to " .. targetPlayer.DisplayName)
    return true
end

function TeleportSystem.TeleportToPosition(position)
    local myHRP = Utility.GetHRP(LocalPlayer)
    if not myHRP then return false end

    myHRP.CFrame = CFrame.new(position)
    NotificationSystem.Success("Teleport", "Teleported to position!")
    return true
end

function TeleportSystem.SavePosition(name)
    local myHRP = Utility.GetHRP(LocalPlayer)
    if not myHRP then return false end

    TeleportSystem.SavedPositions[name] = {
        Position = myHRP.CFrame,
        Time = Utility.GetTimestamp(),
    }

    NotificationSystem.Success("Position Saved", "Saved position '" .. name .. "'")
    return true
end

function TeleportSystem.LoadPosition(name)
    local saved = TeleportSystem.SavedPositions[name]
    if not saved then
        NotificationSystem.Error("Teleport", "Position '" .. name .. "' not found!")
        return false
    end

    local myHRP = Utility.GetHRP(LocalPlayer)
    if not myHRP then return false end

    myHRP.CFrame = saved.Position
    NotificationSystem.Success("Teleport", "Loaded position '" .. name .. "'")
    return true
end

function TeleportSystem.TeleportToRole(role)
    for _, player in ipairs(Services.Players:GetPlayers()) do
        if player ~= LocalPlayer and Utility.IsAlive(player) then
            local playerRole = ESPSystem.GetRole(player)
            if playerRole == role then
                return TeleportSystem.TeleportToPlayer(player)
            end
        end
    end
    NotificationSystem.Error("Teleport", "No " .. role .. " found!")
    return false
end

function TeleportSystem.GetPlayerList()
    local list = {}
    for _, player in ipairs(Services.Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(list, player.Name)
        end
    end
    return list
end

-- ============================================================================
-- SECTION 15: COMBAT SYSTEM
-- ============================================================================

local CombatSystem = {}
CombatSystem.Connections = {}
CombatSystem.KillAllActive = false

function CombatSystem.GetNearestTarget()
    local nearest = nil
    local nearestDist = math.huge
    local myHRP = Utility.GetHRP(LocalPlayer)
    if not myHRP then return nil end

    for _, player in ipairs(Services.Players:GetPlayers()) do
        if player ~= LocalPlayer and Utility.IsAlive(player) then
            local hrp = Utility.GetHRP(player)
            if hrp then
                local dist = Utility.GetDistance(myHRP.Position, hrp.Position)
                if dist < nearestDist then
                    nearestDist = dist
                    nearest = player
                end
            end
        end
    end

    return nearest, nearestDist
end

function CombatSystem.ExpandHitbox(size)
    for _, player in ipairs(Services.Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Size = Vector3.new(size, size, size)
                hrp.Transparency = 0.7
                hrp.CanCollide = false
            end
        end
    end
end

function CombatSystem.ResetHitbox()
    for _, player in ipairs(Services.Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Size = Vector3.new(2, 2, 1)
                hrp.Transparency = 1
            end
        end
    end
end

function CombatSystem.Start()
    -- Hitbox expander loop
    table.insert(CombatSystem.Connections, Services.RunService.Heartbeat:Connect(function()
        if Config.Features.Combat.HitboxExpander.Enabled then
            CombatSystem.ExpandHitbox(Config.Features.Combat.HitboxExpander.Size)
        end
    end))
end

function CombatSystem.Stop()
    CombatSystem.KillAllActive = false
    CombatSystem.ResetHitbox()
    for _, conn in ipairs(CombatSystem.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    CombatSystem.Connections = {}
end

-- ============================================================================
-- SECTION 16: WATERMARK & HUD SYSTEM
-- ============================================================================

local HUDSystem = {}
HUDSystem.Objects = {}
HUDSystem.Connections = {}

function HUDSystem.CreateWatermark()
    local watermark = DrawingLib.CreateText(
        Vector2.new(10, 5),
        Config.Hub.Name .. " v" .. Config.Hub.Version,
        Config.Colors.Primary,
        16,
        false,
        true,
        true
    )
    watermark.Font = Drawing.Fonts.Plex
    HUDSystem.Objects.Watermark = watermark

    -- FPS Counter
    local fpsText = DrawingLib.CreateText(
        Vector2.new(10, 25),
        "FPS: 60",
        Config.Colors.Accent,
        13,
        false,
        true,
        true
    )
    HUDSystem.Objects.FPS = fpsText

    -- Ping Display
    local pingText = DrawingLib.CreateText(
        Vector2.new(10, 40),
        "Ping: 0ms",
        Config.Colors.Success,
        13,
        false,
        true,
        true
    )
    HUDSystem.Objects.Ping = pingText

    -- Session Time
    local sessionText = DrawingLib.CreateText(
        Vector2.new(10, 55),
        "Session: 00:00",
        Config.Colors.TextSecondary,
        13,
        false,
        true,
        true
    )
    HUDSystem.Objects.Session = sessionText

    -- Player Count
    local playerCountText = DrawingLib.CreateText(
        Vector2.new(10, 70),
        "Players: 0/0",
        Config.Colors.TextSecondary,
        13,
        false,
        true,
        true
    )
    HUDSystem.Objects.PlayerCount = playerCountText
end

function HUDSystem.UpdateWatermark()
    if HUDSystem.Objects.Watermark then
        local rainbow = Utility.GetRainbowColor(0.5)
        HUDSystem.Objects.Watermark.Color = rainbow
        HUDSystem.Objects.Watermark.Text = Config.Hub.Name .. " v" .. Config.Hub.Version .. " | " .. Utility.GetExecutor()
    end

    if HUDSystem.Objects.FPS and Config.Hub.ShowFPS then
        local fps = math.floor(1 / Services.RunService.RenderStepped:Wait())
        local color = fps >= 50 and Config.Colors.Success or (fps >= 30 and Config.Colors.Warning or Config.Colors.Error)
        HUDSystem.Objects.FPS.Text = "FPS: " .. tostring(fps)
        HUDSystem.Objects.FPS.Color = color
        HUDSystem.Objects.FPS.Visible = true
    elseif HUDSystem.Objects.FPS then
        HUDSystem.Objects.FPS.Visible = false
    end

    if HUDSystem.Objects.Ping and Config.Hub.ShowPing then
        local ping = UtilitySystem.GetPing()
        local color = ping < 80 and Config.Colors.Success or (ping < 150 and Config.Colors.Warning or Config.Colors.Error)
        HUDSystem.Objects.Ping.Text = "Ping: " .. tostring(ping) .. "ms"
        HUDSystem.Objects.Ping.Color = color
        HUDSystem.Objects.Ping.Visible = true
    elseif HUDSystem.Objects.Ping then
        HUDSystem.Objects.Ping.Visible = false
    end

    if HUDSystem.Objects.Session and Config.Hub.ShowTime then
        HUDSystem.Objects.Session.Text = "Session: " .. Utility.FormatTime(UtilitySystem.GetSessionTime())
        HUDSystem.Objects.Session.Visible = true
    elseif HUDSystem.Objects.Session then
        HUDSystem.Objects.Session.Visible = false
    end

    if HUDSystem.Objects.PlayerCount and Config.Hub.ShowPlayerCount then
        HUDSystem.Objects.PlayerCount.Text = "Players: " .. #Services.Players:GetPlayers() .. "/" .. Services.Players.MaxPlayers
        HUDSystem.Objects.PlayerCount.Visible = true
    elseif HUDSystem.Objects.PlayerCount then
        HUDSystem.Objects.PlayerCount.Visible = false
    end
end

function HUDSystem.Start()
    HUDSystem.CreateWatermark()

    table.insert(HUDSystem.Connections, Services.RunService.RenderStepped:Connect(function()
        HUDSystem.UpdateWatermark()
    end))
end

function HUDSystem.Stop()
    for _, conn in ipairs(HUDSystem.Connections) do
        pcall(function() conn:Disconnect() end)
    end
    HUDSystem.Connections = {}
    for _, obj in pairs(HUDSystem.Objects) do
        DrawingLib.Remove(obj)
    end
    HUDSystem.Objects = {}
end

-- ============================================================================
-- SECTION 17: CONFIG SAVE/LOAD SYSTEM
-- ============================================================================

local ConfigSystem = {}
ConfigSystem.Folder = "NonsenseXHub"
ConfigSystem.ConfigFile = "config.json"

function ConfigSystem.EnsureFolder()
    if isfolder and not isfolder(ConfigSystem.Folder) then
        makefolder(ConfigSystem.Folder)
    end
end

function ConfigSystem.Save(name)
    name = name or ConfigSystem.ConfigFile
    ConfigSystem.EnsureFolder()

    local data = {
        Version = Config.Hub.Version,
        Timestamp = Utility.GetTimestamp(),
        Features = Config.Features,
        SavedData = Config.SavedData,
        Flags = UILib.Flags,
    }

    local success, encoded = pcall(function()
        return Services.HttpService:JSONEncode(data)
    end)

    if success and writefile then
        pcall(function()
            writefile(ConfigSystem.Folder .. "/" .. name, encoded)
        end)
        NotificationSystem.Success("Config", "Configuration saved as '" .. name .. "'")
        return true
    end

    return false
end

function ConfigSystem.Load(name)
    name = name or ConfigSystem.ConfigFile
    ConfigSystem.EnsureFolder()

    if isfile and isfile(ConfigSystem.Folder .. "/" .. name) then
        local success, data = pcall(function()
            local raw = readfile(ConfigSystem.Folder .. "/" .. name)
            return Services.HttpService:JSONDecode(raw)
        end)

        if success and data then
            if data.Features then
                Config.Features = Utility.MergeTables(Config.Features, data.Features)
            end
            if data.SavedData then
                Config.SavedData = Utility.MergeTables(Config.SavedData, data.SavedData)
            end
            if data.Flags then
                for key, value in pairs(data.Flags) do
                    UILib.Flags[key] = value
                end
            end
            NotificationSystem.Success("Config", "Configuration '" .. name .. "' loaded!")
            return true
        end
    end

    NotificationSystem.Error("Config", "Configuration '" .. name .. "' not found!")
    return false
end

function ConfigSystem.Delete(name)
    if delfile and isfile and isfile(ConfigSystem.Folder .. "/" .. name) then
        delfile(ConfigSystem.Folder .. "/" .. name)
        NotificationSystem.Success("Config", "Configuration '" .. name .. "' deleted!")
        return true
    end
    return false
end

function ConfigSystem.GetAllConfigs()
    local configs = {}
    if listfiles then
        pcall(function()
            for _, file in ipairs(listfiles(ConfigSystem.Folder)) do
                local name = file:match("([^/\\]+)$")
                if name and name:match("%.json$") then
                    table.insert(configs, name)
                end
            end
        end)
    end
    return configs
end

function ConfigSystem.AutoSave()
    task.spawn(function()
        while Config.Hub.AutoSave do
            task.wait(Config.Hub.SaveInterval)
            ConfigSystem.Save("autosave.json")
        end
    end)
end

-- ============================================================================
-- SECTION 18: MAIN GUI BUILDER
-- ============================================================================

local MainGUI = {}

function MainGUI.Build()
    UILib.Initialize()
    NotificationSystem.Initialize()

    -- Main Window Frame
    local mainFrame = UILib.CreateFrame(UILib.ScreenGui, {
        Size = UDim2.new(0, 650, 0, 450),
        Position = UDim2.new(0.5, -325, 0.5, -225),
        BackgroundColor3 = Config.Colors.Background,
        CornerRadius = Config.Hub.CornerRadius,
        ClipsDescendants = true,
        Shadow = true,
        Stroke = {Color = Config.Colors.BackgroundLighter, Thickness = 1},
        Name = "MainWindow",
    })

    -- Title Bar
    local titleBar = UILib.CreateFrame(mainFrame, {
        Size = UDim2.new(1, 0, 0, 45),
        BackgroundColor3 = Config.Colors.BackgroundDark,
        Name = "TitleBar",
    })

    -- Title gradient bar
    local titleAccent = UILib.CreateFrame(titleBar, {
        Size = UDim2.new(1, 0, 0, 2),
        Position = UDim2.new(0, 0, 1, -2),
        BackgroundColor3 = Config.Colors.Primary,
        Name = "Accent",
    })

    local titleGradient = Instance.new("UIGradient")
    titleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Config.Colors.Primary),
        ColorSequenceKeypoint.new(0.5, Config.Colors.Accent),
        ColorSequenceKeypoint.new(1, Config.Colors.Primary),
    })
    titleGradient.Parent = titleAccent

    -- Title text
    local titleLabel = UILib.CreateLabel(titleBar, {
        Text = "⚡ " .. Config.Hub.Name .. " v" .. Config.Hub.Version,
        Position = UDim2.new(0, 15, 0, 0),
        Size = UDim2.new(0.5, 0, 1, 0),
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextColor3 = Config.Colors.TextPrimary,
    })

    -- Close button
    local closeBtn = UILib.CreateButton(titleBar, {
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(1, -40, 0, 5),
        BackgroundColor3 = Config.Colors.Error,
        Text = "✕",
        TextSize = 16,
        CornerRadius = 6,
        Callback = function()
            UILib.IsOpen = false
            Utility.TweenObject(mainFrame, {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1,
            }, 0.3)
        end,
    })

    -- Minimize button
    local minimizeBtn = UILib.CreateButton(titleBar, {
        Size = UDim2.new(0, 35, 0, 35),
        Position = UDim2.new(1, -80, 0, 5),
        BackgroundColor3 = Config.Colors.Warning,
        Text = "—",
        TextSize = 16,
        CornerRadius = 6,
        Callback = function()
            UILib.IsOpen = false
            Utility.TweenObject(mainFrame, {
                Position = UDim2.new(0.5, -325, 1, 50),
                BackgroundTransparency = 0.5,
            }, 0.3)
        end,
    })

    -- Make draggable
    local dragging = false
    local dragStart = nil
    local startPos = nil

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)

    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    Services.UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Sidebar
    local sidebar = UILib.CreateFrame(mainFrame, {
        Size = UDim2.new(0, 170, 1, -45),
        Position = UDim2.new(0, 0, 0, 45),
        BackgroundColor3 = Config.Colors.BackgroundDark,
        Name = "Sidebar",
    })

    local sidebarLayout = Instance.new("UIListLayout")
    sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sidebarLayout.Padding = UDim.new(0, 3)
    sidebarLayout.Parent = sidebar

    local sidebarPadding = Instance.new("UIPadding")
    sidebarPadding.PaddingTop = UDim.new(0, 8)
    sidebarPadding.PaddingLeft = UDim.new(0, 5)
    sidebarPadding.PaddingRight = UDim.new(0, 5)
    sidebarPadding.Parent = sidebar

    -- Content area
    local contentArea = UILib.CreateFrame(mainFrame, {
        Size = UDim2.new(1, -175, 1, -50),
        Position = UDim2.new(0, 172, 0, 48),
        BackgroundColor3 = Config.Colors.BackgroundLight,
        CornerRadius = 6,
        ClipsDescendants = true,
        Name = "ContentArea",
    })

    -- Tab pages container
    local pages = {}
    local currentPage = nil

    local function createPage(name)
        local page = UILib.CreateFrame(contentArea, {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Visible = false,
            Name = name .. "Page",
        })

        local scrollFrame = Instance.new("ScrollingFrame")
        scrollFrame.Size = UDim2.new(1, -10, 1, -10)
        scrollFrame.Position = UDim2.new(0, 5, 0, 5)
        scrollFrame.BackgroundTransparency = 1
        scrollFrame.BorderSizePixel = 0
        scrollFrame.ScrollBarThickness = 4
        scrollFrame.ScrollBarImageColor3 = Config.Colors.Primary
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        scrollFrame.Parent = page

        local layout = Instance.new("UIListLayout")
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 6)
        layout.Parent = scrollFrame

        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0, 5)
        padding.PaddingBottom = UDim.new(0, 5)
        padding.Parent = scrollFrame

        pages[name] = {Frame = page, ScrollFrame = scrollFrame}
        return scrollFrame
    end

    local function switchPage(name)
        for pageName, pageData in pairs(pages) do
            pageData.Frame.Visible = (pageName == name)
        end
        currentPage = name
    end

    local function createTabButton(name, icon, order)
        local tabBtn = UILib.CreateButton(sidebar, {
            Size = UDim2.new(1, 0, 0, 35),
            BackgroundColor3 = Config.Colors.BackgroundLight,
            Text = icon .. "  " .. name,
            TextSize = 13,
            Font = Enum.Font.GothamSemibold,
            CornerRadius = 6,
            Callback = function()
                switchPage(name)
                -- Update tab button colors
                for _, child in ipairs(sidebar:GetChildren()) do
                    if child:IsA("TextButton") then
                        Utility.TweenObject(child, {BackgroundColor3 = Config.Colors.BackgroundLight, TextColor3 = Config.Colors.TextSecondary}, 0.2)
                    end
                end
                Utility.TweenObject(tabBtn, {BackgroundColor3 = Config.Colors.Primary, TextColor3 = Config.Colors.TextPrimary}, 0.2)
            end,
        })
        tabBtn.TextColor3 = Config.Colors.TextSecondary
        tabBtn.TextXAlignment = Enum.TextXAlignment.Left
        tabBtn.LayoutOrder = order

        local btnPadding = Instance.new("UIPadding")
        btnPadding.PaddingLeft = UDim.new(0, 10)
        btnPadding.Parent = tabBtn

        return tabBtn
    end

    -- Create section header
    local function createSectionHeader(parent, title)
        local header = UILib.CreateLabel(parent, {
            Text = "━━ " .. title .. " ━━",
            Size = UDim2.new(1, -20, 0, 25),
            TextSize = 13,
            Font = Enum.Font.GothamBold,
            TextColor3 = Config.Colors.Primary,
            TextXAlignment = Enum.TextXAlignment.Center,
        })

        local headerFrame = Instance.new("Frame")
        headerFrame.Size = UDim2.new(1, -20, 0, 25)
        headerFrame.BackgroundTransparency = 1
        headerFrame.Parent = parent

        header.Parent = headerFrame
        header.Size = UDim2.new(1, 0, 1, 0)
        header.Position = UDim2.new(0, 0, 0, 0)

        return headerFrame
    end

    -- ========================================
    -- TAB 1: ESP
    -- ========================================
    createTabButton("ESP", "👁", 1)
    local espPage = createPage("ESP")

    createSectionHeader(espPage, "ESP SETTINGS")

    UILib.CreateToggle(espPage, {
        Title = "Enable ESP",
        Flag = "ESP_Enabled",
        Default = false,
        Callback = function(state)
            Config.Features.ESP.Enabled = state
            if state then ESPSystem.Start() else ESPSystem.Stop() end
        end,
    })

    UILib.CreateToggle(espPage, {
        Title = "Highlight ESP",
        Flag = "ESP_Highlight",
        Default = true,
        Callback = function(state) Config.Features.ESP.Highlight = state end,
    })

    UILib.CreateToggle(espPage, {
        Title = "Tracer Lines",
        Flag = "ESP_Tracer",
        Default = false,
        Callback = function(state) Config.Features.ESP.Tracer = state end,
    })

    UILib.CreateToggle(espPage, {
        Title = "Name ESP",
        Flag = "ESP_Name",
        Default = true,
        Callback = function(state) Config.Features.ESP.Name = state end,
    })

    UILib.CreateToggle(espPage, {
        Title = "Health ESP",
        Flag = "ESP_Health",
        Default = true,
        Callback = function(state) Config.Features.ESP.Health = state end,
    })

    UILib.CreateToggle(espPage, {
        Title = "Distance ESP",
        Flag = "ESP_Distance",
        Default = true,
        Callback = function(state) Config.Features.ESP.Distance = state end,
    })

    UILib.CreateToggle(espPage, {
        Title = "Role ESP",
        Flag = "ESP_Role",
        Default = true,
        Callback = function(state) Config.Features.ESP.Role = state end,
    })

    UILib.CreateToggle(espPage, {
        Title = "Rainbow Mode",
        Flag = "ESP_Rainbow",
        Default = false,
        Callback = function(state) Config.Features.ESP.RainbowMode = state end,
    })

    UILib.CreateDropdown(espPage, {
        Title = "ESP Filter",
        Values = {"All", "Murderer", "Sheriff", "Innocent"},
        Default = "All",
        Callback = function(val) Config.Features.ESP.Filter = val end,
    })

    UILib.CreateSlider(espPage, {
        Title = "Max Distance",
        Min = 100, Max = 10000, Default = 5000, Step = 100,
        Callback = function(val) Config.Features.ESP.MaxDistance = val end,
    })

    UILib.CreateSlider(espPage, {
        Title = "Highlight Transparency",
        Min = 0, Max = 1, Default = 0.5, Step = 0.05,
        Callback = function(val) Config.Features.ESP.HighlightTransparency = val end,
    })

    -- ========================================
    -- TAB 2: AIMBOT
    -- ========================================
    createTabButton("Aimbot", "🎯", 2)
    local aimbotPage = createPage("Aimbot")

    createSectionHeader(aimbotPage, "AIMBOT SETTINGS")

    UILib.CreateToggle(aimbotPage, {
        Title = "Enable Aimbot",
        Flag = "Aimbot_Enabled",
        Default = false,
        Callback = function(state)
            Config.Features.Aimbot.Enabled = state
            if state then AimbotSystem.Start() else AimbotSystem.Stop() end
        end,
    })

    UILib.CreateToggle(aimbotPage, {
        Title = "Show FOV Circle",
        Default = true,
        Callback = function(state) Config.Features.Aimbot.ShowFOV = state end,
    })

    UILib.CreateToggle(aimbotPage, {
        Title = "Wall Check",
        Default = true,
        Callback = function(state) Config.Features.Aimbot.WallCheck = state end,
    })

    UILib.CreateToggle(aimbotPage, {
        Title = "Prediction",
        Default = false,
        Callback = function(state) Config.Features.Aimbot.Prediction = state end,
    })

    UILib.CreateDropdown(aimbotPage, {
        Title = "Target Part",
        Values = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"},
        Default = "Head",
        Callback = function(val) Config.Features.Aimbot.TargetPart = val end,
    })

    UILib.CreateDropdown(aimbotPage, {
        Title = "Target Priority",
        Values = {"Distance", "Crosshair", "Health"},
        Default = "Distance",
        Callback = function(val) Config.Features.Aimbot.TargetPriority = val end,
    })

    UILib.CreateSlider(aimbotPage, {
        Title = "FOV Radius",
        Min = 50, Max = 800, Default = 200, Step = 10,
        Callback = function(val) Config.Features.Aimbot.FOV = val end,
    })

    UILib.CreateSlider(aimbotPage, {
        Title = "Smoothness",
        Min = 1, Max = 20, Default = 5, Step = 1,
        Callback = function(val) Config.Features.Aimbot.Smoothness = val end,
    })

    -- ========================================
    -- TAB 3: CHARACTER
    -- ========================================
    createTabButton("Character", "🏃", 3)
    local charPage = createPage("Character")

    createSectionHeader(charPage, "MOVEMENT")

    UILib.CreateToggle(charPage, {
        Title = "Custom Walk Speed",
        Default = false,
        Callback = function(state) Config.Features.Character.WalkSpeed.Enabled = state end,
    })

    UILib.CreateSlider(charPage, {
        Title = "Walk Speed",
        Min = 0, Max = 500, Default = 16, Step = 1,
        Callback = function(val)
            Config.Features.Character.WalkSpeed.Value = val
            if Config.Features.Character.WalkSpeed.Enabled then
                CharacterSystem.SetWalkSpeed(val)
            end
        end,
    })

    UILib.CreateToggle(charPage, {
        Title = "Custom Jump Power",
        Default = false,
        Callback = function(state) Config.Features.Character.JumpPower.Enabled = state end,
    })

    UILib.CreateSlider(charPage, {
        Title = "Jump Power",
        Min = 0, Max = 500, Default = 50, Step = 1,
        Callback = function(val)
            Config.Features.Character.JumpPower.Value = val
            if Config.Features.Character.JumpPower.Enabled then
                CharacterSystem.SetJumpPower(val)
            end
        end,
    })

    createSectionHeader(charPage, "ABILITIES")

    UILib.CreateToggle(charPage, {
        Title = "Noclip [N]",
        Default = false,
        Callback = function(state) CharacterSystem.ToggleNoclip(state) end,
    })

    UILib.CreateToggle(charPage, {
        Title = "Infinite Jump",
        Default = false,
        Callback = function(state) CharacterSystem.ToggleInfiniteJump(state) end,
    })

    UILib.CreateToggle(charPage, {
        Title = "Fly [F]",
        Default = false,
        Callback = function(state) CharacterSystem.ToggleFly(state) end,
    })

    UILib.CreateSlider(charPage, {
        Title = "Fly Speed",
        Min = 10, Max = 500, Default = 50, Step = 5,
        Callback = function(val) Config.Features.Character.Fly.Speed = val end,
    })

    UILib.CreateSlider(charPage, {
        Title = "Gravity",
        Min = 0, Max = 500, Default = 196.2, Step = 1,
        Callback = function(val)
            Config.Features.Character.Gravity.Value = val
            Config.Features.Character.Gravity.Enabled = (val ~= 196.2)
            if Config.Features.Character.Gravity.Enabled then
                CharacterSystem.SetGravity(val)
            end
        end,
    })

    -- ========================================
    -- TAB 4: TELEPORT
    -- ========================================
    createTabButton("Teleport", "🌀", 4)
    local tpPage = createPage("Teleport")

    createSectionHeader(tpPage, "PLAYER TELEPORT")

    local playerDropdown = UILib.CreateDropdown(tpPage, {
        Title = "Select Player",
        Values = TeleportSystem.GetPlayerList(),
        Callback = function(val) Config.Features.Teleport.SelectedPlayer = Services.Players:FindFirstChild(val) end,
    })

    UILib.CreateButton(tpPage, {
        Size = UDim2.new(1, -20, 0, 35),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundColor3 = Config.Colors.Primary,
        Text = "⚡ Teleport to Player",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function()
            if Config.Features.Teleport.SelectedPlayer then
                TeleportSystem.TeleportToPlayer(Config.Features.Teleport.SelectedPlayer)
            else
                NotificationSystem.Error("Teleport", "Select a player first!")
            end
        end,
    })

    UILib.CreateButton(tpPage, {
        Size = UDim2.new(1, -20, 0, 35),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundColor3 = Config.Colors.Success,
        Text = "🔄 Refresh Player List",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function()
            playerDropdown.Refresh(TeleportSystem.GetPlayerList())
            NotificationSystem.Info("Teleport", "Player list refreshed!")
        end,
    })

    createSectionHeader(tpPage, "ROLE TELEPORT")

    UILib.CreateButton(tpPage, {
        Size = UDim2.new(1, -20, 0, 35),
        BackgroundColor3 = Config.Colors.Murderer,
        Text = "🔪 Teleport to Murderer",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function() TeleportSystem.TeleportToRole("Murderer") end,
    })

    UILib.CreateButton(tpPage, {
        Size = UDim2.new(1, -20, 0, 35),
        BackgroundColor3 = Config.Colors.Sheriff,
        Text = "🛡 Teleport to Sheriff",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function() TeleportSystem.TeleportToRole("Sheriff") end,
    })

    UILib.CreateDropdown(tpPage, {
        Title = "TP Method",
        Values = {"Instant", "Tween", "Lerp"},
        Default = "Instant",
        Callback = function(val) Config.Features.Teleport.TPMethod = val end,
    })

    -- ========================================
    -- TAB 5: COMBAT
    -- ========================================
    createTabButton("Combat", "⚔", 5)
    local combatPage = createPage("Combat")

    createSectionHeader(combatPage, "COMBAT FEATURES")

    UILib.CreateToggle(combatPage, {
        Title = "Hitbox Expander",
        Default = false,
        Callback = function(state)
            Config.Features.Combat.HitboxExpander.Enabled = state
            if not state then CombatSystem.ResetHitbox() end
        end,
    })

    UILib.CreateSlider(combatPage, {
        Title = "Hitbox Size",
        Min = 2, Max = 50, Default = 10, Step = 1,
        Callback = function(val) Config.Features.Combat.HitboxExpander.Size = val end,
    })

    UILib.CreateSlider(combatPage, {
        Title = "Attack Delay",
        Min = 0.1, Max = 2, Default = 0.3, Step = 0.1,
        Callback = function(val) Config.Features.Combat.AttackDelay = val end,
    })

    -- ========================================
    -- TAB 6: VISUAL
    -- ========================================
    createTabButton("Visual", "🎨", 6)
    local visualPage = createPage("Visual")

    createSectionHeader(visualPage, "LIGHTING")

    UILib.CreateToggle(visualPage, {
        Title = "Fullbright",
        Default = false,
        Callback = function(state) VisualSystem.SetFullbright(state) end,
    })

    UILib.CreateToggle(visualPage, {
        Title = "No Fog",
        Default = false,
        Callback = function(state) VisualSystem.SetNoFog(state) end,
    })

    UILib.CreateSlider(visualPage, {
        Title = "Time of Day",
        Min = 0, Max = 24, Default = 12, Step = 0.5,
        Callback = function(val)
            Config.Features.Visual.CustomTime = val
            VisualSystem.SetTimeOfDay(val)
        end,
    })

    createSectionHeader(visualPage, "CAMERA")

    UILib.CreateToggle(visualPage, {
        Title = "FOV Changer",
        Default = false,
        Callback = function(state) Config.Features.Visual.FOVChanger.Enabled = state end,
    })

    UILib.CreateSlider(visualPage, {
        Title = "Field of View",
        Min = 30, Max = 120, Default = 70, Step = 1,
        Callback = function(val) Config.Features.Visual.FOVChanger.Value = val end,
    })

    createSectionHeader(visualPage, "PERFORMANCE")

    UILib.CreateButton(visualPage, {
        Size = UDim2.new(1, -20, 0, 35),
        BackgroundColor3 = Config.Colors.Accent,
        Text = "🚀 FPS Boost",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function() VisualSystem.FPSBoost() end,
    })

    UILib.CreateToggle(visualPage, {
        Title = "No Particles",
        Default = false,
        Callback = function(state) if state then VisualSystem.RemoveParticles() end end,
    })

    UILib.CreateToggle(visualPage, {
        Title = "No Textures",
        Default = false,
        Callback = function(state) if state then VisualSystem.RemoveTextures() end end,
    })

    -- ========================================
    -- TAB 7: UTILITY
    -- ========================================
    createTabButton("Utility", "🔧", 7)
    local utilPage = createPage("Utility")

    createSectionHeader(utilPage, "PROTECTION")

    UILib.CreateToggle(utilPage, {
        Title = "Anti-AFK",
        Default = true,
        Callback = function(state)
            Config.Features.Utility.AntiAFK = state
            if state then UtilitySystem.EnableAntiAFK() end
        end,
    })

    createSectionHeader(utilPage, "SERVER")

    UILib.CreateButton(utilPage, {
        Size = UDim2.new(1, -20, 0, 35),
        BackgroundColor3 = Config.Colors.Primary,
        Text = "🌐 Server Hop",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function() UtilitySystem.ServerHop() end,
    })

    UILib.CreateButton(utilPage, {
        Size = UDim2.new(1, -20, 0, 35),
        BackgroundColor3 = Config.Colors.Warning,
        Text = "🔄 Rejoin Server",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function() UtilitySystem.Rejoin() end,
    })

    -- ========================================
    -- TAB 8: SETTINGS
    -- ========================================
    createTabButton("Settings", "⚙", 8)
    local settingsPage = createPage("Settings")

    createSectionHeader(settingsPage, "GUI SETTINGS")

    UILib.CreateKeybind(settingsPage, {
        Title = "Toggle Key",
        Default = Config.Hub.ToggleKey,
        Callback = function(key)
            Config.Hub.ToggleKey = key
            NotificationSystem.Info("Keybind", "Toggle key set to: " .. key.Name)
        end,
    })

    UILib.CreateToggle(settingsPage, {
        Title = "Show Watermark",
        Default = true,
        Callback = function(state) Config.Features.Utility.Watermark = state end,
    })

    UILib.CreateToggle(settingsPage, {
        Title = "Show FPS",
        Default = true,
        Callback = function(state) Config.Hub.ShowFPS = state end,
    })

    UILib.CreateToggle(settingsPage, {
        Title = "Show Ping",
        Default = true,
        Callback = function(state) Config.Hub.ShowPing = state end,
    })

    createSectionHeader(settingsPage, "CONFIG")

    local configNameInput = UILib.CreateInput(settingsPage, {
        Title = "Config Name",
        Default = "default",
        Placeholder = "Enter config name...",
        Flag = "ConfigName",
    })

    UILib.CreateButton(settingsPage, {
        Size = UDim2.new(1, -20, 0, 35),
        BackgroundColor3 = Config.Colors.Success,
        Text = "💾 Save Config",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function()
            local name = UILib.Flags.ConfigName or "default"
            ConfigSystem.Save(name .. ".json")
        end,
    })

    UILib.CreateButton(settingsPage, {
        Size = UDim2.new(1, -20, 0, 35),
        BackgroundColor3 = Config.Colors.Primary,
        Text = "📂 Load Config",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function()
            local name = UILib.Flags.ConfigName or "default"
            ConfigSystem.Load(name .. ".json")
        end,
    })

    createSectionHeader(settingsPage, "INFO")

    UILib.CreateLabel(settingsPage, {
        Text = "Hub: " .. Config.Hub.Name .. " v" .. Config.Hub.Version,
        TextSize = 12, TextColor3 = Config.Colors.TextSecondary,
        Size = UDim2.new(1, -20, 0, 20),
    })

    UILib.CreateLabel(settingsPage, {
        Text = "Executor: " .. Utility.GetExecutor(),
        TextSize = 12, TextColor3 = Config.Colors.TextSecondary,
        Size = UDim2.new(1, -20, 0, 20),
    })

    UILib.CreateLabel(settingsPage, {
        Text = "Player: " .. LocalPlayer.Name .. " (" .. LocalPlayer.DisplayName .. ")",
        TextSize = 12, TextColor3 = Config.Colors.TextSecondary,
        Size = UDim2.new(1, -20, 0, 20),
    })

    UILib.CreateLabel(settingsPage, {
        Text = "Game: " .. tostring(game.PlaceId),
        TextSize = 12, TextColor3 = Config.Colors.TextSecondary,
        Size = UDim2.new(1, -20, 0, 20),
    })

    UILib.CreateButton(settingsPage, {
        Size = UDim2.new(1, -20, 0, 35),
        BackgroundColor3 = Config.Colors.Error,
        Text = "🗑 Destroy Hub",
        TextSize = 13,
        CornerRadius = 6,
        Callback = function()
            NotificationSystem.Warning("Destroying", "Hub will be destroyed in 2 seconds...")
            task.wait(2)
            -- Cleanup
            ESPSystem.Stop()
            AimbotSystem.Stop()
            CharacterSystem.Stop()
            VisualSystem.Stop()
            CombatSystem.Stop()
            HUDSystem.Stop()
            DrawingLib.ClearAll()
            if UILib.ScreenGui then UILib.ScreenGui:Destroy() end
            getgenv().NonsenseXHub_Loaded = false
        end,
    })

    -- Set default page
    switchPage("ESP")

    -- Toggle GUI with key
    Services.UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Config.Hub.ToggleKey then
            UILib.IsOpen = not UILib.IsOpen
            if UILib.IsOpen then
                mainFrame.Visible = true
                Utility.TweenObject(mainFrame, {
                    Size = UDim2.new(0, 650, 0, 450),
                    Position = UDim2.new(0.5, -325, 0.5, -225),
                    BackgroundTransparency = 0,
                }, 0.3, Enum.EasingStyle.Back)
            else
                Utility.TweenObject(mainFrame, {
                    Size = UDim2.new(0, 650, 0, 0),
                    BackgroundTransparency = 0.5,
                }, 0.2)
                task.wait(0.25)
                mainFrame.Visible = false
            end
        end
    end)

    -- Opening animation
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.BackgroundTransparency = 1

    Utility.TweenObject(mainFrame, {
        Size = UDim2.new(0, 650, 0, 450),
        Position = UDim2.new(0.5, -325, 0.5, -225),
        BackgroundTransparency = 0,
    }, 0.5, Enum.EasingStyle.Back)

    return mainFrame
end

-- ============================================================================
-- SECTION 19: INITIALIZATION & STARTUP
-- ============================================================================

local function Initialize()
    print("╔══════════════════════════════════════╗")
    print("║       NONSENSE X HUB v4.0.0         ║")
    print("║       Ultimate Edition               ║")
    print("╚══════════════════════════════════════╝")
    print("")
    print("[+] Initializing systems...")

    -- Start all systems
    Utility.SafeCall(function()
        print("[+] Starting Visual System...")
        VisualSystem.Start()
    end)

    Utility.SafeCall(function()
        print("[+] Starting Character System...")
        CharacterSystem.Start()
    end)

    Utility.SafeCall(function()
        print("[+] Starting Combat System...")
        CombatSystem.Start()
    end)

    Utility.SafeCall(function()
        print("[+] Starting Utility System...")
        UtilitySystem.Start()
    end)

    Utility.SafeCall(function()
        print("[+] Starting HUD System...")
        HUDSystem.Start()
    end)

    Utility.SafeCall(function()
        print("[+] Building GUI...")
        MainGUI.Build()
    end)

    Utility.SafeCall(function()
        print("[+] Loading saved config...")
        ConfigSystem.Load("autosave.json")
    end)

    Utility.SafeCall(function()
        print("[+] Starting auto-save...")
        ConfigSystem.AutoSave()
    end)

    print("")
    print("[✓] All systems initialized!")
    print("[✓] Press " .. Config.Hub.ToggleKey.Name .. " to toggle GUI")
    print("[✓] Executor: " .. Utility.GetExecutor())
    print("[✓] Player: " .. LocalPlayer.Name)
    print("[✓] Game: " .. tostring(game.PlaceId))
    print("")

    -- Startup notifications
    task.wait(1)

    NotificationSystem.Notify({
        Title = "⚡ " .. Config.Hub.Name,
        Content = "v" .. Config.Hub.Version .. " loaded successfully! Press " .. Config.Hub.ToggleKey.Name .. " to toggle.",
        Duration = 6,
        Type = "Success",
    })

    task.wait(2)

    NotificationSystem.Notify({
        Title = "📋 System Info",
        Content = "Executor: " .. Utility.GetExecutor() .. " | Player: " .. LocalPlayer.DisplayName,
        Duration = 5,
        Type = "Info",
    })

    task.wait(2)

    NotificationSystem.Notify({
        Title = "🎮 Game Detected",
        Content = "Place ID: " .. tostring(game.PlaceId) .. " | Players: " .. #Services.Players:GetPlayers() .. "/" .. Services.Players.MaxPlayers,
        Duration = 5,
        Type = "Info",
    })
end

-- ============================================================================
-- SECTION 20: RUN
-- ============================================================================

Initialize()

-- ============================================================================
-- END OF NONSENSE X HUB - ULTIMATE EDITION
-- Total Sections: 20
-- Features: ESP, Aimbot, Character Mods, Teleportation, Combat, Visual,
--           Utility, HUD, Config System, Notification System, Drawing Library,
--           UI Library, Anti-AFK, Server Hop, FPS Boost, and much more!
-- ============================================================================

--[[
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║   Thank you for using Nonsense X Hub - Ultimate Edition!                     ║
║                                                                              ║
║   Features included:                                                         ║
║   ✅ Full ESP System (Highlight, Box, Tracer, Name, Health, Distance, Role)  ║
║   ✅ Advanced Aimbot (FOV, Smoothness, Prediction, Wall Check)               ║
║   ✅ Character Mods (Speed, Jump, Noclip, Fly, Infinite Jump, Gravity)       ║
║   ✅ Teleportation (Player, Role, Position, Save/Load, History)              ║
║   ✅ Combat System (Hitbox Expander, Kill Aura, Attack Delay)                ║
║   ✅ Visual System (Fullbright, No Fog, FOV, FPS Boost, Time Control)        ║
║   ✅ Utility (Anti-AFK, Server Hop, Rejoin, Config Save/Load)                ║
║   ✅ Custom UI Library (Toggles, Sliders, Dropdowns, Inputs, Keybinds)       ║
║   ✅ Drawing Library (Lines, Circles, Text, Squares, Triangles, Images)      ║
║   ✅ Notification System (Info, Success, Warning, Error with animations)      ║
║   ✅ HUD System (Watermark, FPS, Ping, Session Time, Player Count)           ║
║   ✅ Config System (Save, Load, Delete, Auto-save)                           ║
║   ✅ Draggable Window with animations                                        ║
║   ✅ Tab-based navigation                                                    ║
║   ✅ Anti double-execution                                                   ║
║   ✅ Error handling throughout                                                ║
║   ✅ Compatible with most executors                                           ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
]]