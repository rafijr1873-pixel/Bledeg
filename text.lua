-- =============================================
--         NONSENSE X HUB - COMBINED
-- =============================================

-- STEP 1: Load Hub/GUI Loader dulu
pcall(function()
    loadstring(game:HttpGet("https://pastefy.app/D6TtwXZA/raw"))()
end)

task.wait(3) -- Tunggu hub selesai

-- STEP 2: Load WindUI Library
local vu1 = loadstring(game:HttpGet([[https://github.com/Footagesus/WindUI/releases/latest/download/main.lua]]))()

task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet([[https://raw.githubusercontent.com/n9owns/Files/refs/heads/main/antiafk]], true))()
    end)
end)

-- STEP 3: Services
local vu2 = game:GetService('Players')
local v3 = game:GetService('RunService')
local vu4 = game:GetService('ReplicatedStorage')
local _ = game:GetService('Workspace').CurrentCamera
local vu5 = vu2.LocalPlayer
game:GetService('CoreGui')
local vu6 = game:GetService('TweenService')

-- STEP 4: Colors
local vu7 = {
    Orange = Color3.fromHex('#0434e3'),
    DarkOrange = Color3.fromHex('#FF4500'),
    Purple = Color3.fromHex('#9D4EDD'),
    DarkPurple = Color3.fromHex('#5A189A'),
    Blood = Color3.fromHex('#8B0000'),
    Ghost = Color3.fromHex('#E0E0E0'),
    Pumpkin = Color3.fromHex('#FF7518'),
    Witch = Color3.fromHex('#6B2E8A'),
    Midnight = Color3.fromHex('#0D0221'),
    Toxic = Color3.fromHex('#39FF14'),
    Red = Color3.fromHex('#FF0000'),
    Green = Color3.fromHex('#00FF00'),
    Gold = Color3.fromHex('#FFD700'),
    Silver = Color3.fromHex('#C0C0C0'),
    Blue = Color3.fromHex('#1E90FF'),
    Innocent = Color3.fromHex('#39FF14'),
    Sheriff = Color3.fromHex('#001e80'),
    Murder = Color3.fromHex('#e80909'),
}

-- Gradient text function
local function v15(p8, p9, p10)
    local v11 = #p8
    local v12 = ''
    for v13 = 1, v11 do
        local v14 = (v13 - 1) / math.max(v11 - 1, 1)
        v12 = v12 .. '<font color="rgb(' .. math.floor((p9.R + (p10.R - p9.R) * v14) * 255) .. ', ' .. math.floor((p9.G + (p10.G - p9.G) * v14) * 255) .. ', ' .. math.floor((p9.B + (p10.B - p9.B) * v14) * 255) .. ')">' .. p8:sub(v13, v13) .. '</font>'
    end
    return v12
end

-- STEP 5: Popup (TITLE CHANGED)
local vu16 = false
local v17 = vu1

vu1.Popup(v17, {
    Title = v15('Nonsense X Hub', vu7.Red, vu7.Green),
    Icon = 'zap',
    Content = v15('Best MM2 Script - Latest Version', vu7.Gold, vu7.Blue),
    Buttons = {
        {
            Title = 'Continue',
            Callback = function()
                vu16 = true
            end,
            Variant = 'Primary',
        },
    },
})

local vu18 = vu1

repeat
    task.wait()
until vu16

-- STEP 6: Create Window (TITLE CHANGED)
local vu19 = vu18:CreateWindow({
    Title = v15('Nonsense X Hub', vu7.Red, vu7.Green),
    Author = 'Nonsense X Hub \u{2022} Latest Version',
    Folder = 'NonsenseXHub',
    Icon = 'zap',
    NewElements = true,
    Size = UDim2.new(0, 580, 0, 480),
    Transparent = true,
    BackgroundTransparency = 0.5,
    Theme = 'Dark',
    SideBarWidth = 220,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    OpenButton = {
        Title = 'Open Nonsense X Hub',
        CornerRadius = UDim.new(0.5, 0),
        StrokeThickness = 2,
        Enabled = true,
        Draggable = true,
        OnlyMobile = false,
        Color = ColorSequence.new(vu7.Red, vu7.Green),
    },
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function() end,
    },
})

-- STEP 7: Variables
local vu20 = false
local vu21 = false
local vu22 = false
local vu23 = false
local vu24 = false
local vu25 = {}
local vu26 = 25
local vu27 = 0
local vu28 = 0
local vu29 = 40
local vu30 = vu5.Character or vu5.CharacterAdded:Wait()
local vu31 = vu30:WaitForChild('HumanoidRootPart')
local vu32 = false
local vu33 = false
local vu34 = false
local vu35 = nil
local vu36 = game:GetService('MarketplaceService')
local vu37 = 818078531

local function vu40()
    local v38, v39 = pcall(function()
        return vu36:UserOwnsGamePassAsync(vu5.UserId, vu37)
    end)
    if v38 then
        if v39 then
            vu29 = 50
        else
            vu29 = 40
        end
    else
        vu29 = 40
    end
end

vu40()

local vu41 = false
local vu42 = false
local vu43 = {'Esp All'}
local vu44 = true
local vu45 = false
local vu46 = {}
local vu47 = ''
local vu48 = 1
local vu49 = ''
local vu50 = ''
local vu51

if vu5.PlayerGui.MainGUI.Game:FindFirstChild('Inventory') == nil then
    vu51 = vu5.PlayerGui.MainGUI.Lobby.Screens.Inventory.Main
else
    vu51 = vu5.PlayerGui.MainGUI.Game.Inventory.Main
end

local vu52 = {
    WalkSpeed = {Value = 16, Default = 16, Locked = false},
    JumpPower = {Value = 50, Default = 50, Locked = false},
}

-- STEP 8: Core Functions
local function vu56(p53)
    local v54 = p53.Character
    if not v54 then return nil end
    local v55 = p53:FindFirstChild('Backpack')
    return (v54:FindFirstChild('Knife') or v55 and v55:FindFirstChild('Knife')) and 'Murderer' or ((v54:FindFirstChild('Gun') or v55 and v55:FindFirstChild('Gun')) and 'Sheriff' or 'Innocent')
end

local function vu60(p57, p58)
    local v59 = vu56(p57)
    if v59 then
        return table.find(p58, 'Esp All') and true or (table.find(p58, 'Esp Murder') and v59 == 'Murderer' and true or (table.find(p58, 'Esp Sheriff') and v59 == 'Sheriff' and true or (table.find(p58, 'Esp Sheriff / Murder') and (v59 == 'Sheriff' or v59 == 'Murderer') and true or false)))
    else
        return false
    end
end

local function vu64(p61, p62)
    local v63 = p61:FindFirstChild('RoleHighlight')
    if not v63 then
        v63 = Instance.new('Highlight')
        v63.Name = 'RoleHighlight'
        v63.FillTransparency = 0.5
        v63.OutlineTransparency = 1
        v63.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        v63.Adornee = p61
        v63.Parent = p61
    end
    v63.FillColor = p62
end

local function vu67(p65)
    local v66 = p65:FindFirstChild('RoleHighlight')
    if v66 then v66:Destroy() end
end

local function vu71(p68, p69)
    local v70 = Drawing.new('Line')
    v70.Thickness = 2
    v70.Color = p69 or Color3.new(1, 1, 1)
    v70.Transparency = 1
    vu46[p68] = v70
end

local function vu73(p72)
    if vu46[p72] then
        vu46[p72]:Remove()
        vu46[p72] = nil
    end
end

local function vu89()
    vu41 = false
    vu42 = false
    for _, v78 in ipairs(vu2:GetPlayers()) do
        if v78 ~= vu5 and v78.Character then
            local v79 = vu56(v78)
            if v79 == 'Murderer' then vu41 = true end
            if v79 == 'Sheriff' then vu42 = true end
        end
    end
    for _, v84 in ipairs(vu2:GetPlayers()) do
        if v84 ~= vu5 and v84.Character then
            local v85 = vu56(v84)
            local v86 = vu60(v84, vu43)
            if vu44 then
                if v86 then
                    local v87 = v85 == 'Murderer' and vu7.Blood or (v85 == 'Sheriff' and vu7.Toxic or vu7.Orange)
                    vu64(v84.Character, v87)
                else
                    vu67(v84.Character)
                end
            else
                vu67(v84.Character)
            end
            if vu45 and v86 then
                local v88 = v85 == 'Murderer' and vu7.Blood or (v85 == 'Sheriff' and vu7.Toxic or vu7.Orange)
                if vu46[v84] then
                    vu46[v84].Color = v88
                else
                    vu71(v84, v88)
                end
            else
                vu73(v84)
            end
        end
    end
end

local function vu91()
    local v90 = vu5.Character:FindFirstChildOfClass('Humanoid')
    if v90 then
        if not vu52.WalkSpeed.Locked then v90.WalkSpeed = vu52.WalkSpeed.Value end
        if not vu52.JumpPower.Locked then v90.JumpPower = vu52.JumpPower.Value end
    end
end

-- Fling function
local function vu143(p92)
    local vu93 = game:GetService('Players')
    local vu94 = false

    local function v102(p95)
        local v96 = p95:lower()
        if v96 == 'all' or v96 == 'others' then
            vu94 = true
            return
        elseif v96 == 'random' then
            local v97 = vu93:GetPlayers()
            if table.find(v97, vu93.LocalPlayer) then
                table.remove(v97, table.find(v97, vu93.LocalPlayer))
            end
            return v97[math.random(#v97)]
        else
            for _, v101 in next, vu93:GetPlayers() do
                if v101 ~= vu93.LocalPlayer then
                    if v101.Name:lower():match('^' .. v96) then return v101 end
                    if v101.DisplayName:lower():match('^' .. v96) then return v101 end
                end
            end
        end
    end

    local function v128(pu103)
        local vu104 = vu93.LocalPlayer.Character
        local vu105 = vu104 and vu104:FindFirstChildOfClass('Humanoid')
        local vu106 = vu105 and vu105.RootPart
        local vu107 = pu103.Character
        local vu108 = nil
        local v109 = nil
        local v110 = nil
        local v111 = nil
        local vu112 = vu107:FindFirstChildOfClass('Humanoid') or nil
        if vu112 and vu112.RootPart then vu108 = vu112.RootPart end
        if vu107:FindFirstChild('Head') then v109 = vu107.Head end
        if vu107:FindFirstChildOfClass('Accessory') then v110 = vu107:FindFirstChildOfClass('Accessory') end
        if v110 and v110:FindFirstChild('Handle') then v111 = v110.Handle end

        if vu104 and vu105 and vu106 then
            if vu106.Velocity.Magnitude < 50 then getgenv().OldPos = vu106.CFrame end
            if vu112 and vu112.Sit and not vu94 then return end

            if v109 then
                game.Workspace.CurrentCamera.CameraSubject = v109
            elseif not v111 then
                if vu112 and vu108 then game.Workspace.CurrentCamera.CameraSubject = vu112 end
            else
                game.Workspace.CurrentCamera.CameraSubject = v111
            end

            if vu107:FindFirstChildWhichIsA('BasePart') then
                local function vu116(p113, p114, p115)
                    vu106.CFrame = CFrame.new(p113.Position) * p114 * p115
                    vu104:SetPrimaryPartCFrame(CFrame.new(p113.Position) * p114 * p115)
                    vu106.Velocity = Vector3.new(90000000, 900000000, 90000000)
                    vu106.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
                end

                local function v121(p117)
                    local v118 = tick()
                    local v119 = 2
                    local v120 = 0
                    while vu106 and vu112 do
                        if p117.Velocity.Magnitude >= 50 then
                            vu116(p117, CFrame.new(0, 1.5, vu112.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, -1.5, -vu112.WalkSpeed), CFrame.Angles(0, 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, 1.5, vu112.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, 1.5, vu108.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, -1.5, -vu108.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, 1.5, vu108.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                        else
                            v120 = v120 + 100
                            vu116(p117, CFrame.new(0, 1.5, 0) + vu112.MoveDirection * p117.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v120), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, -1.5, 0) + vu112.MoveDirection * p117.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v120), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(2.25, 1.5, -2.25) + vu112.MoveDirection * p117.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v120), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(-2.25, -1.5, 2.25) + vu112.MoveDirection * p117.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v120), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, 1.5, 0) + vu112.MoveDirection, CFrame.Angles(math.rad(v120), 0, 0))
                            task.wait()
                            vu116(p117, CFrame.new(0, -1.5, 0) + vu112.MoveDirection, CFrame.Angles(math.rad(v120), 0, 0))
                            task.wait()
                        end
                        if p117.Velocity.Magnitude > 500 or p117.Parent ~= pu103.Character or pu103.Parent ~= vu93 or vu112.Sit or vu105.Health <= 0 or tick() > v118 + v119 then
                            break
                        end
                    end
                end

                game.Workspace.FallenPartsDestroyHeight = 0 / 0
                local v122 = Instance.new('BodyVelocity')
                v122.Name = 'EpixVel'
                v122.Parent = vu106
                v122.Velocity = Vector3.new(900000000, 900000000, 900000000)
                v122.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
                vu105:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                if vu108 and v109 then
                    if (vu108.CFrame.p - v109.CFrame.p).Magnitude <= 5 then
                        v121(vu108)
                    else
                        v121(v109)
                    end
                elseif vu108 and not v109 then
                    v121(vu108)
                elseif not vu108 and v109 then
                    v121(v109)
                elseif v110 and v111 then
                    v121(v111)
                else
                    return
                end

                v122:Destroy()
                vu105:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                game.Workspace.CurrentCamera.CameraSubject = vu105

                repeat
                    vu106.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
                    vu104:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
                    vu105:ChangeState('GettingUp')
                    for _, p126 in pairs(vu104:GetChildren()) do
                        if p126:IsA('BasePart') then
                            p126.RotVelocity = Vector3.new()
                            p126.Velocity = Vector3.new()
                        end
                    end
                    task.wait()
                until (vu106.Position - getgenv().OldPos.p).Magnitude < 25

                game.Workspace.FallenPartsDestroyHeight = -500
            end
        end
    end

    if p92[1] then
        local v131 = vu93
        local v132 = vu94
        for _, v134 in next, p92 do
            v102(v134)
        end
        if v132 then
            for _, v138 in next, v131:GetPlayers() do
                v128(v138)
            end
        end
        for _, v141 in next, p92 do
            local target = v102(v141)
            if target and target ~= v131.LocalPlayer then
                v128(target)
            end
        end
    end
end

local function vu151()
    local foundMurderer = nil
    for _, v205 in ipairs(vu2:GetPlayers()) do
        if v205 ~= vu5 and v205.Character then
            if v205.Character:FindFirstChild('Knife') then
                foundMurderer = v205
                break
            end
            local bp = v205:FindFirstChild('Backpack')
            if bp and bp:FindFirstChild('Knife') then
                foundMurderer = v205
                break
            end
        end
    end

    if not (foundMurderer and foundMurderer.Character) then
        vu18:Notify({Title = 'Fling Error', Content = 'No murderer found!', Icon = 'x-circle', Duration = 3})
        return false
    end

    vu18:Notify({Title = 'Flinging Murderer', Content = 'Flinging ' .. foundMurderer.Name .. '!', Icon = 'zap', Duration = 3})
    vu143({foundMurderer.Name})
    vu18:Notify({Title = 'Fling Complete', Content = 'Murderer has been flung!', Icon = 'check-circle', Duration = 2})
    return true
end

local function vu152()
    return vu5.Character or vu5.CharacterAdded:Wait()
end

local function vu153()
    return vu152():WaitForChild('HumanoidRootPart')
end

-- Remote Events
local v154 = vu4:FindFirstChild('Remotes') and vu4.Remotes:FindFirstChild('Gameplay')
if v154 then v154 = vu4.Remotes.Gameplay:FindFirstChild('CoinCollected') end

local v155 = vu4:FindFirstChild('Remotes') and vu4.Remotes:FindFirstChild('Gameplay')
if v155 then v155 = vu4.Remotes.Gameplay:FindFirstChild('RoundStart') end

local v156 = vu4:FindFirstChild('Remotes') and vu4.Remotes:FindFirstChild('Gameplay')
if v156 then v156 = vu4.Remotes.Gameplay:FindFirstChild('RoundEndFade') end

if v155 then
    v155.OnClientEvent:Connect(function()
        vu32 = true
        vu35 = vu153().CFrame
    end)
end

if v156 then
    v156.OnClientEvent:Connect(function()
        vu32 = false
    end)
end

-- Coin/Candy finding
local function vu169()
    local v157 = vu153()
    local v158 = math.huge
    local v162 = nil
    for _, v163 in pairs(workspace:GetChildren()) do
        if v163:FindFirstChild('CoinContainer') then
            for _, v167 in pairs(v163.CoinContainer:GetChildren()) do
                if v167:IsA('BasePart') and v167:FindFirstChild('TouchInterest') then
                    local v168 = (v157.Position - v167.Position).Magnitude
                    if v168 < v158 then
                        v162 = v167
                        v158 = v168
                    end
                end
            end
        end
    end
    return v162, v158
end

local function vu187()
    local v170 = vu153()
    local v171 = math.huge
    local v175 = nil
    for _, v176 in pairs(workspace:GetChildren()) do
        if v176:FindFirstChild('CoinContainer') then
            for _, v180 in pairs(v176.CoinContainer:GetChildren()) do
                if v180:IsA('BasePart') and v180:GetAttribute('CoinID') == 'Candy' and v180:FindFirstChild('TouchInterest') then
                    local v181 = (v170.Position - v180.Position).Magnitude
                    if v181 < v171 then
                        v175 = v180
                        v171 = v181
                    end
                end
            end
        end
    end
    if not v175 then
        for _, v185 in ipairs(workspace:GetDescendants()) do
            if v185:IsA('BasePart') and v185.Name == 'candy' then
                local v186 = (v170.Position - v185.Position).Magnitude
                if v186 < v171 then
                    v171 = v186
                    v175 = v185
                end
            end
        end
    end
    return v175, v171
end

-- Autofarm loop
task.spawn(function()
    while true do
        if (vu20 or vu21) and vu32 and not vu33 then
            local v188 = vu153()
            local v189 = nil
            local v190 = math.huge
            if vu21 then
                v189, v190 = vu187()
            elseif vu20 then
                v189, v190 = vu169()
            end
            if v189 then
                if v190 > 150 then
                    v188.CFrame = v189.CFrame
                else
                    local v191 = vu6:Create(v188, TweenInfo.new(v190 / vu26, Enum.EasingStyle.Linear), {CFrame = v189.CFrame})
                    v191:Play()
                    repeat task.wait() until not (v189:FindFirstChild('TouchInterest') and vu32 and (vu20 or vu21))
                    v191:Cancel()
                end
                vu27 = vu27 + 1
            end
        end
        task.wait(0.2)
    end
end)

v3.Stepped:Connect(function()
    if (vu20 or vu21) and vu32 and not vu33 then
        local v192 = vu5.Character
        if v192 and v192:IsDescendantOf(workspace) then
            for _, v196 in ipairs(v192:GetDescendants()) do
                if v196:IsA('BasePart') then v196.CanCollide = false end
            end
        end
    end
end)

vu5.CharacterAdded:Connect(function(p197)
    vu30 = p197
    vu31 = p197:WaitForChild('HumanoidRootPart')
    vu25 = {}
    vu28 = 0
    vu33 = false
    vu34 = false
    vu40()
end)

-- Candy collection handler
if v154 then
    v154.OnClientEvent:Connect(function(p198, p199, _, _)
        if p198 == 'Candy' then
            vu28 = p199
            if vu29 <= vu28 then
                vu18:Notify({Title = 'Bag Full!', Content = 'Candy bag is full (' .. vu28 .. '/' .. vu29 .. ')', Icon = 'package', Duration = 3})
                vu21 = false
                vu20 = false
                if vu24 then
                    vu18:Notify({Title = 'Auto Fling Murderer', Content = 'Flinging murderer now!', Icon = 'zap', Duration = 2})
                    vu151()
                end
                if vu22 and not vu34 then
                    vu34 = true
                    vu33 = true
                    local v207 = vu153()
                    if vu35 then
                        local v209 = vu6:Create(v207, TweenInfo.new(2, Enum.EasingStyle.Linear), {CFrame = vu35})
                        v209:Play()
                        v209.Completed:Wait()
                    end
                    task.wait(0.5)
                    vu18:Notify({Title = 'Auto Reset', Content = 'Resetting character instantly!', Icon = 'refresh-cw', Duration = 2})
                    if vu5.Character then
                        vu5.Character:BreakJoints()
                        vu5.CharacterAdded:Wait()
                        task.wait(1.5)
                    end
                    vu34 = false
                    vu33 = false
                end
            end
        end
    end)
end

if v155 then
    v155.OnClientEvent:Connect(function(_, _)
        vu28 = 0
        vu25 = {}
        vu33 = false
        vu34 = false
        vu32 = true
        vu35 = vu153().CFrame
        if vu21 then
            vu21 = true
            vu18:Notify({Title = 'Round Started!', Content = 'Candy autofarm resumed', Icon = 'play-circle', Duration = 2})
        end
        if vu20 then
            vu20 = true
            vu18:Notify({Title = 'Round Started!', Content = 'Coin autofarm resumed', Icon = 'play-circle', Duration = 2})
        end
    end)
end

-- Dupe functions
local function vu227()
    wait(math.random(1, 3))
    for _, v214 in pairs(vu51.Weapons.Items.Container:GetChildren()) do
        for _, v218 in pairs(v214.Container:GetChildren()) do
            if v218.Name == 'Christmas' or v218.Name == 'Halloween' then
                for _, v222 in pairs(v218.Container:GetChildren()) do
                    if v222:IsA('Frame') and v222.ItemName.Label.Text == vu47 then
                        local v223 = v222.Container.Amount.Text
                        if v223 == '' or v223 == 'None' then
                            v222.Container.Amount.Text = 'x2'
                        else
                            local v224 = tonumber(v223:match('x(%d+)'))
                            if v224 then v222.Container.Amount.Text = 'x' .. tostring(v224 + 1) end
                        end
                    end
                end
            elseif v218:IsA('Frame') and v218.ItemName.Label.Text == vu47 then
                local v225 = v218.Container.Amount.Text
                if v225 == '' or v225 == 'None' then
                    v218.Container.Amount.Text = 'x2'
                else
                    local v226 = tonumber(v225:match('x(%d+)'))
                    if v226 then v218.Container.Amount.Text = 'x' .. tostring(v226 + 1) end
                end
            end
        end
    end
end

local function vu250()
    wait(math.random(3, 5))
    for _, v231 in pairs(vu51.Weapons.Items.Container:GetChildren()) do
        for _, v235 in pairs(v231.Container:GetChildren()) do
            if v235.Name == 'Christmas' or v235.Name == 'Halloween' then
                for _, v239 in pairs(v235.Container:GetChildren()) do
                    if v239:IsA('Frame') and v239.ItemName.Label.Text ~= 'Default Knife' and v239.ItemName.Label.Text ~= 'Default Gun' then
                        local v240 = v239.Container.Amount.Text
                        if v240 == '' or v240 == 'None' then
                            v239.Container.Amount.Text = 'x2'
                        else
                            local v241 = tonumber(v240:match('x(%d+)'))
                            if v241 then v239.Container.Amount.Text = 'x' .. tostring(v241 * 2) end
                        end
                    end
                end
            elseif v235:IsA('Frame') and v235.ItemName.Label.Text ~= 'Default Knife' and v235.ItemName.Label.Text ~= 'Default Gun' then
                local v242 = v235.Container.Amount.Text
                if v242 == '' or v242 == 'None' then
                    v235.Container.Amount.Text = 'x2'
                else
                    local v243 = tonumber(v242:match('x(%d+)'))
                    if v243 then v235.Container.Amount.Text = 'x' .. tostring(v243 * 2) end
                end
            end
        end
    end
    for _, v247 in pairs(vu51.Pets.Items.Container.Current.Container:GetChildren()) do
        if v247:IsA('Frame') then
            local v248 = v247.Container.Amount.Text
            if v248 == '' or v248 == 'None' then
                v247.Container.Amount.Text = 'x2'
            else
                local v249 = tonumber(v248:match('x(%d+)'))
                if v249 then v247.Container.Amount.Text = 'x' .. tostring(v249 * 2) end
            end
        end
    end
end

local function vu253(p251, p252)
    return p251:gsub('_G_%d%d%d%d', ''):gsub('_K_%d%d%d%d', ''):lower():find(p252:lower(), 1, true) ~= nil
end

local function vu254()
    if vu5.PlayerGui.TradeGUI.Enabled == true or vu5.PlayerGui.TradeGUI_Phone.Enabled == true then
        wait(1)
        vu18:Notify({Title = 'Trade Scam Active', Content = 'Items In Trade Are Now Visual, Remove All Items!', Icon = 'alert-triangle', Duration = 5})
    else
        vu18:Notify({Title = 'Trade Scam Error', Content = 'You Need To Be In Trade!', Icon = 'x-circle', Duration = 5})
    end
end

local function vu262()
    local v255, v256 = pcall(function()
        return require(vu4.Database.Sync.MysteryBox)
    end)
    if not v255 or not v256 or next(v256) == nil then return 'StandardBox' end
    local v260 = {}
    for k, _ in pairs(v256) do table.insert(v260, k) end
    return v260[math.random(1, #v260)]
end

local function vu265(pu263)
    if not pcall(function()
        local v264 = require(vu4.Modules.BoxModule)
        if pu263 and require(vu4.Database.Sync.Item)[pu263] then
            v264.OpenBox(vu262(), pu263)
            pcall(function()
                getsenv(vu5.PlayerGui.MainGUI.Inventory.NewItem)._G.NewItem(pu263, nil, nil, 'Weapons', 1)
            end)
            vu18:Notify({Title = 'Success', Content = 'Spawned: ' .. pu263, Icon = 'check-circle', Duration = 3})
        else
            vu18:Notify({Title = 'Error', Content = 'Invalid item: ' .. pu263, Icon = 'x-circle', Duration = 3})
        end
    end) then
        vu18:Notify({Title = 'Error', Content = 'Error spawning: ' .. pu263, Icon = 'x-circle', Duration = 3})
    end
end

-- Gun System
local vu266 = {AutoGrabEnabled = false, NotifyGunDrop = true, GunDropCheckInterval = 1, ActiveGunDrops = {}}
local vu267 = {'ResearchFacility','Hospital3','MilBase','House2','Workplace','Mansion2','BioLab','Hotel','Factory','Bank2','PoliceStation'}

local function vu275()
    vu266.ActiveGunDrops = {}
    for _, v271 in ipairs(vu267) do
        local v272 = workspace:FindFirstChild(v271)
        if v272 then
            local v273 = v272:FindFirstChild('GunDrop')
            if v273 then table.insert(vu266.ActiveGunDrops, v273) end
        end
    end
    local v274 = workspace:FindFirstChild('GunDrop')
    if v274 then table.insert(vu266.ActiveGunDrops, v274) end
end

local function vu286(p276)
    if not p276 then
        vu275()
        if #vu266.ActiveGunDrops == 0 then
            vu18:Notify({Title = 'Gun System', Content = 'No guns available', Icon = 'x-circle', Duration = 3})
            return false
        end
        local v277 = math.huge
        local v278 = vu5.Character and vu5.Character:FindFirstChild('HumanoidRootPart')
        if v278 then
            for _, v282 in ipairs(vu266.ActiveGunDrops) do
                local v283 = (v278.Position - v282.Position).Magnitude
                if v283 < v277 then v277 = v283; p276 = v282 end
            end
        end
    end
    local v284 = p276 and vu5.Character and vu5.Character:FindFirstChild('HumanoidRootPart')
    if v284 then
        v284.CFrame = p276.CFrame
        task.wait(0.3)
        local v285 = p276:FindFirstChildOfClass('ProximityPrompt')
        if v285 then
            fireproximityprompt(v285)
            vu18:Notify({Title = 'Gun System', Content = 'Grabbed the gun!', Icon = 'check-circle', Duration = 3})
            return true
        end
    end
    return false
end

local function vu296()
    while vu266.AutoGrabEnabled do
        vu275()
        local v287 = (#vu266.ActiveGunDrops > 0 and vu5.Character) and vu5.Character:FindFirstChild('HumanoidRootPart')
        if v287 then
            local v288 = math.huge
            local v292 = nil
            for _, v293 in ipairs(vu266.ActiveGunDrops) do
                local v294 = (v287.Position - v293.Position).Magnitude
                if v294 < v288 then v292 = v293; v288 = v294 end
            end
            if v292 then
                v287.CFrame = v292.CFrame
                task.wait(0.3)
                local v295 = v292:FindFirstChildOfClass('ProximityPrompt')
                if v295 then fireproximityprompt(v295); task.wait(1) end
            end
        end
        task.wait(vu266.GunDropCheckInterval)
    end
end

-- Kill All System
local vu297 = false
local vu298 = 0.5
local vu299 = {'Sheriff', 'Hero', 'Innocent'}

local function vu302(p300)
    local v301 = vu4:FindFirstChild('GetPlayerData', true):InvokeServer()
    if v301 and v301[p300.Name] then return v301[p300.Name].Role end
    return nil
end

local function vu305()
    local v303 = vu5.Character
    if not v303 then return false end
    if v303:FindFirstChild('Knife') then return true end
    local v304 = vu5.Backpack:FindFirstChild('Knife')
    if not v304 then return false end
    v304.Parent = v303
    return true
end

local function vu318()
    local v306 = {}
    vu4:FindFirstChild('GetPlayerData', true):InvokeServer()
    local v307 = vu5.Character and vu5.Character:FindFirstChild('HumanoidRootPart')
    if not v307 then return nil end
    for _, v312 in ipairs(vu2:GetPlayers()) do
        if v312 ~= vu5 and v312.Character then
            local v313 = vu302(v312)
            local v314 = v312.Character:FindFirstChild('Humanoid')
            local v315 = v312.Character:FindFirstChild('HumanoidRootPart')
            if v313 and v314 and v314.Health > 0 and v315 and table.find(vu299, v313) then
                table.insert(v306, {Player = v312, Distance = (v307.Position - v315.Position).Magnitude})
            end
        end
    end
    table.sort(v306, function(a, b) return a.Distance < b.Distance end)
    return v306[1] and v306[1].Player or nil
end

local function vu324(p319)
    if not (p319 and p319.Character) then return false end
    local v320 = p319.Character:FindFirstChild('Humanoid')
    if not v320 or v320.Health <= 0 then return false end
    if not vu305() then return false end
    local v321 = p319.Character:FindFirstChild('HumanoidRootPart')
    local v322 = vu5.Character:FindFirstChild('HumanoidRootPart')
    if v321 and v322 then
        v322.CFrame = CFrame.new(v321.Position + (v322.Position - v321.Position).Unit * 2, v321.Position)
    end
    local v323 = vu5.Character:FindFirstChild('Knife')
    if not (v323 and v323:FindFirstChild('Stab')) then return false end
    for _ = 1, 3 do v323.Stab:FireServer('Down') end
    return true
end

local function vu327()
    if not vu297 then
        vu297 = true
        task.spawn(function()
            while vu297 do
                local v325 = vu318()
                if not v325 then vu297 = false; break end
                vu324(v325)
                task.wait(vu298)
            end
        end)
    end
end

local function vu328()
    vu297 = false
end

local vu329 = 'Default'

-- =============================================
--    STEP 9: GUI TABS & ALL FEATURES
-- =============================================

local v330 = vu19:Section({
    Title = v15('Nonsense X Function', vu7.Pumpkin, vu7.Purple),
    Icon = 'flame',
    Opened = true,
})

-- ========== ESP TAB ==========
local v331 = v330:Tab({Title = 'ESP', Icon = 'eye'})
v331:Section({Title = 'Player ESP Settings', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v331:Toggle({
    Flag = 'HighlightESP', Title = 'Highlight ESP',
    Desc = 'Enable player highlighting', Default = true,
    Callback = function(p332)
        vu44 = p332
        if p332 then vu43 = {'Esp All'} end
        vu89()
    end,
})
v331:Space()
v331:Dropdown({
    Flag = 'ESPOptions', Title = 'Filter ESP',
    Desc = 'Filter which players to highlight',
    Values = {
        {Title = 'Esp All', Icon = 'users'},
        {Title = 'Esp Sheriff', Icon = 'shield'},
        {Title = 'Esp Murder', Icon = 'knife'},
        {Title = 'Esp Sheriff / Murder', Icon = 'target'},
    },
    Value = 'Esp All',
    Callback = function(p333) vu43 = {p333.Title}; vu89() end,
})
v331:Space()
v331:Toggle({
    Flag = 'LineESP', Title = 'Line ESP (Tracers)',
    Desc = 'Draw lines to players', Default = false,
    Callback = function(p334)
        vu45 = p334
        if not p334 then
            for _, v338 in pairs(vu46) do v338:Remove() end
            vu46 = {}
        end
        vu89()
    end,
})

-- ========== AUTO FARM TAB ==========
local v339 = v330:Tab({Title = v15('Auto Farm', vu7.Pumpkin, vu7.DarkOrange), Icon = 'trending-up'})
v339:Section({Title = 'Coin & Candy Collection', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v339:Toggle({
    Flag = 'CoinAutofarm', Title = 'Coin Autofarm',
    Desc = 'Automatically collect coins', Default = false,
    Callback = function(p340)
        vu20 = p340
        if p340 then vu25 = {}; vu27 = 0
            vu18:Notify({Title = 'Coin Autofarm', Content = 'Coin farming started!', Icon = 'dollar-sign', Duration = 3})
        else
            vu18:Notify({Title = 'Coin Autofarm', Content = 'Coin farming stopped', Icon = 'x-circle', Duration = 3})
        end
    end,
})
v339:Space()
v339:Toggle({
    Flag = 'CandyAutofarm', Title = 'Candy Autofarm',
    Desc = 'Collect Halloween candy', Default = false,
    Callback = function(p341)
        vu21 = p341
        if p341 then vu25 = {}; vu27 = 0
            vu18:Notify({Title = 'Candy Autofarm', Content = 'Candy farming started!', Icon = 'candy', Duration = 3})
        else
            vu18:Notify({Title = 'Candy Autofarm', Content = 'Candy farming stopped', Icon = 'x-circle', Duration = 3})
        end
    end,
})
v339:Space()
v339:Toggle({
    Flag = 'AutoEndRound', Title = 'Auto Reset Character',
    Desc = 'Auto reset when bag is full', Default = false,
    Callback = function(p342)
        vu22 = p342; vu23 = p342
        if p342 then
            vu18:Notify({Title = 'Auto Reset', Content = 'Will reset at ' .. vu29 .. ' candy', Icon = 'refresh-cw', Duration = 3})
        else
            vu18:Notify({Title = 'Auto Reset', Content = 'Disabled', Icon = 'x-circle', Duration = 3})
        end
    end,
})
v339:Space()
v339:Toggle({
    Flag = 'AutoFlingMurderer', Title = 'Auto Fling Murderer',
    Desc = 'Auto fling murderer when bag full', Default = false,
    Callback = function(p343)
        vu24 = p343
        if p343 then
            vu18:Notify({Title = 'Auto Fling', Content = 'Will fling at ' .. vu29 .. ' candy', Icon = 'zap', Duration = 3})
        else
            vu18:Notify({Title = 'Auto Fling', Content = 'Disabled', Icon = 'x-circle', Duration = 3})
        end
    end,
})
v339:Space()
v339:Slider({
    Flag = 'FlySpeed', Title = 'Autofarm Speed',
    Desc = 'Adjust collection speed', Step = 1,
    Value = {Min = 5, Max = 50, Default = 25},
    Callback = function(p344) vu26 = p344 end,
})
v339:Space()
v339:Section({Title = '\u{26a0}\u{fe0f} Recommended: 25', TextSize = 14, TextTransparency = 0.3, FontWeight = Enum.FontWeight.Medium})
v339:Space()
v339:Button({
    Title = 'Reset Counter', Icon = 'refresh-cw', Justify = 'Center',
    Callback = function()
        vu27 = 0; vu25 = {}; vu28 = 0
        vu18:Notify({Title = 'Counter Reset', Content = 'Reset!', Icon = 'check-circle', Duration = 3})
    end,
})
v339:Space()
v339:Button({
    Title = 'Fling Murderer', Icon = 'zap', Color = vu7.Blood, Justify = 'Center',
    Callback = function() vu151() end,
})
v339:Space()
v339:Button({
    Title = 'Enable Anti-AFK', Icon = 'moon', Color = vu7.Midnight, Justify = 'Center',
    Callback = function()
        if pcall(function() loadstring(game:HttpGet([[https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn]]))() end) then
            vu18:Notify({Title = 'Anti-AFK', Content = 'Enabled!', Icon = 'check-circle', Duration = 3})
        else
            vu18:Notify({Title = 'Anti-AFK Error', Content = 'Failed!', Icon = 'x-circle', Duration = 5})
        end
    end,
})

-- ========== CHARACTER TAB ==========
local v345 = v330:Tab({Title = 'Character', Icon = 'user'})
v345:Section({Title = 'Movement Settings', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v345:Slider({
    Flag = 'WalkSpeed', Title = 'Walk Speed', Step = 1,
    Value = {Min = 0, Max = 200, Default = 16},
    Callback = function(p346) vu52.WalkSpeed.Value = p346; vu91() end,
})
v345:Space()
v345:Toggle({Flag = 'BlockWalkSpeed', Title = 'Lock Walk Speed', Default = false, Callback = function(p347) vu52.WalkSpeed.Locked = p347 end})
v345:Space()
v345:Slider({
    Flag = 'JumpPower', Title = 'Jump Power', Step = 1,
    Value = {Min = 0, Max = 200, Default = 50},
    Callback = function(p348) vu52.JumpPower.Value = p348; vu91() end,
})
v345:Space()
v345:Toggle({Flag = 'BlockJumpPower', Title = 'Lock Jump Power', Default = false, Callback = function(p349) vu52.JumpPower.Locked = p349 end})
v345:Space()
v345:Button({
    Title = 'Reset to Default', Icon = 'rotate-ccw', Color = vu7.Orange, Justify = 'Center',
    Callback = function()
        vu52.WalkSpeed.Value = 16; vu52.JumpPower.Value = 50; vu91()
        vu18:Notify({Title = 'Reset', Content = 'Default!', Icon = 'check-circle', Duration = 3})
    end,
})

-- ========== TELEPORT TAB ==========
local v350 = v330:Tab({Title = 'Teleport', Icon = 'move'})
v350:Section({Title = 'Player Teleportation', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})

local vu351 = nil
local function vu358()
    local v356 = {}
    for _, v357 in pairs(vu2:GetPlayers()) do
        if v357 ~= vu5 then table.insert(v356, {Title = v357.Name, Icon = 'user'}) end
    end
    return v356
end

local vu360 = v350:Dropdown({
    Flag = 'TeleportPlayer', Title = 'Select Player', Values = vu358(),
    Callback = function(p359) vu351 = vu2:FindFirstChild(p359.Title) end,
})
v350:Space()
v350:Button({
    Title = 'Teleport to Player', Icon = 'zap', Color = vu7.Purple, Justify = 'Center',
    Callback = function()
        if vu351 and vu351.Character then
            local v361 = vu351.Character:FindFirstChild('HumanoidRootPart')
            local v362 = vu5.Character:FindFirstChild('HumanoidRootPart')
            if v361 and v362 then v362.CFrame = v361.CFrame
                vu18:Notify({Title = 'Teleported', Content = 'To ' .. vu351.Name, Icon = 'check-circle', Duration = 3})
            end
        else
            vu18:Notify({Title = 'Error', Content = 'Target not found!', Icon = 'x-circle', Duration = 3})
        end
    end,
})
v350:Space()
v350:Button({
    Title = 'Refresh Player List', Icon = 'refresh-cw', Justify = 'Center',
    Callback = function()
        vu360:Refresh(vu358())
        vu18:Notify({Title = 'Refreshed', Content = 'Player list updated!', Icon = 'check-circle', Duration = 2})
    end,
})
v350:Space({Columns = 2})
v350:Section({Title = 'Role Teleportation', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v350:Button({
    Title = 'Teleport to Murderer', Icon = 'knife', Color = vu7.Blood, Justify = 'Center',
    Callback = function()
        local found = nil
        for _, p in ipairs(vu2:GetPlayers()) do
            if p ~= vu5 and p.Character then
                if p.Character:FindFirstChild('Knife') then found = p; break end
                local bp = p:FindFirstChild('Backpack')
                if bp and bp:FindFirstChild('Knife') then found = p; break end
            end
        end
        if found and found.Character then
            local t = found.Character:FindFirstChild('HumanoidRootPart')
            local m = vu5.Character:FindFirstChild('HumanoidRootPart')
            if t and m then m.CFrame = t.CFrame
                vu18:Notify({Title = 'Teleported', Content = 'To murderer: ' .. found.Name, Icon = 'check-circle', Duration = 3})
            end
        else
            vu18:Notify({Title = 'Error', Content = 'No murderer found!', Icon = 'x-circle', Duration = 3})
        end
    end,
})
v350:Space()
v350:Button({
    Title = 'Teleport to Sheriff', Icon = 'shield', Color = vu7.Toxic, Justify = 'Center',
    Callback = function()
        local found = nil
        for _, p in ipairs(vu2:GetPlayers()) do
            if p ~= vu5 and p.Character then
                if p.Character:FindFirstChild('Gun') then found = p; break end
                local bp = p:FindFirstChild('Backpack')
                if bp and bp:FindFirstChild('Gun') then found = p; break end
            end
        end
        if found and found.Character then
            local t = found.Character:FindFirstChild('HumanoidRootPart')
            local m = vu5.Character:FindFirstChild('HumanoidRootPart')
            if t and m then m.CFrame = t.CFrame
                vu18:Notify({Title = 'Teleported', Content = 'To sheriff: ' .. found.Name, Icon = 'check-circle', Duration = 3})
            end
        else
            vu18:Notify({Title = 'Error', Content = 'No sheriff found!', Icon = 'x-circle', Duration = 3})
        end
    end,
})

-- ========== WEAPON SPAWNER TAB ==========
local v381 = v330:Tab({Title = 'Weapon Spawner', Icon = 'sword'})
v381:Section({Title = 'Spawn Weapons', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
local vu382 = ''
v381:Input({Flag = 'WeaponName', Title = 'Weapon Name', Placeholder = 'e.g., CandyBlade', Callback = function(p383) vu382 = p383 end})
v381:Space()
v381:Button({
    Title = 'Spawn Weapon', Icon = 'sparkles', Color = vu7.Orange, Justify = 'Center',
    Callback = function()
        if vu382 == '' then vu18:Notify({Title = 'Error', Content = 'Enter weapon name!', Icon = 'x-circle', Duration = 3})
        else vu265(vu382) end
    end,
})
v381:Space({Columns = 2})
v381:Section({Title = 'Quick Spawn Godlies', TextSize = 16, FontWeight = Enum.FontWeight.SemiBold})
v381:Button({Title = 'Spawn Raygun', Icon = 'zap', Color = vu7.Toxic, Callback = function() vu265('Raygun') end})
v381:Space()
v381:Button({Title = 'Spawn XenoKnife', Icon = 'knife', Color = vu7.Blood, Callback = function() vu265('XenoKnife') end})
v381:Space()
v381:Button({Title = 'Spawn XenoGun', Icon = 'crosshair', Color = vu7.DarkPurple, Callback = function() vu265('XenoGun') end})

-- ========== WEAPON DUPE TAB ==========
local v384 = v330:Tab({Title = 'Weapon Dupe', Icon = 'copy'})
v384:Section({Title = 'Single Weapon Duplication', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v384:Input({Flag = 'DupeWeaponName', Title = 'Weapon Name', Placeholder = 'e.g., Lightbringer', Callback = function(p385) vu47 = p385 end})
v384:Space()
v384:Input({Flag = 'DupeAmount', Title = 'Dupe Amount', Placeholder = 'e.g., 5', Value = '1', Callback = function(p386) vu48 = tonumber(p386) or 1 end})
v384:Space()
v384:Button({
    Title = 'Start Duplication', Icon = 'layers', Color = vu7.DarkOrange, Justify = 'Center',
    Callback = function()
        if vu47 ~= '' then
            vu18:Notify({Title = 'Dupe', Content = 'Duplicating ' .. vu47 .. ' x' .. vu48, Icon = 'loader', Duration = 3})
            for _ = 1, vu48 do vu227() end
            vu18:Notify({Title = 'Done', Content = 'Duplicated ' .. vu47, Icon = 'check-circle', Duration = 5})
        else
            vu18:Notify({Title = 'Error', Content = 'Enter weapon name!', Icon = 'x-circle', Duration = 5})
        end
    end,
})
v384:Space({Columns = 3})
v384:Section({Title = 'Inventory Duplication', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v384:Button({
    Title = 'Dupe Entire Inventory', Icon = 'package', Color = vu7.Witch, Justify = 'Center',
    Callback = function()
        vu18:Notify({Title = 'Inventory Dupe', Content = 'Duplicating...', Icon = 'loader', Duration = 3})
        vu250()
        vu18:Notify({Title = 'Done', Content = 'Inventory duplicated!', Icon = 'check-circle', Duration = 5})
    end,
})

-- ========== WEAPONS REPLACER TAB ==========
local v387 = v330:Tab({Title = 'Weapons Replacer', Icon = 'eye-off'})
v387:Section({Title = 'Change Weapon Appearance', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v387:Input({Flag = 'FromWeapon', Title = 'Weapon to Replace', Placeholder = 'e.g., Blossom', Callback = function(p388) vu49 = p388 end})
v387:Space()
v387:Input({Flag = 'ToWeapon', Title = 'Weapon to Receive', Placeholder = 'e.g., Chroma', Callback = function(p389) vu50 = p389 end})
v387:Space()
v387:Button({
    Title = 'Change Visual', Icon = 'wand-2', Color = vu7.Purple, Justify = 'Center',
    Callback = function()
        if vu49 == '' or vu50 == '' then
            vu18:Notify({Title = 'Error', Content = 'Enter both names!', Icon = 'x-circle', Duration = 5})
        elseif not pcall(function()
            local v390 = require(vu4.Database.Sync.Item)
            local v394, v395 = {}, {}
            for k, _ in pairs(v390) do
                if vu253(k, vu49) then table.insert(v395, k) end
                if vu253(k, vu50) then table.insert(v394, k) end
            end
            if #v395 <= 0 or #v394 <= 0 then
                vu18:Notify({Title = 'Error', Content = 'Weapon not found!', Icon = 'x-circle', Duration = 5})
            else
                for _, v400 in ipairs(v395) do
                    for _, v404 in ipairs(v394) do
                        v390[v400] = {}
                        for k2, v2 in pairs(v390[v404]) do v390[v400][k2] = v2 end
                        vu4.Remotes.Inventory.Equip:FireServer(v404)
                    end
                end
                vu18:Notify({Title = 'Success', Content = 'Visual changed!', Icon = 'check-circle', Duration = 5})
            end
        end) then
            vu18:Notify({Title = 'Error', Content = 'Failed!', Icon = 'x-circle', Duration = 5})
        end
    end,
})

-- ========== TRADE SCAM TAB ==========
local v409 = v330:Tab({Title = 'Trade Scam', Icon = 'shield-alert'})
v409:Section({Title = 'Visual Trade Protection', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
local vu410 = false
v409:Toggle({
    Flag = 'VisualTrade', Title = 'Enable Visual Trade', Default = false,
    Callback = function(p411)
        vu410 = p411
        vu18:Notify({Title = 'Visual Trade', Content = p411 and 'Enabled!' or 'Disabled!', Icon = p411 and 'shield-check' or 'shield-off', Duration = 3})
    end,
})
v409:Space()
v409:Button({
    Title = 'Activate Visual Trade', Icon = 'alert-triangle', Color = vu7.Blood, Justify = 'Center',
    Callback = function()
        if vu410 then vu254() else vu18:Notify({Title = 'Error', Content = 'Enable first!', Icon = 'x-circle', Duration = 5}) end
    end,
})

-- ========== UTILITIES TAB ==========
local v412 = v330:Tab({Title = 'Utilities', Icon = 'wrench'})
v412:Section({Title = 'Server Utilities', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v412:Button({
    Title = 'Enable Anti-AFK', Icon = 'moon', Color = vu7.Midnight, Justify = 'Center',
    Callback = function()
        if pcall(function() loadstring(game:HttpGet([[https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn]]))() end) then
            vu18:Notify({Title = 'Anti-AFK', Content = 'Enabled!', Icon = 'check-circle', Duration = 3})
        else
            vu18:Notify({Title = 'Error', Content = 'Failed!', Icon = 'x-circle', Duration = 5})
        end
    end,
})
v412:Space()
v412:Button({
    Title = 'Server Lagger', Icon = 'zap', Color = vu7.Blood, Justify = 'Center',
    Callback = function()
        vu18:Notify({Title = 'Server Lagger', Content = 'Lagging server...', Icon = 'alert-triangle', Duration = 5})
        pcall(function()
            local v413 = vu4.GetSyncData
            local v416 = 0
            while true do
                task.spawn(v413.InvokeServer, v413)
                v416 = v416 + 1
                if v416 == 3 then wait(0); v416 = 0 end
            end
        end)
    end,
})

-- ========== INNOCENT TAB ==========
local v417 = v330:Tab({Title = v15('Innocent', vu7.Innocent, vu7.Innocent), Icon = 'user-check'})
v417:Section({Title = 'Gun System', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v417:Toggle({
    Flag = 'AutoGrabGun', Title = 'Auto Grab Gun', Default = false,
    Callback = function(p418)
        vu266.AutoGrabEnabled = p418
        if p418 then coroutine.wrap(vu296)()
            vu18:Notify({Title = 'Auto Grab', Content = 'Enabled!', Icon = 'check-circle', Duration = 3})
        else
            vu18:Notify({Title = 'Auto Grab', Content = 'Disabled', Icon = 'x-circle', Duration = 3})
        end
    end,
})
v417:Space()
v417:Button({Title = 'Grab Gun Manually', Icon = 'hand', Color = vu7.Toxic, Justify = 'Center', Callback = function() vu286() end})
v417:Space()
v417:Toggle({Flag = 'NotifyGunDrop', Title = 'Notify Gun Drop', Default = true, Callback = function(p419) vu266.NotifyGunDrop = p419 end})

-- ========== MURDER TAB ==========
local v420 = v330:Tab({Title = v15('Murder', vu7.Blood, vu7.Murder), Icon = 'skull'})
v420:Section({Title = 'Kill Functions', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v420:Toggle({
    Flag = 'KillAll', Title = 'Kill All Players', Default = false,
    Callback = function(p421)
        if p421 then vu327(); vu18:Notify({Title = 'Kill All', Content = 'Started!', Icon = 'skull', Duration = 2})
        else vu328(); vu18:Notify({Title = 'Kill All', Content = 'Stopped', Icon = 'x-circle', Duration = 2}) end
    end,
})
v420:Space()
v420:Slider({Flag = 'AttackDelay', Title = 'Attack Delay', Step = 0.1, Value = {Min = 0.1, Max = 2, Default = 0.5}, Callback = function(p422) vu298 = p422 end})
v420:Space()
v420:Button({
    Title = 'Equip Knife', Icon = 'knife', Color = vu7.Blood, Justify = 'Center',
    Callback = function()
        if vu305() then vu18:Notify({Title = 'Knife', Content = 'Ready!', Icon = 'check-circle', Duration = 2})
        else vu18:Notify({Title = 'Error', Content = 'No knife!', Icon = 'x-circle', Duration = 2}) end
    end,
})

-- ========== SHERIFF TAB ==========
local vu423 = nil
local v424 = v330:Tab({Title = v15('Sheriff', vu7.Sheriff, vu7.Sheriff), Icon = 'shield'})
v424:Section({Title = 'Shooting Functions', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v424:Dropdown({
    Flag = 'ShotType', Title = 'Shot Type',
    Values = {{Title = 'Default', Icon = 'target'}, {Title = 'Teleport', Icon = 'zap'}},
    Value = 'Default',
    Callback = function(p425) vu329 = p425.Title; vu18:Notify({Title = 'Shot Type', Content = p425.Title, Icon = 'check-circle', Duration = 2}) end,
})
v424:Space()
v424:Toggle({
    Title = 'Shoot Murderer', Icon = 'crosshair', Color = vu7.Toxic, Justify = 'Center',
    Callback = function(p426)
        local cg = game:GetService('CoreGui')
        if p426 then
            if not cg:FindFirstChild('GunW') then
                local sg = Instance.new('ScreenGui', cg); sg.Name = 'GunW'
                local btn = Instance.new('TextButton', sg)
                btn.Draggable = true; btn.Size = UDim2.new(0,200,0,100)
                btn.Position = UDim2.new(0.5,-100,0.5,0)
                btn.TextStrokeTransparency = 0; btn.BackgroundTransparency = 0.2
                btn.BackgroundColor3 = Color3.fromRGB(44,44,45)
                btn.BorderColor3 = Color3.new(1,1,1)
                btn.Text = 'Shoot Murder'; btn.TextColor3 = Color3.new(1,1,1)
                btn.TextSize = 20; btn.Visible = true
                btn.AnchorPoint = Vector2.new(0.5,0.5)
                btn.Active = true; btn.TextWrapped = true
                Instance.new('UICorner', btn)
                local stroke = Instance.new('UIStroke', btn)
                stroke.Color = Color3.new(0,0,0); stroke.Thickness = 4; stroke.Transparency = 0.4
                btn.MouseButton1Click:Connect(function()
                    if vu5.Character and vu5.Character:FindFirstChild('Gun') then
                        pcall(function()
                            vu5.Character.Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(1, getMurdererTarget(), 'AH2')
                        end)
                    end
                end)
                vu423 = sg
            end
        elseif cg:FindFirstChild('GunW') then
            cg:FindFirstChild('GunW'):Destroy()
        end
    end,
})

-- ========== SETTINGS TAB ==========
local v431 = v330:Tab({Title = 'Settings', Icon = 'settings'})
v431:Section({Title = 'GUI Settings', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v431:Keybind({
    Flag = 'GUIKeybind', Title = 'GUI Toggle Key', Value = 'G',
    Callback = function(p432) vu19:SetToggleKey(Enum.KeyCode[p432])
        vu18:Notify({Title = 'Keybind', Content = 'Key: ' .. p432, Icon = 'keyboard', Duration = 3})
    end,
})
v431:Space({Columns = 2})
v431:Section({Title = 'Config Management', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
local vu433 = 'default'
local vu434 = vu19.ConfigManager
local vu436 = v431:Input({Flag = 'ConfigName', Title = 'Config Name', Icon = 'file', Value = vu433, Callback = function(p435) vu433 = p435 end})
v431:Space()
local v437 = vu434:AllConfigs()
v431:Dropdown({
    Flag = 'ConfigSelect', Title = 'Load Config', Values = v437,
    Value = table.find(v437, vu433) and vu433 or nil,
    Callback = function(p438) vu433 = p438; vu436:Set(p438) end,
})
v431:Space()
v431:Button({
    Title = 'Save Config', Icon = 'save', Color = vu7.Toxic, Justify = 'Center',
    Callback = function()
        vu19.CurrentConfig = vu434:CreateConfig(vu433)
        if vu19.CurrentConfig:Save() then vu18:Notify({Title = 'Saved', Content = "'" .. vu433 .. "'", Icon = 'check', Duration = 3}) end
    end,
})
v431:Space()
v431:Button({
    Title = 'Load Config', Icon = 'upload', Color = vu7.Purple, Justify = 'Center',
    Callback = function()
        vu19.CurrentConfig = vu434:CreateConfig(vu433)
        if vu19.CurrentConfig:Load() then vu18:Notify({Title = 'Loaded', Content = "'" .. vu433 .. "'", Icon = 'refresh-cw', Duration = 3}) end
    end,
})

-- ========== INFO TAB ==========
local v439 = v330:Tab({Title = 'Info & Socials', Icon = 'info'})
v439:Section({Title = 'Nonsense X Hub', TextSize = 20, FontWeight = Enum.FontWeight.Bold})
v439:Space()
v439:Section({
    Title = 'Enhanced MM2 script with ESP, auto-farming, weapon duplication, role-specific functions, and more!',
    TextSize = 16, TextTransparency = 0.3, FontWeight = Enum.FontWeight.Medium,
})
v439:Space({Columns = 3})
v439:Section({Title = 'Features', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v439:Space()
v439:Section({
    Title = 'Player ESP \u{2022} Auto Farm \u{2022} Character Mods \u{2022} Teleportation \u{2022} Weapon Spawner \u{2022} Weapon Dupe \u{2022} Visual Weapons \u{2022} Trade Scam \u{2022} Role Functions \u{2022} Anti-AFK',
    TextSize = 15, TextTransparency = 0.4, FontWeight = Enum.FontWeight.Medium,
})
v439:Space({Columns = 3})
v439:Section({Title = 'Community & Support', TextSize = 18, FontWeight = Enum.FontWeight.SemiBold})
v439:Button({Title = 'Copy Discord', Icon = 'message-circle', Color = vu7.DarkPurple, Justify = 'Center',
    Callback = function() setclipboard('https://discord.gg/pNfrgHeede'); vu18:Notify({Title = 'Discord', Content = 'Copied!', Icon = 'check-circle', Duration = 3}) end})
v439:Space()
v439:Button({Title = 'Other Scripts', Icon = 'message-circle', Color = vu7.Toxic, Justify = 'Center',
    Callback = function() setclipboard('https://xysfhub.github.io/'); vu18:Notify({Title = 'Scripts', Content = 'Copied!', Icon = 'check-circle', Duration = 3}) end})
v439:Space()
v439:Button({Title = 'YouTube', Icon = 'youtube', Color = vu7.Blood, Justify = 'Center',
    Callback = function() setclipboard('https://www.youtube.com/@xysf'); vu18:Notify({Title = 'YouTube', Content = 'Copied!', Icon = 'check-circle', Duration = 3}) end})
v439:Space()
v439:Button({Title = 'TikTok', Icon = 'music', Color = vu7.Pumpkin, Justify = 'Center',
    Callback = function() setclipboard('https://tiktok.com/@xysf_rblx'); vu18:Notify({Title = 'TikTok', Content = 'Copied!', Icon = 'check-circle', Duration = 3}) end})

-- =============================================
--    STEP 10: CONNECTIONS & INITIALIZATION
-- =============================================

vu89()

v3.RenderStepped:Connect(function()
    if vu45 then
        for player, line in pairs(vu46) do
            if player.Character and player.Character:FindFirstChild('HumanoidRootPart') then
                local hrp = player.Character.HumanoidRootPart
                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
                local vpSize = workspace.CurrentCamera.ViewportSize
                if onScreen then
                    line.From = Vector2.new(vpSize.X / 2, vpSize.Y)
                    line.To = Vector2.new(pos.X, pos.Y)
                    line.Visible = true
                else
                    line.Visible = false
                end
            else
                line.Visible = false
            end
        end
    end
end)

local function v457(pu454)
    pu454.CharacterAdded:Connect(function()
        local v455 = pu454:WaitForChild('Backpack')
        v455.ChildAdded:Connect(vu89)
        v455.ChildRemoved:Connect(vu89)
        vu89()
    end)
    local v456 = pu454.Character and pu454:FindFirstChild('Backpack')
    if v456 then
        v456.ChildAdded:Connect(vu89)
        v456.ChildRemoved:Connect(vu89)
    end
end

for _, p in ipairs(vu2:GetPlayers()) do v457(p) end

vu2.PlayerAdded:Connect(v457)
vu2.PlayerRemoving:Connect(function(p459)
    if p459 == vu5 then
        for _, line in pairs(vu46) do if line then line:Remove() end end
        vu46 = {}
    end
end)

task.spawn(function()
    if not vu5.Character then vu5.CharacterAdded:Wait() end
    vu275()
    if vu266.AutoGrabEnabled then coroutine.wrap(vu296)() end
end)

vu19:SetToggleKey(Enum.KeyCode.G)
vu19.CurrentConfig = vu19.ConfigManager:CreateConfig('default')
vu19.CurrentConfig:Save()

-- FINAL NOTIFICATION (TITLE CHANGED)
vu18:Notify({
    Title = v15('Nonsense X Hub Loaded!', vu7.Pumpkin, vu7.Purple),
    Content = 'Nonsense X Hub is ready! Press G to toggle GUI.',
    Icon = 'skull',
    Duration = 5,
})

task.spawn(function()
    task.wait(5)
    setclipboard('https://discord.gg/pNfrgHeede')
    vu18:Notify({
        Title = 'Discord Copied!',
        Content = 'Join our community!',
        Icon = 'message-circle',
        Duration = 4,
    })
end)