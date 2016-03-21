local tools = {}

--[[
Generic function to serialize tables.
Source: Programming in Lua 2nd ed., p112, Ierusalimschy

Adapted to support indentation levels for nested tables.
--]]
function tools.serialize(o, ind, write)
   if type(o) == "number" then
      write(o)
   elseif type(o) == "string" then
      write(string.format("%q", o))
   elseif type(o) == "boolean" then
      write(tostring(o))
   elseif type(o) == "table" then
      if indentation_level == nil then
	 indentation_level = ind
	 ind = 0
      end

      write( "\n" .. string.rep(" ", ind) .. "{\n")
      ind = ind + indentation_level
      
      for k,v in pairs(o) do
	 if type(k) == "number" then
	    write(string.rep(" ", ind) .. "[")
	    tools.serialize(k, 0, write)
	    write("] = ")
	 else
	    write(string.rep(" ", ind) .. k .. " = ")
	 end

	 tools.serialize(v, ind, write)
	 write(", \n")
      end

      write(string.rep(" ", ind - indentation_level) .. "}")

      if ind - indentation_level == 0 then
	 write("\n")
      end
   else
      error("cannot serialize a " .. type(o))
   end
end

return tools;
