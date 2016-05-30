local kb = require("keyboard");
local starrating = 0;
function split(pString, pPattern)
   local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = pString:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
     table.insert(Table,cap)
      end
      last_end = e+1
      s, e, cap = pString:find(fpat, last_end)
   end
   if last_end <= #pString then
      cap = pString:sub(last_end)
      table.insert(Table, cap)
   end
   return Table
end

function updateInfo()
	cmd = "deadbeef --nowplaying-tf '[(%year%)] [%artist% -] $if2(%title%,%filename%) [(%genre%)]'"
	local pout = "";
	local presult = 0;
	local perr = "";
	local success, ex = pcall(function ()
		starrating,perr,presult = libs.script.shell('kid3-cli -c "get rating" "$(deadbeef --nowplaying %F)"');
	end);
	pout = "";
	presult = 0;
	perr = "";
	
	success, ex = pcall(function ()
		pout,perr,presult = libs.script.shell(cmd);
	end);

	libs.server.update(
		{ id = "title", text = pout }
	);
	switch(starrating) : caseof {
		[1]   = function () 	libs.server.update({ id = "star1", text = "★" },{ id = "star2", text = "☆" },{ id = "star3", text = "☆" },{ id = "star4", text = "☆" },{ id = "star5", text = "☆" }); end,
		[2]   = function () 	libs.server.update({ id = "star1", text = "★" },{ id = "star2", text = "★" },{ id = "star3", text = "☆" },{ id = "star4", text = "☆" },{ id = "star5", text = "☆" }); end,
		[3]   = function () 	libs.server.update({ id = "star1", text = "★" },{ id = "star2", text = "★" },{ id = "star3", text = "★" },{ id = "star4", text = "☆" },{ id = "star5", text = "☆" }); end,
		[4]   = function () 	libs.server.update({ id = "star1", text = "★" },{ id = "star2", text = "★" },{ id = "star3", text = "★" },{ id = "star4", text = "★" },{ id = "star5", text = "☆" }); end,
		[5]   = function () 	libs.server.update({ id = "star1", text = "★" },{ id = "star2", text = "★" },{ id = "star3", text = "★" },{ id = "star4", text = "★" },{ id = "star5", text = "★" }); end,
		default   = function () 	libs.server.update({ id = "star1", text = "☆" },{ id = "star2", text = "☆" },{ id = "star3", text = "☆" },{ id = "star4", text = "☆" },{ id = "star5", text = "☆" }); end
	}
end 

-- --@help Rating Update function
-- function updateRating()
--   cmd = "deadbeef --nowplaying-tf '$select(%rating%,\'☆,☆,☆,☆,☆\',\'★,☆,☆,☆,☆\',\'★,★,☆,☆,☆\',\'★,★,★,☆,☆\',\'★,★,★,★,☆\',\'★,★,★,★,★\')'"
--   local pout = "";
--   local presult = 0;
--   local perr = "";
  
--   local success, ex = pcall(function ()
--     pout,perr,presult = libs.script.shell(cmd);
--   end);
--   stars=split(pout,",")
--   for i=1, 10 do
-- 	  libs.server.update(
--       { id = "star" .. i, text = stars[i] }
-- 	  );
--   end
--   libs.device.toast(pout);
-- end


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
