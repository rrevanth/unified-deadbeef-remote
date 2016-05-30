local kb = require("keyboard");
local starrating = 0;

function updateInfo()
	cmd = "deadbeef --nowplaying-tf '$select($add(%rating%,1),☆;☆;☆;☆;☆,★;☆;☆;☆;☆,★;★;☆;☆;☆,★;★;★;☆;☆,★;★;★;★;☆,★;★;★;★;★)| $select($add(%rating%,1),☆ ☆ ☆ ☆ ☆,★ ☆ ☆ ☆ ☆,★ ★ ☆ ☆ ☆,★ ★ ★ ☆ ☆,★ ★ ★ ★ ☆,★ ★ ★ ★ ★)$ifequal([%loved%], 1, ❤ ,) [(%year%)] [%artist% -] $if2(%title%,%filename%) [(%genre%)]'"
	local pout = "";
	local presult = 0;
	local perr = "";

	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
	stars, res = string.match(pout, "(.*)%|(.*)")
	libs.server.update(
		{ id = "title", text = res }	
	);
end 

--@help Refresh Meta
actions.refresh_info = function ()
	updateInfo();
end

--@help Toggle play/pause
actions.play_pause = function ()
	cmd = "screen -dmS dbeef deadbeef --play-pause"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
	updateInfo();
end

--@help Next playlist item
actions.next = function ()
	cmd = "screen -dmS dbeef deadbeef --next"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
	updateInfo();
end

--@help Previous playlist item
actions.previous = function ()
	cmd = "screen -dmS dbeef deadbeef --prev"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
	updateInfo();
end

--@help Stop playback
actions.stop = function ()
	cmd = "screen -dmS dbeef deadbeef --stop"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
	updateInfo();
end

--@help Play random song
actions.random_song = function ()
	cmd = "screen -dmS dbeef deadbeef --random"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
	updateInfo();
end

--@help Start DeadBeef in background
actions.start_dbeef = function ()
	cmd = "screen -dmS dbeef deadbeef"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
	updateInfo();
end

--@help Exit DeadBeef
actions.stop_dbeef = function ()
	cmd = "screen -dmS dbeef deadbeef --quit"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Copy to Favourites
actions.fav_it = function ()
	cmd = "deadbeef --nowplaying '%F' | xargs -0 cp -t /home/raven/Downloads/Music/Collection/"

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Remove from Favourites
actions.unfav_it = function ()
	cmd = 'rm "/home/raven/Downloads/Music/Collection/$(deadbeef --nowplaying %f)"'

	local pout = "";
	local presult = 0;
	local perr = "";
	
	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
end

--@help Rate Song 0 Star
actions.star_0 = function ()
  kb.stroke("ctrl","lwin","num0");
  starrating = 0;
end

--@help Rate Song 1 Star
actions.star_1 = function ()
  kb.stroke("ctrl","lwin","num1");
  starrating = 1;
end

--@help Rate Song 2 Star
actions.star_2 = function ()
  kb.stroke("ctrl","lwin","num2");
  starrating = 2;
end

--@help Rate Song 3 Star
actions.star_3 = function ()
  kb.stroke("ctrl","lwin","num3");
  starrating = 3;
end

--@help Rate Song 4 Star
actions.star_4 = function ()
  kb.stroke("ctrl","lwin","num4");
  starrating = 4;
end

--@help Rate Song 5 Star
actions.star_5 = function ()
  kb.stroke("ctrl","lwin","num5");
  starrating = 5;
end

--@help Love the Song
actions.love_it = function ()
  kb.stroke("ctrl","lwin","num6");
end
