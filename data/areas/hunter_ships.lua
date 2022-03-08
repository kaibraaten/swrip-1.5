-- Some Hunter Spacecraft
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [6400] = 
      {
         Layers = 0, 
         Description = "A funny looking wristband lies here.", 
         ShortDescr = "wrist comlink", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 50, 
         ItemType = "comlink", 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 6400, 
         ActionDescription = "", 
         Tag = "", 
         Name = "Wrist comlink", 
      }, 
      [6401] = 
      {
         Layers = 0, 
         Description = "A small scope is in the dirt here.", 
         ShortDescr = "A sniper scope.", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
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
         Cost = 1000, 
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
         ItemType = "scope", 
         Weight = 2, 
         Flags = 
         {
            [13] = "Inventory", 
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
         Vnum = 6401, 
         ActionDescription = "", 
         Tag = "", 
         Name = "sniper scope", 
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
         Last = 6401, 
         First = 6400, 
      }, 
      Mob = 
      {
         Last = 6400, 
         First = 6400, 
      }, 
      Room = 
      {
         Last = 6518, 
         First = 6400, 
      }, 
   }, 
   ResetMessage = "", 
   ResetFrequency = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 6460, 
         Arg1 = 6400, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Arg3 = 0, 
         Arg1 = 6401, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Arg3 = 0, 
         Arg1 = 6400, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Arg3 = 0, 
         Arg1 = 53, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Arg3 = 2, 
         Arg1 = 6480, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 8, 
      }, 
      [6] = 
      {
         Arg3 = 2, 
         Arg1 = 6480, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 9, 
      }, 
      [7] = 
      {
         Arg3 = 6411, 
         Arg1 = 5190, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 17, 
      }, 
      [8] = 
      {
         Arg3 = 6407, 
         Arg1 = 204, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 92, 
      }, 
      [9] = 
      {
         Arg3 = 6407, 
         Arg1 = 204, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 92, 
      }, 
      [10] = 
      {
         Arg3 = 6407, 
         Arg1 = 204, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 92, 
      }, 
   }, 
   Author = "Bleeds", 
   Rooms = 
   {
      [6400] = 
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
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6401, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6400, 
         Description = "You stand upon in the boarding hatch of on of the most famous\
ships of all time.  A bounty hunters Customized KDY Firespray\
built for speed and firepower.  As you enter you must pass through \
a series of security detectors and camaras.\
", 
         Tag = "", 
         Name = "Boarding Slave 1", 
      }, 
      [6401] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6402, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6404, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6400, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6403, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6406, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6401, 
         Description = "Having passed through the various security checks you \
finally stand in the hallway of slave 1.  This ships odd \
design means things arn't normally where they should be.  \
A latter leads up into the bridge, to the north you see a \
cargo hold and south of you looks like someones living area.\
A small hatch in the floor rumbles with the vibrations from \
the engines.\
", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6402] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6401, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6405, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6402, 
         Description = "This ship has a fairly small cargo hold.  Most of the old \
holds area has been taken over in the modifications of the\
engines and shields.  There is still room for about a \
months worth of supplys for the ships single crew memeber.\
", 
         Tag = "", 
         Name = "Cargo Hold", 
      }, 
      [6403] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6401, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6403, 
         Description = "The bridge of slave 1 is very cramped, however everything is within easy\
reach of the comfortable captains chair.  all systems may be monitored\
from this room including prisoner status and even the boading area. \
Controls for various  modifications made on the ship are all located here.\
", 
         Tag = "", 
         Name = "Bridge", 
      }, 
      [6404] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cThe warmth of the bacta restores\
you.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6401, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6404, 
         Description = "Like most of the rest of the ship even the crew quaters\
have been taken over with ship modifications.  The area \
that use to sleep 6 comfortably now holds room for 1 and \
in a pinch sleep up to 4 people.\
", 
         Tag = "", 
         Name = "Crew Quarters", 
      }, 
      [6405] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6402, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6405, 
         Description = "This modified cargo hold is used for the ships main cargo,\
bounties.  Force shielded and reinforced cages line the \
walls.  Six seperate cages are in the room each with room\
for 1 person.\
", 
         Tag = "", 
         Name = "Prisoner Hold", 
      }, 
      [6406] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6401, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6406, 
         Description = "In this room you can clearly see 2 of the largest modifications\
to this ship the old engine and generator have been replaced by\
the massive KES-F31 drive engine and XF-16 power generator.\
Giving this large ship the speed and agility of a y-wing.\
", 
         Tag = "", 
         Name = "Engine Room", 
      }, 
      [6407] = 
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
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 6408, 
               Keyword = "olympus", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6407, 
         Description = "You stand in the turbolift of one of the greatest starships\
ever made a CR90 Corellian \"Blockade Runner\". This ship\
is known for its ability to be easily modified to fit its \
current role in a campaign, anything from troop transport\
to front line fighter is in this ships awsome repetoir.\
", 
         Tag = "", 
         Name = "Boarding Bay", 
      }, 
      [6408] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6419, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6433, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6422, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6438, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6407, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6456, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6408, 
         Description = "", 
         Tag = "", 
         Name = "Stairwell", 
      }, 
      [6409] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6420, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6412, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6423, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6409, 
         Description = "", 
         Tag = "", 
         Name = "Stairwell", 
      }, 
      [6410] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6421, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6447, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6456, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6442, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6410, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6411] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6424, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6429, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6411, 
         Description = "The level one hallway is built for war not plesentry so  \
it is bare metal walls and very little show, a metal walkway\
with emergancy lighting along it lead around this level.\
", 
         Tag = "", 
         Name = "Kitchen", 
      }, 
      [6412] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6458, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6435, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6409, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6412, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6413] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6414, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6428, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6413, 
         Description = "", 
         Tag = "", 
         Name = "Crew recreation center", 
      }, 
      [6414] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6429, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6413, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6414, 
         Description = "", 
         Tag = "", 
         Name = "Crew recreation center", 
      }, 
      [6415] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6439, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6415, 
         Description = "", 
         Tag = "", 
         Name = "Crew Barracks", 
      }, 
      [6416] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6439, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6416, 
         Description = "", 
         Tag = "", 
         Name = "Crew Barracks", 
      }, 
      [6417] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6432, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6417, 
         Description = "", 
         Tag = "", 
         Name = "A new, nonoperational turret", 
      }, 
      [6418] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6432, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6418, 
         Description = "", 
         Tag = "", 
         Name = "A new, nonoperational turret", 
      }, 
      [6419] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6420, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6436, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6408, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6437, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6419, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6420] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6409, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6419, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6435, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6420, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6421] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6423, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6445, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6410, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6451, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6421, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6422] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6408, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6422, 
         Description = "", 
         Tag = "", 
         Name = "Main engineering", 
      }, 
      [6423] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6427, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6421, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6409, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6429, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6423, 
         Description = "", 
         Tag = "", 
         Name = "Stairwell", 
      }, 
      [6424] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6411, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6428, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6424, 
         Description = "", 
         Tag = "", 
         Name = "Mess Hall", 
      }, 
      [6425] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6426, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6456, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6431, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6425, 
         Description = "", 
         Tag = "", 
         Name = "Stairwell", 
      }, 
      [6426] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6428, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6450, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6425, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6449, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6426, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6427] = 
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
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6423, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6444, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6427, 
         Description = "", 
         Tag = "", 
         Name = "The main cargo bay", 
      }, 
      [6428] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6429, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6424, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6426, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6413, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6428, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6429] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6444, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6411, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6428, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6414, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6423, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6440, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6429, 
         Description = "", 
         Tag = "", 
         Name = "Stairwell", 
      }, 
      [6430] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6409, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6430, 
         Description = "", 
         Tag = "", 
         Name = "Stairwell", 
      }, 
      [6431] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6432, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6425, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6431, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6432] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6439, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6417, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6431, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6418, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6441, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6432, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6433] = 
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
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6408, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6433, 
         Description = "", 
         Tag = "", 
         Name = "A small cargo bay", 
      }, 
      [6434] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6458, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6434, 
         Description = "", 
         Tag = "", 
         Name = "Turret", 
      }, 
      [6435] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6412, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6420, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6435, 
         Description = "", 
         Tag = "", 
         Name = "Turret", 
      }, 
      [6436] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6419, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6436, 
         Description = "", 
         Tag = "", 
         Name = "Ship docking port", 
      }, 
      [6437] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6419, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6437, 
         Description = "", 
         Tag = "", 
         Name = "Ship docking port", 
      }, 
      [6438] = 
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
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6408, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6438, 
         Description = "", 
         Tag = "", 
         Name = "A small cargo bay", 
      }, 
      [6439] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6440, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6415, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6432, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6416, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6439, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6440] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6439, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6429, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6440, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6441] = 
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
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6432, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6441, 
         Description = "", 
         Tag = "", 
         Name = "Ventral-mounted turbolaser", 
      }, 
      [6442] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6410, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6443, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6442, 
         Description = "", 
         Tag = "", 
         Name = "Second Officer's Quarters", 
      }, 
      [6443] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6442, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6443, 
         Description = "", 
         Tag = "", 
         Name = "Bedroom", 
      }, 
      [6444] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6429, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6427, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6444, 
         Description = "", 
         Tag = "", 
         Name = "Lower cargo bay access", 
      }, 
      [6445] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6446, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6421, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6445, 
         Description = "", 
         Tag = "", 
         Name = "First Officer's Quarters", 
      }, 
      [6446] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6445, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6446, 
         Description = "", 
         Tag = "", 
         Name = "Bedroom", 
      }, 
      [6447] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6448, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6410, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6447, 
         Description = "", 
         Tag = "", 
         Name = "Engineer's Quarters", 
      }, 
      [6448] = 
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
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6447, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6448, 
         Description = "", 
         Tag = "", 
         Name = "Bedroom", 
      }, 
      [6449] = 
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
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6426, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6453, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6449, 
         Description = "", 
         Tag = "", 
         Name = "A large workshop", 
      }, 
      [6450] = 
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
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6454, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6426, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6450, 
         Description = "", 
         Tag = "", 
         Name = "A large workshop", 
      }, 
      [6451] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6421, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6452, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6451, 
         Description = "", 
         Tag = "", 
         Name = "Captains Quaters", 
      }, 
      [6452] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6451, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6452, 
         Description = "", 
         Tag = "", 
         Name = "Bedroom", 
      }, 
      [6453] = 
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
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6449, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6453, 
         Description = "", 
         Tag = "", 
         Name = "A dark refinery", 
      }, 
      [6454] = 
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
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6450, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6454, 
         Description = "", 
         Tag = "", 
         Name = "A dark refinery", 
      }, 
      [6455] = 
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
         Vnum = 6455, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6456] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6410, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6408, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6425, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6456, 
         Description = "", 
         Tag = "", 
         Name = "Stairwell", 
      }, 
      [6457] = 
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
         Vnum = 6457, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6458] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6412, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6434, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 6460, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 6459, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6458, 
         Description = "", 
         Tag = "", 
         Name = "The bridge", 
      }, 
      [6459] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6460, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 6458, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6459, 
         Description = "", 
         Tag = "", 
         Name = "Pilot's chair", 
      }, 
      [6460] = 
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
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6459, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 6458, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6460, 
         Description = "The walls of this room are painted a mild blue. A large viewport is located\
on the south  wall allowing passengers to look out into space. A small\
wetbar and fridge are here for  the passengers convienince as well as a\
com to the kitchen.  \
", 
         Tag = "", 
         Name = "Copilot's chair", 
      }, 
      [6461] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6462, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6461, 
         Description = "", 
         Tag = "", 
         Name = "Hatchway", 
      }, 
      [6462] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6463, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6464, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6461, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6462, 
         Description = "", 
         Tag = "", 
         Name = "Main Hallway", 
      }, 
      [6463] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6465, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6471, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6462, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6470, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6463, 
         Description = "", 
         Tag = "", 
         Name = "Main Hallway", 
      }, 
      [6464] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6462, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6472, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6467, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6468, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6466, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6464, 
         Description = "", 
         Tag = "", 
         Name = "Main Hallway", 
      }, 
      [6465] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6463, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6465, 
         Description = "The cockpit of this ship is a comfortable  2 seater although everything can\
easily be controlled by a single pilot. A modified YV-666 freighter this\
ship has more than enough power to run with the fighters, and enough\
shielding and weapons to fight with small cruisers.\
", 
         Tag = "", 
         Name = "Cockpit", 
      }, 
      [6466] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6464, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6466, 
         Description = "The powerhouse of this small freigheter is located here. powering both\
shields and Engines from this room make maintenance easy. The modified\
engine allows this ship extra speed beyoynd what a normal frieghter can\
handle.\
", 
         Tag = "", 
         Name = "Engine Room", 
      }, 
      [6467] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6464, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6467, 
         Description = "A sparse living quarters is here.  Designed to be use when travlling on the\
hunt this ship has very little for creature comforts and is more bare bone\
to make you finish all that much sooner. \
", 
         Tag = "", 
         Name = "Crew Quarters", 
      }, 
      [6468] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6464, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6468, 
         Description = "A small bucket seat pivots inside a gyroscopic frame.  In front of the seat\
is the butterfly grip of a laser turret. Targeting controls light up a\
touch monitor in front of the seat. \
", 
         Tag = "", 
         Name = "Laser Turret", 
      }, 
      [6469] = 
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
         Vnum = 6469, 
         Description = "", 
         Tag = "", 
         Name = "Cargo Hold", 
      }, 
      [6470] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6463, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6470, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out. \
", 
         Tag = "", 
         Name = "Prisoner Room", 
      }, 
      [6471] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6463, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6471, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out.\
", 
         Tag = "", 
         Name = "Prisoner Room", 
      }, 
      [6472] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6464, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6472, 
         Description = "Around this room is various training equipment, designed for helping to\
keep in top form or even help in the recovery of wounds, this is the ideal\
place to stay in shape. \
", 
         Tag = "", 
         Name = "Training Room", 
      }, 
      [6473] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6474, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6475, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6473, 
         Description = "This boarding ramp leads inside the modified YV-667 freighter, The Gleaming\
Fang.  The entrance to the cockpit is to the north, and the rest of the\
ship is down the hallway south.\
", 
         Tag = "", 
         Name = "Boarding Ramp", 
      }, 
      [6474] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6473, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6474, 
         Description = "The cockpit is quite spacious. There is a pilot and co-pilot seat, but the\
control panel is modified to be easily accessible to the pilot. The\
controls have been rebuilt, so a Trandoshan pilot can manipulate them.\
", 
         Tag = "", 
         Name = "Cockpit", 
      }, 
      [6475] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6473, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6484, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6478, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6488, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6476, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6477, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6475, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the galley, and the door to the east leads to the\
'fresher station'. A small ladder provides access to the dorsal and\
ventral turrets, and the hallway continues south.\
", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6476] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6475, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6476, 
         Description = "This is the dorsal turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         Tag = "", 
         Name = "Dorsal Turret", 
      }, 
      [6477] = 
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
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6475, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6477, 
         Description = "This is the ventral turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         Tag = "", 
         Name = "Ventral Turret", 
      }, 
      [6478] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6475, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6489, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6479, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6483, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6478, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the Captain's quarters. The door to the east leads to\
the crew quarters, and the hallway continues south. \
", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6479] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6478, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6480, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6485, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6479, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls are regular intervals. A ladder\
leads down to the large cargo bay, and holding cells are to the south.\
", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6480] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6479, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = 20504, 
               Direction = "southeast", 
               DestinationVnum = 6482, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = 20504, 
               Direction = "southwest", 
               DestinationVnum = 6481, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6480, 
         Description = "This room has all the equipment needed to skin and preserve hides. There is\
a long gleaming table in the middle of the room.  A groove runs down one\
side of the table to drain blood and other fluids into a waste disposal\
unit. A dipping tank for curing hides is a one end of the table, and there\
is a skinning apparatus mounted above the table. There are two holding\
cells here. The main hallway is to the north.\
", 
         Tag = "", 
         Name = "Skinning Room", 
      }, 
      [6481] = 
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
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 20504, 
               Direction = "northeast", 
               DestinationVnum = 6480, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6481, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle. \
", 
         Tag = "", 
         Name = "Holding Cell #1", 
      }, 
      [6482] = 
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
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 20504, 
               Direction = "northwest", 
               DestinationVnum = 6480, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6482, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle.\
", 
         Tag = "", 
         Name = "Holding Cell #2", 
      }, 
      [6483] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25 ", 
               Code = "mpecho The bacta heals your wounds.\
feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6478, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6483, 
         Description = "There is a large bunk on one side of the captain's room. On the other side\
of the room, there is a large storage locker. A small desk littered with\
paperwork is against the wall between the bunk and the locker.\
", 
         Tag = "", 
         Name = "Captain's Quarters", 
      }, 
      [6484] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 1, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "70", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cYou wash around your troubles.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6475, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6484, 
         Description = "This is a standard refresher unit. There is just barely enough room inside\
for a Trandoshan.\
", 
         Tag = "", 
         Name = "The Refresher", 
      }, 
      [6485] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6487, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6479, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6485, 
         Description = "The stock cargo bay on a YV-667 is quite large, but a large portion of this\
cargo bay has been converted into a landing bay for a scout craft. There\
is a ladder leading up to the main hallway and the engine room is to the\
south.\
", 
         Tag = "", 
         Name = "Cargo Bay", 
      }, 
      [6486] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6498, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6494, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6495, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6486, 
         Description = "the lounge of this ship serves dual purpose, it is ment for the\
entertainment of guests as well as for meetings between the captain and\
crew or prospective employers. \
", 
         Tag = "", 
         Name = "Lounge", 
      }, 
      [6487] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6485, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6487, 
         Description = "The engines on this ship have been heavily upgraded to provide  energy to\
the power draining modifications that have been added to the ship. There\
are blinking readouts a shipboard com station here. There is a small tool\
locker mounted on one bulkhead. \
", 
         Tag = "", 
         Name = "Engine Room", 
      }, 
      [6488] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "food ration", 
               Code = "mpoload 10313\
mpecho A packaged ration pops from the station.\
drop all\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6475, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6488, 
         Description = "The ship's galley may be small, but it is efficiently designed. There is a\
sink and a small food-prep station here. Food storage compartments have\
been mounted overhead to save space. There is a small table and four\
chairs in the middle of the room. \
", 
         Tag = "", 
         Name = "Galley", 
      }, 
      [6489] = 
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
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6478, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6489, 
         Description = "This room has three small bunks attached to the far bulkhead. There are\
also three small storage lockers mounted to the northern bulkhead.\
", 
         Tag = "", 
         Name = "Crew Quarters", 
      }, 
      [6490] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6489, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6475, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6490, 
         Description = "A spare crew quarters is located here. Rows of bunks with foot lockers line\
the walls and a door on the noth wall leads into the captains quarters.\
", 
         Tag = "", 
         Name = "Crew Quaters", 
      }, 
      [6491] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6492, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6476, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6491, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters.\
", 
         Tag = "", 
         Name = "Passenger Quaters", 
      }, 
      [6492] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6491, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6492, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters. \
", 
         Tag = "", 
         Name = "Passenger Quaters", 
      }, 
      [6493] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6478, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6499, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6493, 
         Description = "A small hatchway leads from the main ship into the cockpit of the ship.\
this is one of the many changes made fron the old YV-1300 into this newer\
model. Micro-electronics has allowed for minaturizatin of controlls and\
systems  making this hallway an ideal like to all the ships systems.\
", 
         Tag = "", 
         Name = "Bridge Hatch", 
      }, 
      [6494] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6486, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6494, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         Tag = "", 
         Name = "Top Turrent", 
      }, 
      [6495] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6486, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6495, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         Tag = "", 
         Name = "Bottom Turrent", 
      }, 
      [6496] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6499, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6482, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 6474, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6496, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6497] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6498, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6497, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6498] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6486, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6497, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 6499, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 6476, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6498, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6499] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6493, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6496, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6473, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 6498, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6499, 
         Description = "The hallway is a simple grey metel with various emergency lighting around.\
It leads in a circular path around the ship.\
", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6500] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6501, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6500, 
         Description = "", 
         Tag = "", 
         Name = "Cockpit", 
      }, 
      [6501] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6502, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6512, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6500, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6514, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6513, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 6515, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6501, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6502] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6503, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6505, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6501, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6502, 
         Description = "", 
         Tag = "", 
         Name = "Spice Lady Lounge", 
      }, 
      [6503] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6502, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6504, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6503, 
         Description = "", 
         Tag = "", 
         Name = "Equipment Bay", 
      }, 
      [6504] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6503, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6504, 
         Description = "", 
         Tag = "", 
         Name = "Engineroom", 
      }, 
      [6505] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6507, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6506, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6502, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6505, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6506] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6505, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6508, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6506, 
         Description = "", 
         Tag = "", 
         Name = "Sleeping Quarters", 
      }, 
      [6507] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6509, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6505, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6507, 
         Description = "", 
         Tag = "", 
         Name = "Cargo Bay", 
      }, 
      [6508] = 
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
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6506, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6508, 
         Description = "", 
         Tag = "", 
         Name = "Sleeping Quarters", 
      }, 
      [6509] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6510, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6507, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6509, 
         Description = "", 
         Tag = "", 
         Name = "Cargo bay", 
      }, 
      [6510] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6509, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 6511, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6510, 
         Description = "", 
         Tag = "", 
         Name = "Cargo Bay", 
      }, 
      [6511] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6512, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 6510, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6511, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6512] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6511, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6501, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6517, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6516, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6512, 
         Description = "", 
         Tag = "", 
         Name = "Hallway", 
      }, 
      [6513] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6501, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6513, 
         Description = "", 
         Tag = "", 
         Name = "Smuggler's Compartment", 
      }, 
      [6514] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6501, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6514, 
         Description = "", 
         Tag = "", 
         Name = "Boarding Ramp", 
      }, 
      [6515] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 6501, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6515, 
         Description = "", 
         Tag = "", 
         Name = "Hanger", 
      }, 
      [6516] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6512, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6516, 
         Description = "", 
         Tag = "", 
         Name = "Turret", 
      }, 
      [6517] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6512, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 6517, 
         Description = "", 
         Tag = "", 
         Name = "Turret", 
      }, 
      [6518] = 
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
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 6518, 
         Description = "", 
         Tag = "", 
         Name = "Spice Lady A-wing", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "hunter_ships.lua", 
   Mobiles = 
   {
      [6400] = 
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
            KeeperShortDescr = "Weapons Dealer", 
            ProfitBuy = 150, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 50, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         ShortDescr = "Weapons Dealer", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A shadey looking character is here.\
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
         Vnum = 6400, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "Weapons Dealer", 
      }, 
   }, 
   LowEconomy = 31277379, 
   Name = "Some Hunter Spacecraft", 
}
