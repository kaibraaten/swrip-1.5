-- The ice world Hoth
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 11101, 
         Last = 11112, 
      }, 
      Object = 
      {
         First = 11101, 
         Last = 11111, 
      }, 
      Room = 
      {
         First = 11206, 
         Last = 11249, 
      }, 
   }, 
   Objects = 
   {
      [11111] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11111, 
         Cost = 0, 
         ShortDescr = "outlaw tech idea board", 
         Layers = 0, 
         Weight = 1, 
         Name = "Outlaw tech idea board", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "The Outlaw Tech Idea Board", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [11110] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11110, 
         Cost = 0, 
         ShortDescr = "outlaw tech baord", 
         Layers = 0, 
         Weight = 1, 
         Name = "outlaw.board", 
         ActionDescription = "", 
         ItemType = "government", 
         Description = "The Outlaw Tech Board", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [11109] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The Mountain Defense School has merged with the Gamaak Fitness Center.  You\
\13can find us there.\
\13", 
               Keyword = "Sign", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 11109, 
         Cost = 0, 
         ShortDescr = "a sign", 
         Layers = 0, 
         Weight = 1, 
         Description = "A sign is tacked to the wall here", 
         ActionDescription = "", 
         ItemType = "trash", 
         Name = "Sign", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [11101] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11101, 
         Cost = 0, 
         ShortDescr = "a package addressed receptionist", 
         Weight = 1, 
         Layers = 0, 
         Name = "receptionist package", 
         Description = "A package addressed to the Hunter's Guild's Receptionist", 
         ActionDescription = "", 
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
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
      }, 
      [11102] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11102, 
         Cost = 0, 
         ShortDescr = "cargo", 
         Weight = 100, 
         Layers = 0, 
         Name = "cargo", 
         Description = "Some cargo has been left here.", 
         ActionDescription = "", 
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
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
      }, 
      [11103] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11103, 
         Cost = 0, 
         ShortDescr = "duraplast tubing", 
         Weight = 1, 
         Layers = 0, 
         Name = "duraplast tubing", 
         Description = "Some duraplast during has been left lying around here.", 
         ActionDescription = "", 
         ItemType = "duraplast", 
         WearFlags = 
         {
            [0] = "Take", 
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
      }, 
   }, 
   HighEconomy = 0, 
   Rooms = 
   {
      [11206] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11206, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11207, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11246, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11207] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11207, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "You are outside the formerly hidden shield doors that once sealed off the\
abandoned Echo Base.   The opening to the ice cave that was the Base, is\
flanked by rocks, even though most of the base was chewed into\
centuries-old packed snow and ice.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11208, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11211, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11206, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Outside the 'hidden' shield doors", 
      }, 
      [11208] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 11208, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Name = "Inside Echo Base", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11209, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11207, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The hangar of Echo Base is now filled with scrap equipment, discarded\
uniforms, and other miscellaneous junk. \
", 
      }, 
      [11209] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         Vnum = 11209, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11208, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11210, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This hallway, carved from ice has started to collapse and at its end is\
closed off by a previous cave-in.\
 \
There is a bed shoved in a corner.  Perhaps you can rest here.\
 \
 \
It is safe to quit here.\
", 
      }, 
      [11210] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11210, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This storeroom seems to have been ransacked.  All the bags and boxes have\
been destroyed, the remains of wrappers strewn everywhere. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11209, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Storeroom", 
      }, 
      [11211] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11211, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11212, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11207, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11212] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11212, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11215, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11213, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11211, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11213] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11213, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11212, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11214, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11214] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11214, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11213, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 11247, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11215] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11215, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11216, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11212, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11216] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11216, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11217, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11220, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11215, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11217] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11217, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11218, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11216, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11218] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11218, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11219, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11217, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11219] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11219, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11218, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11220] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11220, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11221, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11216, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11221] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11221, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11222, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11220, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11222] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11222, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11221, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11225, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11223, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11223] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11223, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11222, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11224, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11224] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11224, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11223, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11225] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11225, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11226, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11222, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11226] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11226, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11229, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11227, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11225, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11227] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11227, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11226, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11228, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11228] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11228, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11227, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11229] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11229, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11226, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 11230, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
      }, 
      [11230] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11230, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "The entrance to the Wampa Kingdom is a small hole in the ground.  You can\
not see it from more than 6 feet away, and in heavy weather, one can\
easily fall in. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11231, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 11229, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Wampa Kingdom", 
      }, 
      [11231] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11231, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with boned and\
leavings from the many Wampas. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11232, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11230, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Wampa Kingdom", 
      }, 
      [11232] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11232, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11233, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11237, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11234, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11231, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Wampa Kingdom", 
      }, 
      [11233] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11233, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11232, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Wampa Den", 
      }, 
      [11234] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11234, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11232, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11235, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11236, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Wampa Kingdom", 
      }, 
      [11235] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11235, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11234, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Wampa Den", 
      }, 
      [11236] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11236, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11234, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Leader's Den", 
      }, 
      [11237] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11237, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11232, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Wampa Den", 
      }, 
      [11238] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11238, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "It looks like a cavein blocked the passage way here.  You can go no\
further.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11239, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cave-in", 
      }, 
      [11239] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 11239, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Description = "One of the large hangars that were part of Echo base, the room is filled\
with wrecked speeders and fighters.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11238, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Echo Base Hangar", 
      }, 
      [11240] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 11240, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Name = "BlackStar", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [11241] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 11241, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lightning Bomber 11241", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range.\
", 
      }, 
      [11242] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 11242, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lightning Bomber 11242", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
      }, 
      [11243] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 11243, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lightning Bomber 11243", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
      }, 
      [11244] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 11244, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lightning Bomber 11244", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
      }, 
      [11245] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 11245, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lightning Bomber 11245", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
      }, 
      [11246] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Vnum = 11246, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11206, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [11247] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 11247, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 11214, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 11248, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [11248] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 11248, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ice Worm's Cave", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 11247, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 11249, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [11249] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 11249, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Name = "A Hidden Cavern", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 11248, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 2675770, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 11101, 
         Command = "M", 
         Arg3 = 11206, 
         Arg2 = 2, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 11101, 
         Command = "M", 
         Arg3 = 11220, 
         Arg2 = 2, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 11103, 
         Command = "M", 
         Arg3 = 11233, 
         Arg2 = 5, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 11103, 
         Command = "M", 
         Arg3 = 11235, 
         Arg2 = 5, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 11104, 
         Command = "M", 
         Arg3 = 11236, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg1 = 11103, 
         Command = "M", 
         Arg3 = 11236, 
         Arg2 = 5, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 11103, 
         Command = "M", 
         Arg3 = 11236, 
         Arg2 = 5, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 11103, 
         Command = "M", 
         Arg3 = 11237, 
         Arg2 = 5, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 90, 
         Command = "O", 
         Arg3 = 11209, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 52, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 52, 
         Command = "E", 
         Arg3 = 18, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg1 = 10493, 
         Command = "O", 
         Arg3 = 11210, 
         Arg2 = 1, 
      }, 
   }, 
   ResetMessage = "The wind howls over the snow.", 
   Author = "Darrik", 
   Name = "The ice world Hoth", 
   ResetFrequency = 10, 
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
   Filename = "hoth.lua", 
   Mobiles = 
   {
      [11104] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 8, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 800, 
            HitSizeDice = 10, 
            HitNoDice = 16, 
         }, 
         ShortDescr = "a one-armed wampa", 
         Race = "Human", 
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
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         Sex = "undistinguished", 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         NumberOfAttacks = 0, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         HitRoll = 16, 
         Vnum = 11104, 
         Height = 0, 
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
            [2] = "tail", 
            [0] = "bite", 
            [5] = "kick", 
         }, 
         Credits = 10000, 
         DamRoll = 16, 
         Level = 80, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
         Name = "one-armed wampa", 
         Weight = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A one-armed Wampa Leader looks like trouble\
", 
         ArmorClass = -100, 
      }, 
      [11105] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "a tech shopkeeper", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "a tech shopkeeper", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         DamRoll = 10, 
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
         HitRoll = 10, 
         Vnum = 11105, 
         Height = 0, 
         Sex = "undistinguished", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Code = "say Welcome, would you like something?\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 50, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Name = "A tech shopkeeper", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A tech shopkeeper sells items here.\
", 
         ArmorClass = -25, 
      }, 
      [11106] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "captain jusclik", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
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
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         HitRoll = 10, 
         Vnum = 11106, 
         Height = 0, 
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Credits = 0, 
         DamRoll = 10, 
         Level = 50, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Captain Jusclik", 
         Weight = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "Captain Jusclik stands here giving orders.\
", 
         ArmorClass = -25, 
      }, 
      [11107] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 3, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 300, 
            HitSizeDice = 10, 
            HitNoDice = 6, 
         }, 
         ShortDescr = "a tech customs officer", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_customs_weapons", 
         }, 
         DamRoll = 6, 
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
         HitRoll = 6, 
         Vnum = 11107, 
         Height = 0, 
         Sex = "undistinguished", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpat 11274 drop all\
", 
               Arguments = "5", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 30, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Name = "Tech customs officer", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A tech customs oficer watches for carried weapons.\
", 
         ArmorClass = 25, 
      }, 
      [11108] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "tech chef", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "tech chef", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
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
         HitRoll = 10, 
         Vnum = 11108, 
         Height = 0, 
         Sex = "male", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Credits = 0, 
         DamRoll = 10, 
         Level = 50, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Name = "tech chef", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A tech chef makes food here.\
", 
         ArmorClass = -25, 
      }, 
      [11109] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 90, 
            HitSizeDice = 10, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "Mr Kooos", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DamRoll = 1, 
         HitRoll = 1, 
         Vnum = 11109, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "say Hello, could you please take me to the swimming pool?\
", 
               Arguments = "add hello hi", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "say Are you talking to me?\
say My name is Mr Kooos\
", 
               Arguments = "add yes sure", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "say You will take me to the Pool?\
say Thanks $n, I really appreciate this.\
follow $n\
", 
               Arguments = "add kooos kooos", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               Code = "mpwithdraw 5\
give 5 credits droid\
", 
               Arguments = "turnstile", 
               ScriptType = "MProg", 
            }, 
            [5] = 
            {
               MudProgType = "act_prog", 
               Code = "board turbocar\
", 
               Arguments = "turbocar", 
               ScriptType = "MProg", 
            }, 
            [6] = 
            {
               MudProgType = "act_prog", 
               Code = "leave\
", 
               Arguments = "exits", 
               ScriptType = "MProg", 
            }, 
            [7] = 
            {
               MudProgType = "entry_prog", 
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
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 9, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "Mr Kooos", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Mr Kooos is looking for assitance\
", 
         ArmorClass = 77, 
      }, 
      [11110] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "a freelance tech", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         DamRoll = 10, 
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
         HitRoll = 10, 
         Vnum = 11110, 
         Height = 0, 
         Sex = "undistinguished", 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "say I am looking for hand-crafted vibroblades and blasters.\
", 
               Arguments = "hello job", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "say I will pay good money.\
say 500 for each vibroblade and 1500 for each blaster.\
", 
               Arguments = "money sure okay ok yes", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
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
               Arguments = "gives", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 50, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "Freelance Tech", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Freelance Tech will buy hand-crafted weapons here.\
", 
         ArmorClass = -25, 
      }, 
      [11111] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 250, 
            HitSizeDice = 10, 
            HitNoDice = 5, 
         }, 
         ShortDescr = "Riiice", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DamRoll = 5, 
         HitRoll = 5, 
         Vnum = 11111, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpechoat $n Riiice whispers to you: I need some\
mpechoat $n film developed.  It's good money.\
", 
               Arguments = "hello job", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
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
               Arguments = "sure okay ok yes", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
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
               Arguments = "gives", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 25, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "Riiice", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Riiice waits here for his agents.\
", 
         ArmorClass = 37, 
      }, 
      [11112] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "salesman", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "As fast as new products become available to Bounty Hunters, this salesman\
somehow gets them. Of course they can be a little pricy. But that what you\
pay to get the best i guess. \
", 
         Alignment = 0, 
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "salesman", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
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
         HitRoll = 0, 
         Vnum = 11112, 
         Height = 0, 
         Sex = "undistinguished", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Credits = 0, 
         DamRoll = 0, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Name = "A salesman", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A freelance salesman sells engineering supplies\
", 
         ArmorClass = 0, 
      }, 
      [11101] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 10, 
            HitSizeDice = 10, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a turret", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "Although it looks like a formitable defense, looking closely you see that\
the power cables have been severed. \
", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 11101, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "A disabled blaster-cannon turret", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A blaster-cannon turret is installed here.\
", 
         ArmorClass = 97, 
      }, 
      [11102] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 200, 
            HitSizeDice = 10, 
            HitNoDice = 4, 
         }, 
         ShortDescr = "A wampa", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
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
         HitRoll = 4, 
         Vnum = 11102, 
         Height = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Credits = 0, 
         DamRoll = 4, 
         Level = 20, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Name = "A Wampa", 
         Weight = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A Wampa tears through bags looking for food.\
", 
         ArmorClass = 50, 
      }, 
      [11103] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 4, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 400, 
            HitSizeDice = 10, 
            HitNoDice = 8, 
         }, 
         ShortDescr = "a wampa", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = -1000, 
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
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         HitRoll = 8, 
         Vnum = 11103, 
         Height = 0, 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Credits = 500, 
         DamRoll = 8, 
         Level = 40, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Name = "Wampa", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Wampa looks comfortable nawing on a bone.\
", 
         ArmorClass = 0, 
      }, 
   }, 
}
