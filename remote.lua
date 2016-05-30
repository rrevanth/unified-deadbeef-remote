local kb = require("keyboard");
local starrating = 0;

function updateInfo()
	cmd = "deadbeef --nowplaying-tf '$select($add(%rating%,1),☆;☆;☆;☆;☆,★;☆;☆;☆;☆,★;★;☆;☆;☆,★;★;★;☆;☆,★;★;★;★;☆,★;★;★;★;★)$ifequal([%loved%], 1, ;💔,;❤)| $select($add(%rating%,1),☆ ☆ ☆ ☆ ☆,★ ☆ ☆ ☆ ☆,★ ★ ☆ ☆ ☆,★ ★ ★ ☆ ☆,★ ★ ★ ★ ☆,★ ★ ★ ★ ★)$ifequal([%loved%], 1, ❤ ,) [(%year%)] [%artist% -] $if2(%title%,%filename%) [(%genre%)]'"
	local pout = "";
	local presult = 0;
	local perr = "";

	local success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);
	stars, res = string.match(pout, "(.*)%|(.*)")
	s1, s2, s3, s4, s5, s6 = string.match(stars, "(.*)%;(.*)%;(.*)%;(.*)%;(.*)%;(.*)")
	libs.server.update(
		{ id = "title", text = res },
		{ id = "star1", text = "" .. s1 },
		{ id = "star2", text = "" .. s2 },
		{ id = "star3", text = "" .. s3 },
		{ id = "star4", text = "" .. s4 },
		{ id = "star5", text = "" .. s5 },
		{ id = "loveit", text = "" .. s6 }
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
	cmd = "deadbeef --nowplaying '%F' | xargs -0 cp -f -t /home/raven/Downloads/Music/Collection/"

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
  updateInfo();
end

--@help Rate Song 1 Star
actions.star_1 = function ()
  kb.stroke("ctrl","lwin","num1");
  updateInfo();
end

--@help Rate Song 2 Star
actions.star_2 = function ()
  kb.stroke("ctrl","lwin","num2");
  updateInfo();
end

--@help Rate Song 3 Star
actions.star_3 = function ()
  kb.stroke("ctrl","lwin","num3");
  updateInfo();
end

--@help Rate Song 4 Star
actions.star_4 = function ()
  kb.stroke("ctrl","lwin","num4");
  updateInfo();
end

--@help Rate Song 5 Star
actions.star_5 = function ()
  kb.stroke("ctrl","lwin","num5");
  updateInfo();
end

--@help Love the Song
actions.love_it = function ()
  kb.stroke("ctrl","lwin","num6");
  updateInfo();
end
