-- Some Hunter Spacecraft
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   Author = "Bleeds", 
   Objects = 
   {
      [6400] = 
      {
         Layers = 0, 
         ItemType = "comlink", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wrist comlink", 
         Cost = 50, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Description = "A funny looking wristband lies here.", 
         Weight = 2, 
         Vnum = 6400, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "wrist comlink", 
         ActionDescription = "", 
      }, 
      [6401] = 
      {
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
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sniper scope", 
               Description = "This small scope looks as if it could improve your aim buy quite a bit\
\13", 
            }, 
         }, 
         ItemType = "scope", 
         Cost = 1000, 
         Name = "sniper scope", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "A small scope is in the dirt here.", 
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
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "A sniper scope.", 
         ActionDescription = "", 
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
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Boarding Slave 1", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6400, 
         TeleDelay = 0, 
         Description = "You stand upon in the boarding hatch of on of the most famous\
ships of all time.  A bounty hunters Customized KDY Firespray\
built for speed and firepower.  As you enter you must pass through \
a series of security detectors and camaras.\
", 
         TeleVnum = 0, 
      }, 
      [6401] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6402, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6404, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6400, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6403, 
               Distance = 0, 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6406, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6401, 
         TeleDelay = 0, 
         Description = "Having passed through the various security checks you \
finally stand in the hallway of slave 1.  This ships odd \
design means things arn't normally where they should be.  \
A latter leads up into the bridge, to the north you see a \
cargo hold and south of you looks like someones living area.\
A small hatch in the floor rumbles with the vibrations from \
the engines.\
", 
         TeleVnum = 0, 
      }, 
      [6402] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6405, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cargo Hold", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6402, 
         TeleDelay = 0, 
         Description = "This ship has a fairly small cargo hold.  Most of the old \
holds area has been taken over in the modifications of the\
engines and shields.  There is still room for about a \
months worth of supplys for the ships single crew memeber.\
", 
         TeleVnum = 0, 
      }, 
      [6403] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Bridge", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6403, 
         TeleDelay = 0, 
         Description = "The bridge of slave 1 is very cramped, however everything is within easy\
reach of the comfortable captains chair.  all systems may be monitored\
from this room including prisoner status and even the boading area. \
Controls for various  modifications made on the ship are all located here.\
", 
         TeleVnum = 0, 
      }, 
      [6404] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Crew Quarters", 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cThe warmth of the bacta restores\
you.\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6404, 
         TeleDelay = 0, 
         Description = "Like most of the rest of the ship even the crew quaters\
have been taken over with ship modifications.  The area \
that use to sleep 6 comfortably now holds room for 1 and \
in a pinch sleep up to 4 people.\
", 
         TeleVnum = 0, 
      }, 
      [6405] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6402, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Prisoner Hold", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6405, 
         TeleDelay = 0, 
         Description = "This modified cargo hold is used for the ships main cargo,\
bounties.  Force shielded and reinforced cages line the \
walls.  Six seperate cages are in the room each with room\
for 1 person.\
", 
         TeleVnum = 0, 
      }, 
      [6406] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Engine Room", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6406, 
         TeleDelay = 0, 
         Description = "In this room you can clearly see 2 of the largest modifications\
to this ship the old engine and generator have been replaced by\
the massive KES-F31 drive engine and XF-16 power generator.\
Giving this large ship the speed and agility of a y-wing.\
", 
         TeleVnum = 0, 
      }, 
      [6407] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "olympus", 
               Description = "", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Boarding Bay", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6407, 
         TeleDelay = 0, 
         Description = "You stand in the turbolift of one of the greatest starships\
ever made a CR90 Corellian \"Blockade Runner\". This ship\
is known for its ability to be easily modified to fit its \
current role in a campaign, anything from troop transport\
to front line fighter is in this ships awsome repetoir.\
", 
         TeleVnum = 0, 
      }, 
      [6408] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6419, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6433, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6422, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6438, 
               Distance = 0, 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6407, 
               Distance = 0, 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6456, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Stairwell", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6408, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6409] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6420, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6412, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6423, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Stairwell", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6409, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6410] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6421, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6447, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6456, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6442, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6410, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6411] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6424, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Kitchen", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6411, 
         TeleDelay = 0, 
         Description = "The level one hallway is built for war not plesentry so  \
it is bare metal walls and very little show, a metal walkway\
with emergancy lighting along it lead around this level.\
", 
         TeleVnum = 0, 
      }, 
      [6412] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6458, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6435, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6409, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6412, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6413] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6414, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6428, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Crew recreation center", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6413, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6414] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6413, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Crew recreation center", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6414, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6415] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6439, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Crew Barracks", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6415, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6416] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6439, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Crew Barracks", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6416, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6417] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A new, nonoperational turret", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6417, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6418] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A new, nonoperational turret", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6418, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6419] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6420, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6436, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6437, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6419, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6420] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6409, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6419, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6435, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6420, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6421] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6423, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6445, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6410, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6451, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6421, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6422] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Main engineering", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6422, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6423] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6427, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6421, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6409, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Stairwell", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6423, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6424] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6411, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6428, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Mess Hall", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6424, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6425] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6426, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6456, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6431, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Stairwell", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6425, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6426] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6428, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6450, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6425, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6449, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6426, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6427] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6423, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6444, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The main cargo bay", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6427, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6428] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6424, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6426, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6413, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6428, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6429] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6444, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6411, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6428, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6414, 
               Distance = 0, 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6423, 
               Distance = 0, 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6440, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Stairwell", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6429, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6430] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6409, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Stairwell", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6430, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6431] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6425, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6431, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6432] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6439, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6417, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6431, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6418, 
               Distance = 0, 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6441, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6432, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6433] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A small cargo bay", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6433, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6434] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6458, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Turret", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6434, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6435] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6412, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6420, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Turret", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6435, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6436] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6419, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Ship docking port", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6436, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6437] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6419, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Ship docking port", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6437, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6438] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A small cargo bay", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6438, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6439] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6440, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6415, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6416, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6439, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6440] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6439, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6440, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6441] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Ventral-mounted turbolaser", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6441, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6442] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6410, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6443, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Second Officer's Quarters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6442, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6443] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6442, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6443, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6444] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6427, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Lower cargo bay access", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6444, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6445] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6446, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6421, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "First Officer's Quarters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6445, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6446] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6445, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6446, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6447] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6448, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6410, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Engineer's Quarters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6447, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6448] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6447, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6448, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6449] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6426, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6453, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A large workshop", 
         Sector = "city", 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6449, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6450] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6454, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6426, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A large workshop", 
         Sector = "city", 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6450, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6451] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6421, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6452, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Captains Quaters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6451, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6452] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6451, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6452, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6453] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6449, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A dark refinery", 
         Sector = "city", 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6453, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6454] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6450, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A dark refinery", 
         Sector = "city", 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6454, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6455] = 
      {
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6455, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6456] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6410, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6425, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Stairwell", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6456, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6457] = 
      {
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6457, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6458] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6412, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6434, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
               DestinationVnum = 6460, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "northwest", 
               DestinationVnum = 6459, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The bridge", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6458, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6459] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6460, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "southeast", 
               DestinationVnum = 6458, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Pilot's chair", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6459, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6460] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6459, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
               DestinationVnum = 6458, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Copilot's chair", 
         Sector = "city", 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6460, 
         TeleDelay = 0, 
         Description = "The walls of this room are painted a mild blue. A large viewport is located\
on the south  wall allowing passengers to look out into space. A small\
wetbar and fridge are here for  the passengers convienince as well as a\
com to the kitchen.  \
", 
         TeleVnum = 0, 
      }, 
      [6461] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6462, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hatchway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6461, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6462] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6463, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6461, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Main Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6462, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6463] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6465, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6471, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6462, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6470, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Main Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6463, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6464] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6462, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6472, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6467, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6468, 
               Distance = 0, 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6466, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Main Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6464, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6465] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6463, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cockpit", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6465, 
         TeleDelay = 0, 
         Description = "The cockpit of this ship is a comfortable  2 seater although everything can\
easily be controlled by a single pilot. A modified YV-666 freighter this\
ship has more than enough power to run with the fighters, and enough\
shielding and weapons to fight with small cruisers.\
", 
         TeleVnum = 0, 
      }, 
      [6466] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Engine Room", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6466, 
         TeleDelay = 0, 
         Description = "The powerhouse of this small freigheter is located here. powering both\
shields and Engines from this room make maintenance easy. The modified\
engine allows this ship extra speed beyoynd what a normal frieghter can\
handle.\
", 
         TeleVnum = 0, 
      }, 
      [6467] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Crew Quarters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6467, 
         TeleDelay = 0, 
         Description = "A sparse living quarters is here.  Designed to be use when travlling on the\
hunt this ship has very little for creature comforts and is more bare bone\
to make you finish all that much sooner. \
", 
         TeleVnum = 0, 
      }, 
      [6468] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Laser Turret", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6468, 
         TeleDelay = 0, 
         Description = "A small bucket seat pivots inside a gyroscopic frame.  In front of the seat\
is the butterfly grip of a laser turret. Targeting controls light up a\
touch monitor in front of the seat. \
", 
         TeleVnum = 0, 
      }, 
      [6469] = 
      {
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "Cargo Hold", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6469, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6470] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6463, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Prisoner Room", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6470, 
         TeleDelay = 0, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out. \
", 
         TeleVnum = 0, 
      }, 
      [6471] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6463, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Prisoner Room", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6471, 
         TeleDelay = 0, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out.\
", 
         TeleVnum = 0, 
      }, 
      [6472] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Training Room", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6472, 
         TeleDelay = 0, 
         Description = "Around this room is various training equipment, designed for helping to\
keep in top form or even help in the recovery of wounds, this is the ideal\
place to stay in shape. \
", 
         TeleVnum = 0, 
      }, 
      [6473] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6474, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Boarding Ramp", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6473, 
         TeleDelay = 0, 
         Description = "This boarding ramp leads inside the modified YV-667 freighter, The Gleaming\
Fang.  The entrance to the cockpit is to the north, and the rest of the\
ship is down the hallway south.\
", 
         TeleVnum = 0, 
      }, 
      [6474] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6473, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cockpit", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6474, 
         TeleDelay = 0, 
         Description = "The cockpit is quite spacious. There is a pilot and co-pilot seat, but the\
control panel is modified to be easily accessible to the pilot. The\
controls have been rebuilt, so a Trandoshan pilot can manipulate them.\
", 
         TeleVnum = 0, 
      }, 
      [6475] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6473, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6484, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6488, 
               Distance = 0, 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6476, 
               Distance = 0, 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6477, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6475, 
         TeleDelay = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the galley, and the door to the east leads to the\
'fresher station'. A small ladder provides access to the dorsal and\
ventral turrets, and the hallway continues south.\
", 
         TeleVnum = 0, 
      }, 
      [6476] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Dorsal Turret", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6476, 
         TeleDelay = 0, 
         Description = "This is the dorsal turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         TeleVnum = 0, 
      }, 
      [6477] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Ventral Turret", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6477, 
         TeleDelay = 0, 
         Description = "This is the ventral turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         TeleVnum = 0, 
      }, 
      [6478] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6489, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6479, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6483, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6478, 
         TeleDelay = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the Captain's quarters. The door to the east leads to\
the crew quarters, and the hallway continues south. \
", 
         TeleVnum = 0, 
      }, 
      [6479] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6480, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6485, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6479, 
         TeleDelay = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls are regular intervals. A ladder\
leads down to the large cargo bay, and holding cells are to the south.\
", 
         TeleVnum = 0, 
      }, 
      [6480] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6479, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "southeast", 
               DestinationVnum = 6482, 
               Distance = 0, 
               Key = 20504, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "southwest", 
               DestinationVnum = 6481, 
               Distance = 0, 
               Key = 20504, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Skinning Room", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6480, 
         TeleDelay = 0, 
         Description = "This room has all the equipment needed to skin and preserve hides. There is\
a long gleaming table in the middle of the room.  A groove runs down one\
side of the table to drain blood and other fluids into a waste disposal\
unit. A dipping tank for curing hides is a one end of the table, and there\
is a skinning apparatus mounted above the table. There are two holding\
cells here. The main hallway is to the north.\
", 
         TeleVnum = 0, 
      }, 
      [6481] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "northeast", 
               DestinationVnum = 6480, 
               Distance = 0, 
               Key = 20504, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Holding Cell #1", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6481, 
         TeleDelay = 0, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle. \
", 
         TeleVnum = 0, 
      }, 
      [6482] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "northwest", 
               DestinationVnum = 6480, 
               Distance = 0, 
               Key = 20504, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Holding Cell #2", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6482, 
         TeleDelay = 0, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle.\
", 
         TeleVnum = 0, 
      }, 
      [6483] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Captain's Quarters", 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho The bacta heals your wounds.\
feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
", 
               Arguments = "25 ", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6483, 
         TeleDelay = 0, 
         Description = "There is a large bunk on one side of the captain's room. On the other side\
of the room, there is a large storage locker. A small desk littered with\
paperwork is against the wall between the bunk and the locker.\
", 
         TeleVnum = 0, 
      }, 
      [6484] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 1, 
         Name = "The Refresher", 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cYou wash around your troubles.\
", 
               Arguments = "70", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6484, 
         TeleDelay = 0, 
         Description = "This is a standard refresher unit. There is just barely enough room inside\
for a Trandoshan.\
", 
         TeleVnum = 0, 
      }, 
      [6485] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6487, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6479, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cargo Bay", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6485, 
         TeleDelay = 0, 
         Description = "The stock cargo bay on a YV-667 is quite large, but a large portion of this\
cargo bay has been converted into a landing bay for a scout craft. There\
is a ladder leading up to the main hallway and the engine room is to the\
south.\
", 
         TeleVnum = 0, 
      }, 
      [6486] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6498, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6494, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6495, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Lounge", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6486, 
         TeleDelay = 0, 
         Description = "the lounge of this ship serves dual purpose, it is ment for the\
entertainment of guests as well as for meetings between the captain and\
crew or prospective employers. \
", 
         TeleVnum = 0, 
      }, 
      [6487] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6485, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Engine Room", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6487, 
         TeleDelay = 0, 
         Description = "The engines on this ship have been heavily upgraded to provide  energy to\
the power draining modifications that have been added to the ship. There\
are blinking readouts a shipboard com station here. There is a small tool\
locker mounted on one bulkhead. \
", 
         TeleVnum = 0, 
      }, 
      [6488] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Galley", 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10313\
mpecho A packaged ration pops from the station.\
drop all\
", 
               Arguments = "food ration", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6488, 
         TeleDelay = 0, 
         Description = "The ship's galley may be small, but it is efficiently designed. There is a\
sink and a small food-prep station here. Food storage compartments have\
been mounted overhead to save space. There is a small table and four\
chairs in the middle of the room. \
", 
         TeleVnum = 0, 
      }, 
      [6489] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Crew Quarters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6489, 
         TeleDelay = 0, 
         Description = "This room has three small bunks attached to the far bulkhead. There are\
also three small storage lockers mounted to the northern bulkhead.\
", 
         TeleVnum = 0, 
      }, 
      [6490] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6489, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Crew Quaters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6490, 
         TeleDelay = 0, 
         Description = "A spare crew quarters is located here. Rows of bunks with foot lockers line\
the walls and a door on the noth wall leads into the captains quarters.\
", 
         TeleVnum = 0, 
      }, 
      [6491] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6492, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6476, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Passenger Quaters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6491, 
         TeleDelay = 0, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters.\
", 
         TeleVnum = 0, 
      }, 
      [6492] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6491, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Passenger Quaters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6492, 
         TeleDelay = 0, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters. \
", 
         TeleVnum = 0, 
      }, 
      [6493] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6499, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Bridge Hatch", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6493, 
         TeleDelay = 0, 
         Description = "A small hatchway leads from the main ship into the cockpit of the ship.\
this is one of the many changes made fron the old YV-1300 into this newer\
model. Micro-electronics has allowed for minaturizatin of controlls and\
systems  making this hallway an ideal like to all the ships systems.\
", 
         TeleVnum = 0, 
      }, 
      [6494] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6486, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Top Turrent", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6494, 
         TeleDelay = 0, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         TeleVnum = 0, 
      }, 
      [6495] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6486, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Bottom Turrent", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6495, 
         TeleDelay = 0, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         TeleVnum = 0, 
      }, 
      [6496] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6499, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6482, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
               DestinationVnum = 6474, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6496, 
         TeleDelay = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         TeleVnum = 0, 
      }, 
      [6497] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6498, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6497, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6498] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6486, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6497, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "northwest", 
               DestinationVnum = 6499, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
               DestinationVnum = 6476, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6498, 
         TeleDelay = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         TeleVnum = 0, 
      }, 
      [6499] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6493, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6496, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6473, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "southeast", 
               DestinationVnum = 6498, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6499, 
         TeleDelay = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting around.\
It leads in a circular path around the ship.\
", 
         TeleVnum = 0, 
      }, 
      [6500] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cockpit", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6500, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6501] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6502, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6512, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6500, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6514, 
               Distance = 0, 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Direction = "down", 
               DestinationVnum = 6513, 
               Distance = 0, 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "northwest", 
               DestinationVnum = 6515, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6501, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6502] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6503, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6505, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Spice Lady Lounge", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6502, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6503] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6502, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6504, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Equipment Bay", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6503, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6504] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6503, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Engineroom", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6504, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6505] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6507, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6506, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6502, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6505, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6506] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6505, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6508, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Sleeping Quarters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6506, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6507] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6509, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6505, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cargo Bay", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6507, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6508] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6506, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Sleeping Quarters", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6508, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6509] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 6510, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6507, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cargo bay", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6509, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6510] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 6509, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
               DestinationVnum = 6511, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cargo Bay", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6510, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6511] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6512, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
               DestinationVnum = 6510, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6511, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6512] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6511, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6517, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6516, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6512, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6513] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "up", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Smuggler's Compartment", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6513, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6514] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Boarding Ramp", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6514, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6515] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "southeast", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Hanger", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6515, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6516] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 6512, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Turret", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6516, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6517] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 6512, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Turret", 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6517, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [6518] = 
      {
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "Spice Lady A-wing", 
         Sector = "field", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6518, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
   }, 
   HighEconomy = 0, 
   ResetMessage = "", 
   Name = "Some Hunter Spacecraft", 
   Mobiles = 
   {
      [6400] = 
      {
         Credits = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         DamRoll = 0, 
         ShortDescr = "Weapons Dealer", 
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
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 50, 
         }, 
         ArmorClass = 0, 
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
         Level = 1, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Luck = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         Position = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A shadey looking character is here.\
", 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         NumberOfAttacks = 0, 
         Vnum = 6400, 
         Name = "Weapons Dealer", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 6400, 
         Arg2 = 1, 
         Arg3 = 6460, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [2] = 
      {
         Arg1 = 6401, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [3] = 
      {
         Arg1 = 6400, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [4] = 
      {
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [5] = 
      {
         Arg1 = 6480, 
         Arg2 = 8, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
      }, 
      [6] = 
      {
         Arg1 = 6480, 
         Arg2 = 9, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
      }, 
      [7] = 
      {
         Arg1 = 5190, 
         Arg2 = 17, 
         Arg3 = 6411, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg1 = 204, 
         Arg2 = 92, 
         Arg3 = 6407, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg1 = 204, 
         Arg2 = 92, 
         Arg3 = 6407, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg1 = 204, 
         Arg2 = 92, 
         Arg3 = 6407, 
         Command = "M", 
         MiscData = 1, 
      }, 
   }, 
   VnumRanges = 
   {
      Room = 
      {
         Last = 6518, 
         First = 6400, 
      }, 
      Mob = 
      {
         Last = 6400, 
         First = 6400, 
      }, 
      Object = 
      {
         Last = 6401, 
         First = 6400, 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
      Soft = 
      {
         High = 103, 
         Low = 0, 
      }, 
   }, 
   LowEconomy = 31277379, 
   FileFormatVersion = 1, 
   Filename = "hunter_ships.lua", 
   ResetFrequency = 0, 
}
