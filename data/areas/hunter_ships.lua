-- Some Hunter Spacecraft
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   FileFormatVersion = 1, 
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
   Author = "Bleeds", 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 6460, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 0, 
         Arg1 = 6400, 
      }, 
      [2] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6401, 
      }, 
      [3] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6400, 
      }, 
      [4] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
      }, 
      [5] = 
      {
         Arg3 = 2, 
         Arg2 = 8, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 6480, 
      }, 
      [6] = 
      {
         Arg3 = 2, 
         Arg2 = 9, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 6480, 
      }, 
      [7] = 
      {
         Arg3 = 6411, 
         Arg2 = 17, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 5190, 
      }, 
      [8] = 
      {
         Arg3 = 6407, 
         Arg2 = 92, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 204, 
      }, 
      [9] = 
      {
         Arg3 = 6407, 
         Arg2 = 92, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 204, 
      }, 
      [10] = 
      {
         Arg3 = 6407, 
         Arg2 = 92, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 204, 
      }, 
   }, 
   Objects = 
   {
      [6400] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Weight = 2, 
         Layers = 0, 
         ActionDescription = "", 
         ShortDescr = "wrist comlink", 
         Name = "Wrist comlink", 
         Vnum = 6400, 
         ExtraDescriptions = 
         {
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
         Cost = 50, 
         ItemType = "comlink", 
         Description = "A funny looking wristband lies here.", 
      }, 
      [6401] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 2, 
         Layers = 0, 
         ActionDescription = "", 
         ShortDescr = "A sniper scope.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Name = "sniper scope", 
         Description = "A small scope is in the dirt here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This small scope looks as if it could improve your aim buy quite a bit\
\13", 
               Keyword = "sniper scope", 
            }, 
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
         Cost = 1000, 
         ItemType = "scope", 
         Vnum = 6401, 
      }, 
   }, 
   Rooms = 
   {
      [6400] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6401, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Boarding Slave 1", 
         Vnum = 6400, 
         Tunnel = 0, 
         Description = "You stand upon in the boarding hatch of on of the most famous\
ships of all time.  A bounty hunters Customized KDY Firespray\
built for speed and firepower.  As you enter you must pass through \
a series of security detectors and camaras.\
", 
         Sector = "city", 
      }, 
      [6401] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6402, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6404, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6400, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6403, 
            }, 
            [5] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6406, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6401, 
         Tunnel = 0, 
         Description = "Having passed through the various security checks you \
finally stand in the hallway of slave 1.  This ships odd \
design means things arn't normally where they should be.  \
A latter leads up into the bridge, to the north you see a \
cargo hold and south of you looks like someones living area.\
A small hatch in the floor rumbles with the vibrations from \
the engines.\
", 
         Sector = "city", 
      }, 
      [6402] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6401, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6405, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Cargo Hold", 
         Vnum = 6402, 
         Tunnel = 0, 
         Description = "This ship has a fairly small cargo hold.  Most of the old \
holds area has been taken over in the modifications of the\
engines and shields.  There is still room for about a \
months worth of supplys for the ships single crew memeber.\
", 
         Sector = "city", 
      }, 
      [6403] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6401, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Bridge", 
         Vnum = 6403, 
         Tunnel = 0, 
         Description = "The bridge of slave 1 is very cramped, however everything is within easy\
reach of the comfortable captains chair.  all systems may be monitored\
from this room including prisoner status and even the boading area. \
Controls for various  modifications made on the ship are all located here.\
", 
         Sector = "city", 
      }, 
      [6404] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6401, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Crew Quarters", 
         Vnum = 6404, 
         Tunnel = 0, 
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
         Description = "Like most of the rest of the ship even the crew quaters\
have been taken over with ship modifications.  The area \
that use to sleep 6 comfortably now holds room for 1 and \
in a pinch sleep up to 4 people.\
", 
         Sector = "city", 
      }, 
      [6405] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6402, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Prisoner Hold", 
         Vnum = 6405, 
         Tunnel = 0, 
         Description = "This modified cargo hold is used for the ships main cargo,\
bounties.  Force shielded and reinforced cages line the \
walls.  Six seperate cages are in the room each with room\
for 1 person.\
", 
         Sector = "city", 
      }, 
      [6406] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6401, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Engine Room", 
         Vnum = 6406, 
         Tunnel = 0, 
         Description = "In this room you can clearly see 2 of the largest modifications\
to this ship the old engine and generator have been replaced by\
the massive KES-F31 drive engine and XF-16 power generator.\
Giving this large ship the speed and agility of a y-wing.\
", 
         Sector = "city", 
      }, 
      [6407] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "somewhere", 
               Keyword = "olympus", 
               Key = -1, 
               DestinationVnum = 6408, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Name = "Boarding Bay", 
         Vnum = 6407, 
         Tunnel = 0, 
         Description = "You stand in the turbolift of one of the greatest starships\
ever made a CR90 Corellian \"Blockade Runner\". This ship\
is known for its ability to be easily modified to fit its \
current role in a campaign, anything from troop transport\
to front line fighter is in this ships awsome repetoir.\
", 
         Sector = "city", 
      }, 
      [6408] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6419, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6433, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6422, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6438, 
            }, 
            [5] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6407, 
            }, 
            [6] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6456, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Stairwell", 
         Vnum = 6408, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6409] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6420, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6412, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6423, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Stairwell", 
         Vnum = 6409, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6410] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6421, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6447, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6456, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6442, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6410, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6411] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6424, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6429, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Kitchen", 
         Vnum = 6411, 
         Tunnel = 0, 
         Description = "The level one hallway is built for war not plesentry so  \
it is bare metal walls and very little show, a metal walkway\
with emergancy lighting along it lead around this level.\
", 
         Sector = "city", 
      }, 
      [6412] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6458, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6435, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6409, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6412, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6413] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6414, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6428, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Crew recreation center", 
         Vnum = 6413, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6414] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6429, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6413, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Crew recreation center", 
         Vnum = 6414, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6415] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6439, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Crew Barracks", 
         Vnum = 6415, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6416] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6439, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Crew Barracks", 
         Vnum = 6416, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6417] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6432, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "A new, nonoperational turret", 
         Vnum = 6417, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6418] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6432, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "A new, nonoperational turret", 
         Vnum = 6418, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6419] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6420, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6436, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6408, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6437, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6419, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6420] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6409, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6419, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6435, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6420, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6421] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6423, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6445, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6410, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6451, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6421, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6422] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6408, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Main engineering", 
         Vnum = 6422, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6423] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6427, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6421, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6409, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6429, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Stairwell", 
         Vnum = 6423, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6424] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6411, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6428, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Mess Hall", 
         Vnum = 6424, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6425] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6426, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6456, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6431, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Stairwell", 
         Vnum = 6425, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6426] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6428, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6450, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6425, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6449, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6426, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6427] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6423, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6444, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Name = "The main cargo bay", 
         Vnum = 6427, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6428] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6429, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6424, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6426, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6413, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6428, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6429] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6444, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6411, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6428, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6414, 
            }, 
            [5] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6423, 
            }, 
            [6] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6440, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Stairwell", 
         Vnum = 6429, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6430] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6409, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Stairwell", 
         Vnum = 6430, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6431] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6432, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6425, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6431, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6432] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6439, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6417, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6431, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6418, 
            }, 
            [5] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6441, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6432, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6433] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6408, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Name = "A small cargo bay", 
         Vnum = 6433, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6434] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6458, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Turret", 
         Vnum = 6434, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6435] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6412, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6420, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Turret", 
         Vnum = 6435, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6436] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6419, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Ship docking port", 
         Vnum = 6436, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6437] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6419, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Ship docking port", 
         Vnum = 6437, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6438] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6408, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Name = "A small cargo bay", 
         Vnum = 6438, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6439] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6440, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6415, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6432, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6416, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6439, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6440] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6439, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6429, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6440, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6441] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6432, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Ventral-mounted turbolaser", 
         Vnum = 6441, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6442] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6410, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6443, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Second Officer's Quarters", 
         Vnum = 6442, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6443] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6442, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Bedroom", 
         Vnum = 6443, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6444] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6429, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6427, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Lower cargo bay access", 
         Vnum = 6444, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6445] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6446, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6421, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "First Officer's Quarters", 
         Vnum = 6445, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6446] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6445, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Bedroom", 
         Vnum = 6446, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6447] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6448, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6410, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Engineer's Quarters", 
         Vnum = 6447, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6448] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6447, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         Name = "Bedroom", 
         Vnum = 6448, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6449] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6426, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6453, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Name = "A large workshop", 
         Vnum = 6449, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6450] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6454, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6426, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Name = "A large workshop", 
         Vnum = 6450, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6451] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6421, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6452, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Captains Quaters", 
         Vnum = 6451, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6452] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6451, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Bedroom", 
         Vnum = 6452, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6453] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6449, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "A dark refinery", 
         Vnum = 6453, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6454] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6450, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
         }, 
         Name = "A dark refinery", 
         Vnum = 6454, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6455] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6455, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6456] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6410, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6408, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6425, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Stairwell", 
         Vnum = 6456, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6457] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6457, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6458] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6412, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6434, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "northeast", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6460, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "northwest", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6459, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "The bridge", 
         Vnum = 6458, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6459] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6460, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southeast", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6458, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Pilot's chair", 
         Vnum = 6459, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6460] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6459, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southwest", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6458, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         Name = "Copilot's chair", 
         Vnum = 6460, 
         Tunnel = 0, 
         Description = "The walls of this room are painted a mild blue. A large viewport is located\
on the south  wall allowing passengers to look out into space. A small\
wetbar and fridge are here for  the passengers convienince as well as a\
com to the kitchen.  \
", 
         Sector = "city", 
      }, 
      [6461] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6462, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hatchway", 
         Vnum = 6461, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6462] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6463, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6464, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6461, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Main Hallway", 
         Vnum = 6462, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6463] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6465, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6471, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6462, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6470, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Main Hallway", 
         Vnum = 6463, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6464] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6462, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6472, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6467, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6468, 
            }, 
            [5] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6466, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Main Hallway", 
         Vnum = 6464, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6465] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6463, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Cockpit", 
         Vnum = 6465, 
         Tunnel = 0, 
         Description = "The cockpit of this ship is a comfortable  2 seater although everything can\
easily be controlled by a single pilot. A modified YV-666 freighter this\
ship has more than enough power to run with the fighters, and enough\
shielding and weapons to fight with small cruisers.\
", 
         Sector = "city", 
      }, 
      [6466] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6464, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Engine Room", 
         Vnum = 6466, 
         Tunnel = 0, 
         Description = "The powerhouse of this small freigheter is located here. powering both\
shields and Engines from this room make maintenance easy. The modified\
engine allows this ship extra speed beyoynd what a normal frieghter can\
handle.\
", 
         Sector = "city", 
      }, 
      [6467] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6464, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Crew Quarters", 
         Vnum = 6467, 
         Tunnel = 0, 
         Description = "A sparse living quarters is here.  Designed to be use when travlling on the\
hunt this ship has very little for creature comforts and is more bare bone\
to make you finish all that much sooner. \
", 
         Sector = "city", 
      }, 
      [6468] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6464, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Laser Turret", 
         Vnum = 6468, 
         Tunnel = 0, 
         Description = "A small bucket seat pivots inside a gyroscopic frame.  In front of the seat\
is the butterfly grip of a laser turret. Targeting controls light up a\
touch monitor in front of the seat. \
", 
         Sector = "city", 
      }, 
      [6469] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Cargo Hold", 
         Vnum = 6469, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6470] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6463, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Prisoner Room", 
         Vnum = 6470, 
         Tunnel = 0, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out. \
", 
         Sector = "city", 
      }, 
      [6471] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6463, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Prisoner Room", 
         Vnum = 6471, 
         Tunnel = 0, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out.\
", 
         Sector = "city", 
      }, 
      [6472] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6464, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Training Room", 
         Vnum = 6472, 
         Tunnel = 0, 
         Description = "Around this room is various training equipment, designed for helping to\
keep in top form or even help in the recovery of wounds, this is the ideal\
place to stay in shape. \
", 
         Sector = "city", 
      }, 
      [6473] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6474, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6475, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Boarding Ramp", 
         Vnum = 6473, 
         Tunnel = 0, 
         Description = "This boarding ramp leads inside the modified YV-667 freighter, The Gleaming\
Fang.  The entrance to the cockpit is to the north, and the rest of the\
ship is down the hallway south.\
", 
         Sector = "city", 
      }, 
      [6474] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6473, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Cockpit", 
         Vnum = 6474, 
         Tunnel = 0, 
         Description = "The cockpit is quite spacious. There is a pilot and co-pilot seat, but the\
control panel is modified to be easily accessible to the pilot. The\
controls have been rebuilt, so a Trandoshan pilot can manipulate them.\
", 
         Sector = "city", 
      }, 
      [6475] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6473, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6484, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6478, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6488, 
            }, 
            [5] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6476, 
            }, 
            [6] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6477, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6475, 
         Tunnel = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the galley, and the door to the east leads to the\
'fresher station'. A small ladder provides access to the dorsal and\
ventral turrets, and the hallway continues south.\
", 
         Sector = "city", 
      }, 
      [6476] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6475, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Dorsal Turret", 
         Vnum = 6476, 
         Tunnel = 0, 
         Description = "This is the dorsal turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         Sector = "city", 
      }, 
      [6477] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6475, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Name = "Ventral Turret", 
         Vnum = 6477, 
         Tunnel = 0, 
         Description = "This is the ventral turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         Sector = "city", 
      }, 
      [6478] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6475, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6489, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6479, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6483, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6478, 
         Tunnel = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the Captain's quarters. The door to the east leads to\
the crew quarters, and the hallway continues south. \
", 
         Sector = "city", 
      }, 
      [6479] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6478, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6480, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6485, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6479, 
         Tunnel = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls are regular intervals. A ladder\
leads down to the large cargo bay, and holding cells are to the south.\
", 
         Sector = "city", 
      }, 
      [6480] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6479, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "southeast", 
               Keyword = "", 
               Key = 20504, 
               DestinationVnum = 6482, 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "southwest", 
               Keyword = "", 
               Key = 20504, 
               DestinationVnum = 6481, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Skinning Room", 
         Vnum = 6480, 
         Tunnel = 0, 
         Description = "This room has all the equipment needed to skin and preserve hides. There is\
a long gleaming table in the middle of the room.  A groove runs down one\
side of the table to drain blood and other fluids into a waste disposal\
unit. A dipping tank for curing hides is a one end of the table, and there\
is a skinning apparatus mounted above the table. There are two holding\
cells here. The main hallway is to the north.\
", 
         Sector = "city", 
      }, 
      [6481] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "northeast", 
               Keyword = "", 
               Key = 20504, 
               DestinationVnum = 6480, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Name = "Holding Cell #1", 
         Vnum = 6481, 
         Tunnel = 0, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle. \
", 
         Sector = "city", 
      }, 
      [6482] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "northwest", 
               Keyword = "", 
               Key = 20504, 
               DestinationVnum = 6480, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Name = "Holding Cell #2", 
         Vnum = 6482, 
         Tunnel = 0, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle.\
", 
         Sector = "city", 
      }, 
      [6483] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6478, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Captain's Quarters", 
         Vnum = 6483, 
         Tunnel = 0, 
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
         Description = "There is a large bunk on one side of the captain's room. On the other side\
of the room, there is a large storage locker. A small desk littered with\
paperwork is against the wall between the bunk and the locker.\
", 
         Sector = "city", 
      }, 
      [6484] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6475, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "The Refresher", 
         Vnum = 6484, 
         Tunnel = 1, 
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
         Description = "This is a standard refresher unit. There is just barely enough room inside\
for a Trandoshan.\
", 
         Sector = "city", 
      }, 
      [6485] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6487, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6479, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Cargo Bay", 
         Vnum = 6485, 
         Tunnel = 0, 
         Description = "The stock cargo bay on a YV-667 is quite large, but a large portion of this\
cargo bay has been converted into a landing bay for a scout craft. There\
is a ladder leading up to the main hallway and the engine room is to the\
south.\
", 
         Sector = "city", 
      }, 
      [6486] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6498, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6494, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6495, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Lounge", 
         Vnum = 6486, 
         Tunnel = 0, 
         Description = "the lounge of this ship serves dual purpose, it is ment for the\
entertainment of guests as well as for meetings between the captain and\
crew or prospective employers. \
", 
         Sector = "city", 
      }, 
      [6487] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6485, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Engine Room", 
         Vnum = 6487, 
         Tunnel = 0, 
         Description = "The engines on this ship have been heavily upgraded to provide  energy to\
the power draining modifications that have been added to the ship. There\
are blinking readouts a shipboard com station here. There is a small tool\
locker mounted on one bulkhead. \
", 
         Sector = "city", 
      }, 
      [6488] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6475, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Galley", 
         Vnum = 6488, 
         Tunnel = 0, 
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
         Description = "The ship's galley may be small, but it is efficiently designed. There is a\
sink and a small food-prep station here. Food storage compartments have\
been mounted overhead to save space. There is a small table and four\
chairs in the middle of the room. \
", 
         Sector = "city", 
      }, 
      [6489] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6478, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Name = "Crew Quarters", 
         Vnum = 6489, 
         Tunnel = 0, 
         Description = "This room has three small bunks attached to the far bulkhead. There are\
also three small storage lockers mounted to the northern bulkhead.\
", 
         Sector = "city", 
      }, 
      [6490] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6489, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6475, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Crew Quaters", 
         Vnum = 6490, 
         Tunnel = 0, 
         Description = "A spare crew quarters is located here. Rows of bunks with foot lockers line\
the walls and a door on the noth wall leads into the captains quarters.\
", 
         Sector = "city", 
      }, 
      [6491] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6492, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6476, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Passenger Quaters", 
         Vnum = 6491, 
         Tunnel = 0, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters.\
", 
         Sector = "city", 
      }, 
      [6492] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6491, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Passenger Quaters", 
         Vnum = 6492, 
         Tunnel = 0, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters. \
", 
         Sector = "city", 
      }, 
      [6493] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6478, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6499, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Bridge Hatch", 
         Vnum = 6493, 
         Tunnel = 0, 
         Description = "A small hatchway leads from the main ship into the cockpit of the ship.\
this is one of the many changes made fron the old YV-1300 into this newer\
model. Micro-electronics has allowed for minaturizatin of controlls and\
systems  making this hallway an ideal like to all the ships systems.\
", 
         Sector = "city", 
      }, 
      [6494] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6486, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Top Turrent", 
         Vnum = 6494, 
         Tunnel = 0, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         Sector = "city", 
      }, 
      [6495] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6486, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Bottom Turrent", 
         Vnum = 6495, 
         Tunnel = 0, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         Sector = "city", 
      }, 
      [6496] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6499, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6482, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southwest", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6474, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6496, 
         Tunnel = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         Sector = "city", 
      }, 
      [6497] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6498, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6497, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6498] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6486, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6497, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "northwest", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6499, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southwest", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6476, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6498, 
         Tunnel = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         Sector = "city", 
      }, 
      [6499] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6493, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6496, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6473, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southeast", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6498, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6499, 
         Tunnel = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting around.\
It leads in a circular path around the ship.\
", 
         Sector = "city", 
      }, 
      [6500] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6501, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Cockpit", 
         Vnum = 6500, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6501] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6502, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6512, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6500, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6514, 
            }, 
            [5] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6513, 
            }, 
            [6] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "northwest", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6515, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6501, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6502] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6503, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6505, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6501, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Spice Lady Lounge", 
         Vnum = 6502, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6503] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6502, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6504, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Equipment Bay", 
         Vnum = 6503, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6504] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6503, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Engineroom", 
         Vnum = 6504, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6505] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6507, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6506, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6502, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6505, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6506] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6505, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6508, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Sleeping Quarters", 
         Vnum = 6506, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6507] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6509, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6505, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Cargo Bay", 
         Vnum = 6507, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6508] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6506, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Name = "Sleeping Quarters", 
         Vnum = 6508, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6509] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6510, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6507, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Cargo bay", 
         Vnum = 6509, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6510] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6509, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southwest", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6511, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Cargo Bay", 
         Vnum = 6510, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6511] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6512, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "northeast", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6510, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6511, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6512] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6511, 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6501, 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6517, 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6516, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hallway", 
         Vnum = 6512, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6513] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6501, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Smuggler's Compartment", 
         Vnum = 6513, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6514] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6501, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Boarding Ramp", 
         Vnum = 6514, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6515] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "southeast", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6501, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Hanger", 
         Vnum = 6515, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6516] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6512, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Turret", 
         Vnum = 6516, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6517] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6512, 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Turret", 
         Vnum = 6517, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
      }, 
      [6518] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Spice Lady A-wing", 
         Vnum = 6518, 
         Tunnel = 0, 
         Description = "", 
         Sector = "field", 
      }, 
   }, 
   Filename = "hunter_ships.lua", 
   Name = "Some Hunter Spacecraft", 
   VnumRanges = 
   {
      Mob = 
      {
         First = 6400, 
         Last = 6400, 
      }, 
      Object = 
      {
         First = 6400, 
         Last = 6401, 
      }, 
      Room = 
      {
         First = 6400, 
         Last = 6518, 
      }, 
   }, 
   Mobiles = 
   {
      [6400] = 
      {
         Position = "standing", 
         Weight = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         ShortDescr = "Weapons Dealer", 
         Name = "Weapons Dealer", 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
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
         Credits = 0, 
         LongDescr = "A shadey looking character is here.\
", 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Luck = 0, 
         }, 
         DamRoll = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 6400, 
         Level = 1, 
         Race = "Human", 
         HitRoll = 0, 
         ArmorClass = 0, 
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
            ProfitBuy = 150, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 50, 
            KeeperShortDescr = "Weapons Dealer", 
         }, 
      }, 
   }, 
   HighEconomy = 0, 
   ResetFrequency = 0, 
   LowEconomy = 31277379, 
   ResetMessage = "", 
}
