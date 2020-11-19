-- Some Hunter Spacecraft
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
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
   Objects = 
   {
      [6400] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6400, 
         Cost = 50, 
         ShortDescr = "wrist comlink", 
         Weight = 2, 
         Layers = 0, 
         Name = "Wrist comlink", 
         Description = "A funny looking wristband lies here.", 
         ActionDescription = "", 
         ItemType = "comlink", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
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
      [6401] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This small scope looks as if it could improve your aim buy quite a bit\
\13", 
               Keyword = "sniper scope", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 6401, 
         Cost = 1000, 
         ShortDescr = "A sniper scope.", 
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
         Weight = 2, 
         Layers = 0, 
         Name = "sniper scope", 
         Description = "A small scope is in the dirt here.", 
         ActionDescription = "", 
         ItemType = "scope", 
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
      [6400] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6400, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Boarding Slave 1", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6401, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand upon in the boarding hatch of on of the most famous\
ships of all time.  A bounty hunters Customized KDY Firespray\
built for speed and firepower.  As you enter you must pass through \
a series of security detectors and camaras.\
", 
      }, 
      [6401] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6401, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6402, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6404, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6400, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6403, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6406, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Having passed through the various security checks you \
finally stand in the hallway of slave 1.  This ships odd \
design means things arn't normally where they should be.  \
A latter leads up into the bridge, to the north you see a \
cargo hold and south of you looks like someones living area.\
A small hatch in the floor rumbles with the vibrations from \
the engines.\
", 
      }, 
      [6402] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6402, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6401, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6405, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This ship has a fairly small cargo hold.  Most of the old \
holds area has been taken over in the modifications of the\
engines and shields.  There is still room for about a \
months worth of supplys for the ships single crew memeber.\
", 
      }, 
      [6403] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6403, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bridge", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6401, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The bridge of slave 1 is very cramped, however everything is within easy\
reach of the comfortable captains chair.  all systems may be monitored\
from this room including prisoner status and even the boading area. \
Controls for various  modifications made on the ship are all located here.\
", 
      }, 
      [6404] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6404, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Crew Quarters", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cThe warmth of the bacta restores\
you.\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6401, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Like most of the rest of the ship even the crew quaters\
have been taken over with ship modifications.  The area \
that use to sleep 6 comfortably now holds room for 1 and \
in a pinch sleep up to 4 people.\
", 
      }, 
      [6405] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6405, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Prisoner Hold", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6402, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This modified cargo hold is used for the ships main cargo,\
bounties.  Force shielded and reinforced cages line the \
walls.  Six seperate cages are in the room each with room\
for 1 person.\
", 
      }, 
      [6406] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6406, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Engine Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6401, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "In this room you can clearly see 2 of the largest modifications\
to this ship the old engine and generator have been replaced by\
the massive KES-F31 drive engine and XF-16 power generator.\
Giving this large ship the speed and agility of a y-wing.\
", 
      }, 
      [6407] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Vnum = 6407, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Boarding Bay", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 6408, 
               Distance = 0, 
               Keyword = "olympus", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand in the turbolift of one of the greatest starships\
ever made a CR90 Corellian \"Blockade Runner\". This ship\
is known for its ability to be easily modified to fit its \
current role in a campaign, anything from troop transport\
to front line fighter is in this ships awsome repetoir.\
", 
      }, 
      [6408] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6408, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6419, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6433, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6422, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6438, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6407, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6456, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6409] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6409, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6420, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6412, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6423, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6410] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6410, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6421, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6447, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6456, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6442, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6411] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6411, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6424, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6429, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The level one hallway is built for war not plesentry so  \
it is bare metal walls and very little show, a metal walkway\
with emergancy lighting along it lead around this level.\
", 
      }, 
      [6412] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6412, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6458, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6435, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6409, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6413] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6413, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Crew recreation center", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6414, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6428, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6414] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6414, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Crew recreation center", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6429, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6413, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6415] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6415, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Crew Barracks", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6439, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6416] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6416, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Crew Barracks", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6439, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6417] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6417, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A new, nonoperational turret", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6432, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6418] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6418, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A new, nonoperational turret", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6432, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6419] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6419, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6420, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6436, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6408, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6437, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6420] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6420, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6409, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6419, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6435, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6421] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6421, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6423, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6445, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6410, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6451, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6422] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6422, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Main engineering", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6408, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6423] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6423, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6427, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6421, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6409, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6429, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6424] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6424, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Mess Hall", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6411, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6428, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6425] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6425, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6426, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6456, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6431, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6426] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6426, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6428, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6450, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6425, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6449, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6427] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Vnum = 6427, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The main cargo bay", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6423, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6444, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6428] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6428, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6429, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6424, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6426, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6413, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6429] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6429, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6444, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6411, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6428, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6414, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6423, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6440, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6430] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6430, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6409, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6431] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6431, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6432, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6425, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6432] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6432, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6439, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6417, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6431, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6418, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6441, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6433] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Vnum = 6433, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A small cargo bay", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6408, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6434] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6434, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6458, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6435] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6435, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6412, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6420, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6436] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6436, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ship docking port", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6419, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6437] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6437, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ship docking port", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6419, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6438] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Vnum = 6438, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A small cargo bay", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6408, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6439] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6439, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6440, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6415, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6432, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6416, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6440] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6440, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6439, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6429, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6441] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6441, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ventral-mounted turbolaser", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6432, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6442] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6442, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Second Officer's Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6410, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6443, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6443] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6443, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6442, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6444] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6444, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lower cargo bay access", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6429, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6427, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6445] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6445, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "First Officer's Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6446, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6421, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6446] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6446, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6445, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6447] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6447, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Engineer's Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6448, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6410, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6448] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         Vnum = 6448, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6447, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6449] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6449, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A large workshop", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6426, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6453, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6450] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6450, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A large workshop", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6454, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6426, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6451] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6451, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Captains Quaters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6421, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6452, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6452] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6452, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6451, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6453] = 
      {
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
         Vnum = 6453, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A dark refinery", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6449, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6454] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6454, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A dark refinery", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6450, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6455] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6455, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6456] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6456, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6410, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6408, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6425, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6457] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6457, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6458] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6458, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The bridge", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6412, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6434, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 6460, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 6459, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6459] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6459, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Pilot's chair", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6460, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 6458, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6460] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6460, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Copilot's chair", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6459, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 6458, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The walls of this room are painted a mild blue. A large viewport is located\
on the south  wall allowing passengers to look out into space. A small\
wetbar and fridge are here for  the passengers convienince as well as a\
com to the kitchen.  \
", 
      }, 
      [6461] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6461, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hatchway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6462, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6462] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6462, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Main Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6463, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6464, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6461, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6463] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6463, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Main Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6465, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6471, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6462, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6470, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6464] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6464, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Main Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6462, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6472, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6467, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6468, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6466, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6465] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6465, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6463, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The cockpit of this ship is a comfortable  2 seater although everything can\
easily be controlled by a single pilot. A modified YV-666 freighter this\
ship has more than enough power to run with the fighters, and enough\
shielding and weapons to fight with small cruisers.\
", 
      }, 
      [6466] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6466, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Engine Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6464, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The powerhouse of this small freigheter is located here. powering both\
shields and Engines from this room make maintenance easy. The modified\
engine allows this ship extra speed beyoynd what a normal frieghter can\
handle.\
", 
      }, 
      [6467] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6467, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Crew Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6464, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "A sparse living quarters is here.  Designed to be use when travlling on the\
hunt this ship has very little for creature comforts and is more bare bone\
to make you finish all that much sooner. \
", 
      }, 
      [6468] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6468, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Laser Turret", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6464, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "A small bucket seat pivots inside a gyroscopic frame.  In front of the seat\
is the butterfly grip of a laser turret. Targeting controls light up a\
touch monitor in front of the seat. \
", 
      }, 
      [6469] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6469, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cargo Hold", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6470] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6470, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Prisoner Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6463, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out. \
", 
      }, 
      [6471] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6471, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Prisoner Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6463, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out.\
", 
      }, 
      [6472] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6472, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Training Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6464, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Around this room is various training equipment, designed for helping to\
keep in top form or even help in the recovery of wounds, this is the ideal\
place to stay in shape. \
", 
      }, 
      [6473] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6473, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Boarding Ramp", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6474, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6475, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This boarding ramp leads inside the modified YV-667 freighter, The Gleaming\
Fang.  The entrance to the cockpit is to the north, and the rest of the\
ship is down the hallway south.\
", 
      }, 
      [6474] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6474, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6473, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The cockpit is quite spacious. There is a pilot and co-pilot seat, but the\
control panel is modified to be easily accessible to the pilot. The\
controls have been rebuilt, so a Trandoshan pilot can manipulate them.\
", 
      }, 
      [6475] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6475, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6473, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6484, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6478, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6488, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6476, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6477, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the galley, and the door to the east leads to the\
'fresher station'. A small ladder provides access to the dorsal and\
ventral turrets, and the hallway continues south.\
", 
      }, 
      [6476] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6476, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Dorsal Turret", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6475, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is the dorsal turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
      }, 
      [6477] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 6477, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ventral Turret", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6475, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is the ventral turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
      }, 
      [6478] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6478, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6475, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6489, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6479, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6483, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the Captain's quarters. The door to the east leads to\
the crew quarters, and the hallway continues south. \
", 
      }, 
      [6479] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6479, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6478, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6480, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6485, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls are regular intervals. A ladder\
leads down to the large cargo bay, and holding cells are to the south.\
", 
      }, 
      [6480] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6480, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Skinning Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6479, 
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
               Direction = "southeast", 
               Key = 20504, 
               DestinationVnum = 6482, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "southwest", 
               Key = 20504, 
               DestinationVnum = 6481, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This room has all the equipment needed to skin and preserve hides. There is\
a long gleaming table in the middle of the room.  A groove runs down one\
side of the table to drain blood and other fluids into a waste disposal\
unit. A dipping tank for curing hides is a one end of the table, and there\
is a skinning apparatus mounted above the table. There are two holding\
cells here. The main hallway is to the north.\
", 
      }, 
      [6481] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Vnum = 6481, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Holding Cell #1", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "northeast", 
               Key = 20504, 
               DestinationVnum = 6480, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle. \
", 
      }, 
      [6482] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Vnum = 6482, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Holding Cell #2", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "northwest", 
               Key = 20504, 
               DestinationVnum = 6480, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle.\
", 
      }, 
      [6483] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6483, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Captain's Quarters", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho The bacta heals your wounds.\
feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
", 
               Arguments = "25 ", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6478, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is a large bunk on one side of the captain's room. On the other side\
of the room, there is a large storage locker. A small desk littered with\
paperwork is against the wall between the bunk and the locker.\
", 
      }, 
      [6484] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6484, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Refresher", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cYou wash around your troubles.\
", 
               Arguments = "70", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6475, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 1, 
         Description = "This is a standard refresher unit. There is just barely enough room inside\
for a Trandoshan.\
", 
      }, 
      [6485] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6485, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cargo Bay", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6487, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6479, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The stock cargo bay on a YV-667 is quite large, but a large portion of this\
cargo bay has been converted into a landing bay for a scout craft. There\
is a ladder leading up to the main hallway and the engine room is to the\
south.\
", 
      }, 
      [6486] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6486, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lounge", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6498, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6494, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6495, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "the lounge of this ship serves dual purpose, it is ment for the\
entertainment of guests as well as for meetings between the captain and\
crew or prospective employers. \
", 
      }, 
      [6487] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6487, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Engine Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6485, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The engines on this ship have been heavily upgraded to provide  energy to\
the power draining modifications that have been added to the ship. There\
are blinking readouts a shipboard com station here. There is a small tool\
locker mounted on one bulkhead. \
", 
      }, 
      [6488] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6488, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Galley", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpoload 10313\
mpecho A packaged ration pops from the station.\
drop all\
", 
               Arguments = "food ration", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6475, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The ship's galley may be small, but it is efficiently designed. There is a\
sink and a small food-prep station here. Food storage compartments have\
been mounted overhead to save space. There is a small table and four\
chairs in the middle of the room. \
", 
      }, 
      [6489] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 6489, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Crew Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6478, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This room has three small bunks attached to the far bulkhead. There are\
also three small storage lockers mounted to the northern bulkhead.\
", 
      }, 
      [6490] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6490, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Crew Quaters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6489, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6475, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "A spare crew quarters is located here. Rows of bunks with foot lockers line\
the walls and a door on the noth wall leads into the captains quarters.\
", 
      }, 
      [6491] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6491, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Passenger Quaters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6492, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6476, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters.\
", 
      }, 
      [6492] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6492, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Passenger Quaters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6491, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters. \
", 
      }, 
      [6493] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6493, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bridge Hatch", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6478, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6499, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "A small hatchway leads from the main ship into the cockpit of the ship.\
this is one of the many changes made fron the old YV-1300 into this newer\
model. Micro-electronics has allowed for minaturizatin of controlls and\
systems  making this hallway an ideal like to all the ships systems.\
", 
      }, 
      [6494] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6494, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Top Turrent", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6486, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
      }, 
      [6495] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6495, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bottom Turrent", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6486, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
      }, 
      [6496] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6496, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6499, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6482, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 6474, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
      }, 
      [6497] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6497, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6498, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6498] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6498, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6486, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6497, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 6499, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 6476, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
      }, 
      [6499] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6499, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6493, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6496, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6473, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 6498, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting around.\
It leads in a circular path around the ship.\
", 
      }, 
      [6500] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6500, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6501, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6501] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6501, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6502, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6512, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6500, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6514, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6513, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 6515, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6502] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6502, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Spice Lady Lounge", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6503, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6505, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6501, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6503] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6503, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Equipment Bay", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6502, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6504, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6504] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6504, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Engineroom", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6503, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6505] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6505, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6507, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6506, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6502, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6506] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6506, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Sleeping Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6505, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6508, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6507] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6507, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cargo Bay", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6509, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6505, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6508] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 6508, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Sleeping Quarters", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6506, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6509] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6509, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cargo bay", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6510, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6507, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6510] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6510, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cargo Bay", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6509, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 6511, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6511] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6511, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6512, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 6510, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6512] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6512, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6511, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6501, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6517, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6516, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6513] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6513, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Smuggler's Compartment", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6501, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6514] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6514, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Boarding Ramp", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6501, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6515] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6515, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hanger", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 6501, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6516] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6516, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6512, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6517] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 6517, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6512, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [6518] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6518, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "field", 
         Name = "Spice Lady A-wing", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 31277379, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Arg1 = 6400, 
         Command = "M", 
         Arg3 = 6460, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6401, 
         Command = "G", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6400, 
         Command = "G", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "G", 
      }, 
      [5] = 
      {
         MiscData = 0, 
         Arg1 = 6480, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 8, 
      }, 
      [6] = 
      {
         MiscData = 0, 
         Arg1 = 6480, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 9, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 5190, 
         Command = "M", 
         Arg3 = 6411, 
         Arg2 = 17, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 204, 
         Command = "M", 
         Arg3 = 6407, 
         Arg2 = 92, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 204, 
         Command = "M", 
         Arg3 = 6407, 
         Arg2 = 92, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 204, 
         Command = "M", 
         Arg3 = 6407, 
         Arg2 = 92, 
      }, 
   }, 
   ResetMessage = "", 
   Author = "Bleeds", 
   Name = "Some Hunter Spacecraft", 
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
   Filename = "hunter_ships.lua", 
   Mobiles = 
   {
      [6400] = 
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
         ShortDescr = "Weapons Dealer", 
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
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
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
            ProfitBuy = 150, 
            ProfitSell = 50, 
            KeeperShortDescr = "Weapons Dealer", 
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
         Vnum = 6400, 
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
         }, 
         Name = "Weapons Dealer", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A shadey looking character is here.\
", 
         ArmorClass = 0, 
      }, 
   }, 
}
