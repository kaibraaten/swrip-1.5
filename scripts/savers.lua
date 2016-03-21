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

function savers.savecommands(filename)
   genericsave(commands, filename, "-- Commands\n", "\nCommandEntry")
   commands = nil
end

function savers.savesocials(filename)
   genericsave(socials, filename, "-- Socials\n", "\nSocialEntry")
   socials = nil
end

function savers.savehelps(filename)
   genericsave(helps, filename, "-- Helps\n", "\nHelpEntry")
   helps = nil
end

function savers.savearea(filename)
   singlesave(area, filename, "-- " .. area.filename .. "\n", "\nAreaEntry")
   area = nil
end

function savers.savechar(data, filename)
   singlesave(data, filename, "-- " .. data.name .. "\n", "\nCharacterEntry" )
end

return savers
