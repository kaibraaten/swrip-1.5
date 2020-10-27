-- The ice world Hoth
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   ResetFrequency = 10, 
   VnumRanges = 
   {
      Room = 
      {
         Last = 11249, 
         First = 11206, 
      }, 
      Object = 
      {
         Last = 11111, 
         First = 11101, 
      }, 
      Mob = 
      {
         Last = 11112, 
         First = 11101, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg3 = 11206, 
         Arg2 = 2, 
         Arg1 = 11101, 
         Command = "M", 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg3 = 11220, 
         Arg2 = 2, 
         Arg1 = 11101, 
         Command = "M", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg3 = 11233, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Command = "M", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg3 = 11235, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Command = "M", 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg3 = 11236, 
         Arg2 = 1, 
         Arg1 = 11104, 
         Command = "M", 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg3 = 11236, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Command = "M", 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg3 = 11236, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Command = "M", 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg3 = 11237, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Command = "M", 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg3 = 11209, 
         Arg2 = 1, 
         Arg1 = 90, 
         Command = "O", 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 52, 
         Command = "E", 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg3 = 18, 
         Arg2 = 1, 
         Arg1 = 52, 
         Command = "E", 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg3 = 11210, 
         Arg2 = 1, 
         Arg1 = 10493, 
         Command = "O", 
      }, 
   }, 
   Rooms = 
   {
      [11206] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11207, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11246, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 11206, 
      }, 
      [11207] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11208, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11211, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11206, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Outside the 'hidden' shield doors", 
         Tunnel = 0, 
         Description = "You are outside the formerly hidden shield doors that once sealed off the\
abandoned Echo Base.   The opening to the ice cave that was the Base, is\
flanked by rocks, even though most of the base was chewed into\
centuries-old packed snow and ice.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11207, 
      }, 
      [11208] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11209, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11207, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Inside Echo Base", 
         Tunnel = 0, 
         Description = "The hangar of Echo Base is now filled with scrap equipment, discarded\
uniforms, and other miscellaneous junk. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11208, 
      }, 
      [11209] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11208, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11210, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         Name = "Hallway", 
         Tunnel = 0, 
         Description = "This hallway, carved from ice has started to collapse and at its end is\
closed off by a previous cave-in.\
 \
There is a bed shoved in a corner.  Perhaps you can rest here.\
 \
 \
It is safe to quit here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11209, 
      }, 
      [11210] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11209, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Storeroom", 
         Tunnel = 0, 
         Description = "This storeroom seems to have been ransacked.  All the bags and boxes have\
been destroyed, the remains of wrappers strewn everywhere. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11210, 
      }, 
      [11211] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11212, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11207, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11211, 
      }, 
      [11212] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11215, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11213, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11211, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11212, 
      }, 
      [11213] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11212, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11214, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11213, 
      }, 
      [11214] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11213, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11247, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11214, 
      }, 
      [11215] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11216, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11212, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11215, 
      }, 
      [11216] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11217, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11220, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11215, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11216, 
      }, 
      [11217] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11218, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11216, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11217, 
      }, 
      [11218] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11219, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11217, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11218, 
      }, 
      [11219] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11218, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11219, 
      }, 
      [11220] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11221, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11216, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11220, 
      }, 
      [11221] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11222, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11220, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11221, 
      }, 
      [11222] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11221, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11225, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11223, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11222, 
      }, 
      [11223] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11222, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11224, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11223, 
      }, 
      [11224] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11223, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11224, 
      }, 
      [11225] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11226, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11222, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11225, 
      }, 
      [11226] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11229, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11227, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11225, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11226, 
      }, 
      [11227] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11226, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11228, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11227, 
      }, 
      [11228] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11227, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11228, 
      }, 
      [11229] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11226, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11230, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11229, 
      }, 
      [11230] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11231, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11229, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Wampa Kingdom", 
         Tunnel = 0, 
         Description = "The entrance to the Wampa Kingdom is a small hole in the ground.  You can\
not see it from more than 6 feet away, and in heavy weather, one can\
easily fall in. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11230, 
      }, 
      [11231] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11232, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11230, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Wampa Kingdom", 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with boned and\
leavings from the many Wampas. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11231, 
      }, 
      [11232] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11233, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11237, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11234, 
               Key = -1, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11231, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Wampa Kingdom", 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11232, 
      }, 
      [11233] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11232, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Wampa Den", 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11233, 
      }, 
      [11234] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11232, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11235, 
               Key = -1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11236, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Wampa Kingdom", 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11234, 
      }, 
      [11235] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11234, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Wampa Den", 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11235, 
      }, 
      [11236] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11234, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Leader's Den", 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11236, 
      }, 
      [11237] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11232, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Wampa Den", 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11237, 
      }, 
      [11238] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11239, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Cave-in", 
         Tunnel = 0, 
         Description = "It looks like a cavein blocked the passage way here.  You can go no\
further.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11238, 
      }, 
      [11239] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11238, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Name = "Echo Base Hangar", 
         Tunnel = 0, 
         Description = "One of the large hangars that were part of Echo base, the room is filled\
with wrecked speeders and fighters.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11239, 
      }, 
      [11240] = 
      {
         Exits = 
         {
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "BlackStar", 
         Tunnel = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11240, 
      }, 
      [11241] = 
      {
         Exits = 
         {
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Lightning Bomber 11241", 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range.\
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 11241, 
      }, 
      [11242] = 
      {
         Exits = 
         {
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Lightning Bomber 11242", 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 11242, 
      }, 
      [11243] = 
      {
         Exits = 
         {
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Lightning Bomber 11243", 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 11243, 
      }, 
      [11244] = 
      {
         Exits = 
         {
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Lightning Bomber 11244", 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 11244, 
      }, 
      [11245] = 
      {
         Exits = 
         {
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Lightning Bomber 11245", 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 11245, 
      }, 
      [11246] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11206, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 11246, 
      }, 
      [11247] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11214, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11248, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
         Tunnel = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 11247, 
      }, 
      [11248] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11247, 
               Key = -1, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11249, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Ice Worm's Cave", 
         Tunnel = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 11248, 
      }, 
      [11249] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               DestinationVnum = 11248, 
               Key = -1, 
            }, 
         }, 
         Tag = "", 
         TeleDelay = 0, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "A Hidden Cavern", 
         Tunnel = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Sector = "field", 
         Vnum = 11249, 
      }, 
   }, 
   Mobiles = 
   {
      [11104] = 
      {
         Weight = 0, 
         Level = 80, 
         LongDescr = "A one-armed Wampa Leader looks like trouble\
", 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 16, 
            HitPlus = 800, 
            HitSizeDice = 10, 
         }, 
         Credits = 10000, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Name = "one-armed wampa", 
         ShortDescr = "a one-armed wampa", 
         ArmorClass = -100, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Sex = "undistinguished", 
         Position = "standing", 
         DamRoll = 16, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 8, 
         }, 
         Race = "Human", 
         AttackFlags = 
         {
            [1] = "claws", 
            [2] = "tail", 
            [0] = "bite", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Description = "", 
         Alignment = 0, 
         HitRoll = 16, 
         Vnum = 11104, 
      }, 
      [11105] = 
      {
         Weight = 0, 
         Level = 50, 
         LongDescr = "A tech shopkeeper sells items here.\
", 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "a tech shopkeeper", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
         }, 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 500, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Name = "A tech shopkeeper", 
         ShortDescr = "a tech shopkeeper", 
         ArmorClass = -25, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "say Welcome, would you like something?\
", 
               ScriptType = "MProg", 
               MudProgType = "greet_prog", 
            }, 
         }, 
         Position = "standing", 
         DamRoll = 10, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "", 
         Alignment = 0, 
         HitRoll = 10, 
         Vnum = 11105, 
      }, 
      [11106] = 
      {
         Weight = 0, 
         Level = 50, 
         LongDescr = "Captain Jusclik stands here giving orders.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 500, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Name = "Captain Jusclik", 
         ShortDescr = "captain jusclik", 
         ArmorClass = -25, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         DamRoll = 10, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Race = "Human", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Description = "", 
         Alignment = 0, 
         HitRoll = 10, 
         Vnum = 11106, 
      }, 
      [11107] = 
      {
         Weight = 0, 
         Level = 30, 
         LongDescr = "A tech customs oficer watches for carried weapons.\
", 
         SpecFuns = 
         {
            [0] = "spec_customs_weapons", 
         }, 
         HitChance = 
         {
            HitNoDice = 6, 
            HitPlus = 300, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Name = "Tech customs officer", 
         ShortDescr = "a tech customs officer", 
         ArmorClass = 25, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "5", 
               Code = "mpat 11274 drop all\
", 
               ScriptType = "MProg", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Position = "standing", 
         DamRoll = 6, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 3, 
         }, 
         Race = "Human", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Description = "", 
         Alignment = 0, 
         HitRoll = 6, 
         Vnum = 11107, 
      }, 
      [11108] = 
      {
         Weight = 0, 
         Level = 50, 
         LongDescr = "A tech chef makes food here.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 500, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "tech chef", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
         }, 
         Name = "tech chef", 
         ShortDescr = "tech chef", 
         ArmorClass = -25, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         DamRoll = 10, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Sex = "male", 
         Race = "Human", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "", 
         Alignment = 0, 
         HitRoll = 10, 
         Vnum = 11108, 
      }, 
      [11109] = 
      {
         Weight = 0, 
         Level = 9, 
         LongDescr = "Mr Kooos is looking for assitance\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 90, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Name = "Mr Kooos", 
         ShortDescr = "Mr Kooos", 
         ArmorClass = 77, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "add hello hi", 
               Code = "say Hello, could you please take me to the swimming pool?\
", 
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "add yes sure", 
               Code = "say Are you talking to me?\
say My name is Mr Kooos\
", 
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "add kooos kooos", 
               Code = "say You will take me to the Pool?\
say Thanks $n, I really appreciate this.\
follow $n\
", 
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Arguments = "turnstile", 
               Code = "mpwithdraw 5\
give 5 credits droid\
", 
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
            }, 
            [5] = 
            {
               Arguments = "turbocar", 
               Code = "board turbocar\
", 
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
            }, 
            [6] = 
            {
               Arguments = "exits", 
               Code = "leave\
", 
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
            }, 
            [7] = 
            {
               Arguments = "100", 
               Code = "if ovnumhere(10206) >= 1\
Say Thank you $r. I really apreciate your help.\
mpwithdraw 200\
give 200 credits $r\
mpgain $r 5 2000\
follow self\
mpecho Mr Looos dives into the swimming pool.\
mpgoto 10240\
endif\
", 
               ScriptType = "MProg", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         Position = "standing", 
         DamRoll = 1, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Description = "", 
         Alignment = 0, 
         HitRoll = 1, 
         Vnum = 11109, 
      }, 
      [11110] = 
      {
         Weight = 0, 
         Level = 50, 
         LongDescr = "A Freelance Tech will buy hand-crafted weapons here.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 500, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Name = "Freelance Tech", 
         ShortDescr = "a freelance tech", 
         ArmorClass = -25, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hello job", 
               Code = "say I am looking for hand-crafted vibroblades and blasters.\
", 
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "money sure okay ok yes", 
               Code = "say I will pay good money.\
say 500 for each vibroblade and 1500 for each blaster.\
", 
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "gives", 
               Code = "if ovnuminv(10420) >= 1\
Say Great Work\
mpwithdraw 5000\
give 5000 credits $n\
drop 5000 credits\
mpat 11283 drop all\
mpecho The Tech quickly delivers the blaster.\
endif\
if ovnuminv(10422) >= 1\
Say Decent craftmanship\
mpwithdraw 500\
give 500 credits $n\
mpat 11283 drop all\
mpecho The tech quickly delivers the vibroblade.\
endif\
", 
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Position = "standing", 
         DamRoll = 10, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Description = "", 
         Alignment = 0, 
         HitRoll = 10, 
         Vnum = 11110, 
      }, 
      [11111] = 
      {
         Weight = 0, 
         Level = 25, 
         LongDescr = "Riiice waits here for his agents.\
", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitPlus = 250, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Name = "Riiice", 
         ShortDescr = "Riiice", 
         ArmorClass = 37, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hello job", 
               Code = "mpechoat $n Riiice whispers to you: I need some\
mpechoat $n film developed.  It's good money.\
", 
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "sure okay ok yes", 
               Code = "if ovnumcarry(10217) >= 1\
give film $n\
drop film\
mpechoat $n Riiice continues: take this film to the\
mpechoat $n hidden shopkeeper on Coronet.  She will \
mpechoat $n be waiting for you.\
endif\
if ovnumcarry(10217) < 1\
mpechoat $n Riiice says: Im afraid the film has\
mpechoat $n already been delivered.  Sorry.\
endif\
", 
               ScriptType = "MProg", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "gives", 
               Code = "if ovnuminv(10218) >= 1\
mpechoat $n Riiice hisses, \"Incredible. You returned\"\
mpwithdraw 2000\
give 2000 credits $n\
mpat 10299 drop all\
mpat 10299 mppurge\
mpecho Riiice glances quickly over a package of pictures\
mpecho and then dumps them in an incinerator.\
endif\
 \
if ovnuminv(11102) >= 1\
say Good, I have been waiting for this. \
mpwithdraw 1500\
give 1500 credits $n\
mpgain $n 4 1000\
else\
say hmm.. Thanks, but that wasn't quite what i was looking for.\
mpat 10299 drop all\
mpat 10299 mppurge\
endif\
", 
               ScriptType = "MProg", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Position = "standing", 
         DamRoll = 5, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Description = "", 
         Alignment = 0, 
         HitRoll = 5, 
         Vnum = 11111, 
      }, 
      [11112] = 
      {
         Weight = 0, 
         Level = 1, 
         LongDescr = "A freelance salesman sells engineering supplies\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "salesman", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
         }, 
         Name = "A salesman", 
         ShortDescr = "salesman", 
         ArmorClass = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "As fast as new products become available to Bounty Hunters, this salesman\
somehow gets them. Of course they can be a little pricy. But that what you\
pay to get the best i guess. \
", 
         Alignment = 0, 
         HitRoll = 0, 
         Vnum = 11112, 
      }, 
      [11101] = 
      {
         Weight = 0, 
         Level = 1, 
         LongDescr = "A blaster-cannon turret is installed here.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 10, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Name = "A disabled blaster-cannon turret", 
         ShortDescr = "a turret", 
         ArmorClass = 97, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Position = "standing", 
         DamRoll = 0, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Description = "Although it looks like a formitable defense, looking closely you see that\
the power cables have been severed. \
", 
         Alignment = 0, 
         HitRoll = 0, 
         Vnum = 11101, 
      }, 
      [11102] = 
      {
         Weight = 0, 
         Level = 20, 
         LongDescr = "A Wampa tears through bags looking for food.\
", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 200, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Name = "A Wampa", 
         ShortDescr = "A wampa", 
         ArmorClass = 50, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         DamRoll = 4, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Race = "Human", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         Description = "", 
         Alignment = 0, 
         HitRoll = 4, 
         Vnum = 11102, 
      }, 
      [11103] = 
      {
         Weight = 0, 
         Level = 40, 
         LongDescr = "A Wampa looks comfortable nawing on a bone.\
", 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         HitChance = 
         {
            HitNoDice = 8, 
            HitPlus = 400, 
            HitSizeDice = 10, 
         }, 
         Credits = 500, 
         Name = "Wampa", 
         ShortDescr = "a wampa", 
         ArmorClass = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         DamRoll = 8, 
         Stats = 
         {
            Constitution = 10, 
            Force = 0, 
            Strength = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 4, 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Description = "", 
         Alignment = -1000, 
         HitRoll = 8, 
         Vnum = 11103, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Objects = 
   {
      [11111] = 
      {
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         Name = "Outlaw tech idea board", 
         ShortDescr = "outlaw tech idea board", 
         Description = "The Outlaw Tech Idea Board", 
         Vnum = 11111, 
      }, 
      [11110] = 
      {
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "government", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         Name = "outlaw.board", 
         ShortDescr = "outlaw tech baord", 
         Description = "The Outlaw Tech Board", 
         Vnum = 11110, 
      }, 
      [11109] = 
      {
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Sign", 
               Description = "The Mountain Defense School has merged with the Gamaak Fitness Center.  You\
\13can find us there.\
\13", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         Name = "Sign", 
         ShortDescr = "a sign", 
         Description = "A sign is tacked to the wall here", 
         Vnum = 11109, 
      }, 
      [11101] = 
      {
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Name = "receptionist package", 
         ShortDescr = "a package addressed receptionist", 
         Description = "A package addressed to the Hunter's Guild's Receptionist", 
         Vnum = 11101, 
      }, 
      [11102] = 
      {
         Weight = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Name = "cargo", 
         ShortDescr = "cargo", 
         Description = "Some cargo has been left here.", 
         Vnum = 11102, 
      }, 
      [11103] = 
      {
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "duraplast", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Name = "duraplast tubing", 
         ShortDescr = "duraplast tubing", 
         Description = "Some duraplast during has been left lying around here.", 
         Vnum = 11103, 
      }, 
   }, 
   LowEconomy = 2688270, 
   Author = "Darrik", 
   LevelRanges = 
   {
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
      Soft = 
      {
         High = 105, 
         Low = 0, 
      }, 
   }, 
   Name = "The ice world Hoth", 
   ResetMessage = "The wind howls over the snow.", 
   HighEconomy = 0, 
   Filename = "hoth.lua", 
}
