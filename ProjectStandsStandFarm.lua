repeat wait() until game.Players.LocalPlayer.PlayerGui.MainGui

local Inventory = game:GetService('Players').LocalPlayer.PlayerGui.MainGui.Inventory:FindFirstChild('ScrollingFrame') or game:GetService('Players').LocalPlayer.PlayerGui.MainGui.Inventory:WaitForChild('ScrollingFrame')
local R_Stands = {
    'Zoza';
    'The World';
    'Akins';
};

function Use(...)
    return game:GetService("ReplicatedStorage").Rex.RemoteFunctions["InventoryHandler.Use"]:InvokeServer(...)
end;

function ToSafePlace()
    local SafePart = Instance.new('Part');
    SafePart.Parent = workspace;
    SafePart.Anchored = true;
    SafePart.CanCollide = true;
    SafePart.Size = Vector3.new(5,5,5);
    SafePart.CFrame = CFrame.new(9999,20,9999);
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SafePart.CFrame * CFrame.new(0,5,0);
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true;
end;

--If you want you can remove the comment and put it instead of getgenv(). Stand_Farm it will end the cycle when one of the stands in this table R_Stands u got
--[[
function CheckRStands()
    for i,v in next,Inventory:GetChildren() do
        for i2,v2 in next,R_Stands do
            if v.Name == v2 then
                return true
            else
                return false
            end;
        end;
    end;
end;
]]

function Lock()
for i,v in next,R_Stands do
local tbl = {["Power"] = 0,["Id"] = v,["Rebirth"] = "",["SkillPath"] = {},["Experience"] = 0,["MaxExperience"] = 500,["Locked"] = false,["Level"] = 1,["SkillPoints"] = 0,["Requiem"] = false}
    game:GetService("ReplicatedStorage").Rex.RemoteFunctions["InventoryHandler.Lock"]:InvokeServer(tbl)
    end;
end;

function DeleteShitStands()
    return game:GetService("ReplicatedStorage").Rex.RemoteFunctions["Tree Of Life.RecallAllUnlocked"]:InvokeServer()
end;


function CollectArrow()
    for i,v in next,workspace:GetChildren() do
        if v.Name == 'Stand Arrow' and v:FindFirstChild('PrimaryPart') then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.PrimaryPart.TouchInterest.Parent,0);
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.PrimaryPart.TouchInterest.Parent,0);
        end;
    end;
end;

if getgenv().Stand_Farm == false then ToSafePlace() end;

game:GetService("Players").LocalPlayer.Idled:connect(function()
   game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

repeat wait(.5)
Lock()
DeleteShitStands()
    for i,v in next,Inventory:GetChildren() do
        if v.Name == 'Stand Arrow' and v:FindFirstChild('ViewportFrame') then
            Use({ ["Id"] = "Stand Arrow", ["Quantity"] = tonumber(v.ViewportFrame.Quantity.Text:match('%d+')) })
        else
            CollectArrow()
        end;
    end;
until getgenv().Stand_Farm
