--Init and greetings
local Init_c = consolecreate or rconsolecreate;if not Init_c then warn('Exploit dont supports');end;Init_c();Init_c = nil;(consolesettitle or rconsolesettitle)('HTTP SPY by string.split#8169');(consoleprint or rconsoleprint)(
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
local function InputCommand()
	local input = (consoleinput or rconsoleinput)();
	if input == 'HSOn' then
		(consoleprint or rconsoleprint)('Enabled \n','green');
		http.request = newcclosure(function(t) 
			if type(t) == 'table' then
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
end;InputCommand(); --Command input function,and calling it for init it lol >) 


--End of script
