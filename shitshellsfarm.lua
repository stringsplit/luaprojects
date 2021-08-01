game.RunService.Stepped:Connect(function()
    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChild('Humanoid');
    if Humanoid then
        Humanoid:ChangeState(11);
    end;
end);

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
            shells[i] = v.Shell;
        end;
    end;
end;ShellsUpdate()

while getgenv().Enable do wait(0)
    for i,v in next,shells do
        ChangePosition(v.Part.Hitbox.CFrame).Completed:Wait();
        table.remove(shells,i);
        ShellsUpdate();
    end;
end;
