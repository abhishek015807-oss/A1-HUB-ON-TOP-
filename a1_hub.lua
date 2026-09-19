repeat task.wait() until game:IsLoaded()

ply = game:GetService("Players")
repeat task.wait() until ply.LocalPlayer
plr = ply.LocalPlayer

repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
Root = plr.Character.HumanoidRootPart

plr.CharacterAdded:Connect(function(char)
    task.spawn(function()
        Root = char:WaitForChild("HumanoidRootPart", 10) or char.PrimaryPart
    end)
end)

replicated = game:GetService("ReplicatedStorage")
TeleportService = game:GetService("TeleportService")
TW = game:GetService("TweenService")
Lighting = game:GetService("Lighting")
Enemies = workspace:WaitForChild("Enemies", 10) or workspace.Enemies
vim1 = game:GetService("VirtualInputManager")
vim2 = game:GetService("VirtualUser")
TeamSelf = plr.Team
RunSer = game:GetService("RunService")
Stats = game:GetService("Stats")

local function GetPlayerLevel()
    local level = 1
    pcall(function()
        if plr:FindFirstChild("Data") and plr.Data:FindFirstChild("Level") then
            level = plr.Data.Level.Value
        end
    end)
    return level
end
Lv = GetPlayerLevel()

Energy = 100
pcall(function()
    if plr.Character and plr.Character:FindFirstChild("Energy") then
        Energy = plr.Character.Energy.Value
    end
end)

BringConnections = {}
BossList = {}
MaterialList = {}
NPCList = {}
shouldTween = false
SoulGuitar = false
KenTest = true
debug = false
Brazier1 = false
Brazier2 = false
Brazier3 = false
Sec = 0.1
ClickState = 0
Num_self = 25
_G.TweenSpeed = 200

repeat local start = plr.PlayerGui:WaitForChild("Main"):WaitForChild("Loading") and game:IsLoaded() wait() until start
World1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089
Marines = function() replicated.Remotes.CommF_:InvokeServer("SetTeam","Marines") end
Pirates = function() replicated.Remotes.CommF_:InvokeServer("SetTeam","Pirates") end
if World1 then BossList = {"The Gorilla King","Chef","The Saw","Yeti","Mob Leader","Vice Admiral","Saber Expert","Warden","Chief Warden","Swan","Magma General","Fishman Lord","Sky Warlord","Lightning God","Cyborg","Ice Admiral","Greybeard"}
elseif World2 then BossList = {"Diamond","Jeremy","Orbitus","Don Swan","Smoke Admiral","Awakened Ice Admiral","Tide Keeper","Darkbeard","Cursed Captain","Order"}
elseif World3 then BossList = {"Stone","Hydra Leader","Kilo Admiral","Captain Elephant","Beautiful Pirate","Cake Queen","Dough King","Longma","Soul Reaper","rip_indra True Form","Tyrant of the Skies","The Gorilla God","Heaven's Guardian","Hell's Messenger"}
end
if World1 then MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail", "Lightning Bolt", "Yeti Fur"}
elseif World2 then MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang", "Fool's Gold", "Dark Fragment"}
elseif World3 then MaterialList = {"Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk", "Volt Capsule", "Fire Feather", "Moonstone", "Shark Tooth", "Mutant Tooth", "Terror Eyes", "Mirror Fractal", "Dragon Egg"}
end
local DungeonTables = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}
local RenMon = {"Snow Lurker","Arctic Warrior","Hidden Key","Awakened Ice Admiral"}
local CursedTables = {["Mob"] = "Mythological Pirate",["Mob2"] = "Cursed Skeleton","Hell's Messenger",["Mob3"] = "Cursed Skeleton","Heaven's Guardian"}
local Past = {"Part","SpawnLocation","Terrain","WedgePart","MeshPart"}
local BartMon = {"Swan Pirate","Jeremy"}
local CitizenTable = {"Forest Pirate","Captain Elephant"}
local Human_v3_Mob = {"Fajita","Jeremy","Diamond"}
local AllBoats = {"Beast Hunter","Lantern","Guardian","Grand Brigade","Dinghy","Sloop","The Sentinel"}
local mastery1 = {"Cookie Crafter"}
local mastery2 = {"Reborn Skeleton"}
local PosMsList = {["Pirate Millionaire"] = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625),["Pistol Billionaire"] = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625),["Dragon Crew Warrior"] = CFrame.new(7021.50439453125, 55.76270294189453, -730.1290893554688),["Dragon Crew Archer"] = CFrame.new(6625, 378, 244),["Female Islander"] = CFrame.new(4692.7939453125, 797.9766845703125, 858.8480224609375),["Venomous Assailant"] = CFrame.new(4902, 670, 39), ["Marine Commodore"] = CFrame.new(2401, 123, -7589),["Marine Rear Admiral"] = CFrame.new(3588, 229, -7085),["Fishman Raider"] = CFrame.new(-10941, 332, -8760),["Fishman Captain"] = CFrame.new(-11035, 332, -9087),["Forest Pirate"] = CFrame.new(-13446, 413, -7760),["Mythological Pirate"] = CFrame.new(-13510, 584, -6987),["Jungle Pirate"] = CFrame.new(-11778, 426, -10592),["Musketeer Pirate"] = CFrame.new(-13282, 496, -9565),["Reborn Skeleton"] = CFrame.new(-8764, 142, 5963),["Living Zombie"] = CFrame.new(-10227, 421, 6161),["Demonic Soul"] = CFrame.new(-9579, 6, 6194),["Posessed Mummy"] = CFrame.new(-9579, 6, 6194),["Peanut Scout"] = CFrame.new(-1993, 187, -10103),["Peanut President"] = CFrame.new(-2215, 159, -10474),["Ice Cream Chef"] = CFrame.new(-877, 118, -11032),["Ice Cream Commander"] = CFrame.new(-877, 118, -11032),["Cookie Crafter"] = CFrame.new(-2021, 38, -12028),["Cake Guard"] = CFrame.new(-2024, 38, -12026),["Baking Staff"] = CFrame.new(-1932, 38, -12848),["Head Baker"] = CFrame.new(-1932, 38, -12848),["Cocoa Warrior"] = CFrame.new(95, 73, -12309),["Chocolate Bar Battler"] = CFrame.new(647, 42, -12401),["Sweet Thief"] = CFrame.new(116, 36, -12478),["Candy Rebel"] = CFrame.new(47, 61, -12889),["Ghost"] = CFrame.new(5251, 5, 1111)}
local Remotes = {
    RFJobsRemoteFunction = replicated.Modules.Net["RF/JobsRemoteFunction"], 
    RFCraft = replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft")
}
EquipWeapon = function(text)
  if not text then return end
  if plr.Backpack:FindFirstChild(text) then
	plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(text))
  end
end
weaponSc = function(weapon)
  for __in, v in pairs(plr.Backpack:GetChildren()) do
    if v:IsA("Tool") then
      if v.ToolTip == weapon then EquipWeapon(v.Name) end
    end
  end
end
local Attack = {}
Attack.__index = Attack
Attack.Alive = function(model) if not model then return false end if model.Name:find("Cloud") or model.Name:find("Storm") then return true end local Humanoid = model:FindFirstChildOfClass("Humanoid") or model:FindFirstChild("Humanoid") return Humanoid and Humanoid.Health > 0 end
Attack.Pos = function(model,dist) return (Root.Position - mode.Position).Magnitude <= dist end
Attack.Dist = function(model,dist) return (Root.Position - model:FindFirstChild("HumanoidRootPart").Position).Magnitude <= dist end
Attack.DistH = function(model,dist) return (Root.Position - model:FindFirstChild("HumanoidRootPart").Position).Magnitude > dist end
Attack.Kill = function(model, Succes)
  if model and Succes then
    local mHRP = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
    if not mHRP then return end
    if not model:GetAttribute("Locked") then model:SetAttribute("Locked", mHRP.CFrame) end
    PosMon = model:GetAttribute("Locked").Position
    BringEnemy(model)
    EquipWeapon(_G.SelectWeapon)
    local char = plr.Character
    local Equipped = char and char:FindFirstChildOfClass("Tool")
    local ToolTip = Equipped and Equipped.ToolTip or ""
    if ToolTip == "Blox Fruit" then 
      _tp(mHRP.CFrame * CFrame.new(0,12,0) * CFrame.Angles(0,math.rad(90),0)) 
    else 
      _tp(mHRP.CFrame * CFrame.new(0,25,0) * CFrame.Angles(0,math.rad(180),0))
    end
    if RandomCFrame then 
      task.wait(0.1) _tp(mHRP.CFrame * CFrame.new(0, 25, 20)) 
      task.wait(0.1) _tp(mHRP.CFrame * CFrame.new(20, 25, 0)) 
      task.wait(0.1) _tp(mHRP.CFrame * CFrame.new(-20, 25, 0)) 
    end
  end
end
Attack.Kill2 = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
  EquipWeapon(_G.SelectWeapon)
  local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
  local ToolTip = Equipped.ToolTip
  if ToolTip == "Blox Fruit" then _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,10,0) * CFrame.Angles(0,math.rad(90),0)) else _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,30,8) * CFrame.Angles(0,math.rad(180),0))end
  if RandomCFrame then wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30 ,0)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))end
  end
end
Attack.KillSea = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
  EquipWeapon(_G.SelectWeapon)
  local Equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
  local ToolTip = Equipped.ToolTip
  if ToolTip == "Blox Fruit" then _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,10,0) * CFrame.Angles(0,math.rad(90),0)) else notween(model.HumanoidRootPart.CFrame * CFrame.new(0,50,8)) wait(.85)notween(model.HumanoidRootPart.CFrame * CFrame.new(0,400,0)) wait(1)end
  end
end
Attack.Sword = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
  weaponSc("Sword")
  _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
  if RandomCFrame then wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30 ,0)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)) wait(0.1)_tp(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))end
  end
end
Attack.Mas = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
    if model.Humanoid.Health <= HealthM then
      _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
      Useskills("Blox Fruit","Z")
      Useskills("Blox Fruit","X")
      Useskills("Blox Fruit","C")
    else
      weaponSc("Melee")
      _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
    end
  end
end
Attack.Masgun = function(model,Succes)
  if model and Succes then
  if not model:GetAttribute("Locked") then model:SetAttribute("Locked",model.HumanoidRootPart.CFrame) end
  PosMon = model:GetAttribute("Locked").Position
  BringEnemy()
    if model.Humanoid.Health <= HealthM then
      _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,35,8))
      Useskills("Gun","Z")
      Useskills("Gun","X")
    else
      weaponSc("Melee")
      _tp(model.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
    end
  end
end
GetPlayerPoints = function()
    local pts = 0
    pcall(function()
        if plr:FindFirstChild("Data") then
            local p = plr.Data:FindFirstChild("Points") or plr.Data:FindFirstChild("Point") or plr.Data:FindFirstChild("StatPoints")
            if p and p:IsA("ValueBase") then
                local v = tonumber(p.Value)
                if v and v > 0 then pts = v return end
            end
        end
        local dp = plr:FindFirstChild("Points") or plr:FindFirstChild("Point") or plr:FindFirstChild("StatPoints")
        if dp and dp:IsA("ValueBase") then
            local v = tonumber(dp.Value)
            if v and v > 0 then pts = v return end
        end
        if plr:FindFirstChild("leaderstats") then
            local p = plr.leaderstats:FindFirstChild("Points") or plr.leaderstats:FindFirstChild("Point") or plr.leaderstats:FindFirstChild("StatPoints")
            if p and p:IsA("ValueBase") then
                local v = tonumber(p.Value)
                if v and v > 0 then pts = v return end
            end
        end
        local attr = plr:GetAttribute("Points") or plr:GetAttribute("StatPoints")
        if type(attr) == "number" and attr > 0 then
            pts = attr return
        end
        local pGui = plr:FindFirstChild("PlayerGui")
        if pGui then
            local main = pGui:FindFirstChild("Main")
            local statsFrame = (main and main:FindFirstChild("Stats")) or pGui:FindFirstChild("StatsRoot")
            if statsFrame then
                for _, desc in ipairs(statsFrame:GetDescendants()) do
                    if desc:IsA("TextLabel") and desc.Visible then
                        local txt = desc.Text or ""
                        if txt:lower():find("point") then
                            local num = tonumber(txt:match("%d+"))
                            if num and num > 0 then pts = num return end
                        end
                    end
                end
            end
        end
    end)
    return pts
end

pSats = 10
getgenv().pSats = 10

statsSetings = function(Num, value)
    local commF = nil
    pcall(function()
        commF = (replicated:FindFirstChild("Remotes") and replicated.Remotes:FindFirstChild("CommF_"))
        if not commF then
            commF = replicated:WaitForChild("Remotes", 2):WaitForChild("CommF_", 2)
        end
    end)
    if not commF then return end

    local statMap = {
        ["Melee"] = "Melee",
        ["Defense"] = "Defense",
        ["Sword"] = "Sword",
        ["Gun"] = "Gun",
        ["Devil"] = "Demon Fruit",
        ["Demon Fruit"] = "Demon Fruit",
        ["Fruit"] = "Demon Fruit",
        ["Blox Fruit"] = "Demon Fruit"
    }
    local statName = statMap[Num] or Num
    local curPoints = GetPlayerPoints()
    local spend = math.max(1, math.floor(tonumber(value) or tonumber(pSats) or tonumber(getgenv().pSats) or 10))
    if curPoints > 0 and spend > curPoints then
        spend = curPoints
    end
    if curPoints > 0 then
        pcall(function()
            commF:InvokeServer("AddPoint", statName, spend)
        end)
    end
end
local function CleanupMobPull(mob)
    if not mob then return end
    pcall(function()
        local mRoot = mob:FindFirstChild("HumanoidRootPart") or mob.PrimaryPart
        if mRoot then
            local bp = mRoot:FindFirstChild("made_by_me_the_opdevPull")
            if bp then bp:Destroy() end
            mRoot.CanCollide = true
        end
    end)
end

local function IsValidLivingEnemy(enemy)
    if not enemy or not enemy.Parent then return false end
    if enemy:GetAttribute("IsBoat") or enemy:GetAttribute("Dead") == true then return false end
    local char = plr.Character
    if enemy == char or (game:GetService("Players"):GetPlayerFromCharacter(enemy) and enemy ~= char) then return false end
    local eHum = enemy:FindFirstChild("Humanoid") or enemy:FindFirstChildOfClass("Humanoid")
    local eRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy.PrimaryPart
    if not eHum or not eRoot then return false end
    if eHum.Health <= 0 or eHum:GetState() == Enum.HumanoidStateType.Dead then
        CleanupMobPull(enemy)
        return false
    end
    return true
end

GroupAreaMobs = function(mobs, targetCenterPos)
    pcall(function()
        if sethiddenproperty then
            sethiddenproperty(plr, "SimulationRadius", math.huge)
        end
    end)
    local char = plr.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    for _, mob in ipairs(mobs) do
        if IsValidLivingEnemy(mob) then
            local mRoot = mob:FindFirstChild("HumanoidRootPart") or mob.PrimaryPart
            local mHum = mob:FindFirstChild("Humanoid") or mob:FindFirstChildOfClass("Humanoid")
            local dist = root and (mRoot.Position - root.Position).Magnitude or 0
            if dist <= 350 then
                pcall(function()
                    if mHum then
                        mHum.WalkSpeed = 0
                        mHum.JumpPower = 0
                        if mHum:FindFirstChild("Animator") then
                            mHum.Animator:Destroy()
                        end
                    end
                    mRoot.CanCollide = false
                    mRoot.Velocity = Vector3.zero
                    mRoot.RotVelocity = Vector3.zero
                    mRoot.CFrame = CFrame.new(targetCenterPos.X, targetCenterPos.Y, targetCenterPos.Z)

                    if sethiddenproperty then
                        sethiddenproperty(mRoot, "NetworkIsSleeping", false)
                    end

                    local bp = mRoot:FindFirstChild("made_by_me_the_opdevPull")
                    if not bp then
                        bp = Instance.new("BodyPosition")
                        bp.Name = "made_by_me_the_opdevPull"
                        bp.MaxForce = Vector3.new(1e6, 1e6, 1e6)
                        bp.P = 15000
                        bp.D = 600
                        bp.Parent = mRoot
                    end
                    bp.Position = targetCenterPos
                end)
            end
        else
            CleanupMobPull(mob)
        end
    end
end

BringEnemy = function(Mon)
    if not _B then return end
    if not Mon then 
        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local closestDist = math.huge
        for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
            if IsValidLivingEnemy(enemy) then
                local root = enemy:FindFirstChild("HumanoidRootPart") or enemy.PrimaryPart
                local dist = (root.Position - hrp.Position).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    Mon = enemy
                end
            end
        end
        if not Mon then return end
    end
    
    local mRoot = Mon:FindFirstChild("HumanoidRootPart") or Mon.PrimaryPart
    if not mRoot then return end
    local targetPos = mRoot.Position
    local cluster = {}
    for _, v in ipairs(workspace.Enemies:GetChildren()) do
        if IsValidLivingEnemy(v) and v.Name == Mon.Name then
            local vRoot = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
            if vRoot and (vRoot.Position - targetPos).Magnitude <= 350 then
                table.insert(cluster, v)
            end
        end
    end
    GroupAreaMobs(cluster, targetPos)
end
Useskills = function(weapon, skill)
  if weapon == "Melee" then
    weaponSc("Melee")
    if skill == "Z" then
      vim1:SendKeyEvent(true, "Z", false, game);
      vim1:SendKeyEvent(false, "Z", false, game);
    elseif skill == "X" then
      vim1:SendKeyEvent(true, "X", false, game);
      vim1:SendKeyEvent(false, "X", false, game);
    elseif skill == "C" then
      vim1:SendKeyEvent(true, "C", false, game);
      vim1:SendKeyEvent(false, "C", false, game);
    end
  elseif weapon == "Sword" then
    weaponSc("Sword")
    if skill == "Z" then
      vim1:SendKeyEvent(true, "Z", false, game);
      vim1:SendKeyEvent(false, "Z", false, game);
    elseif skill == "X" then
      vim1:SendKeyEvent(true, "X", false, game);
      vim1:SendKeyEvent(false, "X", false, game);
    end
  elseif weapon == "Blox Fruit" then
    weaponSc("Blox Fruit")
    if skill == "Z" then
      vim1:SendKeyEvent(true, "Z", false, game);
      vim1:SendKeyEvent(false, "Z", false, game);
    elseif skill == "X" then
      vim1:SendKeyEvent(true, "X", false, game);
      vim1:SendKeyEvent(false, "X", false, game);
    elseif skill == "C" then
      vim1:SendKeyEvent(true, "C", false, game);
      vim1:SendKeyEvent(false, "C", false, game);        
    elseif skill == "V" then
      vim1:SendKeyEvent(true, "V", false, game);
      vim1:SendKeyEvent(false, "V", false, game);
    end
  elseif weapon == "Gun" then
    weaponSc("Gun")
    if skill == "Z" then
      vim1:SendKeyEvent(true, "Z", false, game);
      vim1:SendKeyEvent(false, "Z", false, game);
    elseif skill == "X" then
      vim1:SendKeyEvent(true, "X", false, game);
      vim1:SendKeyEvent(false, "X", false, game);
    end
  end
  if weapon == "nil" and skill == "Y" then
    vim1:SendKeyEvent(true, "Y", false, game);
    vim1:SendKeyEvent(false, "Y", false, game);
  end
end
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall = newcclosure(function(...)
  local method = getnamecallmethod()
  local args = {...}    
    if tostring(method) == "FireServer" then
      if tostring(args[1]) == "RemoteEvent" then
        if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
          if (_G.FarmMastery_G and not SoulGuitar) or (_G.FarmMastery_Dev) or (_G.FarmBlazeEM) or (_G.Prehis_Skills) or (_G.SeaBeast1 or _G.FishBoat or _G.PGB or _G.Leviathan1 or _G.Complete_Trials) or (_G.AimMethod and ABmethod == "Aim Player") or (_G.AimMethod and ABmethod == "Nearest Aim") then
            args[2] = MousePos
            return old(unpack(args))
          end
        end
      end
    end
  return old(...)
end)
GetConnectionEnemies = function(a)
  -- Always search Workspace.Enemies FIRST!
  for _, v in ipairs(workspace.Enemies:GetChildren()) do
    if v:IsA("Model") and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) then
      local hum = v:FindFirstChild("Humanoid") or v:FindFirstChildOfClass("Humanoid")
      local hrp = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
      if hum and hrp and hum.Health > 0 then
        return v
      end
    end
  end
  -- Fallback check in Workspace
  for _, v in ipairs(workspace:GetChildren()) do
    if v:IsA("Model") and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) then
      local hum = v:FindFirstChild("Humanoid") or v:FindFirstChildOfClass("Humanoid")
      local hrp = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
      if hum and hrp and hum.Health > 0 and not game.Players:GetPlayerFromCharacter(v) then
        return v
      end
    end
  end
  return nil
end
LowCpu = function()
  local decalsyeeted = true
  local g = game
  local w = g.Workspace
  local l = g.Lighting
  local t = w.Terrain
  t.WaterWaveSize = 0
  t.WaterWaveSpeed = 0
  t.WaterReflectance = 0
  t.WaterTransparency = 0
  l.GlobalShadows = false
  l.FogEnd = 9e9
  l.Brightness = 0
  settings().Rendering.QualityLevel = "Level01"
  for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
      v.Material = "Plastic"
      v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
      v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
      v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
      v.BlastPressure = 1
      v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
      v.Enabled = false
    elseif v:IsA("MeshPart") then
      v.Material = "Plastic"
      v.Reflectance = 0
      v.TextureID = 10385902758728957
    end
  end
  for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
      e.Enabled = false
    end
  end
end
CheckF = function()
  if GetBP("Dragon-Dragon") or GetBP("Gas-Gas") or GetBP("Yeti-Yeti") or GetBP("Kitsune-Kitsune") or GetBP("T-Rex-T-Rex") then return true end
end
CheckBoat = function()
  for i, v in pairs(workspace.Boats:GetChildren()) do
    if tostring(v.Owner.Value) == tostring(plr.Name) then
      return v    
end;
  end;
  return false
end;
CheckEnemiesBoat = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if (v.Name == "FishBoat") and v:FindFirstChild("Health").Value > 0 then
      return true    
end;
  end;
  return false
end;
CheckPirateGrandBrigade = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if (v.Name == "PirateGrandBrigade" or v.Name == "PirateBrigade") and v:FindFirstChild("Health").Value > 0 then
      return true
    end
  end
  return false
end
CheckShark = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if v.Name == "Shark" and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckTerrorShark = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if v.Name == "Terrorshark" and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckPiranha = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if v.Name == "Piranha" and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckFishCrew = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if (v.Name == "Fish Crew Member" or v.Name == "Haunted Crew Member") and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckHauntedCrew = function()
  for _,v in pairs(workspace.Enemies:GetChildren()) do
    if (v.Name == "Haunted Crew Member") and Attack.Alive(v) then
      return true    
end;
  end;
  return false
end;
CheckSeaBeast = function()
  if workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
    return true  
end;
  return false
end;
CheckLeviathan = function()
  if workspace.SeaBeasts:FindFirstChild("Leviathan") then
    return true  
end;
  return false
end;
UpdStFruit = function()
  for z,x in next, plr.Backpack:GetChildren() do
  StoreFruit = x:FindFirstChild("EatRemote", true)
    if StoreFruit then
      replicated.Remotes.CommF_:InvokeServer("StoreFruit",StoreFruit.Parent:GetAttribute("OriginalName"),
      plr.Backpack:FindFirstChild(x.Name))
    end
  end
end
collectFruits = function(Succes)
  if Succes then
    local Character = plr.Character
    for _,v1 in pairs(workspace:GetChildren()) do
    if string.find(v1.Name, "Fruit") then v1.Handle.CFrame = Character.HumanoidRootPart.CFrame end
    end
  end
end
Getmoon = function()
  if World1 then
    return Lighting.FantasySky.MoonTextureId
  elseif World2 then
    return Lighting.FantasySky.MoonTextureId
  elseif World3 then
    return Lighting.Sky.MoonTextureId
  end
end
DropFruits = function()
  for _,v3 in next, plr.Backpack:GetChildren() do
    if string.find(v3.Name, "Fruit") then
      EquipWeapon(v3.Name) wait(.1)
      if plr.PlayerGui.Main.Dialogue.Visible == true then plr.PlayerGui.Main.Dialogue.Visible = false end EquipWeapon(v3.Name) plr.Character:FindFirstChild(v3.Name).EatRemote:InvokeServer("Drop")
    end
  end
  for a,b2 in pairs(plr.Character:GetChildren()) do
    if string.find(b2.Name, "Fruit") then EquipWeapon(b2.Name) wait(.1)
    if plr.PlayerGui.Main.Dialogue.Visible == true then plr.PlayerGui.Main.Dialogue.Visible = false end EquipWeapon(b2.Name) plr.Character:FindFirstChild(b2.Name).EatRemote:InvokeServer("Drop")
    end
  end
end
local function SafeGetInventory()
    local ok, res = pcall(function()
        return replicated.Remotes.CommF_:InvokeServer("getInventory")
    end)
    return (ok and typeof(res) == "table") and res or {}
end

local function SafeGetInventoryFruits()
    local ok, res = pcall(function()
        return replicated.Remotes.CommF_:InvokeServer("getInventoryFruits")
    end)
    return (ok and typeof(res) == "table") and res or {}
end

local function SafeGetFruits()
    local ok, res = pcall(function()
        return replicated.Remotes.CommF_:InvokeServer("GetFruits")
    end)
    return (ok and typeof(res) == "table") and res or {}
end

GetBP = function(v)
  return plr.Backpack:FindFirstChild(v) or plr.Character:FindFirstChild(v)
end
GetIn = function(Name)
  for _ ,v1 in pairs(SafeGetInventory()) do
    if type(v1) == "table" then
      if v1.Name == Name or plr.Character:FindFirstChild(Name) or plr.Backpack:FindFirstChild(Name) then
        return true
	 end
    end
  end
  return false
end
GetM = function(Name)
  for _,tab in pairs(SafeGetInventory()) do
    if type(tab) == "table" then
	  if tab.Type == "Material" then
	    if tab.Name == Name then
		  return tab.Count
	    end
	  end
    end
  end
return 0
end
GetWP = function(nametool)
  for _,v4 in pairs(SafeGetInventory()) do
    if type(v4) == "table" then
      if v4.Type == "Sword" then
        if v4.Name == nametool or plr.Character:FindFirstChild(nametool) or plr.Backpack:FindFirstChild(nametool) then
	     return true
	     end
	   end
      end
    end
  return false
end 
getInfinity_Ability = function(Method, Var)
  if not Root then return end
  if Method == "Soru" and Var then
    for _,gc in next, (getgc and getgc() or {}) do
      if plr.Character.Soru then
        if ((typeof(gc) == "function") and (getfenv(gc).script == plr.Character.Soru)) then
          for _, v in next, (getupvalues and getupvalues(gc) or {}) do
            if (typeof(v) == "table") then
              repeat wait(Sec) v.LastUse = 0 until not Var or (plr.Character.Humanoid.Health <= 0)
            end
          end
        end
      end
    end    
  elseif Method == "Energy" and Var then
    plr.Character.Energy.Changed:connect(function()
      if Var then plr.Character.Energy.Value = Energy end 
    end)
  elseif Method == "Observation" and Var then
    local VisionRadius = plr.VisionRadius
    VisionRadius.Value = math.huge
  end
end
Hop = function()
  pcall(function()
    for count = math.random(1, math.random(40, 75)), 100 do
      local remote = replicated.__ServerBrowser:InvokeServer(count)
	  for _, v in next, remote do
	  if tonumber(v['Count']) < 12 then TeleportService:TeleportToPlaceInstance(game.PlaceId, _) end
	  end    
    end
  end)
end
local block = Instance.new("Part", workspace)
block.Size = Vector3.new(1, 1, 1)
block.Name = "Rip_Indra"
block.Anchored = true
block.CanCollide = false
block.CanTouch = false
block.Transparency = 1
local blockfind = workspace:FindFirstChild(block.Name)
if blockfind and blockfind ~= block then blockfind:Destroy() end
task.spawn(function()
    while task.wait(0.05) do
        if block and block.Parent == workspace then
            -- OnFarm is true ONLY while a tween is actively playing
            local isTweening = (_G.CurrentTween ~= nil) and (_G.CurrentTween.PlaybackState == Enum.PlaybackState.Playing)
            getgenv().OnFarm = isTweening
        else
            getgenv().OnFarm = false
        end
    end
end)

task.spawn(function()
    local a = game.Players.LocalPlayer
    repeat task.wait() until a.Character and a.Character.PrimaryPart
    block.CFrame = a.Character.PrimaryPart.CFrame

    a.CharacterAdded:Connect(function(newChar)
        task.spawn(function()
            local hrp = newChar:WaitForChild("HumanoidRootPart", 5)
            if hrp and block then
                block.CFrame = hrp.CFrame
            end
        end)
    end)

    -- Heartbeat: lock character to block when tweening; keep block at character when idle!
    game:GetService("RunService").Heartbeat:Connect(function()
        pcall(function()
            local char = a.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp or not hum or hum.Health <= 0 then return end

            local isTweening = (_G.CurrentTween ~= nil) and (_G.CurrentTween.PlaybackState == Enum.PlaybackState.Playing)
            if isTweening and block and block.Parent == workspace then
                hrp.CFrame = block.CFrame
                if hrp.Velocity.Magnitude > 2 then
                    hrp.Velocity = Vector3.new(0, 0, 0)
                    hrp.RotVelocity = Vector3.new(0, 0, 0)
                end
            elseif block and block.Parent == workspace then
                -- When NOT actively tweening, block ALWAYS stays at character position!
                -- This completely eliminates the "snap back to idle position" bug!
                block.CFrame = hrp.CFrame
            end
        end)
    end)

    -- Stepped: disable character collision only while actively tweening
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            local isTweening = (_G.CurrentTween ~= nil) and (_G.CurrentTween.PlaybackState == Enum.PlaybackState.Playing)
            if isTweening then
                local char = a.Character
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end)
    end)
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

sea1 = (game.PlaceId == 2753915549 or game.PlaceId == 85211729168715)
sea2 = (game.PlaceId == 4442272183 or game.PlaceId == 79091703265657)
sea3 = (game.PlaceId == 7449423635 or game.PlaceId == 100117331123089)

local Settings = {
    ["Tween Speed"] = 180,
    ["Bypass Teleport"] = false,
    ["Up Y"] = false,
    ["Up Y When Low Health"] = false,
    ["Same Y"] = false
}

local newdao = CFrame.new(10641.0918, -1953.92981, 9825.07031, -0.652825892, -9.2805891e-08, -0.757508039, -2.73638356e-08, 1, -9.89323823e-08, 0.757508039, -4.38572947e-08, -0.652825892)
local cframenpc = CFrame.new(-16271.126, 25.5847301, 1371.98755, 0.999396622, -5.78875188e-08, -0.0347310975, 5.52972779e-08, 1, -8.7544322e-08, 0.034731105, 8.28877091e-08, 0.999396741)

function Convert_CFrame(x)
    if not x then return end
    if typeof(x) == "Vector3" then
        return CFrame.new(x)
    elseif typeof(x) == "CFrame" then
        return x
    elseif typeof(x) == "Model" then
        return x:GetPivot()
    elseif x.CFrame then
        return x.CFrame
    end
    return nil
end

function GetDistance(POS_1, POS_2, NO_Y)
    if POS_1 == nil then return 9e9 end
    
    local Character = LocalPlayer.Character
    if not Character then return 9e9 end
    
    local Humanoid = Character:FindFirstChild("Humanoid")
    if not Humanoid or Humanoid.Health <= 0 then
        return 9e9
    end
    
    if POS_2 == nil then
        POS_2 = Character:FindFirstChild("HumanoidRootPart")
        if not POS_2 then return 9e9 end
    end
    
    local pos1 = Convert_CFrame(POS_1)
    local pos2 = Convert_CFrame(POS_2)
    
    if NO_Y then
        return (Vector3.new(pos1.X, 0, pos1.Z) - Vector3.new(pos2.X, 0, pos2.Z)).Magnitude
    else
        return (pos1.Position - pos2.Position).Magnitude
    end
end

function InArea(POS)
    local WorldOrigin = workspace:FindFirstChild("_WorldOrigin")
    if not WorldOrigin then return {Name = ""} end
    
    local pos = Convert_CFrame(POS)
    for i,v in next, WorldOrigin.Locations:GetChildren() do
        if v:FindFirstChild("Mesh") and (pos.Position - v.Position).Magnitude <= v.Mesh.Scale.X then
            return v
        end
    end
    return {Name = ""}
end

function GetSpawnPoint(x)
    local Spawns = workspace:FindFirstChild("_WorldOrigin") 
        and workspace._WorldOrigin:FindFirstChild("PlayerSpawns") 
        and workspace._WorldOrigin.PlayerSpawns:FindFirstChild("Pirates")
    if not Spawns then return end
    
    for i,v in next, Spawns:GetChildren() do
        if v:FindFirstChild("Part") and (v.Part.Position - x.Position).Magnitude <= 2500 then
            return v
        end
    end
end

function CheckLegendaryItems()
    local function CheckItem(ITEM_NAME)
        for i,v in next, LocalPlayer.Backpack:GetChildren() do
            if v:IsA('Tool') and (v.Name == ITEM_NAME or string.find(v.Name, ITEM_NAME)) then 
                return v 
            end
        end
        for i,v in next, LocalPlayer.Character:GetChildren() do
            if v:IsA('Tool') and (v.Name == ITEM_NAME or string.find(v.Name, ITEM_NAME)) then 
                return v 
            end
        end
    end
    
    if CheckItem("God's Chalice") or CheckItem("Fist of Darkness") or CheckItem("Sweet Chalice") or CheckItem("Hallow Essence") or CheckItem("Flower1") then
        return true
    end
    return false
end

function WaitForHumanoid()
    local Character = LocalPlayer.Character
    if not Character then return nil end
    
    local Humanoid = Character:FindFirstChild("Humanoid")
    if Humanoid then return Humanoid end
    
    local timeout = tick() + 5
    while tick() < timeout do
        Humanoid = Character:FindFirstChild("Humanoid")
        if Humanoid then return Humanoid end
        task.wait(0.1)
    end
    return nil
end

function checkinventory(v)
    if v then
        for i, vl in pairs(SafeGetInventory()) do
            if vl.Name == v then
                return true
            end
        end
    end
    return false
end

function getdis(a,b)
    b = b or LocalPlayer.Character.HumanoidRootPart.CFrame
    local _a = CFrame.new(a.X, b.Y, a.Z)
    local _b = CFrame.new(b.X,b.Y,b.Z)
    return (_a.Position - _b.Position).Magnitude
end

function CanBypassTeleport(x)
    local AreaName = InArea(x).Name
    if AreaName == "" then return false end
    
    if not Settings["Bypass Teleport"] 
        or AreaName:find("Dimension") 
        or AreaName:find("Submerged") 
        or AreaName == "Sealed Cavern" 
        or AreaName:lower():find("under") 
        or CheckLegendaryItems() then
        return false
    end
    
    if LocalPlayer.Data and LocalPlayer.Data.LastSpawnPoint and LocalPlayer.Data.LastSpawnPoint.Value == "SubmergedIsland" then 
        return false 
    end
    
    if GetDistance(x.Position) <= 3500 then
        return false
    end
    
    return true
end

function GetBypassCFrame(x)
    local Max = math.huge
    local Pos
    local Spawns = workspace._WorldOrigin.PlayerSpawns.Pirates:GetChildren()
    local HRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not HRP then return nil end
    
    for i,v in next, Spawns do
        if v:FindFirstChild("Part") then
            if (x.Position - HRP.Position).Magnitude >= 3000 
            and GetSpawnPoint(v.Part) ~= GetSpawnPoint(HRP) 
            and (v.Part.Position - HRP.Position).Magnitude <= 10000 
            and (v.Part.Position - x.Position).Magnitude <= Max then
                Max = (v.Part.Position - x.Position).Magnitude
                Pos = v
            end
        end
    end
    return Pos
end

function BypassTP(Target)
    local Character = LocalPlayer.Character
    if not Character then return end
    
    local Humanoid = WaitForHumanoid()
    if not Humanoid or Humanoid.Health <= 0 then return end
    
    if CanBypassTeleport(Target) and GetBypassCFrame(Target) then
        local TargetTP = GetBypassCFrame(Target)
        if TargetTP and TargetTP:FindFirstChild("Part") then
            Character.LastSpawnPoint.Disabled = true
            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", TargetTP.Name)
            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
            Character:PivotTo(TargetTP.Part.CFrame)
            Humanoid:ChangeState(15)
            
            repeat 
                task.wait() 
            until LocalPlayer.Character and WaitForHumanoid() and WaitForHumanoid().Health > 0
        end
    end
end

function totopofgreattree()
    if getdis(CFrame.new(28310.0234, 14895.1123, 109.456741)) > 1500 then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741))
        wait(0.3)
    end
    
    local targetCF = CFrame.new(28607.5352, 14896.5449, 106.011726)
    _tp(targetCF)
    
    repeat
        wait()
    until getdis(targetCF) <= 5
    
    wait(0.5)
    for i = 1, 4 do
        ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
    end
end

function requestentrance(pos)
    local tb = {}
    local targetPos = pos
    
    if typeof(pos) == "CFrame" then
        targetPos = pos.Position
    end
    
    if sea1 then
        tb = {
            ["Sky3"] = Vector3.new(-7894, 5547, -380),
            ["Sky3Exit"] = Vector3.new(-4607, 874, -1667),
            ["UnderWater"] = Vector3.new(61163, 11, 1819),
            ["Underwater City"] = Vector3.new(61165.19140625, 0.18704631924629211, 1897.379150390625),
            ["Pirate Village"] = Vector3.new(-1242.4625244140625, 4.787059783935547, 3901.282958984375),
            ["UnderwaterExit"] = Vector3.new(4050, -1, -1814)
        }
    elseif sea2 then
        tb = {
            ["Swan Mansion"] = Vector3.new(-390, 332, 673),
            ["Swan Room"] = Vector3.new(2285, 15, 905),
            ["Cursed Ship"] = Vector3.new(923, 126, 32852),
            ["Zombie Island"] = Vector3.new(-6509, 83, -133)
        }
    else
        tb = {
            ["Hydra Island"] = Vector3.new(5657.88623046875, 1013.0790405273438, -335.4996337890625),
            ["Mansion"] = Vector3.new(-12462, 375, -7552),
            ["Castle"] = Vector3.new(-5036, 315, -3179),
            ["Temple of Time"] = Vector3.new(28286, 14897, 103),
            ["Greate Tree"] = Vector3.new(3024.1709, 2280.69434, -7325.12793)
        }
        if not checkinventory("Valkyrie Helm") then
            return
        end
    end
    
    local x, y = nil, math.huge
    for i, v in pairs(tb) do
        local distance = (typeof(v) == "Vector3" and (v - targetPos).Magnitude) or (v.Position - targetPos).Magnitude
        if distance < y then
            y = distance
            x = v
        end
    end
    
    if x and y and y < getdis(pos) then
        pcall(function ()
            if _G.TweenCache then
                _G.TweenCache:Cancel()
            end
        end)
        
        if typeof(x) == "Vector3" 
            and x.X == 3024.1709 and x.Y == 2280.69434 and x.Z == -7325.12793
            and ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") >= 2 then
            totopofgreattree()
            wait(1)
        elseif y < getdis(pos) then
            local requestPos = typeof(x) == "Vector3" and x or x.Position
            ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", requestPos)
            wait(1)
        end
    end
end

_tp = function(target)
    local gg
    if typeof(target) == "Vector3" then
        gg = CFrame.new(target)
    elseif typeof(target) == "CFrame" then
        gg = target
    else
        gg = target and target.CFrame
    end
    
    if not gg then return end
    
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = character.HumanoidRootPart
    local hum = character:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then
        if _G.CurrentTween then
            pcall(function() _G.CurrentTween:Cancel() end)
            _G.CurrentTween = nil
        end
        _G.CurrentTweenTarget = nil
        return
    end

    local distance = (gg.Position - rootPart.Position).Magnitude

    -- Fast arrival: already within 3 studs
    if distance < 3 then
        if _G.CurrentTween and _G.CurrentTween.PlaybackState == Enum.PlaybackState.Playing then
            pcall(function() _G.CurrentTween:Cancel() end)
            _G.CurrentTween = nil
        end
        _G.CurrentTweenTarget = nil
        block.CFrame = gg
        rootPart.CFrame = gg
        return
    end

    -- Deduplication: if already smoothly tweening to this exact target (within 10 studs), let it play uninterrupted!
    if _G.CurrentTween and _G.CurrentTween.PlaybackState == Enum.PlaybackState.Playing and _G.CurrentTweenTarget then
        if (_G.CurrentTweenTarget.Position - gg.Position).Magnitude <= 10 then
            return _G.CurrentTween
        end
    end

    -- Cancel old tween cleanly without corrupting state
    _G.TweenGen = (_G.TweenGen or 0) + 1
    local myGen = _G.TweenGen
    if _G.CurrentTween then
        pcall(function() _G.CurrentTween:Cancel() end)
        _G.CurrentTween = nil
    end

    -- Bypass teleport if enabled
    pcall(function()
        if CanBypassTeleport and CanBypassTeleport(gg) then
            BypassTP(gg)
            task.wait(0.5)
        end
    end)
    
    -- Sub-area entrance check with 3s debounce to avoid remote spam
    if tick() - (_G.LastEntranceReq or 0) > 3 then
        pcall(function()
            requestentrance(target)
        end)
        _G.LastEntranceReq = tick()
    end
    
    -- Sea 3 Submerged Island elevator handler
    if sea3 and newdao and getdis and getdis(gg.Position, newdao.Position) < 2000 then
        local hrp = plr.Character.HumanoidRootPart
        if math.abs(newdao.Position.Y - hrp.CFrame.Y) > 1000 then
            repeat
                task.wait()
                old_tp(cframenpc)
                if getdis(cframenpc) < 10 then
                    local net = ReplicatedStorage.Modules.Net
                    net["RF/SubmarineWorkerSpeak"]:InvokeServer("AskKilledTikiBoss")
                    task.wait(0.5)
                    net["RF/SubmarineWorkerSpeak"]:InvokeServer("TravelToSubmergedIsland")
                end
            until getdis(gg.Position) < 2000
            task.wait(0.6)
            pcall(function()
                if hrp:FindFirstChild("BodyClip") then
                    hrp.BodyClip:Destroy()
                end
            end)
        end
    end
    
    -- Ensure player is unseated so they never get stuck in chairs or boats
    if hum.Sit then
        hum.Sit = false
        hum:ChangeState(Enum.HumanoidStateType.Running)
    end
    if hum.PlatformStand then
        hum.PlatformStand = false
    end
    
    -- Ensure BodyClip exists with high MaxForce to suspend gravity and prevent anti-cheat reset
    local clip = rootPart:FindFirstChild("BodyClip")
    if not clip then
        clip = Instance.new("BodyVelocity")
        clip.Name = "BodyClip"
        clip.MaxForce = Vector3.new(1000000, 1000000, 1000000)
        clip.Velocity = Vector3.new(0, 0, 0)
        clip.Parent = rootPart
    else
        clip.MaxForce = Vector3.new(1000000, 1000000, 1000000)
        clip.Velocity = Vector3.new(0, 0, 0)
    end

    -- Recalculate distance and speed
    distance = (gg.Position - rootPart.Position).Magnitude
    local speed = _G.TweenSpeed or (Settings and Settings["Tween Speed"]) or 200
    if speed <= 0 then speed = 200 end
    
    -- Always sync block to current rootPart before starting tween
    block.CFrame = rootPart.CFrame
    
    local tweenInfo = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(block, tweenInfo, {CFrame = gg})
    _G.CurrentTween = tween
    _G.CurrentTweenTarget = gg
    _G.TweenCache = tween    
    
    shouldTween = true
    getgenv().OnFarm = true
    
    tween:Play()    
    
    task.spawn(function() 
        while tween.PlaybackState == Enum.PlaybackState.Playing do 
            if not shouldTween or _G.TweenGen ~= myGen then 
                pcall(function() tween:Cancel() end)
                break 
            end 
            task.wait(0.05) 
        end 
        -- Clean up only if this is still the active tween generation
        if _G.TweenGen == myGen then
            _G.CurrentTween = nil
            _G.CurrentTweenTarget = nil
            block.CFrame = gg
            pcall(function()
                if rootPart and rootPart.Parent then
                    rootPart.CFrame = gg
                end
            end)
            -- Clean up BodyClip only if no ongoing farming feature requires it
            if not (getgenv().OnFarm or _G.FarmEliteHunt or _G.Level or _G.AutoRaidCastle or _G.FarmMagnetToken) then
                shouldTween = false
                pcall(function()
                    local hrp2 = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp2 and hrp2:FindFirstChild("BodyClip") then hrp2.BodyClip:Destroy() end
                end)
            end
        end
    end)
    
    return tween
end

old_tp = function(p) 
    local char = plr.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = p 
    end
end


-- Helper aliases for compatibility
local topos = function(p) _tp(p) end
local tween = function(p) _tp(p) end
local StopTween = function(v)
    if not v then
        shouldTween = false
        getgenv().OnFarm = false
        _G.TweenGen = (_G.TweenGen or 0) + 1
        if _G.CurrentTween then
            pcall(function() _G.CurrentTween:Cancel() end)
            _G.CurrentTween = nil
        end
        if _G.TweenCache then
            pcall(function() _G.TweenCache:Cancel() end)
            _G.TweenCache = nil
        end
        _G.CurrentTweenTarget = nil
        pcall(function()
            local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                if block then block.CFrame = hrp.CFrame end
                if hrp:FindFirstChild("BodyClip") then
                    hrp.BodyClip:Destroy()
                end
            end
        end)
    end
end

TeleportToTarget = function(targetCFrame) if (targetCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 1000 then _tp(targetCFrame)else _tp(targetCFrame)end end
notween = function(p) plr.Character.HumanoidRootPart.CFrame = p end
function BTP(p)
    local player = game.Players.LocalPlayer
    local humanoidRootPart = player.Character.HumanoidRootPart
    local humanoid = player.Character.Humanoid
    local playerGui = player.PlayerGui.Main
    local targetPosition = p.Position
    local lastPosition = humanoidRootPart.Position
    repeat
        humanoid.Health = 0
        humanoidRootPart.CFrame = p
        playerGui.Quest.Visible = false
        if (humanoidRootPart.Position - lastPosition).Magnitude > 1 then
            lastPosition = humanoidRootPart.Position
            humanoidRootPart.CFrame = p
        end
        task.wait(0.5)
    until (p.Position - humanoidRootPart.Position).Magnitude <= 2000
end
spawn(function()
  while task.wait() do
    pcall(function()
      if _G.SailBoat_Hydra or _G.WardenBoss or _G.AutoFactory or _G.HighestMirage or _G.HCM or _G.PGB or _G.Leviathan1 or _G.UPGDrago or _G.Complete_Trials or _G.TpDrago_Prehis or _G.BuyDrago or _G.AutoFireFlowers or _G.DT_Uzoth or _G.AutoBerry or _G.Prefully or _G.Prehis_Find or _G.Prehis_Skills or _G.Prehis_DB or _G.Prehis_DE or _G.FarmBlazeEM or _G.Dojoo or _G.CollectPresent or _G.AutoLawKak or _G.TpLab or _G.AutoPhoenixF or _G.AutoFarmChest or _G.AutoHytHallow or _G.LongsWord or _G.BlackSpikey or _G.AutoHolyTorch or _G.TrainDrago  or _G.AutoSaber or _G.FarmMastery_Dev or _G.CitizenQuest or _G.AutoEctoplasm or _G.KeysRen or _G.Auto_Rainbow_Haki or _G.obsFarm or _G.AutoBigmom or _G.Doughv2 or _G.AuraBoss or _G.Raiding or _G.Auto_Cavender or _G.TpPly or _G.Bartilo_Quest or _G.Level or _G.FarmEliteHunt or _G.AutoZou or _G.AutoFarm_Bone or getgenv().AutoMaterial or _G.CraftVM or _G.FrozenTP or _G.TPDoor or _G.AcientOne or _G.AutoFarmNear or _G.AutoRaidCastle or _G.DarkBladev3 or _G.AutoFarmRaid or _G.Auto_Cake_Prince or _G.Addealer or _G.TPNpc or _G.TwinHook or _G.FindMirage or _G.FarmChestM or _G.Shark or _G.TerrorShark or _G.Piranha or _G.MobCrew or _G.SeaBeast1 or _G.FishBoat or _G.AutoPole or _G.AutoPoleV2 or _G.Auto_SuperHuman or _G.AutoDeathStep or _G.Auto_SharkMan_Karate or _G.Auto_Electric_Claw or _G.AutoDragonTalon or _G.Auto_Def_DarkCoat or _G.Auto_God_Human or _G.Auto_Tushita or _G.AutoMatSoul or _G.AutoKenVTWO or _G.AutoSerpentBow or _G.AutoFMon or _G.Auto_Soul_Guitar or _G.TPGEAR or _G.AutoSaw or _G.AutoTridentW2 or _G.AutoEvoRace or _G.AutoGetQuestBounty or _G.MarinesCoat or _G.TravelDres or _G.Defeating or _G.DummyMan or _G.Auto_Yama or _G.Auto_SwanGG or _G.SwanCoat or _G.AutoEcBoss or _G.Auto_Mink or _G.Auto_Human or _G.Auto_Skypiea or _G.Auto_Fish or _G.CDK_TS or _G.CDK_YM or _G.CDK or _G.AutoFarmGodChalice or _G.AutoFistDarkness or _G.AutoMiror or _G.Teleport or _G.AutoKilo or _G.AutoGetUsoap or _G.Praying or _G.TryLucky or _G.AutoColShad or _G.AutoUnHaki or _G.Auto_DonAcces or _G.AutoRipIngay or _G.DragoV3 or _G.DragoV1 or _G.SailBoats or NextIs or _G.FarmGodChalice or _G.IceBossRen or senth or senth2 or _G.Lvthan or _G.beasthunter or _G.DangerLV or _G.Relic123 or _G.tweenKitsune or _G.Collect_Ember or _G.AutofindKitIs or _G.snaguine or _G.TwFruits or _G.tweenKitShrine or _G.Tp_LgS or _G.Tp_MasterA or _G.tweenShrine or _G.FarmMastery_G or _G.FarmMastery_S or _G.FarmBoss or _G.AutoFarmAllBoss or _G.AutoFishSlap or _G.FarmTyrant or _G.FarmPhaBinh or _G.AutoSpawnCP or _G.AutoBerryH or _G.AutoChestBP or _G.FarmEliteHop or _G.AutoHop_Dough or _G.AutoDoughKing or _G.AutoAttackDoughKing or (_G.CurrentTween and _G.CurrentTween.PlaybackState == Enum.PlaybackState.Playing) or _G.Auto_StartRaid or _G.AutoChipFruit or _G.AutoChipBeli or _G.StartEvent or _G.AutoMysticIsland or _G.AutoPlayerHunter or _G.SafeMode or _G.AutoKillMob or _G.AutoStartPrehistoric or _G.AutoUnHaki or _G.AutoAttackRipIndra or _G.AutoFarmIsland or _G.AutoFarmDungeon or _G.AutoFarmCandy or _G.AutoTP_Gift or _G.AutoTPGift or _G.AutoTPAndCollect or _G.MasterAutoLevel or _G.MasterAutoCandy or _G.TPFloor1 or _G.TPFloor2 or _G.TPFloor3 or _G.TPFloor4 then
        shouldTween = true
        if not plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
          local Noclip = Instance.new("BodyVelocity")
          Noclip.Name = "BodyClip"
          Noclip.Parent = plr.Character.HumanoidRootPart
          Noclip.MaxForce = Vector3.new(1000000,1000000,1000000)
          Noclip.Velocity = Vector3.new(0,0,0)
        end        
        if plr.Character:FindFirstChild("highlight") then
            pcall(function() plr.Character.highlight:Destroy() end)
        end
        for _, no in pairs(plr.Character:GetDescendants()) do if no:IsA("BasePart") then no.CanCollide = false end end
      else
        shouldTween = false
        if plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then plr.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy() end
        if plr.Character:FindFirstChild('highlight') then plr.Character:FindFirstChild('highlight'):Destroy() end	        
      end
    end)
  end
end)
QuestB = function()
				if World1 then
					if _G.FindBoss == "The Gorilla King" then
						bMon = "The Gorilla King"
						Qname = "JungleQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
						PosB = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
					elseif _G.FindBoss == "Chef" or _G.FindBoss == "Bobby" then
						bMon = "Chef"
						Qname = "BuggyQuest1"
						Qdata = 3;
						PosQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
						PosB = CFrame.new(-1131.7, 14.8, 4080.3)
					elseif _G.FindBoss == "The Saw" then
						bMon = "The Saw"
						PosB = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
					elseif _G.FindBoss == "Yeti" then
						bMon = "Yeti"
						Qname = "SnowQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
						PosB = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
					elseif _G.FindBoss == "Mob Leader" then
						bMon = "Mob Leader"
						PosB = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
					elseif _G.FindBoss == "Vice Admiral" then
						bMon = "Vice Admiral"
						Qname = "MarineQuest2"
						Qdata = 2;
						PosQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
						PosB = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
					elseif _G.FindBoss == "Saber Expert" then
						bMon = "Saber Expert"
						PosB = CFrame.new(-1458.89502, 29.8870335, -50.633564)
					elseif _G.FindBoss == "Warden" then
						bMon = "Warden"
						Qname = "ImpelQuest"
						Qdata = 1;
						PosB = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
						PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
					elseif _G.FindBoss == "Chief Warden" then
						bMon = "Chief Warden"
						Qname = "ImpelQuest"
						Qdata = 2;
						PosB = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
						PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
					elseif _G.FindBoss == "Swan" then
						bMon = "Swan"
						Qname = "ImpelQuest"
						Qdata = 3;
						PosB = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
						PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
					elseif _G.FindBoss == "Magma Admiral" or _G.FindBoss == "Magma General" then
						bMon = "Magma Admiral"
						Qname = "MagmaQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
						PosB = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
					elseif _G.FindBoss == "Fishman Lord" then
						bMon = "Fishman Lord"
						Qname = "FishmanQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
						PosB = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
					elseif _G.FindBoss == "Wysper" or _G.FindBoss == "Sky Warlord" then
						bMon = "Wysper"
						Qname = "SkyExp1Quest"
						Qdata = 3;
						PosQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
						PosB = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
					elseif _G.FindBoss == "Thunder God" or _G.FindBoss == "Lightning God" then
						bMon = "Thunder God"
						Qname = "SkyExp2Quest"
						Qdata = 3;
						PosQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
						PosB = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
					elseif _G.FindBoss == "Cyborg" then
						bMon = "Cyborg"
						Qname = "FountainQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
						PosB = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
					elseif _G.FindBoss == "Ice Admiral" then
						bMon = "Ice Admiral"
						Qdata = nil;
						PosQBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
						PosB = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
					elseif _G.FindBoss == "Greybeard" then
						bMon = "Greybeard"
						Qdata = nil;
						PosQBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
						PosB = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
					end
				end;
				if World2 then
					if _G.FindBoss == "Diamond" then
						bMon = "Diamond"
						Qname = "Area1Quest"
						Qdata = 3;
						PosQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
						PosB = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
					elseif _G.FindBoss == "Jeremy" then
						bMon = "Jeremy"
						Qname = "Area2Quest"
						Qdata = 3;
						PosQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
						PosB = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
					elseif _G.FindBoss == "Orbitus" then
						bMon = "Orbitus"
						Qname = "MarineQuest3"
						Qdata = 3;
						PosQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
						PosB = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
					elseif _G.FindBoss == "Don Swan" then
						bMon = "Don Swan"
						PosB = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
					elseif _G.FindBoss == "Smoke Admiral" then
						bMon = "Smoke Admiral"
						Qname = "IceSideQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
						PosB = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
					elseif _G.FindBoss == "Awakened Ice Admiral" then
						bMon = "Awakened Ice Admiral"
						Qname = "FrostQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
						PosB = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
					elseif _G.FindBoss == "Tide Keeper" then
						bMon = "Tide Keeper"
						Qname = "ForgottenQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
						PosB = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
					elseif _G.FindBoss == "Darkbeard" then
						bMon = "Darkbeard"
						Qdata = nil;
						PosQBoss = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
						PosB = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
					elseif _G.FindBoss == "Cursed Captaim" then
						bMon = "Cursed Captain"
						Qdata = nil;
						PosQBoss = CFrame.new(916.928589, 181.092773, 33422)
						PosB = CFrame.new(916.928589, 181.092773, 33422)
					elseif _G.FindBoss == "Order" then
						bMon = "Order"
						Qdata = nil;
						PosQBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
						PosB = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
					end
				end;
				if World3 then
					if _G.FindBoss == "Stone" then
						bMon = "Stone"
						Qname = "PiratePortQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
						PosB = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
					elseif _G.FindBoss == "Hydra Leader" then
						bMon = "Hydra Leader"
						Qname = "VenomCrewQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(5211.021484375, 1004.35778859375, 758.1847534179688)
						PosB = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
					elseif _G.FindBoss == "Kilo Admiral" then
						bMon = "Kilo Admiral"
						Qname = "MarineTreeIsland"
						Qdata = 3;
						PosQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
						PosB = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
					elseif _G.FindBoss == "Captain Elephant" then
						bMon = "Captain Elephant"
						Qname = "DeepForestIsland"
						Qdata = 3;
						PosQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
						PosB = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
					elseif _G.FindBoss == "Beautiful Pirate" then
						bMon = "Beautiful Pirate"
						Qname = "DeepForestIsland2"
						Qdata = 3;
						PosQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
						PosB = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
					elseif _G.FindBoss == "Cake Queen" then
						bMon = "Cake Queen"
						Qname = "IceCreamIslandQuest"
						Qdata = 3;
						PosQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
						PosB = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
					elseif _G.FindBoss == "Longma" then
						bMon = "Longma"
						Qdata = nil;
						PosQBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
						PosB = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
					elseif _G.FindBoss == "Soul Reaper" then
						bMon = "Soul Reaper"
						Qdata = nil;
						PosQBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
						PosB = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
					end
				end
			end
			QuestBeta = function()
				local Neta = QuestB()
				return {
					[0] = _G.FindBoss,
					[1] = bMon,
					[2] = Qdata,
					[3] = Qname,
					[4] = PosB,
					[5] = PosQBoss,
				}  
			end

local Quests = require(game:GetService("ReplicatedStorage"):WaitForChild("Quests"))
local GuideModule = require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule"))

local blacklistquest = {
    "MarineQuest",
    "BartiloQuest",
    "CitizenQuest",
    "Trainees"
}

CheckSea = function(b)
    if (game.PlaceId == 2753915549 or game.PlaceId == 85211729168715) and b == 1 then
        return true
    elseif (game.PlaceId == 4442272183 or game.PlaceId == 79091703265657) and b == 2 then
        return true
    elseif (game.PlaceId == 7449423635 or game.PlaceId == 100117331123089) and b == 3 then
        return true
    end
    return false
end

local function DetectWorld()
    if game.PlaceId == 2753915549 or game.PlaceId == 85211729168715 then
        return 1
    elseif game.PlaceId == 4442272183 or game.PlaceId == 79091703265657 then
        return 2
    elseif game.PlaceId == 7449423635 or game.PlaceId == 100117331123089 then
        return 3
    end
    if World1 then return 1
    elseif World2 then return 2
    elseif World3 then return 3 end
    return 1
end

GetStaticQuestData = function()
    local lvl = GetPlayerLevel()
    local curWorld = DetectWorld()

    -- ============================================================
    -- FIRST WORLD (SEA 1: LEVELS 1 - 699)
    -- ============================================================
    if curWorld == 1 then
        if lvl <= 9 then
            local isMarine = false
            pcall(function()
                if plr.Team and tostring(plr.Team.Name):lower():find("marine") then
                    isMarine = true
                elseif tostring(plr.Team):lower():find("marine") then
                    isMarine = true
                end
            end)
            if isMarine then
                return {Quest="MarineQuest", QNPC=CFrame.new(-2709.7, 24.5, 2104.2), Mon="Trainee", MPos=CFrame.new(-2709.7, 24.5, 2104.2), Req=1}
            else
                return {Quest="BanditQuest1", QNPC=CFrame.new(1046.0, 27.0, 1560.8), Mon="Bandit", MPos=CFrame.new(1045.96, 27.00, 1560.82), Req=1}
            end
        elseif lvl <= 14 then return {Quest="JungleQuest", QNPC=CFrame.new(-1598.1, 35.6, 153.4), Mon="Monkey", MPos=CFrame.new(-1448.52, 67.85, 11.47), Req=1}
        elseif lvl <= 29 then return {Quest="JungleQuest", QNPC=CFrame.new(-1598.1, 35.6, 153.4), Mon="Gorilla", MPos=CFrame.new(-1129.88, 40.46, -525.42), Req=2}
        elseif lvl <= 39 then return {Quest="BuggyQuest1", QNPC=CFrame.new(-1141.1, 4.1, 3831.5), Mon="Pirate", MPos=CFrame.new(-1103.51, 13.75, 3896.09), Req=1}
        elseif lvl <= 59 then return {Quest="BuggyQuest1", QNPC=CFrame.new(-1141.1, 4.1, 3831.5), Mon="Brute", MPos=CFrame.new(-1140.08, 14.81, 4322.92), Req=2}
        elseif lvl <= 74 then return {Quest="DesertQuest", QNPC=CFrame.new(894.5, 5.1, 4392.4), Mon="Desert Bandit", MPos=CFrame.new(924.80, 6.45, 4481.59), Req=1}
        elseif lvl <= 89 then return {Quest="DesertQuest", QNPC=CFrame.new(894.5, 5.1, 4392.4), Mon="Desert Officer", MPos=CFrame.new(1608.28, 8.61, 4371.01), Req=2}
        elseif lvl <= 99 then return {Quest="SnowQuest", QNPC=CFrame.new(1389.7, 88.2, -1298.9), Mon="Snow Bandit", MPos=CFrame.new(1354.35, 87.27, -1393.95), Req=1}
        elseif lvl <= 119 then return {Quest="SnowQuest", QNPC=CFrame.new(1389.7, 88.2, -1298.9), Mon="Snowman", MPos=CFrame.new(6242.00, 51.52, -1243.98), Req=2}
        elseif lvl <= 149 then return {Quest="MarineQuest2", QNPC=CFrame.new(-5039.6, 27.4, 4324.7), Mon="Chief Petty Officer", MPos=CFrame.new(-4881.23, 22.65, 4273.75), Req=1}
        elseif lvl <= 174 then return {Quest="SkyQuest", QNPC=CFrame.new(-4839.5, 716.4, -2619.4), Mon="Sky Bandit", MPos=CFrame.new(-4953.21, 295.74, -2899.23), Req=1}
        elseif lvl <= 189 then return {Quest="SkyQuest", QNPC=CFrame.new(-4839.5, 716.4, -2619.4), Mon="Dark Master", MPos=CFrame.new(-5259.84, 391.40, -2229.04), Req=2}
        elseif lvl <= 209 then return {Quest="PrisonerQuest", QNPC=CFrame.new(5308.9, 1.7, 475.1), Mon="Prisoner", MPos=CFrame.new(5098.97, -0.32, 474.24), Req=1}
        elseif lvl <= 249 then return {Quest="PrisonerQuest", QNPC=CFrame.new(5308.9, 1.7, 475.1), Mon="Dangerous Prisoner", MPos=CFrame.new(5654.56, 15.63, 866.30), Req=2}
        elseif lvl <= 274 then return {Quest="ColosseumQuest", QNPC=CFrame.new(-1580.0, 6.4, -2986.5), Mon="Toga Warrior", MPos=CFrame.new(-1820.21, 51.68, -2740.67), Req=1}
        elseif lvl <= 299 then return {Quest="ColosseumQuest", QNPC=CFrame.new(-1580.0, 6.4, -2986.5), Mon="Gladiator", MPos=CFrame.new(-1292.84, 56.38, -3339.03), Req=2}
        elseif lvl <= 324 then return {Quest="MagmaQuest", QNPC=CFrame.new(-5313.4, 11.0, 8515.3), Mon="Military Soldier", MPos=CFrame.new(-5411.16, 11.08, 8454.29), Req=1}
        elseif lvl <= 374 then return {Quest="MagmaQuest", QNPC=CFrame.new(-5313.4, 11.0, 8515.3), Mon="Military Spy", MPos=CFrame.new(-5802.87, 86.26, 8828.86), Req=2}
        elseif lvl <= 399 then return {Quest="FishmanQuest", QNPC=CFrame.new(61122.7, 18.5, 1569.4), Mon="Fishman Warrior", MPos=CFrame.new(60878.30, 18.48, 1543.76), Req=1, Entrance=Vector3.new(61163, 11, 1819)}
        elseif lvl <= 449 then return {Quest="FishmanQuest", QNPC=CFrame.new(61122.7, 18.5, 1569.4), Mon="Fishman Commando", MPos=CFrame.new(61922.63, 18.48, 1493.93), Req=2, Entrance=Vector3.new(61163, 11, 1819)}
        elseif lvl <= 474 then return {Quest="SkyExp1Quest", QNPC=CFrame.new(-4721.9, 843.9, -1950.0), Mon="God's Guard", MPos=CFrame.new(-4710.04, 845.28, -1927.31), Req=1, Entrance=Vector3.new(-4607, 872, -1667)}
        elseif lvl <= 524 then return {Quest="SkyExp1Quest", QNPC=CFrame.new(-7859.1, 5544.2, -381.5), Mon="Shanda", MPos=CFrame.new(-7678.49, 5566.40, -497.22), Req=2, Entrance=Vector3.new(-7894, 5547, -380)}
        elseif lvl <= 549 then return {Quest="SkyExp2Quest", QNPC=CFrame.new(-7906.8, 5634.7, -1412.0), Mon="Royal Squad", MPos=CFrame.new(-7624.25, 5658.13, -1467.35), Req=1}
        elseif lvl <= 624 then return {Quest="SkyExp2Quest", QNPC=CFrame.new(-7906.8, 5634.7, -1412.0), Mon="Royal Soldier", MPos=CFrame.new(-7836.75, 5645.66, -1790.62), Req=2}
        elseif lvl <= 649 then return {Quest="FountainQuest", QNPC=CFrame.new(5259.8, 37.4, 4050.0), Mon="Galley Pirate", MPos=CFrame.new(5551.02, 78.90, 3930.41), Req=1}
        else return {Quest="FountainQuest", QNPC=CFrame.new(5259.8, 37.4, 4050.0), Mon="Galley Captain", MPos=CFrame.new(5441.95, 42.50, 4950.09), Req=2} end

    -- ============================================================
    -- SECOND WORLD (SEA 2: LEVELS 700 - 1499)
    -- ============================================================
    elseif curWorld == 2 then
        if lvl <= 724 then return {Quest="Area1Quest", QNPC=CFrame.new(-429.5, 71.8, 1836.2), Mon="Raider", MPos=CFrame.new(-728.33, 52.78, 2345.77), Req=1}
        elseif lvl <= 774 then return {Quest="Area1Quest", QNPC=CFrame.new(-429.5, 71.8, 1836.2), Mon="Mercenary", MPos=CFrame.new(-1004.32, 80.16, 1424.62), Req=2}
        elseif lvl <= 799 then return {Quest="Area2Quest", QNPC=CFrame.new(638.4, 71.8, 918.3), Mon="Swan Pirate", MPos=CFrame.new(1068.66, 137.61, 1322.11), Req=1}
        elseif lvl <= 874 then return {Quest="Area2Quest", QNPC=CFrame.new(632.7, 73.1, 918.7), Mon="Factory Staff", MPos=CFrame.new(73.08, 81.86, -27.47), Req=2}
        elseif lvl <= 899 then return {Quest="MarineQuest3", QNPC=CFrame.new(-2440.8, 71.7, -3216.1), Mon="Marine Lieutenant", MPos=CFrame.new(-2821.37, 75.90, -3070.09), Req=1}
        elseif lvl <= 949 then return {Quest="MarineQuest3", QNPC=CFrame.new(-2440.8, 71.7, -3216.1), Mon="Marine Captain", MPos=CFrame.new(-1861.23, 80.18, -3254.70), Req=2}
        elseif lvl <= 974 then return {Quest="ZombieQuest", QNPC=CFrame.new(-5497.1, 47.6, -795.2), Mon="Zombie", MPos=CFrame.new(-5657.78, 78.97, -928.69), Req=1}
        elseif lvl <= 999 then return {Quest="ZombieQuest", QNPC=CFrame.new(-5497.1, 47.6, -795.2), Mon="Vampire", MPos=CFrame.new(-6037.67, 32.18, -1340.66), Req=2}
        elseif lvl <= 1049 then return {Quest="SnowMountainQuest", QNPC=CFrame.new(609.9, 400.1, -5372.3), Mon="Snow Trooper", MPos=CFrame.new(549.15, 427.39, -5563.70), Req=1}
        elseif lvl <= 1099 then return {Quest="SnowMountainQuest", QNPC=CFrame.new(609.9, 400.1, -5372.3), Mon="Winter Warrior", MPos=CFrame.new(1142.75, 475.64, -5199.42), Req=2}
        elseif lvl <= 1124 then return {Quest="IceSideQuest", QNPC=CFrame.new(-6064.1, 15.2, -4903.0), Mon="Lab Subordinate", MPos=CFrame.new(-5707.47, 15.95, -4513.39), Req=1}
        elseif lvl <= 1174 then return {Quest="IceSideQuest", QNPC=CFrame.new(-6064.1, 15.2, -4903.0), Mon="Horned Warrior", MPos=CFrame.new(-6341.37, 15.95, -5723.16), Req=2}
        elseif lvl <= 1199 then return {Quest="FireSideQuest", QNPC=CFrame.new(-5428.0, 15.1, -5299.4), Mon="Magma Ninja", MPos=CFrame.new(-5428, 78, -5959), Req=1}
        elseif lvl <= 1249 then return {Quest="FireSideQuest", QNPC=CFrame.new(-5428.0, 15.1, -5299.4), Mon="Lava Pirate", MPos=CFrame.new(-5213.33, 49.74, -4701.45), Req=2}
        elseif lvl <= 1274 then return {Quest="ShipQuest1", QNPC=CFrame.new(1037.8, 125.1, 32911.6), Mon="Ship Deckhand", MPos=CFrame.new(1212.01, 150.79, 33059.25), Req=1, Entrance=Vector3.new(923.2, 126.9, 32852.8)}
        elseif lvl <= 1299 then return {Quest="ShipQuest1", QNPC=CFrame.new(1037.8, 125.1, 32911.6), Mon="Ship Engineer", MPos=CFrame.new(919.48, 43.54, 32779.97), Req=2, Entrance=Vector3.new(923.2, 126.9, 32852.8)}
        elseif lvl <= 1324 then return {Quest="ShipQuest2", QNPC=CFrame.new(968.8, 125.1, 33244.1), Mon="Ship Steward", MPos=CFrame.new(919.44, 129.56, 33436.04), Req=1, Entrance=Vector3.new(923.2, 126.9, 32852.8)}
        elseif lvl <= 1349 then return {Quest="ShipQuest2", QNPC=CFrame.new(968.8, 125.1, 33244.1), Mon="Ship Officer", MPos=CFrame.new(1036.02, 181.44, 33315.73), Req=2, Entrance=Vector3.new(923.2, 126.9, 32852.8)}
        elseif lvl <= 1374 then return {Quest="FrostQuest", QNPC=CFrame.new(5667.7, 26.8, -6486.1), Mon="Arctic Warrior", MPos=CFrame.new(5966.25, 62.97, -6179.38), Req=1}
        elseif lvl <= 1424 then return {Quest="FrostQuest", QNPC=CFrame.new(5667.7, 26.8, -6486.1), Mon="Snow Lurker", MPos=CFrame.new(5407.07, 69.19, -6880.88), Req=2}
        elseif lvl <= 1449 then return {Quest="ForgottenQuest", QNPC=CFrame.new(-3054.4, 235.5, -10142.8), Mon="Sea Soldier", MPos=CFrame.new(-3028.22, 64.67, -9775.43), Req=1}
        else return {Quest="ForgottenQuest", QNPC=CFrame.new(-3054.4, 235.5, -10142.8), Mon="Water Fighter", MPos=CFrame.new(-3352.90, 285.02, -10534.84), Req=2} end

    -- ============================================================
    -- THIRD WORLD (SEA 3: LEVELS 1500 - 2800+)
    -- ============================================================
    elseif curWorld == 3 then
        if lvl <= 1524 then return {Quest="PiratePortQuest", QNPC=CFrame.new(-290.07, 42.90, 5581.59), Mon="Pirate Millionaire", MPos=CFrame.new(-246.00, 47.31, 5584.10), Req=1}
        elseif lvl <= 1574 then return {Quest="PiratePortQuest", QNPC=CFrame.new(-290.07, 42.90, 5581.59), Mon="Pistol Billionaire", MPos=CFrame.new(-187.33, 86.24, 6013.51), Req=2}
        elseif lvl <= 1599 then return {Quest="DragonCrewQuest", QNPC=CFrame.new(6736.33, 127.45, -712.33), Mon="Dragon Crew Warrior", MPos=CFrame.new(7021.50, 55.76, -730.13), Req=1}
        elseif lvl <= 1624 then return {Quest="DragonCrewQuest", QNPC=CFrame.new(6736.33, 127.45, -712.33), Mon="Dragon Crew Archer", MPos=CFrame.new(6625.00, 378.00, 244.00), Req=2}
        elseif lvl <= 1649 then return {Quest="AmazonQuest2", QNPC=CFrame.new(5210.87, 1004.14, 755.84), Mon="Hydra Enforcer", MPos=CFrame.new(4547.11, 1003.10, 334.19), Req=1}
        elseif lvl <= 1699 then return {Quest="AmazonQuest2", QNPC=CFrame.new(5210.87, 1004.14, 755.84), Mon="Venomous Assailant", MPos=CFrame.new(4674.93, 1134.83, 996.31), Req=2}
        elseif lvl <= 1724 then return {Quest="MarineTreeIsland", QNPC=CFrame.new(2180.54, 27.82, -6741.55), Mon="Marine Commodore", MPos=CFrame.new(2286.01, 73.13, -7159.81), Req=1}
        elseif lvl <= 1774 then return {Quest="MarineTreeIsland", QNPC=CFrame.new(2179.99, 28.73, -6740.06), Mon="Marine Rear Admiral", MPos=CFrame.new(3656.77, 160.52, -7001.60), Req=2}
        elseif lvl <= 1799 then return {Quest="DeepForestIsland3", QNPC=CFrame.new(-10581.66, 330.87, -8761.19), Mon="Fishman Raider", MPos=CFrame.new(-10407.53, 331.76, -8368.52), Req=1}
        elseif lvl <= 1824 then return {Quest="DeepForestIsland3", QNPC=CFrame.new(-10581.66, 330.87, -8761.19), Mon="Fishman Captain", MPos=CFrame.new(-10994.70, 352.38, -9002.11), Req=2}
        elseif lvl <= 1849 then return {Quest="DeepForestIsland", QNPC=CFrame.new(-13234.04, 331.49, -7625.40), Mon="Forest Pirate", MPos=CFrame.new(-13274.48, 332.38, -7769.58), Req=1}
        elseif lvl <= 1899 then return {Quest="DeepForestIsland", QNPC=CFrame.new(-13234.04, 331.49, -7625.40), Mon="Mythological Pirate", MPos=CFrame.new(-13680.61, 501.08, -6991.19), Req=2}
        elseif lvl <= 1924 then return {Quest="DeepForestIsland2", QNPC=CFrame.new(-12680.38, 389.97, -9902.02), Mon="Jungle Pirate", MPos=CFrame.new(-12256.16, 331.74, -10485.84), Req=1}
        elseif lvl <= 1974 then return {Quest="DeepForestIsland2", QNPC=CFrame.new(-12680.38, 389.97, -9902.02), Mon="Musketeer Pirate", MPos=CFrame.new(-13274.48, 332.38, -7769.58), Req=2}
        elseif lvl <= 1999 then return {Quest="HauntedQuest1", QNPC=CFrame.new(-9479.22, 141.22, 5566.09), Mon="Reborn Skeleton", MPos=CFrame.new(-8763.72, 165.72, 6159.86), Req=1}
        elseif lvl <= 2024 then return {Quest="HauntedQuest1", QNPC=CFrame.new(-9479.22, 141.22, 5566.09), Mon="Living Zombie", MPos=CFrame.new(-10144.13, 138.63, 5838.09), Req=2}
        elseif lvl <= 2049 then return {Quest="HauntedQuest2", QNPC=CFrame.new(-9516.99, 172.02, 6078.47), Mon="Demonic Soul", MPos=CFrame.new(-9505.87, 172.10, 6158.99), Req=1}
        elseif lvl <= 2074 then return {Quest="HauntedQuest2", QNPC=CFrame.new(-9516.99, 172.02, 6078.47), Mon="Posessed Mummy", MPos=CFrame.new(-9582.02, 6.25, 6205.48), Req=2}
        elseif lvl <= 2099 then return {Quest="NutsIslandQuest", QNPC=CFrame.new(-2104.39, 38.10, -10194.22), Mon="Peanut Scout", MPos=CFrame.new(-2143.24, 47.72, -10030.00), Req=1}
        elseif lvl <= 2124 then return {Quest="NutsIslandQuest", QNPC=CFrame.new(-2104.39, 38.10, -10194.22), Mon="Peanut President", MPos=CFrame.new(-1859.35, 38.10, -10422.43), Req=2}
        elseif lvl <= 2149 then return {Quest="IceCreamIslandQuest", QNPC=CFrame.new(-820.65, 65.82, -10965.80), Mon="Ice Cream Chef", MPos=CFrame.new(-558.06, 112.05, -11290.77), Req=1}
        elseif lvl <= 2199 then return {Quest="IceCreamIslandQuest", QNPC=CFrame.new(-820.65, 65.82, -10965.80), Mon="Ice Cream Commander", MPos=CFrame.new(-558.06, 112.05, -11290.77), Req=2}
        elseif lvl <= 2224 then return {Quest="CakeQuest1", QNPC=CFrame.new(-2021.32, 37.80, -12028.73), Mon="Cookie Crafter", MPos=CFrame.new(-2374.14, 37.80, -12125.31), Req=1}
        elseif lvl <= 2249 then return {Quest="CakeQuest1", QNPC=CFrame.new(-2021.32, 37.80, -12028.73), Mon="Cake Guard", MPos=CFrame.new(-1598.31, 43.77, -12244.58), Req=2}
        elseif lvl <= 2274 then return {Quest="CakeQuest2", QNPC=CFrame.new(-1927.92, 37.80, -12842.54), Mon="Baking Staff", MPos=CFrame.new(-1887.81, 77.62, -12998.35), Req=1}
        elseif lvl <= 2299 then return {Quest="CakeQuest2", QNPC=CFrame.new(-1927.92, 37.80, -12842.54), Mon="Head Baker", MPos=CFrame.new(-2216.19, 82.88, -12869.29), Req=2}
        elseif lvl <= 2324 then return {Quest="ChocQuest1", QNPC=CFrame.new(233.23, 29.88, -12201.23), Mon="Cocoa Warrior", MPos=CFrame.new(-21.55, 80.57, -12352.39), Req=1}
        elseif lvl <= 2349 then return {Quest="ChocQuest1", QNPC=CFrame.new(233.23, 29.88, -12201.23), Mon="Chocolate Bar Battler", MPos=CFrame.new(582.59, 77.19, -12463.16), Req=2}
        elseif lvl <= 2374 then return {Quest="ChocQuest2", QNPC=CFrame.new(150.51, 30.69, -12774.50), Mon="Sweet Thief", MPos=CFrame.new(165.19, 76.06, -12600.84), Req=1}
        elseif lvl <= 2399 then return {Quest="ChocQuest2", QNPC=CFrame.new(150.51, 30.69, -12774.50), Mon="Candy Rebel", MPos=CFrame.new(134.87, 77.25, -12876.55), Req=2}
        elseif lvl <= 2449 then return {Quest="CandyQuest1", QNPC=CFrame.new(-1052.00, 14.00, -14330.00), Mon="Candy Pirate", MPos=CFrame.new(-1200.00, 60.00, -14400.00), Req=1}
        elseif lvl <= 2474 then return {Quest="TikiQuest1", QNPC=CFrame.new(-16548.82, 55.61, -172.81), Mon="Isle Outlaw", MPos=CFrame.new(-16479.90, 226.61, -300.31), Req=1}
        elseif lvl <= 2499 then return {Quest="TikiQuest1", QNPC=CFrame.new(-16548.82, 55.61, -172.81), Mon="Island Boy", MPos=CFrame.new(-16849.40, 192.87, -150.79), Req=2}
        elseif lvl <= 2524 then return {Quest="TikiQuest2", QNPC=CFrame.new(-16538.00, 55.00, 1049.00), Mon="Sun-kissed Warrior", MPos=CFrame.new(-16347.00, 64.00, 984.00), Req=1}
        elseif lvl <= 2550 then return {Quest="TikiQuest2", QNPC=CFrame.new(-16541.02, 57.31, 1051.46), Mon="Isle Champion", MPos=CFrame.new(-16602.10, 130.39, 1087.25), Req=2}
        elseif lvl <= 2574 then return {Quest="TikiQuest3", QNPC=CFrame.new(-16541.02, 57.31, 1051.46), Mon="Serpent Hunter", MPos=CFrame.new(-16602.10, 130.39, 1087.25), Req=1}
        elseif lvl <= 2599 then return {Quest="TikiQuest3", QNPC=CFrame.new(-16541.02, 57.31, 1051.46), Mon="Skull Slayer", MPos=CFrame.new(-16602.10, 130.39, 1087.25), Req=2}
        elseif lvl <= 2624 then return {Quest="SubmergedQuest1", QNPC=CFrame.new(10781.02, -2087.73, 9265.72), Mon="Reef Bandit", MPos=CFrame.new(10951.03, -2159.49, 9150.90), Req=1}
        elseif lvl <= 2649 then return {Quest="SubmergedQuest1", QNPC=CFrame.new(10781.02, -2087.73, 9265.72), Mon="Coral Pirate", MPos=CFrame.new(10744.90, -2087.73, 9343.34), Req=2}
        elseif lvl <= 2674 then return {Quest="SubmergedQuest2", QNPC=CFrame.new(10882.12, -2086.20, 10032.33), Mon="Sea Chanter", MPos=CFrame.new(10661.25, -2087.73, 10088.88), Req=1}
        else return {Quest="SubmergedQuest2", QNPC=CFrame.new(10882.12, -2086.20, 10032.33), Mon="Ocean Prophet", MPos=CFrame.new(11050.83, -2001.23, 10142.20), Req=2} end
    end
    return nil
end

GetActiveQuestGui = function()
    local pGui = plr:FindFirstChild("PlayerGui")
    if not pGui then return nil end
    for _, gName in ipairs({"Main", "Main (minimal)"}) do
        local main = pGui:FindFirstChild(gName)
        if main then
            local q = main:FindFirstChild("Quest")
            if q and q.Visible then return q end
        end
    end
    return nil
end

GetActiveQuestTitle = function()
    local qGui = GetActiveQuestGui()
    if not qGui then return nil end
    local container = qGui:FindFirstChild("Container")
    if container then
        local qTitle = container:FindFirstChild("QuestTitle")
        local titleObj = qTitle and (qTitle:FindFirstChild("Title") or (qTitle:IsA("TextLabel") and qTitle))
        if titleObj and titleObj:IsA("TextLabel") and titleObj.Text ~= "" and titleObj.Text ~= "Quest" then
            return titleObj.Text
        end
        for _, desc in ipairs(container:GetDescendants()) do
            if desc:IsA("TextLabel") and desc.Text ~= "" and desc.Text ~= "Quest" then
                local txt = desc.Text
                if not txt:match("^%s*%(?%d+/%d+%)?%s*$") and not txt:match("^%s*%d+%s*$") and #txt >= 3 then
                    return txt
                end
            end
        end
    end
    return nil
end

MaterialMon=function()local a=game.Players.LocalPlayer;local b=a.Character and a.Character:FindFirstChild("HumanoidRootPart")if not b then return end;shouldRequestEntrance=function(c,d)local e=(b.Position-c).Magnitude;if e>=d then replicated.Remotes.CommF_:InvokeServer("requestEntrance",c)end end;if World1 then if SelectMaterial=="Angel Wings"then MMon={"Shanda","Royal Squad","Royal Soldier","Wysper","Thunder God"}MPos=CFrame.new(-4698,845,-1912)SP="Default"local c=Vector3.new(-4607.82275,872.54248,-1667.55688)shouldRequestEntrance(c,10000)elseif SelectMaterial=="Leather + Scrap Metal"then MMon={"Brute","Pirate"}MPos=CFrame.new(-1145,15,4350)SP="Default"elseif SelectMaterial=="Magma Ore"then MMon={"Military Soldier","Military Spy","Magma Admiral"}MPos=CFrame.new(-5815,84,8820)SP="Default"elseif SelectMaterial=="Fish Tail"then MMon={"Fishman Warrior","Fishman Commando","Fishman Lord"}MPos=CFrame.new(61123,19,1569)SP="Default"local c=Vector3.new(61163.8515625,5.342342376708984,1819.7841796875)shouldRequestEntrance(c,17000)elseif SelectMaterial=="Lightning Bolt"then MMon={"Charged Clouds","Storm Cloud","Charged Cloud","Cloud","Shanda","Wysper","Thunder God"}MPos=CFrame.new(-7866.13,5576.43,-546.75)SP="Default"local c=Vector3.new(-4607.82275,872.54248,-1667.55688)shouldRequestEntrance(c,10000)elseif SelectMaterial=="Yeti Fur"then MMon={"Snow Bandit","Snowman","Yeti"}MPos=CFrame.new(1218,138,-1488)SP="Default"end elseif World2 then if SelectMaterial=="Leather + Scrap Metal"then MMon={"Marine Captain"}MPos=CFrame.new(-2010.5059814453125,73.00115966796875,-3326.620849609375)SP="Default"elseif SelectMaterial=="Magma Ore"then MMon={"Magma Ninja","Lava Pirate"}MPos=CFrame.new(-5428,78,-5959)SP="Default"elseif SelectMaterial=="Ectoplasm"then MMon={"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer"}MPos=CFrame.new(911.35827636719,125.95812988281,33159.5390625)SP="Default"local c=Vector3.new(61163.8515625,5.342342376708984,1819.7841796875)shouldRequestEntrance(c,18000)elseif SelectMaterial=="Mystic Droplet"then MMon={"Water Fighter"}MPos=CFrame.new(-3385,239,-10542)SP="Default"elseif SelectMaterial=="Radioactive Material"then MMon={"Factory Staff"}MPos=CFrame.new(295,73,-56)SP="Default"elseif SelectMaterial=="Vampire Fang"then MMon={"Vampire"}MPos=CFrame.new(-6033,7,-1317)SP="Default"end elseif World3 then if SelectMaterial=="Scrap Metal"then MMon={"Jungle Pirate","Forest Pirate"}MPos=CFrame.new(-11975.78515625,331.7734069824219,-10620.0302734375)SP="Default"elseif SelectMaterial=="Fish Tail"then MMon={"Fishman Raider","Fishman Captain"}MPos=CFrame.new(-10993,332,-8940)SP="Default"elseif SelectMaterial=="Conjured Cocoa"then MMon={"Chocolate Bar Battler","Cocoa Warrior"}MPos=CFrame.new(620.6344604492188,78.93644714355469,-12581.369140625)SP="Default"elseif SelectMaterial=="Dragon Scale"then MMon={"Dragon Crew Archer","Dragon Crew Warrior"}MPos=CFrame.new(6594,383,139)SP="Default"elseif SelectMaterial=="Gunpowder"then MMon={"Pistol Billionaire"}MPos=CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625)SP="Default"elseif SelectMaterial=="Mini Tusk"then MMon={"Mythological Pirate"}MPos=CFrame.new(-13545,470,-6917)SP="Default"elseif SelectMaterial=="Demonic Wisp"then MMon={"Demonic Soul"}MPos=CFrame.new(-9495.6806640625,453.58624267578125,5977.3486328125)SP="Default"end end end
QuestNeta = function()
    local q = GetStaticQuestData()
    if not q then return {} end
    return {
        [1] = q.Mon,
        [2] = q.Req,
        [3] = q.Quest,
        [4] = 0,
        [5] = q.Mon,
        [6] = q.QNPC,
        ["QNPC"] = q.QNPC,
        ["MPos"] = q.MPos,
        ["Mon"] = q.Mon,
        ["Quest"] = q.Quest,
        ["Req"] = q.Req
    }
end

-- A1 HUB Assets & Theme Engine
local A1_Icon_B64 = "iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAA920lEQVR42pWdd5wkV3Xvv/dW6NyTd3a1SWElFFFcgQIgMiJIIAEC22SerYcx2Bj8DH7G8DA2Bj+DASOCyTlbIEACFJAQkkBIQgjllbR5ZmdnZ6anQ6V77/vjVldX9fSCn/TZnZ2emu6qG84953d+53dEbetZRnplkBLdXaU6vQ7huKzu34lAgoD0LxACgQABBgEi/ZNdIYD+NenvDF7OfSswGHuNyb0v2beY/j+yF8m9gUhf7L+5vcAYBu8y6pLhNzI6/Woo/mfSS3PXZy8ZzPB12Xf2/RyvjPQ8dBQghASj0UkExlCqj5HEIW6pjIkTXK0SjAnsoGpF1O0iHAekh/A80AZjNEIITPrhxoDIDT7GYET6nEaDkNlDGSFApwMiRDYWBmOnwfSnLvdYJv3OGPu5YN8jG0xRHKzcSJv+LOSvKfyuGRo8k1tAg/c02YOCMCK9YzD9ZzEmm6D+WxqdUB6fobnlOIwQSMdFAnGvTevR+6iMT7L+pO30lhYIuqt4josoz55g+gPjVJt4tTEwChXHlCdnMcagkxjpuKgktB8YhSAlwvEwWqUr1iCEtJOFQCcxaIUsV1Fhl6TTZs2T9gc3W/+iMKzZwhX9XTNqtQ7/JwYba3hd21HNFvZgY/QXSzqmI3YXmHTDGAbTkZtLYTBa41eq+M1JjIpxHBeMQYUBveWD+LUmlbFJkl6HJApwPB8XKdMVLO1q0wqdRJgkQccRyP6Ha4y2KzLbtkYhpMDxKxid2FvVBiElSIFRCrdSB2NIup3i4In+w8hsDYvcsIniZdmA2UkzxRE2g4EvvjZyekCYwftSvKXB25qhXTbYNUasMVjW6glB1GsTdVr2e6PtwpQSIR3C1SV6ywetJRDCLtaZU55pussLJHGIlE7R3kt3cFti8LrdftJaeynAcVN7KhgYYvtv4bigNUolhWOhaM8Hu8AgCua7MDyjfn/kWme0Te+/kxmcEWbkTGnWbFeT7vLs3vrnh8gWj30vhVHWCggDyHTnKQXSjqnJzZpbbowRtJcRcTg029Kal/wjCpHOvrA3IByMNhiVpGMpBpPQv/k4AUeMHqShg3J4F5j+e5r+mSEOt6YPs+BNth4G5t/knufwO2XNO5kRG8usNZxCunjVOkJIHK9E3F1BOC5OqYqKesSry/Zjtd0dbuvAHpIoQKSrX4jhI1EMblYM7CvZQSrT38kvMSddIYLDbnIxWJUmO9TE2lVtcodkwf6LvIMyYlfYLzK1/Uas3UiHm7TD7SKRs4kGgTHZyWS/1xq3Uqe6bjNetY4O2lTXbULrBCEkKg5ZWVkCz8Ubm0aHPdxgdRnH9RCOi1aJ3TOAEH1j118xIvvgvBuXrdKRZiHnavanTKTTa4orXoj+ph78rvh9u0aYNZ7i2rEbMjDDEzZ8JhnWmp68t5o3sSb3CyI1a1Kgwh6tXfci0+eWpQo6CtEqScfJ3rD0SqAVbrbdtcZolfmywpGpV5Massw5N0Uff7S/kV4vcis7nTw9iAsGi9JkX4URqSs7iDXEiG2PKZqRbJ7FkL0WqR/BKHtvhmbFrH0cM3QIY0APlmLeITBK4/oO9Yn1LO3diRCCJAztOUn6XFJgkohwYbfdMX6lDhiqY5MkSQLaIKQgDgPiMKBUrVJuTqDiEBUGGKWIYjuj2cBmh7IpbP+Br5cPuoZWWc58ibz3p8nMlEnnUmQ/KC5nkXf1By4VOp0EnbN4BRc0v+r7fn1ucWWxwNAWMSPXnM5+LtNVJoTAepk6XY9ycJ0BIR3cUr2J0Yqx2U30VluUKhUQgm5rid5qC7dUpjo+TdRtEwuJ0AalYrLx73sERhZtuBna2wNfrRBkDQ7hoRNZHmZnjTi980HuYHBMPk4sup35exs+V4bju2wDG0zu3Cqso358IR2SKOTQ/j2pCbK/7FQa6CgErRDSK9yI21mcByBqt9BG4Xi+tVGOA0i6hw6ggh7SdUnCEJn692uts8rOj8GJpwevMQjl+7ajH7QVIq7CCWBsJJ2+ixlxxoh+gCUO79LIvMkqBGWHC9gGyzyHlqSmLY+QGDsWUhZ9kBTCMVojHBevPkESdFFhz5r1DAUwiNLs8YOzPLW39gNkFvTksR2ByAalf/HgIWTu2ryXI7ODt+CKiEEAMzBJIzyd/46rOLSB1gZaZgA6mJw7MQw3pecHa6JlMpgjs/0CyuUKQa892BmZv2oGn+h4GBWnwau2Z0H6Ee5gLHPAm8h7NjJ3EJqcSzbY+oMH0YBTGBT7HOnJm25Lkxr2AQpk1kA1gmEX5/eMvShsoDWTYvI40dA+ytZR/hAeAVUYM/R7ArRSjE1NEe8PSaL+YTvCyiVRBlwK6VmXP70XafKuw/AhagYuY39lmhHAVf56Y1QWFY92JHOTaSzQVwz+B3/bBXN4v3wA61H0jFJTYdKBM0MDyFBMkJkjI3ILwGR3UjiHs3u3AGWn1bIuphS5zTsAH/MrxKgEWa7ilOsYKRGOi2u3BINIVqTbU8h09q3nobVIYwPrlg7cL5FbqWYAy6YTazI0kUFwlsUC6WRok3NNxQBZzW/9wyEYGS6Veoj/P3CF6RsikTM7xWVQ9HjymJD9d2t5EZmD0ylETgNnNfux1ui4iwm6aEfgOn7FzqDjItMDwiiF8FykcNEqznAfY7TdZtogHZndtEk9gP4kGjPC1xNFFKs/0Jn90Do1VmZgunJReWaehAW3TG5iRD5Cz/vtQwezlBKlFAKBlBKt1JCHVnSnzAAezY2/HtrF2l5nTCG264NtFozrn3EyBeo0GIMULm65OZUdpDqOrCsVtJFeCb/eREUhWikc10XFiY1q0oeXjn2IJOzhV2pordNVNXDftLLQdrYLxCCpIaSDju3hJMslSHR2kBmh0zERNqkh+p6ZSb0xiZT2oYzSaGPsz6Ww+Yi8YTPWJ++0O1QqJVSiCOKASrmcmsD8eSMGcyL0kLtqkNJFp8ivMYbqzEaS9gpaK4SwqKfjeRgkWiU4rke4uoLjuri+j07svQspEY6DG7aXkY6HNtri/lKC1iRJglGxtZ/aoKW0Nl3I9ABKMI7bH2WSsDvYmekhro2wtnIYO7fLERV0cZtjzL7+ryhvPQrHlbjpH8cFz0m/ugK/5FFJYm5489sIlpZ58UffT+2IWXwhCObm+fqb305npY0JY1QYYqTILJMQEt3pcPYF5/HWt/xPXAz/+L6PcPe9D1CulO3CKdyfGcKAzAD7khKp+1GtgzCCytQGtIpAKzsuWoM2VKdmcUpl4qCHcARetYIrqzilCo7nEnY6uCoOSXpt+mC67kPMgI7DzNhqkQu00i867q82gw5VwTj3YQRTSJKkW9dxMEGAU60ye/k7KJ14JvGeBwgP7sOtlHAdcBwx+CMMXrXM3MMPsXD3b3jin/8ZW595Do9dfysehlOefg6nX3whP/3gf7D12c9l7Ohj8bWi5rmUBHjC4BvFC575FN73nv/DEUfM8j/f+Dou/9O3FM+XHPBncs5F5rIaYxdl38prTe/gPnDcdNCTNHdiMEbRW1rITLJ0fdpBDxOH+JUyYS+kMb0e1yvViE073YoyFybbwbUHsljrmouBI983LyYfHvRvUsicb2UwwoEwQlYbrHvDOxEbjka1O6xc820OfPNTuM2pLA1qhqJUg6A8PsbRl76QvQ/s4msvexVaJfzFL67llD++lF985nMEy0tUu6sQBwgMynHwHUnQbbMUBJSmZgm8KvuWWhgdgakOMC5EEa4e8sisGXcQWg1sPkAS28VmwGuMU5tZj44CVNSjPbeH+uQ0tclpOkvL9FY1pcYEfsPg+z6u45dIwq51H3NbDZ3LuRsz8I6yaHc4VTWIDUwOYhZoZDp4CIGJA4QQTP7JX2FmjiFeXoKpafAquI1xnMYYqhfg1xt2ErRdEI7nEayscsyFFzJ11kn84u3vJlxZwmjNzVd8iks/9F5Oe/El/OITn+HgHbehkgiUhigC0+XIc57J/laPcy98Dq4UfPY/rkA6bjbk/VyBEOD0LYDSufjCpjKNVtZhMDlfR5BhPyoM6CwugI5Q3TZGazpLB+m2ljFa4ng+QnpE3RbEAa7jeFlkNjrmKQ4wGbaeAtTCFJJgawLXLGE/cPUmLnsT7pbT0O0uxq1i3CrC9TFG4lXrTJ74eA7cegtOpYZXrVm7qgxeyefIP7qMpd3z7LruBi780uchSbj13f/IgZ1/zqmvfBl3fveq9JyyeYqxrVtpTE1xzosu4ev/9q/svvdeZKmEkA6lagOttT3MpQQ0cRTT7XQtQNlsDAFMGtJEiliTPzYpJqaQWHiiPLOeJE5IkWqSKCLpttEqxGiFLFdw46BnB0kbtImR0kFIJxe8WDfKICys24eZSYOo/tkhhI3qihmbLOpFCkwY4W4+Bv/xT0XP70Iv7cM4DuHDAZ07fo5OYOOFL6C6fh2lWoWw1eXAr35FeXqacHmZDRc8icr27dz7kY/QPXCQzU97KvGhJToHl7n1c1/lnH/4a4568rk88IMf41VrbHzGczn2hZfSLJe4/kP/xO577qY6NYsRAsfxQEi0MURBSNQLkFIwNjnBE84/i+ltR3PNl76FVukEaTMIewZZJLTWhQhYOB7C8XE8jyQM8Kp1VByhoxCBQasYk0R4notbquCOzR4BHGEpFI5Da343vU4L1y8R97rUZ9YjhEPUaRO2l3E83851EuGUa6mNFxkzQkUhoJBO2frrWmXmSpvE3ohbonP71SxdeQWy2kCtLOGOz+DW60yedQ4PfPTfqM9McNJfXE7jmqPZdeX3kVKw6WUvI2l1ePhLX2Xi8Y9n36/v4sY3/iVJEHDft/6LE17/ak55zZ/w6A2/QEU95PgM7dhDxT2iTpdScxLp+6goIWh3UFGEXykzs2Uj27afzonnn8P2805HrtvELdfeRPTxz+HV6gO0kyKtxRi7S4LOahr8C1TQQ/U6A9jj4Bx54EtISWdpGaUS5NISrtYWOvDKZVzHtQs6PWSE4+K4PkJIvHKFoL1UiPWk62HSYEZIF6NipOuik36o7tp8cOoVGJNgkgDi2DIsyk22vPGfSJbm2f+Vj9E44UTarTarD/yW9mMVZl7wItY/45k88uUvM3Xuk6idez47v/ttWg/cxxM+8AHu/fyXWdnxMLUNG1h84GF2fOf7nPT6V7H5nO08evMvMdpl/0++RzS/k+VHHgLHp3eoRX1ynE0nH8/Wc85i27nbWX/S46hMTlItezy85yBX//g+yjffjApDexZpsybDJgRoraiNjZNEAVEQksXDYpDaBWcQG6V+utY2GNQqwT248770dZ1xewSCJLYptKXdj4C0JCMMqDjKfJJodSlHougz4qT9qYpQKiqw3+ifNcogtEHqhANXfo4Nr3gTzSc8jcapp7Nw47XEq8uc8rZ30n54B3f97V+DUUy94EXEkeKxz36W6fOeTITDrh/+EKdS48Q3/yV7r72OO674BLMvvoRjXv5idt58G/t//DWCvTsQrodwy0wctZGz3/wGJh53NJNHbsapVSCJWQlCotUl5uc0X/rmXcxuniF68F606WNNZg3CZ4xGSklnaYkkirN04xrYqP/7I+gsAoHbz9MiBBJZ5OXkbLpO4hQC0EXEtA83ZF6BsZhR3psWJotmhRAYhd05jkO49xF2vOvP8CdnqWzawvItN+CNT/PAh9+P6nYQrk/j1LOonvtU5q/+MUt3/oIzP/NNHvvWt6nMzCJLZRbvu5+jX/tafn7ZRTz8X1ex8YUXMXXSccz96nbK0xvteaYSVvfvJWovI045mZ1zczQ6HXzp0Ki4dEP44TUPstqDE0uK3z34AG6pZDH9PHIqJRiVMfq6q62hFW9G409iVNo5PTf7UE0uG7EW7cwwnlE8jcGH6hTn6KcORR8vMrnEtkqRUJXgNMbxZjeC63DgR98A18ebnkXWmngTM2AM48+6GCN85r/4aZqP346YmGbPN7/Mka+7nK2veR2PfOEz6GqDibOfxEOf+DjdULHlpS/D9SspjkXK7FP8+E1/zb1/+3aqnkeEQLuSXmj48Y8e5MCBNhOTDcTyPKsHFnHLpZR4YJ/HoC0MYQZJHWuyE3SSoJI0Ck4XqVIJKo6z17RSaKVRWpHEMSqOcGWBTznATlhD5RFZlNePwWzOVRR5uGIQR/R3SQb56hT5VDZRa+KIqYtfT+mEsxBJhFPyQBpEyYPlBXb+8/+ietTxNM5/Nqu/+DnLt93IMf90BXNXfY9So4l/xhPAdamsW8/ub32Tra++nN+84dUsXnsdY+edz9ixR7Py0EN4NZt29ao1opUW7Ud3IzW0Efix5pc/foi5fSt4jqRWqxDs3EHUCynXxlKQ0KQxjY1odRJlQ1VbdwRxrw1C4rhehnHZYEjhOpL2whyu5+GVK1SbTdxSmaDbRQiBq5PEbisbN+ai234mazgAS01WH0ruxwFiKJ+ayzzlkUlhsAGSAen5LH7nCuuDC2n5plqD4+KUyiStRaZf8lpkqcmh73yJ6raTKG/axqPvfRvrX/xK4so4YJh94WXs++oX2fyiP6Z58hk8+p+f4oTt5zFz4fNZ/t2/QNUgXZf2wiInP/dCzv/IB9gbhtSl5O7rHmLfzkUq9QpBN6BakSw+cG9KMB6QuYpJijQJLyRx0MOtjYFSCGlQYWQ9QZVQqjdxXBekhxEeXqVmXdIkotZs0jp0CLcxs4E46NiMjmt9Y9f3AYmKAlQcIh2PJOwhpIP0fIxSg3xARkDuBydDnA4jikkKk+4A4YB08Ncfi6g2IIks0OVXSFYO0HvgDkobtlA/6xm0f30bSz+/hq1/9T5aN12HdFzGn/NSoh2PIIVm6jmXMve1L7Dn+99h9pI/4qH3/DXt226j+aSn0/z+lXR27STs9jjqnO1s/8B72dXtMe1IHr1lF7t2LFKdaBK1Owgp8QjYd//9SM9PqRbF51RRmMsRa4LlRcTKkj0ntbKRf3pWxr0ecZJQqtQQ0qHX6WKSgDjskex+jFK5iuvXmzYsBkqNicxcGFJ3SSmcUoUkshPhVetE7VYuyEpTGmIA4woxfAilSZwkQnhlhPAwQQejFdVTLqC05QRMb9nCAPU64WO/o/vAnYw95YW4kxuZ/8/34DQa+OuPYs+n/4XpZ15KZfPj2P3+t4GJ2fw372Xqac9h/zc+y0kf/irVo45n/7e/zrH/8H7KR2xl8Y5fs+X8czn7gx/g4TBhnSvYc8c+fvvbfRyxbQNHTGke2+OwOL+K0z5Ee+8+nFIp4yf1F04/D5xfYrKfuEpf96oNatOzOI4kiSK6S4cYWzfNxMw62stL9FrL1MeajE1N0Vpaxm3N77YgnHTprSxikgSjrQtqWb0uKgrwy/ZAQykc10FrnSY0csnfHGFR5Ek6QmJUBELSOPMSTGeF8JFfI0sVFr7+Xkwc2kNOJUi/gvBK+DObqJ11Ib37f0t8cIFNl/8ry7ddh15dpHHBi+jueJiV228CnTC940Emn/tSFn7yfZZuvpbZCy9lz1c+xs4P/CN7r7mKreeewwUf/jd2GpiShuXfzvHrWx5iw+OPY/zQPdz6jr/jhDe9k/qZz6J7+/eIOl388RoGPYBfcgy+fCIoy6SlHlISBqzO70c4DioKERIWd+9kae/OlCxmycyt5RZCSNzm+iOJwp71EuIozS4JUAlJFFAemyTqtKhMrKN7aB4hHYTroFWCiiLrXmLsCa+T7CDPU7aNtsn6qee/k9K281m57qNEi7uQrs/kU1+Nv/VUjApwqnVW7/ghq7d9n/rjn4RTn+HQtz9Medt2Kqc9l/Zvb6Fx5gV4R2zj0Lc/Srw0B8Jj+YZrmH75nzL5lOcwd+WXOeZN78GtNdj93c+z4ezzOOffPsAeLdjgaMJHV7jztodZd9wWmku/49fvfjuxMvzmfe/myZ88ml3792JUSirVg7xygR+bT9Sb4SynRkW9FEUGkx6rSZJLhiQKQ2CracoTm97VW1lExSFJtz1wMaVEa4OKI+JemyToEAdddByTxBFamQwfsbRGPbCZw26RVgi/QuOJr8MoxeqvvorpLYN0kOU6OgnR7UVMFBDtfRCjEmYufgu6tcT81/6R8qaTkEiWr/8y05e+EeGWWPjaBzFRiHAdov27qJ1wFpWt22j98kZa99xO78A8R5xzHmd+4F/ZrQRTErz9XX5204NMHrOFGea4851vQ2kHvzZGEsXM/fwGunv32WfpezJ5NmzG6zejebB5kyvMEKvCosII60lKYWEaNwm7lKt1tIrRxiXqti2uXa1b2rlRaKUwOsRoTZJEuH7JHs5eyQJ12h5AjmehCaNUbhKst6C7yyx+92+YfPbfMfmMt3Lwu29FRx26D/wcff9N9mZVgtCG8ae+AmfdcSz/6KNopamf9GT2f/5v8abWUTrmdFo3fINwYT9ObQxhFMH+XbR/cS21bScjpKS94342Xfh8Tv67v2cuiFhXlbj721z7s3upb93EjHOIu/7+HWjt4tVqGK3xanXiTo+420N65dGVOEMTM8ga9PmRyhKxqk0cR9I5dIBKYwzH9TGpx2RUglf36S4fYmbzZtzqxAx+pUYShRghiHs92ov7KdWbJFGA7KfhpCQJAsJOG6/awLSX8CsVAJIwQKEtiqpVkRVlrO8vHI9g1+2s/PyTTF34D5Q2n07n3h8z/YJ34m8+FdM9xOIP/wW1MkftxKcTL86z8svvM3bOZcSHDhDO7WD2pW8lWZhj+WffQThOWgAHXn2CpZ9dxdz3voAOepz4hr/kiMv+mD3zhzhquk5lIeDGG++jtn6GSXGQu/73/yJohXjVSgpvWjq99MsjatCGS8pM5nwUiUwDmoxAWm8pSXAcB7/WxK/WCNotOkuLVKpVuksHKZUruK19j2GERCeWw66TEKMTOlEPlSTW9XTdQQ0Ygt7KIgJDuLqETumFAoOOw9EktjTMlpUx4uVd6F4bWZlCSJfln3/WmiK3RLSwk8aJF+CNb6Z127dIVhZonvECFr7/AarHnoV/1Bl07ryGcN8OnPqU3V2ORBiP4MAc1Y1bOPr1b6B6+tnM7Znn+COmUHNtbrjlfmpHbGCi0ub+f34HnfkDbHvNW+ns382Bn/2Q0vg0BkucXcNDGpRepuOtWENEMsbm74WlbYbtJVsRWRujt9qm12rn2JqKpbCL9Cvsf3Qn7roTz8DxymkCQ9JbPkBv+SBuuYoQAumXSYKQ9vxuhBSUmpMErUV0HOFV6qgotMV7RqaHbf+gGnBqTFquY/EgF+LEmiqd4NbWIbwKwZ47cEpVaqddTNztsHLbN6g+7jzig3sIdv+WTX/2UVCG1m0/QLglhONg4pCk18Or19n4opdzxMUvpStKtPbNc/yWdbR2LHDX3btobDqCurvE/f/0TroLy5QnZpi/6WqOufztaCk5eP0PkK6L9DykX7bu95BJNyOLNIrMQKMUTrlKeWwKt1xFSgetIkwUgIS42yXsdpjcdCTVeg0pwF3avcPCytpme6QUxL0uUbuVRcjCcWwiIdbopQMYpdBGD5L56bbMVzKa3OIX2Bxz//10HGGSGJOElDadgTezjXD/bylvPQNvehude68h6Swzu/0yDt38edx6k+DR37B0/RcJ9zyAQZB0WpRmNzHzjHMZf8KTEBPTLB5sMT0FR2xYx85fPsZjj84xdfzR+MFeHnj/O5GJ4cQzTuehBx9Gze3m4U+8jyNf9SYLiLke3d2P0Nv5ILJUTj0gTa4+c5hhap9NpgsvBS51HNFbnLNjagyuX0bFga0aTatolvbspO371vpNHH++kan/SlpQoJMYr1oHrTKiFpisLBUBOlGglU0sOK49sPt8HJm6pinu3YdeddRFNjYx9ZS/Y/W+79K9/ypI8whCusxe+gHcqa0c+M7fkKzO408dRbj3XoxOUEEbpzpGddOxlI8+kdoxJ1DZegxUasRBD7/kMjs7gVjuseOuR+jFMHnsZsKHb2L3lz6GihL+zwfex3HbjuFPXvk/cHyPcGmB5vFnsOW1b6f1u9sprd/K/u9+imDPDqRftgMrhqmKOXOkNI2Z9XSXFlFJEZLOCkRMrlYgx8zumzrXL1dwy1WiThvhevh1CDurlOpN0Iq4twqOdWa17ttcgfAcjLIooNBmQNsW+cKJlFVh+olv67rqKAatbSFbpYkKWlSPPAcTdDj43bcTzT2I8ErEBx+hsvl4ShuOobTxWPzZI5DNcYRfwuiEsBfhy4CJiSZ+rJm7bQcLexfxJyeY2NKk9fOvs/9H36LcaBAT47seTzl3O+efu53rrruJcqWGW59h9b57eOwTb2PTH72b2jGn0t1xj90FYsgNNcXqub7Zychd/aUmSSt9yNiGeSRGCIFw0sDOnzza2ODKA6Us7p8euuTqvxzHQRuFSVS+aDeFIHKV8jnO93ABhg67OI2NjD/hLXR3XE3w6NXIUhOjE5zmEQRzD4COaRx7LpVtZ1Navw1RLoPjpJREA45AVly8agnX8xCdgM7uA6zuX0SUK9Q2HwHhfg7+6DO0HrgTvCZvfNtbue7a6wlah7jr9hu58ee38sLLXofrSoRfYv3z/pQkDHGrDRZ++gWixX04fnlAz82PuU2FDQZ1RO2tYWRJ5chiFLc8NkF5fBopXQurGm2j3Dgi6nXxqw2iTpvy+LSVMuiskATBmqTNmsLqXO1UnpaIMZg4TtFEkSV8gn33UDvqbMbOeCFOdQKdRKgwRiiFqPjIsodwXcuMXAno7VwgPLRCEiS4jQaVjZtBLbFy8xdo3XUTSax52otezj133sWDDzzAyy+7hL9/yxv5yU+v55KLnsP555zJDdfdRLkasf8Hn6J65Mn09jxAsnwAp1QrBFsid66ZvPRFWthuebFmbVmTEAMaphhQdUwasAohEKXpY43lXFrbLYRAxUnG6yRlyvUPaiFtuWX+aBLFv0YXVQiJjrs4tY00T72c7q5rifbcgPRr6Dhk7JTnUTnyHFSvB1JZrqgUaKMxcYTuBahODxMnCBxkpYrbbCKrLqY7R/ex21m9/xZ0Z5UEyalnP5GPfuSDfPkLX+TjH/wQ37vmKt7xjndT9iW33XQ1V/7gp7z45a+jXK8Thz100EaWqtYjlDK3XopJKOGksU56KviVBknYswWOqb13HAchHJuSTcluluOkkI6b5g0MOk5wjdYkWg1JOAwqZvozpiJ7SAs1UEwRBQqsGVSHjCzIHbCQjeoHbRod9Zg48zL8mVOIDs4jfQuJR60OqtfFxBFIF+FXkOU6Tt1DkGCiQ/R23UWw9x7CA49i4hhZaeI2pxFJwq7HdjK/bzev+pPL+NLnv8QPrvoR73z7X/HSS1/AT6+7iRc89xk88dwn8Iubb6XWbKL8crECZogjatIFKj3fenHa5jT8eh2/3rTVQcLY4DXNWDnlGl6lytKeR6nXK0xu2GCLHIOASr2K75dwhRSHqUAnJyWTF9ZYs+zX1F+N+i7L0WiNFBrdnUcnIROnXoTbOJZgYQ+OXyJeXkEHAUZKZLmGOzaBUW1UZz/h4n7i1X0kK/tR3UOW4uKVcUo1RMXLMnWlcpmlvXv5ydXX8PF/fx+ve90r+MiHPsSbLn8Nxz3+PP753z7GUy84j9f8yUu45Re3FnK6hXK1NfV7Ka/HmKyct3towZ4XadCqLS4DRuGEPYJl0FFA0FYsz83ZXEAUU6pVcb0Swp/eZsTakyZnx+SaMRVFMzfIfomcvRS5n6W/paMO7vhx1DY/icVffYjK+pOZOPU1hK1FWwTSa2OExK00EaWq1S363dcIFx/AxIHFihwX4ZaQrg+Ol2NjkDEyJIYw6DI10eSGa67EGMMZ25/MX7zpjRx33NH86atew1XX/IDTTzuNi17ySu684zdU6nVU6jbn6y/zGXKjNa7nZ+CjwVCfmKF9aD5zK/tosum7oCnP1miLGFuY38mkCqTQem39kzEFMlEalWQpOZMr5MrRV1MTZIpCS3330xirLRF36Tx2LcL1qW+9gLi1jIl66E4b4dRsImPpQYQShLtvo7f3V6m7OobXmMGpTeGW6kjHtzx7IS0VXQyERowxlCtVDjy2m8998ascc8wxvOJVr+CjH/4oxxx1JLObj+SKT34WXJeXXnJxltfIeN3GINbizIhC6VMKwQiBEE6miELmdvZJzjKTuXFcS34zRiMdB+lIHLc29S6BSIOtofqfFFoQOTrisEKWyFdjCArlowMFLQY3k3RIOvOUZ06kMnsu8eqiBcuFg+MaVh/6DuX1p+M3Z2k/+D2MSXD8euogWFCQtADaZJT5YoFQv9RJCdi7dy9Pf9rTOPLIzXzxs59lbGY9555/Hv95xcc459zzOfW0U7nltl+xf99+fN/PkE1jBvpBNuoVKRNf5xaoIQ57BSERIUilHxz8cg2tE6Tr4/qV1KI71KfXo8KASrOJU1+/7V1epYJbqeKWSlZEyC/hlsr4lTqO76PiGL9aRzgeOknwSuUUnkiQrovjebZOSsoMtJN9T6LAmembN0XjyGehlYsOexhj8KqTrNz7RbzaOsYe93yig/fS3nWjHXxBWvky+DPAl/rFLf2VO/BeXN9nYe8eJqYnOe9JT2b//EG+883v8NrXvYarr/4JYZzwrGc9gySOuPGGm/Aq5QIYJ0bKFQwppOhcrbNWOF6JcnOS6tgUjudSro9Tqo/h1xo4XokkDKiMT9GYmcV1XRxk5V1ou/pVHKfRrf1qjEbFMTpJ0oNKopMoU8bKcqa5Ep7BA4gidygdLaNCvMYWKrPnkrQW7dYsjRMv/47e3C+ZPPXVCFmm9eCVJL1DqVsosvqAYW2JzGSkqlX53SCEQCUJBw8e4MkXXMD69Rv4xpe/yOymrZx21tl84ytf4swnnM3mo47h17ffzsGDh/A87/DqK8OBlhAW69dqcEfaYmRhp0XUWSUJA8LVJYLWIZJeF6NjwtVlwnaL3uoKTmVy/btEWlwgpJuyyLTNiCWxtb+ua8EzleB6flaGIx3HHlrpZPUr1u0k5CjvWWWNRCcB9S3Pwuiy5YkCTrlK6+HvUp09lfK67cTLD7K66zocv5rbQfkAqEhbErkKy2F/zvV95vfsZeOmjZx8+lksHFjgBz/8MbOzM/z2lzdRrtbZfu6TcEi49eZb8SvlERmvEbqBCIxR1CeniaMwiw0y5ykF6FQSDfQhUpNujEYlMUYpZGV8Bq/aoDI+SW16Bq9UwfFLVJpTVMam8as1nFKJUr2JV60hXA/H9zN0U/Q5PbkCN5GaiIG2QlquHQd4jY14ta2osJWmJMdIVh7EJC2qG87HGIfu3O0Yo6xi19BBT4onDRh8Bp3yL/P/D1gLtrL/6h/+iF63y7OfdyEm7vGdb3wdvznDzT+/mbk9Ozn7nHPZdOQmgl6QqqsMDtKBSI8ZgqQlcRCkgz80Xf1FIWXKe8qpDQgxKNTzp44xA6JRTjeykN8UQ1nPvIzlGhWhIhEyq5aXqKhFY9ulOP5Wkt5BQOL4NaRjQEfg1IEOS7/7DMLxrYSaEGtlJ82QqNwoScq8VAKapNvm7e/8OzYdcwKHDuyzxDBHkiSKRrPJ2MQUt1z/Uz7xsU9SGx9HqcF4GJHK6GBwXAeVDLwmPSw6ktdFMiPFiArF3xKjQOiUaJtfzUPUwsKUmFyNrB6t2zCMTKgQt7KOUnMbkOBVp/Cq40hXgPTBaSBLVXrzv0Sr0GrNiRF1//yeSp5Ri0CAlA4qibnmqqvwRUyz2WRicoJGc4yp6WlcKQk7Lc4860ym188ShlFeyq4giqa1KTjoIpemNEal+5GUsGDdVa2LiKnJZdSEN77FFMSQ+tsmh2jmPc3DzenhtCJlX87O9CVtnExhcaCB0t/aDkb1EK6LkG5KeWHtih8qT8tI3IchJvdxGB2HTI7XM3mfftZOplp4wvFoBzFxoqwXZ9aqq2Tob79mz3UGpblpTtwobSELFeN4JbsAogCVREWqo80H1OybYNOPjuMRtA4N0ouk8otrVeRGaLyIgsCRyO8WBEZHGBVmUWDetRN2qSLcMqIfVBXUScTQ8hGFumSjR0kK5FETgXRdFg6uDO3aPuHK2mrXK1k+pzGHUbvrn232yRy/nB4HDm6pQtzrWLe90iDutXFcH9fzcaQk6CT2bMtophrR2HKakWlZvVdrIqRPb3nBsrqESXXkRI6c9IfVS4oSxXmGhMkmZFgBIJOs6RPDRiGr4g9o6wlxGGHXvs3VRUmZHG0yk0jL5UCGP3Z49RpMmg1M1YJFToJWSJsr1yo7KzVW1kCkMkCuV8INu207UElIb+WgpZ+7rjUHufRisepRDClGZWIMORctJ3mcBk1G5lNzJpfQsaSuInaUgwCywM6kpaNrK1b6gWC/cK4/WI500s1kSD3FnHCgXSDSkZktVzlTI1N2+Ci1uf6tynK/hEmkmI+yXpROECi0sfBEuTmG45VJ4gjX9dIkF7iN9Zvxa03i1SWSsIeOenYLNcYBq6SYhD10Eg70o/v+rNaFghDVXs0GX/q+TR2m270v8qQ7HUReosYYhOfZzFde5CM3SUEQWLlkwK/VrCaEKSozBlGIDqy0slut4qVZvU6rZf1v16Vcq+ak0gZuSm+1ba8RklKtipEQR7HNTZhhSc70/pR9BrepKVdrqDhOofY449WanPCVVgrp2MnRia2YDIMIUZ7eZhy/bKNfrdJSSpUehINyVasRbd9YJ4mlXGidHdLCwIa/fAvu+g04vsfiN77G0vXX4tbrWU5BSMmGv3gzzuwGiGOrzFir0r7+eg5+42vIWq2gaiulJFht8+KXXMSLX/g8gjDk3f/8QR59bA/lcsnW+Dr2mmc++2m85o9fgtKaf/ngFdxz9++oVKv8/dv/kqO2bubOu3/H+z94BaWyn1U0AsRRxP/+m7/g5BOPZ8cjO3n3+z5I2OnxxCeexZv//HXEcZzWipErwBMcWlzinvsf5DtX/oiDc/P49VpazpST/Mkgin5CRhc8BiHAdX2fJOykiJ6HEQav1iTurKLCIJ1wMbT6xUDgQgjUygrjT306Y6+4nLi9itNoMlUdY+WGa+1KkekHakXjOS9EHLsJ0wW92kZO1onnFix3pl4vYjFCoHtdznz8SbzkRc8H4MMf+zQ7ogjKpdw1PU489mguu/QiAL745W9wdxDg1Cq8/MUXsWXzJjasX8f7/uXfoVQq6P2oJObi5z2L0089hUcefYz3vO+D6DBgy6b1vPSSF/zBc+5v3nw5L375a7n77nsp1Rs2g9d3QbIxsnGQkGLgvqcT6QrHsbTDKEC6qRYCFuMgdZtMSrQSA5B/oJesFRJN86LLCPYvQa9LNLeEt/Ukmuc+hZUbr8UdnwRlV8DBKz6IqDeQpRq1516KDAx6eXUAXeQDqLTWrNPpoJSi1+uldci5eDeFyLtde43BEMdxavc1S8srbDxiA62VlbS4bgCnCwwozfLyCkoplpdXMDoBrQiDLkoplNb8x8c+zp2//jVepYlSClTIueecwyte+cccc/SRfOhf/5FnPOclaSInrSpSMdKR1jSlkDVp+ZJwS9aKRQFu1GkjpYNXrtoiM6VIusqucGE1bpIoGGgp5M20lJjVFvUzn4h/7HbiVkT4vS/gn/JExPFnMXnRK2nfejMoW2motWbu85/EmDbl9duoPf1SdM9gkj5/ZpSwqtXcdBwn271CWLoHQtvDN4U8HMchjhNrxrS2vCZt7O+mK1Lk2cxpHVf/Gq37Emo6FXVycByH6667iau+902gDlid7M9/7tOsW7eOiy56HsccdSRTs5McWFiiXK3j+KXU/5eppdA4fhkVK8LWIuObj8P1PDoLu3FLjUnKzQlM2mhA6IQkDlBxgo5jnLIVYjJxlIpw5NRl09U09qzLSLouTusA85/9V6Ze+DoaGx+Pu+U06qc/kdavbsSpNxFG4U9Oo7pl3PEpTEehRYSJU/KSMWt0JgCU0iQaolgR9nqYXoeO49q6LEdiTJc4jlEaekGcpgvtbEVxgjKgEl3w2DLZZAFRolAGojgpyOYFYYLrSmRfRd4rgfLAKDyvlCWF9s8vsHLwIK7jWYHbOMJxQxA2TtBJTNTrppWhljmnkwi/VsftLR8gWFnMaBLW1UsyTyFcWbCHcSbWkXHySLptqsediNx4GslSgL79BpLeKu1br6f5tFfTE1Wq517Eyq+uG3Du+0kaDXo1tsn+ULMGTsnrEmlNpxuy2uny3vf8A63WakoY1nZ1K8XmzZvYP38Qz/fQOUg8ihM63Zg4SQoi83nYK45jOr2IMEqyqFwpTacXEIURl1xyMccd/zjKlWpKs9GcftqpnPmE7Tz86F7e/Z5/Jux2KY1N2s82hiTq2YRN0B5CEASdg/vBGILWMi7kdCz71Y+yEMdnE2KGMl2omMa5lxK2JI6aZ/FHn0e4dbqP/pbVn/0X3qkXI2dPoXr8dnoP3omsNgbSNwZUK0K5ATpKVWmHks591CVRipVOj8WVNk88/8l4vgdppXrfFLZaLeYXDjIxNjYQGREQRjGtbo8gdRPXYvoQJ4rVbkCUJBkSqpKEThCxuHiI5zz/+bzk5Zdl3rHS0O50WV1t8fCOh/n17XdY9bBhZZlU/LCAjxiDcJ00vWkG4t15rGVAM1wjNDmAlnttKltPwN36JMKORizch2odoLJhC0lnheC+X+Cf8FzCxKNx3svoPXhnTpHK5h9UO0LJCB2qgTwwOi2BHUDOSaJY7fZIlObTn7yCgwsL+H4l1Z8wxCri8aeezqlnPoFuEAxu3mg6vZClVgelDMKVhQ42Ig3UEqVZXu0ShnEGRmptaLW7aCn52le+wn33/g7fL5MoTRJHrJud4hnPfh7rNx/NV77xFV75ytezf24Br+ShspxyTgDKyJwVMVlE7BY7XgxNAkVJ4Hzxo446VE9+JuGyJuks4FSOYvIVnyqgO9FSl7gb4UycRGnzCQQ778GtjWdgmFqNSESAiVVB3my4YD+OFUtLqyRRyKc/81keefAeoJTKJTtAyEtf/ipOPu1s2mE3lcE09LpdDiwsMLFuA1PTU9RqDaJE46ZZryiIqFdKlKsNFg6tcGDhIGEQQKocEwS2NPfqH/6Qq3/4X0AlJ8fc47Zb7+Dv3/Me6uPTPP/5z+Hj//4RvNJMTtY/hx6kD6QzJqFAa2UlsjPZSGPyqqfWXvbVoQYKeOg4oDRzJM7sduJ9+3AMqBA0Yxhh/yhTx/QUMgwJF1apnvTc9Mb6cvkG1Qkxqz1MqIsJF1MEfOIkYbndY6XdpT42geNPUp2cpTy+gdrUBhynjuNXWFxps7zaI05ikJK4F7DjoYfohRG15gQvftFFREvzdFdW6K20UK1FLr7oBfi1Bp1uwG/vvpukswoSEq1Z6QSsdnqp4LaEcg28Kvg1wGPnrl30eiH7Dxxicmra0mRcH8erIN3SQGNYOEjHQ3pl/NoYrldC68jqBfUHxXE9dBrxSulmqB0pxGptWSpNHIVUTrmYqFdFOiHxPV+h99ivcEqNbPC0MZB0aTzhchJnI8667ZS2nEq0/8G0tVWC7oY2oo9VgYWRmQlj7WeUJKx2OrYgI/VYNBKVupJKWQ9mZbVjlQu19cdlpcJVP/gRFzzzQh5dWOa5F19Cvd7gzjvuwCA444wzeNqzn838wWVmxutcc82PkeUqOgqJgh4Hl6zk2FFHb+PMs59KpdmwsUESUyu5XHjRi9izsMz6dVPsm5uH8hhedSyDaBzPt0QGZevsvEoFVIgxmuRAwPTRJ+GWm9P4zQlcr0yS0g91EpMEXaLVQ3jVpt0qwuaIdRzgTm1CrnsiYSuhXOux+uvvkgQdhMhJs0sHE7dwx3+Cf8ZbCJYCysc/j3DPbyx3xoAKDEoLpHJyAq1mTZ7BIGj3YhyT4vRC2kkUxcOqE8R40uB4VlqnXK1xzx13csW//1/+6PVv4FA7YPsFz+K8pz0LbSBShgMrAesmanz64//BA/feT3Vyiu6irWlWGuYXltj+1Odw/rOfnyrkWsBOI+mFEZ7r8tC993Dlt76J40DUXs4UVhLp2ty60eg4QvV8/Pq4pWQqTdRt40a9VZSK7LM4EoNEhUFWTqnCLn0injGgwzbVo8/DhF182SW8/2p0FOE11uUK19JpKNXoPXYL3lF3IUwdpzaLN7mFaHEnGIlIWjgyRnUXswYQa11RyfLysmUVxBG9IKLfeiv7z5Gsrq4StpcITUKn07EPrhReo8GV3/4me3bv4qJLX8bsERsJHA8NxGHIwtwePv1f3+JXt/0SvzllV6/r0gtjgtYiSW+F+e5KDg/qC/tBr93lofvv5cpvf5NWu4tXqWKUg1up24hXOoTtJUq1uo1/woA46OCXa4zNbiJcPYRwausHejIZP1Jmvn7WT6a/GpWtIbZkXNuiTzqllBXWV0dM1W+NzpgPwvUAe1M2Qk2FT1M4wyavnUEon+lK2FJZL808xUrbZH2WtbOyN8Joew2GRJm08tGi8MIYotUVkJJ162cZa9QBQWu1xfzcHGiD1xhLn1da86s1viezrJkQhmHdjqDbs40ZyjU8r4QxBscv49XHU6kcQdRdpTm9ntrULHGvQ3dxjsr4lOVT+WWE09gwcMGFyPVjMUMJ+L5nZx+4X74jHA8pXRsniGLO0PT18tPrhRBIx7MTqFXa/srKnQnHzfIJRYqyxiiV9iGTVmqyn6zvF6FpCwMrZT/DcZysK1SfGm6hEEUSWiUTu3Nc3JJNGVqd6JybqpWFZoZaHuYDKulIHOmkaR6Za9JjrJhrWnkqpMyJWdl/S+mmrJLqOpMFCyKfeBsWzzZDacFB0lv025eI3HuIorzLoHfXYFUVRbZzXReGpG9Epls6KikvBt0ocj60EazRfWaoT1lfsj67bCgBP/AGB2SwfH8DM5RSNXk6S8ZWFtn7ZJ6+Hsjui/LM40zcaw11TijmfUWuC5IY0nTK93sxuYK8P9jt4r/1g8M3cBhuxjbM2hC5hVPkyBT70Jh+T7NCUzMKPKBBWjvf2mtIlt4MZP+tYJNGCMfWTuckDiwBQNqOGghct1JHRT10HGT2txCuD2X/zJp+XH2VXTMI3MwIGoNY2/0mLxScX2VFueJRrw/1UhiSHBYMFdfl8R+Rbwo36Ck51BIoJ01shpTtTUHGvi+7348u3UqN8vh6pOsj0Kg4Qno+0vMJW4eI2odorD+KYHne1mMn3VYqQy8L2m5CmLWUjDVPLwrNN0xuhQmGzYnI90cYonOZXIGEybE+850li8NZ2KFDvf3EyGY/IuORFvRlM+bFQB3XmGLbgAyKEYOKz8xUu36qqZHqxCURQesArmd1U73aGEZFtlthv2+A49CYPoJwdQnhNTYa4di6r37jhYwCnuEWJn88rK2QyZUsmVGMBTHEK14zpoKR3SLXUI1Gla0Y/vsdCc3hXzNrS2OMGFHpWAhRXNxKDRX1UFGQY4HoXM/lfJOztHTJ9fEqNYL2Mq70y5YgJL2BDROS5rqNGANLex8GnWQdsIcp23bQLICWdcQoFDeLtbxJPWgnmTdP4jCG3qwpg8on5NewsAqtFxnqvvF7OzIJMZrrVFBUz0lIiLVNn/pwjewfymbgzudlz5LI4kyu6MOoDHK/SEGp0UxdTTGy2+7I7W+G+oQdrhOSKMrJCXO4FSrS9+tvBb22caRZ21U7q9Qxa8S8Dtv6KmtXLnLCfLkDIuutKQa9b4zRJFHPtnkhpyNkxO9pFGrHV6TdpoRTmTFZwYOlE1vwKG3oZpI+k00XCLn/P918i3zNYkfWwi4vNFQ9jLkRQ0twZPtt8wdvzBQaA/weh8wUGxQVz7z86W2KK0usLXYcNWruGkZXeprrOBi4oFIgjcy4PSJFMwtSXodtOTi87PsxQLHpw5ptkfOojBC5nTVUSns4t1YMzZMZakl1WFskhlxSsabXcx4wcdLyVquVQUZyNkmS5bkzek+fJZeaeaN1mg/I96/JblhkXSH6FYiF6jCpMcoUWlaJAr19eBUe5gA0he6da/q35O368K4wa7q+58+YwXsbM7oH5ej7GqEIbIo9zgad9Bzc2oRlkPTJhypJWwBItFZEq4fwq3XcasMOvOOkRScSFfbsBPTdsWJeRiCctBFCvv2U6CtG6TX2I2vnlNuW4rBL9PedhsNttkeI4xWw0yEOKhzG8B+mT/zQNK7dJUU6pcm1fFVhx4agrpeilVYT2/HLSK2IXQ+nXKO+biNuqWJZEqnCjOUFuX1spdiYYNBXXq4RpXa8Eo5fIWovoaOg2EV1SDPUjGianK8tPkyb07V2Ph+CH27V/rfalA/vBpMrzR1djDSkEDGw+QaSXgsVtIe4+zLXt00RYmxtnXTQcWRl60tlHNfD9cfXZQRYpChEdRlFvV+Al0aAbqWOdEuW8576v/y+ZslDMEC/FXi+8VpRdUQUzow1J3XeIOcjbSOGqmXM4Q/fPA6Vj9zzgKSRmfdjhjdCYeerlHjd//yB2w4Qd1pE7ZVBRVGOdu/G7WVQdnZM/8Nzg6P7qKcYBGVJdxXHL1tK40hZAnHY7Xu46RnoTIvhJ1zriYzyjLRZ4x6bEVIJozePGHkEZE7WUHfYzI0zI5yNzKeWI2ATM9zDGteo2OLSwilWNKaXzhx1PML1mL/nl5jUM9JJkvXGLZSorKkWG9kfvFBsKg6jUigOA0SsOXBzjv7w9IpcGY0wa3s3F4rMzdp9Y3J4UWHetBlyMsxh46Q/BCi6Xn085eZblK7f97BvEuqzm5COw4J0ULku0WIYms7bcTFCdbDQIlYMsFMjhuGyNWCdYBjAG+FmF4ZfFFEcM2IvmiJSLQo1C8UFbwrwMoeR9zcjxSIzNuGoOmNAuGNbjI6DgjpsnortlGtIIYl7q5a23k8HmtEzW0zkmLXhfQ50K2A/hajUjBDLG8ZPKfy+GYnRD8urCsQab2btni26oOL3N49mBC4+HDQWIJLcnjIgZHnGCClxSuUhFle+XHXA7/dq46jQJuwZblvFHwrIhgswhisRR+GeaxrDrpmKIkI/KlI3h/dMR8qL/Z4ITxzG9o8QKRnlDgwDli5C4NWaOKUqOm3Qk9f+7A+YbVrs4pQqlsKdLyHKgCdGLY21E2HW+voD0u+aZGih/fggvsqdEKb4ZCOM4ghzKf4AwipG60ObtYJURVPKH0RsczEi/w+MdI2VDuZokQAAAABJRU5ErkJggg=="
local A1_Logo = "rbxassetid://115361764309114"

pcall(function()
    local getAsset = getcustomasset or getsynasset
    if writefile and getAsset then
        local fileName = "A1_Hub_Logo.png"
        if not (isfile and isfile(fileName)) then
            local decoded = nil
            if crypt and (crypt.base64_decode or crypt.base64decode) then
                decoded = (crypt.base64_decode or crypt.base64decode)(A1_Icon_B64)
            elseif syn and syn.crypt and syn.crypt.base64 then
                decoded = syn.crypt.base64.decode(A1_Icon_B64)
            elseif base64_decode then
                decoded = base64_decode(A1_Icon_B64)
            else
                local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
                local data = string.gsub(A1_Icon_B64, '[^'..b..'=]', '')
                decoded = data:gsub('(.)(.)(.)(.)', function(a, b2, c, d)
                    local f = b:find(a)-1 local g = b:find(b2)-1
                    local h = b:find(c or '=') local i = b:find(d or '=')
                    local n = bit32.bor(bit32.lshift(f,18), bit32.lshift(g,12), bit32.lshift(h and h-1 or 0,6), i and i-1 or 0)
                    local r = string.char(bit32.band(bit32.rshift(n,16),255))
                    if c ~= '=' then r = r .. string.char(bit32.band(bit32.rshift(n,8),255)) end
                    if d ~= '=' then r = r .. string.char(bit32.band(n,255)) end
                    return r
                end)
            end
            if decoded then
                writefile(fileName, decoded)
            end
        end
        if isfile and isfile(fileName) then
            A1_Logo = getAsset(fileName)
        end
    end
end)

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Redz/refs/heads/main/Emerald/ui.luau"))()

-- A1 HUB: Blue and Black Cyber Theme
local A1_Blue_Theme = {
    Name = "A1_Blue",
    Colors = {
        Background = ColorSequence.new{
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(6, 12, 22)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(10, 20, 36)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(6, 12, 22))
        },
        Primary = Color3.fromRGB(0, 175, 255),       -- Vibrant electric cyan/blue
        OnPrimary = Color3.fromRGB(0, 130, 215),
        ScrollBar = Color3.fromRGB(0, 160, 245),
        Stroke = Color3.fromRGB(20, 50, 95),         -- Dark cyber navy stroke
        Error = Color3.fromRGB(255, 65, 75),
        Icons = Color3.fromRGB(180, 230, 255),       -- Ice blue icons
        JoinButton = Color3.fromRGB(0, 140, 240),
        Link = Color3.fromRGB(50, 185, 255),
        Dialog = { Background = Color3.fromRGB(8, 16, 28) },
        Buttons = { Holding = Color3.fromRGB(20, 42, 75), Default = Color3.fromRGB(10, 22, 38) },
        Border = { Holding = Color3.fromRGB(0, 190, 255), Default = Color3.fromRGB(25, 60, 110) },
        Text = { Default = Color3.fromRGB(230, 245, 255), Dark = Color3.fromRGB(150, 200, 240), Darker = Color3.fromRGB(100, 155, 205) },
        Slider = { SliderBar = Color3.fromRGB(0, 175, 255), SliderNumber = Color3.fromRGB(180, 230, 255) },
        Dropdown = { Holder = Color3.fromRGB(8, 16, 30) }
    },
    Icons = redzlib.Themes.Emerald.Icons,
    Font = redzlib.Themes.Emerald.Font,
    BackgroundTransparency = 0.03
}
table.freeze(A1_Blue_Theme)

pcall(function()
    redzlib.Themes["A1_Blue"] = A1_Blue_Theme
    redzlib.Themes["Emerald"] = A1_Blue_Theme -- Overwrite so all instances load Blue & Black
    redzlib.Default.Theme = "A1_Blue"
end)

local Window = redzlib:MakeWindow({
    Title = " A1 HUB",
    SubTitle = "Blox Fruits | Official",
    SaveFolder = "A1_HUB.json"
})

pcall(function()
    if redzlib.SetTheme then
        redzlib:SetTheme("A1_Blue")
    end
end)

local Minimizer = Window:NewMinimizer({
  KeyCode = Enum.KeyCode.LeftControl
})

local MobileButton = Minimizer:CreateMobileMinimizer({
  Image = A1_Logo,
  BackgroundColor3 = Color3.fromRGB(10, 20, 36)
})

local Tabs = {
    Info = Window:MakeTab({ Title = "Tab Info And Status", Icon = "Info" }),
    Main = Window:MakeTab({ Title = "Tab Farming", Icon = "rbxassetid://7733960981" }),
    Settings = Window:MakeTab({ Title = "Tab Setting", Icon = "rbxassetid://7734053495" }),
    Fish = Window:MakeTab({ Title = "Tab Fishing", Icon = "rbxassetid://127664059821666" }),
    Quests = Window:MakeTab({ Title = "Tab Quest And Item", Icon = "rbxassetid://13075622619" }),
    SeaEvent = Window:MakeTab({ Title = "Tab Sea Event", Icon = "waves" }),
    Race = Window:MakeTab({ Title = "Tab Mirage And Race", Icon = "rbxassetid://11162889532" }),
    Prehistoric = Window:MakeTab({ Title = "Tab Volcano Event", Icon = "tent" }),
    Esp = Window:MakeTab({ Title = "Tab Stats And Esp", Icon = "rbxassetid://7040410130" }),
    Raids = Window:MakeTab({ Title = "Tab Fruit And Raid", Icon = "rbxassetid://11155986081" }),
    Combat = Window:MakeTab({ Title = "Tab Local Player", Icon = "rbxassetid://13075651575" }),
    Travel = Window:MakeTab({ Title = "Tab Teleport", Icon = "locate" }),
    Shop = Window:MakeTab({ Title = "Tab Shopping", Icon = "rbxassetid://6031265976" }),
    Misc = Window:MakeTab({ Title = "Tab Miscellaneous", Icon = "rbxassetid://10709783577" })
}

Tabs.Info:AddSection("Status Server")

local TimeZone = Tabs.Info:AddParagraph("Time Zone", "")

function UpdateOS()
    local date = os.date("*t")
    local hour = (date.hour) % 24
    local ampm = hour < 12 and "AM" or "PM"
    local timezone = string.format("%02i:%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, date.sec, ampm)
    local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)    
    
    local LocalizationService = game:GetService("LocalizationService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local result, code    
    
    if not getgenv().countryRegionCode then
        result, code = pcall(function()
            return LocalizationService:GetCountryRegionForPlayerAsync(player)
        end)
        if result then
            getgenv().countryRegionCode = code
        else
            getgenv().countryRegionCode = "Unknown"
        end
    else
        code = getgenv().countryRegionCode
    end
    
    TimeZone:SetDesc(datetime.." - "..timezone.." [ " .. code .. " ]")
end

spawn(function()
    while true do
        UpdateOS()
        wait(1)
    end
end)

local GameTime = Tabs.Info:AddParagraph("Game Time", "")

function UpdateGameTime()
    local GameTimeValue = math.floor(workspace.DistributedGameTime + 0.5)
    local Hour = math.floor(GameTimeValue / (60^2)) % 24
    local Minute = math.floor(GameTimeValue / (60^1)) % 60
    local Second = math.floor(GameTimeValue / (60^0)) % 60
    GameTime:SetDesc(Hour.." Hour (h) "..Minute.." Minute (m) "..Second.." Second (s)")
end

spawn(function()
    while true do
        UpdateGameTime()
        wait(1)
    end
end)

local MirageCheck = Tabs.Info:AddParagraph("Mirage Island", "Status: ")

local previousMirageStatus = ""
spawn(function()
    pcall(function()
        while true do
            wait(1)            
            local mirageIslandExists = game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') ~= nil
            local currentStatus = mirageIslandExists and '✅' or '❌'
            if currentStatus ~= previousMirageStatus then
                MirageCheck:SetDesc('Status: ' .. currentStatus)
                previousMirageStatus = currentStatus
            end
        end
    end)
end)

local KitsuneCheck = Tabs.Info:AddParagraph("Kitsune Island", "Status: ")

local previousKitsuneStatus = ""
spawn(function()
    while task.wait(1) do
        local currentStatus = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and '✅' or '❌'
        if currentStatus ~= previousKitsuneStatus then
            KitsuneCheck:SetDesc('Status: ' .. currentStatus)
            previousKitsuneStatus = currentStatus
        end
    end
end)

local PrehistoricCheck = Tabs.Info:AddParagraph("Prehistoric Island", "Status: ")

local previousPrehistoricStatus = ""
task.spawn(function()
    while task.wait(1) do
        local currentStatus = game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and '✅' or '❌'
        if currentStatus ~= previousPrehistoricStatus then
            PrehistoricCheck:SetDesc("Status: " .. currentStatus)
            previousPrehistoricStatus = currentStatus
        end
    end
end)

local FrozenCheck = Tabs.Info:AddParagraph("Frozen Dimension", "Status: ")

local previousFrozenStatus = ""
spawn(function()
    while wait(1) do
        local currentStatus = game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') and '✅' or '❌'
        if currentStatus ~= previousFrozenStatus then
            FrozenCheck:SetDesc('Status: ' .. currentStatus)
            previousFrozenStatus = currentStatus
        end
    end
end)

local CakePrinceStatus = Tabs.Info:AddParagraph("Cake Prince", "")

spawn(function()
    while wait(1) do
        local cakePrince = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
        local killStatus = "Cake Prince: ✅"
        if string.len(cakePrince) >= 86 then
            local killCount = string.sub(cakePrince, 39, 41)
            killStatus = "Killed: " .. killCount
        end
        CakePrinceStatus:SetDesc(killStatus)
    end
end)

local RipIndraCheck = Tabs.Info:AddParagraph("Rip Indra", "Status: ")

local previousRipStatus = ""
spawn(function()
    while wait(1) do
        local currentStatus = (game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or 
                               game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")) and '✅' or '❌'
        if currentStatus ~= previousRipStatus then
            RipIndraCheck:SetDesc("Status: " .. currentStatus)
            previousRipStatus = currentStatus
        end
    end
end)

local DoughKingCheck = Tabs.Info:AddParagraph("Dough King", "Status: ")

local previousDoughStatus = ""
spawn(function()
    while wait(1) do
        local currentStatus = (game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or 
                               game:GetService("Workspace").Enemies:FindFirstChild("Dough King")) and '✅' or '❌'
        if currentStatus ~= previousDoughStatus then
            DoughKingCheck:SetDesc("Status: " .. currentStatus)
            previousDoughStatus = currentStatus
        end
    end
end)

local FullMoonCheck = Tabs.Info:AddParagraph("Full Moon", "")

task.spawn(function()
    while task.wait(1) do
        local moonTextureId = game:GetService("Lighting").Sky.MoonTextureId
        local moonStatus = "Moon: 0/5"
        
        if moonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
            moonStatus = "Moon: 5/5 (Full Moon) ✅"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
            moonStatus = "Moon: 4/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
            moonStatus = "Moon: 3/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
            moonStatus = "Moon: 2/5"
        elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
            moonStatus = "Moon: 1/5"
        end
        
        FullMoonCheck:SetDesc(moonStatus)
    end
end)

local LegendarySwordCheck = Tabs.Info:AddParagraph("Legendary Sword", "Status: ")

spawn(function()
    while wait(1) do
        local swordStatus = "Not Found"
        
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
            swordStatus = "Shisui ✅"
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2") then
            swordStatus = "Wando ✅"
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3") then
            swordStatus = "Saddi ✅"
        end
        
        LegendarySwordCheck:SetDesc(swordStatus)
    end
end)

local BoneCount = Tabs.Info:AddParagraph("Bone", "")

spawn(function()
    while wait(1) do
        local bones = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
        BoneCount:SetDesc("You Have: " .. tostring(bones) .. " Bones")
    end
end)
local RFSubmarineWorkerSpeak = replicated.Modules.Net["RF/SubmarineWorkerSpeak"]
WeaponDropdown = Tabs.Main:AddDropdown({
    Name = "Select Weapon",
    Options = {"Melee","Sword","Blox Fruit","Gun"},
    Default = "Melee",
    Callback = function(Value)
    _G.ChooseWP = Value
end})


spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if _G.ChooseWP == "Melee" then
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        _G.SelectWeapon = v.Name
                    end
                end
            elseif _G.ChooseWP == "Sword" then
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        _G.SelectWeapon = v.Name
                    end
                end
            elseif _G.ChooseWP == "Gun" then
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        _G.SelectWeapon = v.Name
                    end
                end
            elseif _G.ChooseWP == "Blox Fruit" then
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        _G.SelectWeapon = v.Name
                    end
                end
            end
        end)
    end
end)
Tabs.Main:AddDropdown({
    Name = "UI Scale",
    Options = {"Small", "Normal", "Big"},
    Default = "Normal",
    Callback = function(Value)
        local scales = {Small = 0.8, Normal = 1.0, Big = 1.2}
        Window:SetUIScale(scales[Value])
    end
})


-- ========================================================================
-- A1 HUB: ADVANCED AUTO FARM LEVEL & QUEST TRACKING ENGINE
-- Powered by modular Quest-Mob Architecture & Real-Time Sync
-- ========================================================================

local LocalPlayer = plr
local LastFarmStatus = ""
local function LogFarmStatus(newStatus)
    if LastFarmStatus ~= newStatus then
        LastFarmStatus = newStatus
        print("[A1 HUB] " .. tostring(newStatus))
    end
end

local function GetCommF()
    local remotes = replicated:FindFirstChild("Remotes")
    local commF = remotes and remotes:FindFirstChild("CommF_")
    if not commF then
        commF = replicated:FindFirstChild("CommF_", true)
    end
    return commF
end

local PlayerData = {
    GetLevel = function()
        return GetPlayerLevel()
    end
}

local TweenManager = {
    To = function(cf)
        shouldTween = true
        _tp(cf)
    end,
    Stop = function()
        shouldTween = false
        if _G.TweenCache then
            pcall(function() _G.TweenCache:Cancel() end)
        end
    end
}

local function RegisterIslandSpawn(pos)
    pcall(function()
        local commF = GetCommF()
        if commF then
            commF:InvokeServer("SetSpawnPoint")
        end
    end)
end

-- ========================================================================
-- COMBAT FRAMEWORK HOOK & FAST ATTACK ENGINE
-- Bypasses client animation locks and registers high-speed server hits
-- ========================================================================
local FastAttack = {
    LastAttackTick = 0,
    TargetParts = { "RightLowerArm", "LeftLowerArm", "RightHand", "LeftHand", "UpperTorso" },
    CombatController = nil
}

local function SetupCombatController()
    pcall(function()
        local ps = plr:FindFirstChild("PlayerScripts")
        local cfObj = ps and ps:FindFirstChild("CombatFramework")
        if cfObj then
            local cf = require(cfObj)
            local getUpvals = debug.getupvalues or getupvalues
            if getUpvals then
                local up = getUpvals(cf)
                for _, v in pairs(up) do
                    if type(v) == "table" and v.activeController then
                        FastAttack.CombatController = v.activeController
                        break
                    end
                end
            end
        end
    end)
end
SetupCombatController()

local function SmartEquipWeapon()
    if _G.SelectWeapon and _G.SelectWeapon ~= "" then
        EquipWeapon(_G.SelectWeapon)
    end
    local char = plr.Character
    if char and not char:FindFirstChildOfClass("Tool") then
        local bp = plr:FindFirstChild("Backpack")
        if bp then
            for _, tool in ipairs(bp:GetChildren()) do
                if tool:IsA("Tool") and (tool.ToolTip == "Melee" or tool.ToolTip == "Sword" or tool.ToolTip == "Blox Fruit") then
                    pcall(function() char.Humanoid:EquipTool(tool) end)
                    break
                end
            end
        end
    end
end

function FastAttack.Attack()
    local now = tick()
    local minDelay = 0.08
    if (now - FastAttack.LastAttackTick) < minDelay then return end
    FastAttack.LastAttackTick = now

    local char = plr.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not root or not hum or hum.Health <= 0 then return end

    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then
        SmartEquipWeapon()
        tool = char:FindFirstChildOfClass("Tool")
    end
    if not tool then return end

    if not FastAttack.CombatController then
        SetupCombatController()
    end
    if FastAttack.CombatController then
        pcall(function()
            FastAttack.CombatController.timeToNextAttack = 0
            FastAttack.CombatController.hitCombos = 0
            FastAttack.CombatController.attacking = false
            if FastAttack.CombatController.attack then
                FastAttack.CombatController.attack()
            end
        end)
    end

    pcall(function() tool:Activate() end)

    local hitData = {}
    local primaryPart = nil

    local enemyFolders = { workspace:FindFirstChild("Enemies"), workspace:FindFirstChild("Characters") }
    for _, folder in ipairs(enemyFolders) do
        if folder then
            for _, enemy in ipairs(folder:GetChildren()) do
                if enemy ~= char and not enemy:GetAttribute("IsBoat") and not game:GetService("Players"):GetPlayerFromCharacter(enemy) then
                    local eHum = enemy:FindFirstChild("Humanoid")
                    local eRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy.PrimaryPart
                    if eHum and eHum.Health > 0 and eRoot then
                        local dist = (eRoot.Position - root.Position).Magnitude
                        if dist <= 65 then
                            local hitPart = enemy:FindFirstChild("Head") or enemy:FindFirstChild("HumanoidRootPart") or eRoot
                            table.insert(hitData, { enemy, hitPart })
                            if not primaryPart then
                                primaryPart = hitPart
                            end
                        end
                    end
                end
            end
        end
    end

    if #hitData == 0 or not primaryPart then return end

    local lcr = tool:FindFirstChild("LeftClickRemote")
    if lcr then
        pcall(function()
            lcr:FireServer((primaryPart.Position - root.Position).Unit, 1)
        end)
    end

    local regAtk = replicated:FindFirstChild("RE/RegisterAttack", true)
    local regHit = replicated:FindFirstChild("RE/RegisterHit", true)
    if regAtk then
        pcall(function() regAtk:FireServer(0) end)
    end
    if regHit and primaryPart and #hitData > 0 then
        pcall(function() regHit:FireServer(primaryPart, hitData) end)
    end
end

AttackNoCoolDown = function()
    FastAttack.Attack()
end

-- ========================================================================
-- INFALLIBLE QUEST STATE TRACKER
-- ========================================================================
local FarmState = {
    HasActiveQuest = false,
    QuestGuiSeen = false,
    TargetMob = nil,
    QuestName = nil,
    CurrentQuestMob = nil,
    AcceptedTime = 0,
    AcceptedLevel = nil,
    LastSeenQuestTime = 0,
    CurrentKills = 0,
    MaxKills = 0,
    QuestTitle = "",
    QuestStatus = "NO_QUEST",
    KillsThisQuest = 0,
}

-- ========================================================================
-- REPLICATEDSTORAGE & WORKSPACE NPC RESOLVER
-- ========================================================================
local function GetNPCModel(npcNamePattern, maxDistFrom)
    local foundModel = nil
    local foundDist = math.huge

    pcall(function()
        local wNPCs = workspace:FindFirstChild("NPCs")
        if wNPCs then
            for _, npc in ipairs(wNPCs:GetChildren()) do
                if npc:IsA("Model") then
                    local nLower = npc.Name:lower()
                    if nLower:find(npcNamePattern:lower(), 1, true) then
                        local part = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Head") or npc.PrimaryPart
                        if part then
                            if maxDistFrom then
                                local d = (part.Position - maxDistFrom.Position).Magnitude
                                if d < foundDist then
                                    foundDist = d
                                    foundModel = npc
                                end
                            else
                                foundModel = npc
                                return
                            end
                        end
                    end
                end
            end
        end
    end)

    if foundModel and (not maxDistFrom or foundDist <= 100) then
        return foundModel
    end

    pcall(function()
        local rNPCs = replicated:FindFirstChild("NPCs")
        if rNPCs then
            for _, npc in ipairs(rNPCs:GetChildren()) do
                if npc:IsA("Model") or npc:IsA("Folder") then
                    local nLower = npc.Name:lower()
                    if nLower:find(npcNamePattern:lower(), 1, true) then
                        local part = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Head") or (npc:IsA("Model") and npc.PrimaryPart)
                        if part then
                            if maxDistFrom then
                                local d = (part.Position - maxDistFrom.Position).Magnitude
                                if d < foundDist then
                                    foundDist = d
                                    foundModel = npc
                                end
                            else
                                foundModel = npc
                                return
                            end
                        end
                    end
                end
            end
        end
    end)

    return foundModel
end

local function GetNPCCFrame(npcNamePattern, fallbackCFrame)
    local model = GetNPCModel(npcNamePattern, fallbackCFrame)
    if model then
        local part = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Head") or (model:IsA("Model") and model.PrimaryPart)
        if part then
            return part.CFrame
        end
    end
    return fallbackCFrame
end

-- ========================================================================
-- QUEST DETECTION & PROGRESS PARSER (TrackedQuestFrame + Main.Quest)
-- ========================================================================
local function GetQuestGui()
    local pGui = plr:FindFirstChild("PlayerGui")
    if not pGui then return nil end

    for _, guiName in ipairs({"Main", "Main (minimal)"}) do
        local main = pGui:FindFirstChild(guiName)
        if main then
            local q = main:FindFirstChild("Quest")
            if q and q:IsA("GuiObject") then
                return q
            end
        end
    end

    local tqf = pGui:FindFirstChild("TrackedQuestFrame")
    if tqf and (tqf:IsA("GuiObject") or tqf:IsA("ScreenGui")) then
        return tqf
    end

    for _, gui in ipairs(pGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Enabled then
            local q = gui:FindFirstChild("Quest") or gui:FindFirstChild("TrackedQuestFrame")
            if q and q:IsA("GuiObject") then
                return q
            end
        end
    end
    return nil
end

local function GetTrackedQuestInfo()
    local pGui = plr:FindFirstChild("PlayerGui")
    if not pGui then return false, nil, nil, nil, nil end

    local mobName = nil
    local curKills, maxKills, leftKills = nil, nil, nil
    local isTracked = false

    local tqf = pGui:FindFirstChild("TrackedQuestFrame")
    if tqf then
        local active = true
        if tqf:IsA("ScreenGui") and not tqf.Enabled then active = false end
        if tqf:IsA("GuiObject") and not tqf.Visible then active = false end

        if active then
            isTracked = true
            for _, desc in ipairs(tqf:GetDescendants()) do
                if desc:IsA("TextLabel") and desc.Text ~= "" and desc.Text ~= "Quest" then
                    local txt = desc.Text
                    if not curKills or not maxKills then
                        local c, m = txt:match("(%d+)%s*/%s*(%d+)")
                        if c and m then
                            curKills = tonumber(c)
                            maxKills = tonumber(m)
                        end
                    end
                    if not leftKills then
                        local rem = txt:match("(%d+)%s*[Ll]eft") or txt:match("[Rr]emaining%s*:%s*(%d+)") or txt:match("(%d+)%s*[Rr]emaining")
                        if rem then
                            leftKills = tonumber(rem)
                        end
                    end
                    if not mobName and AllMobSpawns then
                        for mName, _ in pairs(AllMobSpawns) do
                            if txt:lower():find(mName:lower(), 1, true) then
                                mobName = mName
                                break
                            end
                        end
                    end
                end
            end
        end
    end

    if not mobName and AllMobSpawns then
        for _, child in ipairs(pGui:GetChildren()) do
            if AllMobSpawns[child.Name] then
                if (child:IsA("ScreenGui") and child.Enabled) or (child:IsA("GuiObject") and child.Visible) then
                    mobName = child.Name
                    isTracked = true
                    break
                end
            end
        end
    end

    if curKills and maxKills and not leftKills then
        leftKills = math.max(0, maxKills - curKills)
    end
    if maxKills and leftKills and not curKills then
        curKills = math.max(0, maxKills - leftKills)
    end

    return isTracked, mobName, curKills, maxKills, leftKills
end

local function IsQuestGuiVisibleDirect()
    local isTracked, _, _, _, _ = GetTrackedQuestInfo()
    if isTracked then
        return true
    end

    local qGui = GetQuestGui()
    if qGui and qGui.Visible then
        return true
    end

    pcall(function()
        local gm = replicated:FindFirstChild("GuideModule")
        if gm then
            local mod = require(gm)
            if mod and mod.Data and mod.Data.QuestData and mod.Data.QuestData.Task and next(mod.Data.QuestData.Task) then
                isTracked = true
            end
        end
    end)
    if isTracked then return true end

    return false
end

local function GetQuestProgress()
    local isTracked, _, curK, maxK, leftK = GetTrackedQuestInfo()
    if isTracked and curK and maxK and maxK > 1 then
        return curK, maxK, leftK
    end

    local qGui = GetQuestGui()
    if not qGui or not qGui.Visible then return nil, nil, nil end
    local container = qGui:FindFirstChild("Container")
    if container then
        for _, desc in ipairs(container:GetDescendants()) do
            if desc:IsA("TextLabel") and desc.Text ~= "" and desc.Text ~= "Quest" then
                local c, m = desc.Text:match("(%d+)%s*/%s*(%d+)")
                if c and m then
                    local numC = tonumber(c)
                    local numM = tonumber(m)
                    if numM and numM > 1 then
                        local left = math.max(0, numM - numC)
                        return numC, numM, left
                    end
                end
            end
        end
    end
    return nil, nil, nil
end

local function GetActiveQuestTitleDirect()
    local isTracked, mobName, _, _, _ = GetTrackedQuestInfo()
    if isTracked and mobName then
        return mobName
    end

    local qGui = GetQuestGui()
    if not qGui or not qGui.Visible then return nil end
    local container = qGui:FindFirstChild("Container")
    if container then
        local qTitle = container:FindFirstChild("QuestTitle")
        local titleObj = qTitle and (qTitle:FindFirstChild("Title") or (qTitle:IsA("TextLabel") and qTitle))
        if titleObj and titleObj:IsA("TextLabel") and titleObj.Text ~= "" and titleObj.Text ~= "Quest" then
            return titleObj.Text
        end
        for _, desc in ipairs(container:GetDescendants()) do
            if desc:IsA("TextLabel") and desc.Text ~= "" and desc.Text ~= "Quest" then
                local txt = desc.Text
                if not txt:match("^%s*%(?%d+/%d+%)?%s*$") and not txt:match("^%s*%d+%s*$") and #txt >= 3 then
                    return txt
                end
            end
        end
    end
    return nil
end

local function DoesActiveQuestMatch(qData)
    if not qData or not qData.Mon then return true end
    local title = GetActiveQuestTitleDirect()
    if not title or title == "" then return true end
    local lowerTitle = title:lower()
    local lowerMob = (FarmState.CurrentQuestMob or qData.Mon):lower()
    if lowerTitle:find(lowerMob, 1, true) then return true end
    local stem = lowerMob:gsub("s$", "")
    if #stem >= 3 and lowerTitle:find(stem, 1, true) then
        return true
    end
    return false
end

local function IsQuestActive(qData)
    local isGuiVisible = IsQuestGuiVisibleDirect()
    local now = tick()

    if isGuiVisible then
        FarmState.HasActiveQuest = true
        FarmState.QuestGuiSeen = true
        FarmState.LastSeenQuestTime = now
        FarmState.QuestStatus = "IN_PROGRESS"

        local curK, maxK, leftK = GetQuestProgress()
        if curK and maxK then
            FarmState.CurrentKills = curK
            FarmState.MaxKills = maxK
            FarmState.LeftKills = leftK
        end

        local isTracked, mobName = GetTrackedQuestInfo()
        if isTracked and mobName then
            FarmState.CurrentQuestMob = mobName
            FarmState.TargetMob = mobName
        end

        local title = GetActiveQuestTitleDirect()
        if title and title ~= "" then
            FarmState.QuestTitle = title
        end

        return true
    end

    if FarmState.QuestGuiSeen and not isGuiVisible then
        if (now - (FarmState.AcceptedTime or 0)) > 2 then
            FarmState.HasActiveQuest = false
            FarmState.QuestGuiSeen = false
            FarmState.CurrentQuestMob = nil
            FarmState.AcceptedLevel = nil
            FarmState.CurrentKills = 0
            FarmState.MaxKills = 0
            FarmState.LeftKills = 0
            FarmState.QuestStatus = "COMPLETED_OR_ABANDONED"
            return false
        end
    end

    if FarmState.HasActiveQuest and (now - (FarmState.AcceptedTime or 0)) < 25 then
        return true
    end

    FarmState.HasActiveQuest = false
    FarmState.QuestGuiSeen = false
    FarmState.CurrentQuestMob = nil
    FarmState.AcceptedLevel = nil
    FarmState.CurrentKills = 0
    FarmState.MaxKills = 0
    FarmState.LeftKills = 0
    FarmState.QuestStatus = "NO_QUEST"
    return false
end

-- Real-Time Abandon & Visibility Listener
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local questGui = GetQuestGui()
            if questGui then
                for _, desc in ipairs(questGui:GetDescendants()) do
                    if (desc:IsA("TextButton") or desc:IsA("ImageButton")) and not desc:GetAttribute("A1AbandonHooked") then
                        local bName = desc.Name:lower()
                        local bText = (desc:IsA("TextButton") and desc.Text:lower()) or ""
                        if bName:find("abandon") or bText:find("abandon") then
                            desc:SetAttribute("A1AbandonHooked", true)
                            desc.MouseButton1Click:Connect(function()
                                FarmState.HasActiveQuest = false
                                FarmState.QuestGuiSeen = false
                                FarmState.LastSeenQuestTime = 0
                                FarmState.CurrentQuestMob = nil
                                FarmState.CurrentKills = 0
                                FarmState.MaxKills = 0
                                FarmState.LeftKills = 0
                                FarmState.QuestStatus = "ABANDONED"
                                LogFarmStatus("User clicked Abandon! Resetting quest state to accept quest immediately.")
                            end)
                        end
                    end
                end
            end
        end)
    end
end)

AllMobSpawns = {
    -- SEA 1 MOBS & BOSSES
    ["Bandit"] = CFrame.new(1045.96, 27.00, 1560.82),
    ["Trainee"] = CFrame.new(-2709.70, 24.50, 2104.20),
    ["Monkey"] = CFrame.new(-1448.52, 67.85, 11.47),
    ["Gorilla"] = CFrame.new(-1129.88, 40.46, -525.42),
    ["The Gorilla King"] = CFrame.new(-1088.76, 8.13, -488.56),
    ["Gorilla King"] = CFrame.new(-1088.76, 8.13, -488.56),
    ["Pirate"] = CFrame.new(-1103.51, 13.75, 3896.09),
    ["Brute"] = CFrame.new(-1140.08, 14.81, 4322.92),
    ["Bobby"] = CFrame.new(-1087.38, 46.95, 4040.15),
    ["Chef"] = CFrame.new(-1087.38, 46.95, 4040.15),
    ["The Chef"] = CFrame.new(-1087.38, 46.95, 4040.15),
    ["Magma General"] = CFrame.new(-5765.90, 82.92, 8718.30),
    ["Sky Warlord"] = CFrame.new(-7866.13, 5576.43, -546.75),
    ["Lightning God"] = CFrame.new(-7994.98, 5761.03, -2088.65),
    ["Charged Clouds"] = CFrame.new(-7866.13, 5576.43, -546.75),
    ["Storm Cloud"] = CFrame.new(-7866.13, 5576.43, -546.75),
    ["Charged Cloud"] = CFrame.new(-7866.13, 5576.43, -546.75),
    ["Desert Bandit"] = CFrame.new(924.80, 6.45, 4481.59),
    ["Desert Officer"] = CFrame.new(1608.28, 8.61, 4371.01),
    ["Snow Bandit"] = CFrame.new(1354.35, 87.27, -1393.95),
    ["Snowman"] = CFrame.new(6242.00, 51.52, -1243.98),
    ["Yeti"] = CFrame.new(1218.80, 138.01, -1488.03),
    ["Chief Petty Officer"] = CFrame.new(-4881.23, 22.65, 4273.75),
    ["Sky Bandit"] = CFrame.new(-4953.21, 295.74, -2899.23),
    ["Dark Master"] = CFrame.new(-5259.84, 391.40, -2229.04),
    ["Prisoner"] = CFrame.new(5098.97, -0.32, 474.24),
    ["Dangerous Prisoner"] = CFrame.new(5654.56, 15.63, 866.30),
    ["Toga Warrior"] = CFrame.new(-1820.21, 51.68, -2740.67),
    ["Gladiator"] = CFrame.new(-1292.84, 56.38, -3339.03),
    ["Military Soldier"] = CFrame.new(-5411.16, 11.08, 8454.29),
    ["Military Spy"] = CFrame.new(-5802.87, 86.26, 8828.86),
    ["Fishman Warrior"] = CFrame.new(60878.30, 18.48, 1543.76),
    ["Fishman Commando"] = CFrame.new(61922.63, 18.48, 1493.93),
    ["God's Guard"] = CFrame.new(-4710.04, 845.28, -1927.31),
    ["Shanda"] = CFrame.new(-7678.49, 5566.40, -497.22),
    ["Royal Squad"] = CFrame.new(-7624.25, 5658.13, -1467.35),
    ["Royal Soldier"] = CFrame.new(-7836.75, 5645.66, -1790.62),
    ["Galley Pirate"] = CFrame.new(5551.02, 78.90, 3930.41),
    ["Galley Captain"] = CFrame.new(5441.95, 42.50, 4950.09),

    -- SEA 2 MOBS & BOSSES
    ["Raider"] = CFrame.new(-728.33, 52.78, 2345.77),
    ["Mercenary"] = CFrame.new(-1004.32, 80.16, 1424.62),
    ["Diamond"] = CFrame.new(-1576.72, 198.59, 13.72),
    ["Swan Pirate"] = CFrame.new(1068.66, 137.61, 1322.11),
    ["Factory Staff"] = CFrame.new(73.08, 81.86, -27.47),
    ["Jeremy"] = CFrame.new(2006.93, 448.96, 853.98),
    ["Marine Lieutenant"] = CFrame.new(-2821.37, 75.90, -3070.09),
    ["Marine Captain"] = CFrame.new(-1861.23, 80.18, -3254.70),
    ["Orbitus"] = CFrame.new(-2172.74, 103.32, -4015.03),
    ["Fajita"] = CFrame.new(-2172.74, 103.32, -4015.03),
    ["Zombie"] = CFrame.new(-5657.78, 78.97, -928.69),
    ["Vampire"] = CFrame.new(-6037.67, 32.18, -1340.66),
    ["Snow Trooper"] = CFrame.new(549.15, 427.39, -5563.70),
    ["Winter Warrior"] = CFrame.new(1142.75, 475.64, -5199.42),
    ["Lab Subordinate"] = CFrame.new(-5707.47, 15.95, -4513.39),
    ["Horned Warrior"] = CFrame.new(-6341.37, 15.95, -5723.16),
    ["Smoke Admiral"] = CFrame.new(-5275.20, 20.76, -5260.67),
    ["Magma Ninja"] = CFrame.new(-5449.67, 76.66, -5808.20),
    ["Lava Pirate"] = CFrame.new(-5213.33, 49.74, -4701.45),
    ["Ship Deckhand"] = CFrame.new(1212.01, 150.79, 33059.25),
    ["Ship Engineer"] = CFrame.new(919.48, 43.54, 32779.97),
    ["Ship Steward"] = CFrame.new(919.44, 129.56, 33436.04),
    ["Ship Officer"] = CFrame.new(1036.02, 181.44, 33315.73),
    ["Arctic Warrior"] = CFrame.new(5966.25, 62.97, -6179.38),
    ["Snow Lurker"] = CFrame.new(5407.07, 69.19, -6880.88),
    ["Awakened Ice Admiral"] = CFrame.new(6403.54, 340.30, -6894.56),
    ["Sea Soldier"] = CFrame.new(-3028.22, 64.67, -9775.43),
    ["Water Fighter"] = CFrame.new(-3352.90, 285.02, -10534.84),
    ["Tide Keeper"] = CFrame.new(-3795.64, 105.89, -11421.31),

    -- SEA 3 MOBS & BOSSES
    ["Pirate Millionaire"] = CFrame.new(-246.00, 47.31, 5584.10),
    ["Pistol Millionaire"] = CFrame.new(-245.99, 47.31, 5584.10),
    ["Pistol Billionaire"] = CFrame.new(-187.33, 86.24, 6013.51),
    ["Stone"] = CFrame.new(-1027.65, 92.40, 6578.85),
    ["Dragon Crew Warrior"] = CFrame.new(7021.50, 55.76, -730.13),
    ["Dragon Crew Archer"] = CFrame.new(6625.00, 378.00, 244.00),
    ["Hydra Enforcer"] = CFrame.new(4547.11, 1003.10, 334.19),
    ["Venomous Assailant"] = CFrame.new(4674.93, 1134.83, 996.31),
    ["Hydra Leader"] = CFrame.new(5821.90, 1019.10, -73.72),
    ["Island Empress"] = CFrame.new(5821.90, 1019.10, -73.72),
    ["Marine Commodore"] = CFrame.new(2286.01, 73.13, -7159.81),
    ["Marine Rear Admiral"] = CFrame.new(3656.77, 160.52, -7001.60),
    ["Kilo Admiral"] = CFrame.new(2764.22, 432.46, -7144.46),
    ["Fishman Raider"] = CFrame.new(-10407.53, 331.76, -8368.52),
    ["Fishman Captain"] = CFrame.new(-10994.70, 352.38, -9002.11),
    ["Forest Pirate"] = CFrame.new(-13274.48, 332.38, -7769.58),
    ["Mythological Pirate"] = CFrame.new(-13680.61, 501.08, -6991.19),
    ["Captain Elephant"] = CFrame.new(-13376.76, 433.29, -8071.39),
    ["Jungle Pirate"] = CFrame.new(-12256.16, 331.74, -10485.84),
    ["Musketeer Pirate"] = CFrame.new(-13457.90, 391.55, -9859.18),
    ["Reborn Skeleton"] = CFrame.new(-8763.72, 165.72, 6159.86),
    ["Living Zombie"] = CFrame.new(-10144.13, 138.63, 5838.09),
    ["Demonic Soul"] = CFrame.new(-9505.87, 172.10, 6158.99),
    ["Possessed Mummy"] = CFrame.new(-9582.02, 6.25, 6205.48),
    ["Posessed Mummy"] = CFrame.new(-9582.02, 6.25, 6205.48),
    ["Soul Reaper"] = CFrame.new(-9516.99, 172.02, 6078.47),
    ["Peanut Scout"] = CFrame.new(-2143.24, 47.72, -10030.00),
    ["Peanut President"] = CFrame.new(-1859.35, 38.10, -10422.43),
    ["Ice Cream Chef"] = CFrame.new(-872.25, 65.82, -10919.96),
    ["Ice Cream Commander"] = CFrame.new(-558.06, 112.05, -11290.77),
    ["Cake Queen"] = CFrame.new(-678.65, 381.35, -11114.20),
    ["Cookie Crafter"] = CFrame.new(-2374.14, 37.80, -12125.31),
    ["Cake Guard"] = CFrame.new(-1598.31, 43.77, -12244.58),
    ["Baking Staff"] = CFrame.new(-1887.81, 77.62, -12998.35),
    ["Head Baker"] = CFrame.new(-2216.19, 82.88, -12869.29),
    ["Cocoa Warrior"] = CFrame.new(-21.55, 80.57, -12352.39),
    ["Chocolate Bar Battler"] = CFrame.new(582.59, 77.19, -12463.16),
    ["Sweet Thief"] = CFrame.new(165.19, 76.06, -12600.84),
    ["Candy Rebel"] = CFrame.new(134.87, 77.25, -12876.55),
    ["Candy Pirate"] = CFrame.new(-1310.50, 26.02, -14562.40),
    ["Isle Outlaw"] = CFrame.new(-16479.90, 226.61, -300.31),
    ["Island Boy"] = CFrame.new(-16849.40, 192.87, -150.79),
    ["Sun-kissed Warrior"] = CFrame.new(-16347.00, 64.00, 984.00),
    ["Isle Champion"] = CFrame.new(-16602.10, 130.39, 1087.25),
    ["Serpent Hunter"] = CFrame.new(-16679.48, 176.75, 1474.40),
    ["Skull Slayer"] = CFrame.new(-16759.59, 71.28, 1595.34),
    ["Reef Bandit"] = CFrame.new(10951.03, -2159.49, 9150.90),
    ["Coral Pirate"] = CFrame.new(10744.90, -2087.73, 9343.34),
    ["Sea Chanter"] = CFrame.new(10661.25, -2087.73, 10088.88),
    ["Ocean Prophet"] = CFrame.new(11050.83, -2001.23, 10142.20),
    ["High Disciple"] = CFrame.new(9828.10, -1940.90, 9693.10),
    ["Grand Devotee"] = CFrame.new(9557.60, -1928.00, 9859.20),
    ["The Gorilla God"] = CFrame.new(-1088.76, 25.0, -488.56),
    ["Heaven's Guardian"] = CFrame.new(-16479.90, 226.61, -300.31),
    ["Hell's Messenger"] = CFrame.new(-9524.79, 315.80, 6655.72)
}


-- ========================================================================
-- ENEMY SPAWN RESOLVER (Workspace._WorldOrigin.EnemySpawns & AllMobSpawns)
-- ========================================================================
local function GetEnemySpawnLocation(targetMobName)
    if not targetMobName or targetMobName == "" then return nil, nil end
    local tLower = targetMobName:lower()
    local tStem = tLower:gsub("s$", "")

    local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
    local enemySpawns = worldOrigin and worldOrigin:FindFirstChild("EnemySpawns")
    if enemySpawns then
        for _, sp in ipairs(enemySpawns:GetChildren()) do
            if sp:IsA("BasePart") and sp.Name:lower() == tLower then
                return sp.CFrame, sp
            end
        end
        for _, sp in ipairs(enemySpawns:GetChildren()) do
            if sp:IsA("BasePart") then
                local sLower = sp.Name:lower()
                local sStem = sLower:gsub("s$", "")
                if sLower:find(tLower, 1, true) 
                    or tLower:find(sLower, 1, true)
                    or (#tStem >= 3 and sLower:find(tStem, 1, true))
                    or (#sStem >= 3 and tLower:find(sStem, 1, true)) then
                    return sp.CFrame, sp
                end
            end
        end
    end

    if AllMobSpawns[targetMobName] then
        return AllMobSpawns[targetMobName], nil
    end
    for mName, cf in pairs(AllMobSpawns) do
        local mLower = mName:lower()
        local mStem = mLower:gsub("s$", "")
        if mLower:find(tLower, 1, true) 
            or tLower:find(mLower, 1, true)
            or (#tStem >= 3 and mLower:find(tStem, 1, true))
            or (#mStem >= 3 and tLower:find(mStem, 1, true)) then
            return cf, nil
        end
    end

    return nil, nil
end

local function ResolveActiveQuestMob(questTitle, fallbackQData)
    local targetMobName = fallbackQData and fallbackQData.Mon
    local targetMobPos = fallbackQData and fallbackQData.MPos

    if questTitle and questTitle ~= "" then
        local cleanTitle = questTitle:lower()
        if targetMobName and (cleanTitle:find(targetMobName:lower(), 1, true) or targetMobName:lower():find(cleanTitle, 1, true)) then
            -- matches fallback
        else
            local foundMob = nil
            pcall(function()
                local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
                local enemySpawns = worldOrigin and worldOrigin:FindFirstChild("EnemySpawns")
                if enemySpawns then
                    for _, sp in ipairs(enemySpawns:GetChildren()) do
                        local sLower = sp.Name:lower()
                        local sStem = sLower:gsub("s$", "")
                        if cleanTitle:find(sLower, 1, true) or (#sStem >= 3 and cleanTitle:find(sStem, 1, true)) then
                            foundMob = sp.Name
                            break
                        end
                    end
                end
            end)
            if foundMob then
                targetMobName = foundMob
            else
                local bestMatch, longestLen = nil, 0
                for mobName, _ in pairs(AllMobSpawns) do
                    local mLower = mobName:lower()
                    local mStem = mLower:gsub("s$", "")
                    if cleanTitle:find(mLower, 1, true) or (#mStem >= 3 and cleanTitle:find(mStem, 1, true)) then
                        if #mobName > longestLen then
                            longestLen = #mobName
                            bestMatch = mobName
                        end
                    end
                end
                if bestMatch then
                    targetMobName = bestMatch
                end
            end
        end
    end

    local spawnCF, _ = GetEnemySpawnLocation(targetMobName)
    if spawnCF then
        targetMobPos = spawnCF
    end

    return targetMobName, targetMobPos
end

local function CheckQuestStatus(desiredMobName)
    local hasQuest = IsQuestActive()
    local curKills, maxKills = GetQuestProgress()
    local title = GetActiveQuestTitleDirect()
    if not hasQuest then
        return "NO_QUEST", curKills or 0, maxKills or 0
    end
    if not title or title == "" then
        return "CORRECT_QUEST", curKills or 0, maxKills or 0
    end
    local lowerTitle = title:lower()
    local lowerMob = (desiredMobName or ""):lower()
    if string.find(lowerTitle, lowerMob, 1, true) then
        return "CORRECT_QUEST", curKills or 0, maxKills or 0
    end
    local mobStem = lowerMob:gsub("s$", "")
    if #mobStem >= 3 and string.find(lowerTitle, mobStem, 1, true) then
        return "CORRECT_QUEST", curKills or 0, maxKills or 0
    end
    return "CORRECT_QUEST", curKills or 0, maxKills or 0
end

-- ========================================================================
-- DIRECT QUEST ACCEPTANCE (Bypasses Dialogue UI)
-- ========================================================================
local function AcceptQuestDirect(qData)
    if not qData then return end
    local commF = GetCommF()
    if not commF then return end

    local qName = qData.Quest
    local req = tonumber(qData.Req) or 1

    pcall(function() commF:InvokeServer("StartQuest", qName, req) end)

    if qName == "DragonCrewQuest" or qName == "AmazonQuest" then
        pcall(function() commF:InvokeServer("StartQuest", "DragonCrewQuest", req) end)
        pcall(function() commF:InvokeServer("StartQuest", "AmazonQuest", req) end)
    elseif qName == "VenomCrewQuest" or qName == "AmazonQuest2" then
        pcall(function() commF:InvokeServer("StartQuest", "VenomCrewQuest", req) end)
        pcall(function() commF:InvokeServer("StartQuest", "AmazonQuest2", req) end)
    end

    pcall(function()
        local pGui = plr:FindFirstChild("PlayerGui")
        if pGui then
            for _, gName in ipairs({"Main", "Main (minimal)"}) do
                local main = pGui:FindFirstChild(gName)
                if main and main:FindFirstChild("Dialogue") then
                    main.Dialogue.Visible = false
                end
            end
        end
    end)
end

-- ========================================================================
-- MOB MATCHER & AREA COLLECTOR
-- ========================================================================
local function IsMobMatchingQuest(eName, targetMobName, activeTitle)
    local lowerTarget = targetMobName:lower()
    local stemTarget = lowerTarget:gsub("s$", "")
    local eLower = eName:lower()
    local eStem = eLower:gsub("s$", "")

    if eLower == lowerTarget then return true end
    if string.find(eLower, lowerTarget, 1, true) then return true end
    if string.find(lowerTarget, eLower, 1, true) then return true end
    if #stemTarget >= 3 and string.find(eLower, stemTarget, 1, true) then return true end
    if #eStem >= 3 and string.find(lowerTarget, eStem, 1, true) then return true end

    if (eLower == "chef" or eLower:find("chef", 1, true)) and (lowerTarget == "bobby" or lowerTarget:find("bobby", 1, true)) then
        return true
    end
    if (eLower == "bobby" or eLower:find("bobby", 1, true)) and (lowerTarget == "chef" or lowerTarget:find("chef", 1, true)) then
        return true
    end

    if (eLower:find("cloud", 1, true) or eLower:find("storm", 1, true) or eLower:find("charge", 1, true))
        and (lowerTarget:find("cloud", 1, true) or lowerTarget:find("storm", 1, true) or lowerTarget:find("charge", 1, true) or lowerTarget:find("lightning", 1, true)) then
        return true
    end

    if (eLower:find("magma", 1, true)) and (lowerTarget:find("magma", 1, true)) then
        return true
    end

    if (eLower:find("thunder", 1, true) or eLower:find("lightning", 1, true)) and (lowerTarget:find("thunder", 1, true) or lowerTarget:find("lightning", 1, true)) then
        return true
    end

    if string.find(eLower, "mummy", 1, true) and string.find(lowerTarget, "mummy", 1, true) then
        return true
    end

    if activeTitle and activeTitle ~= "" then
        local tLower = activeTitle:lower()
        if string.find(tLower, eLower, 1, true) then return true end
        if #eStem >= 3 and string.find(tLower, eStem, 1, true) then return true end
        if string.find(tLower, "mummy", 1, true) and string.find(eLower, "mummy", 1, true) then
            return true
        end
        if (tLower:find("chef", 1, true) or tLower:find("bobby", 1, true)) and (eLower:find("chef", 1, true) or eLower:find("bobby", 1, true)) then
            return true
        end
    end
    return false
end

local function FindNearestQuestEnemy(targetMobName, activeTitle)
    local char = plr.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return nil, math.huge end

    local enemies = workspace:FindFirstChild("Enemies")
    local nearestMob = nil
    local minDist = math.huge

    if enemies then
        for _, enemy in ipairs(enemies:GetChildren()) do
            local eHum = enemy:FindFirstChild("Humanoid")
            local eRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy.PrimaryPart
            if eHum and eHum.Health > 0 and eRoot then
                if IsMobMatchingQuest(enemy.Name, targetMobName, activeTitle) then
                    local dist = (eRoot.Position - root.Position).Magnitude
                    if dist < minDist then
                        minDist = dist
                        nearestMob = enemy
                    end
                end
            end
        end
    end

    if not nearestMob then
        local chars = workspace:FindFirstChild("Characters")
        if chars then
            for _, enemy in ipairs(chars:GetChildren()) do
                if enemy ~= char and not game:GetService("Players"):GetPlayerFromCharacter(enemy) then
                    local eHum = enemy:FindFirstChild("Humanoid")
                    local eRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy.PrimaryPart
                    if eHum and eHum.Health > 0 and eRoot then
                        if IsMobMatchingQuest(enemy.Name, targetMobName, activeTitle) then
                            local dist = (eRoot.Position - root.Position).Magnitude
                            if dist < minDist then
                                minDist = dist
                                nearestMob = enemy
                            end
                        end
                    end
                end
            end
        end
    end

    return nearestMob, minDist
end

local function GetAreaQuestMobs(targetMobName, centerRefPos, maxRadius)
    local rad = maxRadius or 350
    local char = plr.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local matchingMobs = {}
    local folders = { 
        workspace:FindFirstChild("Enemies"), 
        workspace:FindFirstChild("Characters")
    }

    for _, folder in ipairs(folders) do
        if folder then
            for _, enemy in ipairs(folder:GetChildren()) do
                if IsValidLivingEnemy(enemy) then
                    local eRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy.PrimaryPart
                    if IsMobMatchingQuest(enemy.Name, targetMobName, "") then
                        local distToSpawn = (eRoot.Position - centerRefPos).Magnitude
                        local distToPlayer = root and (eRoot.Position - root.Position).Magnitude or 0
                        if distToSpawn <= rad and distToPlayer <= 350 then
                            table.insert(matchingMobs, enemy)
                        end
                    end
                end
            end
        end
    end
    return matchingMobs
end

Tabs.Main:AddSection("Farming")

FarmLevel = Tabs.Main:AddToggle({
    Name = "Auto Farm Level",
    Description = "Auto Quest & Mob Farming (Level 1 - 2675+)",
    Default = false,
    Callback = function(Value)
        _G.Level = Value
        if not Value then
            alreadyTeleported = false
            teleporting = false
            TweenManager.Stop()
        end
    end
})

local alreadyTeleported = false
local teleporting = false

local function IsInSubmergedIsland()
    local char = plr.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    local islandXZ = Vector3.new(11520.8017578125, 0, 9829.513671875)
    local playerXZ = Vector3.new(hrp.Position.X, 0, hrp.Position.Z)
    return (playerXZ - islandXZ).Magnitude < 2000
end

task.spawn(function()
    while task.wait(0.12) do
        if _G.Level then
            pcall(function()
                local char = plr.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                if not root or not hum or hum.Health <= 0 then return end

                -- Safe mode check
                if _G.Safemode and (hum.Health / hum.MaxHealth * 100) < (Num_self or 25) then
                    shouldTween = true
                    _tp(root.CFrame * CFrame.new(0, 400, 0))
                    task.wait(1)
                    return
                end

                local level = GetPlayerLevel()
                local inSub = IsInSubmergedIsland()

                -- Submerged Island check for Sea 3 Level 2600+
                if DetectWorld() == 3 and level >= 2600 and not inSub and not teleporting and not alreadyTeleported then
                    teleporting = true
                    local npcPos = CFrame.new(-16269.7041, 25.2288494, 1373.65955)
                    local teleportAttempts = 0
                    
                    repeat 
                        task.wait(0.2)
                        _tp(npcPos)
                        teleportAttempts = teleportAttempts + 1
                    until not _G.Level or (root.Position - npcPos.Position).Magnitude <= 15 or teleportAttempts > 25

                    if not _G.Level then 
                        teleporting = false
                        return 
                    end

                    task.wait(0.5)
                    pcall(function()
                        replicated.Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
                    end)

                    local timeout = tick()
                    repeat 
                        task.wait(0.5)
                    until not _G.Level or IsInSubmergedIsland() or tick() - timeout > 10

                    task.wait(1)
                    alreadyTeleported = true
                    teleporting = false
                    return
                end

                alreadyTeleported = true
                teleporting = false

                SmartEquipWeapon()

                local qData = GetStaticQuestData()
                if not qData or not qData.Mon then
                    task.wait(0.5)
                    return
                end

                local farmHeight = _G.FarmHeight or 22

                -- ============================================================
                -- CASE 1: Active Quest Detected -> Hunt and Kill Target Mobs!
                -- ============================================================
                if IsQuestActive(qData) then
                    local targetMobName = FarmState.CurrentQuestMob or qData.Mon
                    local targetMobPos = (targetMobName == qData.Mon and qData.MPos) or AllMobSpawns[targetMobName] or qData.MPos
                    local spawnCF, spawnPart = GetEnemySpawnLocation(targetMobName)
                    local areaRefPos = (spawnCF and spawnCF.Position) or (targetMobPos and targetMobPos.Position) or root.Position

                    -- If player is still traveling to the mob area (> 350 studs), fly directly to the mob spawn first
                    local distToSpawn = (root.Position - areaRefPos).Magnitude
                    if distToSpawn > 350 then
                        LogFarmStatus("Flying to " .. targetMobName .. " spawn (" .. math.floor(distToSpawn) .. "m)...")
                        local waitPos = (spawnCF or targetMobPos) * CFrame.new(0, farmHeight, 0)
                        _tp(waitPos)
                        return
                    end

                    -- Group (Bring Mobs) mode
                    local areaRadius = 350
                    local areaMobs = GetAreaQuestMobs(targetMobName, areaRefPos, areaRadius)

                    if #areaMobs > 0 then
                        local sumX, sumY, sumZ = 0, 0, 0
                        for _, mob in ipairs(areaMobs) do
                            local mRoot = mob:FindFirstChild("HumanoidRootPart") or mob.PrimaryPart
                            sumX = sumX + mRoot.Position.X
                            sumY = sumY + mRoot.Position.Y
                            sumZ = sumZ + mRoot.Position.Z
                        end
                        local centerPos = Vector3.new(sumX / #areaMobs, sumY / #areaMobs, sumZ / #areaMobs)

                        local playerCenterPos = CFrame.new(centerPos.X, centerPos.Y + farmHeight, centerPos.Z)
                        local distToCenter = (root.Position - playerCenterPos.Position).Magnitude
                        if distToCenter > 4 then
                            _tp(playerCenterPos)
                        else
                            if block then block.CFrame = playerCenterPos end
                        end

                        GroupAreaMobs(areaMobs, centerPos)

                        LogFarmStatus("Group Farming " .. #areaMobs .. "x " .. targetMobName)
                        SmartEquipWeapon()
                        FastAttack.Attack()
                    else
                        if not spawnCF then
                            spawnCF = targetMobPos or qData.MPos
                        end

                        local progInfo = ""
                        local curK, maxK, leftK = GetQuestProgress()
                        if curK and maxK and maxK > 0 then
                            if leftK and leftK > 0 then
                                progInfo = " (" .. curK .. "/" .. maxK .. " - " .. leftK .. " left)"
                            else
                                progInfo = " (" .. curK .. "/" .. maxK .. ")"
                            end
                        end
                        LogFarmStatus("Waiting for " .. targetMobName .. " to respawn" .. progInfo .. "...")

                        pcall(function()
                            if plr.RequestStreamAroundAsync and spawnCF then
                                plr:RequestStreamAroundAsync(spawnCF.Position)
                            end
                        end)

                        if spawnCF then
                            local waitPos = spawnCF * CFrame.new(0, farmHeight, 0)
                            local distToWait = (root.Position - waitPos.Position).Magnitude
                            if distToWait > 4 then
                                _tp(waitPos)
                            else
                                if block then block.CFrame = waitPos end
                            end
                        end
                    end
                    return
                end

                -- ============================================================
                -- CASE 2: No Active Quest -> Travel to Quest Giver & Accept Quest
                -- ============================================================
                local npcPos = GetNPCCFrame(qData.Quest, qData.QNPC)

                pcall(function()
                    local npcsFolder = workspace:FindFirstChild("NPCs")
                    if npcsFolder then
                        for _, npc in ipairs(npcsFolder:GetChildren()) do
                            if npc:IsA("Model") and not game:GetService("Players"):GetPlayerFromCharacter(npc) and npc ~= char then
                                local nLower = npc.Name:lower()
                                if nLower:find("quest") or nLower:find("giver") then
                                    local part = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Head") or npc.PrimaryPart
                                    if part and (part.Position - npcPos.Position).Magnitude <= 30 then
                                        npcPos = part.CFrame
                                        break
                                    end
                                end
                            end
                        end
                    end
                end)

                local distToNPC = (root.Position - npcPos.Position).Magnitude

                if qData.Entrance and distToNPC > 6000 and replicated.Remotes.CommF_ then
                    pcall(function()
                        replicated.Remotes.CommF_:InvokeServer("requestEntrance", qData.Entrance)
                    end)
                    task.wait(0.5)
                    return
                end

                if distToNPC > 15 then
                    LogFarmStatus("Traveling to Quest NPC: " .. qData.Quest .. " (" .. math.floor(distToNPC) .. "m)")
                    _tp(npcPos)
                    return
                end

                if block then block.CFrame = npcPos end

                LogFarmStatus("Accepting Quest: " .. qData.Quest .. " (" .. qData.Mon .. ")")
                pcall(function()
                    if replicated.Remotes.CommF_ then
                        replicated.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                end)

                AcceptQuestDirect(qData)
                task.wait(0.4)

                FarmState.HasActiveQuest = true
                FarmState.CurrentQuestMob = qData.Mon
                FarmState.AcceptedTime = tick()
                FarmState.AcceptedLevel = GetPlayerLevel()
                FarmState.LastSeenQuestTime = tick()
                FarmState.TargetMob = qData.Mon
                FarmState.QuestName = qData.Quest
                FarmState.QuestGuiSeen = false
                FarmState.KillsThisQuest = 0
                FarmState.CurrentKills = 0
                FarmState.MaxKills = 8
                FarmState.QuestStatus = "IN_PROGRESS"

                local spawnCF, _ = GetEnemySpawnLocation(qData.Mon)
                if not spawnCF then
                    spawnCF = qData.MPos
                end
                if spawnCF then
                    LogFarmStatus("Quest accepted! Flying to " .. qData.Mon .. " spawn...")
                    _tp(spawnCF * CFrame.new(0, farmHeight, 0))
                end
            end)
        else
            teleporting = false
            alreadyTeleported = false
        end
    end
end)

ClosetMons = Tabs.Main:AddToggle({
Name = "Auto Farm Nearest", 
Description = "", 
Default = false, 
Callback = function(Value)
  _G.AutoFarmNear = Value
end})
spawn(function()
  while task.wait(0.12) do
    if _G.AutoFarmNear then
      pcall(function()
        local char = plr.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local nearest, minDist = nil, math.huge
        for _, v in ipairs(workspace.Enemies:GetChildren()) do
          if IsValidLivingEnemy(v) then
            local vRoot = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
            local d = (vRoot.Position - hrp.Position).Magnitude
            if d < minDist then
              minDist = d
              nearest = v
            end
          end
        end
        
        if nearest then
          local nRoot = nearest:FindFirstChild("HumanoidRootPart") or nearest.PrimaryPart
          local hover = nRoot.CFrame * CFrame.new(0, 22, 0)
          _tp(hover)
          BringEnemy(nearest)
          EquipWeapon(_G.SelectWeapon)
          if typeof(AttackNoCoolDown) == "function" then AttackNoCoolDown() end
        end
      end)
    end
  end
end)
FactoryRaids = Tabs.Main:AddToggle({
Name = "Auto Factory Raid", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoFactory = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoFactory then
        local v = GetConnectionEnemies("Core")
        if v then
          repeat wait()
            EquipWeapon(_G.SelectWeapon)
            _tp(CFrame.new(448.46756, 199.356781, -441.389252))
          until v.Humanoid.Health <= 0 or _G.AutoFactory == false
        else
          _tp(CFrame.new(448.46756, 199.356781, -441.389252))
        end
      end
    end)
  end
end)

CastleRaids = Tabs.Main:AddToggle({
    Name = "Auto Pirate Raid",
    Description = "Farms Pirate Raid Castle enemies (Sea 3)",
    Default = false,
    Callback = function(Value)
        _G.AutoRaidCastle = Value
    end
})
do
    local _raidFarmPos = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
    local _raidCenter   = Vector3.new(-5539.3115234375, 313.800537109375, -2972.372314453125)

    local function GetRaidTarget()
        local bestDist = math.huge
        local best = nil
        -- Check workspace.Enemies
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        if enemiesFolder then
            for _, v in ipairs(enemiesFolder:GetChildren()) do
                local vHum = v:FindFirstChild("Humanoid")
                local vRoot = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if vHum and vRoot and vHum.Health > 0 then
                    local dist = (vRoot.Position - _raidCenter).Magnitude
                    if dist <= 2500 and dist < bestDist then
                        bestDist = dist
                        best = v
                    end
                end
            end
        end
        return best
    end

    task.spawn(function()
        while task.wait(0.15) do
            if _G.AutoRaidCastle then
                pcall(function()
                    local char = plr.Character
                    if not char then return end
                    local root = char:FindFirstChild("HumanoidRootPart")
                    local hum  = char:FindFirstChild("Humanoid")
                    if not root or not hum or hum.Health <= 0 then return end

                    local target = GetRaidTarget()
                    if target and Attack.Alive(target) then
                        repeat
                            task.wait(0.1)
                            Attack.Kill(target, _G.AutoRaidCastle)
                        until not _G.AutoRaidCastle or not target.Parent or not Attack.Alive(target)
                    else
                        -- No enemy found - tween to raid position and wait
                        _tp(_raidFarmPos)
                    end
                end)
            end
        end
    end)
end




Ecto = Tabs.Main:AddToggle({
Name = "Auto Farm Ectoplasm", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoEctoplasm = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoEctoplasm then
        local EctoTable = {"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior"}    
        local v = GetConnectionEnemies(EctoTable)
		if Attack.Alive(v) then
		  repeat wait() Attack.Kill(v, _G.AutoEctoplasm)until not _G.AutoEctoplasm or not v.Parent or v.Humanoid.Health <= 0		        
	    else
	      replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
	    end
      end
    end)
  end
end)

Tabs.Main:AddSection("Magnet Event")

local MagnetStatus = Tabs.Main:AddParagraph("Magnet Event Status", "Status: Idle | Magnetized Mobs: 0")

local function IsMagnetizedName(name)
    if not name or typeof(name) ~= "string" then return false end
    local lower = name:lower()
    return string.find(lower, "magnetized", 1, true) ~= nil
end

local function IsValidMagnetizedEnemy(enemy)
    if not enemy or not enemy.Parent then return false end
    if enemy:GetAttribute("IsBoat") or enemy:GetAttribute("Dead") == true then return false end
    local char = plr.Character
    if enemy == char or game:GetService("Players"):GetPlayerFromCharacter(enemy) then return false end

    if not IsMagnetizedName(enemy.Name) then return false end

    local hum = enemy:FindFirstChild("Humanoid") or enemy:FindFirstChildOfClass("Humanoid")
    local root = enemy:FindFirstChild("HumanoidRootPart") or enemy.PrimaryPart
    if not hum or not root then return false end
    if hum.Health <= 0 or hum:GetState() == Enum.HumanoidStateType.Dead then return false end

    return true
end

local function GetMagnetizedEnemies()
    local mobs = {}
    local seen = {}
    -- Primary: check dedicated folders
    local folders = {
        workspace:FindFirstChild("Enemies"),
        workspace:FindFirstChild("Characters"),
        workspace:FindFirstChild("NPCs"),
    }
    for _, folder in ipairs(folders) do
        if folder then
            for _, enemy in ipairs(folder:GetChildren()) do
                if not seen[enemy] and IsValidMagnetizedEnemy(enemy) then
                    seen[enemy] = true
                    table.insert(mobs, enemy)
                end
            end
        end
    end
    -- Fallback: scan entire workspace for any missed magnetized humanoid models
    for _, obj in ipairs(workspace:GetChildren()) do
        if not seen[obj] and obj:IsA("Model") and IsValidMagnetizedEnemy(obj) then
            seen[obj] = true
            table.insert(mobs, obj)
        end
    end
    return mobs
end

Tabs.Main:AddToggle({
    Name = "Farm Magnet Token",
    Description = "Continuously hunt and kill all Magnetized enemies in the current world",
    Default = false,
    Callback = function(Value)
        _G.FarmMagnetToken = Value
        if not Value then
            shouldTween = false
            if _G.TweenCache then
                pcall(function() _G.TweenCache:Cancel() end)
            end
        end
    end
})

Tabs.Main:AddButton({
    Name = "Farm Magnet Token (Scan & Kill Once)",
    Description = "Scans current world and kills all currently spawned Magnetized enemies",
    Callback = function()
        task.spawn(function()
            local targets = GetMagnetizedEnemies()
            if #targets == 0 then
                MagnetStatus:SetDesc("Status: No Magnetized enemies found in world!")
                return
            end
            for _, enemy in ipairs(targets) do
                if IsValidMagnetizedEnemy(enemy) then
                    local eHum = enemy:FindFirstChild("Humanoid")
                    while IsValidMagnetizedEnemy(enemy) and eHum and eHum.Health > 0 do
                        Attack.Kill(enemy, true)
                        SmartEquipWeapon()
                        FastAttack.Attack()
                        task.wait(0.1)
                    end
                end
            end
            MagnetStatus:SetDesc("Status: All current Magnetized enemies defeated!")
        end)
    end
})

task.spawn(function()
    while task.wait(0.15) do
        if _G.FarmMagnetToken then
            pcall(function()
                local char = plr.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                if not root or not hum or hum.Health <= 0 then return end

                local targets = GetMagnetizedEnemies()
                if #targets > 0 then
                    local nearestTarget = nil
                    local nearestDist = math.huge
                    for _, enemy in ipairs(targets) do
                        local eRoot = enemy:FindFirstChild("HumanoidRootPart") or enemy.PrimaryPart
                        if eRoot then
                            local d = (eRoot.Position - root.Position).Magnitude
                            if d < nearestDist then
                                nearestDist = d
                                nearestTarget = enemy
                            end
                        end
                    end

                    if nearestTarget then
                        local tRoot = nearestTarget:FindFirstChild("HumanoidRootPart") or nearestTarget.PrimaryPart
                        local tHum = nearestTarget:FindFirstChild("Humanoid")
                        if tRoot and tHum and tHum.Health > 0 then
                            MagnetStatus:SetDesc("Status: Farming " .. nearestTarget.Name .. " (HP: " .. math.floor(tHum.Health) .. " | " .. #targets .. " left)")
                            -- Use Attack.Kill for reliable positioning + weapon + attack
                            Attack.Kill(nearestTarget, true)
                            -- Also fire FastAttack for extra hit coverage
                            SmartEquipWeapon()
                            FastAttack.Attack()
                        end
                    end
                else
                    MagnetStatus:SetDesc("Status: Scanning world for Magnetized enemies (0 alive)")
                end
            end)
        end
    end
end)

Tabs.Main:AddSection("Chest")

local function GetChestTargetCFrame(chest)
    if not chest then return nil end
    if chest:IsA("Model") then
        return chest:GetPivot()
    elseif chest:IsA("BasePart") then
        return chest.CFrame
    end
    return nil
end

local function GetChestTouchPart(chest)
    if not chest then return nil end
    if chest:IsA("BasePart") then
        return chest
    elseif chest:IsA("Model") then
        local p = chest:FindFirstChildWhichIsA("BasePart", true)
        return p or chest.PrimaryPart
    end
    return nil
end

local function IsChestCollected(chest)
    if not chest or not chest.Parent then return true end
    if chest:GetAttribute("IsDisabled") == true then return true end
    local touch = chest:FindFirstChild("TouchInterest") or (chest:IsA("Model") and chest:FindFirstChildWhichIsA("BasePart", true) and chest:FindFirstChildWhichIsA("BasePart", true):FindFirstChild("TouchInterest"))
    if not touch and chest:GetAttribute("IsDisabled") ~= false then return true end
    return false
end

local function GetBypassChests()
    local result = {}
    local CollectionService = game:GetService("CollectionService")
    
    local tagged = CollectionService:GetTagged("_ChestTagged")
    for _, chest in ipairs(tagged) do
        if chest and chest.Parent and not IsChestCollected(chest) then
            if not SelectedIsland or chest:IsDescendantOf(SelectedIsland) then
                table.insert(result, chest)
            end
        end
    end

    if #result == 0 then
        local map = workspace:FindFirstChild("Map") or workspace
        for _, obj in ipairs(map:GetDescendants()) do
            if obj and obj.Parent and obj.Name:find("Chest") and (obj:IsA("BasePart") or obj:IsA("Model")) then
                if not IsChestCollected(obj) then
                    if not SelectedIsland or obj:IsDescendantOf(SelectedIsland) then
                        table.insert(result, obj)
                    end
                end
            end
        end
    end

    return result
end

ChestTW = Tabs.Main:AddToggle({
Name = "Auto Farm Chest", 
Description = "Standard speed chest farming", 
Default = false,
Callback = function(Value)
  _G.AutoFarmChest = Value
  if Value then
    _G.AutoChestBP = false
  else
    shouldTween = false
    if _G.TweenCache then pcall(function() _G.TweenCache:Cancel() end) end
  end
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoFarmChest then
      pcall(function()
        local CollectionService = game:GetService("CollectionService")
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()                
        if not Character then return end                
        local Position = Character:GetPivot().Position
        local Chests = CollectionService:GetTagged("_ChestTagged")      
        local Distance, Nearest = math.huge, nil  
        for i = 1, #Chests do
          local Chest = Chests[i]
          local Magnitude = (Chest:GetPivot().Position - Position).Magnitude        
          if not SelectedIsland or Chest:IsDescendantOf(SelectedIsland) then
            if not Chest:GetAttribute("IsDisabled") and Magnitude < Distance then
              Distance = Magnitude
              Nearest = Chest
            end
          end
        end
      if Nearest then _tp(Nearest:GetPivot()) end
      end)
    end
  end
end)

ChestBP = Tabs.Main:AddToggle({
    Name = "Auto Chest Bypass", 
    Description = "Fast chest collection with anti-cheat bypass",
    Default = false,
    Callback = function(Value)
        _G.AutoChestBP = Value
        if Value then
            _G.AutoFarmChest = false
        else
            shouldTween = false
            if _G.TweenCache then
                pcall(function() _G.TweenCache:Cancel() end)
            end
        end
    end
})

task.spawn(function()
    while task.wait(0.1) do
        if _G.AutoChestBP then
            pcall(function()
                if _G.StopWhenChalice and (GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness")) then
                    _G.AutoChestBP = false
                    shouldTween = false
                    if _G.TweenCache then pcall(function() _G.TweenCache:Cancel() end) end
                    return
                end

                local char = plr.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChild("Humanoid")
                if not hrp or not hum or hum.Health <= 0 then
                    task.wait(0.5)
                    return
                end

                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end

                local chests = GetBypassChests()
                if #chests == 0 then
                    task.wait(1)
                    return
                end

                local myPos = hrp.Position
                table.sort(chests, function(a, b)
                    local aPos = (a:IsA("Model") and a:GetPivot().Position) or (a:IsA("BasePart") and a.Position) or Vector3.zero
                    local bPos = (b:IsA("Model") and b:GetPivot().Position) or (b:IsA("BasePart") and b.Position) or Vector3.zero
                    return (myPos - aPos).Magnitude < (myPos - bPos).Magnitude
                end)

                local targetChest = chests[1]
                if not targetChest or not targetChest.Parent then return end

                local targetCF = GetChestTargetCFrame(targetChest)
                if not targetCF then return end

                local touchPart = GetChestTouchPart(targetChest)
                local dist = (hrp.Position - targetCF.Position).Magnitude

                if dist > 3000 then
                    shouldTween = true
                    _tp(targetCF)
                    task.wait(0.5)
                    return
                end

                if dist > 35 then
                    shouldTween = true
                    local savedSpeed = _G.TweenSpeed
                    _G.TweenSpeed = 350
                    _tp(targetCF * CFrame.new(0, 1.5, 0))
                    
                    local t0 = tick()
                    while _G.AutoChestBP and targetChest.Parent and not IsChestCollected(targetChest) and tick() - t0 < 8 do
                        task.wait(0.05)
                        local c = plr.Character
                        local h = c and c:FindFirstChild("HumanoidRootPart")
                        if h and (h.Position - targetCF.Position).Magnitude <= 35 then
                            break
                        end
                        if _G.StopWhenChalice and (GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness")) then
                            _G.AutoChestBP = false
                            break
                        end
                    end
                    _G.TweenSpeed = savedSpeed
                end

                if _G.AutoChestBP and targetChest.Parent and not IsChestCollected(targetChest) then
                    local curHrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if curHrp then
                        curHrp.CFrame = targetCF * CFrame.new(0, 1.5, 0)
                        curHrp.Velocity = Vector3.zero
                        
                        if touchPart then
                            pcall(function()
                                if firetouchinterest then
                                    firetouchinterest(curHrp, touchPart, 0)
                                    task.wait(0.05)
                                    firetouchinterest(curHrp, touchPart, 1)
                                end
                            end)
                        end
                        
                        local collectWait = tick()
                        while _G.AutoChestBP and targetChest.Parent and not IsChestCollected(targetChest) and tick() - collectWait < 0.6 do
                            task.wait(0.05)
                        end
                    end
                end
            end)
        end
    end
end)

StopI = Tabs.Main:AddToggle({
Name = "Stop Items", 
Description = "", 
Default = true,
Callback = function(Value)
    _G.StopWhenChalice = Value
end})

spawn(function()
    while wait(0.2) do
        if _G.StopWhenChalice and (_G.AutoFarmChest or _G.AutoChestBP) then
            pcall(function()
                if GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness") then
                    _G.AutoFarmChest = false
                    _G.AutoChestBP = false
                end
            end)
        end
    end
end)

Tabs.Main:AddSection("Collect Berry")

Berry = Tabs.Main:AddToggle({
Name = "Auto Farm Berry", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoBerry = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoBerry then
      local CollectionService= game:GetService("CollectionService")
      local Players= game:GetService("Players")
      local Player = Players.LocalPlayer
      local BerryBush = CollectionService:GetTagged("BerryBush")      
      local Distance, Nearest = math.huge      
      for i = 1, #BerryBush do
        local Bush = BerryBush[i]        
        for AttributeName, BerryName in pairs(Bush:GetAttributes()) do
          if not BerryArray or table.find(BerryArray, BerryName) then           
            _tp(Bush.Parent:GetPivot())
            for i = 1, #BerryBush do
            local Bush = BerryBush[i]        
              for AttributeName, BerryName in pairs(Bush:GetChildren()) do
                if not BerryArray or table.find(BerryArray, BerryName) then
                  _tp(BerryName.WorldPivot)
                  fireproximityprompt(BerryName.ProximityPrompt,math.huge)
                end
              end
            end      
          end
        end
      end      
    end
  end
end)



BerryH = Tabs.Main:AddToggle({
Name = "Auto Farm Berry + Hop", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoBerryH = Value
end})

spawn(function()
    while wait(Sec) do
        if _G.AutoBerryH then
            local CollectionService = game:GetService("CollectionService")
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local BerryBush = CollectionService:GetTagged("BerryBush")

            if #BerryBush == 0 then
                local TeleportService = game:GetService("TeleportService")
                local ServerList = {}
                
                local Success, Error = pcall(function()
                    ServerList = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
                end)
                
                if Success and ServerList.data then
                    for _, Server in pairs(ServerList.data) do
                        if Server.playing < Server.maxPlayers and Server.id ~= game.JobId then
                            TeleportService:TeleportToPlaceInstance(game.PlaceId, Server.id, Player)
                            break
                        end
                    end
                end
            else
                for i = 1, #BerryBush do
                    local Bush = BerryBush[i]
                    
                    for AttributeName, BerryName in pairs(Bush:GetAttributes()) do
                        if not BerryArray or table.find(BerryArray, BerryName) then
                            _tp(Bush.Parent:GetPivot())
                            
                            for j = 1, #BerryBush do
                                local Bush2 = BerryBush[j]
                                
                                for _, BerryChild in pairs(Bush2:GetChildren()) do
                                    if not BerryArray or table.find(BerryArray, BerryChild.Name) then
                                        _tp(BerryChild.WorldPivot)
                                        fireproximityprompt(BerryChild.ProximityPrompt, math.huge)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

Tabs.Main:AddSection("Farm Mob")
if World1 then
    Tabs.Main:AddDropdown({
        Name = "Select Mob",
        Default = Bandit,
        Options = {
            "Bandit", "Monkey", "Gorilla", "Pirate", "Brute",
            "Desert Bandit", "Desert Officer", "Snow Bandit", "Snowman",
            "Chief Petty Officer", "Sky Bandit", "Dark Master", "Toga Warrior",
            "Gladiator", "Military Soldier", "Military Spy",
            "Fishman Warrior", "Fishman Commando",
            "God's Guard", "Shanda", "Royal Squad", "Royal Soldier",
            "Galley Pirate", "Galley Captain",
        },
        Callback = function(Value)
            getgenv().SelectMob = Value
        end
    })
end
if World2 then
    Tabs.Main:AddDropdown({
        Name = "Select Mob",
        Default = Raider,
        Options = {
            "Raider", "Mercenary", "Swan Pirate", "Factory Staff",
            "Marine Lieutenant", "Marine Captain", "Zombie", "Vampire",
            "Snow Trooper", "Winter Warrior", "Lab Subordinate",
            "Horned Warrior", "Magma Ninja", "Lava Pirate",
            "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer",
            "Arctic Warrior", "Snow Lurker", "Sea Soldier", "Water Fighter",
        },
        Callback = function(Value)
            getgenv().SelectMob = Value
        end
    })
end
if World3 then
    Tabs.Main:AddDropdown({
        Name = "Select Mob",
        Options = {
            "Pirate Millionaire", "Dragon Crew Warrior", "Dragon Crew Archer",
            "Female Islander", "Giant Islander", "Marine Commodore",
            "Marine Rear Admiral", "Fishman Raider", "Fishman Captain",
            "Forest Pirate", "Mythological Pirate", "Jungle Pirate",
            "Musketeer Pirate", "Reborn Skeleton", "Living Zombie",
            "Demonic Soul", "Posessed Mummy", "Peanut Scout",
            "Peanut President", "Ice Cream Chef", "Ice Cream Commander",
            "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker",
            "Cocoa Warrior", "Chocolate Bar Battler", "Sweet Thief",
            "Candy Rebel", "Candy Pirate", "Snow Demon", "Isle Outlaw",
            "Island Boy", "Sun-kissed Warrior", "Isle Champion",
        },
        Callback = function(Value)
            getgenv().SelectMob = Value
        end
    })
end
Tabs.Main:AddToggle({
    Name = "Auto Kill Mob",
    Default = false,
    Callback = function(Value)
        _G.AutoKillMob = Value
    end
})
spawn(function()
    while wait() do
        if _G.AutoKillMob then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(getgenv().SelectMob) then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == getgenv().SelectMob then
                            if v:FindFirstChild("Humanoid")
                            and v:FindFirstChild("HumanoidRootPart")
                            and v.Humanoid.Health > 0 then                                
                                repeat
                                    game:GetService("RunService").Heartbeat:Wait()
                                    Attack.Kill(v,_G.AutoKillMob)
                                until not _G.AutoKillMob or not v.Parent or v.Humanoid.Health <= 0                                
                            end
                        end
                    end
                end
            end)
        end
    end
end)

Tabs.Main:AddSection("Farm All Island")

local Sea1_Islands = {
    ["Pirates"] = {
        CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929),
        Mobs = {"Bandit"}
    },

    ["Marine"] = {
        CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-08, -0.667371571, 4.32403588e-08, 1, -1.07884304e-07, 0.667371571, -1.09201515e-07, -0.744724929),
        Mobs = {"Trainee"}
    },

    ["Jungle"] = {
        CFrame = CFrame.new(-1600, 36, 150),
        Mobs = {"Monkey", "Gorilla"}
    },

    ["Pirate Village"] = {
        CFrame = CFrame.new(-1100, 4, 3850),
        Mobs = {"Pirate", "Brute"}
    },

    ["Desert"] = {
        CFrame = CFrame.new(1090, 7, 4370),
        Mobs = {"Desert Bandit", "Desert Officer"}
    },

    ["Frozen Village"] = {
        CFrame = CFrame.new(1200, 28, -1500),
        Mobs = {"Snow Bandit", "Snowman"}
    },

    ["Marine Fortress"] = {
        CFrame = CFrame.new(-4500, 20, 4250),
        Mobs = {"Chief Petty Officer"}
    },

    ["Skylands Lower"] = {
        CFrame = CFrame.new(-5000, 700, -2500),
        Mobs = {"Sky Bandit", "Dark Master"}
    },

    ["Prison"] = {
        CFrame = CFrame.new(4875, 6, 735),
        Mobs = {"Prisoner", "Dangerous Prisoner"}
    },

    ["Colosseum"] = {
        CFrame = CFrame.new(-1500, 60, -290),
        Mobs = {"Toga Warrior", "Gladiator"}
    },

    ["Magma Village"] = {
        CFrame = CFrame.new(-5200, 8, 8400),
        Mobs = {"Military Soldier", "Military Spy"}
    },

    ["Underwater City"] = {
        CFrame = CFrame.new(61160, 5, 1819),
        Mobs = {"Fishman Warrior", "Fishman Commando"}
    },

    ["Skylands Upper"] = {
        CFrame = CFrame.new(-7880, 5545, -380),
        Mobs = {"Shanda", "Royal Squad", "Royal Soldier"}
    }
}


local Sea2_Islands = {

    ["Kingdom of Rose"] = {
        CFrame = CFrame.new(-321, 73, 297),
        Mobs = {
            "Raider",
            "Mercenary",
            "Swan Pirate",
            "Factory Staff"
        }
    },

    ["Green Zone"] = {
        CFrame = CFrame.new(-2447, 73, -3211),
        Mobs = {
            "Marine Lieutenant",
            "Marine Captain"
        }
    },

    ["Graveyard Island"] = {
        CFrame = CFrame.new(-9515, 142, 5536),
        Mobs = {
            "Zombie",
            "Vampire"
        }
    },

    ["Snow Mountain"] = {
        CFrame = CFrame.new(561, 401, -5306),
        Mobs = {
            "Snow Trooper",
            "Winter Warrior"
        }
    },

    ["Hot and Cold (Cold)"] = {
        CFrame = CFrame.new(-6026, 15, -5062),
        Mobs = {
            "Lab Subordinate",
            "Horned Warrior"
        }
    },

    ["Hot and Cold (Hot)"] = {
        CFrame = CFrame.new(-5478, 15, -5240),
        Mobs = {
            "Magma Ninja",
            "Lava Pirate"
        }
    },

    ["Cursed Ship"] = {
        CFrame = CFrame.new(902, 126, 33071),
        Mobs = {
            "Ship Deckhand",
            "Ship Engineer",
            "Ship Steward",
            "Ship Officer"
        }
    },

    ["Ice Castle"] = {
        CFrame = CFrame.new(6137, 294, -6747),
        Mobs = {
            "Arctic Warrior",
            "Snow Lurker"
        }
    },

    ["Forgotten Island"] = {
        CFrame = CFrame.new(-3043, 238, -10191),
        Mobs = {
            "Sea Soldier",
            "Water Fighter"
        }
    }
}


local Sea3_Islands = {

    ["Port Town"] = {
        CFrame = CFrame.new(-290, 44, 5450),
        Mobs = {
            "Pirate Millionaire",
            "Pistol Billionaire"
        }
    },

    ["Hydra Island"] = {
        CFrame = CFrame.new(5228, 604, 345),
        Mobs = {
            "Dragon Crew Warrior",
            "Dragon Crew Archer",
            "Female Islander",
            "Giant Islander",
            "Training Dummy"
        }
    },

    ["Great Tree"] = {
        CFrame = CFrame.new(2682, 1682, -7190),
        Mobs = {
            "Marine Commodore",
            "Marine Rear Admiral"
        }
    },

    ["Floating Turtle"] = {
        CFrame = CFrame.new(-12000, 331, -8500),
        Mobs = {
            "Forest Pirate",
            "Mythological Pirate",
            "Jungle Pirate",
            "Musketeer Pirate",
            "Fishman Raider",
            "Fishman Captain"
        }
    },

    ["Haunted Castle"] = {
        CFrame = CFrame.new(-9515, 142, 5536),
        Mobs = {
            "Reborn Skeleton",
            "Living Zombie",
            "Demonic Soul",
            "Posessed Mummy"
        }
    },

    ["Sea of Treats"] = {
        CFrame = CFrame.new(-1145, 13, -14450),
        Mobs = {
            "Peanut Scout",
            "Peanut President",
            "Ice Cream Commander",
            "Cookie Crafter",
            "Cake Guard",
            "Baking Staff",
            "Head Baker",
            "Cocoa Warrior",
            "Chocolate Bar Battler",
            "Sweet Thief",
            "Candy Rebel"
        }
    },

    ["Tiki Outpost"] = {
        CFrame = CFrame.new(-16200, 90, -17300),
        Mobs = {
            "Isle Outlaw",
            "Island Boy",
            "Sun-kissed Warrior",
            "Isle Champion"
        }
    },

    ["Submerged Island"] = {
        CFrame = CFrame.new(-3200, -10, -10000),
        Mobs = {
            "Reef Bandit",
            "Coral Pirate",
            "Sea Chanter",
            "Ocean Prophet",
            "High Disciple",
            "Grand Devotee"
        }
    }
}


if World1 then
    Tabs.Main:AddDropdown({
        Name = "Select Island",
        Options = {"Pirates", "Marine", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands Lower", "Prison", "Colosseum", "Magma Village", "Underwater City", "Skylands Upper"},
        Callback = function(Value)
            _G.SelectIsland = Value
        end
    })
end

if World2 then
    Tabs.Main:AddDropdown({
        Name = "Select Island",
        Options = {"Kingdom of Rose", "Green Zone", "Graveyard Island", "Snow Mountain", "Hot and Cold (Cold)", "Hot and Cold (Hot)", "Cursed Ship", "Ice Castle", "Forgotten Island"},
        Callback = function(Value)
            _G.SelectIsland = Value
        end
    })
end

if World3 then
    Tabs.Main:AddDropdown({
        Name = "Select Island",
        Options = {"Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle", "Sea of Treats", "Tiki Outpost", "Submerged Island"},
        Callback = function(Value)
            _G.SelectIsland = Value
        end
    })
end
local IslandData
if World1 then
    IslandData = Sea1_Islands
elseif World2 then
    IslandData = Sea2_Islands
elseif World3 then
    IslandData = Sea3_Islands
end
Tabs.Main:AddToggle({
    Name = "Auto Farm All Island",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmIsland = Value
    end
})


task.spawn(function()
    while task.wait(0.2) do
        if not _G.AutoFarmIsland then continue end
        if not _G.SelectIsland then continue end
        if not IslandData then continue end

        local island = IslandData[_G.SelectIsland]
        if not island then continue end

        local islandPos = island.CFrame
        local mobs = island.Mobs

        local MobMap = {}
        for _, name in ipairs(mobs) do
            MobMap[name] = true
        end

        local found = false

        for _, v in pairs(workspace.Enemies:GetChildren()) do
            if MobMap[v.Name]
            and v:FindFirstChild("Humanoid")
            and v:FindFirstChild("HumanoidRootPart")
            and v.Humanoid.Health > 0 then

                found = true
                repeat
                    task.wait()
                    _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                    Attack.Kill(v, true)
                until not _G.AutoFarmIsland
                   or not v.Parent
                   or v.Humanoid.Health <= 0
            end
        end

        if not found then
            _tp(islandPos)
        end
    end
end)

Tabs.Main:AddSection("Farm Elite Hunter")

local EliteHunter = Tabs.Main:AddParagraph("Elite Spawn", "Status: Loading...")
task.spawn(function()
    local previousStatus = ""
    local previousProgress = -1
    while task.wait(1) do
        pcall(function()
            local currentStatus = (replicated:FindFirstChild("Diablo") or 
                                   replicated:FindFirstChild("Deandre") or 
                                   replicated:FindFirstChild("Urban") or 
                                   workspace.Enemies:FindFirstChild("Diablo") or 
                                   workspace.Enemies:FindFirstChild("Deandre") or 
                                   workspace.Enemies:FindFirstChild("Urban")) and '✅' or '❌'
            local progress = replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
            if currentStatus ~= previousStatus or progress ~= previousProgress then
                EliteHunter:SetDesc("Status: " .. currentStatus .. " | Killed: " .. tostring(progress))
                previousStatus = currentStatus
                previousProgress = progress
            end
        end)
    end
end)

EliteQ = Tabs.Main:AddToggle({
    Name = "Auto Farm Elite",
    Description = "Automatically accept Elite Hunter quest and hunt Diablo, Deandre, or Urban",
    Default = false,
    Callback = function(Value)
        _G.FarmEliteHunt = Value
        if not Value then
            shouldTween = false
            if StopTween then StopTween() end
        end
    end
})

do
    local _EliteBossList = { "Diablo", "Deandre", "Urban" }
    local _EliteIslands = {
        ["Floating Turtle"] = {
            CFrame = CFrame.new(-12000, 331, -8500),
            Spots = {
                CFrame.new(-13232, 332, -7626),
                CFrame.new(-12053, 332, -9000),
                CFrame.new(-10500, 332, -8500),
            }
        },
        ["Hydra Island"] = {
            CFrame = CFrame.new(5228, 604, 345),
            Spots = {
                CFrame.new(5228, 604, 345),
                CFrame.new(5700, 610, -280),
            }
        },
        ["Port Town"] = {
            CFrame = CFrame.new(-290, 44, 5450),
            Spots = {
                CFrame.new(-290, 44, 5450),
                CFrame.new(-450, 110, 5950),
            }
        },
        ["Great Tree"] = {
            CFrame = CFrame.new(2200, 70, -7100),
            Spots = {
                CFrame.new(2200, 70, -7100),
                CFrame.new(2682, 1682, -7190),
            }
        }
    }

    local function _FindEliteBoss(targetName)
        local candidates = {}
        if targetName and targetName ~= "" then
            table.insert(candidates, targetName)
        else
            for _, n in ipairs(_EliteBossList) do table.insert(candidates, n) end
        end

        local en = workspace:FindFirstChild("Enemies")
        if en then
            for _, v in ipairs(en:GetChildren()) do
                if v:IsA("Model") and Attack.Alive(v) then
                    local vName = v.Name:lower()
                    for _, cName in ipairs(candidates) do
                        if vName:find(cName:lower(), 1, true) then return v end
                    end
                end
            end
        end

        local ch = workspace:FindFirstChild("Characters")
        if ch then
            for _, v in ipairs(ch:GetChildren()) do
                if v:IsA("Model") and Attack.Alive(v) and not game:GetService("Players"):GetPlayerFromCharacter(v) then
                    local vName = v.Name:lower()
                    for _, cName in ipairs(candidates) do
                        if vName:find(cName:lower(), 1, true) then return v end
                    end
                end
            end
        end

        for _, v in ipairs(replicated:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                local vName = v.Name:lower()
                for _, cName in ipairs(candidates) do
                    if vName:find(cName:lower(), 1, true) then return v end
                end
            end
        end

        return nil
    end

    local _lastDialogue = ""
    local _lastCheckTick = 0

    task.spawn(function()
        while task.wait(0.2) do
            if _G.FarmEliteHunt then
                pcall(function()
                    local char = plr.Character
                    if not char then return end
                    local root = char:FindFirstChild("HumanoidRootPart")
                    local hum = char:FindFirstChild("Humanoid")
                    if not root or not hum or hum.Health <= 0 then return end

                    local qGui = GetActiveQuestGui()
                    local qTitle = (GetActiveQuestTitle() or ""):lower()

                    local hasEliteQuest = false
                    local currentEliteBoss = nil

                    if qGui then
                        for _, name in ipairs(_EliteBossList) do
                            if qTitle:find(name:lower(), 1, true) then
                                hasEliteQuest = true
                                currentEliteBoss = name
                                break
                            end
                        end
                        if not hasEliteQuest then
                            for _, desc in ipairs(qGui:GetDescendants()) do
                                if desc:IsA("TextLabel") and desc.Visible then
                                    local txt = desc.Text:lower()
                                    for _, name in ipairs(_EliteBossList) do
                                        if txt:find(name:lower(), 1, true) then
                                            hasEliteQuest = true
                                            currentEliteBoss = name
                                            break
                                        end
                                    end
                                end
                                if hasEliteQuest then break end
                            end
                        end
                    end

                    -- Accept quest from Elite Hunter if not active
                    if not hasEliteQuest then
                        if tick() - _lastCheckTick > 4 then
                            _lastCheckTick = tick()
                            local res = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
                            _lastDialogue = tostring(res or "")
                            local dLower = _lastDialogue:lower()
                            if dLower:find("come back later") or dLower:find("cooldown") or dLower:find("don't have anything") or dLower:find("dont have anything") then
                                task.wait(5)
                                return
                            end
                        end
                    end

                    -- Check if boss is already spawned and streamed in
                    local boss = _FindEliteBoss(currentEliteBoss)
                    if boss then
                        local bRoot = boss:FindFirstChild("HumanoidRootPart") or boss.PrimaryPart
                        local bHum = boss:FindFirstChild("Humanoid")
                        if bRoot and bHum and bHum.Health > 0 then
                            repeat
                                task.wait()
                                Attack.Kill(boss, _G.FarmEliteHunt)
                                SmartEquipWeapon()
                                FastAttack.Attack()
                            until not _G.FarmEliteHunt or not boss.Parent or not Attack.Alive(boss) or not GetActiveQuestGui()
                            return
                        elseif bRoot then
                            _tp(bRoot.CFrame * CFrame.new(0, 25, 0))
                            task.wait(0.5)
                            return
                        end
                    end

                    -- Boss not found yet: determine island from dialogue and travel to spawn spots
                    local targetIsland = nil
                    local diag = _lastDialogue:lower()
                    if diag:find("turtle") then
                        targetIsland = _EliteIslands["Floating Turtle"]
                    elseif diag:find("hydra") then
                        targetIsland = _EliteIslands["Hydra Island"]
                    elseif diag:find("port") then
                        targetIsland = _EliteIslands["Port Town"]
                    elseif diag:find("tree") then
                        targetIsland = _EliteIslands["Great Tree"]
                    end

                    if targetIsland then
                        for _, spot in ipairs(targetIsland.Spots) do
                            if not _G.FarmEliteHunt then break end
                            if _FindEliteBoss(currentEliteBoss) then break end
                            _tp(spot * CFrame.new(0, 30, 0))
                            pcall(function()
                                if plr.RequestStreamAroundAsync then
                                    plr:RequestStreamAroundAsync(spot.Position)
                                end
                            end)
                            task.wait(1.5)
                        end
                    else
                        for _, isl in pairs(_EliteIslands) do
                            if not _G.FarmEliteHunt then break end
                            if _FindEliteBoss(currentEliteBoss) then break end
                            _tp(isl.CFrame * CFrame.new(0, 30, 0))
                            pcall(function()
                                if plr.RequestStreamAroundAsync then
                                    plr:RequestStreamAroundAsync(isl.CFrame.Position)
                                end
                            end)
                            task.wait(2)
                        end
                    end
                end)
            end
        end
    end)
end

EliteH = Tabs.Main:AddToggle({
	Name = "Auto Farm Elite + Hop",
	Description = "",
	Default = false,
	Callback = function(Value)
	_G.FarmEliteH = Value
end})


local function HopServer()
	local Http = game:GetService("HttpService")
	local TPS = game:GetService("TeleportService")
	local Api = "https://games.roblox.com/v1/games/"
	local PlaceID = game.PlaceId
	local Servers = {}
	local Cursor = ""
	local foundServer = false

	repeat
		local success, result = pcall(function()
			return game:HttpGet(Api .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. Cursor)
		end)
		if success and result then
			local data = Http:JSONDecode(result)
			if data.data then
				for _, v in pairs(data.data) do
					if v.playing < v.maxPlayers and v.id ~= game.JobId then
						foundServer = true
						TPS:TeleportToPlaceInstance(PlaceID, v.id)
						break
					end
				end
				Cursor = data.nextPageCursor or ""
			end
		end
	until not Cursor or foundServer
end


spawn(function()
	while task.wait(1) do
		pcall(function()
			if _G.FarmEliteH then
				local questGui = plr.PlayerGui.Main.Quest
				local questTitle = questGui.Container.QuestTitle.Title.Text

				
				if not questGui.Visible then
					local result = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
					if result == nil or string.find(result, "Cooldown") then
					
						HopServer()
						return
					end
					task.wait(1)

				else
				
					local eliteName = nil
					for _, name in pairs({"Diablo", "Urban", "Deandre"}) do
						if string.find(questTitle, name) then
							eliteName = name
							break
						end
					end

					if eliteName then
						local boss = nil
						for _, v in pairs(replicated:GetChildren()) do
							if v.Name == eliteName and v:FindFirstChild("HumanoidRootPart") then
								boss = v
								break
							end
						end
						for _, v in pairs(workspace.Enemies:GetChildren()) do
							if v.Name == eliteName and Attack.Alive(v) then
								boss = v
								break
							end
						end

						if boss and boss:FindFirstChild("HumanoidRootPart") then
							_tp(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
							repeat
								wait()
								Attack.Kill(boss, _G.FarmEliteH)
							until not _G.FarmEliteH or not boss.Parent or boss.Humanoid.Health <= 0 or not questGui.Visible
						else
						
							task.wait(5)
							HopServer()
						end
					else
					
						replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
						task.wait(1)
						HopServer()
					end
				end
			end
		end)
	end
end)

Tabs.Main:AddSection("Farm Rip Indra")

Tabs.Main:AddToggle({
Name = "Auto Attack Rip Indra", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoRipIngay = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoRipIngay then
        local v = GetConnectionEnemies("rip_indra")
	    if not GetWP("Dark Dagger") or not GetIn("Valkyrie") and v then
	      repeat wait() Attack.Kill(v,_G.AutoRipIngay)until not _G.AutoRipIngay or not v.Parent or v.Humanoid.Health <= 0
        else
          replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
		  wait(.1)_tp(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
	    end
      end
    end)
  end
end)

Tabs.Main:AddToggle({
Name = "Auto Unlocked Haki", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoUnHaki = Value
end})
AuraSkin = function(HakiID)
  local args = {[1] = {["StorageName"] = HakiID,["Type"] = "AuraSkin",["Context"] = "Equip"}};
  replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/FruitCustomizerRF"):InvokeServer(unpack(args));
end;
VaildColor = function(Part)
  if Part and Part.BrickColor then return (tostring(Part.BrickColor) == "Lime green") end;
end;
HakiCalculate = function(Part)
  local ID = {["Really red"] = "Pure Red";["Oyster"] = "Snow White";["Hot pink"] = "Winter Sky";};
  if Part and Part.BrickColor then return (ID[tostring(Part.BrickColor)])end;
end;
spawn(function()
  while wait(Sec) do
    if _G.AutoUnHaki then
      pcall(function()
        local Summoner = workspace.Map["Boat Castle"]:FindFirstChild("Summoner");
        if Summoner and Summoner:FindFirstChild("Circle") then 
          local _sc = Summoner:FindFirstChild("Circle") for i,v in pairs(_sc and _sc:GetChildren() or {}) do 
            if v.Name == "Part" then 
            local TogglesPart = v:FindFirstChild("Part");
              if VaildColor(TogglesPart) == false then 
                AuraSkin(HakiCalculate(v));
                repeat wait() _tp(v.CFrame) until VaildColor(TogglesPart) == true or not _G.AutoUnHaki;
              end
            end            
          end
        end        
      end)
    end
  end
end)

Tabs.Main:AddSection("Farming Cake")
local MobKilled = Tabs.Main:AddParagraph("Cake Princes", "")
spawn(function()
    while wait(0.2) do
        pcall(function()
            local Killed = string.match(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"), "%d+")
            if Killed then
                MobKilled:SetDesc("Killed : " .. (500 - tonumber(Killed) or 0))
            end
        end)
    end
end)

Cake = Tabs.Main:AddToggle({
    Name = "Auto Farm Cake Prince",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.Auto_Cake_Prince = Value
end
})

spawn(function()
    while task.wait(0.12) do
        if _G.Auto_Cake_Prince and not _G.AutoRaidCastle then
            pcall(function()
                local char = plr.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if not root then return end

                local questUI = GetActiveQuestGui()
                local cakeMap = workspace.Map:FindFirstChild("CakeLoaf")
                local bigMirror = cakeMap and cakeMap:FindFirstChild("BigMirror")

                if _G.AcceptQuestC and not questUI then
                    local questPos = CFrame.new(-1927.92, 37.8, -12842.54)
                    if (questPos.Position - root.Position).Magnitude > 25 then
                        _tp(questPos)
                    else
                        local questData = {
                            {"StartQuest", "CakeQuest2", 2},
                            {"StartQuest", "CakeQuest2", 1},
                            {"StartQuest", "CakeQuest1", 1},
                            {"StartQuest", "CakeQuest1", 2}
                        }
                        replicated.Remotes.CommF_:InvokeServer(unpack(questData[math.random(1, #questData)]))
                    end
                end

                local boss = GetConnectionEnemies("Cake Prince")
                if boss and boss:FindFirstChild("HumanoidRootPart") then
                    local bRoot = boss.HumanoidRootPart
                    _tp(bRoot.CFrame * CFrame.new(0, 25, 0))
                    EquipWeapon(_G.SelectWeapon)
                    if typeof(AttackNoCoolDown) == "function" then AttackNoCoolDown() end
                else
                    local CakeMobs = {"Cookie Crafter","Cake Guard","Baking Staff","Head Baker"}
                    local cluster = {}
                    for _, mob in ipairs(workspace.Enemies:GetChildren()) do
                        if IsValidLivingEnemy(mob) and table.find(CakeMobs, mob.Name) then
                            table.insert(cluster, mob)
                        end
                    end
                    if #cluster > 0 then
                        local sumX, sumY, sumZ = 0, 0, 0
                        for _, m in ipairs(cluster) do
                            local r = m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart
                            sumX = sumX + r.Position.X
                            sumY = sumY + r.Position.Y
                            sumZ = sumZ + r.Position.Z
                        end
                        local center = Vector3.new(sumX / #cluster, sumY / #cluster, sumZ / #cluster)
                        _tp(CFrame.new(center.X, center.Y + 22, center.Z))
                        GroupAreaMobs(cluster, center)
                        EquipWeapon(_G.SelectWeapon)
                        if typeof(AttackNoCoolDown) == "function" then AttackNoCoolDown() end
                    else
                        _tp(CFrame.new(-2077, 252, -12373))
                    end
                end
            end)
        end
    end
end)

CakeQ = Tabs.Main:AddToggle({
Name = "Accept Quests", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AcceptQuestC = Value
end
})


CakeSM = Tabs.Main:AddToggle({
    Name = "Auto Summon Cake Prince",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.AutoSpawnCP = Value
end})

spawn(function()
    while task.wait(2) do
        if _G.AutoSpawnCP then
            pcall(function()
                local CommF = game.ReplicatedStorage.Remotes.CommF_
                local enemies = workspace.Enemies
                local bigMirror = workspace.Map.CakeLoaf:FindFirstChild("BigMirror")
                if not bigMirror then return end
                if enemies:FindFirstChild("Cake Prince") then return end
                if bigMirror.Other.Transparency == 0 then return end

                CommF:InvokeServer("CakePrinceSpawner", true)
            end)
        end
    end
end)


Tabs.Main:AddToggle({
    Name = "Auto Dough King [Fully]",
    Default = false,
    Callback = function(Value)
        _G.AutoDoughKing = Value
    end
})

spawn(function()
    while wait() do
        if _G.AutoDoughKing then
            pcall(function()
                if not workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
                    if GetBP("Red Key") then
                        replicated.Remotes.CommF_:InvokeServer("CakeScientist", "Check")
                        replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
                    end
                elseif workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
                    if GetBP("Red Key") then
                        repeat
                            task.wait()
                            _tp(CFrame.new(-2681.97998, 64.3921585, -12853.7363,0.149007782, -1.87902192e-08, 0.98883605,3.60619588e-08, 1, 1.35681812e-08,-0.98883605, 3.36376011e-08, 0.149007782))
                        until not getgenv().AutoDoughKing or (plr.Character.HumanoidRootPart.CFrame - CFrame.new(-2681.97998, 64.3921585, -12853.7363,0.149007782, -1.87902192e-08, 0.98883605,3.60619588e-08, 1, 1.35681812e-08,-0.98883605, 3.36376011e-08, 0.149007782)).Magnitude <= 5
                        EquipWeapon("Red Key")
                    end
                elseif GetConnectionEnemies("Dough King") then
                    local v = GetConnectionEnemies("Dough King")
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, _G.AutoDoughKing)
                        until not _G.AutoDoughKing or not v.Parent or v.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
                    end
                end
                if GetBP("Sweet Chalice") then
                    replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                    _G.AutoAttackDoughKing = true
                else
                    _G.AutoAttackDoughKing = false
                end
                if GetBP("God's Chalice") and GetM("Conjured Cocoa") >= 10 then
                    replicated.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                end
                if not plr.Backpack:FindFirstChild("God's Chalice")
                    or plr.Character:FindFirstChild("God's Chalice")
                then
                    _G.FarmEliteHunt = true
                else
                    _G.FarmEliteHunt = false
                end
                if GetM("Conjured Cocoa") <= 10 then
                    local v = GetConnectionEnemies{"Cocoa Warrior", "Chocolate Bar Battler"}
                    if v then
                        repeat
                            task.wait()
                            Attack.Kill(v, _G.AutoDoughKing)
                        until _G.AutoDoughKing == false or not v.Parent or v.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(402.7189025878906, 81.06050109863281, -12259.54296875))
                    end
                end
            end)
        end
    end
end)
Tabs.Main:AddToggle({
    Name = "Auto Farm Dough King",
    Default = false,
    Callback = function(Value)
        _G.AutoAttackDoughKing = Value
    end
})
spawn(function()
    while wait() do
        if _G.AutoAttackDoughKing then
            pcall(function()
                local v = GetConnectionEnemies("Dough King")
                if v then
                    repeat 
                        task.wait()
                        Attack.Kill(v,_G.AutoAttackDoughKing)
                    until not _G.AutoAttackDoughKing or not v.Parent or v.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))
                end
            end)
        end
    end
end)

Tabs.Main:AddToggle({
    Name = "Auto Farm Dough King + Hop",
    Default = false,
    Callback = function(Value)
        _G.AutoHop_Dough = Value
    end
})


local function HopServer()
    pcall(function()
        local Http = game:GetService("HttpService")
        local Servers = {}
        local req = game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
        local data = Http:JSONDecode(req)

        for i,v in pairs(data.data) do
            if v.playing < v.maxPlayers then
                table.insert(Servers, v.id)
            end
        end
        if #Servers > 0 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Servers[math.random(1,#Servers)], game.Players.LocalPlayer)
        end
    end)
end


spawn(function()
    while task.wait() do
        if _G.AutoHop_Dough then
            pcall(function()
                local v = GetConnectionEnemies("Dough King")

                if v then
                 
                    repeat 
                        task.wait()
                        Attack.Kill(v, _G.AutoHop_Dough)
                    until not _G.AutoHop_Dough or not v.Parent or v.Humanoid.Health <= 0

                else
                  
                    _tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))

                    task.wait(2)

                    
                    local checkAgain = GetConnectionEnemies("Dough King")

                    if not checkAgain and _G.AutoHop_Dough then
                        HopServer()
                    end
                end
            end)
        end
    end
end)

Tabs.Main:AddSection("Farming Bone")

local CheckingBone = Tabs.Main:AddParagraph("Bones", "")
spawn(function()
    while wait(0.2) do
        pcall(function()
            CheckingBone:SetDesc("Bones : " .. GetM("Bones"))
        end)
    end
end)

Tabs.Main:AddToggle({
    Name = "Auto Farm Bone",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm_Bone = Value
    end
})

spawn(function()
    local BonesTable = {
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy"
    }

    while task.wait(0.12) do
        if _G.AutoFarm_Bone then
            pcall(function()
                local char = plr.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if not root then return end

                local questUI = GetActiveQuestGui()

                if _G.AcceptQuestB and not questUI then
                    local questPos = CFrame.new(-9516.99316, 172.01718, 6078.46533)
                    if (questPos.Position - root.Position).Magnitude > 25 then
                        _tp(questPos)
                    else
                        local questData = {
                            {"StartQuest","HauntedQuest2",2},
                            {"StartQuest","HauntedQuest2",1},
                            {"StartQuest","HauntedQuest1",1},
                            {"StartQuest","HauntedQuest1",2}
                        }
                        replicated.Remotes.CommF_:InvokeServer(unpack(questData[math.random(1,#questData)]))
                    end
                end

                local cluster = {}
                for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
                    if IsValidLivingEnemy(enemy) and table.find(BonesTable, enemy.Name) then
                        table.insert(cluster, enemy)
                    end
                end

                if #cluster > 0 then
                    local sumX, sumY, sumZ = 0, 0, 0
                    for _, m in ipairs(cluster) do
                        local r = m:FindFirstChild("HumanoidRootPart") or m.PrimaryPart
                        sumX = sumX + r.Position.X
                        sumY = sumY + r.Position.Y
                        sumZ = sumZ + r.Position.Z
                    end
                    local center = Vector3.new(sumX / #cluster, sumY / #cluster, sumZ / #cluster)
                    _tp(CFrame.new(center.X, center.Y + 22, center.Z))
                    GroupAreaMobs(cluster, center)
                    EquipWeapon(_G.SelectWeapon)
                    if typeof(AttackNoCoolDown) == "function" then AttackNoCoolDown() end
                else
                    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                end
            end)
        end
    end
end)

BoneQ = Tabs.Main:AddToggle({
Name = "Accept Quests", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AcceptQuestB = Value
end
})        



Tabs.Main:AddToggle({
Name = "Auto Soul Reaper", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoHytHallow = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoHytHallow then
      pcall(function()
        local v = GetConnectionEnemies("Soul Reaper")
	    if v then
          repeat task.wait() Attack.Kill(v,_G.AutoHytHallow) until v.Humanoid.Health <= 0 or _G.AutoHytHallow == false
        else
          if not GetBP("Hallow Essence") then
            repeat task.wait(.1)replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1)until _G.AutoHytHallow == false or GetBP("Hallow Essence")
          else
            repeat wait(.1) _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))until _G.AutoHytHallow == false or (plr.Character.HumanoidRootPart.CFrame == CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
		    EquipWeapon("Hallow Essence")
          end
        end
      end)
    end
  end
end)
RanBone = Tabs.Main:AddToggle({
Name = "Auto Random Bones", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Random_Bone = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Random_Bone then    
  	    repeat task.wait() replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) until not _G.Auto_Random_Bone
      end
    end)
  end
end)
Lucky = Tabs.Main:AddToggle({
Name = "Auto Try Luck Gravestone", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TryLucky = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.TryLucky then
    local try_bones_luck = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
      if (plr.Character.HumanoidRootPart.CFrame ~= try_bones_luck) then
        _tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
	 elseif (plr.Character.HumanoidRootPart.CFrame == try_bones_luck) then
	   replicated.Remotes.CommF_:InvokeServer("gravestoneEvent",1)
      end
    end
  end
end)
Pray = Tabs.Main:AddToggle({
Name = "Auto Pray Gravestone", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Praying = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Praying then
    local try_bones_luck = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
      if (plr.Character.HumanoidRootPart.CFrame ~= try_bones_luck) then
	   _tp(CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813))
      elseif (plr.Character.HumanoidRootPart.CFrame == try_bones_luck) then
	   replicated.Remotes.CommF_:InvokeServer("gravestoneEvent",2)
      end
    end
  end
end)


Tabs.Main:AddSection("Tyrant of the Skies")

local TyrantStatus = Tabs.Main:AddParagraph("Boss Spawn", "")
spawn(function()
    pcall(function()
        while wait(1) do
            if workspace.Enemies:FindFirstChild("Tyrant of the Skies") then
                TyrantStatus:SetDesc("✅")
            else
                TyrantStatus:SetDesc("❌")
            end
        end
    end)
end)
local EyeStatus = Tabs.Main:AddParagraph("Check Status Eyes", "")

function Check_Eye()
    local ok, count, isFull = pcall(function()
        local tiki = workspace.Map:FindFirstChild("TikiOutpost")
        local e = tiki and tiki:FindFirstChild("IslandModel")
        if not e then return 0, false end
        local eChunks = e:FindFirstChild("IslandChunks")
        local eE = eChunks and eChunks:FindFirstChild("E")
        local eyes = {
            e:FindFirstChild("Eye1"),
            e:FindFirstChild("Eye2"),
            eE and eE:FindFirstChild("Eye3"),
            eE and eE:FindFirstChild("Eye4")
        }
        local cnt = 0
        for _, eye in ipairs(eyes) do
            if eye and eye.Transparency ~= 1 then
                cnt = cnt + 1
            end
        end
        return cnt, (cnt == 4)
    end)
    if not ok then return 0, false end
    return count, isFull
end

task.spawn(function()
    local alerted = false
    while task.wait(1) do
        local current, full = Check_Eye()
        EyeStatus:SetDesc("Eyes: " .. current .. "/4")

        if full and not alerted then
            alerted = true
        elseif not full then
            alerted = false
        end
    end
end)

FarmTyrant = Tabs.Main:AddToggle({
Name = "Auto Farm Boss TOTS", 
Description = "", 
Default = false,
Callback = function(Value) 
    _G.FarmTyrant = Value 
end})

spawn(function()
    while wait(Sec) do
        if _G.FarmTyrant then
            pcall(function()
                if not plr.Character then return end
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local bossPos = Vector3.new(-16268.287, 152.616, 1390.773)
                
                if (hrp.Position - bossPos).Magnitude > 5 then
                    _tp(CFrame.new(bossPos))
                    repeat wait() until not _G.FarmTyrant or (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and (plr.Character.HumanoidRootPart.Position - bossPos).Magnitude <= 5)
                end

                local boss = workspace.Enemies:FindFirstChild("Tyrant of the Skies")
                if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    repeat
                        if not _G.FarmTyrant then break end
                        if Attack and Attack.Kill then
                            Attack.Kill(boss, _G.FarmTyrant)
                        end
                        wait()
                    until not _G.FarmTyrant or not boss.Parent or boss.Humanoid.Health <= 0
                    return
                end

                local mobList = {"Serpent Hunter","Skull Slayer","Isle Champion","Sun-kissed Warrior"}
                for _, mobName in ipairs(mobList) do
                    if not _G.FarmTyrant then break end
                    for _, mob in pairs(workspace.Enemies:GetChildren()) do
                        if not _G.FarmTyrant then break end
                        if mob and mob.Name == mobName and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                            if (hrp.Position - mob.HumanoidRootPart.Position).Magnitude > 5000 then
                                _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                local t0 = tick()
                                repeat wait() hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") until not _G.FarmTyrant or not hrp or (hrp.Position - mob.HumanoidRootPart.Position).Magnitude <= 6 or tick() - t0 > 8
                            end
                            repeat
                                if not _G.FarmTyrant then break end
                                if Attack and Attack.Kill then
                                    Attack.Kill(mob, _G.FarmTyrant)
                                end
                                wait()
                            until not _G.FarmTyrant or not mob.Parent or mob.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

FarmPhaBinh = Tabs.Main:AddToggle({
Name = "Auto Summon Boss", 
Description = "", 
Default = false,
Callback = function(Value)
    _G.FarmPhaBinh = Value
end})

local function sendSkillKey(skillKey)
    local virtualInputManager = game:GetService("VirtualInputManager")
    virtualInputManager:SendKeyEvent(true, skillKey, false, game)
    wait(0.05)
    virtualInputManager:SendKeyEvent(false, skillKey, false, game)
end

local function equipAndUseSkill(toolType)
    local character = plr.Character
    local backpack = plr.Backpack
    if not (character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0) then return end

    for _, item in pairs(backpack:GetChildren()) do
        if item:IsA("Tool") and item.ToolTip == toolType then
            item.Parent = character
            wait(0.12)
            for _, skill in ipairs({"Z", "X", "C", "V", "F"}) do
                if not _G.FarmPhaBinh then break end
                pcall(function() sendSkillKey(skill) end)
                wait(0.12)
            end
            item.Parent = backpack
            break
        end
    end
end

local PhaBinhPoints = {
    CFrame.new(-16332.5263671875, 158.07200622558594, 1440.324951171875),
    CFrame.new(-16288.609375, 158.16700744628906, 1470.3680419921875),
    CFrame.new(-16245.412109375, 158.43699645996094, 1463.365966796875),
    CFrame.new(-16212.46875, 158.16700744628906, 1466.343994140625),
    CFrame.new(-16211.9462890625, 158.07200622558594, 1322.39794921875),
    CFrame.new(-16260.921875, 154.92100524902344, 1323.615966796875),
    CFrame.new(-16297.0595703125, 159.322998046875, 1317.2239990234375),
    CFrame.new(-16335.0966796875, 159.33399963378906, 1324.885986328125),
}

spawn(function()
    while wait(Sec) do
        if _G.FarmPhaBinh then
            pcall(function()
                if not (plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0) then return end

                for _, point in ipairs(PhaBinhPoints) do
                    if not _G.FarmPhaBinh then break end

                    _tp(point)

                    local arrived = false
                    local start = tick()
                    while tick() - start < 12 and not arrived and _G.FarmPhaBinh do
                        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                        if not hrp then break end
                        local dist = (hrp.Position - point.Position).Magnitude
                        if dist <= 3 then
                            arrived = true
                            break
                        end
                        wait(0.1)
                    end

                    if _G.FarmPhaBinh and arrived then
                        equipAndUseSkill("Melee")
                        equipAndUseSkill("Sword")
                        equipAndUseSkill("Gun")
                    end
                end
            end)
        end
    end
end)


Tabs.Main:AddSection("Farm Material")

Test = Tabs.Main:AddDropdown({
Name = "Choose Material",
		Description = "",
		Options = MaterialList,
		Callback = function(Value)
			getgenv().SelectMaterial = Value
		end
		})
Toggle = Tabs.Main:AddToggle({
Name = "Auto Farm Materials", 
Description = "", 
Default = false,
Callback = function(Value)
    getgenv().AutoMaterial = Value
end})
spawn(function()
  local function processEnemy(v, EnemyName)
    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
      if v.Name == EnemyName then repeat wait() Attack.Kill(v,getgenv().AutoMaterial) until not getgenv().AutoMaterial or not v.Parent or v.Humanoid.Health <= 0 end
    end
  end
  local function handleEnemySpawns()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
      for _, EnemyName in ipairs(MMon) do
        if string.find(v.Name, EnemyName) then
          if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
            _tp(v.CFrame * Pos)
          end
        end
      end
    end
  end
  while wait() do
    if getgenv().AutoMaterial then
      pcall(function()
        if getgenv().SelectMaterial then MaterialMon(getgenv().SelectMaterial) _tp(MPos) end
        for _, EnemyName in ipairs(MMon) do
          for _, v in pairs(workspace.Enemies:GetChildren()) do processEnemy(v, EnemyName) end
        end
        handleEnemySpawns()
      end)
    end
  end
end)


Tabs.Main:AddSection("Farm Boss")

		BossDropdown = Tabs.Main:AddDropdown({
		Name = "Select Boss",
		Description = "",
		Options = BossList,
		Callback = function(value)
			_G.FindBoss = value
		end
		})

FarmBoss = Tabs.Main:AddToggle({
    Name = "Auto Farm Boss",
    Description = "",
    Default = false,
    Callback = function(value)
        _G.FarmBoss = value
        spawn(function()
            while wait(Sec) do
                if _G.FarmBoss then
                    pcall(function()
                        local HasQuest = QuestBeta()[2] ~= nil and QuestBeta()[3] ~= nil
                        local QuestTitle = GetActiveQuestTitle() or ""
                        local questUI = GetActiveQuestGui()

                        if _G.AcceptQuestBoss and HasQuest then
                            if QuestTitle ~= "" and not string.find(QuestTitle:lower(), tostring(QuestBeta()[0]):lower()) then
                                replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                            end

                            if not questUI then
                                _tp(QuestBeta()[5])
                                if (Root.Position - QuestBeta()[5].Position).Magnitude <= 20 then
                                    replicated.Remotes.CommF_:InvokeServer("StartQuest", QuestBeta()[3], QuestBeta()[2])
                                end
                            elseif questUI then
                                if workspace.Enemies:FindFirstChild(QuestBeta()[1]) then
                                    for i, v in pairs(workspace.Enemies:GetChildren()) do
                                        if Attack.Alive(v) and v.Name == QuestBeta()[1] then
                                            if string.find(QuestTitle, QuestBeta()[0]) then
                                                repeat
                                                    wait()
                                                    Attack.Kill(v, _G.FarmBoss)
                                                until not _G.FarmBoss or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                                            else
                                                replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                                            end
                                        end
                                    end
                                else
                                    _tp(QuestBeta()[4])
                                    if replicated:FindFirstChild(QuestBeta()[1]) then
                                        _tp(replicated:FindFirstChild(QuestBeta()[1]).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    end
                                end
                            end
                        else
                           
                            if workspace.Enemies:FindFirstChild(QuestBeta()[1]) then
                                for i, v in pairs(workspace.Enemies:GetChildren()) do
                                    if Attack.Alive(v) and v.Name == QuestBeta()[1] then
                                        repeat
                                            wait()
                                            Attack.Kill(v, _G.FarmBoss)
                                        until not _G.FarmBoss or v.Humanoid.Health <= 0 or not v.Parent
                                    end
                                end
                            else
                                _tp(QuestBeta()[4])
                                if replicated:FindFirstChild(QuestBeta()[1]) then
                                    _tp(replicated:FindFirstChild(QuestBeta()[1]).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
})


BossQ = Tabs.Main:AddToggle({
    Name = "Accept Quests",
    Description = "",
    Default = true,
    Callback = function(Value)
        _G.AcceptQuestBoss = Value
    end
})

FarmAllBoss = Tabs.Main:AddToggle({
   Name = "Auto Farm All Boss",
    Default = false,
Callback = function(Value)
    _G.AutoFarmAllBoss = Value
end})

task.spawn(function()
    while task.wait(0.3) do
        if _G.AutoFarmAllBoss then
            pcall(function()
                local player = game.Players.LocalPlayer
                if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
                local hrp = player.Character.HumanoidRootPart

                local nearestBoss, nearestDist = nil, math.huge

                for _, boss in pairs(workspace.Enemies:GetChildren()) do
                    if boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                        if table.find(BossList, boss.Name) then
                            local dist = (hrp.Position - boss.HumanoidRootPart.Position).Magnitude
                            if dist < nearestDist then
                                nearestBoss = boss
                                nearestDist = dist
                            end
                        end
                    end
                end

                if nearestBoss and nearestBoss:FindFirstChild("HumanoidRootPart") then
                    local bossHRP = nearestBoss.HumanoidRootPart
                    local humanoid = nearestBoss.Humanoid

                    repeat
                        task.wait(0.1)
                        if not _G.AutoFarmAllBoss then break end

                        local targetCFrame = bossHRP.CFrame * CFrame.new(0, 25, 0)
                        _tp(targetCFrame)
                        EquipWeapon(_G.SelectWeapon)
                        if typeof(AttackNoCoolDown) == "function" then
                            AttackNoCoolDown()
                        elseif Attack and typeof(Attack.Kill) == "function" then
                            Attack.Kill(nearestBoss, true)
                        end
                    until not nearestBoss.Parent or humanoid.Health <= 0 or not _G.AutoFarmAllBoss
                end
            end)
        end
    end
end)

Tabs.Main:AddSection("Farming Mastery")
local posMastery = {"Cake","Bone"}
local Mastery_Config = Tabs.Main:AddDropdown({
Name = "Choose Island",
		Description = "",
		Options = posMastery,
		Default = Bone,
		Callback = function(Value)
  SelectIsland = Value
end})
local MasteryFruits = Tabs.Main:AddToggle({
Name = "Auto Mastery Fruits", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmMastery_Dev = Value
end})
spawn(function()RunSer.RenderStepped:Connect(function() pcall(function()if _G.FarmMastery_Dev or _G.FarmMastery_G or _G.FarmMastery_S then for a,b in pairs(plr.PlayerGui.Notifications:GetChildren())do if b.Name=="NotificationTemplate"then if string.find(b.Text,"Skill locked!")then b:Destroy()end end end end end)end) end)
spawn(function()
  while wait(Sec) do
    if _G.FarmMastery_Dev then
      pcall(function()
        if SelectIsland == "Cake" then         
          local v = GetConnectionEnemies(mastery1)
		  if v then		   
		    HealthM = v.Humanoid.MaxHealth * 70 / 100
		    repeat wait()
		      MousePos = v.HumanoidRootPart.Position
		      Attack.Mas(v,_G.FarmMastery_Dev)
		    until _G.FarmMastery_Dev == false or v.Humanoid.Health <= 0 or not v.Parent         		         		        
		  else
		    _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
		  end
		elseif SelectIsland == "Bone" then
          local v = GetConnectionEnemies(mastery2)
		  if v then		
		    HealthM = v.Humanoid.MaxHealth * 70 / 100
		    repeat wait()
		      MousePos = v.HumanoidRootPart.Position
		      Attack.Mas(v,_G.FarmMastery_Dev)
		    until _G.FarmMastery_Dev == false or v.Humanoid.Health <= 0 or not v.Parent		        
		  else
		    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 		    
		  end
        end
      end)
    end
  end
end)
local MasteryGun = Tabs.Main:AddToggle({
Name = "Auto Mastery Gun", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmMastery_G = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.FarmMastery_G then
      pcall(function()
        if SelectIsland == "Cake" then
          local v = GetConnectionEnemies(mastery1)
		  if v then		      
		    HealthM = v.Humanoid.MaxHealth * 70 / 100
		    repeat wait()
		      MousePos = v.HumanoidRootPart.Position
		      Attack.Masgun(v,_G.FarmMastery_G)
		      local Modules = replicated:FindFirstChild("Modules")
              local Net = Modules:FindFirstChild("Net")
              local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")    
              local tool = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
              if not tool or tool.ToolTip ~= "Gun" then return end
              if tool.Name == 'Skull Guitar' then
                SoulGuitar = true
		        plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)
		        if _G.FarmMastery_G then
		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)
                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)
                end
		      elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name ~= 'Skull Guitar' then
		        SoulGuitar = false
		        RE_ShootGunEvent:FireServer(MousePos, { v.HumanoidRootPart })
		        if _G.FarmMastery_G then
		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)
                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)
                end
		      end		            		
		    until _G.FarmMastery_G == false or v.Humanoid.Health <= 0 or not v.Parent    
		    SoulGuitar = false     		         		        
		  else
		    _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 		    
	  	  end
		elseif SelectIsland == "Bone" then
          local v = GetConnectionEnemies(mastery2)
		  if v then		      
		    HealthM = v.Humanoid.MaxHealth * 70 / 100
		    repeat wait()
		      MousePos = v.HumanoidRootPart.Position
		      Attack.Masgun(v,_G.FarmMastery_G)
		      local Modules = replicated:FindFirstChild("Modules")
              local Net = Modules:FindFirstChild("Net")
              local RE_ShootGunEvent = Net:FindFirstChild("RE/ShootGunEvent")    
              local tool = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
              if not tool or tool.ToolTip ~= "Gun" then return end
              if tool.Name == 'Skull Guitar' then
                SoulGuitar = true
		        plr.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)
		        if _G.FarmMastery_G then
		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)
                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)
                end
		      elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool").Name ~= 'Skull Guitar' then
		        SoulGuitar = false
		        RE_ShootGunEvent:FireServer(MousePos, { v.HumanoidRootPart })
		        if _G.FarmMastery_G then
		          vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1);wait(0.05)
                  vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1);wait(0.05)
                end
		      end		            		
		    until _G.FarmMastery_G == false or v.Humanoid.Health <= 0 or not v.Parent    
		    SoulGuitar = false     		         		        
		  else
		    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
	  	  end
        end
      end)
    end
  end
end)
local MasterySword = Tabs.Main:AddToggle({
Name = "Auto Mastery All Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmMastery_S = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.FarmMastery_S then
        if SelectIsland == "Cake" then
          for _, v in next, replicated.Remotes.CommF_:InvokeServer("getInventory") do          
            if type(v) == "table" then
              if v.Type == "Sword" then
                SwordName = v.Name
                if tonumber(v.Mastery) >= 1 or tonumber(v.Mastery) <= 599 then
                  local v = GetConnectionEnemies(mastery1)
                  if GetBP(SwordName) then                    
		            if v then
                      repeat wait() Attack.Sword(v,_G.FarmMastery_S) until _G.FarmMastery_S == false or not v.Parent or v.Humanoid.Health <= 0		                  
		            else
		              _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
		            end                    
                  else
                    replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName)   
                  end   
              elseif tonumber(v.Mastery) >= 600 then
                if GetBP(SwordName) then return nil else replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName) end       
              end
                break
              end
            end         
          end
        elseif SelectIsland == "Bone" then
          for _, v in next, replicated.Remotes.CommF_:InvokeServer("getInventory") do          
            if type(v) == "table" then
              if v.Type == "Sword" then
                SwordName = v.Name
                if tonumber(v.Mastery) >= 1 or tonumber(v.Mastery) <= 599 then
                  local v = GetConnectionEnemies(mastery2)
                  if GetBP(SwordName) then                    
		            if v then
                      repeat wait() Attack.Sword(v,_G.FarmMastery_S) until _G.FarmMastery_S == false or not v.Parent or v.Humanoid.Health <= 0		                  
		            else
		              _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
		            end                    
                  else
                    replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName)   
                  end   
                elseif tonumber(v.Mastery) >= 600 then
                  if GetBP(SwordName) then return nil else replicated.Remotes.CommF_:InvokeServer("LoadItem",SwordName) end       
                end
                break
              end
            end         
          end
        end
      end
    end)
  end
end)






Tabs.Settings:AddSection("Settings / Configure")

Initialize = Tabs.Settings:AddToggle({
Name = "Fast Attack", 
Description = "", 
Default = true,
Callback = function(Value)
  _G.Seriality = Value
end})
Bringmob = Tabs.Settings:AddToggle({
Name = "Bring Mobs", 
Description = "", 
Default = true,
Callback = function(Value)
  _B = Value
end})
Tabs.Settings:AddToggle({
    Name = "Auto Hop Server with time",
    Default = false,
    Callback = function(Value)
        _G.AutoHopServer = Value
        if not Value then
            _G.HopTimer = nil
        end
    end
})

Spawn(function()
    while Wait(1) do
        if _G.AutoHopServer then
            pcall(function()
                if not _G.HopTimer then
                    _G.HopTimer = tick()
                end

                if tick() - _G.HopTimer >= _G.HopDelay then
                    _G.HopTimer = tick()

                    if syn and syn.queue_on_teleport then
                        syn.queue_on_teleport(
                            "loadstring(game:HttpGet('https://raw.githubusercontent.com/bloxfruitsnokey/Redz/refs/heads/main/Chest'))()"
                        )
                    end

                    game:GetService("TeleportService")
                        :Teleport(game.PlaceId, game.Players.LocalPlayer)
                end
            end)
        end
    end
end)
Tabs.Settings:AddSlider({
    Name = "Hop Delay (Minutes)",
    Min = 5,
    Max = 120,
    Default = 30,
    Increment = 1,
    Callback = function(Value)
        _G.HopDelay = Value * 60
    end
})
Tabs.Settings:AddToggle({
    Name = "Auto Set Spawn Point",
    Default = false,
    Callback = function(Value)
        getgenv().Set = Value
        if Value then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end)
        end
    end
})
BusuAura = Tabs.Settings:AddToggle({
Name = "Auto Turn on Buso", 
Description = "", 
Default = true,
Callback = function(Value)
  Boud = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if Boud then
      local _HasBuso = {"HasBuso","Buso"}
  	  if not plr.Character:FindFirstChild(_HasBuso[1]) then replicated.Remotes.CommF_:InvokeServer(_HasBuso[2]) end
      end
    end)
  end
end)
Tabs.Settings:AddToggle({
    Name = "Auto Haki Observation",
    Default = false,
    Callback = function(Value)
        getgenv().Observation = Value
    end
})
spawn(function()
    while wait() do
        if getgenv().Observation then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            end)
        end
    end
end)
RaceV3Aura = Tabs.Settings:AddToggle({
Name = "Auto Turn on Race V3", 
Description = "", 
Default = false,
Flag = "AutoTurnonRaceV3",
Callback = function(Value)
  _G.RaceClickAutov3 = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.RaceClickAutov3 then
        repeat
          replicated.Remotes.CommE:FireServer("ActivateAbility") 
          wait(30)
        until not _G.RaceClickAutov3   
      end 
    end)
  end
end)
RaceV4Aura = Tabs.Settings:AddToggle({
Name = "Auto Turn on Race V4", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.RaceClickAutov4 = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.RaceClickAutov4 then
  	    if plr.Character:FindFirstChild("RaceEnergy") then
        if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then Useskills("nil","Y") end
        end        
      end 
    end)
  end
end)

RandomAround = Tabs.Settings:AddToggle({
Name = "Auto Turn on Spin  xyz", 
Description = "", 
Default = false,
Callback = function(Value)
  RandomCFrame = Value
end})
SafeModes = Tabs.Settings:AddToggle({
Name = "Safe Mode", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Safemode = Value
end})
spawn(function()
  while task.wait(Sec) do
    pcall(function()
	  if _G.Safemode then
  	  local Calc_Health = plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth * 100
  	  if Calc_Health < Num_self then shouldTween=true _tp(Root.CFrame * CFrame.new(0,500,0)) else shouldTween=false end
      end
    end)
  end
end)

DisableHitVFX = Tabs.Settings:AddToggle({
    Name = "Remove Hit VFX",
    Description = "Removes slash and sword visual effects for better visibility",
    Default = false,
    Callback = function(Value)
        _G.DestroyHit = Value
    end
})

local HitEffects = {"SlashHit", "CurvedRing", "SwordSlash", "SlashTail"}

task.spawn(function()
    while task.wait(Sec) do
        if _G.DestroyHit then
            pcall(function()
                for _, v in pairs(workspace["_WorldOrigin"]:GetChildren()) do
                    if table.find(HitEffects, v.Name) then
                        v:Destroy()
                    end
                end
            end)
        end
    end
end)
RmvVFX = Tabs.Settings:AddToggle({
Name = "Remove Death & Respawned VFX", 
Description = "", 
Default = false,
Callback = function(Value)
  RDeath = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if RDeath then
	  if replicated.Effect.Container:FindFirstChild("Death") then replicated.Effect.Container.Death:Destroy() end
      if replicated.Effect.Container:FindFirstChild("Respawn") then replicated.Effect.Container.Respawn:Destroy() end
	  end
    end)
  end
end)	
DisblesNotify = Tabs.Settings:AddToggle({
Name = "Disable Notify", 
Description = "", 
Default = false,
Callback = function(Value)
  RemoveDamage = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if RemoveDamage then
        replicated.Assets.GUI.DamageCounter.Enabled = false
        plr.PlayerGui.Notifications.Enabled = false
	  else
        replicated.Assets.GUI.DamageCounter.Enabled = true
        plr.PlayerGui.Notifications.Enabled = true
      end
    end)
  end
end)      

Tabs.Settings:AddToggle({
    Name = "Anti AFK",
    Default = true,
    Callback = function(Value)
        if Value then
            local vu = game:GetService("VirtualUser")
            repeat wait() until game:IsLoaded()
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
})

Tabs.Settings:AddToggle({
    Name = "Auto Anti - Admin Join Server",
    Description = "",
    Default = true,
    Callback = function(Value)
        getgenv().HopServerAdmin = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().HopServerAdmin then
                for _, v in pairs(game.Players:GetPlayers()) do
                    local blacklist = {
                        "red_game43", "rip_indra", "Axiore", "Polkster", "wenlocktoad",
                        "Daigrock", "toilamvidamme", "oofficialnoobie", "Uzoth", "Azarth",
                        "arlthmetic", "Death_King", "Lunoven", "TheGreateAced", "rip_fud",
                        "drip_mama", "layandikit12", "Hingoi"
                    }
                    if table.find(blacklist, v.Name) then
                        Hop()
                    end
                end
            end
        end)
    end
end)

Tabs.Settings:AddToggle({
    Name = "No Clip",
    Default = false,
    Callback = function(Value)
        getgenv().NoClip = Value
    end
})
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getgenv().NoClip then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") or v:IsA("Part") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

Tabs.Esp:AddSection("Stats Upgrade")

pSats = 10
getgenv().pSats = 10

StatusSelect = Tabs.Esp:AddSlider({
Name = "Stats Value",
Description = "Points to allocate per cycle",
Default = 10,
Min = 1,
Max = 1000,
Rounding = 1, 
Callback = function(Value)
  pSats = tonumber(Value) or 10
  getgenv().pSats = pSats
end})

StatsUpg = Tabs.Esp:AddToggle({
Name = "Auto Melee", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Melee = Value
end})
task.spawn(function()
  while task.wait(0.25) do
    pcall(function()
      if _G.Auto_Melee then statsSetings("Melee", pSats or 10) end
    end)
  end
end)

StatsUpg = Tabs.Esp:AddToggle({
Name = "Auto Swords", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Sword = Value
end})
task.spawn(function()
  while task.wait(0.25) do
    pcall(function()
      if _G.Auto_Sword then statsSetings("Sword", pSats or 10) end
    end)
  end
end)

StatsUpg = Tabs.Esp:AddToggle({
Name = "Auto Gun", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Gun = Value
end})
task.spawn(function()
  while task.wait(0.25) do
    pcall(function()
      if _G.Auto_Gun then statsSetings("Gun", pSats or 10) end
    end)
  end
end)

StatsUpg = Tabs.Esp:AddToggle({
Name = "Auto Blox Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_DevilFruit = Value
end})
task.spawn(function()
  while task.wait(0.25) do
    pcall(function()
      if _G.Auto_DevilFruit then statsSetings("Devil", pSats or 10) end
    end)
  end
end)

StatsUpg = Tabs.Esp:AddToggle({
Name = "Auto Defense", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Defense = Value
end})
task.spawn(function()
  while task.wait(0.25) do
    pcall(function()
      if _G.Auto_Defense then statsSetings("Defense", pSats or 10) end
    end)
  end
end)

Tabs.Fish:AddSection("Fishing")

Tabs.Fish:AddDropdown({
    Name = "Select Fishing Rod",
    Description = "",
    Options = {"Fishing Rod", "Gold Rod", "Shark Rod", "Shell Rod", "Treasure Rod"},
    Default = "Fishing Rod",
    Callback = function(Value)
        _G.SelectedRod = Value
    end
})

BaitDropdown = Tabs.Fish:AddDropdown({
    Name = "Select Bait",
    Description = "",
    Options = {"Basic Bait", "Kelp Bait", "Good Bait", "Abyssal Bait", "Frozen Bait", "Epic Bait", "Carnivore Bait"},
    Default = "Basic Bait",
    Callback = function(Value)
        _G.SelectedBait = Value
        if _G.AutoBuyBait then
            pcall(function()
                Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
            end)
        end
    end
})

BuyBaitToggle = Tabs.Fish:AddToggle({
    Name = "Auto Buy Bait",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoBuyBait = Value
        if Value then
            pcall(function()
                Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
            end)
        end
    end
})


task.spawn(function()
    while task.wait(2) do
        if _G.AutoBuyBait and _G.SelectedBait then
            pcall(function()
                Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
            end)
        end
    end
end)




FishingToggle = Tabs.Fish:AddToggle({
    Name = "Auto Fishing",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoFishing = Value
    end
})

do
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FishReplicated = ReplicatedStorage:WaitForChild("FishReplicated")
local FishingRequest = FishReplicated:WaitForChild("FishingRequest")
local Config = require(FishReplicated.FishingClient.Config)
local GetWaterHeight = require(ReplicatedStorage.Util.GetWaterHeightAtLocation)
local MaxDistance = Config.Rod.MaxLaunchDistance

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoFishing then
            pcall(function()
                local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local HRP = Char:FindFirstChild("HumanoidRootPart")
                if not HRP then return end

                local Tool = Char:FindFirstChildOfClass("Tool")

                
                if _G.SelectedRod and (not Tool or Tool.Name ~= _G.SelectedRod) then
                    local backpackTool = LocalPlayer.Backpack:FindFirstChild(_G.SelectedRod)
                    if backpackTool then
                        Char.Humanoid:EquipTool(backpackTool)
                        Tool = backpackTool
                    end
                end

                if Tool then
                    local waterHeight = GetWaterHeight(HRP.Position)
                    local _, hitPos = Workspace:FindPartOnRayWithIgnoreList(
                        Ray.new(Char.Head.Position, HRP.CFrame.LookVector * MaxDistance),
                        {Char, Workspace.Characters, Workspace.Enemies}
                    )
                    local TargetPos = hitPos and Vector3.new(hitPos.X, math.max(hitPos.Y, waterHeight), hitPos.Z)
                    local State = Tool:GetAttribute("State")
                    local ServerState = Tool:GetAttribute("ServerState")

                    if TargetPos and (State == "ReeledIn" or ServerState == "ReeledIn") then
                        FishingRequest:InvokeServer("StartCasting")
                        task.wait()
                        FishingRequest:InvokeServer("CastLineAtLocation", TargetPos, 100, true)
                    elseif ServerState == "Biting" then
                        FishingRequest:InvokeServer("Catching", true)
                        task.wait(0.1)
                        FishingRequest:InvokeServer("Catch", 1)
                    end
                end
            end)
        end
    end
end)


FishingQ = Tabs.Fish:AddToggle({
Name = "Auto Quest Fishing", 
Description = "",
Default = false,
Callback = function(Value)
    _G.AutoFishingQuest = Value
end})


local Players3 = game:GetService("Players")
local LocalPlayer3 = Players3.LocalPlayer
local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
local RFJobsRemoteFunction3 = ReplicatedStorage3.Modules.Net:WaitForChild("RF/JobsRemoteFunction")

local function HasQuest3()
    local questGui = LocalPlayer3.PlayerGui:FindFirstChild("Quest") or LocalPlayer3.PlayerGui:FindFirstChild("QuestGui")
    if questGui and questGui:FindFirstChild("Container") and questGui.Container:FindFirstChild("QuestTitle") then
        return true
    end
    return false
end
end

task.spawn(function()
    while task.wait(1) do
        if _G.AutoFishingQuest then
            pcall(function()
                if not HasQuest3() then
                    RFJobsRemoteFunction3:InvokeServer("FishingNPC", "Angler", "AskQuest")
                end
            end)
        end
    end
end)


QuestToggle = Tabs.Fish:AddToggle({
    Name = "Auto Complete Quest",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoQuestComplete = Value

        if Value then
            pcall(function()
                Remotes.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
            end)
        end
    end
})


task.spawn(function()
    while task.wait(5) do 
        if _G.AutoQuestComplete then
            pcall(function()
                Remotes.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
            end)
        end
    end
end)


SellFishToggle = Tabs.Fish:AddToggle({
    Name = "Auto Sell Fish",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoSellFish = Value

        if Value then
            pcall(function()
                Remotes.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
            end)
        end
    end
})


task.spawn(function()
    while task.wait(5) do 
        if _G.AutoSellFish then
            pcall(function()
                Remotes.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
            end)
        end
    end
end)


SpamSkillZ = Tabs.Fish:AddToggle({
Name = "Auto Spam Skill Z", 
Description = "",
Default = false,
Callback = function(Value)
    _G.AutoSkillZ = Value
end})


local ReplicatedStorage4 = game:GetService("ReplicatedStorage")
local RFJobToolAbilities4 = ReplicatedStorage4.Modules.Net:WaitForChild("RF/JobToolAbilities")

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoSkillZ then
            pcall(function()
                RFJobToolAbilities4:InvokeServer("Z", true)
            end)
        end
    end
end)

TravelDress = Tabs.Quests:AddToggle({
Name = "Auto Quest Sea 2", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TravelDres = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.TravelDres then
        if plr.Data.Level.Value >= 700 then
          if workspace.Map.Ice.Door.CanCollide == true and workspace.Map.Ice.Door.Transparency == 0 then
            replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
		    EquipWeapon("Key")
		    repeat wait() _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488)) until not _G.TravelDres or (Root.Position == CFrame.new(1347.7124, 37.3751602, -1325.6488).Position)
	      elseif workspace.Map.Ice.Door.CanCollide == false and workspace.Map.Ice.Door.Transparency == 1 then
            if Enemies:FindFirstChild("Ice Admiral") then
              for _,xz in pairs(Enemies:GetChildren()) do
                if xz.Name == "Ice Admiral" and Attack.Alive(xz) then
              	  repeat task.wait() Attack.Kill(xz,_G.TravelDres) until _G.TravelDres == false or xz.Humanoid.Health <= 0
                  replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                end
              end
            else
              _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488))
            end
	      else
		    replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
	      end
        end
      end
    end)
  end
end)
Zou = Tabs.Quests:AddToggle({
Name = "Auto Quest Sea 3", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoZou = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoZou then
   	    if plr.Data.Level.Value >= 1500 then
          if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
            if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
              replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
              if replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                local v = GetConnectionEnemies("rip_indra")
                if v then
                  repeat wait() Attack.Kill(v,_G.AutoZou) until not _G.AutoZou or not v.Parent or v.Humanoid.Health <= 0
                  Check = 2
                  repeat wait()replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")until Check == 1                   
                else
                  replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Check") wait(.1)
                  replicated.Remotes.CommF_:InvokeServer("F_","ZQuestProgress","Begin")
                end
              elseif replicated.Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
                replicated.Remotes.CommF_:InvokeServer("F_","TravelZou")
              else
                local v = GetConnectionEnemies("Don Swan")
                if v then
                  repeat wait() Attack.Kill(v,_G.AutoZou)until not _G.AutoZou or not v.Parent or v.Humanoid.Health<=0                  
                else
                  repeat wait() _tp(CFrame.new(2288.802, 15.1870775, 863.034607)) until not _G.AutoZou or (Root.Position == CFrame.new(2288.802, 15.1870775, 863.034607).Position)
                  if (Root.CFrame == CFrame.new(2288.802, 15.1870775, 863.034607)) then notween(CFrame.new(2288.802, 15.1870775, 863.034607)) end
                end
              end
            else
            if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
              TabelDevilFruitStore = {}
              TabelDevilFruitOpen = {}
              for i,v in pairs(SafeGetInventoryFruits()) do
                for i1,v1 in pairs(v) do
                  if i1 == "Name" then table.insert(TabelDevilFruitStore,v1)end
                end
              end
              for i,v in next, SafeGetFruits() do
                if v.Price >= 1000000 then table.insert(TabelDevilFruitOpen,v.Name) end
              end
              for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
                for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do
                  if DevilFruitOpenDoor == DevilFruitStore and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                    if not plr.Backpack:FindFirstChild(DevilFruitStore) then
                      replicated.Remotes.CommF_:InvokeServer("F_","LoadFruit",DevilFruitStore)
                    else
                      replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")
                      replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")
                      replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")
                    end
                  end
                end
              end
                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","1")
                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","2")
                replicated.Remotes.CommF_:InvokeServer("F_","TalkTrevor","3")
              end
            end
          else
            if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
              if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then                
                local v = GetConnectionEnemies("Swan Pirate")
                if v then
                  pcall(function() repeat wait() Attack.Kill(v,_G.AutoZou) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false or plr.PlayerGui.Main.Quest.Visible == false end)                    
                else
                  _tp(CFrame.new(1057.92761, 137.614319, 1242.08069))
                end
              else
                _tp(CFrame.new(-456.28952, 73.0200958, 299.895966))
              end
            elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
              local v = GetConnectionEnemies("Jeremy")
              if v then
                repeat wait() Attack.Kill(v,_G.AutoZou) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false
              else
                _tp(CFrame.new(2099.88159, 448.931, 648.997375))
              end
            elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
              repeat wait() _tp(CFrame.new(-1836, 11, 1714)) until not _G.AutoZou or (Root.Position == CFrame.new(-1836, 11, 1714).Position)
              if (Root.CFrame == CFrame.new(-1836, 11, 1714)) then notween(CFrame.new(-1836, 11, 1714))end
              notween(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
              wait(.1)
              notween(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
              wait(.1)
              notween(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
              wait(.1)
              notween(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
              wait(.1)
              notween(CFrame.new(-1869.54224, 15.987854, 1681.00659))
              wait(.1)
              notween(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
              wait(.1)
              notween(CFrame.new(-1819.26343, 14.795166, 1717.90625))
              wait(.1)
              notween(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
            end
          end
        end
      end
    end)
  end
end)




Tabs.Quests:AddSection("Tushita + Yama")

Q = Tabs.Quests:AddToggle({
Name = "Auto Tushita Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Tushita = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Tushita then
        if workspace.Map.Turtle:FindFirstChild("TushitaGate") then
          if not GetBP("Holy Torch") then
            _tp(CFrame.new(5148.03613, 162.352493, 910.548218))
            wait(0.7)
          else
            EquipWeapon("Holy Torch")
            task.wait(1)
            repeat task.wait() _tp(CFrame.new(-10752, 417, -9366)) until not _G.Auto_Tushita or (CFrame.new(-10752, 417, -9366).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
            wait(.7)
            repeat task.wait() _tp(CFrame.new(-11672, 334, -9474)) until not _G.Auto_Tushita or (CFrame.new(-11672, 334, -9474).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
            wait(.7)
            repeat task.wait() _tp(CFrame.new(-12132, 521, -10655)) until not _G.Auto_Tushita or (CFrame.new(-12132, 521, -10655).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
            wait(.7)
            repeat task.wait() _tp(CFrame.new(-13336, 486, -6985)) until not _G.Auto_Tushita or (CFrame.new(-13336, 486, -6985).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
            wait(.7)
            repeat task.wait() _tp(CFrame.new(-13489, 332, -7925)) until not _G.Auto_Tushita or (CFrame.new(-13489, 332, -7925).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
          end
        else
          local v = GetConnectionEnemies("Longma")
          if v then repeat task.wait() Attack.Kill(v,_G.Auto_Tushita) until v.Humanoid.Health <= 0 or not _G.Auto_Tushita or not v.Parent
          else 
          if replicated:FindFirstChild("Longma") then _tp(replicated:FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(0,40,0)) end
          end                     
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Yama Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Yama = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Yama then
	    if replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then
	      _G.FarmEliteHunt = true
	    elseif replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") > 30 then
	      _G.FarmEliteHunt = false
	      if (workspace.Map.Waterfall.SealedKatana.Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 20 then
            _tp(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
            local zx = GetConnectionEnemies("Ghost")
            if zx then
              repeat wait() Attack.Kill(zx,_G.Auto_Yama) until zx.Humanoid.Health <= 0 or not zx.Parent or not _G.Auto_Yama               
			  fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
            end
          end
	    end
      end
    end)
  end
end)

Tabs.Quests:AddSection("Skull Guitars / Misc")
local CheckSoul = Tabs.Quests:AddParagraph("Skull Guitar Quests", "")
spawn(function()
    while wait(0.2) do
        pcall(function()
            if Quest1 == true then 
                CheckSoul:SetDesc("Quest Number : Quest1")
            elseif Quest2 == true then 
                CheckSoul:SetDesc("Quest Number : Quest2")
            elseif Quest3 == true then 
                CheckSoul:SetDesc("Quest Number : Quest3")
            elseif Quest4 == true then 
                CheckSoul:SetDesc("Quest Number : Quest4")
            elseif GetWP("Skull Guitar") then 
                CheckSoul:SetDesc("Quest Number : Collect!!")
            else 
                CheckSoul:SetDesc("Quest Number : No Quest!!")
            end
        end)
    end
end)
Tabs.Quests:AddToggle({
Name = "Auto Skull Guitar", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Soul_Guitar = Value
end})
task.spawn(function()
  while wait() do
    if _G.Auto_Soul_Guitar then 
      pcall(function() 
        local v = GetConnectionEnemies("Living Zombie")
        if v then 
          v.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
          v.Head.CanCollide = false
          v.Humanoid.Sit = false
          v.HumanoidRootPart.CanCollide = false
          v.Humanoid.JumpPower = 0
          v.Humanoid.WalkSpeed = 0
          if v.Humanoid:FindFirstChild('Animator') then v.Humanoid:FindFirstChild('Animator'):Destroy() end
        end    
      end)
    end
  end
end)
function getT(num)
    local rotation
    if num == 1 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation
    elseif num == 3 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation
    elseif num == 4 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation
    elseif num == 7 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation
    elseif num == 10 then
        rotation = workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation
    end
    if rotation then
        return rotation.Z
    end
end
function getRT(num)
    local Trophy_Q = workspace.Map["Haunted Castle"].Trophies.Quest
    local Trophy_Pos
    for _, v in pairs(Trophy_Q:GetChildren()) do
        if num == 1 and v.Name == "Trophy1" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation
        elseif num == 2 and v.Name == "Trophy2" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation         
        elseif num == 3 and v.Name == "Trophy3" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation       
        elseif num == 4 and v.Name == "Trophy4" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation  
        elseif num == 5 and v.Name == "Trophy5" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation     
        end          
        if Trophy_Pos then
            return Trophy_Pos.Z   
        end
    end
end
GetFirePlacard = function(Number,Side)
  if tostring(workspace.Map["Haunted Castle"]["Placard"..Number][Side].Indicator.BrickColor) ~= "Pearl" then
    fireclickdetector(workspace.Map["Haunted Castle"]["Placard"..Number][Side].ClickDetector)
  end
end
spawn(function()
  repeat task.wait() until _G.Auto_Soul_Guitar
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Soul_Guitar then
        if World3 then
          replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
          replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
          if replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check") == nil then
            _tp(CFrame.new(-8655.0166015625, 141.3166961669922, 6160.0224609375))
            replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
            replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Swamp == false then
             Quest1 = true;
             Quest2 = false;
             Quest3 = false;
             Quest4 = false;
             local v = GetConnectionEnemies("Living Zombie")
             if v then repeat task.wait() Attack.Kill(v,_G.Auto_Soul_Guitar) until not _G.Auto_Soul_Guitar or v.Humanoid.Health <= 0 or not v.Parent or workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)
             else _tp(CFrame.new(-10170.7275390625, 138.6524658203125, 5934.26513671875))
             end
           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Gravestones == false then
             Quest1 = false;
             Quest2 = true;
             Quest3 = false;
             Quest4 = false;
             GetFirePlacard("7","Left")
             GetFirePlacard("6","Left")
             GetFirePlacard("5","Left")
             GetFirePlacard("4","Right")
             GetFirePlacard("3","Left")
             GetFirePlacard("2","Right")
             GetFirePlacard("1","Right")
           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Ghost == false then
             replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
             replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
           elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == false then
             Quest1 = false;
             Quest2 = false;
             Quest3 = true;
             Quest4 = false;             
             _tp(CFrame.new(-9532.8232421875, 6.471667766571045, 6078.068359375))
             repeat wait()
               local z1 = getRT(1)
               local _z1 = getT(1)
               if z1 and _z1 then
                 fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
               end
             until z1 == _z1
            repeat wait()
              local z2 = getRT(2)
              local _z2 = getT(3)
              if z2 and _z2 then
                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
              end
            until z2 == _z2
          repeat wait()
            local z3 = getRT(3)
            local _z3 = getT(4)
            if z3 and _z3 then
              fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
            end
          until z3 == _z3
          repeat wait()
            local z4 = getRT(4)
            local _z4 = getT(7)
            if z4 and _z4 then
              fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
            end
          until z4 == _z4
        repeat wait()
          local z5 = getRT(5)
          local _z5 = getT(10)
          if z5 and _z5 then
            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))    
          end
        until z5 == _z5
        repeat wait()    
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
          fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))       
        until workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0
          elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Pipes == false then
            Quest1 = false;
            Quest2 = false;
            Quest3 = false;
            Quest4 = true;
           _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
		   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
		   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
		   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
	   	   _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
		   fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
	       fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
	       fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
          end
        end
      end
    end)
  end
end)
Tabs.Quests:AddToggle({
Name = "Auto Farm Material Skull Guitar", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoMatSoul = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoMatSoul and GetWP("Skull Guitar") == false then
	    if GetM("Bones") >= 500 and GetM("Ectoplasm") >= 250 and GetM("Dark Fragment") >= 1 then
	      replicated.Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
		else
		  if GetM("Ectoplasm") <= 250 then
		    if _G.AutoMatSoul and World2 then
		      local EctoTable = {"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior"}    
		      local xz = GetConnectionEnemies(EctoTable)
              if xz then repeat task.wait() Attack.Kill(xz, _G.AutoMatSoul)until not _G.AutoMatSoul or not xz.Parent or xz.Humanoid.Health <= 0
			  else replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			  end
		    else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
		    end
		  elseif GetM("Dark Fragment") < 1 then
		    if _G.AutoMatSoul and World2 then
		      local black = GetConnectionEnemies("Darkbeard")
		      if black then repeat task.wait()Attack.Kill(black, _G.AutoMatSoul)until _G.AutoMatSoul or black.Humanoid.Health <= 0
		      else _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
		      end
		    else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
			end
		     if not GetConnectionEnemies("Darkbeard") then Hop() end
	         elseif GetM("Bones") <= 500 then
		       if _G.AutoMatSoul and World3 then
			     local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
			     local zx = GetConnectionEnemies(BonesTable)			   
	             if zx then repeat task.wait()Attack.Kill(zx, _G.AutoMatSoul)until not _G.AutoMatSoul or zx.Humanoid.Health <= 0 or not zx.Parent or zx.Humanoid.Health <= 0
				 else _tp(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
			   end
		     else
		       replicated.Remotes.CommF_:InvokeServer("TravelZou")
		     end
		   end
	     end
	   end
    end)
  end
end)

Tabs.Quests:AddSection("Cursed Dual Katana")
local CheckCDK = Tabs.Quests:AddParagraph("Number Cursed dual katana quests", "Quest Numbers :")
spawn(function()  
    while wait(0.2) do 
        if QuestYama_1 == true then 
            CheckCDK:SetDesc("Quest Numbers : yama quest 1") 
        elseif QuestYama_2 == true then
            CheckCDK:SetDesc("Quest Numbers : yama quest 2") 
        elseif QuestYama_3 == true then
            CheckCDK:SetDesc("Quest Numbers : yama quest 3") 
        elseif QuestTushita_1 == true then
            CheckCDK:SetDesc("Quest Numbers : tushita quest 1") 
        elseif QuestTushita_2 == true then
            CheckCDK:SetDesc("Quest Numbers : tushita quest 2") 
        elseif GetWP("Cursed Dual Katana") then
            CheckCDK:SetDesc("Quest Numbers : CDK done!!")
        end 
    end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Get CDK [ Last Quest ]", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.CDK = Value
end})
spawn(function()    
  while wait(Sec) do
    pcall(function()
      if _G.CDK then
        replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
        replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
        replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Boss")
        local v = GetConnectionEnemies("Cursed Skeleton Boss")
        if v then
          repeat wait()
            if plr.Character:FindFirstChild("Yama") or plr.Backpack:FindFirstChild("Yama") then EquipWeapon("Yama")
            elseif plr.Character:FindFirstChild("Tushita") or plr.Backpack:FindFirstChild("Tushita") then EquipWeapon("Tushita")                                    
            end _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
          until not _G.CDK or not v.Parent or v.Humanoid.Health <= 0                                
        else
          _tp(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375)) wait(.5)
          _tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Yama CDK", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.CDK_YM = Value
end})
spawn(function()
  while wait() do
    pcall(function()
      if _G.CDK_YM then
        if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then                  
          replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
          replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        else
          if replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
            replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
            replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
          elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then                        
            if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -3 then
              QuestYama_1 = true QuestYama_2 = false QuestYama_3 = false
              repeat task.wait()
                if not workspace.Enemies:FindFirstChild("Forest Pirate") then
                  _tp(CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375))
                else
                  local v = GetConnectionEnemies("Forest Pirate")
                  if v then _tp(workspace.Enemies:FindFirstChild("Forest Pirate").HumanoidRootPart.CFrame)end
                end
              until tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 1 or not _G.CDK_YM
            elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -4 then
              QuestYama_1 = false QuestYama_2 = true QuestYama_3 = false
              for ix,HitMon in pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren()) do
                for NameMonHaze, CFramePos in pairs(PosMsList) do
                  if string.find(NameMonHaze,HitMon.Name) and HitMon.Value > 0 then
                    if (CFramePos.Position - Root.Position).Magnitude <= 1000 and workspace.Enemies:FindFirstChild(NameMonHaze) then
                      for i,v in pairs(workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HazeESP") then
                          repeat wait() Attack.Kill(v, _G.CDK_YM) until not _G.CDK_YM or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 2 or not v:FindFirstChild("HazeESP") or v.Humanoid.Health <= 0
                        end
                      end
                    else   
                      _tp(CFramePos)                               
                    end
                  end
                end
              end
            elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then
              QuestYama_1 = false QuestYama_2 = false QuestYama_3 = true
              if workspace.Map:FindFirstChild("HellDimension") then
                if (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000 then
                  for gg,ez in pairs(workspace.Map.HellDimension.Exit:GetChildren()) do
                    if tonumber(gg) == 2 then
                      repeat task.wait() Root.CFrame = workspace.Map.HellDimension.Exit.CFrame until not _G.CDK_YM or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                    end
                  end
                  EquipWeapon(_G.SelectWeapon)
                  if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) ~= 3 then
                  repeat task.wait()
                    repeat task.wait() 
                      _tp(workspace.Map.HellDimension.Torch1.Particles.CFrame) 
                      for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                      end
                    until (workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5
                    wait(2) _G.T1Yama = true
                  until not _G.CDK_YM or _G.T1Yama or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                  repeat task.wait()
                    repeat task.wait()
                      _tp(workspace.Map.HellDimension.Torch2.Particles.CFrame) 
                      for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then fireproximityprompt(v)end
                      end
                    until (workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5
                    wait(2) _G.T2Yama = true
                  until _G.T2Yama or _G.CDK_YM == false or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                    repeat wait()
                      repeat task.wait() 
                        _tp(workspace.Map.HellDimension.Torch3.Particles.CFrame) 
                        for i, v in pairs(workspace.Map.HellDimension:GetDescendants()) do
                          if v:IsA("ProximityPrompt") then fireproximityprompt(v)end
                        end
                      until (workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5 
                      wait(2) _G.T3Yama = true
                    until _G.T3Yama or _G.CDK_YM == false or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                  end
                  for i,v in pairs(workspace.Enemies:GetChildren()) do
                    if (v:FindFirstChild("HumanoidRootPart").Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300 then
                      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                        repeat task.wait() Attack.Kill(v,_G.CDK_YM) until not _G.CDK_YM or v.Humanoid.Health <= 0 or not v.Parent or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end)
  end
end)
spawn(function()
  while wait() do
    pcall(function()
      if _G.CDK_YM then
        if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then
          if not workspace.Map:FindFirstChild("HellDimension") or (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000 then
            local v = GetConnectionEnemies("Soul Reaper")
            if v then repeat task.wait()_tp(v.HumanoidRootPart.CFrame) until v.Humanoid.Health <= 0 or not _G.CDK_YM or not v.Parent or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Evil"]) == 3 or (workspace.Map:FindFirstChild("HellDimension") and (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000)
            elseif plr.Backpack:FindFirstChild("Hallow Essence") or plr.Character:FindFirstChild("Hallow Essence") then
            repeat _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) task.wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - Root.Position).Magnitude <= 8
            EquipWeapon("Hallow Essence")
            elseif replicated:FindFirstChild("Soul Reaper") and replicated:FindFirstChild("Soul Reaper").Humanoid.Health > 0 then
              _tp(replicated:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)
            else
              if replicated.Remotes.CommF_:InvokeServer("Bones","Check") < 50 and not workspace.Enemies:FindFirstChild("Soul Reaper") and not replicated:FindFirstChild("Soul Reaper") and not workspace.Map:FindFirstChild("HellDimension") then
                if workspace.Enemies:FindFirstChild("Reborn Skeleton") or workspace.Enemies:FindFirstChild("Living Zombie") or workspace.Enemies:FindFirstChild("Domenic Soul") or workspace.Enemies:FindFirstChild("Posessed Mummy") then
                  for i,v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                        repeat task.wait() Attack.Kill(v,_G.CDK_YM)until not _G.CDK_YM or v.Humanoid.Health <= 0 or not v.Parent
                      end
                    end
                  end
                else
                  _tp(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))
                end
              else
                replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
              end
            end
          end
        end
      end
    end)
  end
end)

Q = Tabs.Quests:AddToggle({
Name = "Auto Tushita CDK", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.CDK_TS = Value
end})
spawn(function()
  while wait() do
    pcall(function()
      if _G.CDK_TS then
        if tostring(replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then
          wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
          wait(.3) replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        else
          if replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
            replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
          elseif replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Finished"] == false then
            if tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -3 then
              QuestTushita_1 = true
              QuestTushita_2 = false
              QuestTushita_3 = false
              repeat wait() _tp(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875)) until (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1
              if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
                wait(.5) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
              end
                wait(1) repeat wait() _tp(CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125)) until (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1
                if (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
                wait(.5) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                end
                  wait(1) repeat wait() _tp(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625)) until (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 1
                  if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                    wait(.7) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
                    wait(.5) replicated.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                  end
                  wait(1)
                  elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -4 then
                    QuestTushita_1 = false
                    QuestTushita_2 = true
                    QuestTushita_3 = false
                    repeat wait()
                      _G.AutoRaidCastle = true
                    until not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 2 
                      _G.AutoRaidCastle = false         
                  elseif tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == -5 then
                    QuestTushita_1 = false
                    QuestTushita_2 = false
                    QuestTushita_3 = true
                    if workspace.Enemies:FindFirstChild("Cake Queen") then
                      for i,v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name == "Cake Queen" then
                          if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat wait()
                              Attack.Kill(v, _G.CDK_TS)
                            until not _G.CDK_TS or not v.Parent or v.Humanoid.Health <= 0 or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3
                          end
                        end
                      end
                     elseif replicated:FindFirstChild("Cake Queen") and replicated:FindFirstChild("Cake Queen").Humanoid.Health > 0 then
                       _tp(replicated:FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                     else
                   if workspace.Map:FindFirstChild("HeavenlyDimension") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000 then
                     for i,v in pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren()) do
                       Ex = i
                     end
                     if Ex == 2 then
                       repeat wait()
                         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.HeavenlyDimension.Exit.CFrame
                       until not _G.CDK_TS or tonumber(replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress")["Good"]) == 3
                    end
                   repeat wait()
                     repeat wait() 
                       _tp(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625)) 
                       for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
                         if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                       end
                     until (CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                     wait(2)
                    _G.DoneT1 = true
                  until not _G.CDK_TS or _G.DoneT1
                  repeat wait()
                    repeat wait()
                      _tp(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875)) 
                       for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
                         if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                       end
                    until (CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2) _G.DoneT2 = true
                  until _G.DoneT2 or _G.CDK_TS == false
                  repeat wait()
                    repeat task.wait() 
                      _tp(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375)) 
                      for i, v in pairs(workspace.Map.HeavenlyDimension:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                      end
                    until (CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2) _G.DoneT3 = true
                  until _G.DoneT3 or _G.CDK_TS == false
                  for i,v in pairs(workspace.Enemies:GetChildren()) do
                    if (v:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-08, 0.99301964, -8.73070718e-08, 1, -2.30819008e-08, -0.99301964, -8.3975138e-08, 0.11794927).Position).Magnitude <= 300 then
                      if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                        repeat wait()
                          Attack.Kill(v, _G.CDK_TS)
                        until not _G.CDK_TS or v.Humanoid.Health <= 0 or not v.Parent                      
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end)
  end
end)
Tabs.Quests:AddSection("True Triple Katana Sword")
Tabs.Quests:AddButton({
Name = "Buy Legendary Sword",
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
  replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
  replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer","3")
end})
Tabs.Quests:AddButton({
Name = "Buy True Triple Katana Sword", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("MysteriousMan","2")
end})
Q = Tabs.Quests:AddToggle({
Name = "Tween to Legendary Sword Dealer", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Tp_LgS = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Tp_LgS then
	  pcall(function()
	    for _,v in pairs(replicated.NPCs:GetChildren()) do
	      if v.Name == "Legendary Sword Dealer " then _tp(v.HumanoidRootPart.CFrame) end
        end   	   
	  end)
    end
  end
end)

Tabs.Quests:AddSection("Pole / God Enal's")
Q = Tabs.Quests:AddToggle({
Name = "Auto Pole V1", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoPole = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoPole then
      pcall(function()
        local v = GetConnectionEnemies("Thunder God")
	    if v then
          repeat task.wait() Attack.Kill(v, _G.AutoPole) until not _G.AutoPole or not v.Parent or v.Humanoid.Health <= 0
        else
          _tp(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Pole V2 [Beta]", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoPoleV2 = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoPoleV2 then        
	   if not GetBP("Pole (1st Form)") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Pole (1st Form)") end
	   if not GetBP("Pole (2nd Form)") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Pole (2nd Form)") end      
	   if GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value <= 179 then _G.Level = true elseif GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value >= 180 then _G.Level = false end	   
	   if not GetBP("Rumble Fruit") then return end
	   if GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("Z") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("X") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("C") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("V") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("F") then
	     _G.SelectChip = nil
		 _G.Raiding = false
		 _G.Auto_Awakener = false
		if plr.Data.Fragments.Value >= 5000 then
          replicated.Remotes.CommF_:InvokeServer("Thunder God", "Talk") wait(Sec)
          replicated.Remotes.CommF_:InvokeServer("Thunder God", "Sure")
        end
        elseif replicated.Remotes.CommF_:InvokeServer("Awakener","Check") == nil or replicated.Remotes.CommF_:InvokeServer("Awakener","Check") == 0 then
          _G.SelectChip = "Rumble"
          local Buying = replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)
          if Buying then Buying:Stop() end
          _G.Raiding = true
          _G.Auto_Awakener = true
	    end	   
      end
    end)
  end
end)
Tabs.Quests:AddToggle({
Name = "Auto Saw Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoSaw = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.AutoSaw then
        local v = GetConnectionEnemies("The Saw")
        if v then repeat task.wait() Attack.Kill(v, _G.AutoSaw)until _G.AutoSaw == false or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))
        end
      end
    end)
  end
end)

Q = Tabs.Quests:AddToggle({
Name = "Auto Saber Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoSaber = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.AutoSaber and plr.Data.Level.Value >= 200 and not plr.Backpack:FindFirstChild("Saber") and not plr.Character:FindFirstChild("Saber") then
        if workspace.Map.Jungle.Final.Part.Transparency == 0 then
	      if workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
		    if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 then
		      _tp(plr.Character.HumanoidRootPart.CFrame)
		      wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
		      wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
		      wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
	    	  wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
		      wait(0.5)
		      plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
		      wait(0.5) 
		    else
		      _tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
		    end
	      else
		    if workspace.Map.Desert.Burn.Part.Transparency == 0 then
		      if plr.Backpack:FindFirstChild("Torch") or plr.Character:FindFirstChild("Torch") then
		        EquipWeapon("Torch")
		        firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,0)
			    firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,1)
		   	    _tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
		      else
		        _tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))                    end
		      else
		        if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
		          replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
			      wait(0.5)
			      EquipWeapon("Cup")
			      wait(0.5)
			      replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",plr.Character.Cup)
			      wait(Sec)
			      replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") 
		        else
		 	      if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
			        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
		          elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
			        if workspace.Enemies:FindFirstChild("Mob Leader") or replicated:FindFirstChild("Mob Leader") then
			          _tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
			         for i,v in pairs(workspace.Enemies:GetChildren()) do
				       if v.Name == "Mob Leader" and Attack.Alive(v) then
				       repeat task.wait() Attack.Kill(v, _G.AutoSaber)until v.Humanoid.Health <= 0 or _G.AutoSaber == false
				       end
				     end
			       end
			     elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
			       replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
				   EquipWeapon("Relic")
				  _tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
				 end
			   end
			 end
		   end
		 else
	     if workspace.Enemies:FindFirstChild("Saber Expert") or replicated:FindFirstChild("Saber Expert") then
	       for _,v in pairs(workspace.Enemies:GetChildren()) do
		     if v.Name == "Saber Expert" and Attack.Alive(v) then
			   repeat task.wait() Attack.Kill(v, _G.AutoSaber) until v.Humanoid.Health <= 0 or _G.AutoSaber == false
		       if v.Humanoid.Health <= 0 then replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic") end		      
		      end
		    end
		  else
		    _tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))
	      end
	    end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Cybrog", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoColShad = Value
end})
spawn(function()
  while wait(.2) do
    if _G.AutoColShad then
      pcall(function()
        local v = GetConnectionEnemies("Cyborg")
	    if v then repeat task.wait()Attack.Kill(v, _G.AutoColShad)until _G.AutoColShad == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Usoap's Hat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoGetUsoap = Value
end})
spawn(function()
  while task.wait(Sec) do
    pcall(function()
      if _G.AutoGetUsoap then
	   for _, v in pairs(workspace.Characters:GetChildren()) do
          if v.Name ~= plr.Name then
            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (Root.Position - v.HumanoidRootPart.Position).Magnitude <= 230 then
              repeat task.wait() EquipWeapon(_G.SelectWeapon) _tp(v.HumanoidRootPart.CFrame * CFrame.new(1, 1, 2)) until _G.AutoGetUsoap == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
            end
          end
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Bisento V2", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Greybeard = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Greybeard then
      pcall(function()
        if not GetWP("Bisento") then
          replicated.Remotes.CommF_:InvokeServer("BuyItem","Bisento")
        elseif GetWP("Bisento") then
          replicated.Remotes.CommF_:InvokeServer("LoadItem","Bisento")
          local v = GetConnectionEnemies("Greybeard")
          if v then repeat wait() Attack.Kill(v,_G.Greybeard)until _G.Greybeard == false or not v.Parent or v.Humanoid.Health <= 0
          else _tp(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
          end
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Warden Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.WardenBoss = Value
end})
spawn(function()
  while wait(.1) do
    if _G.WardenBoss then
      pcall(function()
        local v = GetConnectionEnemies("Chief Warden")
        if v then repeat wait() Attack.Kill(v,_G.WardenBoss) until _G.WardenBoss == false or not v.Parent or v.Humanoid.Health <= 0 
        else _tp(CFrame.new(5206.92578,0.997753382,814.976746,0.342041343,-0.00062915677,0.939684749,0.00191645394,0.999998152,-2.80422337e-05,-0.939682961,0.00181045406,0.342041939))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Marine Coat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.MarinesCoat = Value
end})
spawn(function()
  while wait(.1) do
    if _G.MarinesCoat then
      pcall(function()
        local v = GetConnectionEnemies("Vice Admiral")
        if v then repeat wait() Attack.Kill(v, _G.MarinesCoat) until _G.MarinesCoat == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Swan Coat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.SwanCoat = Value
end})
spawn(function()
  while wait(.1) do
    if _G.SwanCoat then
      pcall(function()
        local v = GetConnectionEnemies("Swan")
        if v then repeat wait()Attack.Kill(v, _G.SwanCoat)until _G.SwanCoat == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))
        end
      end)
    end
  end
end)

Tabs.Quests:AddSection("Rengoku Sword")
Q = Tabs.Quests:AddToggle({
Name = "Auto Rengoku Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.IceBossRen = Value
end})
spawn(function()
  pcall(function()
    while wait(.1) do
      if _G.IceBossRen then
        local v = GetConnectionEnemies("Awakened Ice Admiral")
        if v then repeat task.wait()Attack.Kill(v,_G.IceBossRen)until _G.IceBossRen == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
        end
      end
    end
  end)
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Key Rengoku", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.KeysRen = Value
end})
spawn(function()
  while wait(.1) do
    pcall(function()
      if _G.KeysRen then
        if plr.Backpack:FindFirstChild(RenMon[3]) or plr.Character:FindFirstChild(RenMon[3]) then
          EquipWeapon(RenMon[3]) wait(.1)
          _tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
        else
          local v = GetConnectionEnemies(RenMon)
          if v then repeat task.wait() Attack.Kill(v,_G.KeysRen)until plr.Backpack:FindFirstChild(RenMon[3]) or _G.KeysRen == false or not v.Parent or v.Humanoid.Health <= 0
          else _tp(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
          end
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Dragon Trident", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoTridentW2 = Value
end})
spawn(function()
  while wait(.1) do
    pcall(function()
      if _G.AutoTridentW2 then
        local v = GetConnectionEnemies("Tide Keeper")
        if v then repeat task.wait() Attack.Kill(v,_G.AutoTridentW2)until _G.AutoTridentW2 == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188))
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Long Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.LongsWord = Value
end})
spawn(function()
  while wait(.1) do
    pcall(function()
      if _G.LongsWord then
        local v = GetConnectionEnemies("Diamond")
        if v then repeat task.wait() Attack.Kill(v,_G.LongsWord)until _G.LongsWord == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Black Spikey", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.BlackSpikey = Value
end})
spawn(function()
  while wait(.1) do
    if _G.BlackSpikey then
      pcall(function()
        local v = GetConnectionEnemies("Jeremy")
        if v then repeat wait() Attack.Kill(v, _G.BlackSpikey)until _G.BlackSpikey == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Dark Blade V3", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DarkBladev3 = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.DarkBladev3 and World2 then
      if not GetBP("Dark Blade") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Dark Blade") end
        if GetBP("Fist of Darkness") > 1 then
          if not workspace.Enemies:FindFirstChild("Darkbeard") then
            _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
          elseif GetConnectionEnemies("Darkbeard") and GetBP("Fist of Darkness") >= 1 then
            repeat wait() _tp(CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375)) until not _G.DarkBladev3 or (Root.Position == CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375).Position)
            fireclickdetector(workspace.Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)
          end         
        else
          _G.AutoFarmChest = true;
        end        
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Midnight Blade", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoEcBoss = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AutoEcBoss then
	    if GetM("Ectoplasm") >= 99 then
	      replicated.Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 3)	   
	    elseif GetM("Ectoplasm") <= 99 then
	      local v = GetConnectionEnemies("Cursed Captain")
	      if v then repeat wait()Attack.Kill(v, _G.AutoEcBoss) until not _G.AutoEcBoss or not v.Parent or v.Humanoid.Health <= 0
	      else
	        replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)) wait(.5)
	        _tp(CFrame.new(916.928589, 181.092773, 33422))
	      end
	    end	
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Darkbeard", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Def_DarkCoat = Value
end})
spawn(function()
  while wait(.1) do
    if _G.Auto_Def_DarkCoat then
      pcall(function()
        if GetBP("Fist of Darkness") and not workspace.Enemies:FindFirstChild("Darkbeard") then          
          _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
        elseif GetConnectionEnemies("Darkbeard") then
          local v = GetConnectionEnemies("Darkbeard")          
		  if v then repeat wait()Attack.Kill(v,_G.Auto_Def_DarkCoat)until _G.Auto_Def_DarkCoat == false or not v.Parent or v.Humanoid.Health <= 0 end
        elseif not GetBP("Fist of Darkness") and not GetConnectionEnemies("Darkbeard") then
          repeat wait(.1) _G.AutoFarmChest = true until not _G.Auto_Def_DarkCoat or GetBP("Fist of Darkness") or GetConnectionEnemies("Darkbeard") _G.AutoFarmChest = false
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Unlocked DonSwan", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_DonAcces = Value
end})
spawn(function()
  while wait(.1) do
    if _G.Auto_DonAcces then
      pcall(function()
        if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil and plr.Data.Level.Value >= 1500 then
          FruitPrice = {}
	      FruitStore = {}
		  for i,v in next,replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
		    if v.Price >= 1000000 then  
		     table.insert(FruitPrice,v.Name)
		    end
		  end
		  for i,v in pairs(SafeGetInventoryFruits()) do
		    for _,x in pairs(v) do
		      if _ == "Name" then 
		        table.insert(FruitStore,x)
		      end
	        end
	          replicated.Remotes.CommF_:InvokeServer("Cousin","Buy")
	          for _,y in pairs(FruitPrice) do
		        for _,z in pairs(FruitStore) do
		          if y == z and replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
		            _G.StoreF = false
			      if not plr.Backpack:FindFirstChild(FruitStore) then
			        replicated.Remotes.CommF_:InvokeServer("LoadFruit",tostring(y))
			      else
			        replicated.Remotes.CommF_:InvokeServer("TalkTrevor","1")
			        replicated.Remotes.CommF_:InvokeServer("TalkTrevor","2")
			        replicated.Remotes.CommF_:InvokeServer("TalkTrevor","3")
			      end
			    end
		      end 
		    end
		    if replicated.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
		      _G.StoreF = true
		      _G.Auto_DonAcces = false
		    end
	      end
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Swan Glasses", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_SwanGG = Value
end})
spawn(function()
  while wait(.2) do
    if _G.Auto_SwanGG then
      pcall(function()
        local v = GetConnectionEnemies("Don Swan")
        if v then repeat wait() Attack.Kill(v,_G.Auto_SwanGG)until _G.Auto_SwanGG == false or not v.Parent or v.Humanoid.Health <= 0
	    else _tp(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
        end
      end)
    end
  end
end)

Tabs.Quests:AddSection("Cavender + Twin Hooks + Bigmom")
Q = Tabs.Quests:AddToggle({
Name = "Auto Bigmom", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoBigmom = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoBigmom then
      pcall(function()
        local bx = GetConnectionEnemies("Cake Queen")
        if bx then repeat task.wait() Attack.Kill(bx, _G.AutoBigmom) until not _G.AutoBigmom or not bx.Parent or bx.Humanoid.Health <= 0
        else _tp(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
        end
      end)
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Canvendish Sword", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Cavender = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Cavender then
        local v = GetConnectionEnemies("Beautiful Pirate")
	    if v then repeat wait() Attack.Kill(v,_G.Auto_Cavender)until not _G.Auto_Cavender or v.Humanoid.Health <= 0
	    else _tp(CFrame.new(5283.609375,22.56223487854,-110.78285217285))
	    end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Twin Hooks", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TwinHook = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.TwinHook then
        local v = GetConnectionEnemies("Captain Elephant")
	    if v then repeat wait()Attack.Kill(v,_G.TwinHook)until not _G.TwinHook or v.Humanoid.Health <= 0
	    else
          replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)) wait(.2)
          _tp(CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125))
	    end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Serpent Bow", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoSerpentBow = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoSerpentBow then
      local v = GetConnectionEnemies("Hydra Leader")
      if v then	repeat wait() Attack.Kill(v,_G.AutoSerpentBow)until not _G.AutoSerpentBow or not v.Parent or v.Humanoid.Health <= 0
	  else _tp(CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547))
      end
    end
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Lei Accessory", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoKilo = Value
end})
spawn(function()
  while wait(.2) do
    if _G.AutoKilo then
      pcall(function()
        local v = GetConnectionEnemies("Kilo Admiral")
        if v then repeat task.wait()Attack.Kill(v,_G.AutoKilo)until not _G.AutoKilo or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125))
        end
      end)
    end
  end
end)

Tabs.Quests:AddSection("Buso/Aura Colours")
Q = Tabs.Quests:AddToggle({
Name = "Auto Teleport Barista Cousin", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Tp_MasterA = Value
end})
spawn(function()
  while wait() do
    if _G.Tp_MasterA then
	  pcall(function()
	    for _,v in pairs(replicated.NPCs:GetChildren()) do
	    if v.Name == "Barista Cousin" then _tp(v.HumanoidRootPart.CFrame) end
        end   	   
	 end)
    end
  end
end)
Tabs.Quests:AddButton({
Name = "Buy Buso Colors", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("ColorsDealer","2")
end})
Q = Tabs.Quests:AddToggle({
Name = "Auto Rainbow Colors", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Rainbow_Haki = Value
end})
spawn(function()
  pcall(function()
    while wait(Sec) do
      if _G.Auto_Rainbow_Haki then
        if plr.PlayerGui.Main.Quest.Visible == false then
          if _G.GetQFast then
            if plr.PlayerGui.Main.Quest.Visible == false then replicated.Remotes.CommF_:InvokeServer("HornedMan","Bet") end     
          else
            Rainbow1 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
            if (plr.Character.HumanoidRootPart.CFrame ~= Rainbow1) then
              _tp(Rainbow1)
            elseif (plr.Character.HumanoidRootPart.CFrame == Rainbow1) then
              wait(1)
              replicated.Remotes.CommF_:InvokeServer("HornedMan","Bet")
            end
          end
          elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
            local v = GetConnectionEnemies("Stone")
            if v then
              repeat wait() Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
            else
              _tp(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
            end
          elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
            local v = GetConnectionEnemies("Hydra Leader")
            if v then
              repeat task.wait()Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
            else
              replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
              local framelong1 = Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625)
              local framelong2 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
              if (plr.Character.HumanoidRootPart.CFrame.Position == framelong1) then _tp(framelong2)end
            end
          elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
            local v = GetConnectionEnemies("Kilo Admiral")
            if v then
              repeat task.wait()Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
            else
              _tp(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
            end
            elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
              local v = GetConnectionEnemies("Captain Elephant")
              if v then
                repeat task.wait() Attack.Kill(v,_G.Auto_Rainbow_Haki)until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
              else
              local gamergayror1 = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)
              local gamergayror2 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
              if (plr.Character.HumanoidRootPart.CFrame.Position ~= gamergayror1) then
                replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
              elseif (plr.Character.HumanoidRootPart.CFrame.Position == gamergayror1) then
                _tp(gamergayror2)
              end
            end
        elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
          local v = GetConnectionEnemies("Captain Elephant")
          if v then
            repeat task.wait() Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
          else
            replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
          end
        end                  
      end
    end    
  end)
end)
Q = Tabs.Quests:AddToggle({
Name = "Accept Rainbow Quest Faster", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.GetQFast = Value
end})

Tabs.Quests:AddSection("Instinct / Observation")
Q = Tabs.Quests:AddToggle({
Name = "Auto Farm Observation", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.obsFarm = Value
end})
spawn(function()
  while wait(.2) do
    pcall(function()
      if _G.obsFarm then        
        replicated.Remotes.CommE:FireServer("Ken",true)
        if plr:GetAttribute("KenDodgesLeft") == 0 then
          KenTest = false
        elseif plr:GetAttribute("KenDodgesLeft") > 0 then
          replicated.Remotes.CommE:FireServer("Ken",true)
          KenTest = true
        end        
      end
    end)
  end
end)    
spawn(function()      
  while wait(.2) do
    pcall(function()
      if _G.obsFarm then
        if World1 then
          if workspace.Enemies:FindFirstChild("Galley Captain") then
            if KenTest then
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
              until _G.obsFarm == false or KenTest == false
            else
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
              until _G.obsFarm == false or KenTest
            end
          else
            _tp(CFrame.new(5533.29785, 88.1079102, 4852.3916))
          end
        elseif World2 then
          if workspace.Enemies:FindFirstChild("Lava Pirate") then
            if KenTest then
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
              until _G.obsFarm == false or KenTest == false
            else
              repeat wait()
                plr.Character.HumanoidRootPart.CFrame = workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
              until _G.obsFarm == false or KenTest
            end
          else
            _tp(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
          end
        elseif World3 then
          if workspace.Enemies:FindFirstChild("Venomous Assailant") then
            if KenTest then
              repeat wait()
                _tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(3,0,0))
              until _G.obsFarm == false or KenTest == false
            else
              repeat wait()
                _tp(workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(0,50,0))
              until _G.obsFarm == false or KenTest
            end
          else
            _tp(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
          end
        end        
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Observation V2", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoKenVTWO = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoKenVTWO then
      pcall(function()
      local Kv2Pos1 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
      local Kv2Pos2 = "Kuy"
      local Kv2Pos3 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
      local Kv2Pos4 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
      local Kv2Pos5 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)
	  if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat 50 Forest Pirates") then
	    local v = GetConnectionEnemies("Forest Pirate")
        if v then
	      repeat wait() Attack.Kill(v,_G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
	    else
	      _tp(Kv2Pos4)
	    end
	  elseif plr.PlayerGui.Main.Quest.Visible == true then 
	    local v = GetConnectionEnemies("Captain Elephant")
	    if v then
          repeat wait() Attack.Kill(v,_G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
	    else
	      _tp(Kv2Pos5)
	    end
	  elseif plr.PlayerGui.Main.Quest.Visible == false then
	    replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") wait(.1)
	    replicated.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
	  end
	  if replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
	    _tp(CFrame.new(-12513.51953125, 340.1137390136719, -9873.048828125))
	  end
	  if not plr.Backpack:FindFirstChild("Fruit Bowl") or not plr.Character:FindFirstChild("Fruit Bowl") then
	  if not GetBP("Fruit Bowl") then   	    
	    if not GetBP("Apple") then
	      replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
	      for i,v in pairs(workspace:GetDescendants()) do
	        if v.Name == "Apple" then
	          v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
		      firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()		    
	        end
	      end
	    elseif not GetBP("Banana") then
	      _tp(CFrame.new(2286.0078125,73.13391876220703,-7159.80908203125))
	      for i,v in pairs(workspace:GetDescendants()) do
	        if v.Name == "Banana" then
	          v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
		      firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()		    
	        end
	      end	    
	    elseif not GetBP("Pineapple") then
	      _tp(CFrame.new(-712.8272705078125,98.5770492553711,5711.9541015625))
	      for i,v in pairs(workspace:GetDescendants()) do
	        if v.Name == "Pineapple" then
	          v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
		      firetouchinterest(plr.Character.HumanoidRootPart,v.Handle,0) wait()		    
	        end
	      end	    
	    end	  
	  end  	    	    
	    if plr.Backpack:FindFirstChild("Banana") and plr.Backpack:FindFirstChild("Apple") and plr.Backpack:FindFirstChild("Pineapple") or plr:FindFirstChild("Banana") and plr:FindFirstChild("Apple") and plr:FindFirstChild("Pineapple") then
	      repeat wait() _tp(Kv2Pos1) until _G.AutoKenVTWO or plr.Character.HumanoidRootPart.CFrame == Kv2Pos1
		  replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")	    			 
	    end
	      if plr.Backpack:FindFirstChild("Fruit Bowl") or plr.Character:FindFirstChild("Fruit Bowl") then
	        if plr.Character.HumanoidRootPart.CFrame ~= Kv2Pos3 then _tp(Kv2Pos3)
		    elseif plr.Character.HumanoidRootPart.CFrame == Kv2Pos3 then
		      replicated.Remotes.CommF_:InvokeServer("KenTalk2","Start") wait(.1)
		      replicated.Remotes.CommF_:InvokeServer("KenTalk2","Buy")
	        end			 		    
	      end
	    end
      end)
    end
  end
end)



Bartilo = Tabs.Quests:AddToggle({
Name = "Auto Done Bartilo Quest", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Bartilo_Quest = Value
end})
spawn(function()
  while wait(.1) do    
    pcall(function()
      if _G.Bartilo_Quest and Lv >= 850 then
      local Qbart = plr.PlayerGui.Main.Quest
        if replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
          _G.Level = false
          if Qbart.Visible == true then
            local v = GetConnectionEnemies("Swan Pirate")
            if v then
              local x = GetConnectionEnemies(BartMon)
              if x then
                repeat task.wait()
                  if not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate")then replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                  else Attack.Kill(x,_G.Bartilo_Quest)end
                until _G.Bartilo_Quest == false or not x.Parent or x.Humanoid.Health <= 0 or Qbart.Visible == false or not x:FindFirstChild("HumanoidRootPart")                  
              end
            else
              _tp(CFrame.new(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723, 1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468))
            end
          else
            repeat wait() 
              _tp(CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312))
            until (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 20 or _G.Bartilo_Quest == false
            if (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, -0, -0.998706102, 0, 1, -0, 0.998706102, 0, 0.050853312).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 then
              replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest",1)
            end
          end
          elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
            _G.Level = false
            local je = GetConnectionEnemies("Jeremy")
            if je then
              repeat task.wait() Attack.Kill(je,_G.Bartilo_Quest) until _G.Bartilo_Quest == false or not je.Parent or je.Humanoid.Health <= 0 or Qbart.Visible == false or not je:FindFirstChild("HumanoidRootPart")                  
            else
              _tp(CFrame.new(2158.97412, 449.056244, 705.411682, -0.754199564, -4.17389057e-09, -0.656645238, -4.47752875e-08, 1, 4.50709301e-08, 0.656645238, 6.3393955e-08, -0.754199564))
            end
          elseif replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
          repeat wait() _tp(CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456))until (CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-08, -0.199054286, 2.20792113e-08, 1, 7.1442483e-09, 0.199054286, -1.13962431e-08, 0.979988456).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 1 or _G.Bartilo_Quest == false
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate1.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate2.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate3.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate4.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate5.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate6.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate7.CFrame
          wait(0.5)
          plr.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate8.CFrame
          wait(2.5)
        end
      end
    end)
  end
end)
CitizenQ = Tabs.Quests:AddToggle({
Name = "Auto Done Citizen Quest", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.CitizenQuest = Value
end})
spawn(function()	
  while wait(Sec) do
    pcall(function()
      if _G.CitizenQuest then
        if Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
          if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
            local v = GetConnectionEnemies("Forest Pirate")
            if v then
              repeat task.wait() Attack.Kill(v,_G.CitizenQuest)until _G.CitizenQuest == false or not v.Parent or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
            else
              _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
            end
          else
            _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
            if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - plr.Character.HumanoidRootPart.Position).Magnitude <= 30 then
              wait(1.5) replicated.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)
            end
          end
        elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false then
          local v = GetConnectionEnemies("Captain Elephant")
          if plr.PlayerGui.Main.Quest.Visible and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and plr.PlayerGui.Main.Quest.Visible == true then
            if v then
              repeat task.wait() Attack.Kill(v,_G.CitizenQuest) until _G.CitizenQuest == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
            else
              _tp(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
            end
          else
            _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
            if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 4 then
              wait(1.5)
              replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen")
            end
          end
        elseif Lv >= 1800 and replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
          _tp(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
        end
      end
    end)
  end
end)
Q = Tabs.Quests:AddToggle({
Name = "Auto Training Dummy", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DummyMan = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.DummyMan then
      pcall(function()
        if plr.PlayerGui.Main.Quest.Visible == false then	
          local xxx = {[1] = "ArenaTrainer"}
	      replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(xxx))
        else
          local v = GetConnectionEnemies("Training Dummy")
          if v then
		    repeat wait() Attack.Kill(v,_G.DummyMan) until not _G.DummyMan or not v.Parent or v.Humanoid.Health <= 0
	      else
	        _tp(CFrame.new(3688.005126953125, 12.746943473815918, 170.20953369140625))
	      end
	    end
      end)
    end
  end
end)






Tabs.Quests:AddSection("Fighting Melee Styles")
SuperHuman = Tabs.Quests:AddToggle({
Name = "Auto Superhuman", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_SuperHuman = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_SuperHuman then
      local M_Beli = plr.Data.Beli.Value
	  local M_Frag = plr.Data.Fragments.Value
        if plr:FindFirstChild("WeaponAssetCache") then
          if not GetBP("Superhuman") then                    
            if not GetBP("Black Leg") then
            if (M_Beli >= 150000) then replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") end
            elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 299 then _G.Level = true elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 300 then _G.Level = false end                        
            if not GetBP("Electro") then
            if (M_Beli >= 500000) then replicated.Remotes.CommF_:InvokeServer("BuyElectro") end
            elseif GetBP("Electro") and GetBP("Electro").Level.Value < 299 then _G.Level = true elseif GetBP("Electro") and GetBP("Electro").Level.Value >= 300 then _G.Level = false end                        
            if not GetBP("Fishman Karate") then
            if (M_Beli >= 750000) then replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") end
            elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 299 then _G.Level = true elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 300 then _G.Level = false end                        
            if not GetBP("Dragon Claw") then
            if (M_Frag >= 1500) then replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") end
            elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 299 then _G.Level = true elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 300 then _G.Level = false end
            replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")          
          end
        end        
      end
    end)
  end
end)
DeathStep = Tabs.Quests:AddToggle({
Name = "Auto DeathStep", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoDeathStep = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoDeathStep then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then  
          if not GetBP("Death Step") then          
            if not GetBP("Black Leg") then replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") end
            if GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("BuyDeathStep") _G.Level = false elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 399 then _G.Level = true end
            if GetBP("Black Leg") or GetBP("Black Leg").Level.Value >= 400 then
            if workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then            
              if GetBP("Library Key") then repeat wait() _tp(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) until not _G.AutoDeathStep or (Root.Position == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position)
		        if (Root.CFrame == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) then replicated.Remotes.CommF_:InvokeServer("BuyDeathStep") end     
		        elseif not GetBP("Library Key") then
		          local v = GetConnectionEnemies("Awakened Ice Admiral")
		          if v then	repeat wait() Attack.Kill(v,_G.AutoDeathStep) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoDeathStep == false or GetBP("Library Key") or GetBP("Death Step")
	              else _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
	              end
		        end		    
              end
            end          
          end
        end
      end)
    end
  end
end)
SharkManV2 = Tabs.Quests:AddToggle({
Name = "Auto Sharkman Karate", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_SharkMan_Karate = Value
end})
spawn(function() 
  while wait(Sec) do
    if _G.Auto_SharkMan_Karate then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then  
          if not GetBP("Sharkman Karate") then          
            if not GetBP("Fishman Karate") then replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") end
            if GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate") _G.Level = false elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 399 then _G.Level = true end
            if GetBP("Fishman Karate") or GetBP("Fishman Karate").Level.Value >= 400 then           
              if GetBP("Water Key") then
		        if string.find(replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
			      if GetBP("Water Key") then
			        repeat wait() _tp(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)) until not _G.Auto_SharkMan_Karate or (Root.Position == CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position)
	                replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
		          end
		        end
		      elseif not GetBP("Water Key") then
		        local v = GetConnectionEnemies("Tide Keeper")
		        if v then repeat wait() Attack.Kill(v,_G.Auto_SharkMan_Karate)until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_SharkMan_Karate == false or GetBP("Water Key") or GetBP("Sharkman Karate")		
	            else _tp(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
	            end
		      end		                  
            end          
          end
        end
      end)
    end
  end
end)
ElectricClaw = Tabs.Quests:AddToggle({
Name = "Auto ElectricClaw", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Electric_Claw = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Auto_Electric_Claw then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then 
        if not GetBP("Electro") then replicated.Remotes.CommF_:InvokeServer("BuyElectro") end        
          if GetBP("Electro") and GetBP("Electro").Level.Value >= 400 then
            if replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then notween(CFrame.new(-12548, 337, -7481)) end
            replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
          elseif GetBP("Electro") and GetBP("Electro").Level.Value < 400 then
            repeat _G.AutoFarm_Bone = true wait() until not _G.Auto_Electric_Claw or GetBP("Electric Claw") _G.AutoFarm_Bone = false
          end
        end       
      end)
    end
  end
end)
DragonTalon = Tabs.Quests:AddToggle({
Name = "Auto DragonTalon", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoDragonTalon = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoDragonTalon then
      pcall(function()
        if plr:FindFirstChild("WeaponAssetCache") then 
        if not GetBP("Dragon Claw") then replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") end        
          if GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
          elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 400 then repeat _G.AutoFarm_Bone = true wait() until not _G.AutoDragonTalon or GetBP("Dragon Talon") _G.AutoFarm_Bone = false
          end         
        end
      end)
    end
  end
end)
Godhuman = Tabs.Quests:AddToggle({
Name = "Auto Godhuman", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_God_Human = Value
end})
spawn(function()
  while wait() do
    pcall(function()
      if _G.Auto_God_Human then
        if replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == "Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets." then
          if GetM("Dragon Scale") == false or GetM("Dragon Scale") < 10 then
            if World3 then
              Lv = 1575
              _G.Level = true
            else
              replicated.Remotes.CommF_:InvokeServer("TravelZou")
            end
          elseif GetM("Fish Tail") == false or GetM("Fish Tail") < 20 then
            if World3 then
              Lv = 1775
              _G.Level = true
            else
              replicated.Remotes.CommF_:InvokeServer("TravelZou")
            end
          elseif GetM("Mystic Droplet") == false or GetM("Mystic Droplet") < 10 then
            if World2 then
              Lv = 1425
              _G.Level = true
            else
              replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
          elseif GetM("Magma Ore") == false or GetM("Magma Ore") < 20 then
            if World2 then
              Lv = 1175
              _G.Level = true
            else
              replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end  
          end
        elseif replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == 3 then
          return nil
        else
          replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
        end
      end
    end)
  end
end)
SanguineArt = Tabs.Quests:AddToggle({
Name = "Auto SanguineArt", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Snaguine = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Snaguine then
      pcall(function()
        if not GetBP("Sanguine Art") then replicated.Remotes.CommF_:InvokeServer("Sanguine Art") end
        if not GetBP("Sanguine Art") then
          if GetM("Leviathan Heart") >= 1 then print("Completed!!")
          else
          if World3 then _G.DangerSc = "Lv Infinite" _G.SailBoats = true; else _G.SailBoats = false; end end
          if GetM("Vampire Fang") <= 19 then
            if World2 then
              local n = GetConnectionEnemies("Vampire")
              if n then repeat task.wait() Attack.Kill(n,_G.Snaguine) until not _G.Snaguine or n.Humanoid.Health <= 0 or not n.Parent
              else _tp(CFrame.new(-6041.29248046875, 6.402710914611816, -1304.63330078125))
              end
            else
              replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
          end                                      
          if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") <= 19 then
            if World3 then
              local n = GetConnectionEnemies("Demonic Soul")
		      if n then repeat task.wait() Attack.Kill(n,_G.Snaguine) until not _G.Snaguine or n.Humanoid.Health <= 0 or not n.Parent
              else _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
              end
             else
               replicated.Remotes.CommF_:InvokeServer("TravelZou")
             end
           end
           if GetM("Vampire Fang") >= 20 and GetM("Demonic Wisp") >= 20 and GetM("Dark Fragment") <= 1 then
             if World2 then
               local n = GetConnectionEnemies("Darkbeard")
		       if n then repeat task.wait() Attack.Kill(black,_G.Snaguine) until _G.Snaguine or black.Humanoid.Health <= 0 or not black.Parent
		      else _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
		      end
		    else replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
	        end
          end
        else replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
        end
      end)
    end
  end
end)



Tabs.Race:AddSection("Mystic Island / Full Moon")
local FullMOOn = Tabs.Race:AddParagraph("FullMoon Status", "")
local Ismirage = Tabs.Race:AddParagraph("Mirage Island Status", "")
spawn(function()
    while wait(0.2) do
        if workspace.Map:FindFirstChild("MysticIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
            Ismirage:SetDesc("Mirage Island : True")
        else
            Ismirage:SetDesc("Mirage Island : False")
        end
    end
end)
spawn(function()
    while wait(0.2) do
        pcall(function()
            local moon8 = "http://www.roblox.com/asset/?id=9709150401"
            local moon7 = "http://www.roblox.com/asset/?id=9709150086"
            local moon6 = "http://www.roblox.com/asset/?id=9709149680"
            local moon5 = "http://www.roblox.com/asset/?id=9709149431"
            local moon4 = "http://www.roblox.com/asset/?id=9709149052"
            local moon3 = "http://www.roblox.com/asset/?id=9709143733"
            local moon2 = "http://www.roblox.com/asset/?id=9709139597"
            local moon1 = "http://www.roblox.com/asset/?id=9709135895"
            local moon = Getmoon()
            
            if moon == moon1 then
                FullMOOn:SetDesc("Moon : 0 / 8")
            elseif moon == moon2 then
                FullMOOn:SetDesc("Moon : 1 / 8")
            elseif moon == moon3 then
                FullMOOn:SetDesc("Moon : 2 / 8")
            elseif moon == moon4 then
                FullMOOn:SetDesc("Moon : 3 / 8 [ Next Night ]")
            elseif moon == moon5 then
                FullMOOn:SetDesc("Moon : 4 / 8 [ Full Moon ]")
            elseif moon == moon6 then
                FullMOOn:SetDesc("Moon : 5 / 8 [ Last Night ]")
            elseif moon == moon7 then
                FullMOOn:SetDesc("Moon : 6 / 8")
            elseif moon == moon8 then
                FullMOOn:SetDesc("Moon : 7 / 8")
            end
        end)
    end
end)
Tabs.Race:AddToggle({
Name = "Auto Find Mirage Island", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FindMirage = Value
end})
spawn(function()
  while wait() do
    if _G.FindMirage then 
      pcall(function()
        if not workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island", true) then                
          local myBoat = CheckBoat()
          if not myBoat then
            local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
            TeleportToTarget(buyBoatCFrame)
            if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
          else
            if plr.Character.Humanoid.Sit == false then
              local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
              _tp(boatSeatCFrame)
            else            
              repeat wait()
                local targetDestination = CFrame.new(-10000000, 31, 37016.25)
                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                  _tp(CFrame.new(-10000000, 150, 37016.25))
                else
                  _tp(CFrame.new(-10000000, 31, 37016.25))
                end
              until not _G.FindMirage or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false
            end
          end
        else
          local _mi2 = workspace.Map:FindFirstChild("MysticIsland")
          if _mi2 and _mi2:FindFirstChild("Center") then
            _tp(_mi2.Center.CFrame*CFrame.new(0,300,0))
          end
        end
      end)
    end
  end
end)
local function UpdateIslandMirageESP()
    pcall(function()
        local locations = workspace:FindFirstChild("_WorldOrigin") and workspace._WorldOrigin:FindFirstChild("Locations")
        if not locations then return end
        for _, loc in ipairs(locations:GetChildren()) do
            if loc.Name == "Mirage Island" then
                if MirageIslandESP then
                    if not loc:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui")
                        bill.Name = "NameEsp"
                        bill.AlwaysOnTop = true
                        bill.Size = UDim2.new(0, 100, 0, 50)
                        bill.Adornee = loc
                        local lbl = Instance.new("TextLabel", bill)
                        lbl.Size = UDim2.new(1, 0, 1, 0)
                        lbl.BackgroundTransparency = 1
                        lbl.TextColor3 = Color3.fromRGB(0, 255, 255)
                        lbl.Text = "Mirage Island"
                        bill.Parent = loc
                    end
                else
                    if loc:FindFirstChild("NameEsp") then
                        loc.NameEsp:Destroy()
                    end
                end
            end
        end
    end)
end

Tabs.Race:AddToggle({
    Name = "Esp Mirage Island",
    Description = "",
    Value = false,
    Callback = function(Value)
        MirageIslandESP = Value
        if MirageIslandESP then
            task.spawn(function()
                while MirageIslandESP do
                    UpdateIslandMirageESP()
                    task.wait(1)
                end
            end)
        else
            UpdateIslandMirageESP()
        end
    end
})
Tabs.Race:AddToggle({
    Name = "Auto Tween To Mirage Island",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoMysticIsland = Value
    end
})

spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if _G.AutoMysticIsland then
                for _, location in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
                    if location.Name == "Mirage Island" then
                        topos(location.CFrame * CFrame.new(0, 333, 0))
                    end
                end
            end
        end)
    end
end)
Tabs.Race:AddToggle({
Name = "Auto Tween To Highest Point", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.HighestMirage = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.HighestMirage then 
      pcall(function()
      if workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island",true) then _tp(workspace.Map.MysticIsland.Center.CFrame*CFrame.new(0,400,0))end
      end)
    end
  end
end)
Tabs.Race:AddToggle({
Name = "Auto Collect Gear", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TPGEAR = Value
end})
spawn(function()
  pcall(function()
    while wait(0.1) do
      if _G.TPGEAR then
        local _miTp = workspace.Map:FindFirstChild('MysticIsland')
          for i,v in pairs(_miTp and _miTp:GetChildren() or {}) do
            if v.Name == "Part" then
              if v.ClassName == "MeshPart" then _tp(v.CFrame) end
          end
        end
      end
    end
  end)
end)
Tabs.Race:AddToggle({
Name = "Change Transparency can see", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.can = Value
end})
spawn(function()
  pcall(function()
    while wait(Sec) do
      if _G.can then
        local _miCan = workspace.Map:FindFirstChild('MysticIsland')
          for i,v in pairs(_miCan and _miCan:GetChildren() or {}) do
            if v.Name == "Part" then
              if v.ClassName == "MeshPart" then
                v.Transparency = 0
            else 
              v.Transparency = 1
            end
          end
        end
      end
    end
  end)
end)
Tabs.Race:AddToggle({
Name = "Auto Tween Advanced Fruit Dealer", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Addealer = Value
end})
spawn(function()
  while wait() do
    if _G.Addealer then
	  pcall(function()
	    for _,v in pairs(replicated.NPCs:GetChildren()) do
	    if v.Name == "Advanced Fruit Dealer" then _tp(v.HumanoidRootPart.CFrame) end
        end   	   
	 end)
    end
  end
end)
Tabs.Race:AddToggle({
Name = "Auto Collect Mirage Chest", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmChestM = Value
end})
spawn(function()
  while wait(.2) do
    if _G.FarmChestM then
      pcall(function()
        if workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest") or workspace.Map.MysticIsland.Chests:FindFirstChild("FragChest") then
          local CollectionService = game:GetService("CollectionService")
          local Players = game:GetService("Players")
          local Player = Players.LocalPlayer
          local Character = Player.Character or Player.CharacterAdded:Wait()                
          if not Character then return end                
          local Position = Character:GetPivot().Position
          local Chests = CollectionService:GetTagged("_ChestTagged")      
          local Distance, Nearest = math.huge, nil  
          for i = 1, #Chests do
            local Chest = Chests[i]
            local Magnitude = (Chest:GetPivot().Position - Position).Magnitude        
            if not SelectedIsland or Chest:IsDescendantOf(SelectedIsland) then
              if not Chest:GetAttribute("IsDisabled") and Magnitude < Distance then
                Distance = Magnitude
                Nearest = Chest
              end
            end
          end
        if Nearest then _tp(Nearest:GetPivot()) end
        end
      end)
    end
  end
end)


Tabs.Race:AddButton({
Name = "Talk With Stone", 
Description = "",
Callback = function()
  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Begin")
  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Check")
  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Teleport")
  replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Continue")
end})
Tabs.Race:AddToggle({
Name = "Auto Look At Moon", 
Description = "", 
Default = false,
Callback = function(Value)
  LookM = Value
end})
function MoveCamtoMoon()
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,Lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position,Lighting:GetMoonDirection() + plr.Character.HumanoidRootPart.CFrame.Position)
end
task.spawn(function()
  while task.wait() do
    if LookM then
      MoveCamtoMoon()
      wait(.1)
      replicated.Remotes.CommE:FireServer("ActivateAbility")
    end
  end
end)

Tabs.Race:AddToggle({
    Name = "Look Moon + Auto V3", 
    Description = "",
    Default = false,
    Callback = function(Value)
        LookMV3 = Value
    end
})

function MoveCamtoMoon()
    local moonDir = Lighting:GetMoonDirection()
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + moonDir)
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position, plr.Character.HumanoidRootPart.Position + moonDir)
end

task.spawn(function()
    while task.wait(0.1) do
        if LookMV3 then
            MoveCamtoMoon()
            replicated.Remotes.CommE:FireServer("ActivateAbility")            
            UIS:SendKeyEvent(true, "T", false, game)
            wait(0.5)
            UIS:SendKeyEvent(false, "T", false, game)
        end
    end
end)

Tabs.Race:AddSection("Upgrade Races V2 And V3")
RaceMink = Tabs.Race:AddToggle({
Name = "Auto Upgrade Mink", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Mink = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Mink then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= 2 then
          if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
            replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
          elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
            if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
              _tp(workspace.Flower1.CFrame)
            elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
              _tp(workspace.Flower2.CFrame)
            elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
              local v = GetConnectionEnemies("Swan Pirate")
              if v then repeat wait() Attack.Kill(v,_G.Auto_Mink) until GetBP("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Mink == false
              else _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))end            
            end        
          elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
	        replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
	      end
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
          replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
		  _G.AutoFarmChest = true
	    else
	      _G.AutoFarmChest = false
        end
      end
    end)
  end
end)
RaceHuman = Tabs.Race:AddToggle({
Name = "Auto Upgrade Human", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Human = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Human then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
	     if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
		  replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
		elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
		  if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
		    _tp(workspace.Flower1.CFrame)
		  elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
		    _tp(workspace.Flower2.CFrame)
		  elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
		    local v = GetConnectionEnemies("Swan Pirate")
            if v then repeat wait() Attack.Kill(v,_G.Auto_Human) until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Human == false
		    else _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))end
		  end
		  elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
		    replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
		  end
		  elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
		    replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
		  elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
		  local v = GetConnectionEnemies(Human_v3_Mob[1])
          if v then repeat wait()Attack.Kill(v,_G.Auto_Human)until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human			           
	      else _tp(CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625))
		  end		      
		  local v = GetConnectionEnemies(Human_v3_Mob[2])
          if v then repeat wait()Attack.Kill(v,_G.Auto_Human)until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human			           
	      else _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
		  end		      
		  local v = GetConnectionEnemies(Human_v3_Mob[3])
          if v then repeat wait()Attack.Kill(v,_G.Auto_Human)until v.Humanoid.Health <= 0 or not v.Parent or not _G.Auto_Human			           
          else _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
	      end		      		
        end
      end
    end)
  end
end)
RaceSky = Tabs.Race:AddToggle({
Name = "Auto Upgrade Angel", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Skypiea = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Skypiea then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
	      if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
		    replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
		  elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
		    if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
		      _tp(workspace.Flower1.CFrame)
		    elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
		      _tp(workspace.Flower2.CFrame)
		    elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
		      local v = GetConnectionEnemies("Swan Pirate")
		      if v then
			    repeat wait()Attack.Kill(v,_G.Auto_Skypiea)until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Skypiea == false
		      else
		        _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
		      end
		    end
	      elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
            replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
          end
		  elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
	        replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
	    elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
	      for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= plr.Name and tostring(v.Data.Race.Value) == "Skypiea" then
		      repeat task.wait() _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,8,0) * CFrame.Angles(math.rad(-45),0,0))until v.Humanoid.Health <= 0 or _G.Auto_Skypiea == false
	        end
	      end
        end          
      end
    end)
  end
end)
RaceFish = Tabs.Race:AddToggle({
Name = "Auto Upgrade FishMan", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Fish = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Fish then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") ~= -2 then
	      if replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
		    replicated.Remotes.CommF_:InvokeServer("Alchemist","2")
		  elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
	        if not plr.Backpack:FindFirstChild("Flower 1") and not plr.Character:FindFirstChild("Flower 1") then
		      _tp(workspace.Flower1.CFrame)
	        elseif not plr.Backpack:FindFirstChild("Flower 2") and not plr.Character:FindFirstChild("Flower 2") then
	          _tp(workspace.Flower2.CFrame)
	        elseif not plr.Backpack:FindFirstChild("Flower 3") and not plr.Character:FindFirstChild("Flower 3") then
	          local v = GetConnectionEnemies("Swan Pirate")
		      if v then
			    repeat wait()Attack.Kill(v,_G.Auto_Fish)until plr.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Fish == false
	          else
		       _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
	          end
            end
	      elseif replicated.Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
            replicated.Remotes.CommF_:InvokeServer("Alchemist","3")
          end
        elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 0 then
	      replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","2")
	    elseif replicated.Remotes.CommF_:InvokeServer("Wenlocktoad","1") == 1 then
          warn("Sea Beast Soon")
        end
      end
    end)
  end
end)


Tabs.Race:AddSection("Trials Quest V4")
local CheckTier = Tabs.Race:AddParagraph("Tiers V4 Status", "")
spawn(function()
    pcall(function()
        while wait(0.2) do
            CheckTier:SetDesc("Tiers - V4 : " .. " " .. plr.Data.Race.C.Value)
        end
    end)
end)
PullLv = Tabs.Race:AddToggle({
Name = "Auto Pull Lever", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Lver = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Lver then
      pcall(function()
        for x,c in pairs(workspace.Map["Temple of Time"]:GetDescendants()) do
        if c.Name == "ProximityPrompt" then fireproximityprompt(c,math.huge)end
        end
      end)
    end
  end
end)
Train = Tabs.Race:AddToggle({
Name = "Auto Train V4", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AcientOne = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.AcientOne then
        local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
	    for i=1,#BonesTable do
          if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
            vim1:SendKeyEvent(true, "Y", false, game)
            replicated.Remotes.CommF_:InvokeServer("UpgradeRace","Buy")
            _tp(CFrame.new(-8987.041015625, 215.862060546875, 5886.71044921875))
	      elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
	        local v = GetConnectionEnemies(BonesTable)
	        if v then repeat wait() Attack.Kill(v, _G.AcientOne) until _G.AcientOne == false or v.Humanoid.Health <= 0 or not v.Parent
		    else _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
		    end
	      end
        end
      end
    end)
  end
end)

Tabs.Race:AddButton({
    Name = "Teleport to Temple of Time",
    Description = "",
    Callback = function()
        local plr = game:GetService("Players").LocalPlayer
        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
        end

        if not game:GetService("Workspace").Map:FindFirstChild("Temple of Time") and World3 then
            local stash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")
            if stash and stash:FindFirstChild("Temple of Time") then
                stash["Temple of Time"].Parent = workspace.Map
            end
        end
    end
})
Tabs.Race:AddButton({
Name = "Teleport to Ancient One", 
Description = "",
Callback = function()
        local plr = game:GetService("Players").LocalPlayer
        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

        if hrp then
            hrp.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
        end

        if not game:GetService("Workspace").Map:FindFirstChild("Temple of Time") and World3 then
            local stash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")
            if stash and stash:FindFirstChild("Temple of Time") then
                stash["Temple of Time"].Parent = workspace.Map
            end
        end
        
        task.wait(2)

        tween(CFrame.new(28981.552734375, 14888.4267578125, - 120.245849609375))
    end
})
Tabs.Race:AddButton({
Name = "Teleport to Ancient Clock", 
Description = "",
Callback = function()
        local plr = game:GetService("Players").LocalPlayer
        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

        local pos1 = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)

        local pos2 = CFrame.new(29549, 15069, -88)

        if hrp then
            hrp.CFrame = pos1
        end

        task.delay(2, function()
            _tp(pos2)
        end)

        if not workspace.Map:FindFirstChild("Temple of Time") and World3 then
            local stash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")
            if stash and stash:FindFirstChild("Temple of Time") then
                stash["Temple of Time"].Parent = workspace.Map
            end
        end
    end
})
Doors = Tabs.Race:AddToggle({
Name = "Auto Teleport to Race Doors", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TPDoor = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.TPDoor then
	    if tostring(plr.Data.Race.Value) == "Mink" then
          _tp(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
	    elseif tostring(plr.Data.Race.Value) == "Fishman" then
          _tp(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
	    elseif tostring(plr.Data.Race.Value) == "Cyborg" then
          _tp(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
	    elseif tostring(plr.Data.Race.Value) == "Skypiea" then
          _tp(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
	    elseif tostring(plr.Data.Race.Value) == "Ghoul" then
          _tp(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
	    elseif tostring(plr.Data.Race.Value) == "Human" then
          _tp(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
	    end
      end
    end)
  end
end)                   
Trials = Tabs.Race:AddToggle({
Name = "Auto Complete Trial Race", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Complete_Trials = Value
end})
GetSeaBeastTrial = function()
  if not workspace.Map:FindFirstChild("FishmanTrial") then return nil end
  if workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then FishmanTrial = workspace["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") end
  if FishmanTrial then
    for _,v in next, workspace.SeaBeasts:GetChildren() do
      if v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 then
      if v.Health.Value > 0 then return v end
      end
    end
  end
end
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Complete_Trials then
        if tostring(plr.Data.Race.Value) == "Mink" then
          notween(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-20,0))
	   end
      end
    end)
  end
end)
spawn(function()
  while wait(Sec) do
    pcall(function() 
      if _G.Complete_Trials then
	    if tostring(plr.Data.Race.Value) == "Fishman" then
	      if GetSeaBeastTrial() then            
            repeat task.wait()
              spawn(function()_tp(CFrame.new(GetSeaBeastTrial().HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 300,GetSeaBeastTrial().HumanoidRootPart.Position.Z))end)
		      MousePos = GetSeaBeastTrial().HumanoidRootPart.Position
              Useskills("Melee","Z")
	          Useskills("Melee","X")
	          Useskills("Melee","C")
              wait(.1)
              Useskills("Sword","Z")
              Useskills("Sword","X")
              wait(.1)
              Useskills("Blox Fruit","Z")
              Useskills("Blox Fruit","X")
              Useskills("Blox Fruit","C")
              wait(.1)
              Useskills("Gun","Z")
              Useskills("Gun","X")
            until _G.Complete_Trials == false or not GetSeaBeastTrial()
          end          
	    end
      end
    end)
  end
end)
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Complete_Trials then
        if tostring(plr.Data.Race.Value) == "Cyborg" then
         _tp(workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0,500,0))
   	   end
      end
    end)
  end
end)
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Complete_Trials then
        if tostring(plr.Data.Race.Value) == "Skypiea" then
          notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
  	   end
      end
    end)
  end
end)
spawn(function()
  while wait(.1) do   
    pcall(function()
      if _G.Complete_Trials then
	    if tostring(plr.Data.Race.Value) == "Human" or tostring(plr.Data.Race.Value) == "Ghoul" then	      
	      local TrialsTables = {"Ancient Vampire","Ancient Zombie"}
	      local v = GetConnectionEnemies(TrialsTables)
          if v then repeat wait() Attack.Kill(v, _G.Complete_Trials)until _G.Complete_Trials == false or not v.Parent or v.Humanoid.Health <= 0 end		
        end
      end
    end)
  end
end)
AutoKill = Tabs.Race:AddToggle({
Name = "Auto Kill Player After Trial", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Defeating = Value
end})
spawn(function()
  while task.wait(Sec) do
    pcall(function()
      if _G.Defeating then
	    for _, v in pairs(workspace.Characters:GetChildren()) do
          if v.Name ~= plr.Name then
            if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (Root.Position - v.HumanoidRootPart.Position).Magnitude <= 250 then
              repeat task.wait() EquipWeapon(_G.SelectWeapon) _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,0,15)) sethiddenproperty(plr, "SimulationRadius", math.huge)until _G.Defeating == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
            end
          end
        end
      end
    end)
  end
end)

Tabs.Prehistoric:AddSection("Dojo Quest")
Tabs.Prehistoric:AddButton({
    Title = "Teleport To Dragon Dojo",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
        topos(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    end
})
DojoQ = Tabs.Prehistoric:AddToggle({
Name = "Auto Dojo Trainer", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Dojoo = Value
end})
function printBeltName(data) if type(data) == "table" and data.Quest["BeltName"] then return data.Quest["BeltName"] end end
spawn(function()
  while wait(Sec) do
    if _G.Dojoo then
      pcall(function()
        local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "RequestQuest"}}        
        local progress = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
        local NameBelt = printBeltName(progress)
        if debug == false and not progress and not NameBelt then
          _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
          debug = true
        elseif debug == true and (CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
          if NameBelt == "White" then
            local v = GetConnectionEnemies("Skull Slayer")
            if v then repeat task.wait() Attack.Kill(v, _G.Dojoo) until not progress or not _G.Dojoo or not Attack.Alive(v)
            else _tp(CFrame.new(-16759.58984375, 71.28376770019531, 1595.3399658203125))
            end
          elseif NameBelt == "Yellow" then
            repeat task.wait()
              _G.SeaBeast1 = true
              _G.TerrorShark = true
              _G.Shark = true
              _G.Piranha = true
              _G.MobCrew = true
              _G.FishBoat = true
              _G.SailBoats = true
            until not _G.Dojoo or not progress
            _G.SeaBeast1 = false
            _G.TerrorShark = false
            _G.Shark = false
            _G.Piranha = false
            _G.MobCrew = false
            _G.FishBoat = false
            _G.SailBoats = false               
          elseif NameBelt == "Green" then
            repeat task.wait()
              _G.SailBoats = true
            until not _G.Dojoo or not progress
            _G.SailBoats = false
          elseif NameBelt == "Purple" then
            repeat task.wait()
              _G.FarmEliteHunt = true
            until not _G.Dojoo or not progress
            _G.FarmEliteHunt = false
          elseif NameBelt == "Red" then
            repeat task.wait()
              _G.SailBoats = true
              _G.FishBoat = true
            until not _G.Dojoo or not progress
            _G.SailBoats = false
            _G.FishBoat = false                      
          elseif NameBelt == "Black" then
            repeat task.wait()              
              if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then    
                _G.Prehis_Find = true                   
                if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt",true) then
                  _G.Prehis_Skills = false
                  _G.Prehis_Find = true
                else
                  _G.Prehis_Skills = true
                  _G.Prehis_Find = false
                end
              else
                _G.Prehis_Find = true
                _G.Prehis_Skills = false
              end
            until not _G.Dojoo or not progress
            _G.Prehis_Find = false
            _G.Prehis_Skills = false                        
          elseif NameBelt == "Orange" or NameBelt == "Blue" then
            return nil
          end
        end
        if not progress then
          debug = false
          local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "ClaimQuest"}}
          replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
        end
      end)
    end
  end
end)
BlazeEM = Tabs.Prehistoric:AddToggle({
Name = "Auto Dragon Hunter", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FarmBlazeEM = Value
end})
checkQuesta=function()local a={[1]={["Context"]="Check"}}local b=nil;pcall(function()local c={[1]={["Context"]="RequestQuest"}}game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(c))end)local d,e=pcall(function()b=game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(a))end)local f=false;local g;local h;local i;if b then if b.Text then f=true;local j=b.Text;if string.find(tostring(j),"Defeat")then i=1;g=string.sub(tostring(j),8,9)g=tonumber(g)local k={"Hydra Enforcer","Venomous Assailant"}for l,m in pairs(k)do if string.find(j,m)then h=m;break end end elseif string.find(tostring(j),"Destroy")then g=10;i=2;h=nil end end end;return f,h,g,i end
BackTODoJo=function()for a,b in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren())do if b.Name=="NotificationTemplate"then if string.find(b.Text,"Head back to the Dojo to complete more tasks")then return true end end end;return false end
DragonMobClear=function(a,b,c)if workspace.Enemies:FindFirstChild(b)then for d,e in pairs(workspace.Enemies:GetChildren())do if e.Name==b and Attack.Alive(e)then if a then Attack.Kill(e,a)end end end else _tp(c)end end
spawn(function()
  while wait() do 
    if _G.FarmBlazeEM then
      pcall(function()              
        local a,v,h,x = checkQuesta()                  
        if a == true and not BackTODoJo() then
          if x == 1 then
            if v == "Hydra Enforcer" or v == "Venomous Assailant" then            
              repeat wait()
                DragonMobClear(true, v, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
              until not _G.FarmBlazeEM or not a or BackTODoJo()                            
            end      
          elseif x == 2 then
            if workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true) then
              repeat wait()                
                spawn(function() _tp(workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4,0,0)) end)
                if (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200 then
                MousePos = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position
                Useskills("Melee","Z")
	            Useskills("Melee","X")
	            Useskills("Melee","C")
                wait(.5)
                Useskills("Sword","Z")
                Useskills("Sword","X")
                wait(.5)
                Useskills("Blox Fruit","Z")
                Useskills("Blox Fruit","X")
                Useskills("Blox Fruit","C")
                wait(.5)
                Useskills("Gun","Z")
                Useskills("Gun","X")
                end
              until not _G.FarmBlazeEM or not a or BackTODoJo()
            end
          end
        else
          _tp(CFrame.new(5813, 1208, 884))
          DragonMobClear(false, nil, nil) 
        end
      end)
    end
  end
end)
spawn(function()
  while wait(.1) do 
    if _G.FarmBlazeEM then
      pcall(function()              
        if workspace.EmberTemplate:FindFirstChild("Part") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.EmberTemplate.Part.CFrame        
        end
      end)
    end
  end
end)

Tabs.Prehistoric:AddSection("Drago Trial")
GetQuestDracoLevel = function()
  local v371 = {[1] = {NPC = "Dragon Wizard",Command = "Upgrade"}};
  return replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371))
end
Toggle = Tabs.Prehistoric:AddToggle({
Name = "Tween To Upgrade Droco Trial", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.UPGDrago = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.UPGDrago then     
        if GetQuestDracoLevel() == false then
          return nil
        elseif GetQuestDracoLevel() == true then
          if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
            _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
          else
            _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
            local v371 = {[1] = {NPC = "Dragon Wizard",Command = "Upgrade"}};
            replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));
          end
        end
      end
    end)
  end
end)
Toggle = Tabs.Prehistoric:AddToggle({
Name = "Auto Drago (V1)", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DragoV1 = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.DragoV1 then     
        if GetM("Dragon Egg") <= 0 then
        repeat wait()
          _G.Prehis_Find = true
          _G.Prehis_Skills = true
          _G.Prehis_DE = true
        until not _G.DragoV1 or GetM("Dragon Egg") >= 1
          _G.Prehis_Find = false
          _G.Prehis_Skills = false
          _G.Prehis_DE = false
        end
      end
    end)
  end
end)
fireflower = Tabs.Prehistoric:AddToggle({
Name = "Auto Drago (V2)", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoFireFlowers = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoFireFlowers then
      local FireFlower = workspace:FindFirstChild("FireFlowers")
      local v = GetConnectionEnemies("Forest Pirate")
      if v then repeat wait() Attack.Kill(v,_G.AutoFireFlowers) until not _G.AutoFireFlowers or not v.Parent or v.Humanoid.Health <= 0 or FireFlower
      else _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
      end      
      if FireFlower then
        for i, v in pairs(FireFlower:GetChildren()) do
          if (v:IsA("Model") and v.PrimaryPart) then
            local FlowerPos = v.PrimaryPart.Position;
            local playerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
            local Magnited = (FlowerPos - playerRoot).Magnitude;
            if (Magnited <= 100) then
              vim1:SendKeyEvent(true, "E", false, game) wait(1.5) vim1:SendKeyEvent(false, "E", false, game)
            else
              _tp(CFrame.new(FlowerPos));
            end
          end
        end
      end
    end
  end
end)
Toggle = Tabs.Prehistoric:AddToggle({
Name = "Auto Drago (V3)", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DragoV3 = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.DragoV3 then     
        repeat wait()
          _G.DangerSc = "Lv Infinite"
          _G.SailBoats = true
          _G.TerrorShark = true
        until not _G.DragoV3
        _G.DangerSc = "Lv 1"
        _G.SailBoats = false
        _G.TerrorShark = false
      end
    end)
  end
end)
Toggle = Tabs.Prehistoric:AddToggle({
Name = "Auto Relic Drago Trial [Beta]", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Relic123 = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.Relic123 then
      pcall(function()
        if workspace.Map:FindFirstChild("DracoTrial") then
          replicated.Remotes.DracoTrial:InvokeServer()                  
          wait(.5)
          repeat wait() _tp(CFrame.new(-39934.9765625, 10685.359375, 22999.34375)) until not _G.Relic123 or (Root.Position == CFrame.new(-39934.9765625, 10685.359375, 22999.34375).Position)
          repeat wait() _tp(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625)) until not _G.Relic123 or (Root.Position == CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625).Position)
          wait(2.5)
          repeat wait() _tp(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375)) until not _G.Relic123 or (Root.Position == CFrame.new(-39914.65625, 10685.384765625, 23000.177734375).Position)
          repeat wait() _tp(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375)) until not _G.Relic123 or (Root.Position == CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375).Position)
          wait(2.5)
          repeat wait() _tp(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875)) until not _G.Relic123 or (Root.Position == CFrame.new(-39908.5, 10685.4052734375, 22990.04296875).Position)
          repeat wait() _tp(CFrame.new(-39609.5, 9376.400390625, 23472.94335975)) until not _G.Relic123 or (Root.Position == CFrame.new(-39609.5, 9376.400390625, 23472.94335975).Position) 
        else
          local drago = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
          if drago and drago:IsA("Part") then _tp(CFrame.new(drago.Position)) end        
        end
      end)
    end
  end
end)
Toggle = Tabs.Prehistoric:AddToggle({
Name = "Auto Train Drago v4", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TrainDrago = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.TrainDrago then
        local DragoM = {"Venomous Assailant","Hydra Enforcer"}
	    for i=1,#DragoM do
          if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
            vim1:SendKeyEvent(true, "Y", false, game)
            replicated.Remotes.CommF_:InvokeServer("UpgradeRace","Buy",2)
            _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
	      elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
	        local v = GetConnectionEnemies(DragoM)
	        if v then repeat wait() Attack.Kill(v, _G.TrainDrago) until _G.TrainDrago == false or v.Humanoid.Health <= 0 or not v.Parent                    		
		    else _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
		    end
	      end
        end
      end
    end)
  end
end)
dragoTpVolcano = Tabs.Prehistoric:AddToggle({
Name = "Tween to Drago Trials", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TpDrago_Prehis = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.TpDrago_Prehis then
      local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");
      if (v748 and v748:IsA("Part")) then _tp(CFrame.new(v748.Position)) end
    end
  end
end)
bdrago = Tabs.Prehistoric:AddToggle({
Name = "Swap Drago Race", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.BuyDrago = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.BuyDrago then
      pcall(function()
        if (CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300 then
          _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
        else
          _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
          local v371 = {[1] = {NPC = "Dragon Wizard",Command = "DragonRace"}};
          replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));
        end
      end)
    end
  end
end)
UpTalon = Tabs.Prehistoric:AddToggle({
Name = "Upgrade Dragon Talon With Uzoth", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DT_Uzoth = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.DT_Uzoth then
      local Uz_POS = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-08, -0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, -6.23161966e-08, 0.811413169)
      _tp(Uz_POS)
      if (Uz_POS.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 25 then
        local ohTable1 = {["NPC"] = "Uzoth",["Command"] = "Upgrade"}
        replicated.Modules.Net["RF/InteractDragonQuest"]:InvokeServer(ohTable1)
      end
    end
  end
end)

Tabs.Prehistoric:AddSection("Volcanic Crafting")

Tabs.Prehistoric:AddButton({
Name = "Craft Dragonheart", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "Dragonheart"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

Tabs.Prehistoric:AddButton({
Name = "Craft Dragonstorm", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "Dragonstorm"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

Tabs.Prehistoric:AddButton({
    Name = "Craft Dino Hood",
    Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "DinoHood"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

Tabs.Prehistoric:AddButton({
    Name = "Craft T-Rex Skull",
    Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "TRexSkull"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})


Tabs.Prehistoric:AddSection("Prehistoric Island")
local Check_Volcano = Tabs.Prehistoric:AddParagraph("Prehistoric Island Status", "")
spawn(function()
    while wait(0.2) do
        if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
            Check_Volcano:SetDesc("Prehistoric Island : True")
        else
            Check_Volcano:SetDesc("Prehistoric Island : False")
        end
    end
end)

Tabs.Prehistoric:AddButton({
    Name = "Craft Volcanic Magnet",
    Callback = function()
        local RF = game:GetService("ReplicatedStorage").Modules.Net["RF/Craft"]

        RF:InvokeServer(
            "PossibleHardcode",
            "Volcanic Magnet"
        )
    end
})

Tabs.Prehistoric:AddToggle({
    Name = "Craft Volcanic Magnet",
    Default = false,
    Callback = function(Value)
        getgenv().AutoCraftVolcanic = Value
    end
})

task.spawn(function()
    local RF = game:GetService("ReplicatedStorage").Modules.Net["RF/Craft"]

    while task.wait(0.3) do
        if getgenv().AutoCraftVolcanic then
            pcall(function()
                RF:InvokeServer(
                    "PossibleHardcode",
                    "Volcanic Magnet"
                )
            end)

            getgenv().AutoCraftVolcanic = false
        end
    end
end)



Tabs.Prehistoric:AddToggle({
    Name = "Auto Find Prehistoric Island",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.Prehis_Find = Value
    end
})

local targetDestination = nil

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_Find then
                local char = plr.Character
                if not char then return end

                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                if not hrp or not hum or hum.Health <= 0 then return end

                local Locations = workspace["_WorldOrigin"].Locations
                local prehistoricLoc = Locations:FindFirstChild("Prehistoric Island", true)

              
                if not prehistoricLoc then
                    local myBoat = CheckBoat()

                    
                    if not myBoat then
                        local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
                        TeleportToTarget(buyBoatCFrame)

                        if (buyBoatCFrame.Position - hrp.Position).Magnitude <= 10 then
                            replicated.Remotes.CommF_:InvokeServer(
                                "BuyBoat",
                                _G.SelectedBoat or "Guardian"
                            )
                        end
                        return
                    end

                  
                    if hum.Sit == false then
                        local seatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                        _tp(seatCFrame)
                        return
                    end

                   
                    local seaCFrame = CFrame.new(-10000000, 31, 37016.25)
                    targetDestination = seaCFrame

                    if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                        _tp(CFrame.new(-10000000, 150, 37016.25))
                    else
                        _tp(seaCFrame)
                    end

               
                else
                    local stoneHead =
                        prehistoricLoc:FindFirstChild("HeadTeleport", true)
                        or prehistoricLoc:FindFirstChild("Teleport_Head", true)
                        or prehistoricLoc:FindFirstChild("Head", true)

                    if stoneHead then
                        local headCF = stoneHead.CFrame
                        local safePos =
                            headCF.Position
                            - headCF.LookVector * 40
                            + Vector3.new(0, 20, 0)

                        if (safePos - hrp.Position).Magnitude > 30 then
                            _tp(CFrame.new(safePos))
                        end
                    else
                        local islandPos = prehistoricLoc.CFrame.Position
                        local dir = (islandPos - hrp.Position).Unit
                        local safePos = islandPos - dir * 250 + Vector3.new(0, 60, 0)
                        _tp(CFrame.new(safePos))
                    end
                end
            end
        end)
    end
end)

Tabs.Prehistoric:AddToggle({
    Name = "Auto Start Prehistoric Event",
    Default = false,
    Callback = function(Value)
        _G.AutoStartPrehistoric = Value
    end
})
spawn(function()
    while wait() do
        if _G.AutoStartPrehistoric then
            pcall(function()
                local prehistoricIsland = workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true)
                if prehistoricIsland then
                    if workspace.Map:FindFirstChild("PrehistoricIsland", true) then
                        local promptPart = workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt", true)
                        if promptPart and promptPart:FindFirstChild("ProximityPrompt") then
                            if plr:DistanceFromCharacter(promptPart.CFrame.Position) <= 150 then
                                fireproximityprompt(promptPart.ProximityPrompt, math.huge)
                                vim1:SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vim1:SendKeyEvent(false, "E", false, game)
                            end
                            _tp(promptPart.CFrame)
                        end
                    end
                end
            end)
        end
    end
end)




Tabs.Prehistoric:AddToggle({
    Name = "Auto Patch Prehistoric Event",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.Prehis_Skills = Value
    end
})



spawn(function()
    while wait(0.3) do
        if _G.Prehis_Skills then
            pcall(function()
                local island = workspace.Map:FindFirstChild("PrehistoricIsland")
                if not island then return end

                for _, obj in pairs(island:GetDescendants()) do
                    if (obj:IsA("BasePart") or obj:IsA("MeshPart"))
                        and obj.Name:lower():find("lava") then
                        obj:Destroy()
                    end
                end

                local core = island:FindFirstChild("Core")
                if core then
                    local lavaModel = core:FindFirstChild("InteriorLava")
                    if lavaModel then lavaModel:Destroy() end
                end

                local trialTeleport = island:FindFirstChild("TrialTeleport")
                for _, v in pairs(island:GetDescendants()) do
                    if v.Name == "TouchInterest"
                    and not (trialTeleport and v:IsDescendantOf(trialTeleport)) then
                        v.Parent:Destroy()
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(Sec) do
        if _G.Prehis_Skills then
            pcall(function()
                local golem = GetConnectionEnemies("Lava Golem")
                if golem and golem:FindFirstChild("Humanoid") then
                    repeat
                        wait(0.1)
                        Attack.Kill(golem, true)
                        golem.Humanoid:ChangeState(15)
                    until not _G.Prehis_Skills
                        or not golem.Parent
                        or golem.Humanoid.Health <= 0
                end
            end)
        end
    end
end)


spawn(function()
    while wait(Sec) do
        if _G.Prehis_Skills then
            pcall(function()
                local island = workspace.Map:FindFirstChild("PrehistoricIsland")
                if not island then return end

                local core = island:FindFirstChild("Core")
                if not core then return end

                local rocks = core:FindFirstChild("VolcanoRocks")
                if not rocks then return end

                for _, rock in pairs(rocks:GetChildren()) do
                    local layer = rock:FindFirstChild("VFXLayer")
                    local at0 = layer and layer:FindFirstChild("At0")
                    local glow = at0 and at0:FindFirstChild("Glow")

                    if glow and glow.Enabled then
                        repeat
                            wait(0.1)
                            _tp(layer.CFrame)

                            if plr:DistanceFromCharacter(layer.CFrame.Position) <= 150 then
                                MousePos = layer.CFrame.Position
                                Useskills("Melee","Z") wait(.4)
                                Useskills("Melee","X") wait(.4)
                                Useskills("Melee","C") wait(.4)
                                Useskills("Blox Fruit","Z") wait(.4)
                                Useskills("Blox Fruit","X") wait(.4)
                                Useskills("Blox Fruit","C")
                            end
                        until not _G.Prehis_Skills or not glow.Enabled
                    end
                end
            end)
        end
    end
end)

Kaura = Tabs.Prehistoric:AddToggle({
    Name = "Kill Aura",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.KillAuraFull = Value
end})

local Range = 500
local Delay = 2   

spawn(function()
    while task.wait(Delay) do
        if _G.KillAuraFull then
            pcall(function()
                local plr = game.Players.LocalPlayer
                local char = plr.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                sethiddenproperty(plr, "SimulationRadius", math.huge)

                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
                        local dist = (enemy.HumanoidRootPart.Position - hrp.Position).Magnitude
                        if dist <= Range and enemy.Humanoid.Health > 0 then
                            enemy.Humanoid.Health = 0
                            enemy.HumanoidRootPart.CanCollide = false
                            enemy:BreakJoints()
                        end
                    end
                end
            end)
        end
    end
end)
Vocan = Tabs.Prehistoric:AddToggle({
Name = "Auto Collect Dino Bones", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Prehis_DB = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Prehis_DB then
        if workspace:FindFirstChild("DinoBone") then
          for i,v in pairs(workspace:GetChildren()) do
            if v.Name == "DinoBone" then _tp(v.CFrame) end
          end
        end
      end
    end)
  end
end)
Vocan = Tabs.Prehistoric:AddToggle({
Name = "Auto Collect Dragon Eggs", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Prehis_DE = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Prehis_DE then
      if workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg") then _tp(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg").Molten.CFrame) fireproximityprompt(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30) end        
      end
    end)
  end
end)
Toggle = Tabs.Prehistoric:AddToggle({
Name = "Auto Reset When Complete Volcano", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.ResetPH = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.ResetPH then
        local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");
        if (v748 and v748:FindFirstChild("TouchInterest")) then
          plr.Character.Humanoid.Health = 0 
        else
          if workspace:FindFirstChild("DinoBone") then
            for i,v in pairs(workspace:GetChildren()) do
              if v.Name == "DinoBone" then _tp(v.CFrame) end
            end
          end
        end
      end
    end)
  end
end)

Tabs.SeaEvent:AddSection("Sea Event / Setting Sail")
local ListSeaBoat={"Guardian","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade","PirateSloop","MarineSloop","Beast Hunter"}
local ListSeaZone={"Lv 1","Lv 2","Lv 3","Lv 4","Lv 5","Lv 6","Lv Infinite"}


Tabs.SeaEvent:AddButton({
    Name = "Remove Lighting Effect",
    Callback = function()
        game:GetService("Lighting").BaseAtmosphere:Destroy()
    end
})

Tabs.SeaEvent:AddToggle({
    Name = "Ship Speed Modifier",
    Default = false,
    Callback = function(Value)
        getgenv().SpeedBoat = Value
    end
})
game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().SpeedBoat then
        local plr = game:GetService("Players").LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            if plr.Character.Humanoid.Sit then
                for _, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                    local seat = boat:FindFirstChildWhichIsA("VehicleSeat")
                    if seat then
                        seat.MaxSpeed = SetSpeedBoat
                    end
                end
            end
        end
    end
end)
Tabs.SeaEvent:AddSlider({
    Name = "Ship Speed",
    Min = 0,
    Max = 1000,
    Increment = 1,
    Default = 300,
    Callback = function(Value)
        SetSpeedBoat = Value
    end
})
Tabs.SeaEvent:AddToggle({
    Name = "Auto Press W",
    Default = false,
    Callback = function(Value)
        getgenv().AutoPressW = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoPressW then
                local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                if humanoid.Sit == true then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                end
            end
        end)
    end
end)
Tabs.SeaEvent:AddToggle({
    Name = "No Clip Ship",
    Default = false,
    Callback = function(Value)
        getgenv().NoClipShip = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            for i, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                for _, v in pairs(boat:GetDescendants()) do
                    if v:IsA("BasePart") then
                        if getgenv().NoClipShip or getgenv().FindPrehistoric then
                            v.CanCollide = false
                        else
                            v.CanCollide = true
                        end
                    end
                end
            end
        end)
    end
end)

Tabs.SeaEvent:AddSection("Crafting Items")


Tabs.SeaEvent:AddButton({
Name = "Craft SharkTooth", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "SharkTooth"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

Tabs.SeaEvent:AddButton({
Name = "Craft TerrorJaw", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "TerrorJaw"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

Tabs.SeaEvent:AddButton({
Name = "Craft SharkAnchor", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "SharkAnchor"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

Tabs.SeaEvent:AddButton({
Name = "Craft LeviathanCrown", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "LeviathanCrown"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
 
Tabs.SeaEvent:AddButton({
Name = "Craft LeviathanShield", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "LeviathanShield"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

Tabs.SeaEvent:AddButton({
Name = "Craft LeviathanBoat", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "LeviathanBoat"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

Tabs.SeaEvent:AddButton({
Name = "Craft LegendaryScroll", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "LegendaryScroll"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})

Tabs.SeaEvent:AddButton({
Name = "Craft MythicalScroll", 
Description = "",
Callback = function()
        local args = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "MythicalScroll"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
Tabs.SeaEvent:AddSection("Choose Sea Event")

Q = Tabs.SeaEvent:AddDropdown({
    Name = "Select Boats",
	Options = ListSeaBoat,
	Callback = function(Value)
        _G.SelectedBoat = Value
    end
})
Tabs.SeaEvent:AddButton({
Name = "Buy Boats", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyBoat",_G.SelectedBoat)
end})
Q = Tabs.SeaEvent:AddDropdown({
Name = "Select Sea Level",
Options = ListSeaZone,
Callback = function(Value)
  _G.DangerSc = Value
end})
Q = Tabs.SeaEvent:AddToggle({
Name = "Auto Sail Boat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.SailBoats = Value
end})
spawn(function()
  while wait() do
    if _G.SailBoats then 
      pcall(function()        
        local myBoat = CheckBoat()
        if not myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
          local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
          TeleportToTarget(buyBoatCFrame)
          if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
        elseif myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
          if plr.Character.Humanoid.Sit == false then
            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
            _tp(boatSeatCFrame)
          else                         
            if _G.DangerSc == "Lv 1" then CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
            elseif _G.DangerSc == "Lv 2" then CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
            elseif _G.DangerSc == "Lv 3" then CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
            elseif _G.DangerSc == "Lv 4" then CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
            elseif _G.DangerSc == "Lv 5" then CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
            elseif _G.DangerSc == "Lv 6" then CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
            elseif _G.DangerSc == "Lv Infinite" then CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
            end           
            repeat wait() 
              if (not _G.FishBoat and CheckEnemiesBoat()) or (not _G.PGB and CheckPirateGrandBrigade()) or (not _G.TerrorShark and CheckTerrorShark()) then
                _tp(CFrameSelectedZone * CFrame.new(0,150,0))
              else
                _tp(CFrameSelectedZone)
              end           
            until _G.SailBoats==false or(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)or CheckSeaBeast()and _G.SeaBeast1 or CheckEnemiesBoat()and _G.FishBoat or _G.Leviathan1 and CheckLeviathan() or _G.HCM and CheckHauntedCrew() or _G.PGB and CheckPirateGrandBrigade() or plr.Character:WaitForChild("Humanoid").Sit==false plr.Character.Humanoid.Sit = false
          end
        end
      end)
    end
  end
end)
spawn(function()while wait(Sec)do pcall(function()for a,b in pairs(workspace.Boats:GetChildren())do for c,d in pairs(workspace.Boats[b.Name]:GetDescendants())do if d:IsA("BasePart")then if _G.SailBoats or _G.Prehis_Find or _G.FindMirage or _G.SailBoat_Hydra or _G.AutofindKitIs then d.CanCollide=false else d.CanCollide=true end end end end end)end end)

Tabs.SeaEvent:AddSection("Entity Sea Event")

Tabs.SeaEvent:AddToggle({
Name = "Auto Shark", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Shark = Value
end})

Tabs.SeaEvent:AddToggle({
Name = "Auto Piranha", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Piranha = Value
end})

Tabs.SeaEvent:AddToggle({
Name = "Auto Terror Shark", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TerrorShark = Value
end})

Tabs.SeaEvent:AddToggle({
Name = "Auto Fish Crew Member", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.MobCrew = Value
end})

Tabs.SeaEvent:AddToggle({
Name = "Auto Haunted Crew Member", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.HCM = Value
end})

Tabs.SeaEvent:AddToggle({
Name = "Auto Attack PirateGrandBrigade", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.PGB = Value
end})

Tabs.SeaEvent:AddToggle({
Name = "Auto Attack Fish Boat", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FishBoat = Value
end})

Tabs.SeaEvent:AddToggle({
Name = "Auto Attack Sea Beast", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.SeaBeast1 = Value
end})

spawn(function()
  while wait() do
    pcall(function()	
      if _G.Shark then local a={"Shark"}if CheckShark()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.Shark)until _G.Shark==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
      if _G.TerrorShark then local a={"Terrorshark"}if CheckTerrorShark()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.KillSea(c,_G.TerrorShark)until _G.TerrorShark==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
      if _G.Piranha then local a={"Piranha"}if CheckPiranha()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.Piranha)until _G.Piranha==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
      if _G.MobCrew then local a={"Fish Crew Member"}if CheckFishCrew()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.MobCrew)until _G.MobCrew==false or not c.Parent or c.Humanoid.Health<=0 end end end end end                 
      if _G.HCM then local a={"Haunted Crew Member"}if CheckHauntedCrew()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.HCM)until _G.HCM==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
      if _G.SeaBeast1 then if workspace.SeaBeasts:FindFirstChild("SeaBeast1")then for a,b in pairs(workspace.SeaBeasts:GetChildren())do if b:FindFirstChild("HumanoidRootPart")and b:FindFirstChild("Health")and b.Health.Value>0 then repeat task.wait()spawn(function()_tp(CFrame.new(b.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,b.HumanoidRootPart.Position.Z))end)if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position)<=500 then AitSeaSkill_Custom=b.HumanoidRootPart.CFrame;MousePos=AitSeaSkill_Custom.Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.SeaBeast1==false or not b:FindFirstChild("HumanoidRootPart")or not b.Parent or b.Health.Value<=0 end end end end
      if _G.Leviathan1 then if workspace.SeaBeasts:FindFirstChild("Leviathan")then for a,b in pairs(workspace.SeaBeasts:GetChildren())do if b:FindFirstChild("HumanoidRootPart")and b:FindFirstChild("Leviathan Segment")and b:FindFirstChild("Health")and b.Health.Value>0 then repeat task.wait()spawn(function()_tp(CFrame.new(b.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,b.HumanoidRootPart.Position.Z))end)if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position)<=500 then MousePos=b:FindFirstChild("Leviathan Segment").Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.Leviathan1==false or not b:FindFirstChild("HumanoidRootPart")or not b.Parent or b.Health.Value<=0 end end end end
      if _G.FishBoat then if CheckEnemiesBoat()then for a,b in pairs(workspace.Enemies:GetChildren())do if b:FindFirstChild("Health")and b.Health.Value>0 and b:FindFirstChild("VehicleSeat")then repeat task.wait()spawn(function()if b.Name=="FishBoat"then _tp(b.Engine.CFrame*CFrame.new(0,-50,-25))end end)if plr:DistanceFromCharacter(b.Engine.CFrame.Position)<=150 then AitSeaSkill_Custom=b.Engine.CFrame;MousePos=AitSeaSkill_Custom.Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.FishBoat==false or not b:FindFirstChild("VehicleSeat")or b.Health.Value<=0 end end end end
      if _G.PGB then if CheckPirateGrandBrigade()then for a,b in pairs(workspace.Enemies:GetChildren())do if b:FindFirstChild("Health")and b.Health.Value>0 and b:FindFirstChild("VehicleSeat")then repeat task.wait()spawn(function()if b.Name=="PirateBrigade"then _tp(b.Engine.CFrame*CFrame.new(0,-30,-10))elseif b.Name=="PirateGrandBrigade"then _tp(b.Engine.CFrame*CFrame.new(0,-50,-50))end end)if plr:DistanceFromCharacter(b.Engine.CFrame.Position)<=150 then AitSeaSkill_Custom=b.Engine.CFrame;MousePos=AitSeaSkill_Custom.Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.PGB==false or not b:FindFirstChild("VehicleSeat")or b.Health.Value<=0 end end end end
    end)
  end
end)

Tabs.SeaEvent:AddSection("Kitsune Island / Event")
local Check_Kitsu = Tabs.SeaEvent:AddParagraph("Kitsune Island Status", "")
spawn(function()
    while wait(0.2) do
        if workspace.Map:FindFirstChild("KitsuneIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
            Check_Kitsu:SetDesc("Kitsune Island : True")
        else
            Check_Kitsu:SetDesc("Kitsune Island : False")
        end
    end
end)

Tabs.SeaEvent:AddToggle({
Name = "Auto Find Kitsune Island", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutofindKitIs = Value
end})
spawn(function()
  while wait() do
    if _G.AutofindKitIs then 
      pcall(function()
        if not workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island", true) then                
          local myBoat = CheckBoat()
          if not myBoat then
            local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
            TeleportToTarget(buyBoatCFrame)
            if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
          else
            if plr.Character.Humanoid.Sit == false then
              local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
              _tp(boatSeatCFrame)
            else
              local targetDestination = CFrame.new(-10000000, 31, 37016.25)              
              repeat wait() 
                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                  _tp(CFrame.new(-10000000, 150, 37016.25))
                else
                  _tp(CFrame.new(-10000000, 31, 37016.25))
                end
              until not _G.AutofindKitIs or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false
            end
          end
        else
          _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame*CFrame.new(0,500,0))
        end
      end)
    end
  end
end)

Tabs.SeaEvent:AddToggle({
Name = "Auto Teleport to Shrine Actived", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.tweenShrine = Value
end})
spawn(function()
  while wait(.1) do
    if _G.tweenShrine then
      pcall(function()
      local kit_is = workspace.Map:FindFirstChild("KitsuneIsland") or game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
      local shrineActive = kit_is:FindFirstChild("ShrineActive")
        if shrineActive then
          for _, v in next, shrineActive:GetDescendants() do
            if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
              replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
              repeat wait() _tp(v.CFrame * CFrame.new(0,2,0)) until _G.tweenShrine == false or not kit_is
            end
          end
        else
          _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0,500,0))        
        end
      end)
    end
  end
end)

Tabs.SeaEvent:AddToggle({
Name = "Auto Collect Azure Ember", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Collect_Ember = Value
end})
spawn(function()
  while wait(.1) do
    if _G.Collect_Ember then
      pcall(function()
        if workspace:WaitForChild("AttachedAzureEmber") or workspace:WaitForChild("EmberTemplate") then
        notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
        else
          _tp(workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0,500,0))        
          replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
        end
      end)
    end
  end
end)

Tabs.SeaEvent:AddToggle({
Name = "Auto Trade Azure Ember", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Trade_Ember = Value
end})
spawn(function()
  while wait(.1) do
    if _G.Trade_Ember then
      pcall(function()
        if workspace["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island",true) then
          replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
        end
      end)
    end
  end
end)

Tabs.SeaEvent:AddButton({
Name = "Trade Items Azure", 
Description = "",
Callback = function()
  replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
end})

Tabs.SeaEvent:AddButton({
Name = "Talk with kitsune statue", 
Description = "",
Callback = function()
  replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
end})

Tabs.SeaEvent:AddSection("Frozen Dimension Event")

local FloD = Tabs.SeaEvent:AddParagraph("FrozenDimension Status", "")
spawn(function()
    pcall(function()
        while wait(0.2) do
            if workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FloD:SetDesc('Frozen Dimension : True')
            else
                FloD:SetDesc('Frozen Dimension : False')
            end
        end
    end)
end)

local SPYING = Tabs.SeaEvent:AddParagraph("Spy Status", "")
spawn(function()
    while wait(0.2) do
        pcall(function()
            local spycheck = string.match(replicated.Remotes.CommF_:InvokeServer("InfoLeviathan", "1"), "%d+")
            if spycheck then 
                SPYING:SetDesc("Spy Leviathan : " .. tostring(spycheck))
                if tonumber(spycheck) == 5 then
                    SPYING:SetDesc("Spy Leviathan : Already Done!!")
                end
            end
        end)
    end
end)

Tabs.SeaEvent:AddButton({
    Name = "Buy Spy",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
    end
})


Tabs.SeaEvent:AddToggle({
Name = "Auto Teleport Frozen Dimension", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.FrozenTP = Value
end})
spawn(function()
  while wait(.1) do
    if _G.FrozenTP then
      pcall(function()
      if workspace.Map:FindFirstChild("LeviathanGate") then _tp(workspace.Map.LeviathanGate.CFrame) replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("OpenLeviathanGate") end
      end)
    end
  end
end)

Tabs.SeaEvent:AddToggle({
Name = "Auto Drive To Hydra Island", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.SailBoat_Hydra = Value
end})
spawn(function()
  while wait() do
    if _G.SailBoat_Hydra then 
      pcall(function()        
        local myBoat = CheckBoat()
        if not myBoat then
          local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
          TeleportToTarget(buyBoatCFrame)
          if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
        elseif myBoat then
          if plr.Character.Humanoid.Sit == false then
            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
            _tp(boatSeatCFrame)
          else                         
            repeat wait() 
              if CheckEnemiesBoat() or CheckPirateGrandBrigade() or CheckTerrorShark() then
                _tp(CFrame.new(5433, 150, 290))
              else
                _tp(CFrame.new(5433, 35, 290))
              end           
            until _G.SailBoat_Hydra==false or plr.Character:WaitForChild("Humanoid").Sit==false plr.Character.Humanoid.Sit = false
          end
        end
      end)
    end
  end
end)

Tabs.SeaEvent:AddToggle({
Name = "Auto Attack Leviathan", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Leviathan1 = Value
end})


Tabs.Esp:AddSection("Esp")

function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)


local plr = game:GetService('Players').LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
local TeamSelf = plr.Team


EspPly = function()
    for _,v in next, game.Players:GetChildren() do
        pcall(function()
            if not isnil(v.Character) then
                if PlayerEsp then
                    if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v.Character.Head)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Character.Head
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.Code
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Text = (v.Name ..' \n'.. round((plr.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Team == TeamSelf then
                            name.TextColor3 = Color3.new(0,0,254)
                        else
                            name.TextColor3 = Color3.new(255,0,0)
                        end
                    else
                        if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                            v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((plr.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                        end
                    end
                else
                    if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end


LocationEsp = function() 
    for _,v in next, workspace["_WorldOrigin"].Locations:GetChildren() do
        pcall(function()
            if IslandESP then 
                if (v.Name ~= "Sea") then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.Code
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(98,252,252)
                        name.Text = (v.Name ..'   \n'.. round((plr.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((plr.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end


DevEsp = function()
    for i,v in next, workspace:GetChildren() do
        pcall(function()
            if DevilFruitESP then
                if string.find(v.Name, "Fruit") then   
                    if not v.Handle:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v.Handle)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.Code
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255,255,255)
                        name.Text = (v.Name ..' \n'.. round((plr.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                    else
                        v.Handle['NameEsp'..Number].TextLabel.Text = ('[' ..v.Name ..']' ..'   \n'.. round((plr.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('Handle') and v.Handle:FindFirstChild('NameEsp'..Number) then
                    v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end)
    end
end


flowerEsp = function()
    for i,v in pairs(workspace:GetChildren()) do
        pcall(function()
            if v.Name == "Flower2" or v.Name == "Flower1" then
                if FlowerESP then 
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.Code
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(88, 214, 252)
                        if v.Name == "Flower1" then 
                            name.Text = ("Blue Flower" ..' \n'.. round((plr.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        elseif v.Name == "Flower2" then
                            name.Text = ("Red Flower" ..' \n'.. round((plr.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((plr.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                else
                    if v:FindFirstChild('NameEsp'..Number) then
                        v:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end   
        end)
    end
end


EventIslandEsp = function()
    for i, v in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
        pcall(function()
            if EspEventIsland then
                if (v.Name == "Mirage Island" or v.Name =="Prehistoric Island" or v.Name =="Kitsune Island") then
                    if not v:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        name.Text = (v.Name .. "   \n" .. round((plr.Character.Head.Position - v.Position).Magnitude / 3) .. " M")
                    else
                        v.NameEsp.TextLabel.Text = v.Name .. "   \n" .. round((plr.Character.Head.Position - v.Position).Magnitude / 3) .. " M"
                    end
                end
            else
                if v:FindFirstChild("NameEsp") then
                    v:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end


gearEsp = function()
    for _,v in pairs(workspace.Map:FindFirstChild("MysticIsland") and workspace.Map.MysticIsland:GetDescendants() or {}) do
        pcall(function()
            if ESPGear then
                if v.Name == "Part" and v.Material == Enum.Material.Neon then
                    if not v:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        name.Text = ("Gear" .."   \n" .. round((plr.Character.Head.Position - v.Position).Magnitude / 3).. " M")
                    else
                        v["NameEsp"].TextLabel.Text =("Gear" .."   \n" .. round((plr.Character.Head.Position - v.Position).Magnitude / 3).. " M")
                    end
                end
            else
                if v:FindFirstChild("NameEsp") then
                    v:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end


AdvanFruitEsp = function()
    if advanEsp then     
        for _,v in pairs(replicated.NPCs:GetChildren()) do
            if v.Name == "Advanced Fruit Dealer" then
                if not workspace:FindFirstChild("Adv") then
                    Adv = Instance.new("Part")
                    Adv.Name = "Adv"
                    Adv.Transparency = 1
                    Adv.Size = Vector3.new(1,1,1)
                    Adv.Anchored = true
                    Adv.CanCollide = false
                    Adv.Parent = workspace
                    Adv.CFrame = v.HumanoidRootPart.CFrame    
                elseif workspace:FindFirstChild("Adv") then
                    if not Adv:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", Adv)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = Adv
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        name.Text = (v.Name .."   \n" ..round((plr.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude /3) .." M")
                    else
                        Adv["NameEsp"].TextLabel.Text = (v.Name .."   \n" ..round((plr.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude /3) .." M")    
                    end                              
                end
            end
        end
    else
        if workspace:FindFirstChild("Adv") then
            workspace:FindFirstChild("Adv"):Destroy()
        end    
    end
end


HakiClorEsp = function()
    if ColorEsp then     
        for _,v in pairs(replicated.NPCs:GetChildren()) do
            if v.Name == "Barista Cousin" then
                if not workspace:FindFirstChild("Gay") then
                    Gay = Instance.new("Part")
                    Gay.Name = "Gay"
                    Gay.Transparency = 1
                    Gay.Size = Vector3.new(1,1,1)
                    Gay.Anchored = true
                    Gay.CanCollide = false
                    Gay.Parent = workspace
                    Gay.CFrame = v.HumanoidRootPart.CFrame    
                elseif workspace:FindFirstChild("Gay") then
                    if not Gay:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", Gay)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = Gay
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        name.Text = (v.Name .."   \n" ..round((plr.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude /3) .." M")
                    else
                        Gay["NameEsp"].TextLabel.Text = (v.Name .."   \n" ..round((plr.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude /3) .." M")    
                    end                              
                end
            end
        end
    else
        if workspace:FindFirstChild("Gay") then
            workspace:FindFirstChild("Gay"):Destroy()
        end    
    end
end


LegenSword = function()
    if LegenS then     
        for _,v in pairs(replicated.NPCs:GetChildren()) do
            if v.Name == "Legendary Sword Dealer" then
                if not workspace:FindFirstChild("Lgd") then
                    Lgd = Instance.new("Part")
                    Lgd.Name = "Lgd"
                    Lgd.Transparency = 1
                    Lgd.Size = Vector3.new(1,1,1)
                    Lgd.Anchored = true
                    Lgd.CanCollide = false
                    Lgd.Parent = workspace
                    Lgd.CFrame = v.HumanoidRootPart.CFrame    
                elseif workspace:FindFirstChild("Lgd") then
                    if not Lgd:FindFirstChild("NameEsp") then
                        local bill = Instance.new("BillboardGui", Lgd)
                        bill.Name = "NameEsp"
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = Lgd
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        name.Text = (v.Name .."   \n" ..round((plr.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude /3) .." M")
                    else
                        Lgd["NameEsp"].TextLabel.Text = (v.Name .."   \n" ..round((plr.Character.Head.Position - v.HumanoidRootPart.Position).Magnitude /3) .." M")    
                    end                              
                end
            end
        end
    else
        if workspace:FindFirstChild("Lgd") then
            workspace:FindFirstChild("Lgd"):Destroy()
        end    
    end
end


ChestEsp = function()
    if ChestESP then
        local CollectionService = game:GetService("CollectionService")
        local Chests = CollectionService:GetTagged("_ChestTagged")        
        for _, Chest in ipairs(Chests) do
            pcall(function()
                local chestPos = Chest:GetPivot().Position
                local distanceMagnitude = (chestPos - plr.Character.Head.Position).Magnitude
                local sanitizedFullName = Chest:GetFullName():gsub("[^%w_]", "_")
                local existingEsp = Chest:FindFirstChild("ChestEspAttachment")                    
                
                if not existingEsp then
                    local attachment = Instance.new("Attachment")
                    attachment.Name = "ChestEspAttachment"
                    attachment.Parent = Chest
                    attachment.Position = Vector3.new(0, 3, 0)                     
                    
                    local nameEsp = Instance.new("BillboardGui")
                    nameEsp.Name = "NameEsp"
                    nameEsp.Size = UDim2.new(0, 200, 0, 30)
                    nameEsp.Adornee = attachment
                    nameEsp.ExtentsOffset = Vector3.new(0, 1, 0)
                    nameEsp.AlwaysOnTop = true
                    nameEsp.Parent = attachment                        
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Font = Enum.Font.Code
                    nameLabel.TextSize = 14
                    nameLabel.TextWrapped = true
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.TextYAlignment = Enum.TextYAlignment.Top
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                    nameLabel.Parent = nameEsp
                end
                
                local nameEsp = existingEsp and existingEsp:FindFirstChild("NameEsp")
                if nameEsp then
                    local displayDistance = math.floor(distanceMagnitude / 3)
                    local chestName = Chest.Name:gsub("Label", "")
                    nameEsp.TextLabel.Text = string.format("[%s] %d M", chestName, displayDistance)
                end
            end)
        end
    else
        for _, Chest in ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
            local espAttachment = Chest:FindFirstChild("ChestEspAttachment")
            if espAttachment then
                espAttachment:Destroy()
            end
        end
    end
end


berriesEsp = function()
    if BerryEsp then
        local CollectionService = game:GetService("CollectionService")
        local BerryBushes = CollectionService:GetTagged("BerryBush")
        for _, Bush in ipairs(BerryBushes) do
            pcall(function()
                local bushPosition = Bush.Parent:GetPivot().Position
                for _, BerryName in pairs(Bush:GetAttributes()) do
                    if BerryName then
                        local espPartName = "BerryEspPart_" .. BerryName .. "_" .. tostring(bushPosition)
                        local existingEsp = workspace:FindFirstChild(espPartName)
                        
                        if not existingEsp then
                            existingEsp = Instance.new("Part")
                            existingEsp.Name = espPartName
                            existingEsp.Transparency = 1
                            existingEsp.Size = Vector3.new(1, 1, 1)
                            existingEsp.Anchored = true
                            existingEsp.CanCollide = false
                            existingEsp.Parent = workspace
                            existingEsp.CFrame = CFrame.new(bushPosition)
                        end
                        
                        if not existingEsp:FindFirstChild("NameEsp") then
                            local nameEsp = Instance.new("BillboardGui", existingEsp)
                            nameEsp.Name = "NameEsp"
                            nameEsp.ExtentsOffset = Vector3.new(0, 1, 0)
                            nameEsp.Size = UDim2.new(0, 200, 0, 30)
                            nameEsp.Adornee = existingEsp
                            nameEsp.AlwaysOnTop = true
                            
                            local nameLabel = Instance.new("TextLabel", nameEsp)
                            nameLabel.Font = Enum.Font.Code
                            nameLabel.TextSize = 14
                            nameLabel.TextWrapped = true
                            nameLabel.Size = UDim2.new(1, 0, 1, 0)
                            nameLabel.TextYAlignment = Enum.TextYAlignment.Top
                            nameLabel.BackgroundTransparency = 1
                            nameLabel.TextStrokeTransparency = 0.5
                            nameLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                        end
                        
                        local nameEsp = existingEsp:FindFirstChild("NameEsp")
                        local distance = (plr.Character.Head.Position - bushPosition).Magnitude / 3
                        if nameEsp then
                            nameEsp.TextLabel.Text = ('[' .. BerryName .. ']' .. " " .. math.round(distance) .. " M")
                        end
                    end
                end
            end)
        end
    else
        for _, v in ipairs(workspace:GetChildren()) do
            if v:IsA("Part") and v.Name:match("BerryEspPart_.*") then
                v:Destroy()
            end
        end
    end
end


Tabs.Esp:AddToggle({
    Name = "Esp Berry",
    Description = "",
    Default = false,
    Callback = function(Value)
        BerryEsp = Value
        if not Value then
            for _, v in ipairs(workspace:GetChildren()) do
                if v:IsA("Part") and v.Name:match("BerryEspPart_.*") then
                    v:Destroy()
                end
            end
        else
            task.spawn(function()
                while BerryEsp do
                    berriesEsp()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp Player",
    Description = "",
    Default = false,
    Callback = function(Value)
        PlayerEsp = Value
        if not Value then
            for _,v in next, game.Players:GetChildren() do
                pcall(function()
                    if not isnil(v.Character) and not isnil(v.Character.Head) then
                        if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                            v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                        end
                    end
                end)
            end
        else
            task.spawn(function()
                while PlayerEsp do
                    EspPly()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp Chest",
    Description = "",
    Default = false,
    Callback = function(Value)
        ChestESP = Value
        if not Value then
            for _, Chest in ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
                local espAttachment = Chest:FindFirstChild("ChestEspAttachment")
                if espAttachment then
                    espAttachment:Destroy()
                end
            end
        else
            task.spawn(function()
                while ChestESP do
                    ChestEsp()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp Fruit",
    Description = "",
    Default = false,
    Callback = function(Value)
        DevilFruitESP = Value
        if not Value then
            for i,v in next, workspace:GetChildren() do
                pcall(function()
                    if v:FindFirstChild('Handle') and v.Handle:FindFirstChild('NameEsp'..Number) then
                        v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end)
            end
        else
            task.spawn(function()
                while DevilFruitESP do
                    DevEsp()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp Island",
    Description = "",
    Default = false,
    Callback = function(Value)
        IslandESP = Value
        if not Value then
            for _,v in next, workspace["_WorldOrigin"].Locations:GetChildren() do
                pcall(function()
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end)
            end
        else
            task.spawn(function()
                while IslandESP do
                    LocationEsp()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp Flower",
    Description = "",
    Default = false,
    Callback = function(Value)
        FlowerESP = Value
        if not Value then
            for i,v in pairs(workspace:GetChildren()) do
                pcall(function()
                    if (v.Name == "Flower2" or v.Name == "Flower1") and v:FindFirstChild('NameEsp'..Number) then
                        v:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end)
            end
        else
            task.spawn(function()
                while FlowerESP do
                    flowerEsp()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp Legendary Sword",
    Description = "",
    Default = false,
    Callback = function(Value)
        LegenS = Value
        if not Value then
            if workspace:FindFirstChild("Lgd") then
                workspace:FindFirstChild("Lgd"):Destroy()
            end
        else
            task.spawn(function()
                while LegenS do
                    LegenSword()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp Haki Color",
    Description = "",
    Default = false,
    Callback = function(Value)
        ColorEsp = Value
        if not Value then
            if workspace:FindFirstChild("Gay") then
                workspace:FindFirstChild("Gay"):Destroy()
            end
        else
            task.spawn(function()
                while ColorEsp do
                    HakiClorEsp()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp Gear",
    Description = "",
    Default = false,
    Callback = function(Value)
        ESPGear = Value
        if not Value then
            for _,v in pairs(workspace.Map:FindFirstChild("MysticIsland") and workspace.Map.MysticIsland:GetDescendants() or {}) do
                pcall(function()
                    if v:FindFirstChild("NameEsp") then
                        v:FindFirstChild("NameEsp"):Destroy()
                    end
                end)
            end
        else
            task.spawn(function()
                while ESPGear do
                    gearEsp()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp SeaEvent Island",
    Description = "",
    Default = false,
    Callback = function(Value)
        EspEventIsland = Value
        if not Value then
            for i, v in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
                pcall(function()
                    if v:FindFirstChild("NameEsp") then
                        v:FindFirstChild("NameEsp"):Destroy()
                    end
                end)
            end
        else
            task.spawn(function()
                while EspEventIsland do
                    EventIslandEsp()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Esp:AddToggle({
    Name = "Esp Advanced Dealer",
    Description = "",
    Default = false,
    Callback = function(Value)
        advanEsp = Value
        if not Value then
            if workspace:FindFirstChild("Adv") then
                workspace:FindFirstChild("Adv"):Destroy()
            end
        else
            task.spawn(function()
                while advanEsp do
                    AdvanFruitEsp()
                    task.wait()
                end
            end)
        end
    end
})

Tabs.Raids:AddSection("Fruits Options")

local function formatNumber(number)
    local str = tostring(number)
    repeat
        local replaced, count = str:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
        str = replaced
    until count == 0
    return str
end

local function getFruitStock()
    local resultStr = "Advance Fruit Stock\n"
    local success, advanceFruits = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", true)
    end)

    if not success or not advanceFruits then
        resultStr = resultStr .. "- Error while retrieving data.\n"
    else
        local hasFruit = false
        for _, fruit in pairs(advanceFruits) do
            if fruit.OnSale then
                hasFruit = true
                resultStr = resultStr .. fruit.Name .. " - $" .. formatNumber(fruit.Price) .. "\n"
            end
        end
        if not hasFruit then
            resultStr = resultStr .. "- No fruit.\n"
        end
    end

    resultStr = resultStr .. "\nNormal Fruit Stock\n"
    local success2, normalFruits = pcall(function()
        return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
    end)

    if success2 and normalFruits then
        local hasFruit = false
        for _, fruit in pairs(normalFruits) do
            if fruit.OnSale then
                hasFruit = true
                resultStr = resultStr .. fruit.Name .. " - $" .. formatNumber(fruit.Price) .. "\n"
            end
        end
        if not hasFruit then
            resultStr = resultStr .. "- No fruit.\n"
        end
    else
        resultStr = resultStr .. "- Error while retrieving data.\n"
    end

    return resultStr
end

local stockParagraph = Tabs.Raids:AddParagraph("Stock Fruit", "Loading...")

task.spawn(function()
    while task.wait(60) do
        pcall(function()
            stockParagraph:SetDesc(getFruitStock())
        end)
    end
end)

pcall(function()
    stockParagraph:SetDesc(getFruitStock())
end)


RandomFF = Tabs.Raids:AddToggle({
Name = "Auto Random Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Random_Auto = Value
end})
spawn(function()
  while wait(Sec) do
   	pcall(function()
      if _G.Random_Auto then replicated.Remotes.CommF_:InvokeServer("Cousin","Buy") end 
    end)
  end
end)
DropF = Tabs.Raids:AddToggle({
Name = "Auto Drop Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.DropFruit = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.DropFruit then
      pcall(function() DropFruits() end)
    end
  end
end)
StoredF = Tabs.Raids:AddToggle({
Name = "Auto Store Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.StoreF = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.StoreF then
      pcall(function() UpdStFruit() end)
    end
  end
end)
TwF = Tabs.Raids:AddToggle({
Name = "Auto Tween to Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TwFruits = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.TwFruits then
      pcall(function()
        for _,x1 in pairs(workspace:GetChildren()) do
	    if string.find(x1.Name, "Fruit") then _tp(x1.Handle.CFrame) end
	    end
      end)
    end
  end
end)
BringF = Tabs.Raids:AddToggle({
Name = "Auto Collect Fruit", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.InstanceF = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.InstanceF then
      pcall(function() collectFruits(_G.InstanceF) end)
    end
  end
end)

Tabs.Raids:AddDropdown({
    Name = "Select Fruit Shop",
    Options = {
        "Rocket-Rocket", "Spin-Spin", "Blade-Blade", "Spring-Spring",
        "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame",
        "Ice-Ice", "Sand-Sand", "Dark-Dark", "Eagle-Eagle",
        "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Ghost-Ghost",
        "Magma-Magma", "Quake-Quake", "Buddha-Buddha", "Love-Love",
        "Creation-Creation", "Spider-Spider", "Sound-Sound", "Phoenix-Phoenix",
        "Portal-Portal", "Lightning-Lightning", "Pain-Pain", "Blizzard-Blizzard",
        "Gravity-Gravity", "T-Rex-T-Rex", "Mammoth-Mammoth", "Dough-Dough",
        "Shadow-Shadow", "Venom-Venom", "Gas-Gas", "Control-Control",
        "Spirit-Spirit", "Leopard-Leopard", "Yeti-Yeti", "Kitsune-Kitsune",
        "Dragon-Dragon"
    },
    Callback = function(Value)
        getgenv().SelectFruit = Value
    end
})
Tabs.Raids:AddToggle({
    Name = "Auto Buy Fruit Shop",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBuyFruitSniper = Value
    end
})
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoBuyFruitSniper then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", getgenv().SelectFruit)
            end
        end
    end)
end)

Tabs.Raids:AddSection("Dungeon Event / Raiding")
DungeonTables = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"}
Q = Tabs.Raids:AddDropdown({
Name = "Select Chip",
Description = "",
Options = DungeonTables,
Callback = function(Value)
  _G.SelectChip = Value
end})
Q = Tabs.Raids:AddToggle({
Name = "Auto Select Dungeon Chip", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoSelectDungeon = Value
end})
Tabs.Raids:AddToggle({
    Name = "Get Fruit In Inventory Below 1M",
    Default = false,
    Callback = function(Value)
        getgenv().AutoGetFruit = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AutoGetFruit then
                local fruits = {
                    "Rocket-Rocket", "Spin-Spin", "Chop-Chop", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke",
                    "Spike-Spike", "Flame-Flame", "Falcon-Falcon", "Ice-Ice", "Sand-Sand", "Dark-Dark",
                    "Ghost-Ghost", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Barrier-Barrier"
                }
                for _, fruit in ipairs(fruits) do
                    local args = {
                        [1] = "LoadFruit",
                        [2] = fruit
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)
    end
end)
Tabs.Raids:AddButton({
Name = "Buy Dungeon Chips [Beli]", 
Description = "",
Callback = function()
  if not GetBP("Special Microchip") then replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip) end
end})
Tabs.Raids:AddButton({
Name = "Buy Dungeon Chips [Devil Fruit]", 
Description = "",
Callback = function()
  if GetBP("Special Microchip") then return end
  local FruitPrice = {}
  local FruitStore = {}
  for i,v in next,replicated:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
    if v.Price <= 490000 then table.insert(FruitPrice,v.Name) end 
  end    
  for _,y in pairs(FruitPrice) do    
    for i,v in pairs(DungeonTables) do 
      if not GetBP("Special Microchip") then     
        replicated.Remotes.CommF_:InvokeServer("LoadFruit",tostring(y))	      
	    replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)	
	  end            
    end    
  end
end})


AutoChipBeli = Tabs.Raids:AddToggle({
    Name = "Auto Buy Chip [Beli]",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.AutoChipBeli = Value
end
})

task.spawn(function()
    while task.wait(1) do
        if _G.AutoChipBeli then
            pcall(function()
                if not GetBP("Special Microchip") then
                    replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                end
            end)
        end
    end
end)


AutoChipFruit = Tabs.Raids:AddToggle({
    Name = "Auto Buy Chip [Devil Fruit]",
    Description = "",
    Default = false,
    Callback = function(Value)
    _G.AutoChipFruit = Value
end
})

task.spawn(function()
    while task.wait(1) do
        if _G.AutoChipFruit then
            pcall(function()
                if not GetBP("Special Microchip") then
                    local fruits = replicated.Remotes.CommF_:InvokeServer("GetFruits")
                    local cheapest = nil
                    for _, data in pairs(fruits) do
                        if data.Price <= 490000 then
                            cheapest = data.Name
                            break
                        end
                    end
                    if cheapest then
                        replicated.Remotes.CommF_:InvokeServer("LoadFruit", tostring(cheapest))
                        replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                    end
                end
            end)
        end
    end
end)


do
    local function IsInFruitRaid()
        local pGui = plr:FindFirstChild("PlayerGui")
        local main = pGui and pGui:FindFirstChild("Main")
        local top = main and main:FindFirstChild("TopHUDList")
        if top and top:FindFirstChild("RaidTimer") and top.RaidTimer.Visible then
            return true
        end
        if main and main:FindFirstChild("Timer") and main.Timer.Visible then
            return true
        end
        local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
        local locs = worldOrigin and worldOrigin:FindFirstChild("Locations")
        if locs and (locs:FindFirstChild("Island 1") or locs:FindFirstChild("Island 2") or locs:FindFirstChild("Island 3") or locs:FindFirstChild("Island 4") or locs:FindFirstChild("Island 5")) then
            local char = plr.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, name in ipairs({"Island 1","Island 2","Island 3","Island 4","Island 5"}) do
                    local node = locs:FindFirstChild(name)
                    if node and (hrp.Position - node.Position).Magnitude < 1000 then
                        return true
                    end
                end
            end
        end
        return false
    end

    local function FireRaidActivators(model)
        if not model then return false end
        local fired = false
        local btn = (model:FindFirstChild("Button") and model.Button:FindFirstChild("Main")) or model:FindFirstChild("Button") or model
        local cd = (btn and (btn:FindFirstChildWhichIsA("ClickDetector", true) or (btn:IsA("ClickDetector") and btn))) or model:FindFirstChildWhichIsA("ClickDetector", true)
        if cd then
            pcall(function() fireclickdetector(cd) end)
            fired = true
        end
        local prompt = (btn and (btn:FindFirstChildWhichIsA("ProximityPrompt", true) or (btn:IsA("ProximityPrompt") and btn))) or model:FindFirstChildWhichIsA("ProximityPrompt", true)
        if prompt then
            pcall(function() fireproximityprompt(prompt, math.huge) end)
            pcall(function() fireproximityprompt(prompt, 0) end)
            pcall(function() fireproximityprompt(prompt) end)
            fired = true
        end
        for _, desc in ipairs(model:GetDescendants()) do
            if desc:IsA("ClickDetector") then
                pcall(function() fireclickdetector(desc) end)
                fired = true
            elseif desc:IsA("ProximityPrompt") then
                pcall(function() fireproximityprompt(desc, math.huge) end)
                pcall(function() fireproximityprompt(desc, 0) end)
                fired = true
            end
        end
        return fired
    end

    local function StartRaidRoutine(isManual)
        if IsInFruitRaid() then return false end

        local char = plr.Character
        local bp = plr:FindFirstChild("Backpack")
        local chip = (char and char:FindFirstChild("Special Microchip")) or (bp and bp:FindFirstChild("Special Microchip"))
        if not chip then return false end

        if bp and bp:FindFirstChild("Special Microchip") and char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):EquipTool(bp["Special Microchip"])
            task.wait(0.1)
        end

        local isW3 = World3 or sea3 or (game.PlaceId == 7449423635 or game.PlaceId == 100117331123089) or (workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Boat Castle"))
        local isW2 = World2 or sea2 or (game.PlaceId == 4442272183 or game.PlaceId == 79091703265657) or (workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("CircleIsland"))

        if isW3 then
            pcall(function()
                replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
            end)
        end

        local standCF = isW3 and CFrame.new(-5017.40869, 314.844055, -2823.0127) or CFrame.new(-6438.73535, 250.645355, -4501.50684)

        local map = workspace:FindFirstChild("Map")
        local raidModel = nil
        if map then
            if isW3 and map:FindFirstChild("Boat Castle") and map["Boat Castle"]:FindFirstChild("RaidSummon2") then
                raidModel = map["Boat Castle"].RaidSummon2
            elseif isW2 and map:FindFirstChild("CircleIsland") and map.CircleIsland:FindFirstChild("RaidSummon2") then
                raidModel = map.CircleIsland.RaidSummon2
            else
                for _, obj in ipairs(map:GetDescendants()) do
                    if obj.Name == "RaidSummon2" then
                        raidModel = obj
                        break
                    end
                end
            end
        end

        if raidModel and raidModel:FindFirstChild("MainRaid") then
            local mr = raidModel.MainRaid
            if mr:IsA("BasePart") then
                standCF = mr.CFrame * CFrame.new(0, 1.5, 0)
            end
        end

        local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local dist = (hrp.Position - standCF.Position).Magnitude
            if dist > 20 then
                if isManual then
                    pcall(function()
                        if CanBypassTeleport and CanBypassTeleport(standCF) then
                            BypassTP(standCF)
                        end
                    end)
                    old_tp(standCF)
                    task.wait(0.2)
                else
                    _tp(standCF)
                    return false
                end
            end
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                plr.Character.HumanoidRootPart.CFrame = standCF
            end
        end

        if plr:FindFirstChild("Backpack") and plr.Backpack:FindFirstChild("Special Microchip") and plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            plr.Character:FindFirstChildOfClass("Humanoid"):EquipTool(plr.Backpack["Special Microchip"])
            task.wait(0.1)
        end

        FireRaidActivators(raidModel)

        if isW2 then
            pcall(function()
                local m = workspace.Map.CircleIsland.RaidSummon2.Button.Main
                if m:FindFirstChild("ClickDetector") then fireclickdetector(m.ClickDetector) end
                if m:FindFirstChild("ProximityPrompt") then fireproximityprompt(m.ProximityPrompt, math.huge) end
            end)
        elseif isW3 then
            pcall(function()
                local m = workspace.Map["Boat Castle"].RaidSummon2.Button.Main
                if m:FindFirstChild("ClickDetector") then fireclickdetector(m.ClickDetector) end
                if m:FindFirstChild("ProximityPrompt") then fireproximityprompt(m.ProximityPrompt, math.huge) end
            end)
        end
        return true
    end

    Tabs.Raids:AddButton({
        Name = "Start Raid (1-Click)",
        Description = "Equips chip, goes to raid tube & starts raid",
        Callback = function()
            task.spawn(function()
                pcall(function()
                    StartRaidRoutine(true)
                end)
            end)
        end
    })

    StartR = Tabs.Raids:AddToggle({
        Name = "Auto Start Raid",
        Description = "Automatically goes to chamber & starts raid when chip is owned",
        Default = false,
        Callback = function(Value)
            _G.Auto_StartRaid = Value
        end
    })

    task.spawn(function()
        while task.wait(0.5) do
            if _G.Auto_StartRaid then
                pcall(function()
                    StartRaidRoutine(false)
                end)
            end
        end
    end)
end

Raiding = Tabs.Raids:AddToggle({
    Name = "Auto Raid + Next Island",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.Raiding = Value
    end
})

spawn(function()
    local locations = workspace["_WorldOrigin"].Locations
    local islands = {"Island 1","Island 2","Island 3","Island 4","Island 5"}
    local currentIsland = nil

    while task.wait(0.3) do
        if not _G.Raiding then continue end
         

        local top = plr:FindFirstChild("PlayerGui") and plr.PlayerGui:FindFirstChild("Main") and plr.PlayerGui.Main:FindFirstChild("TopHUDList")
        local gui = top and top:FindFirstChild("RaidTimer")
        if not gui or not gui.Visible then continue end

        local char = plr.Character
        if not char then continue end

        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not root or not hum or hum.Health <= 0 then continue end
        if hum.Sit or hum.PlatformStand or root.Anchored then continue end


        local closestDist = 999999
        for _,name in ipairs(islands) do
            local loc = locations:FindFirstChild(name)
            if loc then
                local dist = (root.Position - loc.Position).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    currentIsland = name
                end
            end
        end

        if not currentIsland then continue end
        local islandPos = locations:FindFirstChild(currentIsland)
        if not islandPos then continue end


        local foundEnemies = false
        for _,mob in ipairs(workspace.Enemies:GetChildren()) do
            local eh = mob:FindFirstChild("Humanoid")
            local ehrp = mob:FindFirstChild("HumanoidRootPart")
            if eh and ehrp and eh.Health > 0 then
                if (ehrp.Position - islandPos.Position).Magnitude < 450 then
                    foundEnemies = true
                    repeat
                        task.wait()
                        Attack.Kill(mob, _G.Raiding)
                    until not _G.Raiding or not mob.Parent or eh.Health <= 0
                end
            end
        end


        if not foundEnemies then
            local idx = table.find(islands, currentIsland)
            if idx and islands[idx+1] then
                local nxt = locations:FindFirstChild(islands[idx+1])
                if nxt then
              
                    local safePos = nxt.CFrame * CFrame.new(0, 45, 120)
                    _tp(safePos)
                end
                currentIsland = islands[idx+1]
                task.wait(1)
            end
        end
    end
end)

Tabs.Raids:AddToggle({
Name = "Auto Awakening", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Auto_Awakener = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.Auto_Awakener then
        replicated.Remotes.CommF_:InvokeServer("Awakener","Check")
        replicated.Remotes.CommF_:InvokeServer("Awakener","Awaken")
      end
    end)
  end
end)	

Tabs.Raids:AddToggle({
    Name = "Auto Teleport To Lab",
    Default = false,
    Callback = function(Value)
        _G.TpLab = Value
        StopTween(_G.TpLab)
        while _G.TpLab do
            wait()
            if _G.TpLab then
                if World2 and _G.TpLab then
                    topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                elseif World3 and _G.TpLab then
                    topos(CFrame.new(-5017.40869, 314.844055, -2823.0127,-0.925743818, 4.48217499e-08, -0.378151238,4.55503146e-09, 1, 1.07377559e-07,0.378151238, 9.7681621e-08, -0.925743818))
                end
            end
        end
    end
})

Tabs.Raids:AddSection("Items Law/Order Sword")

Tabs.Raids:AddButton({
Name = "Buy Microchip Law", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
end})
Tabs.Raids:AddButton({
Name = "Start Law Raids", 
Description = "",
Callback = function()
  local char = plr.Character
  local bp = plr:FindFirstChild("Backpack")
  local chip = (bp and bp:FindFirstChild("Microchip")) or (char and char:FindFirstChild("Microchip"))
  if chip and bp and bp:FindFirstChild("Microchip") and char and char:FindFirstChildOfClass("Humanoid") then
      char:FindFirstChildOfClass("Humanoid"):EquipTool(bp["Microchip"])
      task.wait(0.1)
  end
  local standCF = CFrame.new(-6438.73535, 250.645355, -4501.50684)
  if char and char:FindFirstChild("HumanoidRootPart") then
      char.HumanoidRootPart.CFrame = standCF
  end
  local m = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("CircleIsland") and workspace.Map.CircleIsland:FindFirstChild("RaidSummon") and workspace.Map.CircleIsland.RaidSummon:FindFirstChild("Button") and workspace.Map.CircleIsland.RaidSummon.Button:FindFirstChild("Main")
  if m then
      if m:FindFirstChild("ClickDetector") then pcall(function() fireclickdetector(m.ClickDetector) end) end
      if m:FindFirstChild("ProximityPrompt") then pcall(function() fireproximityprompt(m.ProximityPrompt, math.huge) end) end
  end
end})

Tabs.Raids:AddToggle({
    Name = "Auto Buy Microchip Law", 
    Description = "",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBuyMicrochipLaw = Value
    end
})

spawn(function()
    while task.wait(1) do  
        if getgenv().AutoBuyMicrochipLaw then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
            end)
        end
    end
end)

Tabs.Raids:AddToggle({
    Name = "Auto Start Law Raids", 
    Description = "",
    Default = false,
    Callback = function(Value)
        getgenv().AutoStartLawRaids = Value
    end
})

spawn(function()
    while task.wait(1) do  
        if getgenv().AutoStartLawRaids then
            pcall(function()
                local char = plr.Character
                local bp = plr:FindFirstChild("Backpack")
                local chip = (bp and bp:FindFirstChild("Microchip")) or (char and char:FindFirstChild("Microchip"))
                if not chip then return end
                if bp and bp:FindFirstChild("Microchip") and char and char:FindFirstChildOfClass("Humanoid") then
                    char:FindFirstChildOfClass("Humanoid"):EquipTool(bp["Microchip"])
                    task.wait(0.1)
                end
                local standCF = CFrame.new(-6438.73535, 250.645355, -4501.50684)
                if char and char:FindFirstChild("HumanoidRootPart") then
                    if (char.HumanoidRootPart.Position - standCF.Position).Magnitude > 20 then
                        _tp(standCF)
                        return
                    end
                    char.HumanoidRootPart.CFrame = standCF
                end
                local m = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("CircleIsland") and workspace.Map.CircleIsland:FindFirstChild("RaidSummon") and workspace.Map.CircleIsland.RaidSummon:FindFirstChild("Button") and workspace.Map.CircleIsland.RaidSummon.Button:FindFirstChild("Main")
                if m then
                    if m:FindFirstChild("ClickDetector") then pcall(function() fireclickdetector(m.ClickDetector) end) end
                    if m:FindFirstChild("ProximityPrompt") then pcall(function() fireproximityprompt(m.ProximityPrompt, math.huge) end) end
                end
            end)
        end
    end
end)

Tabs.Raids:AddToggle({
Name = "Auto Kill Law", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.AutoLawKak = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.AutoLawKak then
      pcall(function()
        local v = GetConnectionEnemies("Order")
        if v then repeat task.wait() Attack.Kill(v, _G.AutoLawKak) until _G.AutoLawKak == false or not v.Parent or v.Humanoid.Health <= 0
        else _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
        end
      end)
    end
  end
end)

Tabs.Raids:AddSection("Raids Dungeons")

do
local plr = game.Players.LocalPlayer

local function GetHRP()
    local char = plr.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

Tabs.Raids:AddToggle({
    Name = "Auto Farm Dungeon",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmDungeon = Value
    end
})

local FARM_RANGE = 5000

spawn(function()
    while task.wait(0.15) do
        if not _G.AutoFarmDungeon then continue end

        pcall(function()
            local plr = game.Players.LocalPlayer
            local char = plr.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if not hrp or not hum or hum.Health <= 0 then return end

            for _, mob in pairs(workspace.Enemies:GetChildren()) do
                if not _G.AutoFarmDungeon then break end

                local mh = mob:FindFirstChild("Humanoid")
                local mhrp = mob:FindFirstChild("HumanoidRootPart")

                if mh and mhrp and mh.Health > 0 then
                    local dist = (mhrp.Position - hrp.Position).Magnitude
                    if dist <= FARM_RANGE then
                        repeat
                            task.wait()
                            Attack.Kill(mob, true)
                        until not _G.AutoFarmDungeon
                            or not mob.Parent
                            or mh.Health <= 0
                    end
                end
            end
        end)
    end
end)


Tabs.Raids:AddToggle({
    Name = "TP Exit (1)",
    Default = false,
    Callback = function(v)
        _G.TPFloor1 = v
    end
})


local tp1Done = false

local function GetCurrentFloor()
    local hrp = GetHRP()
    if not hrp then return end

    for _, floor in pairs(workspace.Map.Dungeon:GetChildren()) do
        local exit = floor:FindFirstChild("ExitTeleporter")
        if exit and exit:FindFirstChild("Root") then
            if (hrp.Position - exit.Root.Position).Magnitude < 200 then
                return exit.Root
            end
        end
    end
end

task.spawn(function()
    while task.wait(0.3) do
        if not _G.TPFloor1 then
            tp1Done = false
            continue
        end

        if not tp1Done then
            local root = GetCurrentFloor()
            if root then
                root = root.CFrame * CFrame.new(0,3,0)
                GetHRP().CFrame = root
                tp1Done = true
            end
        end
    end
end)

Tabs.Raids:AddToggle({
    Name = "TP Exit (2)",
    Default = false,
    Callback = function(v)
        _G.TPFloor2 = v
    end
})

local tp2Done = false

task.spawn(function()
    while task.wait(0.3) do
        if not _G.TPFloor2 then
            tp2Done = false
            continue
        end

        if tp2Done then continue end

        local hrp = GetHRP()
        if not hrp then continue end

        for _, floor in pairs(workspace.Map.Dungeon:GetChildren()) do
            local ent = floor:FindFirstChild("EntranceTeleporter")
            local ext = floor:FindFirstChild("ExitTeleporter")

            if ent and ext and ent:FindFirstChild("Root") and ext:FindFirstChild("Root") then
                if (hrp.Position - ent.Root.Position).Magnitude < 100 then
                    hrp.CFrame = ext.Root.CFrame * CFrame.new(0,3,0)
                    tp2Done = true
                    break
                end
            end
        end
    end
end)

Tabs.Raids:AddToggle({
    Name = "TP Exit (3)",
    Default = false,
    Callback = function(v)
        _G.TPFloor3 = v
    end
})

local tp3Done = false

local function GetHighestFloor()
    local max
    for _, floor in pairs(workspace.Map.Dungeon:GetChildren()) do
        local n = tonumber(floor.Name)
        if n and (not max or n > tonumber(max.Name)) then
            max = floor
        end
    end
    return max
end

task.spawn(function()
    while task.wait(0.3) do
        if not _G.TPFloor3 then
            tp3Done = false
            continue
        end

        if not tp3Done then
            local floor = GetHighestFloor()
            if floor and floor:FindFirstChild("ExitTeleporter")
            and floor.ExitTeleporter:FindFirstChild("Root") then

                GetHRP().CFrame =
                    floor.ExitTeleporter.Root.CFrame * CFrame.new(0,3,0)
                tp3Done = true
            end
        end
    end
end)

Tabs.Raids:AddToggle({
    Name = "TP Exit (4)",
    Default = false,
    Callback = function(v)
        _G.TPFloor4 = v
    end
})

local tp4Done = false

local function GetNearestExit()
    local hrp = GetHRP()
    if not hrp then return end

    local nearest, dist = nil, math.huge

    for _, floor in pairs(workspace.Map.Dungeon:GetChildren()) do
        local exit = floor:FindFirstChild("ExitTeleporter")
        if exit and exit:FindFirstChild("Root") then
            local d = (hrp.Position - exit.Root.Position).Magnitude
            if d < dist then
                dist = d
                nearest = exit.Root
            end
        end
    end
    return nearest
end

task.spawn(function()
    while task.wait(0.3) do
        if not _G.TPFloor4 then
            tp4Done = false
            continue
        end

        if not tp4Done then
            local root = GetNearestExit()
            if root then
                GetHRP().CFrame = root.CFrame * CFrame.new(0,3,0)
                tp4Done = true
            end
        end
    end
end)
end





Tabs.Combat:AddSection("Combat / AimBot")

local __indexPlayer = Tabs.Combat:AddParagraph("All Players On Server", "")

spawn(function()
    while wait(Sec) do
        pcall(function()
            local playerCount = #game:GetService("Players"):GetPlayers()
            if playerCount == 12 then
                __indexPlayer:SetDesc("All Players : " .. playerCount .. " / 12 [Max]")
            else
                __indexPlayer:SetDesc("All Players : " .. playerCount .. " / 12")
            end
        end)
    end
end)

local __AimBotTurn = Tabs.Combat:AddParagraph("Aimbot Status", "")

Checking_AimStatus = function()
    if _G.AimCam then
        return "Aimbot Camera"
    elseif _G.AimbotGun then
        return "Aimbot Guns"
    else
        return ""
    end
end

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.AimMethod then
                if (_G.AimCam or _G.AimbotGun) then
                    __AimBotTurn:SetDesc("Aimbot - " .. Checking_AimStatus() .. " : True")
                else
                    __AimBotTurn:SetDesc("Aimbot - Skills : True")
                end
            else
                __AimBotTurn:SetDesc("Aimbot - Skills : False")
            end
        end)
    end
end)


local PlrList = {}   
for _, v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(PlrList, v.Name)
end

Tabs.Combat:AddDropdown({
    Name = "Select Players",
    Description = "",
    Options = PlrList,
    Callback = function(Value)
        _G.PlayersList = Value
    end
})

Tabs.Combat:AddToggle({
    Name = "Teleport To Select Players",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.TpPly = Value
        spawn(function()
            pcall(function()
                while _G.TpPly do
                    wait()
                    _tp(game:GetService("Players")[_G.PlayersList].Character.HumanoidRootPart.CFrame)
                end
            end)
        end)
    end
})

Tabs.Combat:AddToggle({
    Name = "Spectate Select Players",
    Description = "",
    Default = false,
    Callback = function(Value)
        SpectatePlys = Value
        spawn(function()
            repeat
                task.wait(0.1)
                if game:GetService("Players"):FindFirstChild(_G.PlayersList) then
                    workspace.Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.PlayersList).Character.Humanoid
                end
            until not SpectatePlys
            workspace.Camera.CameraSubject = plr.Character.Humanoid
        end)
    end
})

Tabs.Combat:AddDropdown({
    Name = "Select Aim Method",
    Description = "",
    Options = {"Aim Player","Nearest Aim"},
    Callback = function(Value)
        ABmethod = Value
    end
})

Tabs.Combat:AddToggle({
    Name = "Aimbot Method Skills",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AimMethod = Value
    end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.AimMethod and ABmethod == "Aim Player" then
                local target = Players:FindFirstChild(getgenv().PlayersList)
                if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    if target.Team ~= plr.Team then
                        MousePos = target.Character.HumanoidRootPart.Position
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AimMethod and ABmethod == "Nearest Aim" then
                local MaxDistance = math.huge
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= plr and v.Team ~= plr.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local Distance = (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                        if Distance < MaxDistance then
                            MaxDistance = Distance
                            MousePos = v.Character.HumanoidRootPart.Position
                        end
                    end
                end
            end
        end)
    end
end)

Tabs.Combat:AddToggle({
    Name = "Aimbot Camera Closet Players",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AimCam = Value
    end
})

task.spawn(function()
    while task.wait(Sec) do
        pcall(function()
            if _G.AimCam then
                local camera = workspace.CurrentCamera
                closestplayer = function()
                    local dist = math.huge
                    local target = nil
                    for _, v in next, ply:GetPlayers() do
                        if v ~= plr then
                            if v.Character and v.Character:FindFirstChild("Head") and _G.AimCam and v.Character.Humanoid.Health > 0 then
                                local Mag = (v.Character.Head.Position - plr.Character.Head.Position).Magnitude
                                if Mag < dist then
                                    dist = Mag
                                    target = v
                                end
                            end
                        end
                    end
                    return target
                end
                repeat
                    task.wait()
                    camera.CFrame = CFrame.new(camera.CFrame.Position, closestplayer().Character.HumanoidRootPart.Position)
                until _G.AimCam == false or Mag > dist
            end
        end)
    end
end)

Tabs.Combat:AddSection("Quests Players")

Tabs.Combat:AddButton({
    Name = "Get player quests",
    Description = "",
    Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
        end)
    end
})

Tabs.Combat:AddToggle({
    Name = "Auto Get PlayerQuest",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoReceivePlayerQuest = Value
    end
})


spawn(function()
    while task.wait(1) do
        if _G.AutoReceivePlayerQuest then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
            end)
        end
    end
end)


Tabs.Combat:AddToggle({
    Name = "Auto Kill Player Quest", 
    Default = false,
    Callback = function(Value)
        _G.AutoPlayerHunter = Value
    end
})

spawn(function()
    while task.wait() do
        if _G.AutoPlayerHunter then
            if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                task.wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
            else
                for _, target in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, target.Name) then
                        repeat
                            task.wait()
                            if AutoHaki then AutoHaki() end
                            if EquipWeapon then EquipWeapon(_G.SelectWeapon) end
                            Useskill = true
                            
                            _tp(target.HumanoidRootPart.CFrame * CFrame.new(1, 7, 3))
                            
                            target.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                            
                        until _G.AutoPlayerHunter == false or target.Humanoid.Health <= 0
                        
                        Useskill = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                end
            end
        end
    end
end)





Tabs.Combat:AddToggle({
    Name = "Auto Enable PvP",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AutoPvP = Value
    end
})


spawn(function()
    while task.wait(0.5) do
        if _G.AutoPvP then
            local playerGui = game.Players.LocalPlayer.PlayerGui
            if playerGui and playerGui.Main and playerGui.Main:FindFirstChild("PvpDisabled") then
                if playerGui.Main.PvpDisabled.Visible then
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end)
                end
            end
        end
    end
end)

Tabs.Combat:AddToggle({
    Name = "Auto Safe Mode",
    Default = false,
    Callback = function(Value)
        _G.SafeMode = Value
    end
})

spawn(function()
    while task.wait(0.1) do
        if _G.SafeMode then
            local char = game.Players.LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            if hrp then
                local targetPos = hrp.CFrame * CFrame.new(0, 1000, 0)
                _tp(targetPos) 
            end
        end
    end
end)

Tabs.Combat:AddSection("LocalPlayer Settings")

do
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local flying = false
local flySpeed = 50
local flyConnection
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local bg, bv

local function setupMobileControls()
    local function updateControlsFromJoystick()
        local character = player.Character
        if not character then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        local moveDirection = humanoid.MoveDirection
        
        ctrl.f = 0
        ctrl.b = 0
        ctrl.l = 0
        ctrl.r = 0
        
        if moveDirection.Z < -0.1 then
            ctrl.f = 1
        elseif moveDirection.Z > 0.1 then
            ctrl.b = 1
        end
        
        if moveDirection.X < -0.1 then
            ctrl.l = 1
        elseif moveDirection.X > 0.1 then
            ctrl.r = 1
        end
    end
    
    local controlConnection
    controlConnection = RunService.Heartbeat:Connect(function()
        if flying then
            updateControlsFromJoystick()
        else
            if controlConnection then
                controlConnection:Disconnect()
            end
        end
    end)
end

local function toggleFly(value)
    flying = value
    
    if flying then
        if not player.Character then return end
        
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        local rootPart
        
        if player.Character:FindFirstChild("Torso") then
            rootPart = player.Character.Torso
        else
            rootPart = player.Character.UpperTorso
        end
        
        if not humanoid or not rootPart then return end
        
    
        for _, part in ipairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
                part.Massless = true
            end
        end
        
      
        local descendantAddedConnection
        descendantAddedConnection = player.Character.DescendantAdded:Connect(function(descendant)
            if flying and descendant:IsA("BasePart") then
                descendant.CanCollide = false
                descendant.Massless = true
            end
        end)
        
        bg = Instance.new("BodyGyro", rootPart)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = rootPart.CFrame
        
        bv = Instance.new("BodyVelocity", rootPart)
        bv.velocity = Vector3.new(0, 0, 0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        humanoid.PlatformStand = true
        
        setupMobileControls()
        
        flyConnection = RunService.Heartbeat:Connect(function()
            if not flying or not player.Character then
                return
            end
            
      
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
            
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + 
                              ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p) - 
                              workspace.CurrentCamera.CoordinateFrame.p)) * flySpeed
            else
                bv.velocity = Vector3.new(0, 0, 0)
            end
            
            bg.cframe = workspace.CurrentCamera.CoordinateFrame
        end)
        
        
    else
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
            
          
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                    part.Massless = false
                end
            end
            
            if bg then bg:Destroy() end
            if bv then bv:Destroy() end
        end
        
        ctrl = {f = 0, b = 0, l = 0, r = 0}
    end
end

local function updateFlySpeed(value)
    flySpeed = value
end

player.CharacterAdded:Connect(function(character)
    wait(1)
    if flying then
        toggleFly(false)
        wait(0.1)
        toggleFly(true)
    end
end)


Tabs.Combat:AddToggle({
    Name = "Enable Fly",
    Default = false,
    Callback = function(Value)
        toggleFly(Value)
    end
})

Tabs.Combat:AddSlider({
    Name = "Speed Fly Mode",
    Min = 10,
    Max = 200,
    Default = 50,
    Callback = function(Value)
        updateFlySpeed(Value)
    end
})
end

Tabs.Combat:AddToggle({
    Name = "Dash No Cooldown",
    Default = false,
    Callback = function(Value)
        getgenv().DodgeNoCD = Value
    end
})
local function NoCooldown()
    local dodgeScript = game.Players.LocalPlayer.Character:WaitForChild("Dodge")
    for i, v in next, (getgc and getgc() or {}) do
        if typeof(v) == "function" then
            local funcEnv = getfenv(v)
            if funcEnv.script == dodgeScript then
                for i2, v2 in next, getupvalues(v) do
                    if tostring(v2) == "0.4" then
                        setupvalue(v, i2, 0)
                    end
                end
            end
        end
    end
end

Tabs.Combat:AddToggle({
    Name = "Instance Mink V3 [ INF ]",
    Description = "",
    Default = false,
    Callback = function(Value)
        InfAblities = Value
    end
})

spawn(function()
    while wait(.2) do
        pcall(function()
            if InfAblities then
                if not plr.Character.HumanoidRootPart:FindFirstChild("Agility") then
                    local agility = replicated.FX["Agility"]:Clone()
                    agility.Name = "Agility"
                    agility.Parent = plr.Character.HumanoidRootPart
                end
            else
                plr.Character.HumanoidRootPart["Agility"]:Destroy()
            end
        end)
    end
end)

Tabs.Combat:AddToggle({
    Name = "Instance Energy [ INF ]",
    Description = "",
    Default = false,
    Callback = function(Value)
        infEnergy = Value
        if Value then
            getInfinity_Ability("Energy", infEnergy)
        end
    end
})

Tabs.Combat:AddToggle({
    Name = "Instance Soru [ INF ]",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.InfSoru = Value
        if Value then
            getInfinity_Ability("Soru", _G.InfSoru)
        end
    end
})

Tabs.Combat:AddToggle({
    Name = "Instance Observation Range [ INF ]",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.InfiniteObRange = Value
        if Value then
            getInfinity_Ability("Observation", _G.InfiniteObRange)
        end
    end
})

Tabs.Combat:AddToggle({
    Name = "Ignore Same Teams",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.NoAimTeam = Value
    end
})

Tabs.Combat:AddToggle({
    Name = "Accept Allies",
    Description = "",
    Default = false,
    Callback = function(Value)
        _G.AcceptAlly = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.AcceptAlly then
            pcall(function()
                for _, v in pairs(ply:GetChildren()) do
                    if v.Name ~= plr.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AcceptAlly", v.Name)
                    end
                end
            end)
        end
    end
end)


Tabs.Travel:AddSection("Travel - Worlds")

Tabs.Travel:AddButton({
Name = "Travel East Blue (World 1)", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("TravelMain")
end})
Tabs.Travel:AddButton({
Name = "Travel Dressrosa (World 2)", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
end})
Tabs.Travel:AddButton({
Name = "Travel Zou (World 3)", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("TravelZou")
end})
Tabs.Travel:AddSection("Travel - Island")
Location = {}
for i,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do  
  table.insert(Location ,v.Name)
end
Travelllll = Tabs.Travel:AddDropdown({
Name = "Select Travelling",
Description = "",
Options = Location,
Callback = function(Value)
  _G.Island = Value
end})
GoIsland = Tabs.Travel:AddToggle({
Name = "Auto Travel", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Teleport = Value
  if Value then
    for i,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do
      if v.Name == _G.Island then
        repeat wait()
	     _tp(v.CFrame * CFrame.new(0, 30, 0)) 
        until not _G.Teleport or Root.CFrame == v.CFrame
      end
    end
  end
end
})

Tabs.Travel:AddSection("Travel - Portal")
if World1 then
  Location_Portal = {
    "Sky",
    "UnderWater"
  }
elseif World2 then
  Location_Portal = {
    "SwanRoom",
    "Cursed Ship"
  }
elseif World3 then
  Location_Portal = {
    "Castle On The Sea",
    "Mansion Cafe",
    "Hydra Teleport",
    "Canvendish Room",
    "Temple of Time"
  }
end

PortalTP = Tabs.Travel:AddDropdown({
Name = "Select Portal",
Options = Location_Portal,
Callback = function(Value)
  _G.Island_PT = Value
end})
Tabs.Travel:AddButton({
Name = "requestEntrance", 
Description = "",
Callback = function()
  if _G.Island_PT == "Sky" then
    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894, 5547, -380))
  elseif _G.Island_PT == "UnderWater" then
    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163, 11, 1819))
  elseif _G.Island_PT == "SwanRoom" then
    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2285, 15, 905))
  elseif _G.Island_PT == "Cursed Ship" then
    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923, 126, 32852))
  elseif _G.Island_PT == "Castle On The Sea" then
    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
  elseif _G.Island_PT == "Mansion Cafe" then
    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
  elseif _G.Island_PT == "Hydra Teleport" then
    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
  elseif _G.Island_PT == "Canvendish Room" then
    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
  elseif _G.Island_PT == "Temple of Time" then
    replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28310.0234, 14895.1123, 109.456741, -0.469690144, -2.85620132e-08, -0.882831335, -3.23509219e-08, 1, -1.51411736e-08, 0.882831335, 2.14487486e-08, -0.469690144))
  end
end})

Tabs.Travel:AddSection("Travel - NPCs")
for _, v in pairs(replicated.NPCs:GetChildren()) do table.insert(NPCList, v.Name)end
NPCsPos = Tabs.Travel:AddDropdown({
Name = "Select NPCs",
Options = NPCList,
Callback = function(Value)
  NPClist = Value
end})
GoNPCs = Tabs.Travel:AddToggle({
Name = "Auto Tween to NPC", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.TPNpc = Value
end})
spawn(function()
  while wait(Sec) do
    if _G.TPNpc then
	 pcall(function()
       for __, v in pairs(replicated.NPCs:GetChildren()) do
       if v.Name == NPClist then _tp(v.HumanoidRootPart.CFrame) end
       end                	   	   
	 end)
    end
  end
end)

Tabs.Shop:AddSection("Shop Options")
Tabs.Shop:AddButton({
Name = "Buy Buso", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyHaki","Buso")
end})
Tabs.Shop:AddButton({
Name = "Buy Geppo", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
end})
Tabs.Shop:AddButton({
Name = "Buy Soru", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyHaki","Soru")
end})
Tabs.Shop:AddButton({
Name = "Buy Ken", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("KenTalk","Buy")
end})

local MeleeTeacherData = {
  ["Black Leg"] = { Key = "BuyBlackLeg", Name = "Black Leg (Dark Step)" },
  ["Electro"] = { Key = "BuyElectro", Name = "Electro" },
  ["Fishman Karate"] = { Key = "BuyFishmanKarate", Name = "Fishman Karate (Water Kung Fu)" },
  ["Dragon Claw"] = { Key = "BuyDragonClaw", Name = "Dragon Breath (Dragon Claw)" },
  ["Superhuman"] = { Key = "BuySuperhuman", Name = "Superhuman" },
  ["Death Step"] = { Key = "BuyDeathStep", Name = "Death Step" },
  ["Sharkman Karate"] = { Key = "BuySharkmanKarate", Name = "Sharkman Karate" },
  ["Electric Claw"] = { Key = "BuyElectricClaw", Name = "Electric Claw" },
  ["Dragon Talon"] = { Key = "BuyDragonTalon", Name = "Dragon Talon" },
  ["Godhuman"] = { Key = "BuyGodhuman", Name = "Godhuman" },
  ["Sanguine Art"] = { Key = "BuySanguineArt", Name = "Sanguine Art" }
}

local function GetMeleeTeacherPos(styleKey)
  local isW1 = World1 or sea1 or (game.PlaceId == 2753915549 or game.PlaceId == 85211729168715)
  local isW2 = World2 or sea2 or (game.PlaceId == 4442272183 or game.PlaceId == 79091703265657)
  local isW3 = World3 or sea3 or (game.PlaceId == 7449423635 or game.PlaceId == 100117331123089)

  if styleKey == "Black Leg" then
    return (isW1 and CFrame.new(-985, 13, 3988)) or (isW2 and CFrame.new(-4753, 35, -4850)) or (isW3 and CFrame.new(-5045, 371, -3181))
  elseif styleKey == "Electro" then
    return (isW1 and CFrame.new(-5384, 13, -2148)) or (isW2 and CFrame.new(-4867, 35, -4766)) or (isW3 and CFrame.new(-4995, 314, -3203))
  elseif styleKey == "Fishman Karate" then
    return (isW1 and CFrame.new(61585, 18, 987)) or (isW2 and CFrame.new(-4958, 35, -4668)) or (isW3 and CFrame.new(-5023, 371, -3190))
  elseif styleKey == "Dragon Claw" then
    return (isW2 and CFrame.new(701, 187, 655)) or (isW3 and CFrame.new(-4981, 371, -3207))
  elseif styleKey == "Superhuman" then
    return (isW2 and CFrame.new(1374, 247, -5192)) or (isW3 and CFrame.new(-5004, 371, -3198))
  elseif styleKey == "Death Step" then
    return (isW2 and CFrame.new(6357, 296, -6762)) or (isW3 and CFrame.new(-4999, 314, -3221))
  elseif styleKey == "Sharkman Karate" then
    return (isW2 and CFrame.new(-2602, 238, -10316)) or (isW3 and CFrame.new(-4972, 314, -3222))
  elseif styleKey == "Electric Claw" then
    return (isW3 and CFrame.new(-10371, 331, -10131))
  elseif styleKey == "Dragon Talon" then
    return (isW3 and CFrame.new(5661, 1211, 865))
  elseif styleKey == "Godhuman" then
    return (isW3 and CFrame.new(-13776, 334, -9879))
  elseif styleKey == "Sanguine Art" then
    return (isW3 and CFrame.new(-16353, 160, 99))
  end
  return nil
end

local function BuyFightingStyle(styleKey)
  task.spawn(function()
    local info = MeleeTeacherData[styleKey]
    if not info then return end
    local commF = nil
    pcall(function()
      commF = (replicated:FindFirstChild("Remotes") and replicated.Remotes:FindFirstChild("CommF_"))
      if not commF then
        commF = replicated:WaitForChild("Remotes", 3):WaitForChild("CommF_", 3)
      end
    end)
    if not commF then return end

    local targetPos = GetMeleeTeacherPos(styleKey)
    if not targetPos then
      warn("[A1 HUB] " .. (info.Name or styleKey) .. " is not available in the current Sea!")
      return
    end

    local char = plr.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp and (hrp.Position - targetPos.Position).Magnitude > 35 then
      _tp(targetPos)
      local t0 = tick()
      while tick() - t0 < 25 do
        task.wait(0.2)
        local c = plr.Character
        local h = c and c:FindFirstChild("HumanoidRootPart")
        if h and (h.Position - targetPos.Position).Magnitude <= 35 then
          break
        end
      end
      task.wait(0.5)
    end

    if info.Key == "BuyDragonClaw" then
      local res = nil
      pcall(function() res = commF:InvokeServer("BuyDragonClaw") end)
      if not res then
        pcall(function() commF:InvokeServer("BlackbeardReward", "DragonClaw", "2") end)
      end
    else
      pcall(function() commF:InvokeServer(info.Key) end)
      task.wait(0.25)
      pcall(function() commF:InvokeServer(info.Key) end)
    end
  end)
end

Tabs.Shop:AddSection("Fighting - Style")
Tabs.Shop:AddButton({
Name = "Buy Black Leg", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Black Leg")
end})
Tabs.Shop:AddButton({
Name = "Buy Electro", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Electro")
end})
Tabs.Shop:AddButton({
Name = "Buy Fishman Karate", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Fishman Karate")
end})
Tabs.Shop:AddButton({
Name = "Buy DragonClaw", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Dragon Claw")
end})
Tabs.Shop:AddButton({
Name = "Buy Superhuman", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Superhuman")
end})
Tabs.Shop:AddButton({
Name = "Buy Death Step", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Death Step")
end})
Tabs.Shop:AddButton({
Name = "Buy Sharkman Karate", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Sharkman Karate")
end})
Tabs.Shop:AddButton({
Name = "Buy ElectricClaw", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Electric Claw")
end})
Tabs.Shop:AddButton({
Name = "Buy DragonTalon", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Dragon Talon")
end})
Tabs.Shop:AddButton({
Name = "Buy Godhuman", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Godhuman")
end})
Tabs.Shop:AddButton({
Name = "Buy SanguineArt", 
Description = "Tween to Teacher & Buy / Equip",
Callback = function()
  BuyFightingStyle("Sanguine Art")
end})

Tabs.Shop:AddSection("Accessory")
Tabs.Shop:AddButton({
Name = "Buy Tomoe Ring", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Tomoe Ring")
end})
Tabs.Shop:AddButton({
Name = "Buy Black Cape", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Black Cape")
end})
Tabs.Shop:AddButton({
Name = "Buy Swordsman Hat", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Swordsman Hat")
end})
Tabs.Shop:AddButton({
Name = "Buy Bizarre Rifle", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 1)
end})
Tabs.Shop:AddButton({
Name = "Buy Ghoul Mask", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("Ectoplasm","Buy", 2)
end})



Tabs.Shop:AddSection("Weapon World1")
Tabs.Shop:AddButton({
Name = "Buy Cutlass", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
end})
Tabs.Shop:AddButton({
Name = "Buy Katana", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Katana")
end})
Tabs.Shop:AddButton({
Name = "Buy Iron Mace", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
end})   
Tabs.Shop:AddButton({
Name = "Buy Duel Katana", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
end})   
Tabs.Shop:AddButton({
Name = "Buy Triple Katana", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
end})  
Tabs.Shop:AddButton({
Name = "Buy Pipe", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Pipe")
end})  
Tabs.Shop:AddButton({
Name = "Buy Dual-Headed Blade", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
end})   
Tabs.Shop:AddButton({
Name = "Buy Bisento", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Bisento")
end})  
Tabs.Shop:AddButton({
Name = "Buy Soul Cane", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
end})
Tabs.Shop:AddButton({
Name = "Buy Slingshot", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
end})
Tabs.Shop:AddButton({
Name = "Buy Musket", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Musket")
end})    
Tabs.Shop:AddButton({
Name = "Buy Dual Flintlock", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Dual Flintlock")
end})   
Tabs.Shop:AddButton({
Name = "Buy Flintlock", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
end})   
Tabs.Shop:AddButton({
Name = "Buy Refined Flintlock", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
end})   
Tabs.Shop:AddButton({
Name = "Buy Cannon", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BuyItem","Cannon")
end}) 
Tabs.Shop:AddButton({
Name = "Buy Kabucha", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
end})

Tabs.Shop:AddSection("Fragments shop")
Tabs.Shop:AddButton({
Name = "Buy Refund Stats", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end})
Tabs.Shop:AddButton({
Name = "Buy Reroll Race", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
end})   
Tabs.Shop:AddButton({
Name = "Buy Ghoul Race", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("Ectoplasm"," Change", 4)
end})	
Tabs.Shop:AddButton({
Name = "Buy Cyborg Race (2.5k)", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("CyborgTrainer"," Buy")
end})

Tabs.Shop:AddButton({
    Name = "Buy Draco Race",
    Callback = function()
        _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        local targetPosition = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        repeat wait()
        until (character.HumanoidRootPart.Position - targetPosition).Magnitude < 1
        local args = {
            [1] = {
                ["NPC"] = "Dragon Wizard",
                ["Command"] = "DragonRace"
            }
        }
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
    end
})

Tabs.Misc:AddSection("Server - Function")
Tabs.Misc:AddButton({
    Name = "Redeem All Codes",
    Description = "",
    Callback = function()
        local codes = {
            "LIGHTNINGABUSE","1LOSTADMIN","ADMINFIGHT","GIFTING_HOURS","NOMOREHACK",
            "BANEXPLOIT","WildDares","BossBuild","GetPranked","EARN_FRUITS",
            "SUB2GAMERROBOT_RESET1","KITT_RESET","Bignews","CHANDLER","Fudd10",
            "fudd10_v2","Sub2UncleKizaru","FIGHT4FRUIT","kittgaming","TRIPLEABUSE",
            "Sub2CaptainMaui","Sub2Fer999","Enyu_is_Pro","Magicbus","JCWK",
            "Starcodeheo","Bluxxy","SUB2GAMERROBOT_EXP1","Sub2NoobMaster123",
            "Sub2Daigrock","Axiore","TantaiGaming","StrawHatMaine","Sub2OfficialNoobie",
            "TheGreatAce","JULYUPDATE_RESET","ADMINHACKED","SEATROLLING","24NOADMIN",
            "ADMIN_TROLL","NEWTROLL","SECRET_ADMIN","staffbattle","NOEXPLOIT",
            "NOOB2ADMIN","CODESLIDE","fruitconcepts","krazydares"
        }

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RemotesFolder = ReplicatedStorage:WaitForChild("Remotes")
        local RedeemRemote = RemotesFolder:FindFirstChild("Redeem")

        if not RedeemRemote then
            return
        end

        for _, code in ipairs(codes) do
            task.wait(0)
            pcall(function()
                if RedeemRemote.InvokeServer then
                    RedeemRemote:InvokeServer(code)
                else
                    RedeemRemote:FireServer(code)
                end
            end)
        end
    end
})
Tabs.Misc:AddButton({
Name = "Rejoin Server", 
Description = "",
Callback = function()
  game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end})
Tabs.Misc:AddButton({
    Name = "Hop Server",
    Description = "",
    Callback = function()
        task.spawn(function()
            local HttpService = game:GetService("HttpService")
            local TeleportService = game:GetService("TeleportService")
            local PlaceId = game.PlaceId
            local Players = game:GetService("Players")

            local success, servers = pcall(function()
                local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
                local response = game:HttpGet(url)
                return HttpService:JSONDecode(response).data
            end)

            if success and servers then
                local targetServer
                for _, s in pairs(servers) do
                    if s.playing < s.maxPlayers then
                        targetServer = s.id
                    end
                end

                if targetServer then
                    pcall(function()
                        TeleportService:TeleportToPlaceInstance(PlaceId, targetServer, Players.LocalPlayer)
                    end)
                end
            end
        end)
    end
})
Tabs.Misc:AddButton({
Name = "Hop to Lowest Players", 
Description = "",
Callback = function()
  local Http = game:GetService("HttpService")
  local TPS = game:GetService("TeleportService")
  local Api = "https://games.roblox.com/v1/games/"
  local _place = game.PlaceId
  local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
   function ListServers(cursor)
     local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
     return Http:JSONDecode(Raw)
   end
   local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
  until Server
  TPS:TeleportToPlaceInstance(_place,Server.id,plr)
end})

Tabs.Misc:AddButton({
Name = "Hop to Lowest Pings Server", 
Description = "",
Callback = function()
local HTTPService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local StatsService = game:GetService("Stats")
local function fetchServersData(placeId, limit)
    local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", placeId, limit)
    local success, response = pcall(function()
        return HTTPService:JSONDecode(game:HttpGet(url))
    end)
  if success and response and response.data then
	return response.data
  end
    return nil
  end
  local placeId = game.PlaceId
  local serverLimit = 100
  local servers = fetchServersData(placeId, serverLimit)
  if not servers then return end
  local lowestPingServer = servers[1]
  for _, server in pairs(servers) do
    if server["ping"] < lowestPingServer["ping"] and server.maxPlayers > server.playing then
      lowestPingServer = server
    end
  end
  local commonLoadTime = 0.5
  task.wait(commonLoadTime)
  local pingThreshold = 100
  local serverStats = StatsService.Network.ServerStatsItem
  local dataPing = serverStats["Data Ping"]:GetValueString()
  local pingValue = tonumber(dataPing:match("(%d+)"))
  if pingValue >= pingThreshold then
    TeleportService:TeleportToPlaceInstance(placeId, lowestPingServer.id)
  else
  end
end})

local replicated = game:GetService("ReplicatedStorage")

Tabs.Misc:AddTextBox({
    Name = "Input Job Id",
    Placeholder = "Job ID",
    ClearOnFocus = true,
    Callback = function(Value)
        getgenv().Job = Value
    end
})

Tabs.Misc:AddButton({
    Name = "Teleport [Job ID]", 
    Callback = function()
        if getgenv().Job and getgenv().Job ~= "" then
            game:GetService("TeleportService")
                :TeleportToPlaceInstance(
                    game.PlaceId,
                    getgenv().Job,
                    game.Players.LocalPlayer
                )
        end
    end
})
Tabs.Misc:AddButton({
Name = "Copy JobID", 
Description = "",
Callback = function()
  setclipboard(tostring(game.JobId))
end})

Tabs.Misc:AddSection("Player Gui / Others")

Tabs.Misc:AddButton({
Name = "Open Awakenings Expert", 
Description = "",
Callback = function()
  plr.PlayerGui.Main.AwakeningToggler.Visible = true
end})
Tabs.Misc:AddButton({
Name = "Open Title Selection", 
Description = "",
Callback = function()
  replicated.Remotes.CommF_:InvokeServer("getTitles",true)
  plr.PlayerGui.Main.Titles.Visible = true
end})
DisbleChat = Tabs.Misc:AddToggle({
Name = "Disable Chat GUI", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.Rechat = Value
  if  _G.Rechat == true then
    local StarterGui = game:GetService('StarterGui')
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)    
  elseif _G.chat == false then
    local StarterGui = game:GetService('StarterGui')
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)    
  end
end
})
DisbleLeaderB = Tabs.Misc:AddToggle({
Name = "Disable Leader Board GUI", 
Description = "", 
Default = false,
Callback = function(Value)
  ReLeader = Value
  if ReLeader == true then
    local StarterGui = game:GetService('StarterGui')
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)   
  elseif ReLeader == false then
    local StarterGui = game:GetService('StarterGui')
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)   
  end
end
})
Tabs.Misc:AddButton({
Name = "Set Pirate Team", 
Description = "",
Callback = function()
  Pirates()
end})  
Tabs.Misc:AddButton({
Name = "Set Marine Team", 
Description = "",
Callback = function()
  Marines()
end})
UnPortal = Tabs.Misc:AddToggle({
Name = "Unlock All Portals", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.PortalUnLock = Value
end})
spawn(function()
  while wait(Sec) do
    pcall(function()
      if _G.PortalUnLock then        
         if Attack.Pos(CstlePos_Miti,8) then
           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
         elseif Attack.Pos(Man3Pos_Miti,8) then
           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
         elseif Attack.Pos(HydraPos_Miti,8) then                    
           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
         elseif Attack.Pos(HydratoCastle,8) then                   
           replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
        end
      end
    end)
  end
end)

Tabs.Misc:AddSection("Graphics / Haki Stats")

HakiSt = {"State 0","State 1","State 2","State 3","State 4","State 5"}
HakiStat = Tabs.Misc:AddDropdown({
Name = "Select Haki States",
Options = HakiSt,
Callback = function(Value)
  _G.SelectStateHaki = Value
end})
Tabs.Misc:AddButton({
Name = "ChangeBusoStage", 
Description = "",
Callback = function()
  if _G.SelectStateHaki == "State 0" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",0)
  elseif _G.SelectStateHaki == "State 1" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",1)
  elseif _G.SelectStateHaki == "State 2" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",2)
  elseif _G.SelectStateHaki == "State 3" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",3)
  elseif _G.SelectStateHaki == "State 4" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",4)
  elseif _G.SelectStateHaki == "State 5" then
    replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage",5)
  end
end})
rtxM = Tabs.Misc:AddToggle({
Name = "Turn on RTX Mode", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.RTXMode = Value
  local a = game.Lighting
  local c = Instance.new("ColorCorrectionEffect", a)
  local e = Instance.new("ColorCorrectionEffect", a)
  OldAmbient = a.Ambient
  OldBrightness = a.Brightness
  OldColorShift_Top = a.ColorShift_Top
  OldBrightnessc = c.Brightness
  OldContrastc = c.Contrast
  OldTintColorc = c.TintColor
  OldTintColore = e.TintColor    
  if not _G.RTXMode then return end
  while _G.RTXMode do wait()
    a.Ambient = Color3.fromRGB(33, 33, 33)
    a.Brightness = 0.3
    c.Brightness = 0.176
    c.Contrast = 0.39
    c.TintColor = Color3.fromRGB(217, 145, 57)
    game.Lighting.FogEnd = 999
    if not plr.Character.HumanoidRootPart:FindFirstChild("PointLight") then
      local a2 = Instance.new("PointLight")
      a2.Parent = plr.Character.HumanoidRootPart
      a2.Range = 15
      a2.Color = Color3.fromRGB(217, 145, 57)
    end
    if not _G.RTXMode then
      a.Ambient = OldAmbient
      a.Brightness = OldBrightness
      a.ColorShift_Top = OldColorShift_Top
      c.Contrast = OldContrastc
      c.Brightness = OldBrightnessc
      c.TintColor = OldTintColorc
      e.TintColor = OldTintColore
      game.Lighting.FogEnd = 2500
      plr.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
    end
  end
end
})
Tabs.Misc:AddButton({
Name = "Turn on Fast Mode", 
Description = "",
Callback = function()
  for _,zx in next, workspace:GetDescendants() do
  if table.find(Past, zx.ClassName) then  zx.Material = "Plastic" end
  end
end})
Tabs.Misc:AddButton({
Name = "Turn on Low CPU", 
Description = "",
Callback = function()
  LowCpu()
end})
Tabs.Misc:AddButton({
Name = "Turn on increase Boats", 
Description = "",
Callback = function()
  for _, v in pairs(workspace.Boats:GetDescendants()) do
    if table.find(ListSeaBoat, v.Name) and tostring(v.Owner.Value) == tostring(plr.Name) then              
      v.VehicleSeat.MaxSpeed = 350
      v.VehicleSeat.Torque = 0.2
      v.VehicleSeat.TurnSpeed = 5
      v.VehicleSeat.HeadsUpDisplay = true
    end
  end
end})
Tabs.Misc:AddButton({
Name = "Remove Sky Fog", 
Description = "",
Callback = function()
  if Lighting:FindFirstChild("LightingLayers") then Lighting.LightingLayers:Destroy() end
  if Lighting:FindFirstChild("SeaTerrorCC") then Lighting.SeaTerrorCC:Destroy() end
  if Lighting:FindFirstChild("FantasySky") then Lighting.FantasySky:Destroy() end
end})

Tabs.Misc:AddSection("Configure - God")
Tabs.Misc:AddButton({
Name = "Rain Fruits (Client)", 
Description = "",
Callback = function()
  for i, v in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
    v.Parent = game.Workspace.Map
    v:MoveTo(plr.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
    if v.Fruit:FindFirstChild("AnimationController") then
      v.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v.Fruit:FindFirstChild("Idle")):Play()
    end
    v.Handle.Touched:Connect(function(otherPart)
      if otherPart.Parent == plr.Character then
        v.Parent = plr.Backpack
        plr.Character.Humanoid:EquipTool(v)
      end
    end)
  end
end})
briggt1 = Tabs.Misc:AddToggle({
Name = "Turn on Full Bright", 
Description = "", 
Default = false,
Callback = function(Value)
  bright = Value
  if Value == true then
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
    Lighting.ColorShift_Top = Color3.new(1, 1, 1)
  else
    Lighting.Ambient = Color3.new(0, 0, 0)
    Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
    Lighting.ColorShift_Top = Color3.new(0, 0, 0)
  end  
end
})


DayN = Tabs.Misc:AddDropdown({
Name = "Select Time",
Description = "",
Options = {"Day", "Night"},
Default = Day,
Callback = function(Value)
  _G.SelectDN = Value
end})
dayornight = Tabs.Misc:AddToggle({
Name = "Turn on Time", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.daylightN = Value
end})
task.spawn(function()
  while task.wait() do
    if _G.daylightN then
      if _G.SelectDN == "Day" then
        Lighting.ClockTime = 12
      elseif _G.SelectDN == "Night" then
        Lighting.ClockTime = 0
      end
    end
  end
end)
walkWater = Tabs.Misc:AddToggle({
Name = "Turn on Walk on Water", 
Description = "", 
Default = true,
Callback = function(Value)
  _G.WalkWater_Part = Value
  if _G.WalkWater_Part then
    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
  else
    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
  end
end
})
iceWalk = Tabs.Misc:AddToggle({
Name = "Turn on Ice Walk", 
Description = "", 
Default = false,
Callback = function(Value)
  _G.WalkWater = Value
end})
spawn(function()
  while task.wait() do
    if _G.WalkWater then
      pcall(function()
	   if plr.Character and plr.Character:FindFirstChild("LeftFoot") then
	   local upval0 = replicated.Assets.Models.IceSpikes4:Clone()
        upval0.Parent = workspace
        upval0.Size = Vector3.new(3+math.random(10,12),1.7,3+math.random(10,12))
        upval0.Color = Color3.fromRGB(128,187,219)
        upval0.CFrame = CFrame.new(plr.Character.Head.Position.X,-3.8,plr.Character.Head.Position.Z)*CFrame.Angles((math.random()-0.5)*0.06, math.random()*7,(math.random()-0.5)*0.07)
        local var85={};
        var85.Size=Vector3.new(0,0.3,0)
        local var3=TW:Create(upval0,TweenInfo.new(2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),var85)
        var3.Completed:Connect(function()
          upval0:Destroy()
        end)
          var3:Play()
	    end	
      end)
    end
  end
end)

Tabs.Misc:AddSection("Movement & Tween Speed")

Tabs.Misc:AddSlider({
    Name = "Tween Speed",
    Description = "Adjust teleport & flying tween speed (Default: 200 studs/s)",
    Min = 50,
    Max = 500,
    Increment = 5,
    Default = _G.TweenSpeed or 200,
    Callback = function(Value)
        _G.TweenSpeed = Value
    end
})

Tabs.Misc:AddButton({
    Name = "Reset Tween Speed (200)",
    Description = "Resets tween speed back to safe default (200 studs/s)",
    Callback = function()
        _G.TweenSpeed = 200
    end
})

do
local player = game.Players.LocalPlayer
local function IsEntityAlive(entity)
    if not entity then return false end
    local humanoid = entity:FindFirstChild("Humanoid")
    return humanoid and humanoid.Health > 0
end
local function GetEnemiesInRange(character, range)
    local enemies = game:GetService("Workspace").Enemies:GetChildren()
    local players = game:GetService("Players"):GetPlayers()
    local targets = {}
    local playerPos = character:GetPivot().Position
    for _, enemy in ipairs(enemies) do
        local rootPart = enemy:FindFirstChild("HumanoidRootPart")
        if rootPart and IsEntityAlive(enemy) then
            local distance = (rootPart.Position - playerPos).Magnitude
            if distance <= range then
                table.insert(targets, enemy)
            end
        end
    end
    for _, otherPlayer in ipairs(players) do
        if otherPlayer ~= player and otherPlayer.Character then
            local rootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if rootPart and IsEntityAlive(otherPlayer.Character) then
                local distance = (rootPart.Position - playerPos).Magnitude
                if distance <= range then
                    table.insert(targets, otherPlayer.Character)
                end
            end
        end
    end
    return targets
end
function AttackNoCoolDown()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    if not character then return end
    local equippedWeapon = nil
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Tool") then
            equippedWeapon = item
            break
        end
    end
    if not equippedWeapon then return end
    local enemiesInRange = GetEnemiesInRange(character, 60)
    if #enemiesInRange == 0 then return end
    local storage = game:GetService("ReplicatedStorage")
    local modules = storage:FindFirstChild("Modules")
    if not modules then return end
    local attackEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
    local hitEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
    if not attackEvent or not hitEvent then return end
    local targets, mainTarget = {}, nil
    for _, enemy in ipairs(enemiesInRange) do
        if not enemy:GetAttribute("IsBoat") then
            local HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand"}
            local head = enemy:FindFirstChild(HitboxLimbs[math.random(#HitboxLimbs)]) or enemy.PrimaryPart
            if head then
                table.insert(targets, { enemy, head })
                mainTarget = head
            end
        end
    end
    if not mainTarget then return end
    attackEvent:FireServer(0)
    local playerScripts = player:FindFirstChild("PlayerScripts")
    if not playerScripts then return end
    local localScript = playerScripts:FindFirstChildOfClass("LocalScript")
    while not localScript do
        playerScripts.ChildAdded:Wait()
        localScript = playerScripts:FindFirstChildOfClass("LocalScript")
    end
    local hitFunction
    if getsenv then
        local success, scriptEnv = pcall(getsenv, localScript)
        if success and scriptEnv then
            hitFunction = scriptEnv._G.SendHitsToServer
        end
    end
    local successFlags, combatRemoteThread = pcall(function()
        return require(modules.Flags).COMBAT_REMOTE_THREAD or false
    end)
    if successFlags and combatRemoteThread and hitFunction then
        hitFunction(mainTarget, targets)
    elseif successFlags and not combatRemoteThread then
        hitEvent:FireServer(mainTarget, targets)
    end
end
end
CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
get_Monster=function()for a,b in pairs(workspace.Enemies:GetChildren())do local c=b:FindFirstChild("UpperTorso")or b:FindFirstChild("Head")if b:FindFirstChild("HumanoidRootPart",true)and c then if(b.Head.Position-plr.Character.HumanoidRootPart.Position).Magnitude<=50 then return true,c.Position end end end;for a,d in pairs(workspace.SeaBeasts:GetChildren())do if d:FindFirstChild("HumanoidRootPart")and d:FindFirstChild("Health")and d.Health.Value>0 then return true,d.HumanoidRootPart.Position end end;for a,d in pairs(workspace.Enemies:GetChildren())do if d:FindFirstChild("Health")and d.Health.Value>0 and d:FindFirstChild("VehicleSeat")then return true,d.Engine.Position end end end
Actived=function()local a=game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")for b,c in next,getconnections(a.Activated)do if typeof(c.Function)=='function'then getupvalues(c.Function)end end end
task.spawn(function()
  RunSer.Heartbeat:Connect(function()
    pcall(function()      
      if not _G.Seriality then return end      
      AttackNoCoolDown() 
      local Pretool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
      local ToolTip = Pretool.ToolTip
      local MobAura, Mon = get_Monster()      
      if ToolTip == "Blox Fruit" then
        if MobAura then           
          local LeftClickRemote = Pretool:FindFirstChild('LeftClickRemote');
          if LeftClickRemote then Actived() LeftClickRemote:FireServer(Vector3.new(0.01,-500,0.01),1,true);LeftClickRemote:FireServer(false)end
        end     		                         
      end      
    end)
  end)
end)
do
local FastAttackModule = {}
local HitRegistrationModule = {}
local MainController = {}

local GameService = game
local Players = GameService:GetService("Players")
local RunService = GameService:GetService("RunService")
local ReplicatedStorage = GameService:GetService("ReplicatedStorage")
local Workspace = GameService:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local function SafeWaitForChild(parent, childName)
    local success, result = pcall(function()
        return parent:WaitForChild(childName)
    end)
    return result
end

local Enemies = SafeWaitForChild(Workspace, "Enemies")
local Characters = SafeWaitForChild(Workspace, "Characters")
local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
local Net = SafeWaitForChild(Modules, "Net")

FastAttackModule.Rate = 0.000000002
FastAttackModule.Enabled = true

function FastAttackModule.IsAlive(target)
    local humanoid = target:FindFirstChild("Humanoid")
    if humanoid and humanoid.Health > 0 then
        return true
    end
    return false
end

function FastAttackModule.GetNearbyTargets(character, folder)
    local characterPosition = character:GetPivot().Position
    local nearbyTargets = {}
    local children = folder:GetChildren()
    
    for i = 1, #children do
        local target = children[i]
        local humanoid = target:FindFirstChild("Humanoid")
        local rootPart = target:FindFirstChild("HumanoidRootPart")
        
        if humanoid and rootPart and humanoid.Health > 0 then
            local distance = (rootPart.Position - characterPosition).Magnitude
            if distance <= 60 then
                table.insert(nearbyTargets, target)
            end
        end
    end
    return nearbyTargets
end

function FastAttackModule.GetTargetParts(targetList)
    local result = {}
    local count = #targetList
    
    for i = 1, count do
        local target = targetList[i]
        local head = target:FindFirstChild("Head") or target.PrimaryPart
        if head then
            table.insert(result, {target, head})
        end
    end
    return result
end

function FastAttackModule.GetAllTargets(character)
    local enemies = FastAttackModule.GetNearbyTargets(character, Enemies)
    local otherCharacters = FastAttackModule.GetNearbyTargets(character, Characters)
    
    local allTargets = {}
    for i = 1, #enemies do
        table.insert(allTargets, enemies[i])
    end
    for i = 1, #otherCharacters do
        table.insert(allTargets, otherCharacters[i])
    end
    return allTargets
end

function FastAttackModule.ExecuteFastAttack()
    local character = LocalPlayer.Character
    if not character then return end
    
    local tool = character:FindFirstChildOfClass("Tool")
    if not tool then return end
    
    local targets = FastAttackModule.GetAllTargets(character)
    if #targets < 1 then return end
    
    local targetParts = FastAttackModule.GetTargetParts(targets)
    if #targetParts < 1 then return end
    
    local attackRemote = Net["RE/RegisterAttack"]
    local hitRemote = Net["RE/RegisterHit"]
    
    attackRemote:FireServer(FastAttackModule.Rate)
    local targetHead = targetParts[1][2]
    hitRemote:FireServer(targetHead, targetParts)
end

local AttackRemoteTarget
local AttackRemoteId

local function InitializeHitRegistration()
    local foldersToCheck = {
        ReplicatedStorage.Util,
        ReplicatedStorage.Common,
        ReplicatedStorage.Remotes,
        ReplicatedStorage.Assets,
        ReplicatedStorage.FX
    }

    for _, folder in ipairs(foldersToCheck) do
        local children = folder:GetChildren()
        
        for _, child in ipairs(children) do
            if child:IsA("RemoteEvent") and child:GetAttribute("Id") then
                AttackRemoteTarget = child
                AttackRemoteId = child:GetAttribute("Id")
            end
        end

        folder.ChildAdded:Connect(function(child)
            if child:IsA("RemoteEvent") and child:GetAttribute("Id") then
                AttackRemoteTarget = child
                AttackRemoteId = child:GetAttribute("Id")
            end
        end)
    end
end

InitializeHitRegistration()

function HitRegistrationModule.Execute()
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    local hitTargets = {}

    local function ScanFolder(folder)
        local children = folder:GetChildren()
        for i = 1, #children do
            local target = children[i]
            local humanoid = target:FindFirstChild("Humanoid")
            local rootPart = target:FindFirstChild("HumanoidRootPart")
            
            if humanoid and rootPart and humanoid.Health > 0 and target ~= character then
                local distance = (rootPart.Position - humanoidRootPart.Position).Magnitude
                if distance <= 60 then
                    local targetChildren = target:GetChildren()
                    for _, child in ipairs(targetChildren) do
                        if child:IsA("BasePart") then
                            table.insert(hitTargets, {target, child})
                        end
                    end
                end
            end
        end
    end

    ScanFolder(Enemies)
    ScanFolder(Characters)

    local tool = character:FindFirstChildOfClass("Tool")
    
    if #hitTargets > 0 and tool and (tool:GetAttribute("WeaponType") == "Melee" or tool:GetAttribute("WeaponType") == "Sword") then
        local attackRemote = Net:FindFirstChild("RE/RegisterAttack")
        local hitRemote = Net:FindFirstChild("RE/RegisterHit")
        
        local targetHead = hitTargets[1][1]:FindFirstChild("Head") or hitTargets[1][1]:FindFirstChild("HumanoidRootPart")
        if not targetHead then return end

        if attackRemote then attackRemote:FireServer(0) end
        if hitRemote then hitRemote:FireServer(targetHead, hitTargets, {}) end
    end
end

local function DisableCameraShake()
    local cameraModule = require(ReplicatedStorage.Util.CameraShaker)
    cameraModule:Stop()
end

local function StartMainLoops()
    task.spawn(function()
        while task.wait(FastAttackModule.Rate) do
            FastAttackModule.ExecuteFastAttack()
        end
    end)

    RunService.Heartbeat:Connect(function()
        pcall(HitRegistrationModule.Execute)
    end)
end

StartMainLoops()
end

-- Notification disabled to prevent stuck Label card
pcall(function()
    Window.Notify = function() end
    if redzlib then redzlib.Notify = function() end end
    local coreGui = (gethui or function() return game:GetService("CoreGui") end)()
    if coreGui then
        for _, desc in ipairs(coreGui:GetDescendants()) do
            if desc.Name == "Notification" and desc:IsA("Frame") then
                desc:Destroy()
            end
        end
    end
end)


-- Walk on water default active
pcall(function()
    _G.WalkWater_Part = true
    local water = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("WaterBase-Plane")
    if water then water.Size = Vector3.new(1000, 112, 1000) end
end)
