require('socket')

usage = {};
usage["NETCONNECT"] = "NETCONNECT <IP> <PORT>";

hooks = {};
hooks["INCOMING"] = true;
hooks["OUTGOING"] = true;

function process( cmd )
command = string.match(cmd, "%w+");

if( string.upper(command) == "NETCONNECT") then

return netconnect(cmd);
else
return "Command Failed";
end

end

-----------------------------------------------------------------

client = socket.tcp();

function netconnect( cmd )
-- print("In NetConnect");
client:connect("127.0.0.1", "3333");
if(client:send("Connected")) then
return "Connected";
end
end


function incoming( data )
if client:send(data .. "\n") then
return "INCOMING NET TEST WORKED";
else
return "INCOMING NET TEST FAILED";
end
end

function outgoing( data )
if client:send(data .. "\n") then
return "OUTGOING NET TEST WORKED";
else
return "OUTGOING NET TEST FAILED";
end
end
