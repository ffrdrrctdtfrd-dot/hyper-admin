--================= HYPER ADMIN COM KEY =================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local lp = Players.LocalPlayer

local KEY = "HYPERKEY" -- Key fixa

--================= GUI ROOT =================
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false

-- FRAME DE KEY
local keyFrame = Instance.new("Frame", gui)
keyFrame.Size = UDim2.new(0,300,0,120)
keyFrame.Position = UDim2.new(0.5,-150,0.5,-60)
keyFrame.BackgroundColor3 = Color3.fromRGB(28,32,60)
Instance.new("UICorner", keyFrame)

local keyLabel = Instance.new("TextLabel", keyFrame)
keyLabel.Size = UDim2.new(1,0,0,40)
keyLabel.Position = UDim2.new(0,0,0,10)
keyLabel.Text = "Digite a Key:"
keyLabel.Font = Enum.Font.GothamBold
keyLabel.TextSize = 18
keyLabel.TextColor3 = Color3.fromRGB(140,180,255)
keyLabel.BackgroundTransparency = 1

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(0.8,0,0,30)
keyBox.Position = UDim2.new(0.1,0,0,50)
keyBox.BackgroundColor3 = Color3.fromRGB(35,40,80)
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.PlaceholderText = "Coloque a Key aqui"
Instance.new("UICorner", keyBox)

local enterBtn = Instance.new("TextButton", keyFrame)
enterBtn.Size = UDim2.new(0.6,0,0,30)
enterBtn.Position = UDim2.new(0.2,0,0,85)
enterBtn.Text = "Entrar"
enterBtn.Font = Enum.Font.GothamBold
enterBtn.TextSize = 16
enterBtn.TextColor3 = Color3.new(1,1,1)
enterBtn.BackgroundColor3 = Color3.fromRGB(80,90,160)
Instance.new("UICorner", enterBtn)

-- Função para criar toda a GUI do Hyper Admin
local function createHyperAdmin()
    -- BOTÃO FIXO (HA)
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
    main.Visible = true

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

    --================= SIDEBAR =================
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

    --================= CONTENT =================
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
    basic.Visible = true

    local function show(p)
        basic.Visible = false
        music.Visible = false
        sky.Visible   = false
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

    --================= UI HELPERS =================
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

    --================= BASIC =================
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

    -- Kick / Ban visual
    local function screen(t,d)
        local sg=Instance.new("ScreenGui",game.CoreGui)
        local bg=Instance.new("Frame",sg)
        bg.Size=UDim2.new(1,0,1,0)
        bg.BackgroundColor3=Color3.fromRGB(10,10,20)
        local tt=Instance.new("TextLabel",bg)
        tt.Size=UDim2.new(1,0,0.2,0)
        tt.Position=UDim2.new(0,0,0.35,0)
        tt.BackgroundTransparency=1
        tt.Text=t
        tt.TextColor3=Color3.fromRGB(255,80,80)
        tt.Font=Enum.Font.GothamBold
        tt.TextSize=46
        local dd=Instance.new("TextLabel",bg)
        dd.Size=UDim2.new(1,0,0.2,0)
        dd.Position=UDim2.new(0,0,0.5,0)
        dd.BackgroundTransparency=1
        dd.Text=d
        dd.TextColor3=Color3.new(1,1,1)
        dd.Font=Enum.Font.Gotham
        dd.TextSize=22
    end

    btn(basic,"Kick (Visual)",0.61,function()
        screen("Você foi expulso","Hyper Admin")
    end)

    local banBox = box(basic,"Nome para Ban",0.69)
    btn(basic,"Ban (Visual)",0.77,function()
        screen("Conta Banida","Jogador: "..(banBox.Text ~= "" and banBox.Text or "Player"))
    end)

    -- NUKE VISUAL
    btn(basic,"NUKE (Visual)",0.87,function()
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

    --================= MUSIC =================
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

    --================= SKY =================
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
end

-- Quando clicar em entrar, verifica a key
enterBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == KEY then
        keyFrame:Destroy()
        createHyperAdmin()
    else
        keyBox.Text = ""
        keyBox.PlaceholderText = "Key incorreta!"
    end
end)
