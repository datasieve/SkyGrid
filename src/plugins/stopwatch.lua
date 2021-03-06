-- stopwatch

usage = {};
usage["TIMER"] = "Usage: TIMER <NAME>";

hooks = {};
hooks["INCOMING"] = false;
hooks["OUTGOING"] = false;


function process( cmd )
	command = string.match(cmd, "(%w+)");

	if( string.upper(command) == "TIMER") then
		args = string.match(cmd, "%w+%s+(%w+)");

		if( not args ) then
		return usage[command];
		end

		return timer(args);
	else
		return "Invalid Command";
	end

end

----------------------------------------------------------

clocks = {};

function timer ( args )
	if( not clocks[args] ) then
		return(start_watch( args));
	else
		return(stop_watch( args));
	end
end

function start_watch ( args )
	start_time = os.time();
	clocks[args] = start_time;
	return "Timer [ " .. args .. " ] started at: " .. os.date("%X", start_time);
end

function stop_watch ( args )
	end_time = os.time();
	elapsed_time = end_time - clocks[ args ];
	clocks[ args ] = nil;
	return "Timer [ " .. args .. " ] elapsed time: " .. os.date("!%X", elapsed_time);
end
