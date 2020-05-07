-- Some Hunter Spacecraft
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Rooms = 
   {
      [6400] = 
      {
         Name = "Boarding Slave 1", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "You stand upon in the boarding hatch of on of the most famous\
ships of all time.  A bounty hunters Customized KDY Firespray\
built for speed and firepower.  As you enter you must pass through \
a series of security detectors and camaras.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6401, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6400, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6401] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Having passed through the various security checks you \
finally stand in the hallway of slave 1.  This ships odd \
design means things arn't normally where they should be.  \
A latter leads up into the bridge, to the north you see a \
cargo hold and south of you looks like someones living area.\
A small hatch in the floor rumbles with the vibrations from \
the engines.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6402, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6404, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6400, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6403, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 6406, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6401, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6402] = 
      {
         Name = "Cargo Hold", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This ship has a fairly small cargo hold.  Most of the old \
holds area has been taken over in the modifications of the\
engines and shields.  There is still room for about a \
months worth of supplys for the ships single crew memeber.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6401, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6405, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6402, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6403] = 
      {
         Name = "Bridge", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The bridge of slave 1 is very cramped, however everything is within easy\
reach of the comfortable captains chair.  all systems may be monitored\
from this room including prisoner status and even the boading area. \
Controls for various  modifications made on the ship are all located here.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6401, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6403, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6404] = 
      {
         Name = "Crew Quarters", 
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
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Like most of the rest of the ship even the crew quaters\
have been taken over with ship modifications.  The area \
that use to sleep 6 comfortably now holds room for 1 and \
in a pinch sleep up to 4 people.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6401, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6404, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6405] = 
      {
         Name = "Prisoner Hold", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This modified cargo hold is used for the ships main cargo,\
bounties.  Force shielded and reinforced cages line the \
walls.  Six seperate cages are in the room each with room\
for 1 person.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6402, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6405, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6406] = 
      {
         Name = "Engine Room", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "In this room you can clearly see 2 of the largest modifications\
to this ship the old engine and generator have been replaced by\
the massive KES-F31 drive engine and XF-16 power generator.\
Giving this large ship the speed and agility of a y-wing.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6401, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6406, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6407] = 
      {
         Name = "Boarding Bay", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "You stand in the turbolift of one of the greatest starships\
ever made a CR90 Corellian \"Blockade Runner\". This ship\
is known for its ability to be easily modified to fit its \
current role in a campaign, anything from troop transport\
to front line fighter is in this ships awsome repetoir.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6408, 
               Key = -1, 
               Distance = 0, 
               Direction = "somewhere", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Keyword = "olympus", 
            }, 
         }, 
         Vnum = 6407, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
      }, 
      [6408] = 
      {
         Name = "Stairwell", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6419, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6433, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6422, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6438, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 6407, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [6] = 
            {
               DestinationVnum = 6456, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6408, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6409] = 
      {
         Name = "Stairwell", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6420, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6412, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6423, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6409, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6410] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6421, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6447, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6456, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6442, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6410, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6411] = 
      {
         Name = "Kitchen", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The level one hallway is built for war not plesentry so  \
it is bare metal walls and very little show, a metal walkway\
with emergancy lighting along it lead around this level.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6424, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6429, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6411, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6412] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6458, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6435, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6409, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6412, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6413] = 
      {
         Name = "Crew recreation center", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6414, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6428, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6413, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6414] = 
      {
         Name = "Crew recreation center", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6429, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6413, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6414, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6415] = 
      {
         Name = "Crew Barracks", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6439, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6415, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6416] = 
      {
         Name = "Crew Barracks", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6439, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6416, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6417] = 
      {
         Name = "A new, nonoperational turret", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6432, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6417, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6418] = 
      {
         Name = "A new, nonoperational turret", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6432, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6418, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6419] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6420, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6436, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6408, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6437, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6419, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6420] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6409, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6419, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6435, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6420, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6421] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6423, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6445, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6410, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6451, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6421, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6422] = 
      {
         Name = "Main engineering", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6408, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6422, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6423] = 
      {
         Name = "Stairwell", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6427, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6421, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6409, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6429, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6423, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6424] = 
      {
         Name = "Mess Hall", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6411, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6428, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6424, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6425] = 
      {
         Name = "Stairwell", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6426, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6456, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6431, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6425, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6426] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6428, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6450, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6425, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6449, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6426, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6427] = 
      {
         Name = "The main cargo bay", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6423, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6444, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6427, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6428] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6429, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6424, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6426, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6413, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6428, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6429] = 
      {
         Name = "Stairwell", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6444, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6411, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6428, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6414, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 6423, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [6] = 
            {
               DestinationVnum = 6440, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6429, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6430] = 
      {
         Name = "Stairwell", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6409, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6430, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6431] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6432, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6425, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6431, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6432] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6439, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6417, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6431, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6418, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 6441, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6432, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6433] = 
      {
         Name = "A small cargo bay", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6408, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6433, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6434] = 
      {
         Name = "Turret", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6458, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6434, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6435] = 
      {
         Name = "Turret", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6412, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6420, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6435, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6436] = 
      {
         Name = "Ship docking port", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6419, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6436, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6437] = 
      {
         Name = "Ship docking port", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6419, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6437, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6438] = 
      {
         Name = "A small cargo bay", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6408, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6438, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6439] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6440, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6415, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6432, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6416, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6439, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6440] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6439, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6429, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6440, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6441] = 
      {
         Name = "Ventral-mounted turbolaser", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6432, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6441, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6442] = 
      {
         Name = "Second Officer's Quarters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6410, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6443, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6442, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6443] = 
      {
         Name = "Bedroom", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6442, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6443, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6444] = 
      {
         Name = "Lower cargo bay access", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6429, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6427, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6444, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6445] = 
      {
         Name = "First Officer's Quarters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6446, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6421, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6445, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6446] = 
      {
         Name = "Bedroom", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6445, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6446, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6447] = 
      {
         Name = "Engineer's Quarters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6448, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6410, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6447, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6448] = 
      {
         Name = "Bedroom", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6447, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6448, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
      }, 
      [6449] = 
      {
         Name = "A large workshop", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6426, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6453, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6449, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6450] = 
      {
         Name = "A large workshop", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6454, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6426, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6450, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6451] = 
      {
         Name = "Captains Quaters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6421, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6452, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6451, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6452] = 
      {
         Name = "Bedroom", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6451, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6452, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6453] = 
      {
         Name = "A dark refinery", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6449, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6453, 
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
      }, 
      [6454] = 
      {
         Name = "A dark refinery", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6450, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6454, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6455] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Vnum = 6455, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6456] = 
      {
         Name = "Stairwell", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6410, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6408, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6425, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6456, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6457] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Vnum = 6457, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6458] = 
      {
         Name = "The bridge", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6412, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6434, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6460, 
               Key = -1, 
               Distance = 0, 
               Direction = "northeast", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6459, 
               Key = -1, 
               Distance = 0, 
               Direction = "northwest", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6458, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6459] = 
      {
         Name = "Pilot's chair", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6460, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6458, 
               Key = -1, 
               Distance = 0, 
               Direction = "southeast", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6459, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6460] = 
      {
         Name = "Copilot's chair", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The walls of this room are painted a mild blue. A large viewport is located\
on the south  wall allowing passengers to look out into space. A small\
wetbar and fridge are here for  the passengers convienince as well as a\
com to the kitchen.  \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6459, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6458, 
               Key = -1, 
               Distance = 0, 
               Direction = "southwest", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6460, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6461] = 
      {
         Name = "Hatchway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6462, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6461, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6462] = 
      {
         Name = "Main Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6463, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6464, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6461, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6462, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6463] = 
      {
         Name = "Main Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6465, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6471, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6462, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6470, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6463, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6464] = 
      {
         Name = "Main Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6462, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6472, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6467, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6468, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 6466, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6464, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6465] = 
      {
         Name = "Cockpit", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The cockpit of this ship is a comfortable  2 seater although everything can\
easily be controlled by a single pilot. A modified YV-666 freighter this\
ship has more than enough power to run with the fighters, and enough\
shielding and weapons to fight with small cruisers.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6463, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6465, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6466] = 
      {
         Name = "Engine Room", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The powerhouse of this small freigheter is located here. powering both\
shields and Engines from this room make maintenance easy. The modified\
engine allows this ship extra speed beyoynd what a normal frieghter can\
handle.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6464, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6466, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6467] = 
      {
         Name = "Crew Quarters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "A sparse living quarters is here.  Designed to be use when travlling on the\
hunt this ship has very little for creature comforts and is more bare bone\
to make you finish all that much sooner. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6464, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6467, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6468] = 
      {
         Name = "Laser Turret", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "A small bucket seat pivots inside a gyroscopic frame.  In front of the seat\
is the butterfly grip of a laser turret. Targeting controls light up a\
touch monitor in front of the seat. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6464, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6468, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6469] = 
      {
         Name = "Cargo Hold", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Vnum = 6469, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6470] = 
      {
         Name = "Prisoner Room", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6463, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6470, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6471] = 
      {
         Name = "Prisoner Room", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6463, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6471, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6472] = 
      {
         Name = "Training Room", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Around this room is various training equipment, designed for helping to\
keep in top form or even help in the recovery of wounds, this is the ideal\
place to stay in shape. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6464, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6472, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6473] = 
      {
         Name = "Boarding Ramp", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This boarding ramp leads inside the modified YV-667 freighter, The Gleaming\
Fang.  The entrance to the cockpit is to the north, and the rest of the\
ship is down the hallway south.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6474, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6475, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6473, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6474] = 
      {
         Name = "Cockpit", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The cockpit is quite spacious. There is a pilot and co-pilot seat, but the\
control panel is modified to be easily accessible to the pilot. The\
controls have been rebuilt, so a Trandoshan pilot can manipulate them.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6473, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6474, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6475] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the galley, and the door to the east leads to the\
'fresher station'. A small ladder provides access to the dorsal and\
ventral turrets, and the hallway continues south.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6473, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6484, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6478, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6488, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 6476, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [6] = 
            {
               DestinationVnum = 6477, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6475, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6476] = 
      {
         Name = "Dorsal Turret", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This is the dorsal turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6475, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6476, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6477] = 
      {
         Name = "Ventral Turret", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This is the ventral turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6475, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6477, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6478] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the Captain's quarters. The door to the east leads to\
the crew quarters, and the hallway continues south. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6475, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6489, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6479, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6483, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6478, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6479] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls are regular intervals. A ladder\
leads down to the large cargo bay, and holding cells are to the south.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6478, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6480, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6485, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6479, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6480] = 
      {
         Name = "Skinning Room", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This room has all the equipment needed to skin and preserve hides. There is\
a long gleaming table in the middle of the room.  A groove runs down one\
side of the table to drain blood and other fluids into a waste disposal\
unit. A dipping tank for curing hides is a one end of the table, and there\
is a skinning apparatus mounted above the table. There are two holding\
cells here. The main hallway is to the north.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6479, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6482, 
               Key = 20504, 
               Distance = 0, 
               Direction = "southeast", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6481, 
               Key = 20504, 
               Distance = 0, 
               Direction = "southwest", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6480, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6481] = 
      {
         Name = "Holding Cell #1", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6480, 
               Key = 20504, 
               Distance = 0, 
               Direction = "northeast", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6481, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6482] = 
      {
         Name = "Holding Cell #2", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6480, 
               Key = 20504, 
               Distance = 0, 
               Direction = "northwest", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6482, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6483] = 
      {
         Name = "Captain's Quarters", 
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
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "There is a large bunk on one side of the captain's room. On the other side\
of the room, there is a large storage locker. A small desk littered with\
paperwork is against the wall between the bunk and the locker.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6478, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6483, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6484] = 
      {
         Name = "The Refresher", 
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
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This is a standard refresher unit. There is just barely enough room inside\
for a Trandoshan.\
", 
         TeleVnum = 0, 
         Tunnel = 1, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6475, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6484, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6485] = 
      {
         Name = "Cargo Bay", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The stock cargo bay on a YV-667 is quite large, but a large portion of this\
cargo bay has been converted into a landing bay for a scout craft. There\
is a ladder leading up to the main hallway and the engine room is to the\
south.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6487, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6479, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6485, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6486] = 
      {
         Name = "Lounge", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "the lounge of this ship serves dual purpose, it is ment for the\
entertainment of guests as well as for meetings between the captain and\
crew or prospective employers. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6498, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6494, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6495, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6486, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6487] = 
      {
         Name = "Engine Room", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The engines on this ship have been heavily upgraded to provide  energy to\
the power draining modifications that have been added to the ship. There\
are blinking readouts a shipboard com station here. There is a small tool\
locker mounted on one bulkhead. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6485, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6487, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6488] = 
      {
         Name = "Galley", 
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
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The ship's galley may be small, but it is efficiently designed. There is a\
sink and a small food-prep station here. Food storage compartments have\
been mounted overhead to save space. There is a small table and four\
chairs in the middle of the room. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6475, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6488, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6489] = 
      {
         Name = "Crew Quarters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This room has three small bunks attached to the far bulkhead. There are\
also three small storage lockers mounted to the northern bulkhead.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6478, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6489, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
      }, 
      [6490] = 
      {
         Name = "Crew Quaters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "A spare crew quarters is located here. Rows of bunks with foot lockers line\
the walls and a door on the noth wall leads into the captains quarters.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6489, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6475, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6490, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6491] = 
      {
         Name = "Passenger Quaters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6492, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6476, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6491, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6492] = 
      {
         Name = "Passenger Quaters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6491, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6492, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6493] = 
      {
         Name = "Bridge Hatch", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "A small hatchway leads from the main ship into the cockpit of the ship.\
this is one of the many changes made fron the old YV-1300 into this newer\
model. Micro-electronics has allowed for minaturizatin of controlls and\
systems  making this hallway an ideal like to all the ships systems.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6478, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6499, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6493, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6494] = 
      {
         Name = "Top Turrent", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6486, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6494, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6495] = 
      {
         Name = "Bottom Turrent", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6486, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6495, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6496] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6499, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6482, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6474, 
               Key = -1, 
               Distance = 0, 
               Direction = "southwest", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6496, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6497] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6498, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6497, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6498] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6486, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6497, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6499, 
               Key = -1, 
               Distance = 0, 
               Direction = "northwest", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6476, 
               Key = -1, 
               Distance = 0, 
               Direction = "southwest", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6498, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6499] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The hallway is a simple grey metel with various emergency lighting around.\
It leads in a circular path around the ship.\
", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6493, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6496, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6473, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6498, 
               Key = -1, 
               Distance = 0, 
               Direction = "southeast", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6499, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6500] = 
      {
         Name = "Cockpit", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6501, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6500, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6501] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6502, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6512, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6500, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6514, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 6513, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Keyword = "", 
            }, 
            [6] = 
            {
               DestinationVnum = 6515, 
               Key = -1, 
               Distance = 0, 
               Direction = "northwest", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6501, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6502] = 
      {
         Name = "Spice Lady Lounge", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6503, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6505, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6501, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6502, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6503] = 
      {
         Name = "Equipment Bay", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6502, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6504, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6503, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6504] = 
      {
         Name = "Engineroom", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6503, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6504, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6505] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6507, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6506, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6502, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6505, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6506] = 
      {
         Name = "Sleeping Quarters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6505, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6508, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6506, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6507] = 
      {
         Name = "Cargo Bay", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6509, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6505, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6507, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6508] = 
      {
         Name = "Sleeping Quarters", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6506, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6508, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6509] = 
      {
         Name = "Cargo bay", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6510, 
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6507, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6509, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6510] = 
      {
         Name = "Cargo Bay", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6509, 
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6511, 
               Key = -1, 
               Distance = 0, 
               Direction = "southwest", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6510, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6511] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6512, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6510, 
               Key = -1, 
               Distance = 0, 
               Direction = "northeast", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6511, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6512] = 
      {
         Name = "Hallway", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6511, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 6501, 
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 6517, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 6516, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6512, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6513] = 
      {
         Name = "Smuggler's Compartment", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6501, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6513, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6514] = 
      {
         Name = "Boarding Ramp", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6501, 
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6514, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6515] = 
      {
         Name = "Hanger", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6501, 
               Key = -1, 
               Distance = 0, 
               Direction = "southeast", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6515, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6516] = 
      {
         Name = "Turret", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6512, 
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6516, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6517] = 
      {
         Name = "Turret", 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 6512, 
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Vnum = 6517, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6518] = 
      {
         Name = "Spice Lady A-wing", 
         TeleDelay = 0, 
         Sector = "field", 
         Description = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         Vnum = 6518, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
   }, 
   Name = "Some Hunter Spacecraft", 
   LowEconomy = 31277379, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 6400, 
         Arg3 = 6460, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 1, 
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
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 8, 
      }, 
      [6] = 
      {
         Arg1 = 6480, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 9, 
      }, 
      [7] = 
      {
         Arg1 = 5190, 
         Arg3 = 6411, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 17, 
      }, 
      [8] = 
      {
         Arg1 = 204, 
         Arg3 = 6407, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 92, 
      }, 
      [9] = 
      {
         Arg1 = 204, 
         Arg3 = 6407, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 92, 
      }, 
      [10] = 
      {
         Arg1 = 204, 
         Arg3 = 6407, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 92, 
      }, 
   }, 
   Objects = 
   {
      [6400] = 
      {
         Name = "Wrist comlink", 
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
         Description = "A funny looking wristband lies here.", 
         Layers = 0, 
         ActionDescription = "", 
         Weight = 2, 
         ShortDescr = "wrist comlink", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Vnum = 6400, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "comlink", 
      }, 
      [6401] = 
      {
         Name = "sniper scope", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Cost = 1000, 
         Description = "A small scope is in the dirt here.", 
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
         Layers = 0, 
         ActionDescription = "", 
         Weight = 2, 
         ShortDescr = "A sniper scope.", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 6401, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This small scope looks as if it could improve your aim buy quite a bit\
\13", 
               Keyword = "sniper scope", 
            }, 
         }, 
         ItemType = "scope", 
      }, 
   }, 
   VnumRanges = 
   {
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
      Room = 
      {
         Last = 6518, 
         First = 6400, 
      }, 
   }, 
   Author = "Bleeds", 
   HighEconomy = 0, 
   ResetMessage = "", 
   ResetFrequency = 0, 
   Mobiles = 
   {
      [6400] = 
      {
         Height = 0, 
         Vnum = 6400, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         ArmorClass = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Credits = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         LongDescr = "A shadey looking character is here.\
", 
         Position = "standing", 
         Shop = 
         {
            ProfitSell = 50, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "Weapons Dealer", 
            ProfitBuy = 150, 
            BuyTypes = 
            {
               [1] = "weapon", 
               [2] = "armor", 
               [3] = "landmine", 
               [4] = "none", 
               [0] = "grenade", 
            }, 
         }, 
         Level = 1, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         Name = "Weapons Dealer", 
         Stats = 
         {
            Constitution = 10, 
            Strength = 10, 
            Luck = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Dexterity = 10, 
            Wisdom = 10, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         ShortDescr = "Weapons Dealer", 
         Weight = 0, 
         Race = "Human", 
         Sex = "undistinguished", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         High = 103, 
         Low = 0, 
      }, 
      Soft = 
      {
         High = 0, 
         Low = 0, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "hunter_ships.lua", 
}
