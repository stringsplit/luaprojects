repeat wait() until game:IsLoaded() and game.Players.LocalPlayer;

local vu = game:GetService('VirtualUser');
game:GetService('Players').LocalPlayer.Idled:Connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame);
   wait(1);
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame);
end);

local Noclip = game.RunService.Stepped:Connect(function()
    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChild('Humanoid');
    if Humanoid then
        Humanoid:ChangeState(11);
    end;
end);

if not getgenv().Enable then Noclip:Disconnect() end;

local shells = {};

local function ChangePosition(Pos)
    local Tween = game:GetService("TweenService");
    local HumanoidRoot = game.Players.LocalPlayer.Character.HumanoidRootPart;
    local Info = TweenInfo.new((HumanoidRoot.CFrame.Position - Pos.Position).magnitude/320, Enum.EasingStyle.Linear);
    
    local Main = Tween:Create(HumanoidRoot,Info,{CFrame = Pos})
    
    Main:Play();
    
    return Main;
end;

local HighPosition = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y+700,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z);
ChangePosition(HighPosition).Completed:Wait();

if game.Players.LocalPlayer.Character:FindFirstChild('LowerTorso') then
    local Root = game.Players.LocalPlayer.Character.LowerTorso.Root:Clone();
    game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy();
    Root.Parent = game.Players.LocalPlayer.Character.LowerTorso;
end;

local function ShellsUpdate()
    for i,v in next,workspace:GetDescendants() do
        if v:FindFirstChild('Shell') then
            table.insert(shells,v.Shell);
        end;
    end;
end;ShellsUpdate()

while getgenv().Enable do wait(0)
    for i,v in next,shells do
        ChangePosition(v.Part.Hitbox.CFrame).Completed:Wait();
        shells = {};
        ShellsUpdate();
        if (#shells <= 0) then
            local HttpService, TPService = game:GetService("HttpService"), game:GetService("TeleportService");
            local ServersToTP = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"));
            for _, s in pairs(ServersToTP.data) do
                if s and s.playing ~= s.maxPlayers then
                    if game.JobId ~= s.id and s.ping < 100 then
                        TPService:TeleportToPlaceInstance(game.PlaceId, s.id);
                        break;
                    end;
                end;
             end;
            return;
        end;
    end;
end;
