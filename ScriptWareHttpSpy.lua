--Init and greetings
_G.Time = tick();
function STTB(a,b,c,d)c=c or false;d=d or 0;local e=string.rep(" ",d)if b then e=e..b.." = "end;if type(a)=="table"then e=e.."{"..(not c and"\n"or"")for f,g in pairs(a)do e=e..STTB(g,f,c,d+1)..","..(not c and"\n"or"")end;e=e..string.rep(" ",d).."}"elseif type(a)=="number"then e=e..tostring(a)elseif type(a)=="string"then e=e..string.format("%q",a)elseif type(a)=="boolean"then e=e..(a and"true"or"false")else e=e.."\"[inserializeable datatype:"..type(a).."]\""end;return e end
if SWHTOn then (consoleclear or rconsoleclear)() end;getgenv().SWHTOn = true;local Init_c = (consolecreate or rconsolecreate);if (not Init_c) or (getexecutorname():sub(1,#tostring(getexecutorname())) ~= 'ScriptWare') then warn('Exploit dont supports'); return end;Init_c();Init_c = nil;(consolesettitle or rconsolesettitle)('HTTP SPY by string.split#8169');(consoleprint or rconsoleprint)(
'\n' .. [=[
      :::    ::: ::::::::::: ::::::::::: :::::::::          ::::::::  :::::::::  :::   ::: 
     :+:    :+:     :+:         :+:     :+:    :+:        :+:    :+: :+:    :+: :+:   :+:  
    +:+    +:+     +:+         +:+     +:+    +:+        +:+        +:+    +:+  +:+ +:+    
   +#++:++#++     +#+         +#+     +#++:++#+         +#++:++#++ +#++:++#+    +#++:      
  +#+    +#+     +#+         +#+     +#+                      +#+ +#+           +#+        
 #+#    #+#     #+#         #+#     #+#               #+#    #+# #+#           #+#         
###    ###     ###         ###     ###                ########  ###           ###          
]=],'red');(consoleprint or rconsoleprint)(
'\n' .. [=[
Greetings, to enable HTTP SPY type "HSOn",if you want to disable it, use "HSOff" (P.S Only take effect on http.request)
]=],'green')

--Greeting end
--Variables

local old_htreq = http.request;
local LogFileName = 'Spy_'..math.random(0,99999)..'.log';
local Count = 0;
writefile(LogFileName,'THIS FILE GENERATED BY HTTP SPY by string.split#8169' ..'\nDate: ' .. os.date('%x %X') .. '\n' .. '--------------------LOG STARTED--------------------');
local function InputCommand()
	local input = (consoleinput or rconsoleinput)();
	if input == 'HSOn' then
		(consoleprint or rconsoleprint)('Enabled,Log file started: ' .. tostring(LogFileName) .. '\n','green');
		http.request = newcclosure(function(t)
			if type(t) == 'table' then
				appendfile(LogFileName,'\n['..Count..']\n\n' .. 'Url = '.. tostring(t.Url) ..'\n' .. 'Method = '.. tostring(t.Method) ..'\n' .. 'Body = '..tostring(STTB(game:GetService("HttpService"):JSONDecode(t.Body))) ..'\n' .. '\n['..Count..' closed]\n');Count = Count + 1;
				(consoleprint or rconsoleprint)('HTTP REQUEST (Exploit request) to: '.. tostring(t.Url) .. ', Method: '.. tostring(t.Method) .. ', Body: ' .. tostring(t.Body) .. '\n\n','red');
				return old_htreq(t);
			end;
			return old_htreq(t);
		end)
		getgenv().syn = {};getgenv().syn.request = http.request;getgenv().request = http.request;getgenv().http_request = http.request;
	elseif input == 'HSOff' then
		hookfunction(http.request,old_htreq);
		(consoleprint or rconsoleprint)('http.request function has been restored \n','green');
	else
		(consoleprint or rconsoleprint)('Unknown command or command typed wrong! \n','red');
	end;
	InputCommand();
end;(consoleprint or rconsoleprint)('Took: '..tostring((tick() - _G.Time)):sub(1,5) .. ' sec' .. '\n','green');_G.Time = nil;InputCommand(); --Command input function,and calling it for init it lol >) 


--End of script
