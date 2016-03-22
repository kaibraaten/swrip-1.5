local tools = require("tools")

local savers = {}

local function genericsave(datatable, filename, fileheader, entryheader)
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
   genericsave(commands, filename, "-- Commands\n", "\nCommandEntry")
end

function savers.savesocials(socials, filename)
   genericsave(socials, filename, "-- Socials\n", "\nSocialEntry")
end

function savers.savehelps(helps, filename)
   genericsave(helps, filename, "-- Helps\n", "\nHelpEntry")
end

function savers.savearea(area, filename)
   singlesave(area, filename, "-- " .. area.Name .. "\n", "\nAreaEntry")
end

function savers.savecharacter(data, filename)
   singlesave(data, filename, "-- " .. data.Name .. "\n", "\nCharacterEntry" )
end

function savers.saveprofession(data, filename)
   singlesave(data, filename, "-- " .. data.Name .. "\n", "\nProfessionEntry" )
end

function savers.savesystemdata(data, filename)
   singlesave(data, filename, "-- SystemData\n", "\nSystemDataEntry")
end

function savers.savexptypes(xptypes, filename)
   genericsave(xptypes, filename, "-- XpTypes\n", "\nXpTypeEntry")
end

function savers.saveraces(races, filename)
   genericsave(races, filename, "-- Races\n", "\nRaceEntry")
end

return savers