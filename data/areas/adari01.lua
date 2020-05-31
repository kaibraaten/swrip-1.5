-- Adari - Baituh City
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   LowEconomy = 4999666, 
   ResetMessage = "", 
   Filename = "adari01.lua", 
   HighEconomy = 0, 
   Author = "Merth", 
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
   Rooms = 
   {
      [29060] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 29060, 
      }, 
      [29061] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This is the northern most entrance and exit of Baituh City.  Jagged\
rocks prevent your travel in most directions.  The air is thick and\
full of dirt and soil.  You can continue to either the north or the\
south from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29112, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29062, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29061, 
      }, 
      [29062] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29061, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29064, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29063, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29062, 
      }, 
      [29063] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29062, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29066, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29063, 
      }, 
      [29064] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29067, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               DestinationVnum = 29062, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29064, 
      }, 
      [29065] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This barren little area is used for private space vessels to come\
and go.  This is not a nice or well kept facility, but it does serve\
a very useful purpose for the cities inhabitants.  This is not a bus\
stop. Commercial transportation does not and cannot dock here.  You\
can continue east from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Landing Strip", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [4] = "CanLand", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29066, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29065, 
      }, 
      [29066] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29063, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29069, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29065, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29066, 
      }, 
      [29067] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29064, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29068, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29071, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29067, 
      }, 
      [29068] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "You are just inside a cave.  The room is very well lit and well\
kept. Whoever runs the shop is very clean and meticulous.  The floor\
is made up of smoothed marble like rock and has very little dirt on\
it. You can exit to the west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Cafeteria", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29067, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29068, 
      }, 
      [29069] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29066, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29070, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29069, 
      }, 
      [29070] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29071, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29072, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29069, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29070, 
      }, 
      [29071] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29067, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29070, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29071, 
      }, 
      [29072] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29070, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29073, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29072, 
      }, 
      [29073] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This is the main intersection for Baituh City.  There are city\
blocks in all directions from here.  Each direction leads to\
something completely different than the other three.  Feel free to\
look around.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29072, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29086, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29098, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               DestinationVnum = 29074, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29073, 
      }, 
      [29074] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29073, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29075, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29074, 
      }, 
      [29075] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29076, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29074, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29082, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29075, 
      }, 
      [29076] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29075, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               DestinationVnum = 29077, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29076, 
      }, 
      [29077] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29083, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29076, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29078, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29077, 
      }, 
      [29078] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29077, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29079, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29078, 
      }, 
      [29079] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29078, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29080, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29084, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29079, 
      }, 
      [29080] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29079, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29081, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29080, 
      }, 
      [29081] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh City\
is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here. To the south is a 'bar'.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29082, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29085, 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29080, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29081, 
      }, 
      [29082] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29075, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29081, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29082, 
      }, 
      [29083] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "At one time Baituh City produced the best and brightest Adarians in\
their state of the art academy.  Since the planet and town have hit\
hard times, things have changed.  Now students must travel to Alfuh\
to work on their fighting skills. Most of the faculty from the old\
school have also left.  This lone room now acts as a tutoring\
facility for the one remaining faculty member.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Academia", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29077, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29083, 
      }, 
      [29084] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Welcome to the Baituh City Inn.  Those who need to rest and such\
can do so here.  But, you have to purchase a room of course.  This is\
not the largest hotel on the planet by any means.  But if you need to\
rest, this place is as good as any other.  You can exit to the east.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Inn", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [10] = "Safe", 
            [7] = "NoMagic", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29079, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29110, 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29084, 
      }, 
      [29085] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This dank fouls smelling hole in the ground is one of the few\
businesses able to survive these times of hardship.  It is a bar. \
Beings come here to forget about how miserable their lives are.  Feel\
free to join them.  But watch your step.  You can exit to the north.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Bar", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29081, 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Vnum = 29085, 
      }, 
      [29086] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29087, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29073, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29086, 
      }, 
      [29087] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29088, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29094, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29086, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29087, 
      }, 
      [29088] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29089, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29087, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29088, 
      }, 
      [29089] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29095, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29090, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29088, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29089, 
      }, 
      [29090] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29091, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               DestinationVnum = 29089, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29090, 
      }, 
      [29091] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29090, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29096, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29092, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29091, 
      }, 
      [29092] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29091, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29093, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29092, 
      }, 
      [29093] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29092, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29097, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29094, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29093, 
      }, 
      [29094] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29087, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29093, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29094, 
      }, 
      [29095] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This is not quite as elegant as one would expect of a government.\
 It would seem the government has been struggling a lot too during\
this time of hardship for the planet.  The room is well lit.  The\
walls are covered in dirt and filth, the floor is even worse.  You\
can escape to the south.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Governmental Offices", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29089, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29095, 
      }, 
      [29096] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Baituh City is still capable of communicating with other cities and\
planets. This was once a thriving postal service serving Baituh City\
and its the suburbs. Today, no one oversees the post office.  It is\
all done electronically.  You can exit to the west.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Post Office", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29091, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29096, 
      }, 
      [29097] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It is extremely warm here.  There is a large pool of lava\
directly south of here.  To continue south would almost certainly be\
instant death.  It would be best to get as far away from here as\
possible.  This is not a safe area.  Go north if you cherish life.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Lava Resevoir", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29093, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29111, 
               Key = -1, 
               Distance = 0, 
               Description = "If you go south, you will surely die!\
", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29097, 
      }, 
      [29098] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29073, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29099, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29098, 
      }, 
      [29099] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29098, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29101, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29100, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29099, 
      }, 
      [29100] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29099, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29102, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29100, 
      }, 
      [29101] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29103, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               DestinationVnum = 29099, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29101, 
      }, 
      [29102] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29100, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29104, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29107, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29102, 
      }, 
      [29103] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29101, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29108, 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29106, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29103, 
      }, 
      [29104] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29102, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29105, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29104, 
      }, 
      [29105] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29106, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29109, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29104, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29105, 
      }, 
      [29106] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29103, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29105, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29106, 
      }, 
      [29107] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This is the Baituh City Police Station.  A large marble desk sits in\
the corner of the room.  The floor is covered in dirt and volcanic\
ash. Several communication terminals have been built into the walls\
around you.\
", 
         TeleDelay = 0, 
         Name = "Baituh City Police Station", 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29102, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29107, 
      }, 
      [29108] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bail box", 
               Description = "This is a bail box.  To bereleased from jail, you must give 30 credits\
\13worth of bail to the box.  You will promptly be freed if you pay the\
\01330credit fine. \
\13", 
            }, 
         }, 
         Description = "This is a dank foul smelling armpit of a cell.  To be locked in this\
room means you must have broken the law.  Thick rocks make up the\
walls and ceiling. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Jail", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29103, 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29108, 
      }, 
      [29109] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This road is very wide and seems to be in fairly decent condition. \
However, a large rock-like boulder blocks you from continuing any\
further south. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Road", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29105, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Vnum = 29109, 
      }, 
      [29110] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "This is where you can safely sleep and exit the game.  When you\
reenter the game, this is the room you will start in.  Be sure to\
thank the hotel staff for putting up with you.  Enjoy your stay.  You\
can exit to the east. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Baituh City Hotel", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [23] = "Hotel", 
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29084, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29110, 
      }, 
      [29111] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It is unbelievably hot here.  You are in a lake of lava.  To be\
here is  almost certainly suicide.  If you can still escape to the\
north, do so! \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Lava Lake", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
            [16] = "Silence", 
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29097, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Vnum = 29111, 
      }, 
      [29112] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.  To the south is Baituh\
City.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29158, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29061, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29113, 
               Key = -1, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29112, 
      }, 
      [29113] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29112, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29114, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29113, 
      }, 
      [29114] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29115, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29113, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29114, 
      }, 
      [29115] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29116, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29114, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29115, 
      }, 
      [29116] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29117, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29115, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29116, 
      }, 
      [29117] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29118, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29116, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29117, 
      }, 
      [29118] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29119, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29117, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29118, 
      }, 
      [29119] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29120, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29118, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29119, 
      }, 
      [29120] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29121, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29119, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29120, 
      }, 
      [29121] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29122, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29120, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29121, 
      }, 
      [29122] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29123, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29121, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29122, 
      }, 
      [29123] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29124, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29125, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29122, 
               Key = -1, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29123, 
      }, 
      [29124] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Outskirts of Alfuh City", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29049, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29123, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29124, 
      }, 
      [29125] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29126, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29123, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29125, 
      }, 
      [29126] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29127, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29125, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29126, 
      }, 
      [29127] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29130, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29128, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29126, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29127, 
      }, 
      [29128] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29127, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29129, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29128, 
      }, 
      [29129] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29128, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29130, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29129, 
      }, 
      [29130] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29129, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29131, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29130, 
      }, 
      [29131] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29130, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29132, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29138, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29131, 
      }, 
      [29132] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29131, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29133, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29128, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29132, 
      }, 
      [29133] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29134, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29132, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29133, 
      }, 
      [29134] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29140, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29135, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29128, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               DestinationVnum = 29133, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29134, 
      }, 
      [29135] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29136, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29134, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29135, 
      }, 
      [29136] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29143, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29131, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29137, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               DestinationVnum = 29135, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29136, 
      }, 
      [29137] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29136, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29132, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29138, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29137, 
      }, 
      [29138] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29137, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29139, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29138, 
      }, 
      [29139] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29138, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29140, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29139, 
      }, 
      [29140] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29139, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29136, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29141, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29140, 
      }, 
      [29141] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29140, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29142, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29141, 
      }, 
      [29142] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29141, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29143, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29136, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29142, 
      }, 
      [29143] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29142, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29139, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29144, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29143, 
      }, 
      [29144] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29143, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29145, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29144, 
      }, 
      [29145] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29146, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29144, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29145, 
      }, 
      [29146] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29147, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29145, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29146, 
      }, 
      [29147] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29148, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29146, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29147, 
      }, 
      [29148] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29151, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29149, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29147, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29148, 
      }, 
      [29149] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29139, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29150, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               DestinationVnum = 29148, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29149, 
      }, 
      [29150] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29149, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29151, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29150, 
      }, 
      [29151] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29152, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               DestinationVnum = 29150, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29151, 
      }, 
      [29152] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29151, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29147, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29153, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29152, 
      }, 
      [29153] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29152, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29154, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29153, 
      }, 
      [29154] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29155, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29153, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Vnum = 29154, 
      }, 
      [29155] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29154, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               DestinationVnum = 29156, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29155, 
      }, 
      [29156] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29155, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29157, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Vnum = 29156, 
      }, 
      [29157] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29156, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               DestinationVnum = 29147, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               DestinationVnum = 29158, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29157, 
      }, 
      [29158] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Enclosed Dirt Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29157, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               DestinationVnum = 29112, 
               Key = -1, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Vnum = 29158, 
      }, 
   }, 
   Name = "Adari - Baituh City", 
   Objects = 
   {
      [29060] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Description = "A Large sign has been posted here.", 
         ShortDescr = "a sign", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign welcome", 
               Description = "-  Welcome to Baituh City  -\
\13Please follow our laws:\
\0131. No Weapons Permitted\
\0132. No Drugs Permitted\
\0133. No \"Adult Entertainment\"\
\13", 
            }, 
         }, 
         Name = "sign welcome", 
         Cost = 1, 
         Weight = 5000, 
         Layers = 0, 
         ItemType = "trash", 
         Vnum = 29060, 
      }, 
      [29061] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         ActionDescription = "", 
         Description = "A Bail Box has been built into the wall.", 
         ItemType = "container", 
         ShortDescr = "a Bail Box", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bail box", 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "bail box", 
               Description = "To be released from jail you must apologize for your crimes.  Hint,\
\13say 'sorry' to be released. \
\13", 
            }, 
         }, 
         Cost = 0, 
         Name = "bail box", 
         Weight = 5000, 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               MudProgType = "bribe_prog", 
               Arguments = "30", 
            }, 
            [2] = 
            {
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               MudProgType = "speech_prog", 
               Arguments = "sorry", 
            }, 
         }, 
         Vnum = 29061, 
      }, 
      [29065] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Description = "A copy of PlayHutt magazine has been left here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "playhutt trashy magazine", 
               Description = "Be careful! You might go blind looking at such filth!\
\13", 
            }, 
         }, 
         ShortDescr = "a copy of PlayHutt magazine", 
         Cost = 50, 
         Weight = 2, 
         Name = "playhutt trashy magazine", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         ItemType = "smut", 
         Vnum = 29065, 
      }, 
   }, 
   Mobiles = 
   {
      [29060] = 
      {
         HitChance = 
         {
            HitNoDice = 4, 
            HitSizeDice = 40, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 8, 
         ShortDescr = "Smotsuk", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_customs_spice", 
            [0] = "spec_police_jail", 
         }, 
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
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A deputy leaves in a rush.\
mpgoto 29030\
drop all\
mpgoto 29065\
mpecho A deputy has arrived.\
", 
               MudProgType = "time_prog", 
               Arguments = "12", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 20, 
            DamNoDice = 4, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 8, 
         Sex = "male", 
         Position = "standing", 
         Description = "He is a big burly Adarian.  His only intention is to keep weapons\
from being imported or exported from Adari.\
", 
         Weight = 0, 
         Level = 40, 
         Race = "Adarian", 
         NumberOfAttacks = 0, 
         Alignment = 350, 
         DefaultPosition = "standing", 
         LongDescr = "Smotsuk, a customs officer is here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Name = "officer customs smotsuk", 
         Vnum = 29060, 
      }, 
      [29061] = 
      {
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 4, 
         ShortDescr = "Baszturd", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
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
         ArmorClass = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "Baszturd", 
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
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 2, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 4, 
         Sex = "male", 
         Position = "standing", 
         Description = "He is an elderly Adarian shop keeper. \
", 
         Weight = 0, 
         Level = 20, 
         Race = "Adarian", 
         NumberOfAttacks = 0, 
         Alignment = -400, 
         DefaultPosition = "standing", 
         LongDescr = "A shop keeper works here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "shop keeper shopkeeper baszturd", 
         Vnum = 29061, 
      }, 
      [29062] = 
      {
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 4, 
         ShortDescr = "Professor Sumaretie", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
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
         ArmorClass = 60, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 10, 
            DamNoDice = 2, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 4, 
         Sex = "male", 
         Position = "standing", 
         Description = "This old Adarian may not know a great deal about fighting, but he\
knows many languages and other academic fields.  He might be able to\
help you learn another language. \
", 
         Weight = 0, 
         Level = 20, 
         Race = "Adarian", 
         NumberOfAttacks = 0, 
         Alignment = 450, 
         DefaultPosition = "standing", 
         LongDescr = "A saavy, old scholar studies here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
            [20] = "Scholar", 
         }, 
         Name = "scholar old saavy professor sumaretie", 
         Vnum = 29062, 
      }, 
      [29063] = 
      {
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 30, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 6, 
         ShortDescr = "An Innkeeper Droid", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
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
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpgoto 29110\
mptransfer $n\
mpechoat $n The R2 Unit escorts you to a room.\
east\
", 
               MudProgType = "bribe_prog", 
               Arguments = "18", 
            }, 
            [2] = 
            {
               Code = "mpecho A little red R2 Unit whistles happily towards you.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "75", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 15, 
            DamNoDice = 3, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 6, 
         Sex = "undistinguished", 
         Position = "standing", 
         Description = "A red astromech R2 unit idles here waiting to help you.  If you would\
like  to rent a room for the evening, give 50 credits to this R2\
unit. \
", 
         Weight = 0, 
         Level = 30, 
         Race = "Adarian", 
         NumberOfAttacks = 0, 
         Alignment = -400, 
         DefaultPosition = "standing", 
         LongDescr = "An Innkeeper Droid idles here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "droid innkeeper keeper r2 unit", 
         Vnum = 29063, 
      }, 
      [29064] = 
      {
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 50, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 10, 
         ShortDescr = "Puttzu", 
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
         ArmorClass = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "Puttzu", 
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
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 25, 
            DamNoDice = 5, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 10, 
         Sex = "male", 
         Position = "standing", 
         Description = "", 
         Weight = 0, 
         Level = 50, 
         Race = "Hutt", 
         NumberOfAttacks = 0, 
         Alignment = -500, 
         DefaultPosition = "standing", 
         LongDescr = "A Hutt Bartender works here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "bartender hutt puttzu", 
         Vnum = 29064, 
      }, 
      [29065] = 
      {
         HitChance = 
         {
            HitNoDice = 7, 
            HitSizeDice = 65, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 13, 
         ShortDescr = "An Astromech Droid", 
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
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpgoto puttzu\
mptransfer $n\
mpechoat $n The Droid ushers you into the bar.\
mpecho $n is ushered into the bar.\
mpgoto 29081\
", 
               MudProgType = "speech_prog", 
               Arguments = "p hutts rule!", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 37, 
            DamNoDice = 6, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 13, 
         Sex = "undistinguished", 
         Position = "standing", 
         Description = "This Astromech Droid is acting as a bouncer to the bar south of here.\
Only 'adults' can enter.  If you would like to enter the bar, tell\
the droid 'hutts rule!'. \
", 
         Weight = 0, 
         Level = 65, 
         Race = "Adarian", 
         NumberOfAttacks = 0, 
         Alignment = -500, 
         DefaultPosition = "standing", 
         LongDescr = "An Astromech Droid acts as a bouncer here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [26] = "Droid", 
         }, 
         Name = "droid astromech bouncer", 
         Vnum = 29065, 
      }, 
      [29066] = 
      {
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 10, 
         ShortDescr = "a bail box", 
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
         ArmorClass = -100, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoaround $n $n exits the jail.\
mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpechoaround $n $n exits the jail.\
mpgoto 29108\
", 
               MudProgType = "bribe_prog", 
               Arguments = "30", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 10, 
         Sex = "undistinguished", 
         Position = "standing", 
         Description = "", 
         Weight = 0, 
         Level = 50, 
         Race = "Human", 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Bail Box has been installed in the wall here.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "bailjfk boxjfk", 
         Vnum = 29066, 
      }, 
      [29067] = 
      {
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 30, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 6, 
         ShortDescr = "Deputy Snopaew", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_police_jail", 
         }, 
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
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "glare $n\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "75", 
            }, 
            [2] = 
            {
               Code = "mpecho Deputy Snopaew surveys the area.\
", 
               MudProgType = "entry_prog", 
               Arguments = "50", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 15, 
            DamNoDice = 3, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 6, 
         Sex = "male", 
         Position = "standing", 
         Description = "Deputy Snopaew is a tall and gangly looking Adarian.  It is his job to\
keep weapons out of the city.\
", 
         Weight = 0, 
         Level = 30, 
         Race = "Adarian", 
         NumberOfAttacks = 0, 
         Alignment = 300, 
         DefaultPosition = "standing", 
         LongDescr = "A deputy partols the area.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
         }, 
         Name = "deputy snopaew", 
         Vnum = 29067, 
      }, 
      [29068] = 
      {
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 15, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 15, 
         HitRoll = 3, 
         ShortDescr = "a young deputy", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
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
         ArmorClass = 0, 
         SpecFuns = 
         {
            [1] = "spec_customs_alcohol", 
            [0] = "spec_police_attack", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 8, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 3, 
         Sex = "male", 
         Position = "standing", 
         Description = "A young Adarian deputy.  You can see it is his dream to enforce\
laws.  He is a decent and moral being.\
", 
         Weight = 0, 
         Level = 15, 
         Race = "Adarian", 
         NumberOfAttacks = 0, 
         Alignment = 300, 
         DefaultPosition = "standing", 
         LongDescr = "A deputy patrols the area.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Name = "deputy young", 
         Vnum = 29068, 
      }, 
      [29069] = 
      {
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 10, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 2, 
         ShortDescr = "a Townie", 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
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
         ArmorClass = 75, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 5, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 2, 
         Sex = "female", 
         Position = "standing", 
         Description = "Not the brightest nor most beautiful Adarian.  This is one of the\
citizens of the town.  She lives day to day.\
", 
         Weight = 0, 
         Level = 15, 
         Race = "Adarian", 
         NumberOfAttacks = 0, 
         Alignment = -100, 
         DefaultPosition = "standing", 
         LongDescr = "An Adarian Townie wanders about here.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "adarian townie", 
         Vnum = 29069, 
      }, 
      [29070] = 
      {
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 22, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         HitRoll = 4, 
         ShortDescr = "a Draagax", 
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
         ArmorClass = 65, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if ispc($n) \
if level($n) >= 15 \
mpkill $n \
endif \
else \
mpecho A Draagax snorts loudly.\
endif\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "75", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 12, 
            DamNoDice = 2, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Force = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 4, 
         Sex = "undistinguished", 
         Position = "standing", 
         Description = "Ears similar to a rabbit, eyes of a fly, teeth of a lion, body of an\
ape. This can be a very frightening beast to stumble upon.\
", 
         Weight = 0, 
         Level = 22, 
         Race = "Adarian", 
         NumberOfAttacks = 0, 
         Alignment = -100, 
         DefaultPosition = "standing", 
         LongDescr = "A crazed omnivore sniffs about.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
            [18] = "Mountable", 
         }, 
         Name = "draagax crazed omnivore", 
         Vnum = 29070, 
      }, 
   }, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 29070, 
         First = 29060, 
      }, 
      Room = 
      {
         Last = 29158, 
         First = 29060, 
      }, 
      Object = 
      {
         Last = 29065, 
         First = 29060, 
      }, 
   }, 
   LevelRanges = 
   {
      Soft = 
      {
         High = 103, 
         Low = 0, 
      }, 
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29061, 
         Arg2 = 1, 
         Arg3 = 29068, 
      }, 
      [2] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 29002, 
      }, 
      [3] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10313, 
      }, 
      [4] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
      }, 
      [5] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10317, 
      }, 
      [6] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29062, 
         Arg2 = 1, 
         Arg3 = 29083, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29063, 
         Arg2 = 1, 
         Arg3 = 29084, 
      }, 
      [8] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg1 = 29084, 
         Arg2 = 3, 
         Arg3 = 2, 
      }, 
      [9] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29065, 
         Arg2 = 1, 
         Arg3 = 29081, 
      }, 
      [10] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg1 = 29081, 
         Arg2 = 2, 
         Arg3 = 2, 
      }, 
      [11] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29066, 
         Arg2 = 1, 
         Arg3 = 29108, 
      }, 
      [12] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg1 = 29108, 
         Arg2 = 3, 
         Arg3 = 2, 
      }, 
      [13] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg1 = 38, 
         Arg2 = 1, 
         Arg3 = 29096, 
      }, 
      [14] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29067, 
         Arg2 = 1, 
         Arg3 = 29066, 
      }, 
      [15] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [16] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [17] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [18] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [19] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29068, 
         Arg2 = 1, 
         Arg3 = 29069, 
      }, 
      [20] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [21] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [22] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [23] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [24] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29068, 
         Arg2 = 2, 
         Arg3 = 29078, 
      }, 
      [25] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [26] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [27] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [28] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [29] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29068, 
         Arg2 = 3, 
         Arg3 = 29090, 
      }, 
      [30] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [31] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [32] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [33] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [34] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29068, 
         Arg2 = 4, 
         Arg3 = 29100, 
      }, 
      [35] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [36] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [37] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [38] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [39] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29068, 
         Arg2 = 5, 
         Arg3 = 29106, 
      }, 
      [40] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [41] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [42] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [43] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [44] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29068, 
         Arg2 = 6, 
         Arg3 = 29107, 
      }, 
      [45] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [46] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [47] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [48] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [49] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29060, 
         Arg2 = 1, 
         Arg3 = 29065, 
      }, 
      [50] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [51] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [52] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [53] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [54] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg1 = 29060, 
         Arg2 = 1, 
         Arg3 = 29065, 
      }, 
      [55] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 1, 
         Arg3 = 29062, 
      }, 
      [56] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [57] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 2, 
         Arg3 = 29071, 
      }, 
      [58] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [59] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 3, 
         Arg3 = 29080, 
      }, 
      [60] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [61] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 4, 
         Arg3 = 29073, 
      }, 
      [62] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [63] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 5, 
         Arg3 = 29092, 
      }, 
      [64] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [65] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 6, 
         Arg3 = 29104, 
      }, 
      [66] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [67] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 1, 
         Arg3 = 29127, 
      }, 
      [68] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 2, 
         Arg3 = 29129, 
      }, 
      [69] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 3, 
         Arg3 = 29131, 
      }, 
      [70] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 4, 
         Arg3 = 29133, 
      }, 
      [71] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 5, 
         Arg3 = 29135, 
      }, 
      [72] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 6, 
         Arg3 = 29137, 
      }, 
      [73] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 7, 
         Arg3 = 29139, 
      }, 
      [74] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 8, 
         Arg3 = 29141, 
      }, 
      [75] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 9, 
         Arg3 = 29143, 
      }, 
      [76] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 10, 
         Arg3 = 29145, 
      }, 
      [77] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 11, 
         Arg3 = 29147, 
      }, 
      [78] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 12, 
         Arg3 = 29149, 
      }, 
      [79] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 13, 
         Arg3 = 29151, 
      }, 
      [80] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 14, 
         Arg3 = 29153, 
      }, 
      [81] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 15, 
         Arg3 = 29155, 
      }, 
      [82] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 16, 
         Arg3 = 29157, 
      }, 
      [83] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 17, 
         Arg3 = 29115, 
      }, 
      [84] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29070, 
         Arg2 = 18, 
         Arg3 = 29119, 
      }, 
      [85] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg1 = 29027, 
         Arg2 = 3, 
         Arg3 = 2, 
      }, 
      [86] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29068, 
         Arg2 = 7, 
         Arg3 = 29027, 
      }, 
      [87] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [88] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [89] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [90] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [91] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg1 = 29027, 
         Arg2 = 3, 
         Arg3 = 2, 
      }, 
      [92] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29068, 
         Arg2 = 8, 
         Arg3 = 29015, 
      }, 
      [93] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29008, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [94] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [95] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29006, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [96] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29009, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [97] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 7, 
         Arg3 = 29015, 
      }, 
      [98] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [99] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 9, 
         Arg3 = 29021, 
      }, 
      [100] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 8, 
         Arg3 = 29021, 
      }, 
      [101] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [102] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 9, 
         Arg3 = 29033, 
      }, 
      [103] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [104] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 10, 
         Arg3 = 29037, 
      }, 
      [105] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [106] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 11, 
         Arg3 = 29042, 
      }, 
      [107] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [108] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 12, 
         Arg3 = 29041, 
      }, 
      [109] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [110] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29069, 
         Arg2 = 13, 
         Arg3 = 29050, 
      }, 
      [111] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 29004, 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [112] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 10, 
         Arg3 = 29064, 
      }, 
      [113] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 11, 
         Arg3 = 29088, 
      }, 
      [114] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 12, 
         Arg3 = 29082, 
      }, 
      [115] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29007, 
         Arg2 = 13, 
         Arg3 = 29101, 
      }, 
      [116] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 29064, 
         Arg2 = 1, 
         Arg3 = 29085, 
      }, 
      [117] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 21009, 
      }, 
      [118] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 21008, 
      }, 
      [119] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 21010, 
      }, 
      [120] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32230, 
      }, 
      [121] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10487, 
      }, 
      [122] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 29065, 
      }, 
      [123] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg1 = 7316, 
         Arg2 = 1, 
         Arg3 = 29085, 
      }, 
      [124] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 28200, 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [125] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32217, 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [126] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32215, 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [127] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32216, 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [128] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32204, 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [129] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg1 = 32205, 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [130] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg1 = 29085, 
         Arg2 = 0, 
         Arg3 = 0, 
      }, 
   }, 
}
