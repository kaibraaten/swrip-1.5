-- Tatooine
-- Last saved Saturday 04-Jul-2020 12:42:50

AreaEntry
{
   VnumRanges = 
   {
      Object = 
      {
         First = 31500, 
         Last = 31999, 
      }, 
      Mob = 
      {
         First = 31500, 
         Last = 31999, 
      }, 
      Room = 
      {
         First = 31500, 
         Last = 31999, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Name = "Tatooine", 
   Author = "Satin", 
   Rooms = 
   {
      [31744] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Wastes", 
         Vnum = 31744, 
         Sector = "mountain", 
         Description = "You can smell an odour developing around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31745, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31743, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31745] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Wastes", 
         Vnum = 31745, 
         Sector = "mountain", 
         Description = "You stand on a hard rocky surface. The air around you is very unpleasant.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31744, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31746] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Hallway", 
         Vnum = 31746, 
         Sector = "inside", 
         Description = "You are walking down a long, narrow hallway which turns at the end.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31747, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31735, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31747] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Through Jabba's Palace", 
         Vnum = 31747, 
         Sector = "inside", 
         Description = "You are walking down a hallway. It is old and there is a rather digusting\
smell all around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31748, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31746, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31748] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Hallway in Jabba's Palace", 
         Vnum = 31748, 
         Sector = "inside", 
         Description = "You are standing in a hallway. To each side all along the hall there are\
small individual rooms.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31749, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31747, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31749] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Hallway End", 
         Vnum = 31749, 
         Sector = "inside", 
         Description = "You are coming to the end of the hallway which curves both to the east and\
to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31750, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31748, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31750] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Narrow Hallway", 
         Vnum = 31750, 
         Sector = "inside", 
         Description = "You are in a small narrow hallway which has a very disgusting odour, not\
surprising considering what creatures and animals have lived here in the past\
and even now. The ground is cool and hard full of ripples as if never crafted\
or taken care of.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31751, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31749, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31770, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31788, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31751] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Facing A Dark Room", 
         Vnum = 31751, 
         Sector = "inside", 
         Description = "You are standing in a hallway facing east. As you look down the hallway at\
the end you can see different colored lights flashing in the dimness and the\
darkness. The ground is rough and the air is hot and heavy. Above a burnt out\
glowpanel lays motionless but you can still see pretty well.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31768, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31752, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31769, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31750, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31752] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Narrow Hallway ", 
         Vnum = 31752, 
         Sector = "inside", 
         Description = "You are walking down a narrow hallway. To each side there are very small rooms\
which are vacant.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31766, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31753, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31767, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31751, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31753] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Long Hallway ", 
         Vnum = 31753, 
         Sector = "inside", 
         Description = "You are walking down a hallway towards a very large opening. It appears not\
to be guarded or have a door in place. The ground beneath you is hard and full\
of cracks and uneven places. The air is heavy and hot but nothing that cannot\
be lived with.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31764, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31754, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31765, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31752, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31754] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "End Of Hallway Before A Large Room", 
         Vnum = 31754, 
         Sector = "inside", 
         Description = "You approach the dark room at the end of the hallway with every step you\
take. To you sides you continually see small occupied rooms. The ground\
beneath your feet is rough and uneven making you feet ache all over. The\
lighting here is minimal but you can still see down the hall.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31762, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31755, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31763, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31753, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31755] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of A Large Room", 
         Vnum = 31755, 
         Sector = "inside", 
         Description = "You are standing in front of a very large room with different sections in it.\
The entrance used to have doors but as you can see they have been removed for\
all that remains is the hinges.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31760, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31756, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31761, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31754, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31756] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Brain Jar Room", 
         Vnum = 31756, 
         Sector = "inside", 
         Description = "You stand in a dark room filled with brain jars. Each brain is used to put\
inside of a spiderwalker. You can go down the rows in front of you. The ground\
is softer in here as if taken care of, there is not one ripple in the whole\
surface showing grace and care from the person or people that finished this\
room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31759, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31757, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31755, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [31757] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Brain Room", 
         Vnum = 31757, 
         Sector = "inside", 
         Description = "All around you there are brains in jars. As you walk by they start screaming.\
As they scream the lights on the jars change color indicating that they are\
not calm at all. In front of you there is a row of containing shelves with\
jars gently placed on them.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31758, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31756, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [31758] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Brain Compartment", 
         Vnum = 31758, 
         Sector = "inside", 
         Description = "You are walking down a row. To your sides shelves are filled with brains from\
all species of the galaxy. These jars seem to be a bit calmer for their lights\
are not flaring off when you pass by them. this shows they are mature and\
prepared to be put into a body of some sort, most likely a spiderwalker.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31757, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [31759] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Row Of Jars", 
         Vnum = 31759, 
         Sector = "inside", 
         Description = "You are standing in a row with shelves in it. On each shelf jars have been\
placed carefully to ensure that they are safe and will not fall to the ground\
and break. The air is crisp and provides stability as you stare longly at the\
large amounts of jars.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31756, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [31760] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Old Room", 
         Vnum = 31760, 
         Sector = "inside", 
         Description = "You are standing in small room which was initially designed to home a person.\
It has a window facing the sun.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31755, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31761] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Dusty Old Room", 
         Vnum = 31761, 
         Sector = "inside", 
         Description = "You are standing in room. It has dust all over it for it has not been used\
for many, many years.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31755, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31762] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Guest Room", 
         Vnum = 31762, 
         Sector = "inside", 
         Description = "This is a larger room. It was probably designed to hold a larger species.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31754, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31763] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Old Small Calibered Room", 
         Vnum = 31763, 
         Sector = "inside", 
         Description = "The room you are standing in is very small room. It has a window in the\
corner and an old bedframe in the corner which seems to have been destroyed by\
small rodents.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31754, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31764] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Storage Compartment For Droids", 
         Vnum = 31764, 
         Sector = "inside", 
         Description = "You are standing in an extremely small room that was designed to hold a\
cleaning droid or two.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31753, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31765] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Specimen Room", 
         Vnum = 31765, 
         Sector = "inside", 
         Description = "You are in a large room. It was made for a larger type species. It is used to\
house and for sleeping. This room has a very disgusting odour.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31753, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31766] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Unused Room", 
         Vnum = 31766, 
         Sector = "inside", 
         Description = "You are standing in a small room with a window facing the great sand dune\
sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31752, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31767] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Habitated Room", 
         Vnum = 31767, 
         Sector = "inside", 
         Description = "You are standing in a room which seems to be habitated. There is a small bed\
in the corner with a window mounted on the wall which looks outside.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31752, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31768] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Enclosed Room", 
         Vnum = 31768, 
         Sector = "inside", 
         Description = "You are in a room of small caliber. You feel enclosed as you look around the\
room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31751, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31769] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Unhabitated Room", 
         Vnum = 31769, 
         Sector = "inside", 
         Description = "You are standing in a bedroom. It is not habitated but could be.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31751, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31770] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Hallway", 
         Vnum = 31770, 
         Sector = "inside", 
         Description = "You walk down a long narrow hallway which floor is covered with stone and\
provides discomfort for your feet. To each side you can see some small and\
large rooms all with different uses. There is a glowpanel above your head\
barely functioning providing the dimmest of light all over.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31750, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31771, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31771] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Hallway Passage", 
         Vnum = 31771, 
         Sector = "inside", 
         Description = "The hallway you walk down is on an uneven\
surface, it has ripples all along it and provides not much for heat or for\
comfort. There is no lighting here but you can still see down the gloomy\
hallway but not always with ease.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31770, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31772, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31772] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Dense Hallway", 
         Vnum = 31772, 
         Sector = "inside", 
         Description = "As you walk down the hallway on a cool stone floor you smell an odour, a\
rather unpleasant one, but having been in this palace it is no surprise that\
this smell is located here. The hallway is gloomy and the floor has a rough\
texture as if never smoothed out.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31782, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31771, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31784, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31773, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31773] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Narrowed Hallway", 
         Vnum = 31773, 
         Sector = "inside", 
         Description = "The ground beneath your feet is made of pure stone, rather cold at night and\
still cool in the day the stone is what covers all the palace floors. You can\
see the end of the hallway just ahead of yourself. Large and without any\
features. Just a simple stone wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31780, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31772, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31781, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31774, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31774] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Leading To Individual Rooms", 
         Vnum = 31774, 
         Sector = "inside", 
         Description = "The hallway you walk down is covered in stone, cold on your feet as you walk\
over it for it does not preserve heat well. A glowpanel above is burnt out\
and every once in a while a small burst of electricity comes rippling through\
the end of the cables. The air here is dense but not filled with a stench, a\
rather unusual thing for this palace. To both sides there are rooms of\
different caliber. There is a great stone wall stopping the end of the hall\
just ahead.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31778, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31773, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31779, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31775, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31775] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "End Of A Long Hallway", 
         Vnum = 31775, 
         Sector = "inside", 
         Description = "You are standing at the end of the hallway. There is a very large stone wall\
before you covering your way further down the hallway. The stone wall is\
thick and rough with different textures all over its surface.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31776, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31774, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31777, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31776] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Extra Small Compartment Room", 
         Vnum = 31776, 
         Sector = "inside", 
         Description = "You are standing in room of very small caliber. It was probably constructed to\
hold extra blankets. There are closets all along the walls.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31775, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31777] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Old Room", 
         Vnum = 31777, 
         Sector = "inside", 
         Description = "You are in a large room. It was probably used as a sleeping quarter. There is\
a small bed in the corner which has been chewed away at by a small rodent.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31775, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31778] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Well Sized Room", 
         Vnum = 31778, 
         Sector = "inside", 
         Description = "You are in a well sized room. It was used as a living quarters in the past.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31774, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31779] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Habitated Living Quarters", 
         Vnum = 31779, 
         Sector = "inside", 
         Description = "You are standing in a living quarters. It is currently habitated. You can\
tell because of food on the floor.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31774, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31780] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Supply Storage", 
         Vnum = 31780, 
         Sector = "inside", 
         Description = "You are standing in a small room used to store extra supplies.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31773, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31781] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Living Quarters", 
         Vnum = 31781, 
         Sector = "inside", 
         Description = "You are in a very large room. It was made as a living quaters. There is a\
large window in front of you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31773, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31782] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Room", 
         Vnum = 31782, 
         Sector = "inside", 
         Description = "You are in a smaller room. It can be used for any purpose.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31772, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31784] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Room", 
         Vnum = 31784, 
         Sector = "inside", 
         Description = "You are standing in a large room. There is a bed that can hold any species\
and a large window on the back wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31772, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31788] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Top Of Staircase", 
         Vnum = 31788, 
         Sector = "inside", 
         Description = "You are standing at the top of a staircase. In front of you there is a long\
hallway. Along the hallway many prison cells are there because Jabba use them\
for keeping people of unimportance.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31789, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31750, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31789] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Prison Hallway", 
         Vnum = 31789, 
         Sector = "inside", 
         Description = "You are walking down the hallway. As you walk along you notice that all of\
the doors have been removed.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31788, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31790, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31790] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Prison Hallway", 
         Vnum = 31790, 
         Sector = "inside", 
         Description = "You are in the hallway. It ends just up ahead making it a rather short\
corridor.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31789, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31794, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31791, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31795, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31791] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Prison Hallway End", 
         Vnum = 31791, 
         Sector = "inside", 
         Description = "You have come to the end of the hall. A stone wall lays in front of you,\
preventing you from advancing.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31790, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31792, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31793, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31792] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Prison Cell", 
         Vnum = 31792, 
         Sector = "inside", 
         Description = "You are standing in a prison cell. If you turn back there are metal bars\
across the wall. All around you the only furniture in this cell is a prison\
bed.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31791, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31793] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Prison Cell", 
         Vnum = 31793, 
         Sector = "inside", 
         Description = "You are standing in a large prison cell. This cell was used for larger\
specimens. It has a toilet and a small bunk in the corner.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31791, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31794] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Extremely Small Cell", 
         Vnum = 31794, 
         Sector = "inside", 
         Description = "You are standing in the smallest cell. This cell was used to hold very small\
specimens of life.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31790, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31795] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Very Large Prison Cell", 
         Vnum = 31795, 
         Sector = "inside", 
         Description = "You are standing in a very large prison cell. It scares you to think what was\
kept in here. There is an awful smell.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31790, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31796] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Rancor's Pit", 
         Vnum = 31796, 
         Sector = "inside", 
         Description = "You just fell down the trapdoor into the rancor's pit. Here there is a very\
disgusting smell. This room is immense. To the north is the smaller\
compartment the rancor was kept in while his cage was cleaned.\
", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31797] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "DT", 
         Vnum = 31797, 
         Sector = "inside", 
         Description = "You get crushed by gate and die(d.t)\
", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31798] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Rancor's Cage", 
         Vnum = 31798, 
         Sector = "inside", 
         Description = "You just slid down the chute into the rancor's cage. The room is an immense\
room and has a very foul odour to it. To the north the smaller room lays which\
the rancor was put when the cage was cleaned.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31799, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31733, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31799] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "DT", 
         Vnum = 31799, 
         Sector = "inside", 
         Description = "EDIT\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31798, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31800] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway to Rancor Pit", 
         Vnum = 31800, 
         Sector = "inside", 
         Description = "You are standing in front of hallway which leads down into the rancor pit. To\
the south is the kitchen. To continue down the hall go east.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31733, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31802, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31801, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31801] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Jabba's Palace's Kitchen", 
         Vnum = 31801, 
         Sector = "inside", 
         Description = "You are standing inside the kitchen that is used to make Jabba the Hutt's\
disgusting foods. There is a table in the center of the room with a cutting\
board and extra utensils. On the wall there are many shelves and utensils\
layed everywhere.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31800, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31802] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Past Docking Bay", 
         Vnum = 31802, 
         Sector = "inside", 
         Description = "You are walking down a hall which passes the docking bay and many living\
quarters.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31803, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31800, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31803] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Past A Room", 
         Vnum = 31803, 
         Sector = "inside", 
         Description = "You are standing in front of one of many rooms located on the bottom level.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31802, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31804] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Landing Pad 6", 
         Vnum = 31804, 
         Sector = "city", 
         Description = "You are standing on a rather small sized landing pad. It can be used to keep\
smaller sized vehicles of any origin.\
", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31805] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Rocky Cliff", 
         Vnum = 31805, 
         Sector = "mountain", 
         Description = "You are standing at the top of a high cliff. As you look downwards it is not a\
far drop but what scares you is that you would land on sharp jagged stones of\
all shapes and sizes. As you look the other way there is a steep cliff. If you\
can climb it go ahead.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31589, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31806, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31806] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Krayt Nest", 
         Vnum = 31806, 
         Sector = "mountain", 
         Description = "You are standing in the middle of a Krayt Dragon's nest. It does not smell\
particularly good. A large female krayt towers over you here wondering what\
you are doing.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31805, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31807] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31807, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of\
sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31501, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31808, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31808] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Deserty Path", 
         Vnum = 31808, 
         Sector = "desert", 
         Description = "You are walking along the hot sand heated by the twin suns of Tatooine. The\
ground beneath you is hardening gradually as you walk over it or is it just\
your imagination?\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31809, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31807, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31812, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31809] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hard Sandy Area", 
         Vnum = 31809, 
         Sector = "desert", 
         Description = "You walk along a large area covered with sand. This sand seems to have\
hardened gradually over the years and is now almost of the consistency of\
sandstone. To the west the sand slopes downward in many directions. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31814, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31808, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31810, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31810] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Sandy Surface", 
         Vnum = 31810, 
         Sector = "desert", 
         Description = "You are standing on top of very hard sand, yet maybe even rock covered with\
sand. As you look westwards you see the dune sea stop abruptly and plummet\
downwards. I wonder why.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31809, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31811, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31811] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Overseeing A Small Colony.", 
         Vnum = 31811, 
         Sector = "desert", 
         Description = "You are standing on the edge of a very steep drop that falls directly into the\
heart of what looks to be a colony of some sorts. You would not want to fall\
down this cliff for it is a ways down.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31810, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31812] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Flat Area", 
         Vnum = 31812, 
         Sector = "desert", 
         Description = "You are walking on one of the only things on this planet. Sand. It is nice and\
soft but some patches of hardened sand can bee seen all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31808, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31813, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31813] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31813, 
         Sector = "desert", 
         Description = "You look about, look from the direction you came, nothing, nothing at all but\
sand. You wonder how much of this stuff could there possibly be?\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31812, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31814] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Unstable Ground", 
         Vnum = 31814, 
         Sector = "desert", 
         Description = "As the ground beaneath your feet is in a transition from sand to rock\
it seems to be versatile and flakes away in some areas with every\
step that you take on it. Northward you see all the sand is no longer\
there but it is totally a rock surface.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31815, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31809, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31815] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Rocky Area", 
         Vnum = 31815, 
         Sector = "mountain", 
         Description = "The texture beneath your feet is no longer primarily sand but totally\
rock. The rock continues for twenty or thirty feet ahead of you but\
then stops abruptly and becomes sand once again. Downwards a cliff\
slopes downwards. This side is still very steep but you can perceive\
that it is very possible to go up and down of it.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31814, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31816, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31816] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Side Of Steep Path", 
         Vnum = 31816, 
         Sector = "mountain", 
         Description = "You are on a pathway facing a severe angle which makes it so that\
there is not much room to move around without falling downwards\
towards flat ground. To the east there is a small cave in the side of\
a cliff. If you continue downwards you will be entering the city.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31817, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31815, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31818, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31817] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Water Shack", 
         Vnum = 31817, 
         Sector = "mountain", 
         Description = "You are standing in a dimly lit room. There is an aged Jawa shopkeeper\
sitting in the corner behind a table selling items you may need to\
explore this vast land filled with opportunities and predators. In\
this small cave it is darker which makes the temperature drop\
drastically and therefore makes this place a good one to stay in for\
long periods of time especially when both suns are up, sending rays of\
heat onto you. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31816, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31818] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Entering The City", 
         Vnum = 31818, 
         Sector = "mountain", 
         Description = "You are standing on the same level most of this city is based on. All\
around tere are small shops and tents set up quickly used for\
merchandising goods to any passers.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31819, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31870, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31816, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31819] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Path In The City", 
         Vnum = 31819, 
         Sector = "mountain", 
         Description = "You are walking down a wide path in the middle of this small city\
seemingly belonging to the Jawas. It has been used frequently and\
you can tell this for the rock is shaved away by weight and the path\
is full of marks. Straight ahead also there is a huge fortress of\
some sorts. It is simply constructed and seems old, but that is\
probably because of the wind and the scorching suns of Tatooine. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31818, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31849, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31820, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31851, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31820] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Dusty Path", 
         Vnum = 31820, 
         Sector = "mountain", 
         Description = "You walk along a wide dusty path between two of the most popular\
places in this small veritable city. All around Jawas and small\
creatures of likes you do not want to be aquainted with. As you\
continue down this path you recognize many things and see the\
fortress growing with every step you take, seemingly growing to an \
endless extent. Although it is rather large it seems to be of simple\
construction and not very complicated.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31819, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31821, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31821] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Path", 
         Vnum = 31821, 
         Sector = "mountain", 
         Description = "You walk along a wide path seemingly wider than you think because of\
the reflection and glare of the two twin suns of Tatooine. In front\
of you the Jawa fortress stands immensely with not much architectural\
design to it. You can continue down this road towards the fortress or\
turn off into one of the side streets leading to who knows where.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31820, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31822, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31822] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Directly In Front Of The Jawa Fortress", 
         Vnum = 31822, 
         Sector = "mountain", 
         Description = "You are standing directly in front of the Jawa Fortress. It seems rather\
large from this viewpoint but is limited to levels and interior space\
due to its design. there are some small designs on the fortress but\
they seem to not have been part of the original plans of the fortress\
but added in by certain individuals. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31821, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31823, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31823] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance To Jawa Fortress", 
         Vnum = 31823, 
         Sector = "inside", 
         Description = "You are standing in a very large room. It was built plainly and simply\
and there are no signs of art even from their own culture in this\
room. There are some narrow corridors in many directions leading to\
different parts of the fortress.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31822, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31827, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31824, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31824] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Narrow Hallway", 
         Vnum = 31824, 
         Sector = "inside", 
         Description = "You are walking down a small narrow hallway that is not very well\
lit. The few glowpanels that are left on the ceiling are either\
inoperative or malfunctioning. Further down the hallway, the hallway\
come to an abrupt stop and turn off. The ground you walk on is rough\
but the lack of sunlight keeps its moisture and color well. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31823, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31825, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31825] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Vnum = 31825, 
         Sector = "inside", 
         Description = "You are standing on a colder harder surface than in the hot desert. It\
is like this because of the lack of sunlight in this enormous\
fortress. The glow panels above flicker as if running out of energy.\
Directly in front of you the hallway splits off with a sharp turn\
towards the south. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31824, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31829, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31827] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Large Room", 
         Vnum = 31827, 
         Sector = "inside", 
         Description = "You walk along in a large room. The ground beneath your feet is rocky\
and yet sandy at the same time making your feet feel better for the\
ground is not as rough as straight rock. There is no lighting in this\
room but you can still make your way around. The air is cool and crisp\
making it a little easier to breathe. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31828, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31823, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31828] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A room", 
         Vnum = 31828, 
         Sector = "inside", 
         Description = "You are standing in room #31828.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31827, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31829] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Room", 
         Vnum = 31829, 
         Sector = "inside", 
         Description = "You are standing in an enormous room. There are small bags, matresses\
and all sorts of small things all over the room layed about. There\
are a few Jawas young and old roaming these hallways. This here room\
is used for more of a storage place and not for eating.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31825, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31832, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31830, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31830] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Quarters", 
         Vnum = 31830, 
         Sector = "inside", 
         Description = "Here, at night Jawas go to sleep. There are millions of tiny things\
from wires and circuits to translator droid in here. Considering the\
fact that Jawas sleep in this room it has a quite awful stench.\
Downwards there is a small opening leading to lower levels or\
something of an interesting nature. This room is very comfortable and\
safe with guard in pretty much all directions.\
 \
You may safely quit from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31829, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31831, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "bed", 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 31876, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
      }, 
      [31831] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Room", 
         Vnum = 31831, 
         Sector = "inside", 
         Description = "You are standing in what seems to be an area where extra things and stolen\
goods are kept. In the corners there are baskets full of wires and old\
goods that are probably useless to the everyday person. There is a jawa\
guard half asleep here watching over the items. This room does not seem to\
have been dug out yet was put here by nature.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31830, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31832] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance", 
         Vnum = 31832, 
         Sector = "inside", 
         Description = "You are standing in a simple room. Designed and built with ease this room\
posed no problem to the people that built it. It is extremely dark in here and\
not much is visible to the plain eye. The ground is cold and stiff and makes\
your feet feel cold as you walk over it.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31833, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31829, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31833] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Intersection", 
         Vnum = 31833, 
         Sector = "inside", 
         Description = "You are at an intersection. You may go either east or west and explore this\
vast place. In both directions the small corridors lighten up further down.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31832, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31839, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31834, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31834] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Vnum = 31834, 
         Sector = "inside", 
         Description = "You are standing in a think gloomy hallway. Towards the south you can hear\
the sounds of discussion and occasional laughter. The ground is cool and soft\
for it is not dried by the everydays suns of Tatooine. The hallway is a gloomy\
place and makes you think twice before you do anything.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31833, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31835, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31835] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "End Of Hallway", 
         Vnum = 31835, 
         Sector = "inside", 
         Description = "You reach the end of the small and tight gloomy hallway and see a few\
guardians discussing near a heavily guarded door leading into a large room\
with someone, or something, important inside of it.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31834, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31836, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31836] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Opening", 
         Vnum = 31836, 
         Sector = "inside", 
         Description = "You are standing in the beginning of the large room filled with\
guardians. Just ahead they talk to each other silently trying not to\
disturb anyone. The ground is more of a sand color and is quite soft\
and hot. Upwards there is an oppening in the roof letting sunlight in\
and momentarily blinding you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31837, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31835, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31837] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance", 
         Vnum = 31837, 
         Sector = "inside", 
         Description = "You stand before the heavily guarded entrance into the Wise Mans\
chambers. the two guardians stand up watching you closely so that you\
cause no harm to their master. The room has a large crack in the\
ceiling and it is rather hot in here. The way you see it staying in this\
fortress is not a bad idea. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31838, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31836, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31838] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Chambers", 
         Vnum = 31838, 
         Sector = "inside", 
         Description = "You are standing in the chambers of the Wise Jawa of these parts. The\
walls are poorly decorated and any signs of extra materials does not\
exist. Maybe you should try to understand him before coming to any\
conclusions for he may able to help you, or to teach you something of\
use. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31837, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31839] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Vnum = 31839, 
         Sector = "inside", 
         Description = "You are standing in a hallway leading to a stone wall. At the end of the hall\
the hallway itself curves toward the south leaving only two way to go, south\
and back from where you came.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31833, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31840] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Neighberhood Junk Pile", 
         Vnum = 31840, 
         Sector = "city", 
         Description = "You are standing on a large pile of junk. People throw things they dont need\
here just to get rid of it. But for some people this place is where they can\
get everything they need to start out. Everything from scrap metal to blasters\
are here waiting for anyone to pick them up.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31653, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31841] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance To Docking Bay 94", 
         Vnum = 31841, 
         Sector = "city", 
         Description = "You are standing in front of the infamous Dockingbay 94. From here Han Solo\
and the Millenium Falcon escaped with their newly acquired passengers for a\
trip to Alderaan. There is a large entrance into the docking bay. All the\
ground beneath you is made of stone and sand. The air is warm yet lighter\
here for it is sheltered by the docking bay.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31872, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31842, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31605, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31842] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside The Entrance To Docking Bay 92", 
         Vnum = 31842, 
         Sector = "city", 
         Description = "You are standing in front of a large sliding door. When opened you can enter\
the docking bay with ease and embark on a ship to go to other places in the\
galaxy. The door is made of metal and has blaster scorching all over it from\
when the imperials chased Han Solo and Chewbacca in a race to capture the\
droid R2-D2 and return him to Darth Vader. The ground is hard and covered with\
sand as most of this planet is and the air is rather refreshing.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31841, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31843, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31843] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside Docking Bay 92", 
         Vnum = 31843, 
         Sector = "city", 
         Description = "You are standing inside a large room that can contain a few smaller sized\
ships or one large ship like the Millenium Falcon. The ground here is covered\
with sand, but there are patches where you can see the stone floor beneath.\
The air in here is cool and refreshing and gives you a warm sensation. There\
are ships comming and leaving here continually and make it so that the air\
smells of fumes and exhaust.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31842, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31847, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31846] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 31846, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31847] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Docking Bay 92", 
         Vnum = 31847, 
         Sector = "city", 
         Description = "All around you there is only one thing. A large room stands here waiting to\
be filled with crafts and vessels. The air is crisp and cool unlike\
outside in the sun, but smells of ships. On the walls there are blaster\
bolts. Extra tools lay on the ground for a mechanic that walks around\
here.   \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31843, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
      }, 
      [31849] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hundo's Shop", 
         Vnum = 31849, 
         Sector = "inside", 
         Description = "You are standing inside a small store. Here Hundo the owner will\
gladly sell you clothing or possibly custom make some for you if the\
price is right. There is a small workstation in the corner and a\
entry to a room near the back of the store. The store is pretty run\
down but serves it's purpose.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31850, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31819, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31850] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Back Of The Shop", 
         Vnum = 31850, 
         Sector = "inside", 
         Description = "There are some small crates scattered along the floor. Most of them are empty\
but some seem to be filled with cloth and useless items. This room is very\
dirty and has a rather disturbing smell to it. The ground is smooth and cold\
being made of stone. The air is fresher in here than most parts of this city\
and it makes you want to stay here.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31849, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31851] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of A Large Keeping Area", 
         Vnum = 31851, 
         Sector = "mountain", 
         Description = "You are standing in front of some large fences. Inside these fences are kept\
many rontos, the animal that Jawas ride to go to different areas. There is a\
rather tall Jawa at the gate entry with an ionization gun ready to shoot any\
thieves or trespassers.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31819, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31852, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31852] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Ronto Keeping Area", 
         Vnum = 31852, 
         Sector = "mountain", 
         Description = "You are standing inside a large pen sourrounded by gates that are filled with\
rontos. These rontos have been trained to a certain degree so it is not\
likely that they will try to escape. The ground is rough and is filled with\
cracks for the weight of these beasts is quite surprising. The sun shines down\
all day long and makes it warm here but the rontos have adjusted to the\
temperature.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31851, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31853] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance To The Cantina.", 
         Vnum = 31853, 
         Sector = "inside", 
         Description = "You are standing in the entrance to the well known cantina. Here some of the\
filthiest and richest scum hang around. Watch your step. Mounted on the wall is\
a droid detector. For here in this cantina they do not serve their kind.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31655, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31854, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31854] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Interior Of The Cantina", 
         Vnum = 31854, 
         Sector = "inside", 
         Description = "You are facing the bar slowly. With small booths all around filled with\
people talking. Wuher slowly pours drinks for his customers being careful not\
to get hurt. The floor is poorly covered and the walls filled with blaster\
marks and other such things from fights and encounters.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31853, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31855, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31856, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31855] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Open Way", 
         Vnum = 31855, 
         Sector = "inside", 
         Description = "Most of this section is rather empty for it leads the entrance into the\
cantina. For the other part there is a few tables with some stools and chairs\
but for the most part they are empty as for people seem to have adopted a\
liking towards the booths.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31858, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31859, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31854, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31856] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Large Section Of The Cantina", 
         Vnum = 31856, 
         Sector = "inside", 
         Description = "You stand in awe as many horrible characters walk around. Some you\
recognize and some you do not. There are small tables filled with\
people all along this large area of the Cantina. The air is full of\
smoke from hookas being used all along. There is some broke glass on\
the floor. As you walk over it it cracks and makes you shiver.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31854, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31861, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31857, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31857] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Small Booth", 
         Vnum = 31857, 
         Sector = "inside", 
         Description = "You are standing inside a small booth. Here a table is mounted in the middle\
with all sorts of seats and chairs aligned around. The table is beat up with\
holes all over it, vandalized over and over. This booth has less lighting in\
it for the glow panel has shorted out and makes it relaxing with the change in\
temperature from the outdoors.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31856, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31858] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Large Double Booth", 
         Vnum = 31858, 
         Sector = "inside", 
         Description = "There are two small booths attached together here making one large booth.\
This booth is a very well known booth for here Han Solo fried Greedo the\
bounty hunter. There is a large table in the middle of the booth. The seats\
are dirty and the table even more so. There is a hookah on the table but it\
seems to be stuck to it.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31855, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31859] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Section Of The Cantina", 
         Vnum = 31859, 
         Sector = "inside", 
         Description = "This room is located on the far side of the cantina, beside one of the\
small corner booths towards the west. The floor is dirty, filled with blood in\
some places from a recent fight. The air is full of smoke as people walk\
around you, some smoking hookahs.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31855, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31860, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31860] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Very Small Booth", 
         Vnum = 31860, 
         Sector = "inside", 
         Description = "This booth is one of very small size. There is a small table in the\
middle with 2 stools set down around it. The stools are in rather\
good shape but the table is in horrible condition. The ground is\
cracked and makes you feel you will fall through the floor. The air\
is dirty and heavy here and makes you want to leave.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31859, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31861] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Section Of The Cantina", 
         Vnum = 31861, 
         Sector = "inside", 
         Description = "You are standing in an open area filled with tables. To the east the bar\
stands. Chairs all around filled with different people and different species.\
The chairs themselves are rather dirty and so most people stand. The smell\
here is not too bad but not a beautiful one neither.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31856, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "Counter", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31863, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
                  [26] = "CanLook", 
                  [23] = "BashProof", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31862, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31862] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Corner Booth", 
         Vnum = 31862, 
         Sector = "inside", 
         Description = "You are standing in a rather large both in the furthest corner of the\
cantina. The table here is very used yet in good shape compared to the others.\
The chairs on the other hand are worn down to the nub. The air here is less\
filthy for many people whom do not want to be bothered by the smoke sit\
here.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31861, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31863] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside The Bar", 
         Vnum = 31863, 
         Sector = "inside", 
         Description = "You are standing in front of Wuher, the man who serves drinks to people here.\
The beverage machine is very large and complex but seems to be efficient in\
the way it works. AS he sees you he gets angry. Maybe you should run.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "counter", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31861, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31618, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31870] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside A Large Cave", 
         Vnum = 31870, 
         Sector = "city", 
         Description = "You are inside a large cave. It has two parts to it. It is rather dark\
making the air cool. The cave protects you from the sand being\
blown by the winds. Inside this cave many womp rats seek shelter for\
the only other places are inside the city of Mos Eisley where they\
will most likely be prosecuted. The ground is hard and has little to\
no sand on it. This place is sure a break to the outdoors.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31818, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31871, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31871] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "In The Back Of A Cave", 
         Vnum = 31871, 
         Sector = "city", 
         Description = "You are in the back portion of a large cave planted into the side of\
the cliff. The air here is very cool and relaxing giving you the\
sensation of being relaxed. The ground is hard and made entirely of\
rock, without a trace of sand this cave is rather clean besides the\
womp rat mess. There is a particular smell in here from the mess but\
nothing to be concerned about if you do not stay in this cave for an\
extended period of time.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31870, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31872] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "The Bus Stop", 
         Vnum = 31872, 
         Sector = "city", 
         Description = "You are standing on a platform where the public busses land every so\
often. You can access different planets using these busses. Although\
the busses are slow they are a means of transportation. The only\
reason they are slow is because they are provided to the public for\
free. Thinking about this it makes it hard to maintain the busses\
without enough resources.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31841, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31873] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Walking Through The City", 
         Vnum = 31873, 
         Sector = "city", 
         Description = "You walk along a path inside the well known city of Mos Eisley. The\
ground here is hard yet made fully of sand. As you walk over it, it is\
hot and sharp. The wind blows in your face, sometimes bringing\
particles of sand into your face stinging you and sometimes getting\
into your eyes. The air is very warm, heated by the twin suns of the\
planet. The heat makes the air heavier and harder to breath yet you\
move on. Ahead you can see a corner that curves into a store of some\
kind. On the front it says \"Spaceport Speeders\".\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31875, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31881, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31882, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31655, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31874] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Walking Down A Side Street", 
         Vnum = 31874, 
         Sector = "city", 
         Description = "You are walking down an unused side street. The street is mostly shady\
because the buildings to the sides cover the sunlight from the\
street. The ground is softer and less dense and compact, but when the\
wind blows it hurts more for the grains of sand hit you in larger\
numbers making you ache all over. The air is hot, not as hot as the\
rest of the city because the street is covered in shade, but it is\
still hot. The air is also lighter and makes you relax as you walk.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31655, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31875] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside The Spaceport Speeders", 
         Vnum = 31875, 
         Sector = "city", 
         Description = "You are standing just inside the entrance to the spaceport speeders.\
Here you can help yourself by buying or getting a droid fixed. The\
people that work here are experienced and can offer you what is\
considered to be good prices for this planet. The atmosphere inside\
here is a bit rough with some edgy people hanging around but its not\
the end of the world. The store itself is pretty dirty with only the\
front room for helping out the customers. The intensity of the heat\
is not covered here as the air recycling system is not working to\
well.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31873, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31876] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "On A Bed", 
         Vnum = 31876, 
         Sector = "city", 
         Description = "Here in this bed hot steam rises from the cushions making your tense\
muscles relax. As they heat your body you start to feel better. The\
atmosphere is very moisturized with a lot of heat surrounding you\
also. The bed is made of a comfortable looking material but has been\
chewed at by small rodents making the bed kind of ugly looking. \
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel cure $n\
emote Vapors slowly seep into your body helping you relax.\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 31830, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31878] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Along The Bottom Of The Cliff", 
         Vnum = 31878, 
         Sector = "desert", 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31601, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31879, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31879] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Nearing The Curve In The Cliff", 
         Vnum = 31879, 
         Sector = "desert", 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31878, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31880, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31880] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "On The Curve Of The Cliff", 
         Vnum = 31880, 
         Sector = "desert", 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. As you think of that you notice some blood splatter on the sand.\
Then you look up to see a large chunk of the cliff missing as if someone\
had fell from there taking a large portion of the side of the cliff with\
them. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31879, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31881] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "On A Path In The City", 
         Vnum = 31881, 
         Sector = "city", 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it, it is hot and\
sharp. The wind blows in your face, sometimes bringing particles of sand\
into your face stinging you and sometimes getting into your eyes. The air\
is very warm, heated by the twin suns of the planet. The heat makes the\
air heavier and harder to breath yet you move on. To the north you can see\
a scattering of buildings.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6600, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31873, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31882] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "In The Depths Of The City", 
         Vnum = 31882, 
         Sector = "city", 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it it is hot and sharp.\
The wind blows in your face, sometimes bringing particles of sand into your\
face stinging you and sometimes getting into your eyes. The air is very warm,\
heated by the twin suns of the planet. The heat makes the air heavier and\
harder to breath yet you move on. To the west you see smoke coming from\
freshly cooked meat and food. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31873, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31883, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31624, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31883] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Gep's Grill", 
         Vnum = 31883, 
         Sector = "city", 
         Description = "You are standing in front of an old man. Here he makes his own food to sell\
to people passing by. He has a large selection, everything from\
banthaburgers to dewbak ribs depending on how carnivorous your appetite\
is. His booth is made of old junk probably scavenged or bought from the\
Jawas. His cooking supplies are rather disgusting to look at and when you\
think of what you are eating from it makes your stomach churn.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31882, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31898] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "An Empty Home", 
         Vnum = 31898, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 106, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [31899] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Hidden Passage In The Sewers", 
         Vnum = 31899, 
         Sector = "inside", 
         Description = "This passage looks somewhat cleaner than the reset of the sewer, suggesting\
that someone maintains it. There's no sewage flowing here, rather the ground\
is quite dry.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31904, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31900, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31900] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Common Room", 
         Vnum = 31900, 
         Sector = "inside", 
         Description = "This circular area seems to be a simple common room, complete with cheap\
furniture and some faded posters on the walls.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31899, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31901, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31902, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31909, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31901] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Kitchen", 
         Vnum = 31901, 
         Sector = "inside", 
         Description = "The kitchen bench is full of unwashed plates, glasses and cutlery. Above the\
bench are a few cupboards. Despite the mess on the bench, the place smells\
clean.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31900, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31902] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Vnum = 31902, 
         Sector = "inside", 
         Description = "The hallway has light gray walls with some lamps hanging on them. Doors\
lead to other rooms in the small complex.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31900, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31903, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31905, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31906, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31903] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Sleeping Quarters", 
         Vnum = 31903, 
         Sector = "inside", 
         Description = "There are a few cheap beds scattered around this dimly lit room. Otherwise\
it's quite empty.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31902, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31904] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Tunnel In The Sewers", 
         Vnum = 31904, 
         Sector = "underground", 
         Description = "There is a river of sewage flowing at a slow, steady pace. There's a rusty\
catwalk about a meter above it, running along one wall. Old grime is covering\
the walls. There's a nasty smell in the air, making it uncomfortable to\
breath, even for a Gamorrean.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that the south wall is a hologram.\
    endif\
endif\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31907, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31899, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 31505, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31905] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Zim's Meditation Chamber", 
         Vnum = 31905, 
         Sector = "inside", 
         Description = "In theory this is where Zim would meditate and attune himself to the Force.\
But in reality it's where he drinks all day, feeling sorry for himself.\
There's a smell of alcohol in the air.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31902, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31906] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Workshop", 
         Vnum = 31906, 
         Sector = "inside", 
         Description = "This rooms contains all facilities you need to craft just about anything.\
It's very cluttered. A few broken items that someone failed to assemble\
correctly have been tossed into a corner.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31902, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31907] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Mos Eisley Sewers", 
         Vnum = 31907, 
         Sector = "underground", 
         Description = "This is the main entrance to the sewers. There is a river of sewage flowing\
through the tunnel, giving off a strong smell. Along one wall is a catwalk\
allowing one to walk through the sewers.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31908, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31904, 
               Description = "", 
               Distance = 1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31654, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31908] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Tunnel In The Sewers", 
         Vnum = 31908, 
         Sector = "underground", 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31502, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31907, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31909] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Sparring Area", 
         Vnum = 31909, 
         Sector = "inside", 
         Description = "The sparring area is a square room about 10x10 meters. Most of the floor is\
covered by a gray mat so that people won't land too hard when they fall.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31900, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31997] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Economy Class Section", 
         Vnum = 31997, 
         Sector = "inside", 
         Description = "This section is smelly and dirty. It's probably not cleaned very often.\
The noise from the engines at the back of the shuttle contributes to making\
it an uncomfortable trip.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31999, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
      }, 
      [31998] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Business Class Section", 
         Vnum = 31998, 
         Sector = "inside", 
         Description = "This section of the shuttle is clean, quiet and comfortable. In other words\
it's the opposite of what you usually meet on this planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31999, 
               Flags = 
               {
                  [1] = "Closed", 
               }, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
      }, 
      [31999] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Tatooine Planetary Shuttle Entrance", 
         Vnum = 31999, 
         Sector = "inside", 
         Description = "The Tatooine Planetary Shuttle travels between major settlements on this\
backwater planet. The entrance area leads to the business class section in one\
direction, and the economy class section in the other. The business class\
section is behind a curtain so that the wealthier passengers won't have to\
look at the seedier elements in the back.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "curtain", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31998, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31997, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
      }, 
      [31500] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31500, 
         Sector = "desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31501, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31557, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31501] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31501, 
         Sector = "desert", 
         Description = "You are walking along the soft sand in the desert of Tatooine. Just ahead of\
you you can see the dune sea developping. Behind you the small city diminishes\
into only a spot. With every step you take the city becomes smaller and\
smaller.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31507, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31500, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31807, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31502] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel Junction", 
         Vnum = 31502, 
         Sector = "underground", 
         Description = "A junction breaks up the monotony of these tunnels. The river of sewage runs\
south, but to the north there seems to be a dry area.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31503, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31504, 
               Description = "", 
               Distance = 1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31908, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31503] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Pumping Station", 
         Vnum = 31503, 
         Sector = "underground", 
         Description = "This room is about 20x20 meters, and several meters high. It smells as bad\
as the rest of the sewers. In the middle of the room is a large piece of\
machinery enclosed in an old-fashioned wire fence.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31623, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31502, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31504] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Endless Tunnels In The Sewers", 
         Vnum = 31504, 
         Sector = "underground", 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31502, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31621, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31505] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Deep Pool Of Sewage", 
         Vnum = 31505, 
         Sector = "underground", 
         Description = "The tunnel widens into a room filled with sewage that gathers into a large\
pool. Just like the rest of the sewers, there's a rusty catwalk running along\
one wall where it's possible to walk through the area.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31506, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 31904, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31506] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Tunnel In The Sewers", 
         Vnum = 31506, 
         Sector = "underground", 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31505, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 31591, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31507] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31507, 
         Sector = "desert", 
         Description = "You are standing on a hard sandy surface, there is nothing around you unless\
you turn back. In all directions you can see but sand. The dunes in the sea\
are enourmous and grow with every step that you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31509, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31508, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31501, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31508] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31508, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31555, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31507, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31509] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31509, 
         Sector = "desert", 
         Description = "You are surrounded by sand from all possible directions. You can still see a\
glimpse of the city behind you but once you leave the city the land is yours\
to explore.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31510, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31507, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31510] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31510, 
         Sector = "desert", 
         Description = "Around you there is only sand as far as you can see. The direction is not\
noticable and civilization is far away. If you wander too far be careful\
of where you end up.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31511, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31513, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31509, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31511] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31511, 
         Sector = "desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31512, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31510, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31512] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31512, 
         Sector = "desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31511, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31513] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31513, 
         Sector = "desert", 
         Description = "The sand is soft and is still all around you. The sun is high and shining in\
your face as you repeatedly walk over endless amounts of sand. You feel\
enclosed because of their great mass. As you walk forward, with every step you\
take the sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31514, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31510, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31514] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31514, 
         Sector = "desert", 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31513, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31515, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31515] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31515, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31514, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31516, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31516] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31516, 
         Sector = "desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31515, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31517, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31517] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31517, 
         Sector = "desert", 
         Description = "You are heading down the side of a sand a dune entering another valley of\
dunes. With every step you take the sand seems to be increasing.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31516, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31518, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31518] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31518, 
         Sector = "desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31519, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31517, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31522, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31519] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31519, 
         Sector = "desert", 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31520, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31518, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31520] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31520, 
         Sector = "desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand dune\
sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31521, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31519, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31521] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31521, 
         Sector = "desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31520, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31522] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31522, 
         Sector = "desert", 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31518, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31523, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31524, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31523] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31523, 
         Sector = "desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns.  You feel\
enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31522, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31524] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31524, 
         Sector = "desert", 
         Description = "All around you is sand and you are The dunes around you are normal as you walk\
over the endless amount of dunes. The sea of dunes still surrounds you with\
overwhelming greatness. The sand has a reflective shine to it assisted by the\
sunrays of the heating suns. You feel enclosed because the dunes tower over\
you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31525, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31522, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31525] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31525, 
         Sector = "desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31526, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31524, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31526] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31526, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31527, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31525, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31527] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31527, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31528, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31536, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31526, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31528] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31528, 
         Sector = "desert", 
         Description = "You start walking over the tip of a dune an can see something in the far sea\
of dunes. All around you is sand and shiny dunes piling as high as you can\
see. As far as you can guess anything could be behind there. The towering sand\
dunes make you feel scared as you are so small and enclosed by the towering\
heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31529, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31527, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31530, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31529] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31529, 
         Sector = "desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31528, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31531, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31530] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31530, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31528, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31537, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31531] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31531, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31529, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31532, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31532] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Opening", 
         Vnum = 31532, 
         Sector = "desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31531, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31533, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31533] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Opening", 
         Vnum = 31533, 
         Sector = "desert", 
         Description = "You are traveling along the side of the large opening and can see something in\
the center of the opening.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31534, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31532, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31534] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Opening", 
         Vnum = 31534, 
         Sector = "desert", 
         Description = "You are standing infront of a very large opening in the ground that seems to\
have endless turns inside itself. To explore this hold continue to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31533, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31535, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31535] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Sarlacc", 
         Vnum = 31535, 
         Sector = "desert", 
         Description = "This is a D.T(To be edited)\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31534, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31536] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31536, 
         Sector = "desert", 
         Description = "You are in the middle of the sea of dunes and are hopelessly lost.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31527, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31537] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31537, 
         Sector = "desert", 
         Description = "You can now perceive that the object that you are walking towars is a metallic\
form of some sort.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31530, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31538, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31538] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31538, 
         Sector = "desert", 
         Description = "You are very close to the object and you can now identify it in the sand. It\
is a very old shipwreck plowed into the top of a dune.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31539, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31537, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31539] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31539, 
         Sector = "desert", 
         Description = "You are infront of the shipwreck and it seems to be habitible. To explore it\
continue north up the hatch.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31540, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31538, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31552, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31540] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hatch", 
         Vnum = 31540, 
         Sector = "inside", 
         Description = "You are inside the hatch of a ship which seems very new and cared for.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31547, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31542, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31539, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31541, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31541] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cargo Hold", 
         Vnum = 31541, 
         Sector = "inside", 
         Description = "You are standing infront of an immense cargo room containing many\
crates of items.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31540, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31542] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel", 
         Vnum = 31542, 
         Sector = "inside", 
         Description = "You are in a small room with lots of wiring and you can see the maintenance\
tunnel in front of you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31543, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31540, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31543] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Mainentance Tunnel", 
         Vnum = 31543, 
         Sector = "inside", 
         Description = "You are inside the maintenance tunnel. It is a very small space so you must\
crawl inside the tunnel to move.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31544, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31542, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31544] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel", 
         Vnum = 31544, 
         Sector = "inside", 
         Description = "You are crawling through the tunnel and can see an opening to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31543, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31545, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31545] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Secret Compartment", 
         Vnum = 31545, 
         Sector = "inside", 
         Description = "You enter a small compartment room filled with electronic equipment. It seems\
to be an interrogation room of some sort. You can see computers mounted the\
wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31546, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31544, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31546] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Death", 
         Vnum = 31546, 
         Sector = "inside", 
         Description = "You are in a room containing nothing but an assault droid in the corner.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31545, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31547] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Corridor", 
         Vnum = 31547, 
         Sector = "inside", 
         Description = "You are walking down a corridor and can see a ladder at the end of the hall.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31540, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31548, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31548] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Ladder", 
         Vnum = 31548, 
         Sector = "inside", 
         Description = "You are heading up a ladder headed towards the top portion of the ship.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31550, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31551, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31549, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31547, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31549] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Passenger Compartment", 
         Vnum = 31549, 
         Sector = "inside", 
         Description = "You enter a passenger compartment that seems to have been inhabitated.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31548, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31550] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Pilot Compartment", 
         Vnum = 31550, 
         Sector = "inside", 
         Description = "You are in the pilot compartment and you look out the viewer console to see\
sand covering it. The computer equipment seems to be usable and undamaged.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31548, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31551] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Room", 
         Vnum = 31551, 
         Sector = "inside", 
         Description = "This room contains nothing in it besides a viewer console and\
seems very strange.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31548, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31552] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31552, 
         Sector = "desert", 
         Description = "You walk around the immense shuttle to the top of a dune and continue exploring\
the dune sea of Tatooine. It tower around you fromm all directions.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31539, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31553, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31553] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31553, 
         Sector = "desert", 
         Description = "The shuttle starts to get smaller and you can see only sand in front of you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31554, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31552, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31554] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert ", 
         Vnum = 31554, 
         Sector = "desert", 
         Description = "You walk slowly and exhausted to find nothing here.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31553, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31555] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31555, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31508, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31556, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31556] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31556, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31555, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31557] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31557, 
         Sector = "desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see.\
As far as you can guess anything could be behind there. The towering\
sand dunes make you  eel scared as you are so small and enclosed by\
the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31500, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31558, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31592, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31558] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31558, 
         Sector = "desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31559, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31557, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31559] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31559, 
         Sector = "desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31560, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31565, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31558, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31560] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31560, 
         Sector = "desert", 
         Description = "The dunes you are walking on are reaching a few feet high now and you are\
approaching the greater dunes at a rather fast pace.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31561, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31559, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31561] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31561, 
         Sector = "desert", 
         Description = "You are on a large dune right now and you can see dunes for a long way.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31560, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31562, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31564, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31562] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31562, 
         Sector = "desert", 
         Description = "You are heading into the sea of dunes. Be careful where you go or you might not come back.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31563, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31561, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31563] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31563, 
         Sector = "desert", 
         Description = "The dunes under you appear to be growing with every step that you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31569, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31562, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31564] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31564, 
         Sector = "desert", 
         Description = "You are on a large dune heading further and further away from the grasp of\
civilization.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31561, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31571, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31565] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31565, 
         Sector = "desert", 
         Description = "You are walking on the rippling surface of the sand which has been\
exposed to extreme heat over the many years. The sand is very warm and\
stings your face as the wind blows it up onto your soft skin. The air\
is thick and very heavy to breathe, but living with it is something you\
accepted when you entered the desert.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31559, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31566, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31566] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31566, 
         Sector = "desert", 
         Description = "The hard sand beneath your feet is hot and you can only see the same things\
for miles to come. You are walking on the rippling surface of the sand\
which has been exposed to extreme heat over the many years. The sand is\
very warm and stings your face as the wind blows it up onto your soft\
skin. The air is thick and very heavy to breathe, but living with it\
something you accepted when you entered the desert. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31565, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31567, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31567] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31567, 
         Sector = "desert", 
         Description = "The sand is hard and hot but you continue to explore this vast area.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31566, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31568, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31568] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31568, 
         Sector = "desert", 
         Description = "The hard sand is getting softer as you walk endlessly.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31567, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31569] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31569, 
         Sector = "desert", 
         Description = "You are walking up and down endless amounts of sound shaped into great dunes\
trying to find something in this vast sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31563, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31570, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31570] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31570, 
         Sector = "desert", 
         Description = "The sand dunes seem to get bigger and higher but it only seems this way from\
exhaustion.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31569, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3301, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31571] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31571, 
         Sector = "desert", 
         Description = "The pummeling dunes are passing under your feet at an alarming rate. Yet there\
is nothing else in sight but sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31564, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31572, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31572] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31572, 
         Sector = "desert", 
         Description = "You walk down to the base of one of the largest dunes you have climbed in your\
trip through the great sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31571, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31573, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31573] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31573, 
         Sector = "desert", 
         Description = "You turn at the bottom of a dune and start climbing a rather small one.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31574, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31572, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31574] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31574, 
         Sector = "desert", 
         Description = "The dune you just climbed was a rather small one but when you look down off of\
the dune you realize you are heading down into a valley.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31575, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31577, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31573, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31575] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31575, 
         Sector = "desert", 
         Description = "You walk through the valley of sand dunes slowly. The harsh conditions are\
slowing you down gradually over the course of many minutes, hours or even days\
depending on how long you last before you find civilization.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31576, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31574, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31576] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31576, 
         Sector = "desert", 
         Description = "The sand dunes around you are making you nautious on what is still left\
to climb over.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31575, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31577] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31577, 
         Sector = "desert", 
         Description = "You are walking and walking through the treacherous sea of never ending sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31574, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31578, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31578] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31578, 
         Sector = "desert", 
         Description = "You look on but can only see endless amounts of sand but nothing else.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31577, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31582, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31579, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31579] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31579, 
         Sector = "desert", 
         Description = "The great sea starts becoming a blur after looking at the bare sands\
for many long hours now.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31578, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31580, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31580] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31580, 
         Sector = "desert", 
         Description = "The sea of dunes is making a great impression on what you think of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31579, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31581, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31581] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31581, 
         Sector = "desert", 
         Description = "You are coming up to a rise of harder sand than all around. The flat\
continues to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31580, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31590, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31582] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31582, 
         Sector = "desert", 
         Description = "The sand is plunging downwards and all of the sea seems to be heading to\
a point of falling.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31583, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31578, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31583] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31583, 
         Sector = "desert", 
         Description = "You are standing on the last dune before the entry point and can see what\
is developed inside.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31584, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31582, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31584] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31584, 
         Sector = "desert", 
         Description = "You are heading down a slope towards a rocky assortment of caves once lived\
in by the native race of this planet. The Jundland Wastes are very large and\
you can see many things from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31585, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31583, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31585] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Wastes", 
         Vnum = 31585, 
         Sector = "mountain", 
         Description = "You can see immense caves all around you and feel enclosed by the high walls\
of the caves.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31584, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31586, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31586] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Wastes", 
         Vnum = 31586, 
         Sector = "mountain", 
         Description = "You are walking down a rocky path that passes many old caves. To the south you\
see a cave that is still in pretty good condition. All around there is a\
distinct odour.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31738, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31589, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31587, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31585, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31587] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cave", 
         Vnum = 31587, 
         Sector = "mountain", 
         Description = "You are inside a dark cave which has a strong odour of some sort. The cave\
continues to the south.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31586, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31588, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
      }, 
      [31588] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cave", 
         Vnum = 31588, 
         Sector = "mountain", 
         Description = "You are in the back of a cave which seems to have been used as a living\
habitat. On the floor in the corner you are appaled when seing three dead\
Jawas. There are some blaster scars on the walls and big gashes everywhere.\
Only one thing could have done this... Sand people.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31587, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
      }, 
      [31589] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Dry Area", 
         Vnum = 31589, 
         Sector = "mountain", 
         Description = "You see many things in the rocks around you but the camp seems lifless in many\
ways. The ground is hard and dry for with the twin suns no moisture can be\
kept in the ground.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31805, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31742, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31586, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31590] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Teeth", 
         Vnum = 31590, 
         Sector = "desert", 
         Description = "D.T(to be edited)\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31581, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31591] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Junction In The Sewer Tunnels", 
         Vnum = 31591, 
         Sector = "underground", 
         Description = "The river of sewage flows into the area from the east and and northwest, and\
disappears off south.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31620, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31619, 
               Description = "", 
               Distance = 1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 31506, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31592] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31592, 
         Sector = "desert", 
         Description = "You are walking along a hardened sand path which seems to be headed to a\
cliff. The towering sand dunes make you feel scared as you are so small\
and enclosed by the towering heaps of sand. The sun is too warm and is\
getting to you as you tread towards what is to be seen.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31557, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31593, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31593] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31593, 
         Sector = "desert", 
         Description = "You are coming to the end of the path as far as you can see. The cliff is\
right ahead of you. The sand blows slowly into your face stinging your\
eyes and the rest of your face. The sun pounds down onto your back making\
you feel twice as heavy as usual. At some points down this way it gets\
steep and you slip a little landing right on your behind.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31592, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31594, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31594] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "The Cliff", 
         Vnum = 31594, 
         Sector = "desert", 
         Description = "You are standing on the edge of a cliff. It overlooks the great city of Mos\
Eisley. It is a great sight. To the east you see the path curve down the\
side of the cliff. The sand blows slowly into your face stinging your eyes\
and the rest of your face. The sun pounds down onto your back making you\
feel twice as heavy as usual. As you walk slowly down the side of the\
cliff the sand gets sharper and if you are not wearing foot gear it could\
get painful.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31593, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31595, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31597, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31595] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31595, 
         Sector = "desert", 
         Description = "Still walking along the cliff you start curving down the side of a\
mountain. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31596, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31594, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31596] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert End", 
         Vnum = 31596, 
         Sector = "desert", 
         Description = "You Curve down the bottom of the path and approach the entry to the city. \
You are walking down a hard sand path filled with sharp minerals that hurt\
your feet as you walk over the sand. The heat is driving against your back\
as the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31601, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31595, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31597] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cliff", 
         Vnum = 31597, 
         Sector = "desert", 
         Description = "You are walking along the edge of the cliff. Be careful where you go. The\
sand blows slowly into your face, stinging your eyes and the rest of your\
face. The sand flies into your eyes like annoying bugs stinging your eyes\
until the point where you are going to cry. The sun pounds down onto your\
back making you feel twice as heavy as usual.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31600, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31594, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31598, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31598] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cliff", 
         Vnum = 31598, 
         Sector = "desert", 
         Description = "You are very near the edge and should return. Be careful. As you walk down\
the edge of the cliff you see chunks of sand falling down the side of the\
cliff. Seconds later you hear the thumping of the sand hitting the ground\
far below. The sand blows slowly into your face stinging your eyes and the\
rest of your face. To the south the sand looks very unstable. It would be\
advisable not to go there.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31667, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31597, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31599, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31599] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Cliffside", 
         Vnum = 31599, 
         Sector = "desert", 
         Description = "Aaah, you are loosing your grip! Looking down would not be a good idea as for\
you're about to fall!\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31598, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31880, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
      }, 
      [31600] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31600, 
         Sector = "desert", 
         Description = "You are walking along the flat sands of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31658, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31597, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31601] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "City", 
         Vnum = 31601, 
         Sector = "city", 
         Description = "You walk into the city, it is a large places with many uses. The thugs of\
the galaxy hang around this town. You are walking down a hard sand path\
filled with sharp minerals that hurt your feet as you walk over the sand.\
The heat is driving against your back as the twin suns start burning your\
skin, the air is hot and heavy lacking moisture. As the sand blows slowly\
against your face you wish you had something to protect it as shards or\
sand start stinging against your face.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31596, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31602, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31878, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31602] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "City", 
         Vnum = 31602, 
         Sector = "city", 
         Description = "You are walking towards the inner town of Mos Eisley and towards the\
spaceport. The market is also in the vicinity of the inner city. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31601, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31603, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31603] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "City", 
         Vnum = 31603, 
         Sector = "city", 
         Description = "You are approaching an intersection which will bring you to different parts\
of the city. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31602, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31604, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31604] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of Mos Eisley Spaceport", 
         Vnum = 31604, 
         Sector = "city", 
         Description = "You are walking down the path heading directly to the Spaceport. You are\
walking through the large, scum filled city of Mos Eisley. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31603, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31653, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31605, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31605] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Pathway To Control Center", 
         Vnum = 31605, 
         Sector = "city", 
         Description = "You are walking down a path to the control center. There they watch the\
activities of vessels from all parts of the galaxy. It is not a very large\
building but is suitable for its purpose. The ground beneath your feet is\
hardening as you approach the centre and the air is continuasly heavy and\
warm.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31604, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31841, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31606, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31606] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Pathway To Control Center", 
         Vnum = 31606, 
         Sector = "city", 
         Description = "You are in front of the control center for the spaceport. Inside this building\
many descisions are made to decide who should be allowed to land on this\
planet and not to cause air havoc.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31605, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31607, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31607] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of The Control Center", 
         Vnum = 31607, 
         Sector = "city", 
         Description = "You are in front of the doors to the spaceport control center. To enter it go\
to the west. At many times of the year this building is just chained up and\
locked. Left here abandoned for the law here is not really kept up tight. The\
door is of solid wood and looks very strong.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31606, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31608, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31608] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside The Control Center", 
         Vnum = 31608, 
         Sector = "inside", 
         Description = "You are in the entrance to the control center. There are turbolifts moving\
all around you. The control tower is on the higher levels but the offices are\
here on the main level of the building. The ground is hard and seems to be\
made of stone. The air is crisp and relaxing in here for it is shielded from\
the twin suns of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31609, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31607, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31613, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31615, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31609] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Vnum = 31609, 
         Sector = "inside", 
         Description = "You are in a hallway with doors to executive offices all the way down the\
hall. There are doors placed on both sides of the hall leading into individual\
offices.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31608, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31610, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31610] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "In The Hallway", 
         Vnum = 31610, 
         Sector = "inside", 
         Description = "You walk down a narrow hallway which has not much space to each side. To your\
sides there are two offices which hold different things. The ground here is\
made of stone and the illumination is poor as for only one glowpanel remains\
to light up this entire hallway. The air is relaxing and constantly flooding\
your lungs for it is a change towards the hot and heavy air outdoors.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31611, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31609, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31612, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31611] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Conference Room", 
         Vnum = 31611, 
         Sector = "inside", 
         Description = "You are in one of the first offices ever built. It is well furnished and\
decorated. It is used for conferences because of its size but there are not\
many conferences because of the slackness of law on this planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31610, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31612] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Manager's Office", 
         Vnum = 31612, 
         Sector = "inside", 
         Description = "This office is a private office for the manager of this facility. It is a\
rather large office with many vents in it to allow the entrance of crisp air\
to enter the room. There is a large desk made from oak in the middle of the\
room stacked up with 3 pieces of paper.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31610, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31613] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Vnum = 31613, 
         Sector = "inside", 
         Description = "This hallway heads towards the rooms with the generating and computer\
equipment of the control center.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31608, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31614, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31614] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Generator Room", 
         Vnum = 31614, 
         Sector = "inside", 
         Description = "This room contains all of the power generating equipment for the spaceport.\
The generators and computer systems are all mounted on the walls.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31613, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31615] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Lobby", 
         Vnum = 31615, 
         Sector = "inside", 
         Description = "This is the lobby of the control center. In the corner a secretary takes\
messages and allows passage to the tower.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31608, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31616, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31616] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Tower", 
         Vnum = 31616, 
         Sector = "inside", 
         Description = "You are standing in the control tower. Most of the tower is run by droids and\
computers. The only living creatures are humans.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31617, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31615, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31617] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Viewscreen", 
         Vnum = 31617, 
         Sector = "inside", 
         Description = "Here you can see the whole spaceport from this large viewing screen. As you\
peer through it you can see many different species of life from all across the\
galaxy.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31616, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31618] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Upstairs In The Cantina", 
         Vnum = 31618, 
         Sector = "city", 
         Description = "The upstairs of the cantina contains a few rooms that Wuher rents out for a\
small fee. They are barren and comfortable but the locks all work so at\
least they should be a safe.\
 \
This would be a good place to rest for a while. You may quit and reenter\
the game from here.\
 \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31863, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
      }, 
      [31619] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel Blocked By A Large Grate", 
         Vnum = 31619, 
         Sector = "underground", 
         Description = "Beyond a large grate blocking the way ahead, you see a light far ahead, at the\
end of the tunnel. This is probably where the sewege goes. You probably don't\
even want to know what happens to it next.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31591, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31620] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Large Chamber", 
         Vnum = 31620, 
         Sector = "underground", 
         Description = "The tunnels widen into a large chamber. The river of sewage runs through it,\
but most of the floor is dry ground. The purpose of this chamber is not\
obvious, as it's otherwise empty.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31622, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31591, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31621] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Bend In The Tunnels", 
         Vnum = 31621, 
         Sector = "underground", 
         Description = "The tunnel bends as the river flows from the east to the southwest. There are\
some large fans embedded into the wall, probably to provide breathable air\
into the tunnels.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31504, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 31622, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31622] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "A Tunnel In The Sewers", 
         Vnum = 31622, 
         Sector = "underground", 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31620, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 31621, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31623] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Maintenance Personnel's Area", 
         Vnum = 31623, 
         Sector = "underground", 
         Description = "Even the people working down here deserve a break, and this is where they\
take it. There are some posters on the walls that otherwise has an industrial\
look to them.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31503, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31624] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Mercs For Hire", 
         Vnum = 31624, 
         Sector = "inside", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31882, 
               Description = "", 
               Distance = 1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31625, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31625] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Foyer Of Facility", 
         Vnum = 31625, 
         Sector = "inside", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31624, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31653] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Pathway Through The City", 
         Vnum = 31653, 
         Sector = "city", 
         Description = "You are walking down one of the main roads in Mos Eisley. As you walk by you\
notice a huge pile of junk where people deposit their goods. The ground you\
walk on is hard and sharp and the air continues to remain the same, heavy and\
warm. The air seems to be getting to you with every step you take but you can\
manage it, after all it's only air.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31840, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31654, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31604, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31654] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "City Road", 
         Vnum = 31654, 
         Sector = "city", 
         Description = "You are walking through the city. To explore other parts of the city\
turn down any one of the number of roads and paths. The ground here is\
hot and sandy as most of this planet is. But as it is a city it is\
placed over a flat area. The air here is hot and heavy and makes you\
slow down, but you stride on. You can feel the warmth pounding down\
on your back as you walk, but for now that is not your concern. The\
sand is blowing up into your face and when it hits you it feels as if\
someone is there slapping you. Just keep your head down and hope your\
goggles can withstand the many sand storms this planet has to deal\
with.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that there's something of interest below.\
    endif\
endif\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31655, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31653, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "manhole", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31907, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 1, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31655] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "City", 
         Vnum = 31655, 
         Sector = "city", 
         Description = "You are still continuing down the path through Mos Eisley. Just ahead\
you can see the famous cantina. If you would like to enter it veer to\
the south. But beware this place is dangerous. The ground is hot and\
sandy, the air hot and heavy and of course the heat continuously\
pelts down on you as the twin suns heat the planet. The many business\
places that are around you look interesting and some may be of use. \
There is some active life all around you and it scares you at how\
many dirty people can be in one place. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31874, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31873, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31853, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31654, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31658] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31658, 
         Sector = "desert", 
         Description = "You are standing on the harsh sand of Tatooine. You are walking on the\
rippling surface of the sand which has been exposed to extreme heat over\
the many years. The sand is very warm and stings your face as the wind\
blows it up onto your soft skin. The air is thick and very heavy to\
breathe, but living with it something you accepted when you entered the\
desert.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31659, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31600, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31659] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31659, 
         Sector = "desert", 
         Description = "You are on the hard sand of Tatooine. All around you you can see sand for\
miles unless you look back.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31660, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31658, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31660] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31660, 
         Sector = "desert", 
         Description = "You are standing on the thickening sand of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31661, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31659, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31661] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31661, 
         Sector = "desert", 
         Description = "The sand under you is still hard and glowing. As you look around all you can\
see is shiny sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31660, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31662, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31662] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31662, 
         Sector = "desert", 
         Description = "You walk on the sand of Tatooine. As you walk over it your feet sink into the\
ground leaving an everlasting mark.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31661, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31663, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31663] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31663, 
         Sector = "desert", 
         Description = "You are walking on the sand of Tatooine. The sand gradually hardens with\
every minute exposed to the sun.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31662, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31664, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31664] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31664, 
         Sector = "desert", 
         Description = "The sand under you is feeling hotter with rays of the sun beaming down on it.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31663, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31665, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31665] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31665, 
         Sector = "desert", 
         Description = "You are standing on the great sands of Tatooine. Far away in the distance you\
can see the developing sea of sand dunes.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31664, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31666, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31666] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31666, 
         Sector = "desert", 
         Description = "You are heading towards the great sand dunes, yet it is still a long journey\
to reach the sand dune sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31683, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31665, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31667] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31667, 
         Sector = "desert", 
         Description = "You are headed towards the great dune sea, leaving civilization behind.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31668, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31598, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31668] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31668, 
         Sector = "desert", 
         Description = "You are standing on the hard sand of the planet which has been exposed to\
harsh sun rays.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31669, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31667, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31669] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31669, 
         Sector = "desert", 
         Description = "The sand under you is continually getting softer every step you take towards\
the great sea of sand dunes.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31670, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31668, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31670] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31670, 
         Sector = "desert", 
         Description = "You can now clearly make out the sand dunes ahead of you, but they are still\
very far away.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31671, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31669, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31671] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31671, 
         Sector = "desert", 
         Description = "You are nearing the great sea of sand dunes with every step you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31672, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31670, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31672] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31672, 
         Sector = "desert", 
         Description = "You are approaching the sand dunes quickly now and will be there soon. With\
every step you take the sand seems to be getting softer and thicker.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31673, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31671, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31673] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31673, 
         Sector = "desert", 
         Description = "You are only but feet of in reach of the great sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31674, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31672, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31674] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31674, 
         Sector = "desert", 
         Description = "You are nearing the bottom of the first sand dune in sight. All of a sudden\
they seem much bigger than before. They also seem to be growing with every\
step you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31675, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31673, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31675] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31675, 
         Sector = "desert", 
         Description = "The great dune sea now seems so vast and enormous with every step you take.\
In all directions there are sand dunes towering around and over you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31676, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31674, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31676] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31676, 
         Sector = "desert", 
         Description = "You are surrounded by sand, the dunes extend as far as you can see.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31675, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31677, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31677] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31677, 
         Sector = "desert", 
         Description = "You walk endlessly on the sand beneath you. It towers all around and\
makes you feel enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31676, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31678, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31678] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31678, 
         Sector = "desert", 
         Description = "You are walking on a dune. It is shaped by the everlasting winds of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31677, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31679, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31679] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31679, 
         Sector = "desert", 
         Description = "The sand around you is thick and hot. In the daytime the sunrays make the\
sand extremely hot.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31678, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31680, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31680] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31680, 
         Sector = "desert", 
         Description = "You are walking on the sand dunes of the great sea. They tower around you in\
all directions.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31679, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31681, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31681] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31681, 
         Sector = "desert", 
         Description = "You are walking though the thick sand. It covers your feet and makes you feel\
enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31680, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31682] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31682, 
         Sector = "desert", 
         Description = "You walk on the sand dunes of the great sea of Tatooine. They shimmer around\
you in the daylight.\
", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31683] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31683, 
         Sector = "desert", 
         Description = "You are standing on the thickening sand of the desert.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31684, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31666, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31684] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31684, 
         Sector = "desert", 
         Description = "You are nearing the first of many sand dunes. All around you can now\
see the sand dunes of the great sea. You can already feel the wind\
blowing the sharp sand into your face. The sand is very sharp so\
wearing something on your face would be a good idea. The twin suns of\
the planet are pounding heat onto your back as you walk slowly\
through the drifts of sand. Your lungs are hurting because this heavy\
air is making their job two times harder. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31685, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31683, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31685] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31685, 
         Sector = "desert", 
         Description = "You are at the step of the first sand dune. You can enter the sand dune sea\
of Tatooine to the north, the west and the east.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31686, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31698, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31684, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31694, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31686] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31686, 
         Sector = "desert", 
         Description = "You are on one of many large sand dunes in this vast sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31687, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31685, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31687] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31687, 
         Sector = "desert", 
         Description = "All around you are large sand dunes. If you would like to stay out of the sea\
turn back now.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31688, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31686, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31688] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31688, 
         Sector = "desert", 
         Description = "You are inside a small valley of sand dunes. All around you shimmering sand\
dunes tower over you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31689, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31687, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31689] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31689, 
         Sector = "desert", 
         Description = "You are now in the great sea. The only thing you will find is this great sea\
is probably death.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31688, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31690, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31690] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31690, 
         Sector = "desert", 
         Description = "You are standing on a vast sand dune which is high enough for you to see\
clearly across the sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31689, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31691, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31691] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31691, 
         Sector = "desert", 
         Description = "You are among many sand dunes. All around you the great sand dunes tower over\
you and you now wonder what you're doing here.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31690, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31692, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31692] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31692, 
         Sector = "desert", 
         Description = "The vast sand dunes around you make you feel enclosed. For as far as you can\
see there is only sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31691, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31693, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31693] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31693, 
         Sector = "desert", 
         Description = "You are going endlessly over sand dunes wondering why you are here.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31692, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31694] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31694, 
         Sector = "desert", 
         Description = "You are standing in front of a largely spaced sea of sand dunes which seems\
never ending.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31685, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31695, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31695] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31695, 
         Sector = "desert", 
         Description = "You are leaving any hopes of finding civilization behind. The only thing you\
shall find out here is certain death.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31694, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31696, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31696] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31696, 
         Sector = "desert", 
         Description = "You are looking endlessly at the sand around you. You are but only a small\
figure compared to the sand surrounding you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31702, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31695, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31697, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31697] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31697, 
         Sector = "desert", 
         Description = "You are on a sand dune. You can glare far out into the dune sea, but all you\
can see is sand, sand and more sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31706, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31696, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31711, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31698] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31698, 
         Sector = "desert", 
         Description = "You are standing in front of a sand dune. In all directions but the one you\
came are sand dunes.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31699, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31685, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31699] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31699, 
         Sector = "desert", 
         Description = "The sand is thicker now that you are on the sand dunes. The great sea is\
greater than you thought and it might be wise to turn back now.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31700, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31698, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31700] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31700, 
         Sector = "desert", 
         Description = "You are on a sand dune. As you look the sand dunes never end in this vast sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31701, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31699, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31701] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31701, 
         Sector = "desert", 
         Description = "You are in the endless sea of sand dunes. All around you all you can see is\
sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31700, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31702] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31702, 
         Sector = "desert", 
         Description = "You are still in the endless sea of sand dunes. As you peer around yourself\
it feels hopeless in regards to where you are.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31703, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31696, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31703] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31703, 
         Sector = "desert", 
         Description = "You are in between many sand dunes. They are around you from every angle and\
you feel enclosed because of their height.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31704, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31702, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31704] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31704, 
         Sector = "desert", 
         Description = "You are on the side of a sand dune. You look around you and there are still\
no traces of life.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31705, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31703, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31705] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31705, 
         Sector = "desert", 
         Description = "All around you all you can see is sand. The towering sand dunes are all\
around you and you cannot figure out where you are.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31704, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31706] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31706, 
         Sector = "desert", 
         Description = "You are standing on soft sand. With sand dunes surrounding you, you just\
keep on walking.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31707, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31697, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31714, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31707] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31707, 
         Sector = "desert", 
         Description = "You are walking on a sand dune. All around you there are sand dunes. They\
tower high over you until you reach the top of one and start heading back\
down.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31708, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31706, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31708] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31708, 
         Sector = "desert", 
         Description = "You are standing on the top of a sand dune. And as you hope for something all\
you can see is the voyage down the side of yet another sand dune.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31709, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31707, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31718, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31709] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31709, 
         Sector = "desert", 
         Description = "You are heading down the side of a dune. Its size makes you feel tired for it\
only makes the journey longer.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31710, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31708, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31710] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31710, 
         Sector = "desert", 
         Description = "You are surrounded by sand dunes and as they tower over you, you feel\
enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31709, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31711] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31711, 
         Sector = "desert", 
         Description = "You are enlosed by many sand dunes which lay around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31697, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31712, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31712] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31712, 
         Sector = "desert", 
         Description = "You are on a sand dune. You can only see sand and formations of dunes in your range of vision.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31711, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31713, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31713] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31713, 
         Sector = "desert", 
         Description = "You are standing on the top of a sand dune. You feel bigger when you reach the\
top of a sand dune but there is always the way down to think about.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31712, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31714] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31714, 
         Sector = "desert", 
         Description = "You are walking down the side of a sand dune. All around you is sand as far\
as you can see.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31706, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31715, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31715] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31715, 
         Sector = "desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31714, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31716, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31716] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31716, 
         Sector = "desert", 
         Description = "You are on the side of a dune. It is a large dune so walking down it only to\
walk up another is starting to bother you. The dunes around you are normal as\
you walk over the endless amount of sand. The sea of rippling sand still\
surrounds you with overwhelming greatness. The sand has a reflective shine to\
it assisted by the sunrays of the heating suns. You feel enclosed because the\
dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31715, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31717, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31717] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31717, 
         Sector = "desert", 
         Description = "You are standing in between various sand dunes of all sizes and shapes.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31716, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31718] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31718, 
         Sector = "desert", 
         Description = "You are walking on soft sand. The sand dunes tower around you from all\
directions.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31708, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31719, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31719] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31719, 
         Sector = "desert", 
         Description = "You are on the side of a sand dune approaching the top.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31718, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31720, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31720] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31720, 
         Sector = "desert", 
         Description = "You are on the top edge of a sand dune. As you peer around you there is only\
sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31719, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31721, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31721] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31721, 
         Sector = "desert", 
         Description = "You are standing on the side of the sharply shaped sand dune. You are\
approaching the bottom once again so that you can continue with your\
journey.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31722, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31720, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31722] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31722, 
         Sector = "desert", 
         Description = "You are on a large sand dune. All around you can see sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31723, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31721, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31723] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31723, 
         Sector = "desert", 
         Description = "You are walking on the side of a sand dune. All around you sand dunes tower\
over you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31722, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31724, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31724] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31724, 
         Sector = "desert", 
         Description = "You are standing on the top of a sand dune. All around you there is sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31725, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31723, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31725] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31725, 
         Sector = "desert", 
         Description = "You are surrounded by sand from all sides and feel enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31724, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31726, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31726] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31726, 
         Sector = "desert", 
         Description = "You are standing on the top of a sand dune. You can see what seems to be a\
palace of some sort in the side of a sand dune just ahead.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31725, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31727, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31727] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31727, 
         Sector = "desert", 
         Description = "You are standing in front of what you now recognize as Jabba the Hutt's former\
home.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31728, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31726, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31728] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of Jabba's Palace", 
         Vnum = 31728, 
         Sector = "desert", 
         Description = "You are in front of a large door. It seems to not have been opened in years.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31729, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31727, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31729] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance To Jabba's Palace", 
         Vnum = 31729, 
         Sector = "inside", 
         Description = "You are standing in a large opening surrounded by large walls which tower\
around you. It is very dark in here and you can only continue to the north.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31730, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31728, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31730] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway In Jabba's Palace", 
         Vnum = 31730, 
         Sector = "inside", 
         Description = "You are walking down a corridor towards the what seems to be a large room.\
The air around you is thick and has a foul odor.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31731, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31729, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31731] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of Audience Chamber", 
         Vnum = 31731, 
         Sector = "inside", 
         Description = "You are standing in front of the large audience chamber. It was designed to\
hold many people including dancing girls, bands and tables full of people.\
But, since the Monks took over the palace it has not been used.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31732, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31733, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31730, 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31734, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31732] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Jabba's Dais", 
         Vnum = 31732, 
         Sector = "inside", 
         Description = "You are standing on Jabba the Hutt's former Dais. It is a very large area\
which has an exellent view of the audience chamber.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31731, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31733] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Trapdoor", 
         Vnum = 31733, 
         Sector = "inside", 
         Description = "You are standing directly on the trapdoor that was used to feed traitors to\
the Rancor which was killed by Luke Skywalker.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31800, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31731, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31798, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31734] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Audience Chambers", 
         Vnum = 31734, 
         Sector = "inside", 
         Description = "You are in the audience chambers of the palace. You can go up the stairs\
towards some of the living quarters of the monks.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31736, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31731, 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 31735, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31735] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Upper Level Entrance", 
         Vnum = 31735, 
         Sector = "inside", 
         Description = "You are on the upper level of the palace that is now inhabited by mainly\
boormir monks and spiderwalkers.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31746, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 31734, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31736] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Beside The Dais", 
         Vnum = 31736, 
         Sector = "inside", 
         Description = "You are standing beside the Dais of the former Jabba the Hutt. From here you\
cannot see very well but you are very near the Dais.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31734, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31737] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Beside The Dais", 
         Vnum = 31737, 
         Sector = "inside", 
         Description = "You are standing beside the Dais. From here you have a good view of the chambers.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31733, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31738] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Wastes", 
         Vnum = 31738, 
         Sector = "mountain", 
         Description = "You are standing on a flat rocky surface. As you peer around you see that the\
Jundland Wastes are very large.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31739, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31586, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31739] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Wastes", 
         Vnum = 31739, 
         Sector = "mountain", 
         Description = "You walk around the Jundland Wastes. All around you there is a very\
strong odour.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31740, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31738, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31740] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Wastes", 
         Vnum = 31740, 
         Sector = "mountain", 
         Description = "You stand on rock. It is a very large area you are about to explore. The odour\
is still strong around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 31741, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31739, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31741] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Wastes", 
         Vnum = 31741, 
         Sector = "mountain", 
         Description = "You can see lots of rocks and cliffs of many different shapes and sizes all\
around you. The odour is still all around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 31740, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31742] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Vague Area", 
         Vnum = 31742, 
         Sector = "mountain", 
         Description = "You are walking through the Jundland Wastes. All around you there is a\
distinct odour. Things and small creatures many dead lay here but cannot be\
taken without effort, they must not be worth anything.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31743, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31589, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [31743] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Name = "Wastes", 
         Vnum = 31743, 
         Sector = "mountain", 
         Description = "You walk down a path through the wastes. All around you the odour thickens.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 31744, 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 31742, 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
   }, 
   Mobiles = 
   {
      [31500] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This is a aged monk. He has lived here for many years and has small scars on\
his body.\
", 
         LongDescr = "A monk wanders around the palace.\
", 
         Sex = "male", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a short monk", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "monk", 
         Vnum = 31500, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 22, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 100, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31501] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         LongDescr = "A large, mean looking Jawa sits in his chair comfortably here selling liquids for journeys out into the great dune sea.\
", 
         Sex = "male", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say If you're looking for some goods...\
say ... you've come to the right place.\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "a large Jawa", 
         Description = "This jawa seems fierce and old. He has a small pouch where he keeps his money\
and change for customers willing to purchase something.\
", 
         DamRoll = 0, 
         ArmorClass = 0, 
         Name = "water jawa", 
         Vnum = 31501, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         HitRoll = 0, 
         Level = 35, 
         Weight = 0, 
         Shop = 
         {
            ProfitSell = 0, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 110, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "a large Jawa", 
         }, 
         DefaultPosition = "standing", 
         Alignment = 111, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Credits = 30000, 
      }, 
      [31502] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         LongDescr = "A large krayt stands here towering over you, staring you in the eye.\
", 
         Sex = "female", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a large krayt dragon", 
         Description = "This ferocious creature is rare but very valuble to many people throughout\
this galaxy. As it eyes you, you wonder what to do.\
", 
         DamRoll = 0, 
         ArmorClass = -170, 
         Name = "Krayt dragon", 
         Vnum = 31502, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         HitRoll = 0, 
         Level = 100, 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Credits = 0, 
      }, 
      [31503] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This creature does not look to be of one of the more appreciated kind.\
", 
         LongDescr = "A womp rat hops by.\
", 
         Sex = "male", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a small womp Rat", 
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
         Credits = 0, 
         ArmorClass = 97, 
         Name = "womp rat", 
         Vnum = 31503, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 0, 
            HitPlus = 10, 
         }, 
         DamRoll = 0, 
         Level = 1, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 0, 
            DamSizeDice = 4, 
         }, 
      }, 
      [31504] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This creature is not one of the more respectable species but manages to live\
on its own. This Jawa is a very young and untrained.\
", 
         LongDescr = "A young Jawa walks around here.\
", 
         Sex = "male", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a young Jawa", 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Young Jawa", 
         Vnum = 31504, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 3, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 115, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31505] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This is not a regular filthy creature. This Jawa is trained and armed to the\
teeth. Consider it before you attack him.\
", 
         LongDescr = "The Jawa guard stands here guarding something.\
", 
         Sex = "male", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a Jawa guard", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "jawa guard", 
         Vnum = 31505, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 25, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 150, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31506] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This scavenger is a small animal whom which no attention is regarded.\
", 
         LongDescr = "A scavenger walks around here picking up anything he can see.\
", 
         Sex = "male", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a scavenger", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Scavenger", 
         Vnum = 31506, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 3, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31507] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "You are looking at one of the ancestors of this planet. They have been here\
ever since the Dowager Queen crashed into the planet.\
", 
         LongDescr = "A moisture farmer walks around here, trying to find his destination.\
", 
         Sex = "male", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a moisture farmer", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Moisture Farmer", 
         Vnum = 31507, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 9, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 140, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31508] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This power droid is rather old and has been used for many different purposes\
over the years of its existence. Although it is still functional it is almost\
ready to be trashed. Small wires and shorted connections are sprawled out on\
different parts of the droids surface.\
", 
         LongDescr = "A power droid moves around on the ground here, humming.\
", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a square power droid", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Power droid", 
         Vnum = 31508, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 8, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31509] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This droid, when speaking, makes no sense to you. Throught its beeps and\
sounds its trying to say something to you but you have no clue what. This\
droid seems to have been used before but is in excellent shape.\
", 
         LongDescr = "A small astromech droid stands around here chirping away.\
", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "an astromech droid", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Astromech droid.", 
         Vnum = 31509, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 15, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31510] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         LongDescr = "A wise Jawa stands here ready to teach you skills.\
", 
         Sex = "undistinguished", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Description = "This Jawa has studied the ways of this world for many years, and if you pay\
attention can teach you may things of many uses. Be careful not to attack him\
for he has great powers.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a wise Jawa", 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         Name = "Wise Jawa", 
         Vnum = 31510, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         HitRoll = 0, 
         Level = 45, 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Alignment = 210, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Credits = 0, 
      }, 
      [31511] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         LongDescr = "A guardian stands here watching over The Wise One.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The guard ushers you into the chamber.\
mpechoaround $n The guard ushers $n into the chamber.\
mptransfer $n 31838\
mpat $n mpechoaround $n $n is ushered into the chamber.\
", 
               Arguments = "p yes", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "say Welcome! Are you ready to learn young apprentice?\
", 
               Arguments = "p arrives from the west.", 
               MudProgType = "act_prog", 
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a guardian", 
         Description = "This is no mere guard. He too has developed many skills and is powerful. You\
should consider attacking him, wisely.\
", 
         DamRoll = 0, 
         ArmorClass = 0, 
         Name = "Guardian", 
         Vnum = 31511, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         HitRoll = 0, 
         Level = 40, 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Credits = 0, 
      }, 
      [31512] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This species has adapted to the ways of living in the desert. He is strong in\
mind and is very vicious. Be careful what you do.\
", 
         LongDescr = "A Tusken Rauder watches you waiting for the right moment to attack.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "snarl\
swear $n\
", 
               Arguments = "70", 
               MudProgType = "all_greet_prog", 
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
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a Tusken Raider", 
         Credits = 0, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         ArmorClass = 0, 
         Name = "Sand person tusken raider", 
         Vnum = 31512, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 23, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31513] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This Tusken Raider has survived years of training and memory. To become what\
he is he cannot make any mistakes or alter in any way a story told from the\
past or he will be killed, for the Sand People believe that once told a story\
can never be altered in any way.\
", 
         LongDescr = "A Wise Tusken Raider sits here telling a story.\
", 
         Sex = "male", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a Tusken Raider storyteller.", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Sand people tusken raider Storyteller.", 
         Vnum = 31513, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 30, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31514] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This is one of the younger, wiser Sand People. He is being trained to become\
the next Storyteller of the Sand People. He just hopes in his mind that he\
will remember and remember well every story precisely.\
", 
         LongDescr = "A storyteller in training listens carefully here so that he may remember every story with precision and awe.      \
", 
         Sex = "male", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a storyteller in training", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Storyteller training.", 
         Vnum = 31514, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 25, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31515] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This creature is rather tame but when provoked can be aggressive and\
dangerous. Watch your step.\
", 
         LongDescr = "A ronto stands here towering over you.\
", 
         Sex = "male", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a ronto", 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Ronto", 
         Vnum = 31515, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 45, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31516] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This is a large furry creature which is rumored to have crushed people with\
one step. Be careful for he does not like people who are not his master.\
", 
         LongDescr = "A bantha walks around here slowly, waiting for its master.\
", 
         Sex = "male", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a bantha", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Bantha", 
         Vnum = 31516, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 35, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31517] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This mechanic is rather young, he has marks and wrinkles from work and\
possibly war. He seems to be calm and will stay away from you unless you\
need something which he may sometimes have.\
", 
         LongDescr = "A mechanic waits here to be hired.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say So ya need something fixed, eh?\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a mechanic", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Mechanic", 
         Vnum = 31517, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 14, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31518] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This Jawa is probably the tallest Jawa ever. Although he is still smaller than\
you he looks tough, and with that gun I would be scared.\
", 
         LongDescr = "A tall jawa stands here protecting his Rontos.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say So...\
say You're interested in rontos, eh?\
nudge $n\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a tall Jawa", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "tall jawa", 
         Vnum = 31518, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 19, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 140, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31519] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This man is rather old and has been working here for many years as bartender.\
Be careful though, he still has his same old edge.\
", 
         LongDescr = "Wuher stands here serving people their drinks.\
", 
         Sex = "male", 
         Weight = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "Wuher", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Wuher", 
         Vnum = 31519, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 65, 
         HitRoll = 0, 
         Shop = 
         {
            ProfitSell = 100, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 105, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "Wuher", 
         }, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31520] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Jawa", 
         Description = "A small womp rat walk around here seeking shelter.\
", 
         LongDescr = "A small womp rat walks around here.\
", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         ShortDescr = "a small womp rat", 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         Name = "small Womp Rat", 
         Vnum = 31520, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 0, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31521] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "A small thief Walks about trying to pick your pocket.\
", 
         Sex = "undistinguished", 
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
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         ShortDescr = "a small thief", 
         Credits = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         ArmorClass = 0, 
         Name = "Small Thief", 
         Vnum = 31521, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 9, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31522] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "A large thief walks about here.\
", 
         Sex = "undistinguished", 
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
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         ShortDescr = "a large thief", 
         Credits = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         ArmorClass = 0, 
         Name = "Large thief", 
         Vnum = 31522, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 11, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31523] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "A skillful thief walks about here.\
", 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Steal credits $n\
", 
               Arguments = "35", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         ShortDescr = "a skillful thief", 
         Credits = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         ArmorClass = 0, 
         Name = "skillful thief", 
         Vnum = 31523, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 17, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31524] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "A smuggler sits at a table watching.\
", 
         Sex = "undistinguished", 
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
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         ShortDescr = "a smuggler", 
         Credits = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         ArmorClass = 0, 
         Name = "Smuggler", 
         Vnum = 31524, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 18, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31525] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "An experienced smuggler waits for his contact here.\
", 
         Sex = "undistinguished", 
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
            [0] = "Npc", 
         }, 
         ShortDescr = "an experienced smuggler", 
         Credits = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
            [6] = "_06", 
            [9] = "_09", 
         }, 
         ArmorClass = 0, 
         Name = "Experienced Smuggler", 
         Vnum = 31525, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 26, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31526] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "An Ithorian drinks his liquors here.\
", 
         Sex = "undistinguished", 
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
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         ShortDescr = "an Ithorian", 
         Credits = 0, 
         AttackFlags = 
         {
            [6] = "_06", 
            [5] = "kick", 
         }, 
         ArmorClass = 0, 
         Name = "Ithorian", 
         Vnum = 31526, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 14, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31527] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "A female citizen minds her own buisness here.\
", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a female citizen", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Female citizen", 
         Vnum = 31527, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 6, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31528] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "A male citizen walks around here.\
", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a male citizen", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Male citizen", 
         Vnum = 31528, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 13, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31529] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "A Rodian sits here contemplating his navel.\
", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a Rodian", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Rodian", 
         Vnum = 31529, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 9, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31530] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "Merth walks around here.\
", 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n remove rifle\
mpforce $n give rifle merth\
mpinvis\
flee\
mpinvis\
feel heal merth\
feel heal merth\
feel heal merth\
wield blaster\
", 
               Arguments = "100", 
               MudProgType = "fight_prog", 
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Merth", 
         Credits = 0, 
         AttackFlags = 
         {
            [9] = "_09", 
            [5] = "kick", 
         }, 
         ArmorClass = 0, 
         Name = "Merth", 
         Vnum = 31530, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 103, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31531] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "Wioslea tends to her customers need.\
", 
         Sex = "undistinguished", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Business is bad, get outta here!\
grin\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "Wioslea", 
         Credits = 0, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         ArmorClass = 20, 
         Name = "Wioslea", 
         Vnum = 31531, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 6, 
            HitPlus = 320, 
         }, 
         DamRoll = 6, 
         Level = 32, 
         HitRoll = 6, 
         Shop = 
         {
            ProfitSell = 0, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "Wioslea", 
         }, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 3, 
            DamSizeDice = 4, 
         }, 
      }, 
      [31532] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "Gep Stands here selling you food for your travels.\
", 
         Sex = "undistinguished", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Hello customer.\
say I have everything you need just type \"list\".\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "Gep", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "Gep", 
         Vnum = 31532, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 1, 
         HitRoll = 0, 
         Shop = 
         {
            ProfitSell = 100, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 110, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "Gep", 
         }, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31533] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Sullustan", 
         Description = "Taller than most Sullustans, the pump maintenance mechanic appears to be\
in decent shape. His ears is also larger than usual, and his eyes are dark\
and gleaming.\
", 
         LongDescr = "A Sullustan pump maintenance mechanic seems to be goofing off here.\
", 
         Sex = "male", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [17] = "NoWander", 
         }, 
         ShortDescr = "a pump mechanic", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [25] = "sullustese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Credits = 200, 
         ArmorClass = 50, 
         Name = "Sullustan pump mechanic", 
         Vnum = 31533, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 200, 
         }, 
         DamRoll = 4, 
         Level = 20, 
         HitRoll = 4, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
      [31534] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Rodent", 
         Description = "A tatoo-rat is a small rodent with brown fur and a long tail.\
", 
         LongDescr = "A tatoo-rat seems to be searching for food.\
", 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "-- Drop loot on death\
if rand(50)\
    -- Low-quality rodent skin\
    mpoload 31533\
endif\
", 
               Arguments = "100", 
               MudProgType = "death_prog", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a tatoo-rat", 
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
         Credits = 0, 
         ArmorClass = 50, 
         Name = "tatoo-rat", 
         Vnum = 31534, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 200, 
         }, 
         DamRoll = 4, 
         Level = 20, 
         HitRoll = 4, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
      [31900] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "Zim is a middle-aged male human with silvery stripes in his dark brown hair.\
His stomach is bulging over a leather belt that has a lightsaber hanging from\
it. \
\
In his younger days, during the Clone Wars, he was an apprentice to a minor\
Jedi Master. Unfortunately Zim never quite had the talent to pass the Jedi\
trials, and when Order 66 was issued, he was somehow overlooked. Since then\
he's been in hiding, seeking to pass on what little he learned. \
", 
         LongDescr = "Zim the Failed Jedi stands here before you.\
", 
         Weight = 0, 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if rand(33)\
    hiccup\
elif rand(50)\
    say Where did I put that bottle?\
else\
    mutter\
endif\
", 
               Arguments = "3", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Code = "if ispc($n)\
if isjedi($n)\
  if level($n) >= 25\
    say There isn't much more I can teach you, $n. Find Obi-Wan Kenobi.\
    say I hear he's hiding somewhere out in the desert. I never managed to find him myself, though.\
  else\
    if rand(25)\
      say Did you know I sell practice lightsabers? I make them myself, you know.\
      emote beams proudly\
    else\
      say Why did you come here? To learn?\
      say Maybe I can teach you some basics, even if I never completed my own training.\
    endif\
  endif\
else\
  mpechoat $n $I looks you over disapprovingly.\
endif\
endif\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [17] = "NoWander", 
            [10] = "Practice", 
            [25] = "NoKill", 
            [9] = "Train", 
         }, 
         ShortDescr = "Zim the Failed Jedi", 
         HitRoll = 20, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         ArmorClass = -150, 
         Name = "zim failed jedi", 
         Vnum = 31900, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 20, 
            HitPlus = 15000, 
         }, 
         DamRoll = 20, 
         Level = 100, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "Zim the Failed Jedi", 
         }, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [31902] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "A disillusioned student is doing chores.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "-- Kitchen duty\
if inroom($i) == 31901\
    mpechoat $n $I looks at you with weary eyes.\
    mpechoaround $n $I looks at $n with weary eyes.\
    say I really hate kitchen duty.\
    sigh\
endif\
\
-- In common room, pretending to do his chores\
if inroom($i) == 31900\
    mpechoat $n Upon seeing you, $I grabs a broom and pretends $j was doing $l chores.\
endif\
\
-- Trying to assemble a lightsaber, and failing miserably\
if inroom($i) == 31906\
    mpecho $I seems to be on the verge of crying as $j fails assembling a lightsaber.\
endif\
\
-- In sleeping quarters\
if inroom($i) == 31903\
    yawn\
endif\
", 
               Arguments = "100", 
               MudProgType = "greet_prog", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a disillusioned student", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "disillusioned student", 
         Vnum = 31902, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 100, 
            HitNoDice = 10, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 1, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [31901] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "This young Jedi apprentice has long, brown hair in a low ponytail. His bland\
facial features are covered by a cropped beard. He's wearing plain clothes to\
blend in with the Mos Eisley population. Wearing Jedi robes would be very\
risky these days.\
", 
         LongDescr = "A Jedi sparring partner looks eager for action.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "-- Load up and replace lightsaber battery every now and then.\
\
if not isfight($i)\
    if ovnuminv(10324) < 1\
        mpoload 10324\
    endif\
\
    battery\
endif\
", 
               Arguments = "1", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Code = "-- This script will make sure the mob always has a working lightsaber.\
-- This way the mob can be used to grind the disarm skill.\
\
if ovnumcarry(10323) < 1\
    mpoload 10323\
endif\
\
wield lightsaber\
", 
               Arguments = "10", 
               MudProgType = "rand_prog", 
            }, 
            [3] = 
            {
               Code = "if knowsskill($n) == grip\
    if isfight($i)\
        say En guarde!\
        disarm\
    else\
        say We need to be fighting first.\
    endif\
else\
    say You'd better learn the GRIP skill first.\
endif\
", 
               Arguments = "p disarm me", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Code = "if ispc($n)\
say Welcome, I'm your sparring partner today.\
\
if knowsskill($n) == disarm\
    say You can practice your disarm skill on me. I'll fetch a new 'saber when needed.\
endif\
\
if knowsskill($n) == grip\
    say If your want to practice your grip skill, I can try disarming you when you say DISARM ME.\
endif\
endif\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [17] = "NoWander", 
            [25] = "NoKill", 
         }, 
         ShortDescr = "a Jedi sparring partner", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
         }, 
         Credits = 0, 
         ArmorClass = 50, 
         Name = "jedi sparring partner", 
         Vnum = 31901, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 10000, 
         }, 
         DamRoll = 4, 
         Level = 20, 
         HitRoll = 4, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
      [31999] = 
      {
         Height = 0, 
         Stats = 
         {
            Charisma = 0, 
            Luck = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
         }, 
         Position = "standing", 
         Race = "Human", 
         Description = "", 
         LongDescr = "Some god abandoned a newly created lastmob here.\
", 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created lastmob", 
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
         Credits = 0, 
         ArmorClass = 0, 
         Name = "lastmob", 
         Vnum = 31999, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         DamRoll = 0, 
         Level = 1, 
         HitRoll = 0, 
         Weight = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
   }, 
   Objects = 
   {
      [31500] = 
      {
         ShortDescr = "a small white candle", 
         ItemType = "light", 
         Weight = 1, 
         Name = "candle", 
         Vnum = 31500, 
         Description = "A candle rests here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 30, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
            [10] = "AntiEvil", 
         }, 
      }, 
      [31501] = 
      {
         ShortDescr = "a large brain jar with flashing lights", 
         ItemType = "container", 
         Weight = 3, 
         Name = "brain jar", 
         Vnum = 31501, 
         Description = "A large jar containing a sacred brain lies here. ", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [31502] = 
      {
         ShortDescr = "a dead Jawa", 
         ItemType = "corpse", 
         Weight = 100, 
         Name = "corpse dead Jawa", 
         Vnum = 31502, 
         Description = "A dead Jawa lies motionless on the ground here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "look jawa", 
               Description = "This jawa has been laying here for quite a while as it seems. His skin has\
\13begun decaying and you can see his bones in certain spots.", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31503] = 
      {
         ShortDescr = "a large egg", 
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 2, 
         Name = "Egg", 
         Vnum = 31503, 
         Description = "A large egg lays here, falling over every once in a while.", 
         Affects = 
         {
            [1] = 
            {
               Location = 9, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "look egg", 
               Description = "A large egg with different colors on it lays here. It would probably not be\
\13wise to take it or the mother might get mad.", 
            }, 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 97000, 
            [2] = 10000, 
            [3] = 11000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Flags = 
         {
            [12] = "NoRemove", 
         }, 
      }, 
      [31504] = 
      {
         ShortDescr = "a shiny krayt crystal", 
         ItemType = "light", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         Name = "Shiny krayt crystal", 
         Vnum = 31504, 
         Description = "A shiny krayt crystal lays here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = 5, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 9000, 
            [2] = 110, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Layers = 0, 
      }, 
      [31505] = 
      {
         ShortDescr = "a krayt pearl", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         Name = "Pearl", 
         Vnum = 31505, 
         Description = "A glowing pearl lays here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2000, 
            [2] = 6000, 
            [3] = 1100, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10000, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [31506] = 
      {
         ShortDescr = "a canteen", 
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 2, 
         Name = "Canteen", 
         Vnum = 31506, 
         Description = "A canteen rests here, waiting to be picked up.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
      }, 
      [31507] = 
      {
         ShortDescr = "a jug of water", 
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 5, 
         Name = "jug", 
         Vnum = 31507, 
         Description = "A jug of water rests here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Layers = 0, 
      }, 
      [31508] = 
      {
         ShortDescr = "a torn up circuit", 
         ItemType = "circuit", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         Name = "Circuit", 
         Vnum = 31508, 
         Description = "A torn up circuit lies here, waiting to be picked up.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 5, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
      }, 
      [31509] = 
      {
         ShortDescr = "a dirty Jawa robe", 
         ItemType = "armor", 
         Weight = 3, 
         Name = "Jawa Robe", 
         Vnum = 31509, 
         Description = "A Jawa robe is here, waiting to be taken.", 
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1345, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
            [18] = "SmallSize", 
         }, 
      }, 
      [31510] = 
      {
         ShortDescr = "some wire", 
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 2, 
         Name = "Wire", 
         Vnum = 31510, 
         Description = "Some wire is here, waiting to be taken", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
      }, 
      [31511] = 
      {
         ShortDescr = "a Jawa Blaster", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 6, 
         Name = "Jawa Blaster", 
         Vnum = 31511, 
         Description = "A elegant little blaster lays here on the ground.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7200, 
         }, 
         Layers = 0, 
      }, 
      [31512] = 
      {
         ShortDescr = "Satin's Glimmering Belt.", 
         ItemType = "armor", 
         WearFlags = 
         {
            [11] = "Waist", 
         }, 
         Weight = 1, 
         Name = "Glimmering Belt", 
         Vnum = 31512, 
         Description = "A powerful godly belt lays on the ground here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 1, 
               Modifier = 0, 
            }, 
            [2] = 
            {
               Location = 2, 
               Modifier = 10, 
            }, 
            [3] = 
            {
               Location = 3, 
               Modifier = 10, 
            }, 
            [4] = 
            {
               Location = 4, 
               Modifier = 10, 
            }, 
            [5] = 
            {
               Location = 5, 
               Modifier = 10, 
            }, 
            [6] = 
            {
               Location = 9, 
               Modifier = 20, 
            }, 
            [7] = 
            {
               Location = 18, 
               Modifier = 500, 
            }, 
            [8] = 
            {
               Location = 19, 
               Modifier = 500, 
            }, 
            [9] = 
            {
               Location = 19, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "look belt", 
               Description = "This belt glows and hums with extreme power comming from it. This object cannot be handled by a mortal mind for its powers are to great.", 
            }, 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = -259084288, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [31513] = 
      {
         ShortDescr = "a large stick", 
         ItemType = "treasure", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         Name = "Stick", 
         Vnum = 31513, 
         Description = "A large stick of the Wise Storyteller lays here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 17000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31514] = 
      {
         ShortDescr = "a large oak desk", 
         ItemType = "furniture", 
         Weight = 150, 
         Name = "large oak desk", 
         Vnum = 31514, 
         Description = "A large oak desk collects dust on the ground here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31515] = 
      {
         ShortDescr = "a mechanics belt", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 4, 
         Name = "Belt", 
         Vnum = 31515, 
         Description = "A mechanics belt lays here waiting to be used.", 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1300, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
      }, 
      [31516] = 
      {
         ShortDescr = "a mechanics hat", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 2, 
         Name = "Hat", 
         Vnum = 31516, 
         Description = "A mechanics hat collects dust on the ground.", 
         Affects = 
         {
            [1] = 
            {
               Location = 2, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 600, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
      }, 
      [31517] = 
      {
         ShortDescr = "a Jawa ionization gun", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 8, 
         Name = "Ionization Gun", 
         Vnum = 31517, 
         Description = "A Jawa ionization gun has been foolishly left behind.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 7200, 
         }, 
         Layers = 0, 
      }, 
      [31518] = 
      {
         ShortDescr = "a small hide Key", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 5, 
         Name = "key", 
         Vnum = 31518, 
         Description = "A small key crafted from hide", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31519] = 
      {
         ShortDescr = "a droid detector", 
         ItemType = "furniture", 
         Weight = 900, 
         Name = "Detector", 
         Vnum = 31519, 
         Description = "A droid detector is mounted on the wall here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31520] = 
      {
         ShortDescr = "a large drink machine", 
         ItemType = "furniture", 
         Weight = 5, 
         Name = "Drink Machine", 
         Vnum = 31520, 
         Description = "A large and complex drink machine sits here. It is used by Wuher\
\13to dispense drinks.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [31521] = 
      {
         ShortDescr = "a bed", 
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         Name = "Bed", 
         Vnum = 31521, 
         Description = "A comfortable bed lays here. Maybe laying down would not hurt you.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31522] = 
      {
         ShortDescr = "a bantha rib", 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         Name = "Bantha rib", 
         Vnum = 31522, 
         Description = "A bantha rib is here for your enjoyment.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Layers = 0, 
      }, 
      [31523] = 
      {
         ShortDescr = "a banthaburger", 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         Name = "Banthaburger", 
         Vnum = 31523, 
         Description = "A banthaburger site here ready to eat.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 15, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Layers = 0, 
      }, 
      [31524] = 
      {
         ShortDescr = "some grilled womp rat", 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         Name = "Grilled Womp Rat", 
         Vnum = 31524, 
         Description = "Some grilled womp rat is here ready to be snatched up.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 16, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Layers = 0, 
      }, 
      [31525] = 
      {
         ShortDescr = "a hologram projector", 
         ItemType = "trash", 
         Weight = 1, 
         Name = "hologram projector", 
         Vnum = 31525, 
         Description = "A hologram projector is here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "hologram projector", 
               Description = "This projector creates an illusory wall to the north to keep\
\13this passage hidden.\
\13", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31526] = 
      {
         ShortDescr = "a worn couch", 
         ItemType = "furniture", 
         Weight = 1, 
         Name = "worn couch", 
         Vnum = 31526, 
         Description = "A worn couch is here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "worn couch", 
               Description = "This couch looks very worn out. The seats look like they're made\
\13out of bantha hide, but you can't be sure.\
\13", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Layers = 0, 
      }, 
      [31527] = 
      {
         ShortDescr = "spacious seats", 
         ItemType = "furniture", 
         Weight = 1, 
         Name = "spacious seats", 
         Vnum = 31527, 
         Description = "Rows of spacious seats fill this section.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "spacious seats", 
               Description = "The seats are very comfortable, allowing even large species like Wookiees to\
stretch their legs.\
", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
      }, 
      [31528] = 
      {
         ShortDescr = "cramped seats", 
         ItemType = "furniture", 
         Weight = 1, 
         Name = "cramped seats", 
         Vnum = 31528, 
         Description = "Cramped seats fill the economy section.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cramped seats", 
               Description = "The seats are very dirty, as you might expect on Tatooine. There's no room\
to stretch your legs, even if you're a Jawa.\
", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
      }, 
      [31529] = 
      {
         ShortDescr = "a refridgerator", 
         ItemType = "container", 
         Weight = 1, 
         Name = "refridgerator fridge", 
         Vnum = 31529, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "-- This script restocks the fridge with a randomly picked item of food.\
if otypeinobj(food) < 3\
    if rand(33)\
        -- Bantha rib\
        opoload 31522\
    elif rand(50)\
        -- Banthaburger\
        opoload 31523\
    else\
        -- Grilled womp rat\
        opoload 31524\
    endif\
\
    mpecho The refridgerator makes a loud humming noise.\
endif\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Description = "A small refridgerator stands in a corner.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "refridgerator fridge", 
               Description = "The refridgerator is an older model, and gives off a fairly loud humming\
noise. It seems quite dirty on the outside. One can only hope it's better\
on the inside.\
", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Layers = 0, 
      }, 
      [31530] = 
      {
         ShortDescr = "a fake flower", 
         ItemType = "trash", 
         Weight = 1, 
         Name = "fake flower", 
         Vnum = 31530, 
         Description = "A large fake flower in a large pot.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "fake flower", 
               Description = "The flower is deep purple. The stalk is about one meter long and has green\
leaves. The pot is white, with specks of dirt on it. The flower looks kind\
of real, but smells very fake.\
", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31531] = 
      {
         ShortDescr = "the machinery", 
         ItemType = "trash", 
         Weight = 1, 
         Name = "mysterious machinery", 
         Vnum = 31531, 
         Description = "Some mysterious-looking machinery is here, making a lot of noise.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "mysterious machinery", 
               Description = "This large machine towers above you for several meters. It have many large\
tubes, valves and gauges. It seems likely that the purpose of this machinery\
is to pump the sewer somewhere, but one can't be sure.\
", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31532] = 
      {
         ShortDescr = "a jumpsuit", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Weight = 1, 
         Name = "jumpsuit", 
         Vnum = 31532, 
         Description = "A jumpsuit lies neatly folded on the ground.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "jumpsuit", 
               Description = "The jumpsuit is blue, and has multiple pockets. It full of oil and dirt, and smells\
pretty bad.\
", 
            }, 
         }, 
         Cost = 10, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Layers = 0, 
      }, 
      [31533] = 
      {
         ShortDescr = "a low-quality rodent skin", 
         ItemType = "fabric", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         Name = "low-quality rodent skin", 
         Vnum = 31533, 
         Description = "Some low-quality rodent skin is lying on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 25, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31534] = 
      {
         ShortDescr = "a plastic table", 
         ItemType = "furniture", 
         Weight = 1, 
         Name = "platic table chairs", 
         Vnum = 31534, 
         Description = "A plastic table with some chairs is here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "platic table chairs", 
               Description = "The table looks cheap and simple. The table legs are gray and the tabletop is\
white. At least it used to be white. Now it's slightly yellowed and dirty.\
", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         Layers = 0, 
      }, 
      [31535] = 
      {
         ShortDescr = "a few rusty pipes", 
         ItemType = "trash", 
         Weight = 1, 
         Name = "rusty pipes", 
         Vnum = 31535, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho The rusty pipes spew out more sewage into the river.\
", 
               Arguments = "25", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Description = "A few rusty pipes comes down from the ceiling.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
      [31999] = 
      {
         ShortDescr = "a newly created lastobject", 
         ItemType = "trash", 
         Weight = 1, 
         Name = "lastobject", 
         Vnum = 31999, 
         Description = "Some god dropped a newly created lastobject here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
      }, 
   }, 
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 31500, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31767, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Arg1 = 31500, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 0, 
         Arg2 = 100, 
      }, 
      [3] = 
      {
         Arg1 = 31501, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31756, 
         Arg2 = 100, 
      }, 
      [4] = 
      {
         Arg1 = 31501, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31756, 
         Arg2 = 100, 
      }, 
      [5] = 
      {
         Arg1 = 31500, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31756, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Arg1 = 31500, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 0, 
         Arg2 = 100, 
      }, 
      [7] = 
      {
         Arg1 = 31501, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31759, 
         Arg2 = 100, 
      }, 
      [8] = 
      {
         Arg1 = 31501, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31758, 
         Arg2 = 100, 
      }, 
      [9] = 
      {
         Arg1 = 31501, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31758, 
         Arg2 = 100, 
      }, 
      [10] = 
      {
         Arg1 = 31501, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31758, 
         Arg2 = 100, 
      }, 
      [11] = 
      {
         Arg1 = 31502, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31588, 
         Arg2 = 100, 
      }, 
      [12] = 
      {
         Arg1 = 31502, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31588, 
         Arg2 = 100, 
      }, 
      [13] = 
      {
         Arg1 = 31502, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31588, 
         Arg2 = 100, 
      }, 
      [14] = 
      {
         Arg1 = 31503, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31806, 
         Arg2 = 100, 
      }, 
      [15] = 
      {
         Arg1 = 31503, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31806, 
         Arg2 = 100, 
      }, 
      [16] = 
      {
         Arg1 = 31502, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31806, 
         Arg2 = 1, 
      }, 
      [17] = 
      {
         Arg1 = 31504, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 0, 
         Arg2 = 100, 
      }, 
      [18] = 
      {
         Arg1 = 31505, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 6, 
         Arg2 = 100, 
      }, 
      [19] = 
      {
         Arg1 = 31505, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31831, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         Arg1 = 31508, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31833, 
         Arg2 = 100, 
      }, 
      [21] = 
      {
         Arg1 = 31511, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31837, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         Arg1 = 31511, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31837, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         Arg1 = 31511, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31837, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         Arg1 = 31511, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 100, 
      }, 
      [25] = 
      {
         Arg1 = 31510, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31838, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         Arg1 = 31508, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31831, 
         Arg2 = 100, 
      }, 
      [27] = 
      {
         Arg1 = 31514, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31612, 
         Arg2 = 100, 
      }, 
      [28] = 
      {
         Arg1 = 31517, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31847, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         Arg1 = 31516, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 6, 
         Arg2 = 100, 
      }, 
      [30] = 
      {
         Arg1 = 31515, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 13, 
         Arg2 = 100, 
      }, 
      [31] = 
      {
         Arg1 = 31850, 
         MiscData = 1, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 5, 
      }, 
      [32] = 
      {
         Arg1 = 31518, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31851, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         Arg1 = 31517, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 100, 
      }, 
      [34] = 
      {
         Arg1 = 31515, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31852, 
         Arg2 = 4, 
      }, 
      [35] = 
      {
         Arg1 = 31515, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31852, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         Arg1 = 31515, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31852, 
         Arg2 = 1, 
      }, 
      [37] = 
      {
         Arg1 = 31515, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31852, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         Arg1 = 31515, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31852, 
         Arg2 = 1, 
      }, 
      [39] = 
      {
         Arg1 = 31515, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31852, 
         Arg2 = 1, 
      }, 
      [40] = 
      {
         Arg1 = 31512, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31715, 
         Arg2 = 1, 
      }, 
      [41] = 
      {
         Arg1 = 31512, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31715, 
         Arg2 = 1, 
      }, 
      [42] = 
      {
         Arg1 = 31513, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31715, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         Arg1 = 31514, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31715, 
         Arg2 = 1, 
      }, 
      [44] = 
      {
         Arg1 = 31513, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31715, 
         Arg2 = 1, 
      }, 
      [45] = 
      {
         Arg1 = 31516, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31715, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         Arg1 = 31516, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31715, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         Arg1 = 31519, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31853, 
         Arg2 = 100, 
      }, 
      [48] = 
      {
         Arg1 = 31519, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31863, 
         Arg2 = 1, 
      }, 
      [49] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31863, 
         Arg2 = 100, 
      }, 
      [50] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31871, 
         Arg2 = 12, 
      }, 
      [51] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31871, 
         Arg2 = 12, 
      }, 
      [52] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31871, 
         Arg2 = 12, 
      }, 
      [53] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31871, 
         Arg2 = 12, 
      }, 
      [54] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31871, 
         Arg2 = 12, 
      }, 
      [55] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31871, 
         Arg2 = 12, 
      }, 
      [56] = 
      {
         Arg1 = 31501, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31817, 
         Arg2 = 1, 
      }, 
      [57] = 
      {
         Arg1 = 31509, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [58] = 
      {
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10314, 
         MiscData = 1, 
      }, 
      [59] = 
      {
         Arg1 = 31504, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31861, 
         Arg2 = 1, 
      }, 
      [60] = 
      {
         Arg1 = 31527, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31861, 
         Arg2 = 1, 
      }, 
      [61] = 
      {
         Arg1 = 31507, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31861, 
         Arg2 = 1, 
      }, 
      [62] = 
      {
         Arg1 = 31526, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31862, 
         Arg2 = 1, 
      }, 
      [63] = 
      {
         Arg1 = 31521, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31862, 
         Arg2 = 1, 
      }, 
      [64] = 
      {
         Arg1 = 31524, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31862, 
         Arg2 = 1, 
      }, 
      [65] = 
      {
         Arg1 = 31525, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31857, 
         Arg2 = 1, 
      }, 
      [66] = 
      {
         Arg1 = 31506, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31857, 
         Arg2 = 1, 
      }, 
      [67] = 
      {
         Arg1 = 31527, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31854, 
         Arg2 = 2, 
      }, 
      [68] = 
      {
         Arg1 = 31523, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31854, 
         Arg2 = 1, 
      }, 
      [69] = 
      {
         Arg1 = 31525, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31854, 
         Arg2 = 2, 
      }, 
      [70] = 
      {
         Arg1 = 31528, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31854, 
         Arg2 = 1, 
      }, 
      [71] = 
      {
         Arg1 = 31526, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31856, 
         Arg2 = 2, 
      }, 
      [72] = 
      {
         Arg1 = 31528, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31856, 
         Arg2 = 2, 
      }, 
      [73] = 
      {
         Arg1 = 31529, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31858, 
         Arg2 = 1, 
      }, 
      [74] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31855, 
         Arg2 = 13, 
      }, 
      [75] = 
      {
         Arg1 = 31524, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31855, 
         Arg2 = 2, 
      }, 
      [76] = 
      {
         Arg1 = 31503, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31653, 
         Arg2 = 1, 
      }, 
      [77] = 
      {
         Arg1 = 31514, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31840, 
         Arg2 = 1, 
      }, 
      [78] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31870, 
         Arg2 = 19, 
      }, 
      [79] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31870, 
         Arg2 = 19, 
      }, 
      [80] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31870, 
         Arg2 = 19, 
      }, 
      [81] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31870, 
         Arg2 = 19, 
      }, 
      [82] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31870, 
         Arg2 = 19, 
      }, 
      [83] = 
      {
         Arg1 = 31520, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31870, 
         Arg2 = 19, 
      }, 
      [84] = 
      {
         Arg1 = 31521, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31830, 
         Arg2 = 1, 
      }, 
      [85] = 
      {
         Arg1 = 31531, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31875, 
         Arg2 = 1, 
      }, 
      [86] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31601, 
         Arg2 = 100, 
      }, 
      [87] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31602, 
         Arg2 = 100, 
      }, 
      [88] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31603, 
         Arg2 = 100, 
      }, 
      [89] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31604, 
         Arg2 = 100, 
      }, 
      [90] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31819, 
         Arg2 = 100, 
      }, 
      [91] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31821, 
         Arg2 = 100, 
      }, 
      [92] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31822, 
         Arg2 = 100, 
      }, 
      [93] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31824, 
         Arg2 = 100, 
      }, 
      [94] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31828, 
         Arg2 = 100, 
      }, 
      [95] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31829, 
         Arg2 = 100, 
      }, 
      [96] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31830, 
         Arg2 = 100, 
      }, 
      [97] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31832, 
         Arg2 = 100, 
      }, 
      [98] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31834, 
         Arg2 = 100, 
      }, 
      [99] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31835, 
         Arg2 = 100, 
      }, 
      [100] = 
      {
         Arg1 = 31504, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31837, 
         Arg2 = 100, 
      }, 
      [101] = 
      {
         Arg1 = 31503, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31601, 
         Arg2 = 20, 
      }, 
      [102] = 
      {
         Arg1 = 31503, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31602, 
         Arg2 = 20, 
      }, 
      [103] = 
      {
         Arg1 = 31503, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31603, 
         Arg2 = 20, 
      }, 
      [104] = 
      {
         Arg1 = 31503, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31604, 
         Arg2 = 20, 
      }, 
      [105] = 
      {
         Arg1 = 31503, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31653, 
         Arg2 = 20, 
      }, 
      [106] = 
      {
         Arg1 = 31503, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31840, 
         Arg2 = 20, 
      }, 
      [107] = 
      {
         Arg1 = 31532, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31883, 
         Arg2 = 1, 
      }, 
      [108] = 
      {
         Arg1 = 328, 
         MiscData = 0, 
         Command = "M", 
         Arg3 = 31863, 
         Arg2 = 1, 
      }, 
      [109] = 
      {
         Arg1 = 55, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [110] = 
      {
         Arg1 = 31900, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31905, 
         Arg2 = 1, 
      }, 
      [111] = 
      {
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10323, 
         MiscData = 1, 
      }, 
      [112] = 
      {
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10324, 
         MiscData = 1, 
      }, 
      [113] = 
      {
         Arg1 = 31525, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31899, 
         Arg2 = 1, 
      }, 
      [114] = 
      {
         Arg1 = 31526, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31900, 
         Arg2 = 1, 
      }, 
      [115] = 
      {
         Arg1 = 31527, 
         MiscData = 0, 
         Command = "O", 
         Arg3 = 31998, 
         Arg2 = 1, 
      }, 
      [116] = 
      {
         Arg1 = 31528, 
         MiscData = 0, 
         Command = "O", 
         Arg3 = 31997, 
         Arg2 = 1, 
      }, 
      [117] = 
      {
         Arg1 = 31901, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31909, 
         Arg2 = 1, 
      }, 
      [118] = 
      {
         Arg1 = 10323, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [119] = 
      {
         Arg1 = 31902, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31901, 
         Arg2 = 1, 
      }, 
      [120] = 
      {
         Arg1 = 31529, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31901, 
         Arg2 = 1, 
      }, 
      [121] = 
      {
         Arg1 = 31522, 
         MiscData = 0, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [122] = 
      {
         Arg1 = 31524, 
         MiscData = 1, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [123] = 
      {
         Arg1 = 31530, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31902, 
         Arg2 = 1, 
      }, 
      [124] = 
      {
         Arg1 = 31533, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31503, 
         Arg2 = 1, 
      }, 
      [125] = 
      {
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 32210, 
         MiscData = 1, 
      }, 
      [126] = 
      {
         Arg1 = 31532, 
         MiscData = 1, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [127] = 
      {
         Arg1 = 31531, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31503, 
         Arg2 = 1, 
      }, 
      [128] = 
      {
         Arg1 = 31534, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31502, 
         Arg2 = 2, 
      }, 
      [129] = 
      {
         Arg1 = 31534, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31502, 
         Arg2 = 2, 
      }, 
      [130] = 
      {
         Arg1 = 31534, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31623, 
         Arg2 = 1, 
      }, 
      [131] = 
      {
         Arg1 = 31623, 
         MiscData = 0, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 2, 
      }, 
      [132] = 
      {
         Arg1 = 31534, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 31908, 
         Arg2 = 3, 
      }, 
      [133] = 
      {
         Arg1 = 31535, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 31908, 
         Arg2 = 1, 
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
   ResetMessage = "", 
   LowEconomy = 29029339, 
   Filename = "tatooine.lua", 
   ResetFrequency = 0, 
}
