-- The ice world Hoth
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   ResetMessage = "The wind howls over the snow.", 
   Objects = 
   {
      [11111] = 
      {
         Layers = 0, 
         Weight = 1, 
         Description = "The Outlaw Tech Idea Board", 
         ShortDescr = "outlaw tech idea board", 
         ActionDescription = "", 
         Vnum = 11111, 
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
         ExtraDescriptions = 
         {
         }, 
         Name = "Outlaw tech idea board", 
         Cost = 0, 
      }, 
      [11110] = 
      {
         Layers = 0, 
         Weight = 1, 
         Description = "The Outlaw Tech Board", 
         ShortDescr = "outlaw tech baord", 
         ActionDescription = "", 
         Vnum = 11110, 
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
         ExtraDescriptions = 
         {
         }, 
         Name = "outlaw.board", 
         Cost = 0, 
      }, 
      [11109] = 
      {
         Layers = 0, 
         Weight = 1, 
         Description = "A sign is tacked to the wall here", 
         ShortDescr = "a sign", 
         ActionDescription = "", 
         Vnum = 11109, 
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
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
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
         Cost = 0, 
      }, 
      [11101] = 
      {
         Layers = 0, 
         Weight = 1, 
         Description = "A package addressed to the Hunter's Guild's Receptionist", 
         ShortDescr = "a package addressed receptionist", 
         ActionDescription = "", 
         Vnum = 11101, 
         ExtraDescriptions = 
         {
         }, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "receptionist package", 
         Cost = 0, 
      }, 
      [11102] = 
      {
         Layers = 0, 
         Weight = 100, 
         Description = "Some cargo has been left here.", 
         ShortDescr = "cargo", 
         ActionDescription = "", 
         Vnum = 11102, 
         ExtraDescriptions = 
         {
         }, 
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "cargo", 
         Cost = 0, 
      }, 
      [11103] = 
      {
         Layers = 0, 
         Weight = 1, 
         Description = "Some duraplast during has been left lying around here.", 
         ShortDescr = "duraplast tubing", 
         ActionDescription = "", 
         Vnum = 11103, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "duraplast", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "duraplast tubing", 
         Cost = 0, 
      }, 
   }, 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   ResetFrequency = 10, 
   Name = "The ice world Hoth", 
   Rooms = 
   {
      [11206] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11206, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11207, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11246, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11207] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "You are outside the formerly hidden shield doors that once sealed off the\
abandoned Echo Base.   The opening to the ice cave that was the Base, is\
flanked by rocks, even though most of the base was chewed into\
centuries-old packed snow and ice.\
", 
         Vnum = 11207, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Outside the 'hidden' shield doors", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11208, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11211, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11206, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11208] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The hangar of Echo Base is now filled with scrap equipment, discarded\
uniforms, and other miscellaneous junk. \
", 
         Vnum = 11208, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11209, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11207, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Name = "Inside Echo Base", 
         Tunnel = 0, 
      }, 
      [11209] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This hallway, carved from ice has started to collapse and at its end is\
closed off by a previous cave-in.\
 \
There is a bed shoved in a corner.  Perhaps you can rest here.\
 \
 \
It is safe to quit here.\
", 
         Vnum = 11209, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11208, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11210, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Name = "Hallway", 
         Tunnel = 0, 
      }, 
      [11210] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This storeroom seems to have been ransacked.  All the bags and boxes have\
been destroyed, the remains of wrappers strewn everywhere. \
", 
         Vnum = 11210, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Storeroom", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11209, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11211] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11211, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11212, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11207, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11212] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11212, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11215, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11213, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11211, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11213] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11213, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11212, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11214, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11214] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around. \
", 
         Vnum = 11214, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11213, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11247, 
               Key = -1, 
               Description = "", 
               Direction = "down", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11215] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11215, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11216, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11212, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11216] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11216, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11217, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11220, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11215, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11217] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11217, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11218, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11216, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11218] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11218, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11219, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11217, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11219] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11219, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11218, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11220] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11220, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11221, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11216, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11221] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11221, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11222, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11220, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11222] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11222, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11221, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11225, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11223, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11223] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11223, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11222, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11224, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11224] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11224, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11223, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11225] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11225, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11226, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11222, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11226] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11226, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11229, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11227, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11225, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11227] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11227, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11226, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11228, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11228] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11228, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11227, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11229] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Vnum = 11229, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11226, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11230, 
               Key = -1, 
               Description = "", 
               Direction = "down", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11230] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The entrance to the Wampa Kingdom is a small hole in the ground.  You can\
not see it from more than 6 feet away, and in heavy weather, one can\
easily fall in. \
", 
         Vnum = 11230, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Kingdom", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11231, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11229, 
               Key = -1, 
               Description = "", 
               Direction = "up", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11231] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with boned and\
leavings from the many Wampas. \
", 
         Vnum = 11231, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Kingdom", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11232, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11230, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11232] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Vnum = 11232, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Kingdom", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11233, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11237, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11234, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11231, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11233] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Vnum = 11233, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Den", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11232, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11234] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Vnum = 11234, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Kingdom", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11232, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11235, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11236, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11235] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Vnum = 11235, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Den", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11234, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11236] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Vnum = 11236, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Leader's Den", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11234, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11237] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Vnum = 11237, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Den", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11232, 
               Key = -1, 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11238] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "It looks like a cavein blocked the passage way here.  You can go no\
further.\
", 
         Vnum = 11238, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cave-in", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11239, 
               Key = -1, 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11239] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "One of the large hangars that were part of Echo base, the room is filled\
with wrecked speeders and fighters.\
", 
         Vnum = 11239, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Echo Base Hangar", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11238, 
               Key = -1, 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         Tunnel = 0, 
      }, 
      [11240] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
         Vnum = 11240, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Name = "BlackStar", 
         Tunnel = 0, 
      }, 
      [11241] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range.\
", 
         Vnum = 11241, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Name = "Lightning Bomber 11241", 
         Tunnel = 0, 
      }, 
      [11242] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Vnum = 11242, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Name = "Lightning Bomber 11242", 
         Tunnel = 0, 
      }, 
      [11243] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Vnum = 11243, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Name = "Lightning Bomber 11243", 
         Tunnel = 0, 
      }, 
      [11244] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Vnum = 11244, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Name = "Lightning Bomber 11244", 
         Tunnel = 0, 
      }, 
      [11245] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Vnum = 11245, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         Name = "Lightning Bomber 11245", 
         Tunnel = 0, 
      }, 
      [11246] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
         Vnum = 11246, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11206, 
               Key = -1, 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
      }, 
      [11247] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
         Vnum = 11247, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11214, 
               Key = -1, 
               Description = "", 
               Direction = "up", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11248, 
               Key = -1, 
               Description = "", 
               Direction = "down", 
            }, 
         }, 
         Name = "Floating in a void", 
         Tunnel = 0, 
      }, 
      [11248] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
         Vnum = 11248, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11247, 
               Key = -1, 
               Description = "", 
               Direction = "up", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11249, 
               Key = -1, 
               Description = "", 
               Direction = "down", 
            }, 
         }, 
         Name = "Ice Worm's Cave", 
         Tunnel = 0, 
      }, 
      [11249] = 
      {
         TeleDelay = 0, 
         TeleVnum = 0, 
         Description = "", 
         Vnum = 11249, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               DestinationVnum = 11248, 
               Key = -1, 
               Description = "", 
               Direction = "up", 
            }, 
         }, 
         Name = "A Hidden Cavern", 
         Tunnel = 0, 
      }, 
   }, 
   Mobiles = 
   {
      [11104] = 
      {
         Name = "one-armed wampa", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 16, 
         Description = "", 
         ShortDescr = "a one-armed wampa", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 800, 
            HitNoDice = 16, 
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
         Damage = 
         {
            DamNoDice = 8, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         LongDescr = "A one-armed Wampa Leader looks like trouble\
", 
         Credits = 10000, 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         Vnum = 11104, 
         HitRoll = 16, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Alignment = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
            [2] = "tail", 
            [0] = "bite", 
            [5] = "kick", 
         }, 
         Level = 80, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Position = "standing", 
         ArmorClass = -100, 
      }, 
      [11105] = 
      {
         Name = "A tech shopkeeper", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 10, 
         Description = "", 
         ShortDescr = "a tech shopkeeper", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "a tech shopkeeper", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            KeeperVnum = 11105, 
            ProfitBuy = 120, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "greet_prog", 
               Code = "say Welcome, would you like something?\
", 
            }, 
         }, 
         LongDescr = "A tech shopkeeper sells items here.\
", 
         Credits = 0, 
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
         HitRoll = 10, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Alignment = 0, 
         Vnum = 11105, 
         Level = 50, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         ArmorClass = -25, 
      }, 
      [11106] = 
      {
         Name = "Captain Jusclik", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 10, 
         Description = "", 
         ShortDescr = "captain jusclik", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         LongDescr = "Captain Jusclik stands here giving orders.\
", 
         Credits = 0, 
         Sex = "undistinguished", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         HitRoll = 10, 
         Vnum = 11106, 
         Alignment = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Level = 50, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Position = "standing", 
         ArmorClass = -25, 
      }, 
      [11107] = 
      {
         Name = "Tech customs officer", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 6, 
         Description = "", 
         ShortDescr = "a tech customs officer", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 300, 
            HitNoDice = 6, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "5", 
               MudProgType = "rand_prog", 
               Code = "mpat 11274 drop all\
", 
            }, 
         }, 
         LongDescr = "A tech customs oficer watches for carried weapons.\
", 
         Credits = 0, 
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
         HitRoll = 6, 
         Vnum = 11107, 
         Alignment = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Level = 30, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         ArmorClass = 25, 
      }, 
      [11108] = 
      {
         Name = "tech chef", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 10, 
         Description = "", 
         ShortDescr = "tech chef", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "tech chef", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            KeeperVnum = 11108, 
            ProfitBuy = 120, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A tech chef makes food here.\
", 
         Credits = 0, 
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
         Sex = "male", 
         HitRoll = 10, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Alignment = 0, 
         Vnum = 11108, 
         Level = 50, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         ArmorClass = -25, 
      }, 
      [11109] = 
      {
         Name = "Mr Kooos", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 1, 
         Description = "", 
         ShortDescr = "Mr Kooos", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 90, 
            HitNoDice = 1, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "Mr Kooos is looking for assitance\
", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "add hello hi", 
               MudProgType = "speech_prog", 
               Code = "say Hello, could you please take me to the swimming pool?\
", 
            }, 
            [2] = 
            {
               Arguments = "add yes sure", 
               MudProgType = "speech_prog", 
               Code = "say Are you talking to me?\
say My name is Mr Kooos\
", 
            }, 
            [3] = 
            {
               Arguments = "add kooos kooos", 
               MudProgType = "speech_prog", 
               Code = "say You will take me to the Pool?\
say Thanks $n, I really appreciate this.\
follow $n\
", 
            }, 
            [4] = 
            {
               Arguments = "turnstile", 
               MudProgType = "act_prog", 
               Code = "mpwithdraw 5\
give 5 credits droid\
", 
            }, 
            [5] = 
            {
               Arguments = "turbocar", 
               MudProgType = "act_prog", 
               Code = "board turbocar\
", 
            }, 
            [6] = 
            {
               Arguments = "exits", 
               MudProgType = "act_prog", 
               Code = "leave\
", 
            }, 
            [7] = 
            {
               Arguments = "100", 
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
         HitRoll = 1, 
         Sex = "undistinguished", 
         Alignment = 0, 
         Vnum = 11109, 
         Level = 9, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         ArmorClass = 77, 
      }, 
      [11110] = 
      {
         Name = "Freelance Tech", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 10, 
         Description = "", 
         ShortDescr = "a freelance tech", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hello job", 
               MudProgType = "speech_prog", 
               Code = "say I am looking for hand-crafted vibroblades and blasters.\
", 
            }, 
            [2] = 
            {
               Arguments = "money sure okay ok yes", 
               MudProgType = "speech_prog", 
               Code = "say I will pay good money.\
say 500 for each vibroblade and 1500 for each blaster.\
", 
            }, 
            [3] = 
            {
               Arguments = "gives", 
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
            }, 
         }, 
         LongDescr = "A Freelance Tech will buy hand-crafted weapons here.\
", 
         Credits = 0, 
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
         HitRoll = 10, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Alignment = 0, 
         Vnum = 11110, 
         Level = 50, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         ArmorClass = -25, 
      }, 
      [11111] = 
      {
         Name = "Riiice", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 5, 
         Description = "", 
         ShortDescr = "Riiice", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 250, 
            HitNoDice = 5, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "Riiice waits here for his agents.\
", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hello job", 
               MudProgType = "speech_prog", 
               Code = "mpechoat $n Riiice whispers to you: I need some\
mpechoat $n film developed.  It's good money.\
", 
            }, 
            [2] = 
            {
               Arguments = "sure okay ok yes", 
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
            }, 
            [3] = 
            {
               Arguments = "gives", 
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
         HitRoll = 5, 
         Sex = "undistinguished", 
         Alignment = 0, 
         Vnum = 11111, 
         Level = 25, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         ArmorClass = 37, 
      }, 
      [11112] = 
      {
         Name = "A salesman", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 0, 
         Description = "As fast as new products become available to Bounty Hunters, this salesman\
somehow gets them. Of course they can be a little pricy. But that what you\
pay to get the best i guess. \
", 
         ShortDescr = "salesman", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "salesman", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            KeeperVnum = 11112, 
            ProfitBuy = 120, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A freelance salesman sells engineering supplies\
", 
         Credits = 0, 
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
         HitRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Alignment = 0, 
         Vnum = 11112, 
         Level = 1, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         ArmorClass = 0, 
      }, 
      [11101] = 
      {
         Name = "A disabled blaster-cannon turret", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 0, 
         Description = "Although it looks like a formitable defense, looking closely you see that\
the power cables have been severed. \
", 
         ShortDescr = "a turret", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 10, 
            HitNoDice = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A blaster-cannon turret is installed here.\
", 
         Credits = 0, 
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
         Sex = "undistinguished", 
         Alignment = 0, 
         Vnum = 11101, 
         Level = 1, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         ArmorClass = 97, 
      }, 
      [11102] = 
      {
         Name = "A Wampa", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 4, 
         Description = "", 
         ShortDescr = "A wampa", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 200, 
            HitNoDice = 4, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A Wampa tears through bags looking for food.\
", 
         Credits = 0, 
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
         HitRoll = 4, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         Vnum = 11102, 
         Level = 20, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Position = "standing", 
         ArmorClass = 50, 
      }, 
      [11103] = 
      {
         Name = "Wampa", 
         Weight = 0, 
         Race = "Human", 
         DamRoll = 8, 
         Description = "", 
         ShortDescr = "a wampa", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 400, 
            HitNoDice = 8, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         LongDescr = "A Wampa looks comfortable nawing on a bone.\
", 
         Credits = 500, 
         Sex = "undistinguished", 
         Vnum = 11103, 
         HitRoll = 8, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Alignment = -1000, 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         Level = 40, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Strength = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
         }, 
         Position = "standing", 
         ArmorClass = 0, 
      }, 
   }, 
   Filename = "hoth.lua", 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 11206, 
         Arg1 = 11101, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 11220, 
         Arg1 = 11101, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 5, 
         Arg3 = 11233, 
         Arg1 = 11103, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 5, 
         Arg3 = 11235, 
         Arg1 = 11103, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 11236, 
         Arg1 = 11104, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 5, 
         Arg3 = 11236, 
         Arg1 = 11103, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 5, 
         Arg3 = 11236, 
         Arg1 = 11103, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg2 = 5, 
         Arg3 = 11237, 
         Arg1 = 11103, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 11209, 
         Arg1 = 90, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 52, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 18, 
         Arg1 = 52, 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 11210, 
         Arg1 = 10493, 
      }, 
   }, 
   LowEconomy = 2775770, 
   Author = "Darrik", 
}
