-- Some Hunter Spacecraft
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   LowEconomy = 31277379, 
   Name = "Some Hunter Spacecraft", 
   ResetFrequency = 0, 
   VnumRanges = 
   {
      Mob = 
      {
         First = 6400, 
         Last = 6400, 
      }, 
      Room = 
      {
         First = 6400, 
         Last = 6518, 
      }, 
      Object = 
      {
         First = 6400, 
         Last = 6401, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 6460, 
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 6400, 
         MiscData = 0, 
      }, 
      [2] = 
      {
         Command = "G", 
         Arg1 = 6401, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Command = "G", 
         Arg1 = 6400, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Command = "G", 
         Arg1 = 53, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Arg3 = 2, 
         Command = "D", 
         Arg2 = 8, 
         Arg1 = 6480, 
         MiscData = 0, 
      }, 
      [6] = 
      {
         Arg3 = 2, 
         Command = "D", 
         Arg2 = 9, 
         Arg1 = 6480, 
         MiscData = 0, 
      }, 
      [7] = 
      {
         Arg3 = 6411, 
         Command = "M", 
         Arg2 = 17, 
         Arg1 = 5190, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg3 = 6407, 
         Command = "M", 
         Arg2 = 92, 
         Arg1 = 204, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg3 = 6407, 
         Command = "M", 
         Arg2 = 92, 
         Arg1 = 204, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg3 = 6407, 
         Command = "M", 
         Arg2 = 92, 
         Arg1 = 204, 
         MiscData = 1, 
      }, 
   }, 
   Objects = 
   {
      [6400] = 
      {
         Weight = 2, 
         Layers = 0, 
         Name = "Wrist comlink", 
         Cost = 50, 
         Description = "A funny looking wristband lies here.", 
         Vnum = 6400, 
         ShortDescr = "wrist comlink", 
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
            [12] = "Wrist", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "comlink", 
      }, 
      [6401] = 
      {
         Weight = 2, 
         Layers = 0, 
         Name = "sniper scope", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Description = "A small scope is in the dirt here.", 
         Vnum = 6401, 
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         ItemType = "scope", 
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
            [1] = 
            {
               Keyword = "sniper scope", 
               Description = "This small scope looks as if it could improve your aim buy quite a bit\
\13", 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Cost = 1000, 
         ShortDescr = "A sniper scope.", 
      }, 
   }, 
   Rooms = 
   {
      [6400] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6401, 
            }, 
         }, 
         Name = "Boarding Slave 1", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Description = "You stand upon in the boarding hatch of on of the most famous\
ships of all time.  A bounty hunters Customized KDY Firespray\
built for speed and firepower.  As you enter you must pass through \
a series of security detectors and camaras.\
", 
         Vnum = 6400, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6401] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6402, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6404, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6400, 
            }, 
            [4] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6403, 
            }, 
            [5] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6406, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "Having passed through the various security checks you \
finally stand in the hallway of slave 1.  This ships odd \
design means things arn't normally where they should be.  \
A latter leads up into the bridge, to the north you see a \
cargo hold and south of you looks like someones living area.\
A small hatch in the floor rumbles with the vibrations from \
the engines.\
", 
         Vnum = 6401, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6402] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6401, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6405, 
            }, 
         }, 
         Name = "Cargo Hold", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This ship has a fairly small cargo hold.  Most of the old \
holds area has been taken over in the modifications of the\
engines and shields.  There is still room for about a \
months worth of supplys for the ships single crew memeber.\
", 
         Vnum = 6402, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6403] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6401, 
            }, 
         }, 
         Name = "Bridge", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The bridge of slave 1 is very cramped, however everything is within easy\
reach of the comfortable captains chair.  all systems may be monitored\
from this room including prisoner status and even the boading area. \
Controls for various  modifications made on the ship are all located here.\
", 
         Vnum = 6403, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6404] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6401, 
            }, 
         }, 
         Name = "Crew Quarters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "Like most of the rest of the ship even the crew quaters\
have been taken over with ship modifications.  The area \
that use to sleep 6 comfortably now holds room for 1 and \
in a pinch sleep up to 4 people.\
", 
         Vnum = 6404, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cThe warmth of the bacta restores\
you.\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6405] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6402, 
            }, 
         }, 
         Name = "Prisoner Hold", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This modified cargo hold is used for the ships main cargo,\
bounties.  Force shielded and reinforced cages line the \
walls.  Six seperate cages are in the room each with room\
for 1 person.\
", 
         Vnum = 6405, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6406] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6401, 
            }, 
         }, 
         Name = "Engine Room", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "In this room you can clearly see 2 of the largest modifications\
to this ship the old engine and generator have been replaced by\
the massive KES-F31 drive engine and XF-16 power generator.\
Giving this large ship the speed and agility of a y-wing.\
", 
         Vnum = 6406, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6407] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "somewhere", 
               Keyword = "olympus", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6408, 
            }, 
         }, 
         Name = "Boarding Bay", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Description = "You stand in the turbolift of one of the greatest starships\
ever made a CR90 Corellian \"Blockade Runner\". This ship\
is known for its ability to be easily modified to fit its \
current role in a campaign, anything from troop transport\
to front line fighter is in this ships awsome repetoir.\
", 
         Vnum = 6407, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6408] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6419, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6433, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6422, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6438, 
            }, 
            [5] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6407, 
            }, 
            [6] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6456, 
            }, 
         }, 
         Name = "Stairwell", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6408, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6409] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6420, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6412, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6423, 
            }, 
         }, 
         Name = "Stairwell", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6409, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6410] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6421, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6447, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6456, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6442, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6410, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6411] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6424, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6429, 
            }, 
         }, 
         Name = "Kitchen", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The level one hallway is built for war not plesentry so  \
it is bare metal walls and very little show, a metal walkway\
with emergancy lighting along it lead around this level.\
", 
         Vnum = 6411, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6412] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6458, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6435, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6409, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6412, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6413] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6414, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6428, 
            }, 
         }, 
         Name = "Crew recreation center", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6413, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6414] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6429, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6413, 
            }, 
         }, 
         Name = "Crew recreation center", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6414, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6415] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6439, 
            }, 
         }, 
         Name = "Crew Barracks", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6415, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6416] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6439, 
            }, 
         }, 
         Name = "Crew Barracks", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6416, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6417] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6432, 
            }, 
         }, 
         Name = "A new, nonoperational turret", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6417, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6418] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6432, 
            }, 
         }, 
         Name = "A new, nonoperational turret", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6418, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6419] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6420, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6436, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6408, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6437, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6419, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6420] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6409, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6419, 
            }, 
            [3] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6435, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6420, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6421] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6423, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6445, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6410, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6451, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6421, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6422] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6408, 
            }, 
         }, 
         Name = "Main engineering", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6422, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6423] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6427, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6421, 
            }, 
            [3] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6409, 
            }, 
            [4] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6429, 
            }, 
         }, 
         Name = "Stairwell", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6423, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6424] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6411, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6428, 
            }, 
         }, 
         Name = "Mess Hall", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6424, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6425] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6426, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6456, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6431, 
            }, 
         }, 
         Name = "Stairwell", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6425, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6426] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6428, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6450, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6425, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6449, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6426, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6427] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6423, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6444, 
            }, 
         }, 
         Name = "The main cargo bay", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Description = "", 
         Vnum = 6427, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6428] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6429, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6424, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6426, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6413, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6428, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6429] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6444, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6411, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6428, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6414, 
            }, 
            [5] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6423, 
            }, 
            [6] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6440, 
            }, 
         }, 
         Name = "Stairwell", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6429, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6430] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6409, 
            }, 
         }, 
         Name = "Stairwell", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6430, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6431] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6432, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6425, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6431, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6432] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6439, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6417, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6431, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6418, 
            }, 
            [5] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6441, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6432, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6433] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6408, 
            }, 
         }, 
         Name = "A small cargo bay", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Description = "", 
         Vnum = 6433, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6434] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6458, 
            }, 
         }, 
         Name = "Turret", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6434, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6435] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6412, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6420, 
            }, 
         }, 
         Name = "Turret", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6435, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6436] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6419, 
            }, 
         }, 
         Name = "Ship docking port", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6436, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6437] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6419, 
            }, 
         }, 
         Name = "Ship docking port", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6437, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6438] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6408, 
            }, 
         }, 
         Name = "A small cargo bay", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Description = "", 
         Vnum = 6438, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6439] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6440, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6415, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6432, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6416, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6439, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6440] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6439, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6429, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6440, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6441] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6432, 
            }, 
         }, 
         Name = "Ventral-mounted turbolaser", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6441, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6442] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6410, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6443, 
            }, 
         }, 
         Name = "Second Officer's Quarters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6442, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6443] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6442, 
            }, 
         }, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6443, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6444] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6429, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6427, 
            }, 
         }, 
         Name = "Lower cargo bay access", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6444, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6445] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6446, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6421, 
            }, 
         }, 
         Name = "First Officer's Quarters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6445, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6446] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6445, 
            }, 
         }, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6446, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6447] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6448, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6410, 
            }, 
         }, 
         Name = "Engineer's Quarters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6447, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6448] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6447, 
            }, 
         }, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6448, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6449] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6426, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6453, 
            }, 
         }, 
         Name = "A large workshop", 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6449, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6450] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6454, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6426, 
            }, 
         }, 
         Name = "A large workshop", 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6450, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6451] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6421, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6452, 
            }, 
         }, 
         Name = "Captains Quaters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6451, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6452] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6451, 
            }, 
         }, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6452, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6453] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6449, 
            }, 
         }, 
         Name = "A dark refinery", 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6453, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6454] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6450, 
            }, 
         }, 
         Name = "A dark refinery", 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6454, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6455] = 
      {
         Exits = 
         {
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6455, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6456] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6410, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6408, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6425, 
            }, 
         }, 
         Name = "Stairwell", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6456, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6457] = 
      {
         Exits = 
         {
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6457, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6458] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6412, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6434, 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6460, 
            }, 
            [4] = 
            {
               Direction = "northwest", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6459, 
            }, 
         }, 
         Name = "The bridge", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6458, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6459] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6460, 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6458, 
            }, 
         }, 
         Name = "Pilot's chair", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6459, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6460] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6459, 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6458, 
            }, 
         }, 
         Name = "Copilot's chair", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         Description = "The walls of this room are painted a mild blue. A large viewport is located\
on the south  wall allowing passengers to look out into space. A small\
wetbar and fridge are here for  the passengers convienince as well as a\
com to the kitchen.  \
", 
         Vnum = 6460, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6461] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6462, 
            }, 
         }, 
         Name = "Hatchway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6461, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6462] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6463, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6464, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6461, 
            }, 
         }, 
         Name = "Main Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6462, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6463] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6465, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6471, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6462, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6470, 
            }, 
         }, 
         Name = "Main Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6463, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6464] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6462, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6472, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6467, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6468, 
            }, 
            [5] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6466, 
            }, 
         }, 
         Name = "Main Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6464, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6465] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6463, 
            }, 
         }, 
         Name = "Cockpit", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The cockpit of this ship is a comfortable  2 seater although everything can\
easily be controlled by a single pilot. A modified YV-666 freighter this\
ship has more than enough power to run with the fighters, and enough\
shielding and weapons to fight with small cruisers.\
", 
         Vnum = 6465, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6466] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6464, 
            }, 
         }, 
         Name = "Engine Room", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The powerhouse of this small freigheter is located here. powering both\
shields and Engines from this room make maintenance easy. The modified\
engine allows this ship extra speed beyoynd what a normal frieghter can\
handle.\
", 
         Vnum = 6466, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6467] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6464, 
            }, 
         }, 
         Name = "Crew Quarters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "A sparse living quarters is here.  Designed to be use when travlling on the\
hunt this ship has very little for creature comforts and is more bare bone\
to make you finish all that much sooner. \
", 
         Vnum = 6467, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6468] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6464, 
            }, 
         }, 
         Name = "Laser Turret", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "A small bucket seat pivots inside a gyroscopic frame.  In front of the seat\
is the butterfly grip of a laser turret. Targeting controls light up a\
touch monitor in front of the seat. \
", 
         Vnum = 6468, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6469] = 
      {
         Exits = 
         {
         }, 
         Name = "Cargo Hold", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6469, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6470] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6463, 
            }, 
         }, 
         Name = "Prisoner Room", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out. \
", 
         Vnum = 6470, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6471] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6463, 
            }, 
         }, 
         Name = "Prisoner Room", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out.\
", 
         Vnum = 6471, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6472] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6464, 
            }, 
         }, 
         Name = "Training Room", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "Around this room is various training equipment, designed for helping to\
keep in top form or even help in the recovery of wounds, this is the ideal\
place to stay in shape. \
", 
         Vnum = 6472, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6473] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6474, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6475, 
            }, 
         }, 
         Name = "Boarding Ramp", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This boarding ramp leads inside the modified YV-667 freighter, The Gleaming\
Fang.  The entrance to the cockpit is to the north, and the rest of the\
ship is down the hallway south.\
", 
         Vnum = 6473, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6474] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6473, 
            }, 
         }, 
         Name = "Cockpit", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The cockpit is quite spacious. There is a pilot and co-pilot seat, but the\
control panel is modified to be easily accessible to the pilot. The\
controls have been rebuilt, so a Trandoshan pilot can manipulate them.\
", 
         Vnum = 6474, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6475] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6473, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6484, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6478, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6488, 
            }, 
            [5] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6476, 
            }, 
            [6] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6477, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the galley, and the door to the east leads to the\
'fresher station'. A small ladder provides access to the dorsal and\
ventral turrets, and the hallway continues south.\
", 
         Vnum = 6475, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6476] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6475, 
            }, 
         }, 
         Name = "Dorsal Turret", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This is the dorsal turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         Vnum = 6476, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6477] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6475, 
            }, 
         }, 
         Name = "Ventral Turret", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Description = "This is the ventral turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         Vnum = 6477, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6478] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6475, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6489, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6479, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6483, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the Captain's quarters. The door to the east leads to\
the crew quarters, and the hallway continues south. \
", 
         Vnum = 6478, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6479] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6478, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6480, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6485, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls are regular intervals. A ladder\
leads down to the large cargo bay, and holding cells are to the south.\
", 
         Vnum = 6479, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6480] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6479, 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 20504, 
               Description = "", 
               DestinationVnum = 6482, 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 20504, 
               Description = "", 
               DestinationVnum = 6481, 
            }, 
         }, 
         Name = "Skinning Room", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This room has all the equipment needed to skin and preserve hides. There is\
a long gleaming table in the middle of the room.  A groove runs down one\
side of the table to drain blood and other fluids into a waste disposal\
unit. A dipping tank for curing hides is a one end of the table, and there\
is a skinning apparatus mounted above the table. There are two holding\
cells here. The main hallway is to the north.\
", 
         Vnum = 6480, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6481] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 20504, 
               Description = "", 
               DestinationVnum = 6480, 
            }, 
         }, 
         Name = "Holding Cell #1", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle. \
", 
         Vnum = 6481, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6482] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 20504, 
               Description = "", 
               DestinationVnum = 6480, 
            }, 
         }, 
         Name = "Holding Cell #2", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle.\
", 
         Vnum = 6482, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6483] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6478, 
            }, 
         }, 
         Name = "Captain's Quarters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "There is a large bunk on one side of the captain's room. On the other side\
of the room, there is a large storage locker. A small desk littered with\
paperwork is against the wall between the bunk and the locker.\
", 
         Vnum = 6483, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "25 ", 
               Code = "mpecho The bacta heals your wounds.\
feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6484] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6475, 
            }, 
         }, 
         Name = "The Refresher", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This is a standard refresher unit. There is just barely enough room inside\
for a Trandoshan.\
", 
         Vnum = 6484, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "70", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cYou wash around your troubles.\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 1, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6485] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6487, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6479, 
            }, 
         }, 
         Name = "Cargo Bay", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The stock cargo bay on a YV-667 is quite large, but a large portion of this\
cargo bay has been converted into a landing bay for a scout craft. There\
is a ladder leading up to the main hallway and the engine room is to the\
south.\
", 
         Vnum = 6485, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6486] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6498, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6494, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6495, 
            }, 
         }, 
         Name = "Lounge", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "the lounge of this ship serves dual purpose, it is ment for the\
entertainment of guests as well as for meetings between the captain and\
crew or prospective employers. \
", 
         Vnum = 6486, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6487] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6485, 
            }, 
         }, 
         Name = "Engine Room", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The engines on this ship have been heavily upgraded to provide  energy to\
the power draining modifications that have been added to the ship. There\
are blinking readouts a shipboard com station here. There is a small tool\
locker mounted on one bulkhead. \
", 
         Vnum = 6487, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6488] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6475, 
            }, 
         }, 
         Name = "Galley", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The ship's galley may be small, but it is efficiently designed. There is a\
sink and a small food-prep station here. Food storage compartments have\
been mounted overhead to save space. There is a small table and four\
chairs in the middle of the room. \
", 
         Vnum = 6488, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "food ration", 
               Code = "mpoload 10313\
mpecho A packaged ration pops from the station.\
drop all\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6489] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6478, 
            }, 
         }, 
         Name = "Crew Quarters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Description = "This room has three small bunks attached to the far bulkhead. There are\
also three small storage lockers mounted to the northern bulkhead.\
", 
         Vnum = 6489, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6490] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6489, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6475, 
            }, 
         }, 
         Name = "Crew Quaters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "A spare crew quarters is located here. Rows of bunks with foot lockers line\
the walls and a door on the noth wall leads into the captains quarters.\
", 
         Vnum = 6490, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6491] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6492, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6476, 
            }, 
         }, 
         Name = "Passenger Quaters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters.\
", 
         Vnum = 6491, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6492] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6491, 
            }, 
         }, 
         Name = "Passenger Quaters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters. \
", 
         Vnum = 6492, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6493] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6478, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6499, 
            }, 
         }, 
         Name = "Bridge Hatch", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "A small hatchway leads from the main ship into the cockpit of the ship.\
this is one of the many changes made fron the old YV-1300 into this newer\
model. Micro-electronics has allowed for minaturizatin of controlls and\
systems  making this hallway an ideal like to all the ships systems.\
", 
         Vnum = 6493, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6494] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6486, 
            }, 
         }, 
         Name = "Top Turrent", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         Vnum = 6494, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6495] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6486, 
            }, 
         }, 
         Name = "Bottom Turrent", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         Vnum = 6495, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6496] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6499, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6482, 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6474, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         Vnum = 6496, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6497] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6498, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6497, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6498] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6486, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6497, 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6499, 
            }, 
            [4] = 
            {
               Direction = "southwest", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6476, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         Vnum = 6498, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6499] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6493, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6496, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6473, 
            }, 
            [4] = 
            {
               Direction = "southeast", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6498, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "The hallway is a simple grey metel with various emergency lighting around.\
It leads in a circular path around the ship.\
", 
         Vnum = 6499, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6500] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6501, 
            }, 
         }, 
         Name = "Cockpit", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6500, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6501] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6502, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6512, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6500, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6514, 
            }, 
            [5] = 
            {
               Direction = "down", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6513, 
            }, 
            [6] = 
            {
               Direction = "northwest", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6515, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6501, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6502] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6503, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6505, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6501, 
            }, 
         }, 
         Name = "Spice Lady Lounge", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6502, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6503] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6502, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6504, 
            }, 
         }, 
         Name = "Equipment Bay", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6503, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6504] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6503, 
            }, 
         }, 
         Name = "Engineroom", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6504, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6505] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6507, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6506, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6502, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6505, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6506] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6505, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6508, 
            }, 
         }, 
         Name = "Sleeping Quarters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6506, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6507] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6509, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6505, 
            }, 
         }, 
         Name = "Cargo Bay", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6507, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6508] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6506, 
            }, 
         }, 
         Name = "Sleeping Quarters", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Description = "", 
         Vnum = 6508, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6509] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6510, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6507, 
            }, 
         }, 
         Name = "Cargo bay", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6509, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6510] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6509, 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6511, 
            }, 
         }, 
         Name = "Cargo Bay", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6510, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6511] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6512, 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6510, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6511, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6512] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6511, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6501, 
            }, 
            [3] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6517, 
            }, 
            [4] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6516, 
            }, 
         }, 
         Name = "Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6512, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6513] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6501, 
            }, 
         }, 
         Name = "Smuggler's Compartment", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6513, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6514] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6501, 
            }, 
         }, 
         Name = "Boarding Ramp", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6514, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6515] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "southeast", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6501, 
            }, 
         }, 
         Name = "Hanger", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6515, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6516] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6512, 
            }, 
         }, 
         Name = "Turret", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6516, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6517] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 6512, 
            }, 
         }, 
         Name = "Turret", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Description = "", 
         Vnum = 6517, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [6518] = 
      {
         Exits = 
         {
         }, 
         Name = "Spice Lady A-wing", 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 6518, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "field", 
      }, 
   }, 
   Mobiles = 
   {
      [6400] = 
      {
         Weight = 0, 
         Credits = 0, 
         Name = "Weapons Dealer", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A shadey looking character is here.\
", 
         Shop = 
         {
            KeeperShortDescr = "Weapons Dealer", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 50, 
            ProfitBuy = 150, 
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
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Constitution = 0, 
            Dexterity = 0, 
         }, 
         Height = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Level = 1, 
         Vnum = 6400, 
         DamRoll = 0, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         ShortDescr = "Weapons Dealer", 
      }, 
   }, 
   Filename = "hunter_ships.lua", 
   Author = "Bleeds", 
   FileFormatVersion = 1, 
   LevelRanges = 
   {
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
   ResetMessage = "", 
   HighEconomy = 0, 
}
