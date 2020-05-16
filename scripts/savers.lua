local tools = require("tools")

local savers = {}

local function multisave(datatable, filename, fileheader, entryheader)
   local f = assert(io.open(filename, "w"))

   f:write(fileheader)
   f:write( os.date("-- Last saved %A %d-%b-%Y %H:%M:%S\n" ) )

   for k,v in pairs(datatable) do
      f:write(entryheader)
      tools.serialize(v, 3, function(textdata) f:write(textdata) end)
      indentation_level = nil
   end

   f:close()
end

local function singlesave(datatable, filename, fileheader, entryheader)
   local f = assert(io.open(filename, "w"))

   f:write(fileheader)
   f:write(os.date("-- Last saved %A %d-%b-%Y %H:%M:%S\n"))

   f:write(entryheader)
   tools.serialize(datatable, 3, function(textdata) f:write(textdata) end)
   indentation_level = nil
   f:close()
end

function savers.savecommands(commands, filename)
   multisave(commands, filename, "-- Commands\n", "\nCommandEntry")
end

function savers.savesocials(socials, filename)
   multisave(socials, filename, "-- Socials\n", "\nSocialEntry")
end

function savers.savehelps(helps, filename)
   multisave(helps, filename, "-- Helps\n", "\nHelpEntry")
end

function savers.savearea(area, filename)
   singlesave(area, filename, "-- " .. area.Name .. "\n", "\nAreaEntry")
end

function savers.savecharacter(data, filename)
   singlesave(data, filename, "-- " .. data.Name .. "\n", "\nCharacterEntry" )
end

function savers.savesystemdata(data, filename)
   singlesave(data, filename, "-- SystemData\n", "\nSystemDataEntry")
end

function savers.saveskills(skills, filename)
   multisave(skills, filename, "-- Skills\n", "\nSkillEntry")
end

function savers.savespaceobject(spaceobject, filename)
   singlesave(spaceobject, filename, "-- " .. spaceobject.Name .. "\n", "\nSpaceobjectEntry")
end

function savers.saveplanet(planet, filename)
   singlesave(planet, filename, "-- " .. planet.Name .. "\n", "\nPlanetEntry")
end

function savers.saveclan(clan, filename)
   singlesave(clan, filename, "-- " .. clan.Name .. "\n", "\nClanEntry")
end

function savers.saveboard(board, filename)
   singlesave(board, filename, "-- " .. board.Name .. "\n", "\nBoardEntry")
end

function savers.savearea(area, filename)
   singlesave(area, filename, "-- " .. area.Name .. "\n", "\nAreaEntry")
end

function savers.saveplayer(player, filename)
   singlesave(player, filename, "-- " .. player.Name .. "\n", "\nPlayerEntry")
end

function savers.saveship(ship, filename)
   singlesave(ship, filename, "-- " .. ship.Name .. "\n", "\nShipEntry")
end

function savers.saveshuttle(shuttle, filename)
   singlesave(shuttle, filename, "-- " .. shuttle.Name .. "\n", "\nShuttleEntry")
end

function savers.savebadnames(badnames, filename)
   multisave(badnames, filename, "-- BadNames\n", "\nBadNameEntry")
end

function savers.savebans(bans, filename)
   multisave(bans, filename, "-- Bans\n", "\nBanEntry")
end

function savers.savebounties(bounties, filename)
   multisave(bounties, filename, "-- Bounties\n", "\nBountyEntry")
end

function savers.savehalloffame(halloffame, filename)
   multisave(halloffame, filename, "-- Hall of Fame\n", "\nHallOfFameEntry")
end

function savers.savestoreroom(storeroom, filename)
   singlesave(storeroom, filename, " -- Storeroom " .. storeroom.Vnum .. "\n", "\nStoreroomEntry")
end

function savers.savefoo(foo, filename)
   singlesave(foo, filename, "-- \n", "\nFooEntry")
end

return savers
