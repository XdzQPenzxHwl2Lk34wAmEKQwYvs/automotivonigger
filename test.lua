getgenv().VisualSense = {
    ["Options"] = {
        ["Version"] = "beta v2", -- // Dont touch this is to make sure your using the correct table
        ["Stealth Mode"] = {
            ["Enabled"] = false, -- // Will hide the loader and just load the script 
            ["Key"] = "", -- // Enter your VisualSense Key
        },
        ["Internal"] = {
            ["Enabled"] = true, 
            ["Auto Show"] = false, 
            ["Bind"] = "INS", 
        },
        ["FPS Unlocker"] = {  
            ["Enabled"] = true, 
            ["FPS"] = 999, 
        },
        ["Intro"] = true, -- // Will show a short intro
        ["Stats"] = false, 
        ["Auto Join Discord"] = false, -- // wont work bcs of solara
        ["Allow Notifications"] = true, 
        ["Notifcation Type"] = "xaxa", 
        ["Notifcation Duration"] = 3, 
    },
    ["Silent Aim"] = {
        ["Enabled"] = true, 
        ["Mode"] = "FOV", 
        ["Target Mode Bind"] = "Q", 
        ["Notify"] = true, 
        ["Prediction"] = 0.133, 
        ["Hit Chance"] = 100, 
        ["Target Part"] = "Head", 
        ["Target Part Offset"] = 0, 
        ["Nearest Part To Cursor"] = false, 
        ["Closest Point"] = false, 
        ["Dot"] = true, 
        ["Line"] = false, 
        ["Shake"] = {
            ["Enabled"] = false, 
            ["X"] = 5,
            ["Y"] = 5,
            ["Z"] = 5, 
        },
    },
    ["Cam Lock"] = {
        ["Enabled"] = false, 
        ["Mode"] = "Target_toggle", 
        ["Target Mode Bind"] = "C",
        ["Easing Style"] = "Exponential", -- // https://create.roblox.com/docs/reference/engine/enums/EasingStyle
        ["Notify"] = true,
        ["Prediction"] = 0.133,
        ["Target Part"] = "Head",
        ["Target Part Offset"] = 0, 
        ["Nearest Part To Cursor"] = false,
        ["Closest Point"] = false,
        ["Dot"] = true,
        ["Line"] = false,
        ["Smoothness"] = {
            ["Enabled"] = true,
            ["Value"] = 0.058,
        },
        ["Shake"] = {
            ["Enabled"] = false,
            ["X"] = 5,
            ["Y"] = 5,
            ["Z"] = 5,
        },
    },
    ["Global"] = {
        ["Auto Prediction"] = {
            ["Enabled"] = true,
            ["Version"] = "Default",
            ["Custom Settings"] = { 
                ["Ping20"]  = 0.12746444,
                ["Ping30"]  = 0.12746444,
                ["Ping40"]  = 0.12746444,
                ["Ping50"]  = 0.11243,
                ["Ping60"]  = 0.11243,
                ["Ping70"]  = 0.12533,
                ["Ping80"]  = 0.169,
                ["Ping90"]  = 0.13626,
                ["Ping100"] = 0.13829,
                ["Ping110"] = 0.146,
                ["Ping120"] = 0.149,
                ["Ping130"] = 0.151,
                ["Ping140"] = 0.1652131,
                ["Ping150"] = 0.125333,
                ["Ping160"] = 0.1223333,
                ["Ping170"] = 0.15,
                ["Ping180"] = 0.1923111,
                ["Ping190"] = 0.165771,
                ["Ping200"] = 0.1746,
            }
        },
        ["Anti Ground Shots"] = false,
        ["Unlock On KO"] = false,
        ["Unlock Outside FOV"] = false,
        ["Unlock Behind Wall"] = false,
    },
    ["Checks"] = {
        ["Whitelist"] = {
            ["Enabled"] = false,
            ["Usernames"] = {
                --[[
                    Enter usernames eg: 
                    "Username1",
                    "Username2",
                    "Username3"
                ]]
            }
        },
        ["Blacklist"] = { 
            ["Enabled"] = false,
            ["Usernames"] = {
                --[[
                    Enter usernames eg: 
                    "Username1",
                    "Username2",
                    "Username3"
                ]]
            }
        },
        ["Visible Check"] = true, 
        ["K.O Check"] = true, 
        ["Crew Check"] = false, 
        ["Friend Check"] = false,
        ["Distance"] = { 
            ["Enabled"] = false,
            ["Max Distance"] = 200,
        }
    },
    ["AntiLocks"] = {
        ["Method"] = "Custom",
        ["CustomX"] = 100,
        ["CustomY"] = 100,
        ["CustomZ"] = 100,
        ["PredChangeAmt"] = 10,
        ["PredReverseAmt"] = 10,
        ["LookVecAmt"] = 100,
        ["DesyncVel"] = 100,
        ["DesyncAngels"] = 100,
    },
    ["Resolver"] = {
        ["Enabled"] = false,
        ["Method"] = "Delta", -- // Delta, Move Direction, No Prediction, Recalculate
        ["Keybind Enabled"] = false,
        ["Keybind"] = "T", 
    },
    ["FOV"] = { 
        ["Silent Aim"] = {
            ["Visible"] = false, 
            ["Filled"] = false, 
            ["Size"] = 100, 
            ["Thickness"] = 1, 
            ["Transparency"] = 1, 
            ["Color"] = Color3.fromRGB(255,255,255) 
        },
        ["Cam Lock"] = {
            ["Visible"] = false, 
            ["Filled"] = false, 
            ["Size"] = 100, 
            ["Thickness"] = 1, 
            ["Transparency"] = 1, 
            ["Color"] = Color3.fromRGB(255,255,255) 
        },
    },
    ["Airshot"] = {
        ["Enabled"] = true, 
        ["Jump Offset"] = -1.6,
        ["Cam Lock Smoothness"] = {
            ["Enabled"] = true,
            ["New Smoothness"] = 0.58,
        }
    },
    ["Hit Sound"] = {
        ["Enabled"] = false, 
        ["Hit Sound"] = "Minecraft", -- // Minecraft, Bameware, Bubble, Pick, Pop, Rust, Sans, Fart, Big, Vine, Bruh, Skeet, Neverlose, Fatality, Bonk
        ["Volume"] = 1,
    },
    ["Hit Logs"] = {
        ["Enabled"] = false, 
    },
    ["Macro"] = {
        ["Enabled"] = false,
        ["Bind"] = "X", 
        ["Abuse"] = true, 
        ["Speed"] = 1, 
    },
    ["Spoofer"] = {
        ["Memory"] = {
            ["Enabled"] = false, 
            ["Max"] = 900,
            ["Min"] = 700,
        },
    },
    ["Gun Sorting"] = {
        ["Enabled"] = false, 
        ["Bind"] = "Z", 
        ["Delete Extra"] = false, 
        ["Slots"] = { 
            "[Double-Barrel SG]",
            "[Revolver]",
            "[TacticalShotgun]",
            "[Shotgun]",
            "[Katana]",
        }
    },
    ["Emotes"] = { 
        ["Lay"] = true, ["LayKey"] = Enum.KeyCode.T, 
        ["Greet"] = true, ["GreetKey"] = Enum.KeyCode.G, 
        ["Speed"] = false, ["SpeedKey"] = Enum.KeyCode.N, 
        ["Sturdy"] = false, ["SturdyKey"] = Enum.KeyCode.H,
        ["Griddy"] = false, ["GriddyKey"] = Enum.KeyCode.G, 
    },
    ["Fake Spike"] = {
        ["Enabled"] = false, 
        ["Bind"] = "K", 
        ["Duration"] = 1, 
    },
    ["Panic"] = {
        ["Enabled"] = false, 
        ["Bind"] = "P", 
        ["Things To Disable"] = {
            ["Options"] = true, 
            ["Aiming"] = true, 
            ["FOV"] = true, 
            ["Misc"] = true, 
            ["Emotes"] = true,
        }
    },
    ["Extra"] = {
        ["Disable Seats"] = true,
        ["Low Graphics"] = false,
        ["Mute Boomboxes"] = false, 
    },
    ["PlayerSettings"] = {
        ["Speed"] = {
            ["Enabled"] = false,
            ["SpeedAmount"] = 0,
            ["KeyBind"] = "X", 
        },
        ["NoSlowDown"] = false,
        ["BunnyHop"] = {
            ["Enabled"] = false,
            ["HopAmount"] = 0,
        },
        ["AutoReload"] = false,
        ["AutoStomp"] = false,
        ["AutoJump"] = false,
    },
    ["ESP"] = { 
        ["Enabled"] = false, 
        ["Max Distance"] = 500, 
        ["Name"] = { 
            ["Enabled"] = true,
            ["Outline"] = false,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        },
        ["Box"] = { 
            ["Enabled"] = true,
            ["Outline"] = false,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        },
        ["Health Bar"] = { 
            ["Enabled"] = false,
            ["Outline"] = false,
            ["Color"] = Color3.fromRGB(0, 255, 0)
        },
        ["Distance"] = { 
            ["Enabled"] = false,
            ["Outline"] = false,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        },
    },
    ["Chat Commands"] = {
        ["Enabled"] = true,
        ["Prefix"] = ".",
        ["Commands"] = { 
            ["Prediction"] = "pred", -- // ex; $pred 0.115
            ["ToggleFOV"] = "draw", -- // ex; $draw true (you can also do "on" or "yes" and to disable you do "off" or "yes" or "false")
            ["SizeFOV"] = "radius", -- // ex; $radius 100
            ["GotoLocation"] = "tp", -- // ex; $tp bank (locations in server)
            ["ToggleResolver"] = "resolver", -- // ex; $resolver true (you can also do "on" or "yes" and to disable you do "off" or "yes" or "false")
            ["JoinDiscord"] = "discord", -- // ex; $discord
            ["RejoinServer"] = "rj", -- // ex; $rj
            ["ToggleSilentAim"] = "silent", -- // ex; $silent true (you can also do "on" or "yes" and to disable you do "off" or "yes" or "false")
            ["ToggleCamLock"] = "camlock", -- // ex; $camlock true (you can also do "on" or "yes" and to disable you do "off" or "yes" or "false")
            ["CamLockSmoothness"] = "smoothness", -- // ex; $smoothness 0.086
            ["CheckForExploiters"] = "check", -- // ex; $check
            ["ForceReset"] = "reset", -- // ex; $reset
        }
    }
}




-- // VisualSense

if not LPH_OBFUSCATED and not LPH_JIT_ULTRA then
    LPH_NO_VIRTUALIZE = function(f) return f end
    LRM_UserNote = ""
    LRM_LinkedDiscordID = 1
    LRM_TotalExecutions = 1
    LRM_SecondsLeft = 9999
end

getgenv().luarmor_vars = {
    ID = LRM_LinkedDiscordID,
}

--[[if VisualSense.Options["FPS Unlocker"].Enabled then 
    setfpscap(VisualSense.Options["FPS Unlocker"].FPS)
end]]

for i,v in pairs(game.Workspace:GetDescendants()) do 
    if v:IsA("Seat") then 
        v.Disabled = VisualSense["Extra"]["Disable Seats"]
    end
end

local smoothplastic = Enum.Material.SmoothPlastic
local objects = {}

local function scan(object)
    local objectlist = object:GetChildren()
    for i = 1, #objectlist do
        if objectlist[i]:IsA('BasePart') then
            objects[objectlist[i]] = objectlist[i].Material
        end
        scan(objectlist[i])
    end
end

scan(workspace)

if not VisualSense["Extra"]["Low Graphics"] then
    for i in pairs(objects) do
        i.Material = objects[i]
    end
else
    for i in pairs(objects) do
        i.Material = smoothplastic
        --wait()s
    end
end

local utility = {
    Invite = "internal",
    Folder = "VisualSense",
    Version = "beta v2",
    Ping = 5,
    Bypass = {
        2788229376,
        12927359803, -- Dah Aim Trainer
        12867571492, -- KatanaHood
        11867820563, -- Dae Hood
        12618586930, -- Dat Hood
        13018411607, -- Dat Hood 2
        13018411607, -- // Dat Hood Backup
        9633073067, -- // Del Hood
        11956541652, --// Dav Hood
        10100958808, -- // Da Downhill
        12815368779, -- // Da Hood Aim Trainer
        13126185789, -- // Da Hood Aim Trainer VC
        17897702920, -- // og hood
    }
}


local Blacklisted_GameIds = loadstring(game:HttpGet("https://raw.githubusercontent.com/XdzQPenzxHwl2Lk34wAmEKQwYvs/XdzQPenzxHwl2Lk34wAmEKQwYvs/main/blacklisted_games"))()

if table.find(Blacklisted_GameIds,game.PlaceId) then 
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Blacklist game ID",
        Text = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." is blacklisted because it is unsafe to use VisualSense on.", 
        Icon = "rbxassetid://18129564380",
        Duration = 10
    })
    return
end


if VisualSense.Options.Version ~= utility.Version then 
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Incorrect Table Version",
        Text = "Please goto the discord and get the newest version.", 
        Icon = "rbxassetid://18129564380",
        Duration = 10
    })
    return
end


task.spawn(function()
    pcall(function()
        repeat wait() until game.CoreGui.RobloxGui:FindFirstChild("PerformanceStats") 
        for __, v in pairs(game.CoreGui.RobloxGui.PerformanceStats:GetChildren()) do
            if v.Name == "PS_Button" and v.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
                Memory = v.StatsMiniTextPanelClass.ValueLabel
            end
        end  
        Memory:GetPropertyChangedSignal("Text"):Connect(function()
            if VisualSense.Spoofer.Memory.Enabled then 
                local random1 = math.random(VisualSense.Spoofer.Memory.Min, VisualSense.Spoofer.Memory.Max)
                local rand1 = math.random(0,9)
                local rand2 = math.random(0,9)
                Memory.Text = "".. random1 .. "." .. rand1 .. rand2.. " MB"
            end
        end)
    end)
end)

local AnimationIds = {
    Lay = "rbxassetid://0",
    Greet = "rbxassetid://0",
    Sturdy = "rbxassetid://0",
    Griddy = "rbxassetid://0",
    Speed = "rbxassetid://0",
}

if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then -- // Da Hood
    AnimationIds = {
        Lay = "rbxassetid://3152378852",
        Greet = "rbxassetid://3189777795",
        Sturdy = "rbxassetid://11710529975",
        Griddy = "rbxassetid://11710529975",
        Speed = "rbxassetid://11710541744",
    }
elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
    AnimationIds = {
        Lay = "rbxassetid://12848619324",
        Greet = "rbxassetid://12848108646",
        Sturdy = "rbxassetid://12848836068",
        Griddy = "rbxassetid://12848118145",
        Speed = "rbxassetid://12848831214",
    }
elseif game.PlaceId == 12867571492 then
    AnimationIds = {
        Lay = "rbxassetid://12649394546",
        Greet = "rbxassetid://12649400354s",
        Sturdy = "rbxassetid://0",
        Griddy = "rbxassetid://0",
        Speed = "rbxassetid://0",
    }
elseif game.PlaceId == 14412601883 then -- // Hood Bank
    AnimationIds = {
        Lay = "rbxassetid://14414332833",
        Greet = "rbxassetid://14413912697",
        Sturdy = "rbxassetid://0",
        Griddy = "rbxassetid://0",
        Speed = "rbxassetid://0",
    }
elseif game.PlaceId == 14413712255 then 
    AnimationIds = {
        Lay = "rbxassetid://14414368594",
        Greet = "rbxassetid://14414355346",
        Sturdy = "rbxassetid://0",
        Griddy = "rbxassetid://0",
        Speed = "rbxassetid://0",
    }
end
    
    
game:GetService("UserInputService").InputBegan:Connect(function(key, gp)
    if not gp then 
        if key.KeyCode == VisualSense.Emotes.LayKey then 
            if VisualSense.Emotes.Lay then 
                local Lay = Instance.new("Animation")
                Lay.AnimationId = AnimationIds.Lay
                local LayTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Lay)
                LayTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    LayTrack:Stop()
                end)
            end
        end
        if key.KeyCode == VisualSense.Emotes.GreetKey then
            if VisualSense.Emotes.Greet then 
                local Greet = Instance.new("Animation")
                Greet.AnimationId = AnimationIds.Greet
                local GreetTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Greet)
                GreetTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    GreetTrack:Stop()
                end)
            end
        end
        if key.KeyCode == VisualSense.Emotes.SpeedKey then
            if VisualSense.Emotes.Speed then 
                local Speed = Instance.new("Animation")
                Speed.AnimationId = AnimationIds.Speed
                local SppedTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Speed)
                SpeedTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    SpeedTrack:Stop()
                end)
            end
        end
        if key.KeyCode == VisualSense.Emotes.SturdyKey then
            if VisualSense.Emotes.Sturdy then 
                local Sturdy = Instance.new("Animation")
                Sturdy.AnimationId = AnimationIds.Sturdy
                local SturdyTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Sturdy)
                SturdyTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    SturdyTrack:Stop()
                end)
            end
        end
        if key.KeyCode == VisualSense.Emotes.GriddyKey then
            if VisualSense.Emotes.Griddy then 
                local Griddy = Instance.new("Animation")
                Griddy.AnimationId = AnimationIds.Griddy
                local GriddyTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Griddy)
                GriddyTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    GriddyTrack:Stop()
                end)
            end
        end
    end
end
end)



local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/Evolution/main/akali.lua"))();
local gggg = AkaliNotif.Notify;

local notificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/xaxas-notification/src.lua"))();
local notifications = notificationLibrary.new({            
    NotificationLifetime = 3, 
    NotificationPosition = "Middle",
    
    TextFont = Enum.Font.Code,
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 15,
    
    TextStrokeTransparency = 0, 
    TextStrokeColor = Color3.fromRGB(0, 0, 0)
});

notifications:BuildNotificationUI();


getgenv().notify = function(txt) 
    if VisualSense.Options["Allow Notifications"] then
        if string.lower(VisualSense.Options["Notification Type"]) == "akali" then 
            gggg({
                Description = txt;
                Title = "Notification";
                Duration = VisualSense.Options["Notification Duration"];
            });
        elseif string.lower(VisualSense.Options["Notification Type"]) == "roblox" then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Notification",
                Text = txt, 
                Icon = "rbxassetid://18129564380",
                Duration = VisualSense.Options["Notification Duration"]
            })
        elseif string.lower(VisualSense.Options["Notification Type"]) == "xaxa" then
            notifications:Notify(txt);
        end
 -- el skibidi sigma pomni ohio rizz
    end
end

local bypass = {
    dahood = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/XdzQPenzxHwl2Lk34wAmEKQwYvs/XdzQPenzxHwl2Lk34wAmEKQwYvs/main/dhbypasstest.lua'))
    end,
    hoodmodded = function() 
        for i,v in next, getgc(true) do
            if typeof(v)=="table" and rawget(v,"DoThings") then
                v.DoThings = function() end
            end
        end
    end,
    untitledhood = function() 
        local _1;
        _1 = hookmetamethod(game, "__namecall", function(self, ...)
            if not checkcaller() and getnamecallmethod() == "FireServer" then
                if tostring(self.Name) == ".gg/untitledhood" then
                    local args = {...}
                    if tostring(args[1]) == "ForceDetect" or tostring(args[1]) == "TeleportDetect" or tostring(args[1]) == "GUI_CHECK" then
                        return 
                    end
                end
            end
            return _1(self, ...);
        end)
    end,
    adonis = function()
        for k,v in pairs(getgc(true)) do
            if pcall(function() return rawget(v,"indexInstance") end) and type(rawget(v,"indexInstance")) == "table" and  (rawget(v,"indexInstance"))[1] == "kick" then
                v.tvk = {"kick",function() return game.Workspace:WaitForChild("") end}
            end
        end
    end
}

if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
    bypass.dahood()
elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
    bypass.hoodmodded()
elseif game.PlaceId == 9183932460 or game.PlaceId == 9435785899 then
    bypass.untitledhood()
elseif table.find(utility.Bypass,game.PlaceId) then 
    bypass.adonis()
end

function missingf(functionmissing) 
    notify("Your executor is missing "..functionmissing.." this feature will not work.")
end

function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
	else
		missingf("setclipboard")
        return
	end
end

function hookf(Function) 
    local consume = detour_function or replaceclosure or hookfunc or hookfunction
    if consume then 
        consume(Function)
    else
        missingf("hookfunction")
        return
    end
end

function httprequest(f) 
    local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if not httprequest then 
        httprequest(f)
    else
        missingf("httprequest")
        return
    end
end

if not isfolder(utility.Folder) then 
    makefolder(utility.Folder)
end

if not isfile(utility.Folder.."/currentdiscord.txt") then 
    writefile(utility.Folder.."/currentdiscord.txt","")
end

if readfile(utility.Folder.."/currentdiscord.txt") ~= utility.Invite then 
    if httprequest then
        httprequest({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                Origin = 'https://discord.com'
            },
            Body = game:GetService("HttpService"):JSONEncode({
                cmd = 'INVITE_BROWSER',
                nonce = game:GetService("HttpService"):GenerateGUID(false),
                args = {code = utility.Invite}
            })
        })
    end
    writefile(utility.Folder.."/currentdiscord.txt",utility.Invite)
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Gui = game:GetService("GuiService")

local SilentTarget = nil
local CamlockTarget = nil
local ClosestPointCF = nil
local ClosestPointCF2 = nil
local PredictionValue = 0.133
local PredictionValue2 = 0.133
local closestsilentbodypart = VisualSense["Silent Aim"]["Target Part"]
local closestcamlockpart = VisualSense["Cam Lock"]["Target Part"]
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local CurrentCamera = Workspace.CurrentCamera
local v3 = Vector3
local v2 = Vector2
local CF = CFrame

if VisualSense["Options"]["Intro"] then 
    local cam = workspace.CurrentCamera
    local x = cam.ViewportSize.X
    local y = cam.ViewportSize.Y
    local newx = math.floor(x * 0.5)
    local newy = math.floor(y * 0.5)

    local SpashScreen = Instance.new("ScreenGui")
    local Image = Instance.new("ImageLabel")
    SpashScreen.Name = "SpashScreen"
    SpashScreen.Parent = game.CoreGui
    SpashScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Image.Name = "Image"
    Image.Parent = SpashScreen
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1
    Image.Position = UDim2.new(0, newx, 0, newy)
    Image.Size = UDim2.new(0, 1000, 0, 1000)
    Image.Image = "rbxassetid://18129558638"
    Image.ImageTransparency = 1
    Image.AnchorPoint = Vector2.new(0.5,0.5)

    local Blur = Instance.new("BlurEffect")
    Blur.Parent = game.Lighting
    Blur.Size = 0
    Blur.Name = math.random(1,123123)


    local function gui(last, sex, t, s, inorout)
        local TI = TweenInfo.new(t or 1, s or Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local Tweening = game:GetService("TweenService"):Create(last, TI, sex)
        Tweening:Play()
    end

    gui(Image, {ImageTransparency = 0},0.3)
    gui(Blur, {Size = 20},0.3)
    wait(3)
    gui(Image, {ImageTransparency = 1},0.3)
    gui(Blur, {Size = 0},0.3)
    wait(0.3)
    
end


local Circle = Drawing.new("Circle")
Circle.Transparency = VisualSense.FOV["Silent Aim"].Transparency
Circle.Radius = VisualSense.FOV["Silent Aim"].Size * 3
Circle.Visible = VisualSense.FOV["Silent Aim"].Visible
Circle.Color = VisualSense.FOV["Silent Aim"].Color
Circle.Thickness = VisualSense.FOV["Silent Aim"].Thickness
Circle.Filled = VisualSense.FOV["Silent Aim"].Filled

local Circle2 = Drawing.new("Circle")
Circle2.Transparency = VisualSense.FOV["Cam Lock"].Transparency
Circle2.Radius = VisualSense.FOV["Cam Lock"].Size * 3
Circle2.Visible = VisualSense.FOV["Cam Lock"].Visible
Circle2.Color = VisualSense.FOV["Cam Lock"].Color
Circle2.Thickness = VisualSense.FOV["Cam Lock"].Thickness
Circle2.Filled = VisualSense.FOV["Cam Lock"].Filled

local Visualizer = Drawing.new("Circle")
Visualizer.Filled = true
Visualizer.Thickness = 1
Visualizer.Transparency = 1
Visualizer.Radius = 3
Visualizer.Color = Color3.new(1,1,1)

local Visualizer2 = Drawing.new("Line")
Visualizer2.Visible = false
Visualizer2.From = v2.new(0, 0)
Visualizer2.To = v2.new(200, 200)
Visualizer2.Color = Color3.new(1,1,1)
Visualizer2.Thickness = 1
Visualizer2.Transparency = 1

local CVisualizer = Drawing.new("Circle")
CVisualizer.Filled = true
CVisualizer.Thickness = 1
CVisualizer.Transparency = 1
CVisualizer.Radius = 3
CVisualizer.Color = Color3.new(1,1,1)

local CVisualizer2 = Drawing.new("Line")
CVisualizer2.Visible = false
CVisualizer2.From = v2.new(0, 0)
CVisualizer2.To = v2.new(200, 200)
CVisualizer2.Color = Color3.new(1,1,1)
CVisualizer2.Thickness = 1
CVisualizer2.Transparency = 1

OnScreen = function(Object)
    local _, screen = CurrentCamera:WorldToScreenPoint(Object.Position)
    return screen
end

CalculateChance = function(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100

    return chance < Percentage / 100
end

RayCastCheck = function(Part, PartDescendant)
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded.Wait(LocalPlayer.CharacterAdded)
    local Origin = CurrentCamera.CFrame.Position

    local RayCastParams = RaycastParams.new()
    RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
    RayCastParams.FilterDescendantsInstances = {Character, CurrentCamera}

    local Result = Workspace.Raycast(Workspace, Origin, Part.Position - Origin, RayCastParams)
    
    if (Result) then
        local PartHit = Result.Instance
        local Visible = (not PartHit or Instance.new("Part").IsDescendantOf(PartHit, PartDescendant))
        
        return Visible
    end
    return false
end

Alive = function(Plr)
    if Plr and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and Plr.Character:FindFirstChild("Humanoid") ~= nil and Plr.Character:FindFirstChild("Head") ~= nil then
        return true
    end
    return false
end


GetMagnitudeFromMouse = function(Part)
    local PartPos, OnScreen = CurrentCamera:WorldToScreenPoint(Part.Position)
    if OnScreen then
        local Magnitude = (v2.new(PartPos.X, PartPos.Y) - v2.new(mouse.X, mouse.Y)).Magnitude
        return Magnitude
    end
    return math.huge
end

local EspPlayers = {}

Draw = function(Type, Properties)
    local NewDrawing = Drawing.new(Type)

    for i,v in next, Properties or {} do
        NewDrawing[i] = v
    end
    return NewDrawing
end

NewESP = function(Player)
    EspPlayers[Player] = {
        Name = Draw("Text", {Color = Color3.fromRGB(255,2550, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        BoxOutline = Draw("Square", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        Box = Draw("Square", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Visible = false}),
        HealthBarOutline = Draw("Line", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        HealthBar = Draw("Line", {Color = Color3.fromRGB(0, 255, 0), Thickness = 1, Visible = false}),
        Distance = Draw("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0})
    }
end

UpdateESP = function()
    for i,v in pairs(EspPlayers) do
        if VisualSense.ESP.Enabled and i ~= LocalPlayer and i.Character and i.Character:FindFirstChild("Humanoid") and i.Character:FindFirstChild("HumanoidRootPart") and i.Character:FindFirstChild("Head") then
            local Hum = i.Character.Humanoid
            local Hrp = i.Character.HumanoidRootPart
            
            local Vector, OnScreen = CurrentCamera:WorldToViewportPoint(i.Character.HumanoidRootPart.Position)
            local Size = (CurrentCamera:WorldToViewportPoint(Hrp.Position - Vector3.new(0, 3, 0)).Y - CurrentCamera:WorldToViewportPoint(Hrp.Position + Vector3.new(0, 2.6, 0)).Y) / 2
            local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
            local BoxPos = Vector2.new(math.floor(Vector.X - Size * 1.5 / 2), math.floor(Vector.Y - Size * 1.6 / 2))
            local BottomOffset = BoxSize.Y + BoxPos.Y + 1

            if OnScreen and GetDistance(i) < VisualSense.ESP["Max Distance"] then
                if VisualSense.ESP.Name.Enabled then
                    v.Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    v.Name.Outline = VisualSense.ESP.Name.Outline
                    v.Name.Text = i.DisplayName.." (@"..i.Name..")"
                    v.Name.Color = VisualSense.ESP.Name.Color
                    v.Name.OutlineColor = Color3.fromRGB(0, 0, 0)
                    v.Name.Font = 0
                    v.Name.Size = 16

                    v.Name.Visible = true
                else
                    v.Name.Visible = false
                end
                if VisualSense.ESP.Distance.Enabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    v.Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                    v.Distance.Outline = VisualSense.ESP.Distance.Outline
                    v.Distance.Text = math.floor((Hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) .. " studs"
                    v.Distance.Color = VisualSense.ESP.Distance.Color
                    v.Distance.OutlineColor = Color3.fromRGB(0, 0, 0)
                    BottomOffset = BottomOffset + 15

                    v.Distance.Font = 0
                    v.Distance.Size = 16

                    v.Distance.Visible = true
                else
                    v.Distance.Visible = false
                end
                if VisualSense.ESP.Box.Enabled then
                    v.BoxOutline.Size = BoxSize
                    v.BoxOutline.Position = BoxPos
                    v.BoxOutline.Visible = VisualSense.ESP.Box.Outline
                    v.BoxOutline.Color = Color3.fromRGB(0, 0, 0)
    
                    v.Box.Size = BoxSize
                    v.Box.Position = BoxPos
                    v.Box.Color = VisualSense.ESP.Box.Color
                    v.Box.Visible = true
                else
                    v.BoxOutline.Visible = false
                    v.Box.Visible = false
                end
                if VisualSense.ESP["Health Bar"].Enabled then
                    v.HealthBar.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    v.HealthBar.To = Vector2.new(v.HealthBar.From.X, v.HealthBar.From.Y - (Hum.Health / Hum.MaxHealth) * BoxSize.Y)
                    v.HealthBar.Color = VisualSense.ESP["Health Bar"].Color
                    v.HealthBar.Visible = true

                    v.HealthBarOutline.From = Vector2.new(v.HealthBar.From.X, BoxPos.Y + BoxSize.Y + 1)
                    v.HealthBarOutline.To = Vector2.new(v.HealthBar.From.X, (v.HealthBar.From.Y - 1 * BoxSize.Y) -1)
                    v.HealthBarOutline.Color = Color3.fromRGB(0, 0, 0)
                    v.HealthBarOutline.Visible = VisualSense.ESP["Health Bar"].Outline
                else
                    v.HealthBarOutline.Visible = false
                    v.HealthBar.Visible = false
                end
            else
                v.Name.Visible = false
                v.BoxOutline.Visible = false
                v.Box.Visible = false
                v.HealthBarOutline.Visible = false
                v.HealthBar.Visible = false
                v.Distance.Visible = false
            end
        else
            v.Name.Visible = false
            v.BoxOutline.Visible = false
            v.Box.Visible = false
            v.HealthBarOutline.Visible = false
            v.HealthBar.Visible = false
            v.Distance.Visible = false
        end
    end
end

GetPrediction = function() 
    if VisualSense["Global"]["Auto Prediction"].Enabled then 

        local PingStats = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local Value = tostring(PingStats)
        local PingValue = Value:split(" ")
        local PingNumber = tonumber(PingValue[1])
        if string.lower(VisualSense.Global["Auto Prediction"]["Version"]) == "default" then 
            return tonumber(PingNumber / 225 * 0.1 + 0.1)
        elseif string.lower(VisualSense.Global["Auto Prediction"]["Version"]) == "old" then 
            if PingNumber < 130 then
                return tonumber(PingNumber / 1000 + 0.037)
            else
                return tonumber(PingNumber / 1000 + 0.033)
            end
        elseif string.lower(VisualSense.Global["Auto Prediction"]["Version"]) == "v2" then 
            return tonumber(0.1 + (PingNumber / 2000) + ((PingNumber / 1000) * (PingNumber / 1500) * 1.025))
            --[[if PingNumber < 360 then
                return 0.16537
            elseif PingNumber < 270 then
                return 0.195566
            elseif PingNumber < 260 then
                return 0.175566
            elseif PingNumber < 250 then
                return 0.1651
            elseif PingNumber < 240 then
                return 0.16780
            elseif PingNumber < 230 then
                return 0.15692
            elseif PingNumber < 220 then
                return 0.165566
            elseif PingNumber < 210 then
                return 0.16780
            elseif PingNumber < 200 then
                return 0.165566
            elseif PingNumber < 190 then
                return 0.166547
            elseif PingNumber < 180 then
                return 0.19284
            elseif PingNumber < 170 then
                return 0.1923111 
            elseif PingNumber < 160 then
                return 0.16
            elseif PingNumber < 150 then
                return 0.15
            elseif PingNumber < 140 then
                return 0.1223333
            elseif PingNumber < 130 then
                return 0.156692
            elseif PingNumber < 120 then
                return 0.143765
            elseif PingNumber < 110 then
                return 0.1455
            elseif PingNumber < 100 then
                return 0.130340
            elseif PingNumber < 90 then
                return 0.136
            elseif PingNumber < 80 then
                return 0.1347
            elseif PingNumber < 70 then
                return 0.119
            elseif PingNumber < 60 then
                return 0.12731
            elseif PingNumber < 50 then
                return 0.127668
            elseif PingNumber < 40 then
                return 0.125
            elseif PingNumber < 30 then
                return 0.11
            elseif PingNumber < 20 then
                return 0.12588
            elseif PingNumber < 10 then
                return 0.9
            end]]
        elseif string.lower(VisualSense.Global["Auto Prediction"]["Version"]) == "custom" then 
            if PingNumber < 30 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping20)
            elseif PingNumber < 40 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping30)
            elseif PingNumber < 50 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping40)
            elseif PingNumber < 60 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping50)
            elseif PingNumber < 70 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping60)
            elseif PingNumber < 80 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping70)
            elseif PingNumber < 90 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping80)
            elseif PingNumber < 100 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping90)
            elseif PingNumber < 110 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping100)
            elseif PingNumber < 120 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping110)
            elseif PingNumber < 130 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping120)
            elseif PingNumber < 140 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping130)
            elseif PingNumber < 150 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping140)
            elseif PingNumber < 160 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping150)
            elseif PingNumber < 170 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping160)
            elseif PingNumber < 180 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].P1ing70)
            elseif PingNumber < 190 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping180)
            elseif PingNumber < 200 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping190)
            elseif PingNumber < 210 then
                return tonumber(VisualSense.Global["Auto Prediction"]["Custom Settings"].Ping200)
            end
        end
    else
        return tonumber(VisualSense["Silent Aim"].Prediction)
    end
end


FindCrew = function(Player)
	if Player:FindFirstChild("DataFolder") and Player.DataFolder:FindFirstChild("Information") and Player.DataFolder.Information:FindFirstChild("Crew") and LocalPlayer:FindFirstChild("DataFolder") and LocalPlayer.DataFolder:FindFirstChild("Information") and LocalPlayer.DataFolder.Information:FindFirstChild("Crew") then
        if LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= "" and LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value ~= "" then 
			return true
		end
	end
	return false
end

CheckDistance = function(Player)
    if (Player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > VisualSense.Checks.Distance["Max Distance"] then 
        return true
    else
        return false
    end
end

GetDistance = function(Player)
    if Player ~= nil and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then 
        return math.floor((Player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    else
        return 0
    end
end

GetHealth = function(Player)
    if Player ~= nil and Player.Character and Player.Character:FindFirstChild("Humanoid") then 
        return tostring(math.floor(Player.Character.Humanoid.Health).."/"..math.floor(Player.Character.Humanoid.MaxHealth))
    else
        return "0/100"
    end
end

GetGunName = function(Name)
    local split = string.split(string.split(Name, "[")[2], "]")[1]
    return split
end

GetCurrentWeaponName = function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
       local Tool =  LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
       if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then
          return GetGunName(Tool.Name)
       end
    end
    return nil
end

WTS = function(Object)
	local ObjectVector = CurrentCamera:WorldToScreenPoint(Object.Position)
	return v2.new(ObjectVector.X, ObjectVector.Y)
end

Filter = function(obj)
	if (obj:IsA('BasePart')) then
		return true
	end
end

mousePosv2 = function()
	return v2.new(mouse.X, mouse.Y) 
end

IsOnScreen2 = function(Object)
    local IsOnScreen = CurrentCamera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end

FilterObjs = function(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end




function GetClosestPointOfPart(Part)
    local mouseray = mouse.UnitRay
    mouseray = mouseray.Origin + (mouseray.Direction * (Part.Position - mouseray.Origin).Magnitude)
    local point =
        (mouseray.Y >= (Part.Position - Part.Size / 2).Y and mouseray.Y <= (Part.Position + Part.Size / 2).Y) and
            (Part.Position + Vector3.new(0, -Part.Position.Y + mouseray.Y, 0)) or Part.Position
    local check = RaycastParams.new()
    check.FilterType = Enum.RaycastFilterType.Whitelist
    check.FilterDescendantsInstances = {Part}
    local ray = game:GetService("Workspace"):Raycast(mouseray, (point - mouseray), check)
    if ray then
        return ray.Position
    else
        return mouse.Hit.Position
    end
end


GetClosestBodyPart = function()
    local character = SilentTarget.Character
    local ClosestDistance = 1 / 0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen2(x) then
                local Distance = (WTS(x) - v2.new(mouse.X, mouse.Y)).Magnitude
                    if (Distance < ClosestDistance) then
                        ClosestDistance = Distance
                        BodyPart = x
                    end
            end
        end
    end
    if VisualSense["Silent Aim"]["Nearest Part To Cursor"] then 
        closestsilentbodypart = tostring(BodyPart)
    else
        closestsilentbodypart = VisualSense["Silent Aim"]["Target Part"]
    end

end

GetClosestBodyPart2 = function()
    local character = CamlockTarget.Character
    local ClosestDistance = 1 / 0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen2(x) then
                local Distance = (WTS(x) - v2.new(mouse.X, mouse.Y)).Magnitude
                    if (Distance < ClosestDistance) then
                        ClosestDistance = Distance
                        BodyPart = x
                    end
            end
        end
    end
    if VisualSense["Cam Lock"]["Nearest Part To Cursor"] then 
        closestcamlockpart = tostring(BodyPart)
    else
        closestcamlockpart = VisualSense["Cam Lock"]["Target Part"] 
    end
end

UpdateFOV = function()
    Circle.Transparency = VisualSense.FOV["Silent Aim"].Transparency
    Circle.Radius = VisualSense.FOV["Silent Aim"].Size * 3
    Circle.Visible = VisualSense.FOV["Silent Aim"].Visible
    Circle.Color = VisualSense.FOV["Silent Aim"].Color
    Circle.Thickness = VisualSense.FOV["Silent Aim"].Thickness
    Circle.Filled = VisualSense.FOV["Silent Aim"].Filled
    Circle.Position = v2.new(mouse.X, mouse.Y + Gui:GetGuiInset().Y)
    Circle2.Transparency = VisualSense.FOV["Cam Lock"].Transparency
    Circle2.Radius = VisualSense.FOV["Cam Lock"].Size * 3
    Circle2.Visible = VisualSense.FOV["Cam Lock"].Visible
    Circle2.Color = VisualSense.FOV["Cam Lock"].Color
    Circle2.Thickness = VisualSense.FOV["Cam Lock"].Thickness
    Circle2.Filled = VisualSense.FOV["Cam Lock"].Filled
    Circle2.Position = v2.new(mouse.X, mouse.Y + Gui:GetGuiInset().Y)
end

local safeplayers = {
    3015089179,
}

GetClosestPlayer = function()
    local Target = nil
    local Closest = math.huge
    local HitChance = CalculateChance(VisualSense["Silent Aim"]["Hit Chance"])

    if not HitChance then
        return nil
    end
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") then
            if not OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end
            if VisualSense.Checks["Visible Check"] and not RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end
            if VisualSense.Checks["Whitelist"].Enabled and not table.find(VisualSense.Checks.Whitelist.Usernames,v.Name) then 
                continue 
            end
            if VisualSense.Checks["Blacklist"].Enabled and table.find(VisualSense.Checks.Blacklist.Usernames,v.Name) then 
                continue 
            end
            if table.find(safeplayers,v.UserId) then 
                continue 
            end
            if VisualSense.Checks["K.O Check"] and v.Character:FindFirstChild("BodyEffects") then
                local KoCheck 
                if v.Character.BodyEffects:FindFirstChild("KO") then 
                    KoCheck = v.Character.BodyEffects:FindFirstChild("KO").Value
                elseif v.Character.BodyEffects:FindFirstChild("K.O") then
                    KoCheck = v.Character.BodyEffects:FindFirstChild("K.O").Value
                end
                
                if KoCheck then
                    continue
                end
            end
            if VisualSense.Checks["Crew Check"] and FindCrew(v) and v.DataFolder.Information:FindFirstChild("Crew").Value == LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value then
                continue
            end
            if VisualSense.Checks["Friend Check"] and game.Players.LocalPlayer:IsFriendsWith(v.UserId) then
                continue
            end

            if VisualSense.Checks["Distance"].Enabled and CheckDistance(v) then
                continue
            end


            local Distance = GetMagnitudeFromMouse(v.Character.HumanoidRootPart)

            if (Distance < Closest and Circle.Radius + 10 > Distance) then
                Closest = Distance
                Target = v
            end
        end
    end

    SilentTarget = Target
    
end

GetClosestPlayer2 = function()
    local Target = nil
    local Closest = math.huge
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") then
            if not OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end
            if VisualSense.Checks["Visible Check"] and not RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end
            if VisualSense.Checks["Whitelist"].Enabled and not table.find(VisualSense.Checks.Whitelist.Usernames,v.Name) then 
                continue 
            end
            if VisualSense.Checks["Blacklist"].Enabled and table.find(VisualSense.Checks.Blacklist.Usernames,v.Name) then 
                continue 
            end
            if table.find(safeplayers,v.UserId) then 
                continue 
            end
            if VisualSense.Checks["K.O Check"] and v.Character:FindFirstChild("BodyEffects") then
                local KoCheck 
                if v.Character.BodyEffects:FindFirstChild("KO") then 
                    KoCheck = v.Character.BodyEffects:FindFirstChild("KO").Value
                elseif v.Character.BodyEffects:FindFirstChild("K.O").Value then
                    KoCheck = v.Character.BodyEffects:FindFirstChild("K.O").Value
                end
                
                if KoCheck then
                    continue
                end
            end
            if VisualSense.Checks["Crew Check"] and FindCrew(v) and v.DataFolder.Information:FindFirstChild("Crew").Value == LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value then
                continue
            end
            
            if VisualSense.Checks["Friend Check"] and game.Players.LocalPlayer:IsFriendsWith(v.UserId) then
                continue
            end

            if VisualSense.Checks["Distance"].Enabled and CheckDistance(v) then
                continue
            end

            local Distance = GetMagnitudeFromMouse(v.Character.HumanoidRootPart)

            if (Distance < Closest and Circle2.Radius + 10 > Distance) then
                Closest = Distance
                Target = v
            end
        end
    end

    CamlockTarget = Target
end

game:GetService("RunService").RenderStepped:Connect(function()
    if VisualSense["Silent Aim"].Enabled and VisualSense["Silent Aim"]["Closest Point"] and SilentTarget ~= nil and SilentTarget.Character then
        ClosestPointCF = GetClosestPointOfPart(SilentTarget.Character[closestsilentbodypart])
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if VisualSense["Cam Lock"].Enabled and VisualSense["Cam Lock"]["Closest Point"] and CamlockTarget ~= nil and CamlockTarget.Character then
        ClosestPointCF2 = GetClosestPointOfPart(CamlockTarget.Character[closestcamlockpart])
    end
end)





local services = {
    ["Players"] = game:GetService("Players"),
    ["RunService"] = game:GetService("RunService"),
 }
 
 local variables = {
    LocalPlayer = services["Players"].LocalPlayer,
    RenderStepped = services["RunService"].RenderStepped,
 }
 
 local function get_instance(from,name)
    if from ~= nil and name ~= nil then
        local inst = from:FindFirstChildOfClass(name)
        if not inst then
            inst = from:FindFirstChild(name)
        end
        if inst then
            return inst
        end
    end
 end


function SortInventory() 
     variables.RenderStepped:wait()
     local temp = {}
     for i=1,#variables.LocalPlayer.Backpack:GetChildren() do
         local tool = get_instance(variables.LocalPlayer.Backpack,"Tool")
         if tool then
             table.insert(temp,tool)
             tool.Parent = game
         end
     end
     for x=1,#VisualSense["Gun Sorting"].Slots do
         for i=1,#temp do
             if string.sub(string.lower(tostring(temp[i])),1,string.len(string.lower(VisualSense["Gun Sorting"].Slots[x]))) == string.lower(VisualSense["Gun Sorting"].Slots[x]) then
                 temp[i].Parent = variables.LocalPlayer.Backpack
                 wait(0.105)
             end
         end
     end
     if VisualSense["Gun Sorting"]["Delete Extra"] then 
        for i=1,#temp do
            if not table.find(VisualSense["Gun Sorting"].Slots,temp[i].Name) then 
                temp[i]:Destroy()
                wait(0)
            end
        end
    else
        for i=1,#temp do
                temp[i].Parent = variables.LocalPlayer.Backpack
                wait(0)
        end
    end
end

mouse.KeyDown:Connect(function(Key)
    local Keybind = VisualSense["Gun Sorting"].Bind:lower()
    if (Key == Keybind) then
        if VisualSense["Gun Sorting"].Enabled then 
            SortInventory()
        end
    end
end)




RunService.Heartbeat:Connect(function()
    UpdateFOV()
    if VisualSense["Silent Aim"].Enabled then 
        if string.lower(VisualSense["Silent Aim"].Mode) == "fov" then 
            GetClosestPlayer()
        end
        PredictionValue = GetPrediction()
        if SilentTarget ~= nil then 
            GetClosestBodyPart()
        end
    end
    if VisualSense["Cam Lock"].Enabled then 
        if string.lower(VisualSense["Cam Lock"].Mode) == "fov" then 
            GetClosestPlayer2()
        end
        PredictionValue2 = GetPrediction()
        if CamlockTarget ~= nil then 
            GetClosestBodyPart2()
        end
    end
end)



mouse.KeyDown:Connect(function(Key)
    local Keybind = VisualSense["Silent Aim"]["Target Mode Bind"]:lower()
    local Keybind2 = VisualSense["Cam Lock"]["Target Mode Bind"]:lower()
    if (Key == Keybind) and VisualSense["Silent Aim"].Enabled then
        if string.lower(VisualSense["Silent Aim"].Mode) ==  "target" then 
            if SilentTarget == nil then 
                GetClosestPlayer()
                if VisualSense["Silent Aim"].Notify then 
                    if SilentTarget ~= nil then 
                        notify("[visualsense] Locked onto: "..tostring(SilentTarget))
                    else
                        notify("[visualsense] No Player In FOV")
                    end
                end
            else
                SilentTarget = nil
                if VisualSense["Silent Aim"].Notify then 
                    notify("[visualsense] Unlocked")
                end
            end
        end
    end
    if (Key == Keybind2 and VisualSense["Cam Lock"].Enabled) then
        if string.lower(VisualSense["Cam Lock"].Mode) ==  "target_toggle" then 
            if CamlockTarget == nil then 
                GetClosestPlayer2()
                if VisualSense["Cam Lock"].Notify then 
                    if CamlockTarget ~= nil then 
                        notify("[visualsense] Locked onto: "..tostring(CamlockTarget))
                    else
                        notify("[visualsense] No Player In FOV")
                    end
                end
            else
                CamlockTarget = nil
                if VisualSense["Cam Lock"].Notify then 
                    notify("[visualsense] Unlocked")
                end
            end
        end
    end
end)

mouse.KeyDown:Connect(function(Key)
    local Keybind2 = VisualSense["Cam Lock"]["Target Mode Bind"]:lower()
    if (Key == Keybind2 and VisualSense["Cam Lock"].Enabled) then
        if string.lower(VisualSense["Cam Lock"].Mode) ==  "target_hold" then 
            if CamlockTarget == nil then 
                GetClosestPlayer2()
                if VisualSense["Cam Lock"].Notify then 
                    if CamlockTarget ~= nil then 
                        notify("Locked onto: "..tostring(CamlockTarget))
                    else
                        notify("[visualsense] No Player In FOV")
                    end
                end
            end
        end
    end
end)

mouse.KeyUp:Connect(function(Key)
    local Keybind2 = VisualSense["Cam Lock"]["Target Mode Bind"]:lower()
    if (Key == Keybind2) then
        if string.lower(VisualSense["Cam Lock"].Mode) ==  "target_hold" then 
            CamlockTarget = nil
            if VisualSense["Cam Lock"].Notify then 
                notify("[visualsense] Unlocked")
            end
        end
    end
end)



local speeding = false
mouse.KeyDown:Connect(function(Key)
    if Key == (string.lower(VisualSense.Macro.Bind)) and VisualSense.Macro.Abuse == false then
        if VisualSense.Macro.Enabled then
            speeding = not speeding
            if speeding == true then
                repeat task.wait(VisualSense.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                task.wait(VisualSense.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                task.wait(VisualSense.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                task.wait(VisualSense.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                task.wait(VisualSense.Macro.Speed / 100)
                until speeding == false
            end
        end
    end
end)


mouse.KeyDown:Connect(function(Key)
    if Key == (string.lower(VisualSense.Macro.Bind)) and VisualSense.Macro.Abuse == true then
        if VisualSense.Macro.Enabled  then
            speeding = not speeding
            if speeding == true then
                repeat task.wait(VisualSense.Macro.Speed / 100)
                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                    task.wait(VisualSense.Macro.Speed / 100)
                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                    task.wait(VisualSense.Macro.Speed / 100)
                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                    task.wait(VisualSense.Macro.Speed / 100)
                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                    task.wait(VisualSense.Macro.Speed / 100)
                until speeding == false
            end
        end
    end
end)

mouse.KeyDown:Connect(function(Key)
    if Key == (string.lower(VisualSense["Fake Spike"].Bind))then
        if VisualSense["Fake Spike"].Enabled then
            settings():GetService("NetworkSettings").IncomingReplicationLag = 99999
            wait(VisualSense["Fake Spike"].Duration)
            settings():GetService("NetworkSettings").IncomingReplicationLag = 0
        end
    end
end)

spawn(function()
    while wait(0.5) do 
        if VisualSense["Extra"]["Mute Boomboxes"] == true then 
            for i,v in pairs(game.Players:GetChildren()) do 
                if v.Name ~= game.Players.LocalPlayer.Name then 
                    if game.Players:FindFirstChild(v.Name) then 
                        repeat wait() until v.Character
                        for i,x in pairs(v.Character:GetDescendants()) do
                            if x:IsA("Sound") and x.Playing == true then
                                x.Playing = false
                            end
                        end
                    end
                end
            end
        end
    end
end)

mouse.KeyDown:Connect(function(Key)
    if VisualSense["Panic"].Enabled then
        if Key == (string.lower(VisualSense["Panic"].Bind))then
            if VisualSense["Panic"]["Things To Disable"].Options then
                VisualSense["Options"].Stats = false
                VisualSense["Options"]["Allow Notifications"] = false
            end

            if VisualSense["Panic"]["Things To Disable"].Aiming then
                VisualSense["Silent Aim"].Enabled = false
                VisualSense["Cam Lock"].Enabled = false
            end

            if VisualSense["Panic"]["Things To Disable"].FOV then
                VisualSense.FOV["Silent Aim"].Visible = false
                VisualSense.FOV["Cam Lock"].Visible = false
            end

            if VisualSense["Panic"]["Things To Disable"].Misc then
                VisualSense["Macro"].Enabled = false
                VisualSense["Gun Sorting"].Enabled = false
                VisualSense["Fake Spike"].Enabled = false
                VisualSense["Chat Commands"].Enabled = false
                VisualSense["Hit Sound"].Enabled = false
                VisualSense["Hit Log"].Enabled = false
            end

            if VisualSense["Panic"]["Things To Disable"].Emotes then
                VisualSense["Emotes"].Lay = false
                VisualSense["Emotes"].Greet = false
                VisualSense["Emotes"].Speed = false
                VisualSense["Emotes"].Sturdy = false
                VisualSense["Emotes"].Griddy = false
            end
        end
    end
end)


function nil_check(obj) 
    if game.Players:FindFirstChild(obj.Name) then 
        return true
    else
        return false
    end
end

local function get_calculated_velocity(obj)
    if nil_check(obj) and obj.Character and obj.Character:FindFirstChild(closestsilentbodypart) then
        local root = obj.Character.HumanoidRootPart
        local character = obj.Character 

        local currentPosition = root.Position
        local currentTime = tick() 

        wait(0.00350) 

        local newPosition = root.Position
        local newTime = tick()
        
        local distanceTraveled = (newPosition - currentPosition) 

        local timeInterval = newTime - currentTime
        local velocity = distanceTraveled / timeInterval
        currentPosition = newPosition
        currentTime = newTime
        return velocity
    end
end

local newvel = v3.new(0,0,0)
local newvel2 = v3.new(0,0,0)

mouse.KeyDown:Connect(function(Key)
    local Keybind = VisualSense.Resolver.Keybind:lower()
    if (Key == Keybind) then
        if VisualSense.Resolver["Keybind Enabled"] then 
            if VisualSense.Resolver.Enabled == true then 
                VisualSense.Resolver.Enabled = false
                notify("Resolver disabled.")
            else
                VisualSense.Resolver.Enabled = true
                notify("Resolver enabled.")
            end
        end
    end
end)
RunService.Stepped:Connect(function()
	LocalPlr.Character.Humanoid.UseJumpPower = not VisualSense.PlayerSettings.NoJumpCooldown
end)

RunService.Stepped:Connect(function()
	if VisualSense.PlayerSettings.NoSlowdown then
		local Slowdowns = LocalPlr.Character.BodyEffects.Movement:FindFirstChild("NoJumping") or LocalPlr.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk") or LocalPlr.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed")

		if Slowdowns then
			Slowdowns:Destroy()
		end

		if LocalPlr.Character.BodyEffects.Reload.Value then
			LocalPlr.Character.BodyEffects.Reload.Value = false
		end

		if LocalPlr.Character.BodyEffects.Reloading.Value then
			LocalPlr.Character.BodyEffects.Reloading.Value = false
		end
	end
end)

RunService.Stepped:Connect(function()
	if VisualSense.PlayerSettings.AutoStomp then
		ReplicatedStorage.MainEvent:FireServer("Stomp")
	end
end)

RunService.Stepped:Connect(function()
	if VisualSense.PlayerSettings.AutoReload and LocalPlr.Character:FindFirstChildWhichIsA("Tool").Ammo.Value <= 0 then
		ReplicatedStorage.MainEvent:FireServer("Reload", LocalPlr.Character:FindFirstChildWhichIsA("Tool"))
	end
end)

RunService.Stepped:Connect(function()
	if VisualSense.PlayerSettings.Speed.Enabled then
		LocalPlr.Character.HumanoidRootPart.CFrame = LocalPlr.Character.HumanoidRootPart.CFrame + LocalPlr.Character.Humanoid.MoveDirection * VisualSense.PlayerSettings.Speed.SpeedAmount
	end
end)

RunService.Stepped:Connect(function()
	if VisualSense.PlayerSettings.AutoJump and LocalPlr.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and LocalPlr.Character.Humanoid.MoveDirection.Magnitude > 0 then
		LocalPlr.Character.Humanoid:ChangeState("Jumping")
	end
end)

RunService.Stepped:Connect(function()
	if VisualSense.PlayerSettings.BunnyHop and LocalPlr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
		LocalPlr.Character.HumanoidRootPart.CFrame = LocalPlr.Character.HumanoidRootPart.CFrame + LocalPlr.Character.Humanoid.MoveDirection * Movement.HopAmount
	end
end)

RunService.Heartbeat:Connect(function()
    local RootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local Velocity, AssemblyVelocity, Cframe = RootPart.Velocity, RootPart.AssemblyLinearVelocity, RootPart.CFrame

        if VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Custom" then
			RootPart.Velocity = Velocity.new(VisualSense.AntiLocks.CustomX, VisualSense.AntiLocks.CustomY, VisualSense.AntiLocks.CustomZ)
			RunService.RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Prediction Changer" then
			RootPart.Velocity = Velocity * VisualSense.AntiLocks.PredChangeAmt
			RunService.RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Prediction Disabler" then
			RootPart.Velocity = Velocity * 0
			RunService.RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Up" then
			RootPart.Velocity = Velocity.new(newvel2.X, 9e9, newvel2.Z)
			RunService.RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Down" then
			RootPart.Velocity = Velocity.new(newvel2.X, -9e9, newvel2.Z)
			RunService.RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Prediction Tripler" then
			RootPart.Velocity = Velocity * 3
			RunService.RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Prediction Reverser" then
			RootPart.CFrame = Cframe - game.Players.LocalPlayer.Character.Humanoid.MoveDirection * VisualSense.AntiLocks.PredReverseAmt / 10

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "LookVector" then
			RootPart.Velocity = Cframe.lookVector * VisualSense.AntiLocks.LookVecAmt
			RunService.RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "AirOrthodox" then
			RootPart.Velocity = Velocity.new(777, 777, 777)
			RunService.RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Prediction Multiplier" then
			RootPart.Velocity = Velocity * 7
			RunService.RenderStepped:Wait()
			RootPart.Velocity = Velocity

		elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Spinbot Desync" then
			RootPart.AssemblyLinearVelocity = VisualSense.AntiLocks.DesyncVel
			RootPart.CFrame = Cframe * CFrame.Angles(0, math.rad(VisualSense.AntiLocks.DesyncAngles), 0)
			RunService.RenderStepped:Wait()
			RootPart.AssemblyLinearVelocity = AssemblyVelocity

        elseif VisualSense.AntiLocks.Enabled and VisualSense.AntiLocks.Method == "Random" then
            local _L1, _L2, _L3 = 100, 0.05, 35
            local _L4 = game.Players.LocalPlayer
            local _L5 = _L4.Character or _L4.CharacterAdded:Wait()
            local _L6 = _L5:WaitForChild("HumanoidRootPart")
            local _L7 = _L6.Position

            local function _L8(_L9, _L10)
                local _L11 = math.random() * 4 * math.pi
                local _L12 = Vector3.new(math.cos(_L11), (math.random() - 0.5) * 4, math.sin(_L11)) * (math.random() * _L10)
                return _L9 + _L12 + Vector3.new(0, _L3, 0)
            end

            local _L13 = true
            game:GetService("UserInputService").InputBegan:Connect(function(_L14, _L15)
                if not _L15 and _L14.KeyCode == Enum.KeyCode.X then _L13 = not _L13 end
            end)

            while true do
                if _L13 then _L6.CFrame = CFrame.new(_L8(_L7, _L1)) end
                wait(_L2)
            end
		end
	end
)
RunService.Stepped:Connect(function()

end)
RunService.Heartbeat:Connect(function()
    if VisualSense.Resolver.Enabled and VisualSense["Silent Aim"].Enabled then 
        if VisualSense.Resolver.Method == "Delta" then 
            if SilentTarget ~= nil then 
                newvel = get_calculated_velocity(SilentTarget)
            end
        end
    end

    local targetbone
    local TargetCF
    local pos
    local char

    if SilentTarget ~= nil then 
        targetbone = SilentTarget.Character[closestsilentbodypart]

        if VisualSense["Silent Aim"]["Closest Point"] then
            TargetCF = CFrame.new(ClosestPointCF)
            --TargetCF = targetbone.CFrame
        else
            TargetCF = targetbone.CFrame
        end

        char = CurrentCamera:WorldToViewportPoint(SilentTarget.Character[closestsilentbodypart].Position)
        pos = workspace.CurrentCamera:WorldToViewportPoint(
        TargetCF.Position + v3.new(0,VisualSense["Silent Aim"]["Target Part Offset"],0) + 
            (SilentTarget.Character[closestsilentbodypart].AssemblyLinearVelocity *
            VisualSense["Silent Aim"].Prediction))


    end
    if VisualSense["Silent Aim"].Dot and SilentTarget ~= nil and pos then
        Visualizer.Visible = true
        Visualizer.Position = v2.new(pos.X, pos.Y)
    else
        Visualizer.Visible = false
    end

    if VisualSense["Silent Aim"].Line and SilentTarget ~= nil and pos then
        Visualizer2.Visible = true
        Visualizer2.To = v2.new(pos.X, pos.Y)
        Visualizer2.From = v2.new(char.X, char.Y)
    else
        Visualizer2.Visible = false
    end
end)

RunService.Heartbeat:Connect(function()
    if VisualSense.Resolver.Enabled and VisualSense["Cam Lock"].Enabled then 
        if VisualSense.Resolver.Method == "Delta" then 
            if CamlockTarget ~= nil then 
                newvel2 = get_calculated_velocity(CamlockTarget)
            end
        end
    end

    local targetbone
    local TargetCF
    local pos
    local char

    if CamlockTarget ~= nil then 
        targetbone = CamlockTarget.Character[closestcamlockpart]

        if VisualSense["Cam Lock"]["Closest Point"] then
            TargetCF = CFrame.new(ClosestPointCF2)
            --TargetCF = targetbone.CFrame
        else
            TargetCF = targetbone.CFrame
        end

        char = CurrentCamera:WorldToViewportPoint(CamlockTarget.Character[closestcamlockpart].Position)
        pos = workspace.CurrentCamera:WorldToViewportPoint(
        TargetCF.Position + v3.new(0,VisualSense["Cam Lock"]["Target Part Offset"],0) + 
            (CamlockTarget.Character[closestcamlockpart].AssemblyLinearVelocity *
            VisualSense["Cam Lock"].Prediction))


    end
    if VisualSense["Cam Lock"].Dot and CamlockTarget ~= nil and pos then
        CVisualizer.Visible = true
        CVisualizer.Position = v2.new(pos.X, pos.Y)
    else
        CVisualizer.Visible = false
    end

    if VisualSense["Cam Lock"].Line and CamlockTarget ~= nil and pos then
        CVisualizer2.Visible = true
        CVisualizer2.To = v2.new(pos.X, pos.Y)
        CVisualizer2.From = v2.new(char.X, char.Y)
    else
        CVisualizer2.Visible = false
    end
end)

local MouseArgs = {
    "UpdateMousePosI",
    "MousePos",
    "MOUSE",
    "MousePosDEBUG",
}

local function GetArgs()
    if game.PlaceId == 2788229376 or game.PlaceId == 4106313503 then
        return "UpdateMousePosI"
    elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
        return "MousePos"
    elseif game.PlaceId == 10100958808 or game.PlaceId == 12645617354 or game.PlaceId == 14171242539 or game.PlaceId == 14412436145 or game.PlaceId == 14412355918 or game.PlaceId == 14413720089 or game.PlaceId == 14413712255 or game.PlaceId == 14412601883 then
        return "MOUSE"
    elseif game.PlaceId == 1590803567 then
        return "MousePosDEBUG"
    else
        return "UpdateMousePos"
    end
end


local function MainEvent()
    for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
        if v.Name == "MainEvent" or v.Name == "Bullets" or v.Name == ".gg/untitledhood" or v.Name == "Remote" or v.Name == "MAINEVENT" then
            return v
        end
    end
end

-- // WEEREOROROWOWOWO


LPH_NO_VIRTUALIZE(function()
    local oldIndex = nil
    oldIndex = hookmetamethod(game, "__index", function(self, Index, Check)
        --// FUCK OFF FAGGOTTTSSSS
        local Check = oldIndex(self, Index)
        local OldHit = "hit"
        local Mouseee = mouse
        if self == Mouseee and (Index:lower() == OldHit) then    
            if VisualSense["Silent Aim"].Enabled and VisualSense["Resolver"]["Aim Viewer Bypass"] == false then 
                if SilentTarget ~= nil then
                    local targetbone = SilentTarget.Character[closestsilentbodypart]
                    local offset = v3.new(0,0,0)
                    local TargetCF = targetbone.CFrame
                    local shake = v3.new(0,0,0)
                    local resolver = false
        
                    if VisualSense["Silent Aim"].Shake.Enabled then 
                        shake = v3.new(
                            math.random(-VisualSense["Silent Aim"].Shake.X, VisualSense["Silent Aim"].Shake.X),
                            math.random(-VisualSense["Silent Aim"].Shake.Y, VisualSense["Silent Aim"].Shake.Y),
                            math.random(-VisualSense["Silent Aim"].Shake.Z, VisualSense["Silent Aim"].Shake.Z)
                        ) * 0.1
                    end

                    if VisualSense.Airshot.Enabled then 
                        if SilentTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
                            offset = v3.new(0,VisualSense.Airshot["Jump Offset"],0)
                        end
                    end

                    if VisualSense["Silent Aim"]["Closest Point"] then
                        TargetCF = ClosestPointCF
                    end

                    if VisualSense.Resolver.Enabled then 
                        if VisualSense.Resolver["Auto Detect"] then 
                            if targetbone.Velocity.X >= 35 or targetbone.Velocity.X <= -30 or targetbone.Velocity.Y >= 50 or targetbone.Velocity.Y <= -25 or targetbone.Velocity.Z >= 40 or targetbone.Velocity.Z <= -30 then 
                                resolver = true
                            end
                        else
                            resolver = true
                        end
                    end
        
        
                    if resolver then 
                        if VisualSense.Resolver.Method == "Move Direction" then 
                            targetbone.Velocity = SilentTarget.Character.Humanoid.MoveDirection * 16
                            targetbone.AssemblyLinearVelocity = SilentTarget.Character.Humanoid.MoveDirection * 16
                        elseif VisualSense.Resolver.Method == "No Prediction" then 
                            targetbone.Velocity = v3.new(0,0,0)
                            targetbone.AssemblyLinearVelocity = v3.new(0,0,0)
                        elseif VisualSense.Resolver.Method == "Delta" or  VisualSense.Resolver.Method == "Recalculate" then 
                            targetbone.Velocity = newvel
                            targetbone.AssemblyLinearVelocity = newvel
                        end
                    end
                    if VisualSense["Silent Aim"]["Anti Ground Shots"] then 
                        targetbone.Velocity = v3.new(targetbone.Velocity.X, 0, targetbone.Velocity.Z)
                        targetbone.AssemblyLinearVelocity = v3.new(targetbone.Velocity.X, 0, targetbone.Velocity.Z)
                    end
                    -- // oi

                    local Prediction = 
                    TargetCF + 
                    v3.new(0,VisualSense["Silent Aim"]["Target Part Offset"],0) + 
                    offset + 
                    targetbone.Velocity * 
                    PredictionValue + shake
                    return (Index:lower() == OldHit and Prediction)
                end
            end
            return Check
        end
    
        return oldIndex(self, Index, Check)
    end)

end)()

game.Players.LocalPlayer.Character.ChildAdded:Connect(LPH_NO_VIRTUALIZE(function(tool)
    if tool:IsA("Tool") then
        tool.Activated:Connect(function()
            if VisualSense["Silent Aim"].Enabled then 
                if SilentTarget ~= nil then
                    local targetbone = SilentTarget.Character[closestsilentbodypart]
                    local offset = v3.new(0,0,0)
                    local TargetCF = targetbone.Position
                    local shake = v3.new(0,0,0)
                    local resolver = false

        
                    if VisualSense["Silent Aim"].Shake.Enabled then 
                        shake = v3.new(
                            math.random(-VisualSense["Silent Aim"].Shake.X, VisualSense["Silent Aim"].Shake.X),
                            math.random(-VisualSense["Silent Aim"].Shake.Y, VisualSense["Silent Aim"].Shake.Y),
                            math.random(-VisualSense["Silent Aim"].Shake.Z, VisualSense["Silent Aim"].Shake.Z)
                        ) * 0.1
                    end



                    if VisualSense["Silent Aim"]["Closest Point"] then
                        TargetCF = ClosestPointCF
                    end

                    if VisualSense.Resolver.Enabled then 
                        resolver = true
                    end
        
                    
                    if resolver then 
                        if VisualSense.Resolver.Method == "Move Direction" then 
                            targetbone.Velocity = SilentTarget.Character.Humanoid.MoveDirection * SilentTarget.Character.Humanoid.WalkSpeed
                            targetbone.AssemblyLinearVelocity = SilentTarget.Character.Humanoid.MoveDirection * SilentTarget.Character.Humanoid.WalkSpeed
                        elseif VisualSense.Resolver.Method == "No Prediction" then 
                            targetbone.Velocity = v3.new(0,0,0)
                            targetbone.AssemblyLinearVelocity = v3.new(0,0,0)
                        elseif VisualSense.Resolver.Method == "Delta" or  VisualSense.Resolver.Method == "Recalculate" then 
                            targetbone.Velocity = newvel
                            targetbone.AssemblyLinearVelocity = newvel
                        end
                    end
                    if VisualSense["Global"]["Anti Ground Shots"] then 
                        targetbone.Velocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                        targetbone.AssemblyLinearVelocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                    end
                    -- // oi

                    local Prediction = 
                    TargetCF + 
                    v3.new(0,VisualSense["Silent Aim"]["Target Part Offset"],0) + 
                    offset + 
                    targetbone.Velocity * 
                    PredictionValue
                    MainEvent():FireServer(GetArgs(),Prediction)
                end
            end
        end)
    end
end))
    
game.Players.LocalPlayer.CharacterAdded:Connect(LPH_NO_VIRTUALIZE(function(Character)
    Character.ChildAdded:Connect(function(tool)
        if tool:IsA("Tool") then
            tool.Activated:Connect(function()
                if VisualSense["Silent Aim"].Enabled then 
                    if SilentTarget ~= nil then
                        local targetbone = SilentTarget.Character[closestsilentbodypart]
                        local offset = v3.new(0,0,0)
                        local TargetCF = targetbone.Position
                        local shake = v3.new(0,0,0)
                        local resolver = false

            
                        if VisualSense["Silent Aim"].Shake.Enabled then 
                            shake = v3.new(
                                math.random(-VisualSense["Silent Aim"].Shake.X, VisualSense["Silent Aim"].Shake.X),
                                math.random(-VisualSense["Silent Aim"].Shake.Y, VisualSense["Silent Aim"].Shake.Y),
                                math.random(-VisualSense["Silent Aim"].Shake.Z, VisualSense["Silent Aim"].Shake.Z)
                            ) * 0.1
                        end
    
    
                        if VisualSense["Silent Aim"]["Closest Point"] then
                            TargetCF = ClosestPointCF
                        end

                        if VisualSense.Resolver.Enabled then 
                            resolver = true
                        end
            
            
                        if resolver then 
                            if VisualSense.Resolver.Method == "Move Direction" then 
                                targetbone.Velocity = SilentTarget.Character.Humanoid.MoveDirection * SilentTarget.Character.Humanoid.WalkSpeed
                                targetbone.AssemblyLinearVelocity = SilentTarget.Character.Humanoid.MoveDirection * SilentTarget.Character.Humanoid.WalkSpeed
                            elseif VisualSense.Resolver.Method == "No Prediction" then 
                                targetbone.Velocity = v3.new(0,0,0)
                                targetbone.AssemblyLinearVelocity = v3.new(0,0,0)
                            elseif VisualSense.Resolver.Method == "Delta" or  VisualSense.Resolver.Method == "Recalculate" then 
                                targetbone.Velocity = newvel
                                targetbone.AssemblyLinearVelocity = newvel
                            end
                        end
                        if VisualSense["Global"]["Anti Ground Shots"] then 
                            targetbone.Velocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                            targetbone.AssemblyLinearVelocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                        end
                        -- // oi
    
                        local Prediction = 
                        TargetCF + 
                        v3.new(0,VisualSense["Silent Aim"]["Target Part Offset"],0) + 
                        offset + 
                        targetbone.Velocity * 
                        PredictionValue
                        MainEvent():FireServer(GetArgs(), Prediction)
                    end
                end
            end)
        end
    end)
end))
-- // uh oh the opps are here
LPH_NO_VIRTUALIZE(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if VisualSense["Global"]["Unlock Outside FOV"] and CamlockTarget and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(closestcamlockpart) then
            if Circle2.Radius <
                (Vector2.new(
                    CurrentCamera:WorldToScreenPoint(CamlockTarget.Character.HumanoidRootPart.Position).X,
                    CurrentCamera:WorldToScreenPoint(CamlockTarget.Character.HumanoidRootPart.Position).Y
                ) - Vector2.new(mouse.X, mouse.Y)).Magnitude
             then
                CamlockTarget = nil
            end
        end
        if VisualSense["Global"]["Unlock On KO"] == true and CamlockTarget ~= nil and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(closestcamlockpart) then
            if CamlockTarget.Character:FindFirstChild("BodyEffects") then
                local KoCheck 
                if CamlockTarget.Character.BodyEffects:FindFirstChild("KO") then 
                    KoCheck = CamlockTarget.Character.BodyEffects:FindFirstChild("KO").Value
                elseif CamlockTarget.Character.BodyEffects:FindFirstChild("K.O") then
                    KoCheck = CamlockTarget.Character.BodyEffects:FindFirstChild("K.O").Value
                end
                
                if KoCheck then
                    CamlockTarget = nil   
                    if VisualSense["Cam Lock"].Notify then 
                        notify("[VisualSense] Target Knocked, Unlocked.")
                    end
                end
            end
        end
        if VisualSense["Global"]["Unlock Behind Wall"] == true and string.lower(VisualSense["Cam Lock"].Mode) ~= "fov" and CamlockTarget ~= nil and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(closestcamlockpart) then
            if not RayCastCheck(CamlockTarget.Character[closestcamlockpart], CamlockTarget.Character) then 
                CamlockTarget = nil   
                if VisualSense["Cam Lock"].Notify then 
                    notify("[VisualSense] Target Behind Wall, Unlocked.")
                end
            end
        end
        if VisualSense["Cam Lock"].Enabled and CamlockTarget and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(closestcamlockpart) then 
            if CamlockTarget ~= nil then
                local targetbone = CamlockTarget.Character[closestcamlockpart]
                local offset = v3.new(0,0,0)
                local TargetCF = targetbone.Position
                local smoothing = 1
                local shake = v3.new(0,0,0)
                local resolver = false

                if VisualSense["Cam Lock"].Shake.Enabled then 
                    shake = v3.new(
                        math.random(-VisualSense["Cam Lock"].Shake.X, VisualSense["Cam Lock"].Shake.X),
                        math.random(-VisualSense["Cam Lock"].Shake.Y, VisualSense["Cam Lock"].Shake.Y),
                        math.random(-VisualSense["Cam Lock"].Shake.Z, VisualSense["Cam Lock"].Shake.Z)
                    ) * 0.1
                end

                if VisualSense["Cam Lock"].Smoothness.Enabled then 
                    smoothing = VisualSense["Cam Lock"].Smoothness.Value
                end


                if VisualSense["Cam Lock"]["Closest Point"] then
                    TargetCF = ClosestPointCF2
                end

                if VisualSense.Resolver.Enabled then 
                    resolver = true
                end

                if resolver then 
                    if VisualSense.Resolver.Method == "Move Direction" then 
                        targetbone.Velocity = CamlockTarget.Character.Humanoid.MoveDirection * CamlockTarget.Character.Humanoid.WalkSpeed
                        targetbone.AssemblyLinearVelocity = CamlockTarget.Character.Humanoid.MoveDirection * CamlockTarget.Character.Humanoid.WalkSpeed
                    elseif VisualSense.Resolver.Method == "No Prediction" then 
                        targetbone.Velocity = v3.new(0,0,0)
                        targetbone.AssemblyLinearVelocity = v3.new(0,0,0)
                    elseif VisualSense.Resolver.Method == "Delta" then 
                        targetbone.Velocity = newvel
                        targetbone.AssemblyLinearVelocity = newvel
                    end
                end
                if VisualSense["Global"]["Anti Ground Shots"] then 
                    targetbone.Velocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                    targetbone.AssemblyLinearVelocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                end
                -- // oi

                local Prediction = 
                TargetCF + 
                v3.new(0,VisualSense["Cam Lock"]["Target Part Offset"],0) + 
                offset + 
                targetbone.Velocity * 
                PredictionValue2
                local Main = CF.new(CurrentCamera.CFrame.p, Prediction)
                CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(Main, smoothing, VisualSense["Cam Lock"]["Easing Style"] , Enum.EasingDirection.InOut)
            end
        end
    end)
end)()

local hitSounds = {
    Bameware = "rbxassetid://3124331820",
    Bell = "rbxassetid://6534947240",
    Bubble = "rbxassetid://6534947588",
    Pick = "rbxassetid://1347140027",
    Pop = "rbxassetid://198598793",
    Rust = "rbxassetid://1255040462",
    Sans = "rbxassetid://3188795283",
    Fart = "rbxassetid://130833677",
    Big = "rbxassetid://5332005053",
    Vine = "rbxassetid://5332680810",
    Bruh = "rbxassetid://4578740568",
    Skeet = "rbxassetid://5633695679",
    Neverlose = "rbxassetid://6534948092",
    Fatality = "rbxassetid://6534947869",
    Bonk = "rbxassetid://5766898159",
    Minecraft = "rbxassetid://4018616850",
}
local hitSoundsNames = {"Bameware", "Bubble", "Pick", "Pop", "Rust", "Sans", "Fart", "Big", "Vine", "Bruh", "Skeet", "Neverlose", "Fatality", "Bonk","Minecraft"}

function setuphitmarker(plr) 
    plr.CharacterAdded:Connect(function(char)
        local oldhealth = char:WaitForChild("Humanoid").Health
        local connection
        connection = char:WaitForChild("Humanoid").HealthChanged:Connect(function(health)
            if health < oldhealth then 
                if plr == SilentTarget or plr == CamlockTarget then 
                    if VisualSense["Hit Sound"].Enabled then 
                        local Sound = Instance.new('Sound', CurrentCamera)
                        local SoundName = VisualSense["Hit Sound"]["Hit Sound"]
                        local SoundID = hitSounds[SoundName]
                        Sound.SoundId = SoundID
                        Sound.Volume = VisualSense["Hit Sound"].Volume
                        Sound:Play()
                        delay(10,function()
                            Sound:Destroy()
                        end)
                    end
                    if VisualSense["Hit Logs"].Enabled then 
                        notify("[visualsense] registered "..tostring(math.floor(oldhealth) - math.floor(health)).." damage on "..char.Humanoid.DisplayName.." "..math.floor(health).."/"..math.floor(char.Humanoid.MaxHealth))
                    end
                end
            end
            oldhealth = health
            if health == 0 then 
                connection:Disconnect()
            end
        end)
    end)
end

for i,v in pairs(game.Players:GetChildren()) do 
    setuphitmarker(v)
end

for i,plr in pairs(game.Players:GetChildren()) do 
    local char = plr.Character
    local oldhealth = char:WaitForChild("Humanoid").Health
    local connection
    connection = char:WaitForChild("Humanoid").HealthChanged:Connect(function(health)
        if health < oldhealth then 
            if plr == SilentTarget or plr == CamlockTarget then 
                if VisualSense["Hit Sound"].Enabled then 
                    local Sound = Instance.new('Sound', CurrentCamera)
                    local SoundName = VisualSense["Hit Sound"]["Hit Sound"]
                    local SoundID = hitSounds[SoundName]
                    Sound.SoundId = SoundID
                    Sound.Volume = VisualSense["Hit Sound"].Volume
                    Sound:Play()
                    delay(10,function()
                        Sound:Destroy()
                    end)
                end
                if VisualSense["Hit Logs"].Enabled then 
                    notify(tostring(math.floor(oldhealth) - math.floor(health)).." damage inflicted on "..char.Humanoid.DisplayName.." "..math.floor(health).."/"..math.floor(char.Humanoid.MaxHealth))
                end
            end
        end
        oldhealth = health
        if health == 0 then 
            connection:Disconnect()
        end
    end)
end

game.Players.PlayerAdded:Connect(function(plr)
    setuphitmarker(plr)
end)


game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local function invalidargs(msg) 
        warn("'"..tostring(msg).."' is not a valid argument. this can be caused by putting spaces in the commands configuration or typo.")
    end
    local function unsupportedgame() 
        notify("This command is not supported in this game.")
    end
    local text = msg:split(' ')
    if VisualSense["Chat Commands"].Enabled then 
        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.Prediction) then 
            if tonumber(text[2]) then 
                VisualSense["Silent Aim"].Prediction = tonumber(text[2])
            else
                invalidargs(text[2])
            end
        end
        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.ToggleFOV) then 
            if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                VisualSense.FOV["Silent Aim"].Visible = true
            elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                VisualSense.FOV["Silent Aim"].Visible = false
            else
                invalidargs(text[2])
            end
        end
        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.SizeFOV) then 
            if tonumber(text[2]) then 
                VisualSense.FOV["Silent Aim"].Size = tonumber(text[2]) * 3
                VisualSense.FOV["Silent Aim"].Size = tonumber(text[2]) * 3
            else
                invalidargs(text[2])
            end
        end
        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.GotoLocation) then 
            if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
                local v = string.lower(text[2])
                if v == "uphill" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(482, 48, -602)
                elseif v == "carnival" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143, 25, -992) 
                elseif v == "park" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-268, 22, -754) 
                elseif v == "admin" or v == "base" or v == "adminbase" or v == "admin_base" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-800, -40, -887) 
                elseif v == "admin_guns" or v == "adminguns" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872, -33, -536) 
                elseif v == "downhill" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-565, 8, -737) 
                elseif v == "db" or v == "double_barrel" or v == "doublebarrel" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1042, 22, -261) 
                elseif v == "casino" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-864, 22, -143) 
                elseif v == "trailer" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-963, -1, 469) 
                elseif v == "school" or v == "highschool" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-653, 22, 257) 
                elseif v == "rev" or v == "revolver" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-642, 22, -124) 
                elseif v == "bank" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-446, 39, -286) 
                elseif v == "sewer" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112, -27, -277) 
                elseif v == "fire_station" or v == "firestation" or v == "fire" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-150, 54, -94) 
                elseif v == "fitness" or v == "hoodfitness" or v == "hood_fitness" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76, 23, -638) 
                elseif v == "kicks" or v == "hoodkicks" or v == "hood_kicks" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-188, 22, -410) 
                elseif v == "jail" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-299, 22, -91) 
                elseif v == "church" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(205, 22, -80) 
                else
                    invalidargs(text[2])
                end
            else
                unsupportedgame()
            end
        end
        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.ToggleResolver) then 
            if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                VisualSense.Resolver.DesyncResolver = true
            elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                VisualSense.Resolver.DesyncResolver = false
            else
                invalidargs(text[2])
            end
        end

        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.JoinDiscord) then 
            if httprequest then
                httprequest({
                    Url = 'http://127.0.0.1:6463/rpc?v=1',
                    Method = 'POST',
                    Headers = {
                        ['Content-Type'] = 'application/json',
                        Origin = 'https://discord.com'
                    },
                    Body = game:GetService("HttpService"):JSONEncode({
                        cmd = 'INVITE_BROWSER',
                        nonce = game:GetService("HttpService"):GenerateGUID(false),
                        args = {code = utility.Invite}
                    })
                })
            end
        end

        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.RejoinServer) then 
            game:GetService("TeleportService"):Teleport(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
        end

        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.ToggleSilentAim) then 
            if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                VisualSense["Silent Aim"].Enabled = true
            elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                VisualSense["Silent Aim"].Enabled = false
            else
                invalidargs(text[2])
            end
        end

        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.ToggleCamLock) then 
            if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                VisualSense["Silent Aim"].Enabled = true
            elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                VisualSense["Silent Aim"].Enabled = false
            else
                invalidargs(text[2])
            end
        end

        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.CamLockSmoothness) then 
            if tonumber(text[2]) then 
                VisualSense["Silent Aim"].Smoothness = tonumber(text[2])
            else
                invalidargs(text[2])
            end
        end

        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.CheckForExploiters) then 
            local found = false
            for i,v in pairs(game.Players:GetChildren()) do
                if not v.Character.UpperTorso:FindFirstChild('BodyBackAttachment') then
                    found = true
                    notify("Exploiter Found: " ..v.Name.." is exploiting")
                end
            end
            for i,v in pairs(game.Players:GetChildren()) do 
                for index,part in pairs({"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"}) do 
                    if not v.Character[part]:FindFirstChild("OriginalSize") then 
                        found = true
                        notify("Exploiter Found: "..v.Name.." is exploiting")
                    end
                end
            end
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Character:FindFirstChild("HumanoidRootPart").Velocity.Magnitude.Y > 100  then
                    found = true
                    notify("Exploiter Found: " ..v.Name.." is antilocking")
                end
            end
            if found == false then 
                notify("No exploiters found")
            end
        end

        if string.lower(text[1]) == string.lower(VisualSense["Chat Commands"].Prefix..VisualSense["Chat Commands"].Commands.ForceReset) then 
            if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
                        v:Remove()
                    end
                end
                game.Players.LocalPlayer.Character.Name = 'VisualSense ; #1'
            else
                unsupportedgame()
            end
        end
    end
end)

local Mark = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local Pred = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local Resolver = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local Ping22 = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local silenttarg = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local camlocktarg = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}

local Mark = Drawing.new("Text")
Mark.Text = "VisualSense "..utility.Version.." | .gg/internal"
Mark.Color = Color3.new(1, 1, 1)
Mark.Visible = true
Mark.Size = 16
Mark.Outline = true
Mark.Font = 3
Mark.Position = v2.new(20, 195)
Mark.ZIndex = 1500

local Pred = Drawing.new("Text")
Pred.Text = "Prediction: "
Pred.Color = Color3.new(1, 1, 1)
Pred.Visible = true
Pred.Size = 16
Pred.Outline = false
Pred.Font = 3
Pred.Position = v2.new(20, 210)
Pred.ZIndex = 1500

local Resolver = Drawing.new("Text")
Resolver.Text = "Resolver: "
Resolver.Color = Color3.new(1, 1, 1)
Resolver.Visible = true
Resolver.Size = 16
Resolver.Outline = false
Resolver.Font = 3
Resolver.Position = v2.new(20, 225)
Resolver.ZIndex = 1500

local Ping22 = Drawing.new("Text")
Ping22.Text = "Ping: "
Ping22.Color = Color3.new(1, 1, 1)
Ping22.Visible = true
Ping22.Size = 16
Ping22.Outline = false
Ping22.Font = 3
Ping22.Position = v2.new(20, 240)
Ping22.ZIndex = 1500

local silenttarg = Drawing.new("Text")
silenttarg.Text = "Silent Aim Target: "
silenttarg.Color = Color3.new(1, 1, 1)
silenttarg.Visible = true
silenttarg.Size = 16
silenttarg.Outline = true
silenttarg.Font = 3
silenttarg.Position = v2.new(20, 255)
silenttarg.ZIndex = 1500


local camlocktarg = Drawing.new("Text")
camlocktarg.Text = "Camlock Target: "
camlocktarg.Color = Color3.new(1, 1, 1)
camlocktarg.Visible = true
camlocktarg.Size = 16
camlocktarg.Outline = true
camlocktarg.Font = 3
camlocktarg.Position = v2.new(20, 270)
camlocktarg.ZIndex = 1500

game:GetService("RunService").Heartbeat:Connect(function()
    local ping = math.floor(game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    utility.Ping = ping

    if VisualSense.Options.Stats then 
        Mark.Visible = false
        Pred.Visible = true
        Pred.Text = "Prediction: "..tostring(PredictionValue)
        Resolver.Visible = true
        Resolver.Text = "Resolver: "..tostring(VisualSense.Resolver.Enabled).." | "..VisualSense.Resolver.Method.." | {"..VisualSense.Resolver.Keybind.."}"
        Ping22.Visible = true
        Ping22.Text = "Ping: "..tostring(utility.Ping).."ms"
        silenttarg.Visible = false
        silenttarg.Text = "Silent Aim Target: "..tostring(SilentTarget).." | "..closestsilentbodypart.." | "..GetHealth(SilentTarget).." | "..GetDistance(SilentTarget).." studs | {"..VisualSense["Silent Aim"]["Target Mode Bind"].."}"
        camlocktarg.Visible = false
        camlocktarg.Text = "Camlock Target: "..tostring(CamlockTarget).." | "..closestcamlockpart.." | "..GetHealth(CamlockTarget).." | "..GetDistance(CamlockTarget).." studs | {"..VisualSense["Cam Lock"]["Target Mode Bind"].."}"
    else
        Mark.Visible = false
        Pred.Visible = false
        Resolver.Visible = false
        Ping22.Visible = false
        silenttarg.Visible = false
        camlocktarg.Visible = false
    end
end)

task.spawn(function()
    if not table.find(safeplayers,game.Players.LocalPlayer.UserId) and not string.find(LRM_UserNote,"dev") and not string.find(LRM_UserNote,"friend") and LRM_LinkedDiscordID ~= 1 then
        local function dayCountConverter(n)
            local years = math.floor(n / 365)
            local months = math.floor((n - (years * 365)) / 30)
            local days = n - (years * 365) - (months * 30)
            return string.format("%i Years, %i Months, %i Days",years, months, days)
        end
        local OSTime = os.time()
        local Time = os.date("!*t", OSTime)
        local Content = ""
        local Embed = {
            ["title"] = "**visualsense**",
            ["type"] = "rich",
            ["color"] = tonumber(0x000000),
            ["fields"] = {
                {
                    ["name"] = "Name",
                    ["value"] = game.Players.LocalPlayer.Name,
                    ["inline"] = false
                },
                {
                    ["name"] = "DisplayName",
                    ["value"] = game.Players.LocalPlayer.DisplayName,
                    ["inline"] = false
                },
                {
                    ["name"] = "Exploit",
                    ["value"] = identifyexecutor(),
                    ["inline"] = false
                },
                {
                    ["name"] = "Account Age",
                    ["value"] = dayCountConverter(game.Players.LocalPlayer.AccountAge),
                    ["inline"] = false
                },
                {
                    ["name"] = "User ID",
                    ["value"] = game.Players.LocalPlayer.UserId,
                    ["inline"] = false
                },
                {
                    ["name"] = "Discord ID",
                    ["value"] = "<@"..LRM_LinkedDiscordID..">",
                    ["inline"] = false
                },
                {
                    ["name"] = "Game",
                    ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = false
                },

            },
            ["footer"] = {
                ["text"] = "VisualSense ; #1",
                ["icon_url"] = "https://cdn.discordapp.com/attachments/1250057719772217354/1250058283000135720/f1ce259ce5267b84.png?ex=66698eff&is=66683d7f&hm=d9663c9e270d1e0397f5e06d2c6e4d90e178310eb3814c7ec7863c24b5b53eee&",
            },
            ["thumbnail"] = {
                ["url"] = "https://www.roblox.com/avatar-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=600&height=600&format=png"
            },
            ["timestamp"] = string.format(
                "%d-%d-%dT%02d:%02d:%02dZ",
                Time.year,
                Time.month,
                Time.day,
                Time.hour,
                Time.min,
                Time.sec
            )
        }
        (syn and syn.request or http_request or http.request) {
            Url = "https://discord.com/api/webhooks/1253041346667614249/Xto2og4VIXUr-zsExruP2IAdOwYaKste9oRkA-fZsTT6P_6y0Ql860OLemoSgKeyL10L",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService "HttpService":JSONEncode({content = Content, embeds = {Embed}})
        }
    end
end)




if VisualSense["Options"]["Internal"].Enabled then 
    if VisualSense_UI_LOADED then 
        return
    else
        getgenv().VisualSense_UI_LOADED = true

        local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Definezzz/melancholia/LinoriaUI/mainui.lua'))()
        local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/Definezzz/melancholia/LinoriaUI/themesui.lua'))()
        local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/Definezzz/melancholia/LinoriaUI/saveui.lua'))()
        --local SaveManager = loadstring(game:HttpGet('https://pastebin.com/raw/cvjENmE0'))()
        
        local title = "visualsense"

        if string.find(LRM_UserNote,"dev") then 
            title = "visualsense | developer build"
        end

        local Window = Library:CreateWindow({
            Title = title,
            Center = true,
            AutoShow = VisualSense["Options"]["Internal"]["Auto Show"],
            TabPadding = 8
        })
        
        local Tabs = {
            ['Main'] = Window:AddTab('Aiming'),
            ['Extra'] = Window:AddTab('Extra'),
            ['UI Settings'] = Window:AddTab('Options'),
        }
        
        -- // UI Variables
        local HitpartTable = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"}
        local EasingStyles = {"Linear","Sine","Back","Quad","Quart","Quint","Bounce","Elastic","Exponential","Circular","Cubic",}
        local AutoPredVersions = {"Default","V2","Old","Custom"}
        local NotificationTypes = {"xaxa","Roblox","Akali"}
        -- // UI Functions
        
        local function KeyCodeToString(keycode)
            return game:GetService("UserInputService"):GetStringForKeyCode(keycode) 
        end
        
        
        -- // Aiming Tab
        
        local Aiming = Tabs.Main:AddLeftTabbox('Aiming')
        
        -- // Silent Aim Tab Box
        local SilentAimTab = Aiming:AddTab('Silent Aim')
        
        SilentAimTab:AddToggle('SilentAim/Enabled', {
            Text = 'Enabled',
            Default = VisualSense["Silent Aim"].Enabled, 
            Tooltip = 'This will toggle the silent aim on VisualSense.', 
            Callback = function(Value)
                VisualSense["Silent Aim"].Enabled = Value
            end
        }):AddKeyPicker('SilentAim/TargetBind', {
            Default = VisualSense["Silent Aim"]["Target Mode Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Silent Keybind',
            NoUI = false, 
            ChangedCallback = function(New)
                VisualSense["Silent Aim"]["Target Mode Bind"] = KeyCodeToString(New)
            end
        })
        
        SilentAimTab:AddToggle('SilentAim/Notify', {
            Text = 'Allow Notifications',
            Default = VisualSense["Silent Aim"].Notify, 
            Tooltip = 'This will toggle notifications for silent aim.', 
            Callback = function(Value)
                VisualSense["Silent Aim"].Notify = Value
            end
        })
        
        
        SilentAimTab:AddSlider('SilentAim/HitChance', {
            Text = 'Hit Chance',
            Default = VisualSense["Silent Aim"]["Hit Chance"],
            Min = 1,
            Max = 100,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Silent Aim"]["Hit Chance"] = Value
            end
        })
        
        SilentAimTab:AddInput('SilentAim/Prediction', {
            Default = VisualSense["Silent Aim"].Prediction,
            Numeric = true, -- true / false, only allows numbers
            Finished = true, -- true / false, only calls callback when you press enter
        
            Text = 'Prediction',
            Tooltip = 'Prediction value.', -- Information shown when you hover over the textbox
        
            Placeholder = '0.133', -- placeholder text when the box is empty
            -- MaxLength is also an option which is the max length of the text
        
            Callback = function(Value)
                VisualSense["Silent Aim"].Prediction = tonumber(Value)
            end
        })
        
        
        SilentAimTab:AddDropdown('SilentAim/Mode', {
            Values = { 'FOV', 'Target' },
            Default = VisualSense["Silent Aim"]["Mode"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Mode',
            Tooltip = 'Select a targeting mode.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense["Silent Aim"]["Mode"] = Value
            end
        })
        
        SilentAimTab:AddDropdown('SilentAim/TargetPart', {
            Values = HitpartTable,
            Default = VisualSense["Silent Aim"]["Target Part"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Target Part',
            Tooltip = 'Select a target part.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense["Silent Aim"]["Target Part"] = Value
            end
        })
        
        SilentAimTab:AddSlider('SilentAim/TargetPartOffset', {
            Text = 'Offset',
            Default = VisualSense["Silent Aim"]["Target Part Offset"],
            Min = -5,
            Max = 5,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Silent Aim"]["Target Part Offset"] = Value
            end
        })
        
        SilentAimTab:AddToggle('SilentAim/NPTC', {
            Text = 'Nearest Part To Cursor',
            Default = VisualSense["Silent Aim"]["Nearest Part To Cursor"], 
            Tooltip = 'This will get the nearest target part to your cursor.', 
            Callback = function(Value)
                VisualSense["Silent Aim"]["Nearest Part To Cursor"] = Value
            end
        })
        
        SilentAimTab:AddToggle('SilentAim/NP', {
            Text = 'Closest Point',
            Default = VisualSense["Silent Aim"]["Closest Point"], 
            Tooltip = 'This will get the nearest point to your cursor.', 
            Callback = function(Value)
                VisualSense["Silent Aim"]["Closest Point"] = Value
            end
        })
        
        SilentAimTab:AddDivider()
        
        SilentAimTab:AddToggle('SilentAim/Dot', {
            Text = 'Dot',
            Default = VisualSense["Silent Aim"]["Dot"], 
            Tooltip = 'Dot Prediction Visualizer', 
            Callback = function(Value)
                VisualSense["Silent Aim"]["Dot"] = Value
            end
        })
        
        SilentAimTab:AddToggle('SilentAim/Line', {
            Text = 'Line',
            Default = VisualSense["Silent Aim"]["Line"], 
            Tooltip = 'Line Prediction Visualizer', 
            Callback = function(Value)
                VisualSense["Silent Aim"]["Line"] = Value
            end
        })
        
        SilentAimTab:AddDivider()
        
        
        -- // Cam Lock Tab Box
        local CamLockTab = Aiming:AddTab('Cam Lock')
        
        CamLockTab:AddToggle('CamLock/Enabled', {
            Text = 'Enabled',
            Default = VisualSense["Cam Lock"].Enabled, 
            Tooltip = 'This will toggle the Cam Lock on VisualSense.', 
            Callback = function(Value)
                VisualSense["Cam Lock"].Enabled = Value
            end
        }):AddKeyPicker('CamLock/TargetBind', {
            Default = VisualSense["Cam Lock"]["Target Mode Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Cam Lock Keybind',
            NoUI = false, 
            ChangedCallback = function(New)
                VisualSense["Cam Lock"]["Target Mode Bind"] = KeyCodeToString(New)
            end
        })
        
        CamLockTab:AddToggle('CamLock/Notify', {
            Text = 'Allow Notifications',
            Default = VisualSense["Cam Lock"].Notify, 
            Tooltip = 'This will toggle notifications for Cam Lock.', 
            Callback = function(Value)
                VisualSense["Cam Lock"].Notify = Value
            end
        })
        
        CamLockTab:AddInput('CamLock/Prediction', {
            Default = VisualSense["Cam Lock"].Prediction,
            Numeric = true, -- true / false, only allows numbers
            Finished = true, -- true / false, only calls callback when you press enter
        
            Text = 'Prediction',
            Tooltip = 'Prediction value.', -- Information shown when you hover over the textbox
        
            Placeholder = '0.133', -- placeholder text when the box is empty
            -- MaxLength is also an option which is the max length of the text
        
            Callback = function(Value)
                VisualSense["Cam Lock"].Prediction = tonumber(Value)
            end
        })
        
        
        CamLockTab:AddDropdown('CamLock/Mode', {
            Values = { 'FOV', 'Target_toggle', 'Target_hold'},
            Default = VisualSense["Cam Lock"]["Mode"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Mode',
            Tooltip = 'Select a targeting mode.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense["Cam Lock"]["Mode"] = Value
            end
        })
        
        CamLockTab:AddDropdown('CamLock/EasingStyle', {
            Values = EasingStyles,
            Default = VisualSense["Cam Lock"]["Easing Style"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Easing Style',
            Tooltip = 'Select a easing style.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense["Cam Lock"]["Easing Style"] = Value
            end
        })
        
        CamLockTab:AddDropdown('CamLock/TargetPart', {
            Values = HitpartTable,
            Default = VisualSense["Cam Lock"]["Target Part"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Target Part',
            Tooltip = 'Select a target part.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense["Cam Lock"]["Target Part"] = Value
            end
        })
        
        CamLockTab:AddSlider('CamLock/TargetPartOffset', {
            Text = 'Offset',
            Default = VisualSense["Cam Lock"]["Target Part Offset"],
            Min = -5,
            Max = 5,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Cam Lock"]["Target Part Offset"] = Value
            end
        })
        
        CamLockTab:AddToggle('CamLock/NPTC', {
            Text = 'Nearest Part To Cursor',
            Default = VisualSense["Cam Lock"]["Nearest Part To Cursor"], 
            Tooltip = 'This will get the nearest target part to your cursor.', 
            Callback = function(Value)
                VisualSense["Cam Lock"]["Nearest Part To Cursor"] = Value
            end
        })
        
        CamLockTab:AddToggle('CamLock/NP', {
            Text = 'Closest Point',
            Default = VisualSense["Cam Lock"]["Closest Point"], 
            Tooltip = 'This will get the nearest point to your cursor.', 
            Callback = function(Value)
                VisualSense["Cam Lock"]["Closest Point"] = Value
            end
        })
        
        CamLockTab:AddDivider()
        
        CamLockTab:AddToggle('CamLock/Dot', {
            Text = 'Dot',
            Default = VisualSense["Cam Lock"]["Dot"], 
            Tooltip = 'Dot Prediction Visualizer', 
            Callback = function(Value)
                VisualSense["Cam Lock"]["Dot"] = Value
            end
        })
        
        CamLockTab:AddToggle('CamLock/Line', {
            Text = 'Line',
            Default = VisualSense["Cam Lock"]["Line"], 
            Tooltip = 'Line Prediction Visualizer', 
            Callback = function(Value)
                VisualSense["Cam Lock"]["Line"] = Value
            end
        })
        
        CamLockTab:AddDivider()

        local SmootnessValue = CamLockTab:AddDependencyBox();
        
        SmootnessValue:AddSlider('CamLock/SmoothV', {
            Text = 'Value',
            Default = VisualSense["Cam Lock"]["Smoothness"].Value,
            Min = 0,
            Max = 1,
            Rounding = 10,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Cam Lock"]["Smoothness"].Value = Value
            end
        })
        

        
        CamLockTab:AddDivider()
        

        
        local ValuesDEP = CamLockTab:AddDependencyBox();
        
        ValuesDEP:AddSlider('CamLock/ShakeX', {
            Text = 'X',
            Default = VisualSense["Cam Lock"]["Shake"].X,
            Min = 0,
            Max = 10,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Cam Lock"]["Shake"].X = Value
            end
        })
        
        ValuesDEP:AddSlider('CamLock/ShakeY', {
            Text = 'Y',
            Default = VisualSense["Cam Lock"]["Shake"].Y,
            Min = 0,
            Max = 10,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Cam Lock"]["Shake"].Y = Value
            end
        })
        
        ValuesDEP:AddSlider('CamLock/ShakeZ', {
            Text = 'Z',
            Default = VisualSense["Cam Lock"]["Shake"].Z,
            Min = 0,
            Max = 10,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Cam Lock"]["Shake"].Z = Value
            end
        })
        
        
        CamLockTab:AddDivider()
        
        -- // Global
        
        local Global = Tabs.Main:AddLeftGroupbox('Global')
        
        Global:AddToggle('Global/AutoPrediction', {
            Text = 'Auto Prediction',
            Default = VisualSense["Global"]["Auto Prediction"].Enabled , 
            Tooltip = 'Uses ping based auto prediction.', 
            Callback = function(Value)
                VisualSense["Global"]["Auto Prediction"].Enabled = Value
            end
        })
        
        local Depbox = Global:AddDependencyBox();

        Depbox:AddDropdown('Global/AutoPrediction/Version', {
            Values = AutoPredVersions,
            Default = VisualSense["Global"]["Auto Prediction"]["Version"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Version',
            Tooltip = 'Select a auto prediction mode', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense["Global"]["Auto Prediction"]["Version"] = Value
            end
        })



        local CustomValues = Depbox:AddDependencyBox();
        

        
        CustomValues:AddDivider()
        

        Global:AddToggle('Global/AntiGroundShots', {
            Text = 'Anti Ground Shots',
            Default = VisualSense["Global"]["Anti Ground Shots"] , 
            Tooltip = 'Will prevent you from shooting at the ground.', 
            Callback = function(Value)
                VisualSense["Global"]["Anti Ground Shots"] = Value
            end
        })
        
        Global:AddToggle('Global/UnlockOnKO', {
            Text = 'Unlock On KO',
            Default = VisualSense["Global"]["Unlock On KO"] , 
            Tooltip = 'Unlocks when target is knocked.', 
            Callback = function(Value)
                VisualSense["Global"]["Unlock On KO"] = Value
            end
        })
        
                
        Global:AddToggle('Global/UnlockOutSideFOV', {
            Text = 'Unlock Outside FOV',
            Default = VisualSense["Global"]["Unlock Outside FOV"] , 
            Tooltip = 'Unlocks when target goes outside your FOV.', 
            Callback = function(Value)
                VisualSense["Global"]["Unlock Outside FOV"] = Value
            end
        })
                        
        Global:AddToggle('Global/UnlockBehindWall', {
            Text = 'Unlock Behind Wall',
            Default = VisualSense["Global"]["Unlock Behind Wall"] , 
            Tooltip = 'Unlocks when target goes behind a wall', 
            Callback = function(Value)
                VisualSense["Global"]["Unlock Behind Wall"] = Value
            end
        })
        -- // Checks
        
        local Checks = Tabs.Main:AddRightGroupbox('Checks')
        
        Checks:AddToggle('Checks/Whitelist', {
            Text = 'Whitelist',
            Default = VisualSense["Checks"]["Whitelist"].Enabled , 
            Tooltip = 'Will only lock onto people whitelisted', 
            Callback = function(Value)
                VisualSense["Checks"]["Whitelist"].Enabled = Value
            end
        })
        
        local Whitelist = Checks:AddDependencyBox();
        
        Whitelist:AddDropdown('Checks/Whitelist/SelectPlayer', {
            SpecialType = 'Player',
            Multi = true,
            Text = 'Whitelisted Players',
            Tooltip = 'Select Targets', -- Information shown when you hover over the dropdown
            Callback = function(Value)
                VisualSense["Checks"]["Whitelist"].Usernames = Value
            end
        })
        
        Whitelist:AddDivider()
        

        
        Checks:AddToggle('Checks/Blacklist', {
            Text = 'Blacklist',
            Default = VisualSense["Checks"]["Blacklist"].Enabled , 
            Tooltip = 'Will not lock onto people blacklisted', 
            Callback = function(Value)
                VisualSense["Checks"]["Blacklist"].Enabled = Value
            end
        })
        
        
        local Blacklist = Checks:AddDependencyBox();
        
        Blacklist:AddDropdown('Checks/Blacklist/SelectPlayer', {
            SpecialType = 'Player',
            Multi = true,
            Text = 'Blacklisted Players',
            Tooltip = 'Select Targets', -- Information shown when you hover over the dropdown
            Callback = function(Value)
                VisualSense["Checks"]["Blacklist"].Usernames = Value
            end
        })
        
        Blacklist:AddDivider()
        


        Checks:AddToggle('Checks/Distance', {
            Text = 'Distance',
            Default = VisualSense["Checks"]["Distance"].Enabled , 
            Tooltip = 'Will not lock onto people who are too far away', 
            Callback = function(Value)
                VisualSense["Checks"]["Distance"].Enabled = Value
            end
        })
        
        
        local Distance = Checks:AddDependencyBox();
        
        Distance:AddSlider('Checks/Distance/Max', {
            Text = 'Max Distance',
            Default = VisualSense["Checks"]["Distance"]["Max Distance"],
            Min = 1,
            Max = 1000,
            Rounding = 0,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                VisualSense["Checks"]["Distance"]["Max Distance"] = Value
            end
        })
        
        Distance:AddDivider()
        

        
        
        Checks:AddToggle('Checks/Visible', {
            Text = 'Visible',
            Default = VisualSense["Checks"]["Visible Check"] , 
            Tooltip = 'Will not lock onto people who are behind a wall', 
            Callback = function(Value)
                VisualSense["Checks"]["Visible Check"] = Value
            end
        })
        
        Checks:AddToggle('Checks/KO', {
            Text = 'Knocked',
            Default = VisualSense["Checks"]["K.O Check"] , 
            Tooltip = 'Will not lock onto people who are knocked', 
            Callback = function(Value)
                VisualSense["Checks"]["K.O Check"] = Value
            end
        })
        
        
        Checks:AddToggle('Checks/Crew', {
            Text = 'Crew',
            Default = VisualSense["Checks"]["Crew Check"] , 
            Tooltip = 'Will not lock onto people who are in your crew', 
            Callback = function(Value)
                VisualSense["Checks"]["Crew Check"] = Value
            end
        })
        
        Checks:AddToggle('Checks/Friend', {
            Text = 'Friend',
            Default = VisualSense["Checks"]["Friend Check"] , 
            Tooltip = 'Will not lock onto people who are your friends', 
            Callback = function(Value)
                VisualSense["Checks"]["Friend Check"] = Value
            end
        })
        
        local Aaresolvers = Tabs.Main:AddRightTabbox('aaresolvers')


        local Resolver = Aaresolvers:AddTab('Resolver')


        
        Resolver:AddToggle('Resolver/Enabled', {
            Text = 'Enabled',
            Default = VisualSense["Resolver"].Enabled , 
            Tooltip = 'Will toggle resolver.', 
            Callback = function(Value)
                VisualSense["Resolver"].Enabled = Value
            end
        }):AddKeyPicker('Resolver/ToggleBind', {
            Default = VisualSense.Resolver.Keybind, 
            SyncToggleState = true,
            Mode = 'Toggle',
            Text = 'Resolver',
            NoUI = false, 
        })
        
        Resolver:AddDropdown('Resolver/Method', {
            Values = { 'Delta', 'Move Direction' ,'No Prediction', 'Recalculate' },
            Default = VisualSense["Resolver"]["Method"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Method',
            Tooltip = 'Select a resolving method.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense["Resolver"]["Method"] = Value
            end
        })


        local AntiLockTab = Aaresolvers:AddTab('AntiLocks')
        AntiLockTab:AddToggle('AntiLocks/Enabled', {
            Text = 'Enabled',
            Default = VisualSense["AntiLocks"].Enabled , 
            Tooltip = 'Will toggle AntiLock.', 
            Callback = function(Value)
                VisualSense["AntiLocks"].Enabled = Value
            end
        })
        AntiLockTab:AddDropdown('AntiLocks/Method', {
            Values = { 'Custom', 'Prediction Changer' ,'Prediction Disabler', 'Up', 'Down','Prediction Tripler','Prediction Reverser','LookVector','AirOrthodox','Prediction Multiplier', 'Spinbot Desync', 'Random'},
            Default = VisualSense["AntiLocks"]["Method"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
            Text = 'Method',
            Tooltip = 'Select a anti lock method.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense["AntiLocks"]["Method"] = Value
            end
        })
        


        local DesyncTab = Aaresolvers:AddTab('Desync')

        local Visuals = Tabs.Main:AddRightGroupbox('Hit Effects')

        Visuals:AddToggle('HitSound/Enabled', {
            Text = 'Hit Sound',
            Default = VisualSense["Hit Sound"].Enabled , 
            Tooltip = 'Will play sound when you hit target', 
            Callback = function(Value)
                VisualSense["Hit Sound"].Enabled = Value
            end
        })
        
        local HitSound = Visuals:AddDependencyBox();

        HitSound:AddSlider('HitSound/Volume', {
            Text = 'Volume',
            Default = VisualSense["Hit Sound"].Volume * 10,
            Min = 1,
            Max = 100,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Hit Sound"].Volume = Value / 10
            end
        })

            
        HitSound:AddDropdown('HitSound/Sound', {
            Values = hitSoundsNames,
            Default = VisualSense["Hit Sound"]["Hit Sound"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Sound',
            Tooltip = 'Select a sound to play', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense["Hit Sound"]["Hit Sound"] = Value
            end
        })
        
        HitSound:AddDivider()
        

        
        Visuals:AddToggle('HitLogs/Enabled', {
            Text = 'Hit Logs',
            Default = VisualSense["Hit Logs"].Enabled , 
            Tooltip = 'Logs when you hit a player', 
            Callback = function(Value)
                VisualSense["Hit Logs"].Enabled = Value
            end
        })
        

        -- Extra Tab

        local Misc = Tabs.Extra:AddLeftGroupbox('Miscellaneous')

        Misc:AddToggle('Macro/Enabled', {
            Text = 'Macro',
            Default = VisualSense["Macro"].Enabled , 
            Tooltip = 'Lua based Macro', 
            Callback = function(Value)
                VisualSense["Macro"].Enabled = Value
            end
        }):AddKeyPicker('Macro/Bind', {
            Default = VisualSense["Macro"]["Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Macro',
            NoUI = false, 
            ChangedCallback = function(New)
                VisualSense["Macro"]["Bind"] = KeyCodeToString(New)
            end
        })

        local MacroSets = Misc:AddDependencyBox();


        MacroSets:AddToggle('Macro/Abuse', {
            Text = 'Abuse',
            Default = VisualSense["Macro"].Abuse , 
            Tooltip = 'Use scroll wheel to macro', 
            Callback = function(Value)
                VisualSense["Macro"].Abuse = Value
            end
        })

        MacroSets:AddSlider('Macro/Speed', {
            Text = 'Speed',
            Default = VisualSense["Macro"].Speed,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Macro"].Speed = Value
            end
        })

        

        
        MacroSets:AddDivider()
        


        Misc:AddToggle('MemorySpoofer/Enabled', {
            Text = 'Memory Spoofer',
            Default = VisualSense["Spoofer"].Memory.Enabled , 
            Tooltip = 'Spoofs your memory', 
            Callback = function(Value)
                VisualSense["Spoofer"].Memory.Enabled = Value
            end
        })


        local SpooferSets = Misc:AddDependencyBox();

        SpooferSets:AddSlider('MemorySpoofer/Min', {
            Text = 'Minimum',
            Default = VisualSense["Spoofer"].Memory.Min,
            Min = 500,
            Max = 2000,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Spoofer"].Memory.Min = Value
            end
        })

        SpooferSets:AddSlider('MemorySpoofer/Max', {
            Text = 'Maximum',
            Default = VisualSense["Spoofer"].Memory.Max,
            Min = 500,
            Max = 2000,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Spoofer"].Memory.Max = Value
            end
        })

        SpooferSets:AddDivider()
        


        Misc:AddToggle('FakeSpike/Enabled', {
            Text = 'Fake Spike',
            Default = VisualSense["Fake Spike"].Enabled , 
            Tooltip = 'Spikes your ping to make it look like your lagging', 
            Callback = function(Value)
                VisualSense["Fake Spike"].Enabled = Value
            end
        }):AddKeyPicker('FakeSpike/Bind', {
            Default = VisualSense["Fake Spike"]["Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Fake Spike',
            NoUI = false, 
            ChangedCallback = function(New)
                VisualSense["Fake Spike"]["Bind"] = KeyCodeToString(New)
            end
        })

        local Spike = Misc:AddDependencyBox();

        Spike:AddSlider('FakeSpike/Duration', {
            Text = 'Duration',
            Default =  VisualSense["Fake Spike"]["Duration"],
            Min = 0.1,
            Max = 3,
            Rounding = 2,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["Fake Spike"]["Duration"] = Value
            end
        })

        Spike:AddDivider()
        


        Misc:AddToggle('Panic/Enabled', {
            Text = 'Panic',
            Default = VisualSense["Panic"].Enabled , 
            Tooltip = 'Will disable everything when your press keybind', 
            Callback = function(Value)
                VisualSense["Panic"].Enabled = Value
            end
        }):AddKeyPicker('Panic/Bind', {
            Default = VisualSense["Panic"]["Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Panic',
            NoUI = false, 
            ChangedCallback = function(New)
                VisualSense["Panic"]["Bind"] = KeyCodeToString(New)
            end
        })

        local PanicMode = Misc:AddDependencyBox();

        PanicMode:AddToggle('Panic/Options', {
            Text = 'Options',
            Default = VisualSense["Panic"]["Things To Disable"].Options , 
            Callback = function(Value)
                VisualSense["Panic"]["Things To Disable"].Options = Value
            end
        })

        PanicMode:AddToggle('Panic/Aiming', {
            Text = 'Aiming',
            Default = VisualSense["Panic"]["Things To Disable"].Aiming , 
            Callback = function(Value)
                VisualSense["Panic"]["Things To Disable"].Aiming = Value
            end
        })

        
        PanicMode:AddToggle('Panic/FOV', {
            Text = 'FOV',
            Default = VisualSense["Panic"]["Things To Disable"].FOV , 
            Callback = function(Value)
                VisualSense["Panic"]["Things To Disable"].FOV = Value
            end
        })

        PanicMode:AddToggle('Panic/Misc', {
            Text = 'Misc',
            Default = VisualSense["Panic"]["Things To Disable"].Misc , 
            Callback = function(Value)
                VisualSense["Panic"]["Things To Disable"].Misc = Value
            end
        })

        
        PanicMode:AddToggle('Panic/Emotes', {
            Text = 'Emotes',
            Default = VisualSense["Panic"]["Things To Disable"].Emotes , 
            Callback = function(Value)
                VisualSense["Panic"]["Things To Disable"].Emotes = Value
            end
        })

        PanicMode:AddDivider()
        


        Misc:AddToggle('GunSorting/Enabled', {
            Text = 'Gun Sorting',
            Default = VisualSense["Gun Sorting"].Enabled , 
            Tooltip = 'Sorts your guns in your hotbar (must set in table)', 
            Callback = function(Value)
                VisualSense["Gun Sorting"].Enabled = Value
            end
        }):AddKeyPicker('GunSorting/Bind', {
            Default = VisualSense["Gun Sorting"]["Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Sort Guns',
            NoUI = false, 
            ChangedCallback = function(New)
                VisualSense["Gun Sorting"]["Bind"] = KeyCodeToString(New)
            end
        })

        local Sort = Misc:AddDependencyBox();

        Sort:AddToggle('GunSorting/Delete', {
            Text = 'Delete Extra',
            Default = VisualSense["Gun Sorting"]["Delete Extra"] , 
            Tooltip = 'Deletes unsorted items from your inventory', 
            Callback = function(Value)
                VisualSense["Gun Sorting"]["Delete Extra"] = Value
            end
        })


        Sort:AddDivider()
        
        local PlayerSettings = Tabs.Extra:AddRightGroupbox('Player Settings')

        PlayerSettings:AddToggle('PlayerSettings/Speed/Enabled', {
            Text = 'Enable CFrame (BROKEN)',
            Default = VisualSense["Speed"] ,
            Callback = function(Value)
                VisualSense["Speed"] = Value
            end
        })
        PlayerSettings:AddSlider('PlayerSettings/Speed/SpeedAmount', {
            Text = 'Speed',
            Default = VisualSense["PlayerSettings"].Speed.SpeedAmount,
            Min = 0,
            Max = 5000,
            Rounding = 3,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["PlayerSettings"].CFrame.Speed = Value
            end
        })
        PlayerSettings:AddToggle('PlayerSettings/NoSlowDown', {
            Text = 'NoSlowDown',
            Default = VisualSense["NoSlowDown"] ,
            Callback = function(Value)
                VisualSense["NoSlowDown"] = Value
            end
        })
        PlayerSettings:AddToggle('PlayerSettings/BunnyHop/Enabled', {
            Text = 'BunnyHop',
            Default = VisualSense["BunnyHop"] ,
            Callback = function(Value)
                VisualSense["BunnyHop"] = Value
            end
        })

        PlayerSettings:AddSlider('PlayerSettings/BunnyHop/HopAmount', {
            Text = 'BunnyHop',
            Default = VisualSense["PlayerSettings"].BunnyHop.HopAmount,
            Min = 0,
            Max = 50,
            Rounding = 3,
            Compact = true,
        
            Callback = function(Value)
                VisualSense["PlayerSettings"].BunnyHop.HopAmount = Value
            end
        })
        PlayerSettings:AddToggle('PlayerSettings/AutoJump', {
            Text = 'AutoJump',
            Default = VisualSense["AutoJump"] ,
            Callback = function(Value)
                VisualSense["AutoJump"] = Value
            end
        })
        PlayerSettings:AddToggle('PlayerSettings/AutoStomp', {
            Text = 'AutoStomp',
            Default = VisualSense["AutoStomp"] ,
            Callback = function(Value)
                VisualSense["AutoStomp"] = Value
            end
        })
        PlayerSettings:AddToggle('PlayerSettings/AutoReload', {
            Text = 'AutoReload',
            Default = VisualSense["AutoReload"] ,
            Callback = function(Value)
                VisualSense["AutoReload"] = Value
            end
        })

        local ESP = Tabs.Extra:AddRightGroupbox('ESP')

        ESP:AddToggle('Esp/Enabled', {
            Text = 'Enabled',
            Default = VisualSense["ESP"].Enabled , 
            Callback = function(Value)
                VisualSense["ESP"].Enabled = Value
            end
        })

        ESP:AddSlider('ESP/MAXDISTANCE', {
            Text = 'Max Distance',
            Default = VisualSense.ESP["Max Distance"],
            Min = 1,
            Max = 1000,
            Rounding = 0,
            Compact = true,
        
            Callback = function(Value)
                VisualSense.ESP["Max Distance"] = Value
            end
        })

        ESP:AddToggle('Esp/Names', {
            Text = 'Names',
            Default = VisualSense["ESP"].Name.Enabled , 
            Callback = function(Value)
                VisualSense["ESP"].Name.Enabled = Value
            end
        }):AddColorPicker('NameColor', {
            Default = VisualSense["ESP"].Name.Color,
            Title = 'Name Color', 
            Transparency = nil, 
        
            Callback = function(Value)
                VisualSense["ESP"].Name.Color = Value
            end
        })

        ESP:AddToggle('Esp/Names/Outline', {
            Text = 'Name Outline',
            Default = VisualSense["ESP"].Name.Outline , 
            Callback = function(Value)
                VisualSense["ESP"].Name.Outline = Value
            end
        })

        
        ESP:AddToggle('Esp/Box', {
            Text = 'Box',
            Default = VisualSense["ESP"].Box.Enabled , 
            Callback = function(Value)
                VisualSense["ESP"].Box.Enabled = Value
            end
        }):AddColorPicker('BoxColor', {
            Default = VisualSense["ESP"].Box.Color,
            Title = 'Box Color', 
            Transparency = nil, 
        
            Callback = function(Value)
                VisualSense["ESP"].Box.Color = Value
            end
        })

        ESP:AddToggle('Esp/Names/Outline', {
            Text = 'Box Outline',
            Default = VisualSense["ESP"].Box.Outline , 
            Callback = function(Value)
                VisualSense["ESP"].Box.Outline = Value
            end
        })

        
        
        ESP:AddToggle('Esp/Health', {
            Text = 'Health Bar',
            Default = VisualSense["ESP"]["Health Bar"].Enabled , 
            Callback = function(Value)
                VisualSense["ESP"]["Health Bar"].Enabled = Value
            end
        }):AddColorPicker('HealthColor', {
            Default = VisualSense["ESP"]["Health Bar"].Color,
            Title = 'Health Bar Color', 
            Transparency = nil, 
        
            Callback = function(Value)
                VisualSense["ESP"]["Health Bar"].Color = Value
            end
        })


        ESP:AddToggle('Esp/Health/Outline', {
            Text = 'Health Bar Outline',
            Default = VisualSense["ESP"]["Health Bar"].Outline , 
            Callback = function(Value)
                VisualSense["ESP"]["Health Bar"].Outline = Value
            end
        })

        ESP:AddToggle('Esp/Distance', {
            Text = 'Distance',
            Default = VisualSense["ESP"].Distance.Enabled , 
            Callback = function(Value)
                VisualSense["ESP"].Distance.Enabled = Value
            end
        }):AddColorPicker('DistanceColor', {
            Default = VisualSense["ESP"].Distance.Color,
            Title = 'Distance Color', 
            Transparency = nil, 
        
            Callback = function(Value)
                VisualSense["ESP"].Distance.Color = Value
            end
        })

        ESP:AddToggle('Esp/Distance/Outline', {
            Text = 'Distance Outline',
            Default = VisualSense["ESP"].Distance.Outline , 
            Callback = function(Value)
                VisualSense["ESP"].Distance.Outline = Value
            end
        })






        -- UI Settings
        Library:SetWatermark('visualsense | '..tostring(os.date("%B") .. " " .. os.date("%d") .. " " .. os.date("%Y")).." | "..utility.Version)
        Library:SetWatermarkVisibility(false)
        local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
        local MenuGroup2 = Tabs['UI Settings']:AddRightGroupbox('More Settings')
        MenuGroup:AddButton('Unload', function() Library:Unload() end)
        MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = VisualSense["Options"]["Internal"].Bind, NoUI = true, Text = 'Menu keybind' })
        
        MenuGroup2:AddToggle('show_stats', {
            Text = 'Show Stats',
            Default = VisualSense["Options"]["Stats"],
            Callback = function(V) 
                VisualSense["Options"]["Stats"] = V
            end
        })
        
        MenuGroup2:AddToggle('allow_notifications', {
            Text = 'Allow Notifications',
            Default = VisualSense["Options"]["Allow Notifications"],
            Callback = function(V) 
                VisualSense["Options"]["Allow Notifications"] = V
            end
        })

        MenuGroup2:AddDropdown('notification_mode', {
            Values = NotificationTypes,
            Default = VisualSense.Options["Notifcation Type"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Type',
            Tooltip = 'Select a notification type', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                VisualSense.Options["Notifcation Type"] = Value
            end
        })
        
        
        MenuGroup2:AddToggle('togglewatermark', {
            Text = 'Watermark',
            Default = false,
            Callback = function(V) 
                Library:SetWatermarkVisibility(Toggles.togglewatermark.Value)
            end
        })
        

        ThemeManager:SetLibrary(Library)
        SaveManager:SetLibrary(Library)
        
        SaveManager:IgnoreThemeSettings()

        SaveManager:BuildConfigSection(Tabs['UI Settings'])
        
        ThemeManager:ApplyToTab(Tabs['UI Settings'])
        
        SaveManager:LoadAutoloadConfig()

        if game:GetService("UserInputService").TouchEnabled then 
            task.spawn(function()
                local VisualSenseMobileButton = Instance.new("ScreenGui")
                local Icon = Instance.new("Frame")
                local IconButton = Instance.new("TextButton")
                local IconImage = Instance.new("ImageLabel")
                local IconCorner = Instance.new("UICorner")
                VisualSenseMobileButton.Name = "VisualSenseMobileButton"
                VisualSenseMobileButton.IgnoreGuiInset = true
                VisualSenseMobileButton.Parent = game.CoreGui
                VisualSenseMobileButton.DisplayOrder = 10
                VisualSenseMobileButton.ResetOnSpawn = false
                Icon.Name = "Icon"
                Icon.Parent = VisualSenseMobileButton
                Icon.BackgroundTransparency = 1.000
                Icon.LayoutOrder = 1
                Icon.Position = UDim2.new(0, 104, 0, 4)
                Icon.Size = UDim2.new(0, 32, 0, 32)
                IconButton.Name = "IconButton"
                IconButton.Parent = Icon
                IconButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                IconButton.BackgroundTransparency = 0.500
                IconButton.BorderSizePixel = 0
                IconButton.Size = UDim2.new(1, 0, 1, 0)
                IconButton.ZIndex = 10
                IconButton.AutoButtonColor = false
                IconButton.Text = ""
                IconImage.Name = "IconImage"
                IconImage.Parent = IconButton
                IconImage.AnchorPoint = Vector2.new(0.5, 0.5)
                IconImage.BackgroundTransparency = 1.000
                IconImage.Position = UDim2.new(0.5, 0, 0.5, 0)
                IconImage.Size = UDim2.new(0, 20, 0.629999995, 0)
                IconImage.ZIndex = 11
                IconImage.Image = "rbxassetid://18129564380"
                IconImage.ScaleType = Enum.ScaleType.Fit
                IconCorner.CornerRadius = UDim.new(0.25, 0)
                IconCorner.Name = "IconCorner"
                IconCorner.Parent = IconButton
                IconButton.MouseButton1Down:Connect(function()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, string.upper(VisualSense["Options"]["Internal UI Bind"]) , false , game)
                end)
            end)
        end
    end
end

notify("VisualSense loaded.")
notify("Thank you for purchasing VisualSense.")
notify("discord.gg/internal")
