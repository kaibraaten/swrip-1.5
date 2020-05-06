-- Some Hunter Spacecraft
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   Filename = "hunter_ships.lua", 
   Rooms = 
   {
      [6400] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Boarding Slave 1", 
         Description = "You stand upon in the boarding hatch of on of the most famous\
ships of all time.  A bounty hunters Customized KDY Firespray\
built for speed and firepower.  As you enter you must pass through \
a series of security detectors and camaras.\
", 
         Vnum = 6400, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6401, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6401] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "Having passed through the various security checks you \
finally stand in the hallway of slave 1.  This ships odd \
design means things arn't normally where they should be.  \
A latter leads up into the bridge, to the north you see a \
cargo hold and south of you looks like someones living area.\
A small hatch in the floor rumbles with the vibrations from \
the engines.\
", 
         Vnum = 6401, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6402, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6404, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6400, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6403, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [5] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6406, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6402] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cargo Hold", 
         Description = "This ship has a fairly small cargo hold.  Most of the old \
holds area has been taken over in the modifications of the\
engines and shields.  There is still room for about a \
months worth of supplys for the ships single crew memeber.\
", 
         Vnum = 6402, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6401, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6405, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6403] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bridge", 
         Description = "The bridge of slave 1 is very cramped, however everything is within easy\
reach of the comfortable captains chair.  all systems may be monitored\
from this room including prisoner status and even the boading area. \
Controls for various  modifications made on the ship are all located here.\
", 
         Vnum = 6403, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6401, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6404] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Crew Quarters", 
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
               MudProgType = "rand_prog", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cThe warmth of the bacta restores\
you.\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6401, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6405] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Prisoner Hold", 
         Description = "This modified cargo hold is used for the ships main cargo,\
bounties.  Force shielded and reinforced cages line the \
walls.  Six seperate cages are in the room each with room\
for 1 person.\
", 
         Vnum = 6405, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6402, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6406] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Engine Room", 
         Description = "In this room you can clearly see 2 of the largest modifications\
to this ship the old engine and generator have been replaced by\
the massive KES-F31 drive engine and XF-16 power generator.\
Giving this large ship the speed and agility of a y-wing.\
", 
         Vnum = 6406, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6401, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6407] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Boarding Bay", 
         Description = "You stand in the turbolift of one of the greatest starships\
ever made a CR90 Corellian \"Blockade Runner\". This ship\
is known for its ability to be easily modified to fit its \
current role in a campaign, anything from troop transport\
to front line fighter is in this ships awsome repetoir.\
", 
         Vnum = 6407, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Keyword = "olympus", 
               DestinationVnum = 6408, 
               Description = "", 
               Key = -1, 
               Direction = "somewhere", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
      }, 
      [6408] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Stairwell", 
         Description = "", 
         Vnum = 6408, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6419, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6433, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6422, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6438, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6407, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [6] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6456, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6409] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Stairwell", 
         Description = "", 
         Vnum = 6409, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6420, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6412, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6423, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6410] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6410, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6421, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6447, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6456, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6442, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6411] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Kitchen", 
         Description = "The level one hallway is built for war not plesentry so  \
it is bare metal walls and very little show, a metal walkway\
with emergancy lighting along it lead around this level.\
", 
         Vnum = 6411, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6424, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6429, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6412] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6412, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6458, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6435, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6409, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6413] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Crew recreation center", 
         Description = "", 
         Vnum = 6413, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6414, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6428, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6414] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Crew recreation center", 
         Description = "", 
         Vnum = 6414, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6429, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6413, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6415] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Crew Barracks", 
         Description = "", 
         Vnum = 6415, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6439, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6416] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Crew Barracks", 
         Description = "", 
         Vnum = 6416, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6439, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6417] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A new, nonoperational turret", 
         Description = "", 
         Vnum = 6417, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6432, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6418] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A new, nonoperational turret", 
         Description = "", 
         Vnum = 6418, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6432, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6419] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6419, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6420, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6436, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6408, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6437, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6420] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6420, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6409, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6419, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6435, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6421] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6421, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6423, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6445, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6410, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6451, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6422] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Main engineering", 
         Description = "", 
         Vnum = 6422, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6408, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6423] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Stairwell", 
         Description = "", 
         Vnum = 6423, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6427, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6421, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6409, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6429, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6424] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mess Hall", 
         Description = "", 
         Vnum = 6424, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6411, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6428, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6425] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Stairwell", 
         Description = "", 
         Vnum = 6425, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6426, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6456, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6431, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6426] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6426, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6428, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6450, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6425, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6449, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6427] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The main cargo bay", 
         Description = "", 
         Vnum = 6427, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6423, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6444, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6428] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6428, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6429, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6424, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6426, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6413, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6429] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Stairwell", 
         Description = "", 
         Vnum = 6429, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6444, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6411, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6428, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6414, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6423, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [6] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6440, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6430] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Stairwell", 
         Description = "", 
         Vnum = 6430, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6409, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6431] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6431, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6432, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6425, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6432] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6432, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6439, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6417, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6431, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6418, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6441, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6433] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A small cargo bay", 
         Description = "", 
         Vnum = 6433, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6408, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6434] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Turret", 
         Description = "", 
         Vnum = 6434, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6458, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6435] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Turret", 
         Description = "", 
         Vnum = 6435, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6412, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6420, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6436] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ship docking port", 
         Description = "", 
         Vnum = 6436, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6419, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6437] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ship docking port", 
         Description = "", 
         Vnum = 6437, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6419, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6438] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A small cargo bay", 
         Description = "", 
         Vnum = 6438, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6408, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6439] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6439, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6440, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6415, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6432, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6416, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6440] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6440, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6439, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6429, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6441] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ventral-mounted turbolaser", 
         Description = "", 
         Vnum = 6441, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6432, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6442] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Second Officer's Quarters", 
         Description = "", 
         Vnum = 6442, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6410, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6443, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6443] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bedroom", 
         Description = "", 
         Vnum = 6443, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6442, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6444] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Lower cargo bay access", 
         Description = "", 
         Vnum = 6444, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6429, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6427, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6445] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "First Officer's Quarters", 
         Description = "", 
         Vnum = 6445, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6446, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6421, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6446] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bedroom", 
         Description = "", 
         Vnum = 6446, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6445, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6447] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Engineer's Quarters", 
         Description = "", 
         Vnum = 6447, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6448, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6410, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6448] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bedroom", 
         Description = "", 
         Vnum = 6448, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6447, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
      }, 
      [6449] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A large workshop", 
         Description = "", 
         Vnum = 6449, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6426, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6453, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6450] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A large workshop", 
         Description = "", 
         Vnum = 6450, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6454, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6426, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6451] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Captains Quaters", 
         Description = "", 
         Vnum = 6451, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6421, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6452, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6452] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bedroom", 
         Description = "", 
         Vnum = 6452, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6451, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6453] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A dark refinery", 
         Description = "", 
         Vnum = 6453, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6449, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6454] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A dark refinery", 
         Description = "", 
         Vnum = 6454, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6450, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6455] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6455, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6456] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Stairwell", 
         Description = "", 
         Vnum = 6456, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6410, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6408, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6425, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6457] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6457, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6458] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The bridge", 
         Description = "", 
         Vnum = 6458, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6412, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6434, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6460, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6459, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6459] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Pilot's chair", 
         Description = "", 
         Vnum = 6459, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6460, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6458, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6460] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Copilot's chair", 
         Description = "The walls of this room are painted a mild blue. A large viewport is located\
on the south  wall allowing passengers to look out into space. A small\
wetbar and fridge are here for  the passengers convienince as well as a\
com to the kitchen.  \
", 
         Vnum = 6460, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6459, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6458, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6461] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hatchway", 
         Description = "", 
         Vnum = 6461, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6462, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6462] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Main Hallway", 
         Description = "", 
         Vnum = 6462, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6463, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6464, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6461, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6463] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Main Hallway", 
         Description = "", 
         Vnum = 6463, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6465, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6471, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6462, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6470, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6464] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Main Hallway", 
         Description = "", 
         Vnum = 6464, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6462, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6472, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6467, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6468, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6466, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6465] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cockpit", 
         Description = "The cockpit of this ship is a comfortable  2 seater although everything can\
easily be controlled by a single pilot. A modified YV-666 freighter this\
ship has more than enough power to run with the fighters, and enough\
shielding and weapons to fight with small cruisers.\
", 
         Vnum = 6465, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6463, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6466] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Engine Room", 
         Description = "The powerhouse of this small freigheter is located here. powering both\
shields and Engines from this room make maintenance easy. The modified\
engine allows this ship extra speed beyoynd what a normal frieghter can\
handle.\
", 
         Vnum = 6466, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6464, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6467] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Crew Quarters", 
         Description = "A sparse living quarters is here.  Designed to be use when travlling on the\
hunt this ship has very little for creature comforts and is more bare bone\
to make you finish all that much sooner. \
", 
         Vnum = 6467, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6464, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6468] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Laser Turret", 
         Description = "A small bucket seat pivots inside a gyroscopic frame.  In front of the seat\
is the butterfly grip of a laser turret. Targeting controls light up a\
touch monitor in front of the seat. \
", 
         Vnum = 6468, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6464, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6469] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cargo Hold", 
         Description = "", 
         Vnum = 6469, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6470] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Prisoner Room", 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out. \
", 
         Vnum = 6470, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6463, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6471] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Prisoner Room", 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out.\
", 
         Vnum = 6471, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6463, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6472] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Training Room", 
         Description = "Around this room is various training equipment, designed for helping to\
keep in top form or even help in the recovery of wounds, this is the ideal\
place to stay in shape. \
", 
         Vnum = 6472, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6464, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6473] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Boarding Ramp", 
         Description = "This boarding ramp leads inside the modified YV-667 freighter, The Gleaming\
Fang.  The entrance to the cockpit is to the north, and the rest of the\
ship is down the hallway south.\
", 
         Vnum = 6473, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6474, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6475, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6474] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cockpit", 
         Description = "The cockpit is quite spacious. There is a pilot and co-pilot seat, but the\
control panel is modified to be easily accessible to the pilot. The\
controls have been rebuilt, so a Trandoshan pilot can manipulate them.\
", 
         Vnum = 6474, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6473, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6475] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the galley, and the door to the east leads to the\
'fresher station'. A small ladder provides access to the dorsal and\
ventral turrets, and the hallway continues south.\
", 
         Vnum = 6475, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6473, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6484, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6478, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6488, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6476, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [6] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6477, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6476] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Dorsal Turret", 
         Description = "This is the dorsal turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         Vnum = 6476, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6475, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6477] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ventral Turret", 
         Description = "This is the ventral turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         Vnum = 6477, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6475, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6478] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the Captain's quarters. The door to the east leads to\
the crew quarters, and the hallway continues south. \
", 
         Vnum = 6478, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6475, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6489, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6479, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6483, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6479] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls are regular intervals. A ladder\
leads down to the large cargo bay, and holding cells are to the south.\
", 
         Vnum = 6479, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6478, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6480, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6485, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6480] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Skinning Room", 
         Description = "This room has all the equipment needed to skin and preserve hides. There is\
a long gleaming table in the middle of the room.  A groove runs down one\
side of the table to drain blood and other fluids into a waste disposal\
unit. A dipping tank for curing hides is a one end of the table, and there\
is a skinning apparatus mounted above the table. There are two holding\
cells here. The main hallway is to the north.\
", 
         Vnum = 6480, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6479, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 6482, 
               Description = "", 
               Key = 20504, 
               Direction = "southeast", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 6481, 
               Description = "", 
               Key = 20504, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6481] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Holding Cell #1", 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle. \
", 
         Vnum = 6481, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 6480, 
               Description = "", 
               Key = 20504, 
               Direction = "northeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6482] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Holding Cell #2", 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle.\
", 
         Vnum = 6482, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 6480, 
               Description = "", 
               Key = 20504, 
               Direction = "northwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6483] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Captain's Quarters", 
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
               MudProgType = "rand_prog", 
               Code = "mpecho The bacta heals your wounds.\
feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6478, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6484] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Refresher", 
         Description = "This is a standard refresher unit. There is just barely enough room inside\
for a Trandoshan.\
", 
         Vnum = 6484, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "70", 
               MudProgType = "rand_prog", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cYou wash around your troubles.\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 1, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6475, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6485] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cargo Bay", 
         Description = "The stock cargo bay on a YV-667 is quite large, but a large portion of this\
cargo bay has been converted into a landing bay for a scout craft. There\
is a ladder leading up to the main hallway and the engine room is to the\
south.\
", 
         Vnum = 6485, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6487, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6479, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6486] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Lounge", 
         Description = "the lounge of this ship serves dual purpose, it is ment for the\
entertainment of guests as well as for meetings between the captain and\
crew or prospective employers. \
", 
         Vnum = 6486, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6498, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6494, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6495, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6487] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Engine Room", 
         Description = "The engines on this ship have been heavily upgraded to provide  energy to\
the power draining modifications that have been added to the ship. There\
are blinking readouts a shipboard com station here. There is a small tool\
locker mounted on one bulkhead. \
", 
         Vnum = 6487, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6485, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6488] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Galley", 
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
               MudProgType = "speech_prog", 
               Code = "mpoload 10313\
mpecho A packaged ration pops from the station.\
drop all\
", 
            }, 
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6475, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6489] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Crew Quarters", 
         Description = "This room has three small bunks attached to the far bulkhead. There are\
also three small storage lockers mounted to the northern bulkhead.\
", 
         Vnum = 6489, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6478, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
      }, 
      [6490] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Crew Quaters", 
         Description = "A spare crew quarters is located here. Rows of bunks with foot lockers line\
the walls and a door on the noth wall leads into the captains quarters.\
", 
         Vnum = 6490, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6489, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6475, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6491] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Passenger Quaters", 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters.\
", 
         Vnum = 6491, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6492, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6476, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6492] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Passenger Quaters", 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters. \
", 
         Vnum = 6492, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6491, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6493] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bridge Hatch", 
         Description = "A small hatchway leads from the main ship into the cockpit of the ship.\
this is one of the many changes made fron the old YV-1300 into this newer\
model. Micro-electronics has allowed for minaturizatin of controlls and\
systems  making this hallway an ideal like to all the ships systems.\
", 
         Vnum = 6493, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6478, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6499, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6494] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Top Turrent", 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         Vnum = 6494, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6486, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6495] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bottom Turrent", 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         Vnum = 6495, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6486, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6496] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         Vnum = 6496, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6499, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6482, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6474, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6497] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6497, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6498, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6498] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         Vnum = 6498, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6486, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6497, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6499, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6476, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6499] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "The hallway is a simple grey metel with various emergency lighting around.\
It leads in a circular path around the ship.\
", 
         Vnum = 6499, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6493, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6496, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6473, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6498, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6500] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cockpit", 
         Description = "", 
         Vnum = 6500, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6501, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6501] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6501, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6502, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6512, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6500, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6514, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               DestinationVnum = 6513, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
            [6] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6515, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6502] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Spice Lady Lounge", 
         Description = "", 
         Vnum = 6502, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6503, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6505, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6501, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6503] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Equipment Bay", 
         Description = "", 
         Vnum = 6503, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6502, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6504, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6504] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Engineroom", 
         Description = "", 
         Vnum = 6504, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6503, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6505] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6505, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6507, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6506, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6502, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6506] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sleeping Quarters", 
         Description = "", 
         Vnum = 6506, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6505, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6508, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6507] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cargo Bay", 
         Description = "", 
         Vnum = 6507, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6509, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6505, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6508] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sleeping Quarters", 
         Description = "", 
         Vnum = 6508, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6506, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6509] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cargo bay", 
         Description = "", 
         Vnum = 6509, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6510, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6507, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6510] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cargo Bay", 
         Description = "", 
         Vnum = 6510, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6509, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6511, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6511] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6511, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6512, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6510, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6512] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Description = "", 
         Vnum = 6512, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6511, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6501, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6517, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6516, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6513] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Smuggler's Compartment", 
         Description = "", 
         Vnum = 6513, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 6501, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6514] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Boarding Ramp", 
         Description = "", 
         Vnum = 6514, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6501, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6515] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hanger", 
         Description = "", 
         Vnum = 6515, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6501, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6516] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Turret", 
         Description = "", 
         Vnum = 6516, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6512, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6517] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Turret", 
         Description = "", 
         Vnum = 6517, 
         Sector = "city", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 6512, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6518] = 
      {
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Spice Lady A-wing", 
         Description = "", 
         Vnum = 6518, 
         Sector = "field", 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
   }, 
   Name = "Some Hunter Spacecraft", 
   Objects = 
   {
      [6400] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Name = "Wrist comlink", 
         ActionDescription = "", 
         ShortDescr = "wrist comlink", 
         ItemType = "comlink", 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 50, 
         Weight = 2, 
         Layers = 0, 
         Description = "A funny looking wristband lies here.", 
      }, 
      [6401] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 2, 
         Name = "sniper scope", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This small scope looks as if it could improve your aim buy quite a bit\
\13", 
               Keyword = "sniper scope", 
            }, 
         }, 
         ShortDescr = "A sniper scope.", 
         ItemType = "scope", 
         Vnum = 6401, 
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
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
            [2] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
         }, 
         Description = "A small scope is in the dirt here.", 
         Layers = 0, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
      }, 
   }, 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   Author = "Bleeds", 
   LowEconomy = 31277379, 
   ResetMessage = "", 
   Mobiles = 
   {
      [6400] = 
      {
         ArmorClass = 0, 
         Weight = 0, 
         LongDescr = "A shadey looking character is here.\
", 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         DamRoll = 0, 
         Vnum = 6400, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
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
         Shop = 
         {
            KeeperShortDescr = "Weapons Dealer", 
            KeeperVnum = 6400, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 150, 
            BuyTypes = 
            {
               [1] = "weapon", 
               [2] = "armor", 
               [3] = "landmine", 
               [4] = "none", 
               [0] = "grenade", 
            }, 
            ProfitSell = 50, 
         }, 
         Height = 0, 
         Name = "Weapons Dealer", 
         Stats = 
         {
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Race = "Human", 
         Level = 1, 
         ShortDescr = "Weapons Dealer", 
         Credits = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Position = "standing", 
         HitRoll = 0, 
      }, 
   }, 
   ResetFrequency = 0, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Command = "M", 
         Arg3 = 6460, 
         Arg1 = 6400, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Arg1 = 6401, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Arg1 = 6400, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Arg1 = 53, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg3 = 2, 
         Arg1 = 6480, 
         Arg2 = 8, 
      }, 
      [6] = 
      {
         MiscData = 0, 
         Command = "D", 
         Arg3 = 2, 
         Arg1 = 6480, 
         Arg2 = 9, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg3 = 6411, 
         Arg1 = 5190, 
         Arg2 = 17, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg3 = 6407, 
         Arg1 = 204, 
         Arg2 = 92, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg3 = 6407, 
         Arg1 = 204, 
         Arg2 = 92, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Command = "M", 
         Arg3 = 6407, 
         Arg1 = 204, 
         Arg2 = 92, 
      }, 
   }, 
}
