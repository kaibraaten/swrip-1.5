-- Adari - Baituh City
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 29060, 
         Last = 29070, 
      }, 
      Object = 
      {
         First = 29060, 
         Last = 29065, 
      }, 
      Room = 
      {
         First = 29060, 
         Last = 29158, 
      }, 
   }, 
   Objects = 
   {
      [29060] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "-  Welcome to Baituh City  -\
\13Please follow our laws:\
\0131. No Weapons Permitted\
\0132. No Drugs Permitted\
\0133. No \"Adult Entertainment\"\
\13", 
               Keyword = "sign welcome", 
            }, 
         }, 
         Vnum = 29060, 
         Cost = 1, 
         ShortDescr = "a sign", 
         Layers = 0, 
         Weight = 5000, 
         Name = "sign welcome", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "A Large sign has been posted here.", 
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
      [29061] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "To be released from jail you must apologize for your crimes.  Hint,\
\13say 'sorry' to be released. \
\13", 
               Keyword = "bail box", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "bail box", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 29061, 
         Cost = 0, 
         ShortDescr = "a Bail Box", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               Arguments = "sorry", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               Arguments = "30", 
               ScriptType = "MProg", 
            }, 
         }, 
         Layers = 0, 
         Weight = 5000, 
         Description = "A Bail Box has been built into the wall.", 
         ActionDescription = "", 
         ItemType = "container", 
         Name = "bail box", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
      }, 
      [29065] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Be careful! You might go blind looking at such filth!\
\13", 
               Keyword = "playhutt trashy magazine", 
            }, 
         }, 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         Vnum = 29065, 
         Cost = 50, 
         ShortDescr = "a copy of PlayHutt magazine", 
         Weight = 2, 
         Layers = 0, 
         Name = "playhutt trashy magazine", 
         Description = "A copy of PlayHutt magazine has been left here.", 
         ActionDescription = "", 
         ItemType = "smut", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
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
      [29060] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 29060, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [29061] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         Vnum = 29061, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29112, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29062, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is the northern most entrance and exit of Baituh City.  Jagged\
rocks prevent your travel in most directions.  The air is thick and\
full of dirt and soil.  You can continue to either the north or the\
south from here.\
", 
      }, 
      [29062] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29062, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29061, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29064, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29063, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
      }, 
      [29063] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29063, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29062, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29066, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
      }, 
      [29064] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29064, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29067, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29062, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
      }, 
      [29065] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29065, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Landing Strip", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29066, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This barren little area is used for private space vessels to come\
and go.  This is not a nice or well kept facility, but it does serve\
a very useful purpose for the cities inhabitants.  This is not a bus\
stop. Commercial transportation does not and cannot dock here.  You\
can continue east from here.\
", 
      }, 
      [29066] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29066, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29063, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29069, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29065, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
      }, 
      [29067] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29067, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29064, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29068, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29071, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
      }, 
      [29068] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 29068, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Cafeteria", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29067, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are just inside a cave.  The room is very well lit and well\
kept. Whoever runs the shop is very clean and meticulous.  The floor\
is made up of smoothed marble like rock and has very little dirt on\
it. You can exit to the west.\
", 
      }, 
      [29069] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29069, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29066, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29070, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
      }, 
      [29070] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29070, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29071, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29072, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29069, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
      }, 
      [29071] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29071, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29067, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29070, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
      }, 
      [29072] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29072, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29070, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29073, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
", 
      }, 
      [29073] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29073, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29072, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29086, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29098, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29074, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is the main intersection for Baituh City.  There are city\
blocks in all directions from here.  Each direction leads to\
something completely different than the other three.  Feel free to\
look around.\
", 
      }, 
      [29074] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29074, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29073, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29075, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
", 
      }, 
      [29075] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29075, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29076, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29074, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29082, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
      }, 
      [29076] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29076, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29075, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29077, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
      }, 
      [29077] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Vnum = 29077, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29083, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29076, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29078, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
      }, 
      [29078] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29078, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29077, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29079, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
      }, 
      [29079] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29079, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29078, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29080, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29084, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
      }, 
      [29080] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29080, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29079, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29081, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
      }, 
      [29081] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29081, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29082, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29085, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29080, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh City\
is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here. To the south is a 'bar'.\
", 
      }, 
      [29082] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29082, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29075, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29081, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
      }, 
      [29083] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 29083, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Academia", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29077, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "At one time Baituh City produced the best and brightest Adarians in\
their state of the art academy.  Since the planet and town have hit\
hard times, things have changed.  Now students must travel to Alfuh\
to work on their fighting skills. Most of the faculty from the old\
school have also left.  This lone room now acts as a tutoring\
facility for the one remaining faculty member.\
", 
      }, 
      [29084] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [10] = "Safe", 
            [7] = "NoMagic", 
         }, 
         Vnum = 29084, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Inn", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29079, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29110, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Welcome to the Baituh City Inn.  Those who need to rest and such\
can do so here.  But, you have to purchase a room of course.  This is\
not the largest hotel on the planet by any means.  But if you need to\
rest, this place is as good as any other.  You can exit to the east.\
", 
      }, 
      [29085] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Vnum = 29085, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Bar", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29081, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This dank fouls smelling hole in the ground is one of the few\
businesses able to survive these times of hardship.  It is a bar. \
Beings come here to forget about how miserable their lives are.  Feel\
free to join them.  But watch your step.  You can exit to the north.\
", 
      }, 
      [29086] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29086, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29087, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29073, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
", 
      }, 
      [29087] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29087, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29088, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29094, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29086, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
      }, 
      [29088] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29088, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29089, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29087, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
      }, 
      [29089] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29089, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29095, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29090, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29088, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
      }, 
      [29090] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29090, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29091, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29089, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
      }, 
      [29091] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29091, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29090, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29096, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29092, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
      }, 
      [29092] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29092, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29091, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29093, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
      }, 
      [29093] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29093, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29092, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29097, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29094, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
      }, 
      [29094] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29094, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29087, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29093, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
      }, 
      [29095] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Vnum = 29095, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Governmental Offices", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29089, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is not quite as elegant as one would expect of a government.\
 It would seem the government has been struggling a lot too during\
this time of hardship for the planet.  The room is well lit.  The\
walls are covered in dirt and filth, the floor is even worse.  You\
can escape to the south.\
", 
      }, 
      [29096] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29096, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Post Office", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29091, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Baituh City is still capable of communicating with other cities and\
planets. This was once a thriving postal service serving Baituh City\
and its the suburbs. Today, no one oversees the post office.  It is\
all done electronically.  You can exit to the west.\
", 
      }, 
      [29097] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
         }, 
         Vnum = 29097, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lava Resevoir", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29093, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "If you go south, you will surely die!\
", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29111, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It is extremely warm here.  There is a large pool of lava\
directly south of here.  To continue south would almost certainly be\
instant death.  It would be best to get as far away from here as\
possible.  This is not a safe area.  Go north if you cherish life.\
", 
      }, 
      [29098] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29098, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29073, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29099, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
", 
      }, 
      [29099] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29099, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29098, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29101, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29100, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
      }, 
      [29100] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29100, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29099, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29102, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
      }, 
      [29101] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29101, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29103, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29099, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
      }, 
      [29102] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29102, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29100, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29104, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29107, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
      }, 
      [29103] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29103, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29101, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29108, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29106, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
      }, 
      [29104] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29104, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29102, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29105, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
      }, 
      [29105] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29105, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29106, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29109, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29104, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
      }, 
      [29106] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29106, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29103, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29105, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
      }, 
      [29107] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 29107, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is the Baituh City Police Station.  A large marble desk sits in\
the corner of the room.  The floor is covered in dirt and volcanic\
ash. Several communication terminals have been built into the walls\
around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29102, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Baituh City Police Station", 
      }, 
      [29108] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a bail box.  To bereleased from jail, you must give 30 credits\
\13worth of bail to the box.  You will promptly be freed if you pay the\
\01330credit fine. \
\13", 
               Keyword = "bail box", 
            }, 
         }, 
         Flags = 
         {
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         Vnum = 29108, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Jail", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29103, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a dank foul smelling armpit of a cell.  To be locked in this\
room means you must have broken the law.  Thick rocks make up the\
walls and ceiling. \
", 
      }, 
      [29109] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Vnum = 29109, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Road", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29105, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This road is very wide and seems to be in fairly decent condition. \
However, a large rock-like boulder blocks you from continuing any\
further south. \
", 
      }, 
      [29110] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [13] = "Arena", 
         }, 
         Vnum = 29110, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Baituh City Hotel", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29084, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is where you can safely sleep and exit the game.  When you\
reenter the game, this is the room you will start in.  Be sure to\
thank the hotel staff for putting up with you.  Enjoy your stay.  You\
can exit to the east. \
", 
      }, 
      [29111] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
            [16] = "Silence", 
            [13] = "Arena", 
         }, 
         Vnum = 29111, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lava Lake", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29097, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It is unbelievably hot here.  You are in a lake of lava.  To be\
here is  almost certainly suicide.  If you can still escape to the\
north, do so! \
", 
      }, 
      [29112] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29112, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29158, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29061, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29113, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.  To the south is Baituh\
City.\
", 
      }, 
      [29113] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29113, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29112, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29114, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29114] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29114, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29115, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29113, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29115] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29115, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29116, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29114, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29116] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29116, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29117, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29115, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29117] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29117, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29118, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29116, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29118] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29118, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29119, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29117, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29119] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29119, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29120, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29118, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29120] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29120, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29121, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29119, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29121] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29121, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29122, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29120, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29122] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29122, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29123, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29121, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29123] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29123, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29124, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29125, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29122, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29124] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29124, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Outskirts of Alfuh City", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29049, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29123, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29125] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29125, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29126, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29123, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here. \
", 
      }, 
      [29126] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29126, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29127, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29125, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29127] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29127, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29130, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29128, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29126, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29128] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29128, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29127, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29129, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29129] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29129, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29128, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29130, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29130] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29130, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29129, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29131, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29131] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29131, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29130, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29132, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29138, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29132] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29132, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29131, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29133, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29128, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29133] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29133, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29134, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29132, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29134] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29134, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29140, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29135, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29128, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29133, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29135] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29135, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29136, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29134, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29136] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29136, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29143, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29131, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29137, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29135, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29137] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29137, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29136, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29132, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29138, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29138] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29138, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29137, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29139, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29139] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29139, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29138, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29140, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29140] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29140, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29139, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29136, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29141, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29141] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29141, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29140, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29142, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29142] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29142, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29141, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29143, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29136, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29143] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29143, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29142, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29139, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29144, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29144] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29144, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29143, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29145, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29145] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29145, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29146, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29144, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29146] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29146, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29147, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29145, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29147] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29147, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29148, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29146, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29148] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29148, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29151, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29149, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29147, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29149] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29149, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29139, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29150, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29148, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29150] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29150, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29149, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29151, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29151] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29151, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29152, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29150, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29152] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29152, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29151, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29147, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29153, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29153] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29153, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29152, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29154, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29154] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29154, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29155, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29153, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29155] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29155, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29154, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29156, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29156] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29156, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29155, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 29157, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
      [29157] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29157, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 29156, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29147, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29158, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
      }, 
      [29158] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Vnum = 29158, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Enclosed Dirt Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 29157, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 29112, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 4999036, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 29061, 
         Command = "M", 
         Arg3 = 29068, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 29002, 
         Command = "G", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10317, 
         Command = "G", 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg1 = 29062, 
         Command = "M", 
         Arg3 = 29083, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 29063, 
         Command = "M", 
         Arg3 = 29084, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         MiscData = 0, 
         Arg1 = 29084, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 3, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 29065, 
         Command = "M", 
         Arg3 = 29081, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         MiscData = 0, 
         Arg1 = 29081, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 2, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 29066, 
         Command = "M", 
         Arg3 = 29108, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         MiscData = 0, 
         Arg1 = 29108, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 3, 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Arg1 = 38, 
         Command = "O", 
         Arg3 = 29096, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Arg1 = 29067, 
         Command = "M", 
         Arg3 = 29066, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Arg1 = 29068, 
         Command = "M", 
         Arg3 = 29069, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         MiscData = 1, 
         Arg1 = 29068, 
         Command = "M", 
         Arg3 = 29078, 
         Arg2 = 2, 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg1 = 29068, 
         Command = "M", 
         Arg3 = 29090, 
         Arg2 = 3, 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [31] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [32] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [34] = 
      {
         MiscData = 1, 
         Arg1 = 29068, 
         Command = "M", 
         Arg3 = 29100, 
         Arg2 = 4, 
      }, 
      [35] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [37] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [39] = 
      {
         MiscData = 1, 
         Arg1 = 29068, 
         Command = "M", 
         Arg3 = 29106, 
         Arg2 = 5, 
      }, 
      [40] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [41] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [42] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [44] = 
      {
         MiscData = 1, 
         Arg1 = 29068, 
         Command = "M", 
         Arg3 = 29107, 
         Arg2 = 6, 
      }, 
      [45] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [48] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [49] = 
      {
         MiscData = 1, 
         Arg1 = 29060, 
         Command = "M", 
         Arg3 = 29065, 
         Arg2 = 1, 
      }, 
      [50] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [51] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [52] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [53] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [54] = 
      {
         MiscData = 1, 
         Arg1 = 29060, 
         Command = "O", 
         Arg3 = 29065, 
         Arg2 = 1, 
      }, 
      [55] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29062, 
         Arg2 = 1, 
      }, 
      [56] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [57] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29071, 
         Arg2 = 2, 
      }, 
      [58] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [59] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29080, 
         Arg2 = 3, 
      }, 
      [60] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [61] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29073, 
         Arg2 = 4, 
      }, 
      [62] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [63] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29092, 
         Arg2 = 5, 
      }, 
      [64] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [65] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29104, 
         Arg2 = 6, 
      }, 
      [66] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [67] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29127, 
         Arg2 = 1, 
      }, 
      [68] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29129, 
         Arg2 = 2, 
      }, 
      [69] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29131, 
         Arg2 = 3, 
      }, 
      [70] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29133, 
         Arg2 = 4, 
      }, 
      [71] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29135, 
         Arg2 = 5, 
      }, 
      [72] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29137, 
         Arg2 = 6, 
      }, 
      [73] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29139, 
         Arg2 = 7, 
      }, 
      [74] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29141, 
         Arg2 = 8, 
      }, 
      [75] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29143, 
         Arg2 = 9, 
      }, 
      [76] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29145, 
         Arg2 = 10, 
      }, 
      [77] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29147, 
         Arg2 = 11, 
      }, 
      [78] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29149, 
         Arg2 = 12, 
      }, 
      [79] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29151, 
         Arg2 = 13, 
      }, 
      [80] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29153, 
         Arg2 = 14, 
      }, 
      [81] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29155, 
         Arg2 = 15, 
      }, 
      [82] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29157, 
         Arg2 = 16, 
      }, 
      [83] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29115, 
         Arg2 = 17, 
      }, 
      [84] = 
      {
         MiscData = 1, 
         Arg1 = 29070, 
         Command = "M", 
         Arg3 = 29119, 
         Arg2 = 18, 
      }, 
      [85] = 
      {
         MiscData = 0, 
         Arg1 = 29027, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 3, 
      }, 
      [86] = 
      {
         MiscData = 1, 
         Arg1 = 29068, 
         Command = "M", 
         Arg3 = 29027, 
         Arg2 = 7, 
      }, 
      [87] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [88] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [89] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [90] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [91] = 
      {
         MiscData = 0, 
         Arg1 = 29027, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 3, 
      }, 
      [92] = 
      {
         MiscData = 1, 
         Arg1 = 29068, 
         Command = "M", 
         Arg3 = 29015, 
         Arg2 = 8, 
      }, 
      [93] = 
      {
         MiscData = 1, 
         Arg1 = 29008, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [94] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [95] = 
      {
         MiscData = 1, 
         Arg1 = 29006, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [96] = 
      {
         MiscData = 1, 
         Arg1 = 29009, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [97] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29015, 
         Arg2 = 7, 
      }, 
      [98] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [99] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "M", 
         Arg3 = 29021, 
         Arg2 = 9, 
      }, 
      [100] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29021, 
         Arg2 = 8, 
      }, 
      [101] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [102] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29033, 
         Arg2 = 9, 
      }, 
      [103] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [104] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29037, 
         Arg2 = 10, 
      }, 
      [105] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [106] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29042, 
         Arg2 = 11, 
      }, 
      [107] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [108] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29041, 
         Arg2 = 12, 
      }, 
      [109] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [110] = 
      {
         MiscData = 1, 
         Arg1 = 29069, 
         Command = "M", 
         Arg3 = 29050, 
         Arg2 = 13, 
      }, 
      [111] = 
      {
         MiscData = 1, 
         Arg1 = 29004, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [112] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "M", 
         Arg3 = 29064, 
         Arg2 = 10, 
      }, 
      [113] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "M", 
         Arg3 = 29088, 
         Arg2 = 11, 
      }, 
      [114] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "M", 
         Arg3 = 29082, 
         Arg2 = 12, 
      }, 
      [115] = 
      {
         MiscData = 1, 
         Arg1 = 29007, 
         Command = "M", 
         Arg3 = 29101, 
         Arg2 = 13, 
      }, 
      [116] = 
      {
         MiscData = 1, 
         Arg1 = 29064, 
         Command = "M", 
         Arg3 = 29085, 
         Arg2 = 1, 
      }, 
      [117] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 21009, 
         Command = "G", 
      }, 
      [118] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 21008, 
         Command = "G", 
      }, 
      [119] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 21010, 
         Command = "G", 
      }, 
      [120] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32230, 
         Command = "G", 
      }, 
      [121] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10487, 
         Command = "G", 
      }, 
      [122] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 29065, 
         Command = "G", 
      }, 
      [123] = 
      {
         MiscData = 1, 
         Arg1 = 7316, 
         Command = "M", 
         Arg3 = 29085, 
         Arg2 = 1, 
      }, 
      [124] = 
      {
         MiscData = 1, 
         Arg1 = 28200, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [125] = 
      {
         MiscData = 1, 
         Arg1 = 32217, 
         Command = "E", 
         Arg3 = 6, 
         Arg2 = 1, 
      }, 
      [126] = 
      {
         MiscData = 1, 
         Arg1 = 32215, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [127] = 
      {
         MiscData = 1, 
         Arg1 = 32216, 
         Command = "E", 
         Arg3 = 7, 
         Arg2 = 1, 
      }, 
      [128] = 
      {
         MiscData = 1, 
         Arg1 = 32204, 
         Command = "E", 
         Arg3 = 13, 
         Arg2 = 1, 
      }, 
      [129] = 
      {
         MiscData = 1, 
         Arg1 = 32205, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [130] = 
      {
         MiscData = 0, 
         Arg1 = 29085, 
         Command = "D", 
         Arg3 = 0, 
         Arg2 = 0, 
      }, 
   }, 
   ResetMessage = "", 
   Author = "Merth", 
   Name = "Adari - Baituh City", 
   ResetFrequency = 0, 
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
   Filename = "adari01.lua", 
   Mobiles = 
   {
      [29060] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 20, 
            DamNoDice = 4, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 40, 
            HitNoDice = 4, 
         }, 
         ShortDescr = "Smotsuk", 
         Race = "Adarian", 
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
         Description = "He is a big burly Adarian.  His only intention is to keep weapons\
from being imported or exported from Adari.\
", 
         Alignment = 350, 
         SpecFuns = 
         {
            [1] = "spec_customs_spice", 
            [0] = "spec_police_jail", 
         }, 
         DamRoll = 8, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         HitRoll = 8, 
         Vnum = 29060, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Code = "mpecho A deputy leaves in a rush.\
mpgoto 29030\
drop all\
mpgoto 29065\
mpecho A deputy has arrived.\
", 
               Arguments = "12", 
               ScriptType = "MProg", 
            }, 
         }, 
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
            [6] = "StayArea", 
         }, 
         Name = "officer customs smotsuk", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Smotsuk, a customs officer is here.\
", 
         ArmorClass = 0, 
      }, 
      [29061] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 20, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "Baszturd", 
         Race = "Adarian", 
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
         Description = "He is an elderly Adarian shop keeper. \
", 
         Alignment = -400, 
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
            KeeperShortDescr = "Baszturd", 
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
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         HitRoll = 4, 
         Vnum = 29061, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
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
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "shop keeper shopkeeper baszturd", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A shop keeper works here.\
", 
         ArmorClass = 0, 
      }, 
      [29062] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 20, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "Professor Sumaretie", 
         Race = "Adarian", 
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
         Description = "This old Adarian may not know a great deal about fighting, but he\
knows many languages and other academic fields.  He might be able to\
help you learn another language. \
", 
         Alignment = 450, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [9] = "antarian", 
               [19] = "adarese", 
               [20] = "verpine", 
               [6] = "shistavanen", 
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [0] = "basic", 
               [9] = "antarian", 
               [19] = "adarese", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
            }, 
         }, 
         HitRoll = 4, 
         Vnum = 29062, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
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
            [25] = "NoKill", 
            [6] = "StayArea", 
            [20] = "Scholar", 
         }, 
         Name = "scholar old saavy professor sumaretie", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A saavy, old scholar studies here.\
", 
         ArmorClass = 60, 
      }, 
      [29063] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 15, 
            DamNoDice = 3, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 30, 
            HitNoDice = 3, 
         }, 
         ShortDescr = "An Innkeeper Droid", 
         Race = "Adarian", 
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
         Description = "A red astromech R2 unit idles here waiting to help you.  If you would\
like  to rent a room for the evening, give 50 credits to this R2\
unit. \
", 
         Alignment = -400, 
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
               [19] = "adarese", 
            }, 
         }, 
         HitRoll = 6, 
         Vnum = 29063, 
         Height = 0, 
         Sex = "undistinguished", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "mpecho A little red R2 Unit whistles happily towards you.\
", 
               Arguments = "75", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Code = "mpgoto 29110\
mptransfer $n\
mpechoat $n The R2 Unit escorts you to a room.\
east\
", 
               Arguments = "18", 
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
            [26] = "Droid", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "droid innkeeper keeper r2 unit", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "An Innkeeper Droid idles here.\
", 
         ArmorClass = 0, 
      }, 
      [29064] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 25, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 50, 
            HitNoDice = 5, 
         }, 
         ShortDescr = "Puttzu", 
         Race = "Hutt", 
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
         Alignment = -500, 
         NumberOfAttacks = 0, 
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
            KeeperShortDescr = "Puttzu", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         HitRoll = 10, 
         Vnum = 29064, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [4] = "huttese", 
               [0] = "basic", 
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Sex = "male", 
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
            [25] = "NoKill", 
         }, 
         Name = "bartender hutt puttzu", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Hutt Bartender works here.\
", 
         ArmorClass = 0, 
      }, 
      [29065] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 37, 
            DamNoDice = 6, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 65, 
            HitNoDice = 7, 
         }, 
         ShortDescr = "An Astromech Droid", 
         Race = "Adarian", 
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
         Description = "This Astromech Droid is acting as a bouncer to the bar south of here.\
Only 'adults' can enter.  If you would like to enter the bar, tell\
the droid 'hutts rule!'. \
", 
         Alignment = -500, 
         NumberOfAttacks = 0, 
         DamRoll = 13, 
         HitRoll = 13, 
         Vnum = 29065, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [19] = "adarese", 
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
               Code = "mpgoto puttzu\
mptransfer $n\
mpechoat $n The Droid ushers you into the bar.\
mpecho $n is ushered into the bar.\
mpgoto 29081\
", 
               Arguments = "p hutts rule!", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 65, 
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
            [6] = "StayArea", 
            [26] = "Droid", 
         }, 
         Name = "droid astromech bouncer", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "An Astromech Droid acts as a bouncer here.\
", 
         ArmorClass = 0, 
      }, 
      [29066] = 
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
         ShortDescr = "a bail box", 
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
         DamRoll = 10, 
         HitRoll = 10, 
         Vnum = 29066, 
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
               MudProgType = "bribe_prog", 
               Code = "mpechoaround $n $n exits the jail.\
mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpechoaround $n $n exits the jail.\
mpgoto 29108\
", 
               Arguments = "30", 
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
            [0] = "Npc", 
         }, 
         Name = "bailjfk boxjfk", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Bail Box has been installed in the wall here.\
", 
         ArmorClass = -100, 
      }, 
      [29067] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 15, 
            DamNoDice = 3, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 30, 
            HitNoDice = 3, 
         }, 
         ShortDescr = "Deputy Snopaew", 
         Race = "Adarian", 
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
         Description = "Deputy Snopaew is a tall and gangly looking Adarian.  It is his job to\
keep weapons out of the city.\
", 
         Alignment = 300, 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_police_jail", 
         }, 
         DamRoll = 6, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         HitRoll = 6, 
         Vnum = 29067, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "mpecho Deputy Snopaew surveys the area.\
", 
               Arguments = "50", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "glare $n\
", 
               Arguments = "75", 
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
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
         }, 
         Name = "deputy snopaew", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A deputy partols the area.\
", 
         ArmorClass = 0, 
      }, 
      [29068] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 8, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 15, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "a young deputy", 
         Race = "Adarian", 
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
         Description = "A young Adarian deputy.  You can see it is his dream to enforce\
laws.  He is a decent and moral being.\
", 
         Alignment = 300, 
         SpecFuns = 
         {
            [1] = "spec_customs_alcohol", 
            [0] = "spec_police_attack", 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         HitRoll = 3, 
         Vnum = 29068, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Credits = 15, 
         DamRoll = 3, 
         Level = 15, 
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
            [6] = "StayArea", 
         }, 
         Name = "deputy young", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A deputy patrols the area.\
", 
         ArmorClass = 0, 
      }, 
      [29069] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 5, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 10, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "a Townie", 
         Race = "Adarian", 
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
         Description = "Not the brightest nor most beautiful Adarian.  This is one of the\
citizens of the town.  She lives day to day.\
", 
         Alignment = -100, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         HitRoll = 2, 
         Vnum = 29069, 
         Height = 0, 
         Sex = "female", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Credits = 0, 
         DamRoll = 2, 
         Level = 15, 
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
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "adarian townie", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "An Adarian Townie wanders about here.\
", 
         ArmorClass = 75, 
      }, 
      [29070] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 12, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 22, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "a Draagax", 
         Race = "Adarian", 
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
         Description = "Ears similar to a rabbit, eyes of a fly, teeth of a lion, body of an\
ape. This can be a very frightening beast to stumble upon.\
", 
         Alignment = -100, 
         NumberOfAttacks = 0, 
         DamRoll = 4, 
         HitRoll = 4, 
         Vnum = 29070, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [19] = "adarese", 
            }, 
            Speaking = 
            {
               [19] = "adarese", 
            }, 
         }, 
         Sex = "undistinguished", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "if ispc($n) \
if level($n) >= 15 \
mpkill $n \
endif \
else \
mpecho A Draagax snorts loudly.\
endif\
", 
               Arguments = "75", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 22, 
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
            [2] = "Scavenger", 
            [6] = "StayArea", 
            [18] = "Mountable", 
         }, 
         Name = "draagax crazed omnivore", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A crazed omnivore sniffs about.\
", 
         ArmorClass = 65, 
      }, 
   }, 
}
