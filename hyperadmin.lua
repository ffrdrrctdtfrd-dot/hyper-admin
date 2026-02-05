--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- ================= HYPER ADMIN =================
-- By: Hyper Admin
-- Experimental / Futuras Opções

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local lp = Players.LocalPlayer

-- ================= GUI ROOT =================
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false

-- BOTÃO FIXO
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0,48,0,24)
openBtn.Position = UDim2.new(0.5,-24,0,6)
openBtn.Text = "HA"
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 14
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.BackgroundColor3 = Color3.fromRGB(80,90,160)
Instance.new("UICorner", openBtn)

-- MENU PRINCIPAL
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,640,0,390)
main.Position = UDim2.new(0.2,0,0.2,0)
main.BackgroundColor3 = Color3.fromRGB(28,32,60)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

openBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- MINIMIZAR
local minimize = Instance.new("TextButton", main)
minimize.Size = UDim2.new(0,28,0,20)
minimize.Position = UDim2.new(1,-34,0,6)
minimize.Text = "—"
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 18
minimize.TextColor3 = Color3.new(1,1,1)
minimize.BackgroundTransparency = 1
minimize.MouseButton1Click:Connect(function()
    main.Visible = false
end)

-- ================= SIDEBAR =================
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0,170,1,0)
sidebar.BackgroundColor3 = Color3.fromRGB(22,24,45)
Instance.new("UICorner", sidebar)

local title = Instance.new("TextLabel", sidebar)
title.Size = UDim2.new(1,0,0,45)
title.Text = "Hyper Admin"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(140,180,255)
title.BackgroundTransparency = 1

local user = Instance.new("TextLabel", sidebar)
user.Size = UDim2.new(1,0,0,20)
user.Position = UDim2.new(0,0,0,40)
user.Text = "User: "..lp.Name
user.Font = Enum.Font.Gotham
user.TextSize = 12
user.TextColor3 = Color3.fromRGB(200,200,255)
user.BackgroundTransparency = 1

-- ================= CONTENT =================
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,180,0,10)
content.Size = UDim2.new(1,-190,1,-20)
content.BackgroundTransparency = 1

local function page()
    local f = Instance.new("Frame", content)
    f.Size = UDim2.new(1,0,1,0)
    f.Visible = false
    f.BackgroundTransparency = 1
    return f
end

local basic = page()
local music = page()
local sky   = page()
local admin = page()
local troll = page()
local config = page()
basic.Visible = true

local function show(p)
    basic.Visible = false
    music.Visible = false
    sky.Visible = false
    admin.Visible = false
    troll.Visible = false
    config.Visible = false
    p.Visible = true
end

local function side(text,y,cb)
    local b = Instance.new("TextButton", sidebar)
    b.Text = text
    b.Position = UDim2.new(0,10,0,y)
    b.Size = UDim2.new(1,-20,0,34)
    b.BackgroundColor3 = Color3.fromRGB(40,45,90)
    b.TextColor3 = Color3.fromRGB(220,220,255)
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(cb)
end

side("Basic",80,function() show(basic) end)
side("Music",120,function() show(music) end)
side("Sky",160,function() show(sky) end)
side("Admin",200,function()
    if lp.UserId==7311640471 then
        show(admin)
    end
end)
side("Troll",240,function()
    if lp.UserId==7311640471 then
        show(troll)
    end
end)
side("Config",280,function() show(config) end)

-- ================= UI HELPERS =================
local function box(parent,ph,y)
    local b = Instance.new("TextBox", parent)
    b.PlaceholderText = ph
    b.Position = UDim2.new(0.05,0,y,0)
    b.Size = UDim2.new(0.9,0,0,30)
    b.BackgroundColor3 = Color3.fromRGB(35,40,80)
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b)
    return b
end

local function btn(parent,text,y,cb)
    local b = Instance.new("TextButton", parent)
    b.Text = text
    b.Position = UDim2.new(0.05,0,y,0)
    b.Size = UDim2.new(0.9,0,0,32)
    b.BackgroundColor3 = Color3.fromRGB(60,70,140)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(cb)
end

-- ================= BASIC =================
local speed = box(basic,"Speed",0.05)
local jump  = box(basic,"Jump",0.13)

btn(basic,"Apply Speed / Jump",0.21,function()
    local h = lp.Character and lp.Character:FindFirstChild("Humanoid")
    if h then
        if tonumber(speed.Text) then h.WalkSpeed = tonumber(speed.Text) end
        if tonumber(jump.Text) then h.JumpPower = tonumber(jump.Text) end
    end
end)

-- Fly
local flying=false
btn(basic,"Fly",0.31,function()
    flying = not flying
    local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if flying then
        local bv = Instance.new("BodyVelocity",hrp)
        bv.Name="Fly"
        bv.MaxForce=Vector3.new(9e9,9e9,9e9)
        RunService.RenderStepped:Connect(function()
            if bv.Parent then
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector*80
            end
        end)
    else
        if hrp:FindFirstChild("Fly") then hrp.Fly:Destroy() end
    end
end)

-- Noclip
local noclip=false
RunService.Stepped:Connect(function()
    if noclip and lp.Character then
        for _,v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide=false end
        end
    end
end)
btn(basic,"Noclip",0.41,function() noclip = not noclip end)

-- Fling
btn(basic,"Fling",0.51,function()
    local hrp=lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.Velocity=Vector3.new(9999,9999,9999)
        hrp.RotVelocity=Vector3.new(9999,9999,9999)
    end
end)

-- ================= MUSIC =================
local sound=Instance.new("Sound",workspace)
local musicBox = box(music,"Music ID",0.25)
btn(music,"Play",0.38,function()
    if musicBox.Text~="" then
        sound.SoundId="rbxassetid://"..musicBox.Text
        sound.Looped=true
        sound:Play()
    end
end)
btn(music,"Stop",0.48,function() sound:Stop() end)

-- ================= SKY =================
local skyClone
btn(sky,"SkyBox (Clone no Céu)",0.3,function()
    if skyClone then skyClone:Destroy() end
    local char=lp.Character
    if not char then return end
    skyClone=char:Clone()
    skyClone.Parent=workspace
    for _,v in pairs(skyClone:GetDescendants()) do
        if v:IsA("Script") or v:IsA("LocalScript") then v:Destroy() end
    end
    local hrp=skyClone:FindFirstChild("")
    if hrp then
        hrp.CFrame=CFrame.new(0,500,0)
        hrp.Anchored=true
    end
end)

-- ================= ADMIN =================
btn(admin,"Fly Ultra",0.05,function()
    local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = hrp.CFrame + Vector3.new(0,100,0)
    end
end)
btn(admin,"Scale Player",0.15,function()
    local h = lp.Character and lp.Character:FindFirstChild("Humanoid")
    if h then h.BodyHeightScale.Value = 5 end
end)

-- ================= TROLL =================
btn(troll,"NUKE Visual",0.05,function()
    local bomb = Instance.new("Part", workspace)
    bomb.Shape = Enum.PartType.Ball
    bomb.Size = Vector3.new(8,8,8)
    bomb.Material = Enum.Material.Neon
    bomb.Color = Color3.fromRGB(255,60,60)
    bomb.Position = (lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and lp.Character.HumanoidRootPart.Position + Vector3.new(0,200,0)) or Vector3.new(0,200,0)
    bomb.Anchored = false
    bomb.CanCollide = false

    local bv = Instance.new("BodyVelocity", bomb)
    bv.MaxForce = Vector3.new(9e9,9e9,9e9)
    bv.Velocity = Vector3.new(0,-120,0)

    bomb.Touched:Connect(function()
        if bomb then
            local ex = Instance.new("Explosion", workspace)
            ex.Position = bomb.Position
            ex.BlastRadius = 60
            ex.BlastPressure = 0
            bomb:Destroy()
            for _,p in pairs(workspace:GetDescendants()) do
                if p:IsA("BasePart") and not p:IsDescendantOf(lp.Character) then
                    p.Anchored = false
                end
            end
        end
    end)
    Debris:AddItem(bomb,10)
end)

-- ================= CONFIG =================
local bgColor = Color3.fromRGB(28,32,60)
local colorBox = box(config,"Background Color RGB (ex:255,255,255)",0.05)
btn(config,"Apply Background Color",0.15,function()
    local txt = colorBox.Text
    local r,g,b = txt:match("(%d+),(%d+),(%d+)")
    if r and g and b then
        bgColor = Color3.fromRGB(tonumber(r),tonumber(g),tonumber(b))
        main.BackgroundColor3 = bgColor
    end
end)
btn(config,"Reset Config",0.25,function()
    main.BackgroundColor3 = Color3.fromRGB(28,32,60)
    bgColor = Color3.fromRGB(28,32,60)
end)
