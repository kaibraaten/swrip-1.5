-- The ice world Hoth
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [11111] = 
      {
         Layers = 0, 
         Description = "The Outlaw Tech Idea Board", 
         ShortDescr = "outlaw tech idea board", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 11111, 
         ActionDescription = "", 
         Tag = "", 
         Name = "Outlaw tech idea board", 
      }, 
      [11110] = 
      {
         Layers = 0, 
         Description = "The Outlaw Tech Board", 
         ShortDescr = "outlaw tech baord", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "government", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 11110, 
         ActionDescription = "", 
         Tag = "", 
         Name = "outlaw.board", 
      }, 
      [11109] = 
      {
         Layers = 0, 
         Description = "A sign is tacked to the wall here", 
         ShortDescr = "a sign", 
         Weight = 1, 
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
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 11109, 
         ActionDescription = "", 
         Tag = "", 
         Name = "Sign", 
      }, 
      [11101] = 
      {
         Layers = 0, 
         Description = "A package addressed to the Hunter's Guild's Receptionist", 
         ShortDescr = "a package addressed receptionist", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
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
         Vnum = 11101, 
         ActionDescription = "", 
         Tag = "", 
         Name = "receptionist package", 
      }, 
      [11102] = 
      {
         Layers = 0, 
         Description = "Some cargo has been left here.", 
         ShortDescr = "cargo", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
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
         Vnum = 11102, 
         ActionDescription = "", 
         Tag = "", 
         Name = "cargo", 
      }, 
      [11103] = 
      {
         Layers = 0, 
         Description = "Some duraplast during has been left lying around here.", 
         ShortDescr = "duraplast tubing", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "duraplast", 
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
         Vnum = 11103, 
         ActionDescription = "", 
         Tag = "", 
         Name = "duraplast tubing", 
      }, 
   }, 
   LevelRanges = 
   {
      Soft = 
      {
         High = 105, 
         Low = 0, 
      }, 
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
   }, 
   VnumRanges = 
   {
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
      Room = 
      {
         Last = 11249, 
         First = 11206, 
      }, 
   }, 
   ResetMessage = "The wind howls over the snow.", 
   ResetFrequency = 10, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 11206, 
         Arg1 = 11101, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [2] = 
      {
         Arg3 = 11220, 
         Arg1 = 11101, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [3] = 
      {
         Arg3 = 11233, 
         Arg1 = 11103, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [4] = 
      {
         Arg3 = 11235, 
         Arg1 = 11103, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [5] = 
      {
         Arg3 = 11236, 
         Arg1 = 11104, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Arg3 = 11236, 
         Arg1 = 11103, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [7] = 
      {
         Arg3 = 11236, 
         Arg1 = 11103, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [8] = 
      {
         Arg3 = 11237, 
         Arg1 = 11103, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [9] = 
      {
         Arg3 = 11209, 
         Arg1 = 90, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Arg3 = 16, 
         Arg1 = 52, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         Arg3 = 18, 
         Arg1 = 52, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg3 = 11210, 
         Arg1 = 10493, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Darrik", 
   Rooms = 
   {
      [11206] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11207, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11246, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11206, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11207] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11208, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11211, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11206, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11207, 
         Description = "You are outside the formerly hidden shield doors that once sealed off the\
abandoned Echo Base.   The opening to the ice cave that was the Base, is\
flanked by rocks, even though most of the base was chewed into\
centuries-old packed snow and ice.\
", 
         Tag = "", 
         Name = "Outside the 'hidden' shield doors", 
      }, 
      [11208] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11209, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11207, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11208, 
         Description = "The hangar of Echo Base is now filled with scrap equipment, discarded\
uniforms, and other miscellaneous junk. \
", 
         Tag = "", 
         Name = "Inside Echo Base", 
      }, 
      [11209] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11208, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11210, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11209, 
         Description = "This hallway, carved from ice has started to collapse and at its end is\
closed off by a previous cave-in.\
 \
There is a bed shoved in a corner.  Perhaps you can rest here.\
 \
 \
It is safe to quit here.\
", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [11210] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11209, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11210, 
         Description = "This storeroom seems to have been ransacked.  All the bags and boxes have\
been destroyed, the remains of wrappers strewn everywhere. \
", 
         Tag = "", 
         Name = "Storeroom", 
      }, 
      [11211] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11212, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11207, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11211, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11212] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11215, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11213, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11211, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11212, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11213] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11212, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11214, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11213, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11214] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11213, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 11247, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11214, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around. \
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11215] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11216, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11212, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11215, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11216] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11217, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11220, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11215, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11216, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11217] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11218, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11216, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11217, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11218] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11219, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11217, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11218, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11219] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11218, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11219, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11220] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11221, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11216, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11220, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11221] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11222, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11220, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11221, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11222] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11221, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11225, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11223, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11222, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11223] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11222, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11224, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11223, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11224] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11223, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11224, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11225] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11226, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11222, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11225, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11226] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11229, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11227, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11225, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11226, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11227] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11226, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11228, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11227, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11228] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11227, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11228, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11229] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11226, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 11230, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11229, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Tag = "", 
         Name = "A snowfield", 
      }, 
      [11230] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11231, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 11229, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11230, 
         Description = "The entrance to the Wampa Kingdom is a small hole in the ground.  You can\
not see it from more than 6 feet away, and in heavy weather, one can\
easily fall in. \
", 
         Tag = "", 
         Name = "Wampa Kingdom", 
      }, 
      [11231] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11232, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11230, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11231, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with boned and\
leavings from the many Wampas. \
", 
         Tag = "", 
         Name = "Wampa Kingdom", 
      }, 
      [11232] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11233, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11237, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11234, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11231, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11232, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Tag = "", 
         Name = "Wampa Kingdom", 
      }, 
      [11233] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11232, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11233, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Tag = "", 
         Name = "Wampa Den", 
      }, 
      [11234] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11232, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11235, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11236, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11234, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Tag = "", 
         Name = "Wampa Kingdom", 
      }, 
      [11235] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11234, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11235, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Tag = "", 
         Name = "Wampa Den", 
      }, 
      [11236] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11234, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11236, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Tag = "", 
         Name = "Leader's Den", 
      }, 
      [11237] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 11232, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11237, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Tag = "", 
         Name = "Wampa Den", 
      }, 
      [11238] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 11239, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11238, 
         Description = "It looks like a cavein blocked the passage way here.  You can go no\
further.\
", 
         Tag = "", 
         Name = "Cave-in", 
      }, 
      [11239] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 11238, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11239, 
         Description = "One of the large hangars that were part of Echo base, the room is filled\
with wrecked speeders and fighters.\
", 
         Tag = "", 
         Name = "Echo Base Hangar", 
      }, 
      [11240] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 11240, 
         Description = "", 
         Tag = "", 
         Name = "BlackStar", 
      }, 
      [11241] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 11241, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range.\
", 
         Tag = "", 
         Name = "Lightning Bomber 11241", 
      }, 
      [11242] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 11242, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Tag = "", 
         Name = "Lightning Bomber 11242", 
      }, 
      [11243] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 11243, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Tag = "", 
         Name = "Lightning Bomber 11243", 
      }, 
      [11244] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 11244, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Tag = "", 
         Name = "Lightning Bomber 11244", 
      }, 
      [11245] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 11245, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Tag = "", 
         Name = "Lightning Bomber 11245", 
      }, 
      [11246] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 11206, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11246, 
         Description = "", 
         Tag = "hoth_landing", 
         Name = "A snowfield", 
      }, 
      [11247] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 11214, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 11248, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11247, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [11248] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 11247, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 11249, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11248, 
         Description = "", 
         Tag = "", 
         Name = "Ice Worm's Cave", 
      }, 
      [11249] = 
      {
         Sector = "field", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 11248, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 11249, 
         Description = "", 
         Tag = "", 
         Name = "A Hidden Cavern", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "hoth.lua", 
   Mobiles = 
   {
      [11104] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
         NumberOfAttacks = 0, 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [2] = "tail", 
            [0] = "bite", 
            [5] = "kick", 
         }, 
         DamRoll = 16, 
         Description = "", 
         ShortDescr = "a one-armed wampa", 
         Weight = 0, 
         HitRoll = 16, 
         Sex = "undistinguished", 
         LongDescr = "A one-armed Wampa Leader looks like trouble\
", 
         HitChance = 
         {
            HitNoDice = 16, 
            HitSizeDice = 10, 
            HitPlus = 800, 
         }, 
         DefaultPosition = "standing", 
         Credits = 10000, 
         Level = 80, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 8, 
            DamPlus = 2, 
         }, 
         Vnum = 11104, 
         ArmorClass = -100, 
         Tag = "", 
         Name = "one-armed wampa", 
      }, 
      [11105] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 10, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Arguments = "100", 
               Code = "say Welcome, would you like something?\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "a tech shopkeeper", 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Description = "", 
         ShortDescr = "a tech shopkeeper", 
         Weight = 0, 
         HitRoll = 10, 
         Sex = "undistinguished", 
         LongDescr = "A tech shopkeeper sells items here.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 500, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 50, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
         Vnum = 11105, 
         ArmorClass = -25, 
         Tag = "", 
         Name = "A tech shopkeeper", 
      }, 
      [11106] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DamRoll = 10, 
         Description = "", 
         ShortDescr = "captain jusclik", 
         Weight = 0, 
         HitRoll = 10, 
         Sex = "undistinguished", 
         LongDescr = "Captain Jusclik stands here giving orders.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 500, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 50, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
         Vnum = 11106, 
         ArmorClass = -25, 
         Tag = "", 
         Name = "Captain Jusclik", 
      }, 
      [11107] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         NumberOfAttacks = 0, 
         SpecFuns = 
         {
            [0] = "spec_customs_weapons", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "5", 
               Code = "mpat 11274 drop all\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DamRoll = 6, 
         Description = "", 
         ShortDescr = "a tech customs officer", 
         Weight = 0, 
         HitRoll = 6, 
         Sex = "undistinguished", 
         LongDescr = "A tech customs oficer watches for carried weapons.\
", 
         HitChance = 
         {
            HitNoDice = 6, 
            HitSizeDice = 10, 
            HitPlus = 300, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 30, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 3, 
            DamPlus = 2, 
         }, 
         Vnum = 11107, 
         ArmorClass = 25, 
         Tag = "", 
         Name = "Tech customs officer", 
      }, 
      [11108] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 10, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "tech chef", 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Description = "", 
         ShortDescr = "tech chef", 
         Weight = 0, 
         HitRoll = 10, 
         Sex = "male", 
         LongDescr = "A tech chef makes food here.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 500, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 50, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
         Vnum = 11108, 
         ArmorClass = -25, 
         Tag = "", 
         Name = "tech chef", 
      }, 
      [11109] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "add hello hi", 
               Code = "say Hello, could you please take me to the swimming pool?\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "add yes sure", 
               Code = "say Are you talking to me?\
say My name is Mr Kooos\
", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "add kooos kooos", 
               Code = "say You will take me to the Pool?\
say Thanks $n, I really appreciate this.\
follow $n\
", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               Arguments = "turnstile", 
               Code = "mpwithdraw 5\
give 5 credits droid\
", 
               ScriptType = "MProg", 
            }, 
            [5] = 
            {
               MudProgType = "act_prog", 
               Arguments = "turbocar", 
               Code = "board turbocar\
", 
               ScriptType = "MProg", 
            }, 
            [6] = 
            {
               MudProgType = "act_prog", 
               Arguments = "exits", 
               Code = "leave\
", 
               ScriptType = "MProg", 
            }, 
            [7] = 
            {
               MudProgType = "entry_prog", 
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
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         DamRoll = 1, 
         Description = "", 
         ShortDescr = "Mr Kooos", 
         Weight = 0, 
         HitRoll = 1, 
         Sex = "undistinguished", 
         LongDescr = "Mr Kooos is looking for assitance\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 10, 
            HitPlus = 90, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 9, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 0, 
            DamPlus = 2, 
         }, 
         Vnum = 11109, 
         ArmorClass = 77, 
         Tag = "", 
         Name = "Mr Kooos", 
      }, 
      [11110] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "hello job", 
               Code = "say I am looking for hand-crafted vibroblades and blasters.\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "money sure okay ok yes", 
               Code = "say I will pay good money.\
say 500 for each vibroblade and 1500 for each blaster.\
", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
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
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         DamRoll = 10, 
         Description = "", 
         ShortDescr = "a freelance tech", 
         Weight = 0, 
         HitRoll = 10, 
         Sex = "undistinguished", 
         LongDescr = "A Freelance Tech will buy hand-crafted weapons here.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 500, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 50, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
         Vnum = 11110, 
         ArmorClass = -25, 
         Tag = "", 
         Name = "Freelance Tech", 
      }, 
      [11111] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "hello job", 
               Code = "mpechoat $n Riiice whispers to you: I need some\
mpechoat $n film developed.  It's good money.\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
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
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
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
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         DamRoll = 5, 
         Description = "", 
         ShortDescr = "Riiice", 
         Weight = 0, 
         HitRoll = 5, 
         Sex = "undistinguished", 
         LongDescr = "Riiice waits here for his agents.\
", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 250, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 25, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 2, 
            DamPlus = 2, 
         }, 
         Vnum = 11111, 
         ArmorClass = 37, 
         Tag = "", 
         Name = "Riiice", 
      }, 
      [11112] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "salesman", 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Description = "As fast as new products become available to Bounty Hunters, this salesman\
somehow gets them. Of course they can be a little pricy. But that what you\
pay to get the best i guess. \
", 
         ShortDescr = "salesman", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A freelance salesman sells engineering supplies\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 11112, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "A salesman", 
      }, 
      [11101] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         DamRoll = 0, 
         Description = "Although it looks like a formitable defense, looking closely you see that\
the power cables have been severed. \
", 
         ShortDescr = "a turret", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A blaster-cannon turret is installed here.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 10, 
            HitPlus = 10, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 0, 
            DamPlus = 2, 
         }, 
         Vnum = 11101, 
         ArmorClass = 97, 
         Tag = "", 
         Name = "A disabled blaster-cannon turret", 
      }, 
      [11102] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DamRoll = 4, 
         Description = "", 
         ShortDescr = "A wampa", 
         Weight = 0, 
         HitRoll = 4, 
         Sex = "undistinguished", 
         LongDescr = "A Wampa tears through bags looking for food.\
", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitSizeDice = 10, 
            HitPlus = 200, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 20, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 2, 
            DamPlus = 2, 
         }, 
         Vnum = 11102, 
         ArmorClass = 50, 
         Tag = "", 
         Name = "A Wampa", 
      }, 
      [11103] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = -1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         DamRoll = 8, 
         Description = "", 
         ShortDescr = "a wampa", 
         Weight = 0, 
         HitRoll = 8, 
         Sex = "undistinguished", 
         LongDescr = "A Wampa looks comfortable nawing on a bone.\
", 
         HitChance = 
         {
            HitNoDice = 8, 
            HitSizeDice = 10, 
            HitPlus = 400, 
         }, 
         DefaultPosition = "standing", 
         Credits = 500, 
         Level = 40, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 4, 
            DamPlus = 2, 
         }, 
         Vnum = 11103, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "Wampa", 
      }, 
   }, 
   LowEconomy = 2650770, 
   Name = "The ice world Hoth", 
}
