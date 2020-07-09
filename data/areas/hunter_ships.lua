-- Some Hunter Spacecraft
-- Last saved Thursday 09-Jul-2020 23:19:12

AreaEntry
{
   Rooms = 
   {
      [6400] = 
      {
         TeleDelay = 0, 
         Vnum = 6400, 
         Name = "Boarding Slave 1", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6401, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "You stand upon in the boarding hatch of on of the most famous\
ships of all time.  A bounty hunters Customized KDY Firespray\
built for speed and firepower.  As you enter you must pass through \
a series of security detectors and camaras.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6401] = 
      {
         TeleDelay = 0, 
         Vnum = 6401, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6402, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6404, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6400, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6403, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [5] = 
            {
               Distance = 0, 
               DestinationVnum = 6406, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "Having passed through the various security checks you \
finally stand in the hallway of slave 1.  This ships odd \
design means things arn't normally where they should be.  \
A latter leads up into the bridge, to the north you see a \
cargo hold and south of you looks like someones living area.\
A small hatch in the floor rumbles with the vibrations from \
the engines.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6402] = 
      {
         TeleDelay = 0, 
         Vnum = 6402, 
         Name = "Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6401, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6405, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "This ship has a fairly small cargo hold.  Most of the old \
holds area has been taken over in the modifications of the\
engines and shields.  There is still room for about a \
months worth of supplys for the ships single crew memeber.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6403] = 
      {
         TeleDelay = 0, 
         Vnum = 6403, 
         Name = "Bridge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6401, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "The bridge of slave 1 is very cramped, however everything is within easy\
reach of the comfortable captains chair.  all systems may be monitored\
from this room including prisoner status and even the boading area. \
Controls for various  modifications made on the ship are all located here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6404] = 
      {
         TeleDelay = 0, 
         Vnum = 6404, 
         Name = "Crew Quarters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6401, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "Like most of the rest of the ship even the crew quaters\
have been taken over with ship modifications.  The area \
that use to sleep 6 comfortably now holds room for 1 and \
in a pinch sleep up to 4 people.\
", 
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
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6405] = 
      {
         TeleDelay = 0, 
         Vnum = 6405, 
         Name = "Prisoner Hold", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6402, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "This modified cargo hold is used for the ships main cargo,\
bounties.  Force shielded and reinforced cages line the \
walls.  Six seperate cages are in the room each with room\
for 1 person.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6406] = 
      {
         TeleDelay = 0, 
         Vnum = 6406, 
         Name = "Engine Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6401, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "In this room you can clearly see 2 of the largest modifications\
to this ship the old engine and generator have been replaced by\
the massive KES-F31 drive engine and XF-16 power generator.\
Giving this large ship the speed and agility of a y-wing.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6407] = 
      {
         TeleDelay = 0, 
         Vnum = 6407, 
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
               Distance = 0, 
               DestinationVnum = 6408, 
               Key = -1, 
               Description = "", 
               Keyword = "olympus", 
               Direction = "somewhere", 
            }, 
         }, 
         Description = "You stand in the turbolift of one of the greatest starships\
ever made a CR90 Corellian \"Blockade Runner\". This ship\
is known for its ability to be easily modified to fit its \
current role in a campaign, anything from troop transport\
to front line fighter is in this ships awsome repetoir.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
      }, 
      [6408] = 
      {
         TeleDelay = 0, 
         Vnum = 6408, 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6419, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6433, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6422, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6438, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               DestinationVnum = 6407, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [6] = 
            {
               Distance = 0, 
               DestinationVnum = 6456, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6409] = 
      {
         TeleDelay = 0, 
         Vnum = 6409, 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6420, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6412, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6423, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6410] = 
      {
         TeleDelay = 0, 
         Vnum = 6410, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6421, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6447, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6456, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6442, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6411] = 
      {
         TeleDelay = 0, 
         Vnum = 6411, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6424, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6429, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The level one hallway is built for war not plesentry so  \
it is bare metal walls and very little show, a metal walkway\
with emergancy lighting along it lead around this level.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6412] = 
      {
         TeleDelay = 0, 
         Vnum = 6412, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6458, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6435, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6409, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6413] = 
      {
         TeleDelay = 0, 
         Vnum = 6413, 
         Name = "Crew recreation center", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6414, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6428, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6414] = 
      {
         TeleDelay = 0, 
         Vnum = 6414, 
         Name = "Crew recreation center", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6429, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6413, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6415] = 
      {
         TeleDelay = 0, 
         Vnum = 6415, 
         Name = "Crew Barracks", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6439, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6416] = 
      {
         TeleDelay = 0, 
         Vnum = 6416, 
         Name = "Crew Barracks", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6439, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6417] = 
      {
         TeleDelay = 0, 
         Vnum = 6417, 
         Name = "A new, nonoperational turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6432, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6418] = 
      {
         TeleDelay = 0, 
         Vnum = 6418, 
         Name = "A new, nonoperational turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6432, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6419] = 
      {
         TeleDelay = 0, 
         Vnum = 6419, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6420, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6436, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6408, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6437, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6420] = 
      {
         TeleDelay = 0, 
         Vnum = 6420, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6409, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6419, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6435, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6421] = 
      {
         TeleDelay = 0, 
         Vnum = 6421, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6423, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6445, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6410, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6451, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6422] = 
      {
         TeleDelay = 0, 
         Vnum = 6422, 
         Name = "Main engineering", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6408, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6423] = 
      {
         TeleDelay = 0, 
         Vnum = 6423, 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6427, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6421, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6409, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6429, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6424] = 
      {
         TeleDelay = 0, 
         Vnum = 6424, 
         Name = "Mess Hall", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6411, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6428, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6425] = 
      {
         TeleDelay = 0, 
         Vnum = 6425, 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6426, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6456, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6431, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6426] = 
      {
         TeleDelay = 0, 
         Vnum = 6426, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6428, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6450, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6425, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6449, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6427] = 
      {
         TeleDelay = 0, 
         Vnum = 6427, 
         Name = "The main cargo bay", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6423, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6444, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6428] = 
      {
         TeleDelay = 0, 
         Vnum = 6428, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6429, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6424, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6426, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6413, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6429] = 
      {
         TeleDelay = 0, 
         Vnum = 6429, 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6444, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6411, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6428, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6414, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               DestinationVnum = 6423, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [6] = 
            {
               Distance = 0, 
               DestinationVnum = 6440, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6430] = 
      {
         TeleDelay = 0, 
         Vnum = 6430, 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6409, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6431] = 
      {
         TeleDelay = 0, 
         Vnum = 6431, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6432, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6425, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6432] = 
      {
         TeleDelay = 0, 
         Vnum = 6432, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6439, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6417, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6431, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6418, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               DestinationVnum = 6441, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6433] = 
      {
         TeleDelay = 0, 
         Vnum = 6433, 
         Name = "A small cargo bay", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6408, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6434] = 
      {
         TeleDelay = 0, 
         Vnum = 6434, 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6458, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6435] = 
      {
         TeleDelay = 0, 
         Vnum = 6435, 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6412, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6420, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6436] = 
      {
         TeleDelay = 0, 
         Vnum = 6436, 
         Name = "Ship docking port", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6419, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6437] = 
      {
         TeleDelay = 0, 
         Vnum = 6437, 
         Name = "Ship docking port", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6419, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6438] = 
      {
         TeleDelay = 0, 
         Vnum = 6438, 
         Name = "A small cargo bay", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6408, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6439] = 
      {
         TeleDelay = 0, 
         Vnum = 6439, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6440, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6415, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6432, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6416, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6440] = 
      {
         TeleDelay = 0, 
         Vnum = 6440, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6439, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6429, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6441] = 
      {
         TeleDelay = 0, 
         Vnum = 6441, 
         Name = "Ventral-mounted turbolaser", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6432, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6442] = 
      {
         TeleDelay = 0, 
         Vnum = 6442, 
         Name = "Second Officer's Quarters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6410, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6443, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6443] = 
      {
         TeleDelay = 0, 
         Vnum = 6443, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6442, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6444] = 
      {
         TeleDelay = 0, 
         Vnum = 6444, 
         Name = "Lower cargo bay access", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6429, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6427, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6445] = 
      {
         TeleDelay = 0, 
         Vnum = 6445, 
         Name = "First Officer's Quarters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6446, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6421, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6446] = 
      {
         TeleDelay = 0, 
         Vnum = 6446, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6445, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6447] = 
      {
         TeleDelay = 0, 
         Vnum = 6447, 
         Name = "Engineer's Quarters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6448, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6410, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6448] = 
      {
         TeleDelay = 0, 
         Vnum = 6448, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6447, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
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
         Vnum = 6449, 
         Name = "A large workshop", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6426, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6453, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6450] = 
      {
         TeleDelay = 0, 
         Vnum = 6450, 
         Name = "A large workshop", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6454, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6426, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6451] = 
      {
         TeleDelay = 0, 
         Vnum = 6451, 
         Name = "Captains Quaters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6421, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6452, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6452] = 
      {
         TeleDelay = 0, 
         Vnum = 6452, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6451, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6453] = 
      {
         TeleDelay = 0, 
         Vnum = 6453, 
         Name = "A dark refinery", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6449, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
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
         Vnum = 6454, 
         Name = "A dark refinery", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6450, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
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
         Vnum = 6455, 
         Name = "Hallway", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6456] = 
      {
         TeleDelay = 0, 
         Vnum = 6456, 
         Name = "Stairwell", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6410, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6408, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6425, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6457] = 
      {
         TeleDelay = 0, 
         Vnum = 6457, 
         Name = "Hallway", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6458] = 
      {
         TeleDelay = 0, 
         Vnum = 6458, 
         Name = "The bridge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6412, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6434, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6460, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "northeast", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6459, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "northwest", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6459] = 
      {
         TeleDelay = 0, 
         Vnum = 6459, 
         Name = "Pilot's chair", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6460, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6458, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "southeast", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6460] = 
      {
         TeleDelay = 0, 
         Vnum = 6460, 
         Name = "Copilot's chair", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6459, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6458, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "southwest", 
            }, 
         }, 
         Description = "The walls of this room are painted a mild blue. A large viewport is located\
on the south  wall allowing passengers to look out into space. A small\
wetbar and fridge are here for  the passengers convienince as well as a\
com to the kitchen.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6461] = 
      {
         TeleDelay = 0, 
         Vnum = 6461, 
         Name = "Hatchway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6462, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6462] = 
      {
         TeleDelay = 0, 
         Vnum = 6462, 
         Name = "Main Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6463, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6464, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6461, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6463] = 
      {
         TeleDelay = 0, 
         Vnum = 6463, 
         Name = "Main Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6465, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6471, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6462, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6470, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6464] = 
      {
         TeleDelay = 0, 
         Vnum = 6464, 
         Name = "Main Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6462, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6472, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6467, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6468, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               DestinationVnum = 6466, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6465] = 
      {
         TeleDelay = 0, 
         Vnum = 6465, 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6463, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The cockpit of this ship is a comfortable  2 seater although everything can\
easily be controlled by a single pilot. A modified YV-666 freighter this\
ship has more than enough power to run with the fighters, and enough\
shielding and weapons to fight with small cruisers.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6466] = 
      {
         TeleDelay = 0, 
         Vnum = 6466, 
         Name = "Engine Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6464, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "The powerhouse of this small freigheter is located here. powering both\
shields and Engines from this room make maintenance easy. The modified\
engine allows this ship extra speed beyoynd what a normal frieghter can\
handle.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6467] = 
      {
         TeleDelay = 0, 
         Vnum = 6467, 
         Name = "Crew Quarters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6464, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "A sparse living quarters is here.  Designed to be use when travlling on the\
hunt this ship has very little for creature comforts and is more bare bone\
to make you finish all that much sooner. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6468] = 
      {
         TeleDelay = 0, 
         Vnum = 6468, 
         Name = "Laser Turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6464, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "A small bucket seat pivots inside a gyroscopic frame.  In front of the seat\
is the butterfly grip of a laser turret. Targeting controls light up a\
touch monitor in front of the seat. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6469] = 
      {
         TeleDelay = 0, 
         Vnum = 6469, 
         Name = "Cargo Hold", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6470] = 
      {
         TeleDelay = 0, 
         Vnum = 6470, 
         Name = "Prisoner Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6463, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6471] = 
      {
         TeleDelay = 0, 
         Vnum = 6471, 
         Name = "Prisoner Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6463, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6472] = 
      {
         TeleDelay = 0, 
         Vnum = 6472, 
         Name = "Training Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6464, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "Around this room is various training equipment, designed for helping to\
keep in top form or even help in the recovery of wounds, this is the ideal\
place to stay in shape. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6473] = 
      {
         TeleDelay = 0, 
         Vnum = 6473, 
         Name = "Boarding Ramp", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6474, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6475, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This boarding ramp leads inside the modified YV-667 freighter, The Gleaming\
Fang.  The entrance to the cockpit is to the north, and the rest of the\
ship is down the hallway south.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6474] = 
      {
         TeleDelay = 0, 
         Vnum = 6474, 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6473, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "The cockpit is quite spacious. There is a pilot and co-pilot seat, but the\
control panel is modified to be easily accessible to the pilot. The\
controls have been rebuilt, so a Trandoshan pilot can manipulate them.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6475] = 
      {
         TeleDelay = 0, 
         Vnum = 6475, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6473, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6484, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6478, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6488, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Distance = 0, 
               DestinationVnum = 6476, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [6] = 
            {
               Distance = 0, 
               DestinationVnum = 6477, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the galley, and the door to the east leads to the\
'fresher station'. A small ladder provides access to the dorsal and\
ventral turrets, and the hallway continues south.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6476] = 
      {
         TeleDelay = 0, 
         Vnum = 6476, 
         Name = "Dorsal Turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6475, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "This is the dorsal turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6477] = 
      {
         TeleDelay = 0, 
         Vnum = 6477, 
         Name = "Ventral Turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6475, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "This is the ventral turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
      }, 
      [6478] = 
      {
         TeleDelay = 0, 
         Vnum = 6478, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6475, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6489, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6479, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6483, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the Captain's quarters. The door to the east leads to\
the crew quarters, and the hallway continues south. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6479] = 
      {
         TeleDelay = 0, 
         Vnum = 6479, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6478, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6480, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6485, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls are regular intervals. A ladder\
leads down to the large cargo bay, and holding cells are to the south.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6480] = 
      {
         TeleDelay = 0, 
         Vnum = 6480, 
         Name = "Skinning Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6479, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
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
               DestinationVnum = 6482, 
               Key = 20504, 
               Description = "", 
               Keyword = "", 
               Direction = "southeast", 
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
               DestinationVnum = 6481, 
               Key = 20504, 
               Description = "", 
               Keyword = "", 
               Direction = "southwest", 
            }, 
         }, 
         Description = "This room has all the equipment needed to skin and preserve hides. There is\
a long gleaming table in the middle of the room.  A groove runs down one\
side of the table to drain blood and other fluids into a waste disposal\
unit. A dipping tank for curing hides is a one end of the table, and there\
is a skinning apparatus mounted above the table. There are two holding\
cells here. The main hallway is to the north.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6481] = 
      {
         TeleDelay = 0, 
         Vnum = 6481, 
         Name = "Holding Cell #1", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 6480, 
               Key = 20504, 
               Description = "", 
               Keyword = "", 
               Direction = "northeast", 
            }, 
         }, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6482] = 
      {
         TeleDelay = 0, 
         Vnum = 6482, 
         Name = "Holding Cell #2", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 6480, 
               Key = 20504, 
               Description = "", 
               Keyword = "", 
               Direction = "northwest", 
            }, 
         }, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
      }, 
      [6483] = 
      {
         TeleDelay = 0, 
         Vnum = 6483, 
         Name = "Captain's Quarters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6478, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "There is a large bunk on one side of the captain's room. On the other side\
of the room, there is a large storage locker. A small desk littered with\
paperwork is against the wall between the bunk and the locker.\
", 
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
               MudProgType = "rand_prog", 
               Arguments = "25 ", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6484] = 
      {
         TeleDelay = 0, 
         Vnum = 6484, 
         Name = "The Refresher", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6475, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This is a standard refresher unit. There is just barely enough room inside\
for a Trandoshan.\
", 
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
               MudProgType = "rand_prog", 
               Arguments = "70", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6485] = 
      {
         TeleDelay = 0, 
         Vnum = 6485, 
         Name = "Cargo Bay", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6487, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6479, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "The stock cargo bay on a YV-667 is quite large, but a large portion of this\
cargo bay has been converted into a landing bay for a scout craft. There\
is a ladder leading up to the main hallway and the engine room is to the\
south.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6486] = 
      {
         TeleDelay = 0, 
         Vnum = 6486, 
         Name = "Lounge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6498, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6494, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6495, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "the lounge of this ship serves dual purpose, it is ment for the\
entertainment of guests as well as for meetings between the captain and\
crew or prospective employers. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6487] = 
      {
         TeleDelay = 0, 
         Vnum = 6487, 
         Name = "Engine Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6485, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "The engines on this ship have been heavily upgraded to provide  energy to\
the power draining modifications that have been added to the ship. There\
are blinking readouts a shipboard com station here. There is a small tool\
locker mounted on one bulkhead. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6488] = 
      {
         TeleDelay = 0, 
         Vnum = 6488, 
         Name = "Galley", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6475, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "The ship's galley may be small, but it is efficiently designed. There is a\
sink and a small food-prep station here. Food storage compartments have\
been mounted overhead to save space. There is a small table and four\
chairs in the middle of the room. \
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10313\
mpecho A packaged ration pops from the station.\
drop all\
", 
               MudProgType = "speech_prog", 
               Arguments = "food ration", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6489] = 
      {
         TeleDelay = 0, 
         Vnum = 6489, 
         Name = "Crew Quarters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6478, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This room has three small bunks attached to the far bulkhead. There are\
also three small storage lockers mounted to the northern bulkhead.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
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
         Vnum = 6490, 
         Name = "Crew Quaters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6489, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6475, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "A spare crew quarters is located here. Rows of bunks with foot lockers line\
the walls and a door on the noth wall leads into the captains quarters.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6491] = 
      {
         TeleDelay = 0, 
         Vnum = 6491, 
         Name = "Passenger Quaters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6492, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6476, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6492] = 
      {
         TeleDelay = 0, 
         Vnum = 6492, 
         Name = "Passenger Quaters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6491, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6493] = 
      {
         TeleDelay = 0, 
         Vnum = 6493, 
         Name = "Bridge Hatch", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6478, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6499, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "A small hatchway leads from the main ship into the cockpit of the ship.\
this is one of the many changes made fron the old YV-1300 into this newer\
model. Micro-electronics has allowed for minaturizatin of controlls and\
systems  making this hallway an ideal like to all the ships systems.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6494] = 
      {
         TeleDelay = 0, 
         Vnum = 6494, 
         Name = "Top Turrent", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6486, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6495] = 
      {
         TeleDelay = 0, 
         Vnum = 6495, 
         Name = "Bottom Turrent", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6486, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6496] = 
      {
         TeleDelay = 0, 
         Vnum = 6496, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6499, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6482, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6474, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "southwest", 
            }, 
         }, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6497] = 
      {
         TeleDelay = 0, 
         Vnum = 6497, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6498, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6498] = 
      {
         TeleDelay = 0, 
         Vnum = 6498, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6486, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6497, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6499, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "northwest", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6476, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "southwest", 
            }, 
         }, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6499] = 
      {
         TeleDelay = 0, 
         Vnum = 6499, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6493, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6496, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6473, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6498, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "southeast", 
            }, 
         }, 
         Description = "The hallway is a simple grey metel with various emergency lighting around.\
It leads in a circular path around the ship.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6500] = 
      {
         TeleDelay = 0, 
         Vnum = 6500, 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6501, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6501] = 
      {
         TeleDelay = 0, 
         Vnum = 6501, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6502, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6512, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6500, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6514, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
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
               DestinationVnum = 6513, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
            [6] = 
            {
               Distance = 0, 
               DestinationVnum = 6515, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "northwest", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6502] = 
      {
         TeleDelay = 0, 
         Vnum = 6502, 
         Name = "Spice Lady Lounge", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6503, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6505, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6501, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6503] = 
      {
         TeleDelay = 0, 
         Vnum = 6503, 
         Name = "Equipment Bay", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6502, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6504, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6504] = 
      {
         TeleDelay = 0, 
         Vnum = 6504, 
         Name = "Engineroom", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6503, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6505] = 
      {
         TeleDelay = 0, 
         Vnum = 6505, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6507, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6506, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6502, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6506] = 
      {
         TeleDelay = 0, 
         Vnum = 6506, 
         Name = "Sleeping Quarters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6505, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6508, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6507] = 
      {
         TeleDelay = 0, 
         Vnum = 6507, 
         Name = "Cargo Bay", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6509, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6505, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6508] = 
      {
         TeleDelay = 0, 
         Vnum = 6508, 
         Name = "Sleeping Quarters", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6506, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
      }, 
      [6509] = 
      {
         TeleDelay = 0, 
         Vnum = 6509, 
         Name = "Cargo bay", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6510, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6507, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6510] = 
      {
         TeleDelay = 0, 
         Vnum = 6510, 
         Name = "Cargo Bay", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6509, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6511, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "southwest", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6511] = 
      {
         TeleDelay = 0, 
         Vnum = 6511, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6512, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6510, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "northeast", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6512] = 
      {
         TeleDelay = 0, 
         Vnum = 6512, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6511, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6501, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6517, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 6516, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6513] = 
      {
         TeleDelay = 0, 
         Vnum = 6513, 
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
               Distance = 0, 
               DestinationVnum = 6501, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6514] = 
      {
         TeleDelay = 0, 
         Vnum = 6514, 
         Name = "Boarding Ramp", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6501, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6515] = 
      {
         TeleDelay = 0, 
         Vnum = 6515, 
         Name = "Hanger", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6501, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "southeast", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6516] = 
      {
         TeleDelay = 0, 
         Vnum = 6516, 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6512, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6517] = 
      {
         TeleDelay = 0, 
         Vnum = 6517, 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6512, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
      }, 
      [6518] = 
      {
         TeleDelay = 0, 
         Vnum = 6518, 
         Name = "Spice Lady A-wing", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "field", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
   }, 
   Author = "Bleeds", 
   ResetFrequency = 0, 
   Name = "Some Hunter Spacecraft", 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 6400, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg3 = 6460, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 6401, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 6400, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [5] = 
      {
         Arg1 = 6480, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 8, 
         Arg3 = 2, 
      }, 
      [6] = 
      {
         Arg1 = 6480, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 9, 
         Arg3 = 2, 
      }, 
      [7] = 
      {
         Arg1 = 5190, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 17, 
         Arg3 = 6411, 
      }, 
      [8] = 
      {
         Arg1 = 204, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 92, 
         Arg3 = 6407, 
      }, 
      [9] = 
      {
         Arg1 = 204, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 92, 
         Arg3 = 6407, 
      }, 
      [10] = 
      {
         Arg1 = 204, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 92, 
         Arg3 = 6407, 
      }, 
   }, 
   Filename = "hunter_ships.lua", 
   Objects = 
   {
      [6400] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Vnum = 6400, 
         Weight = 2, 
         Name = "Wrist comlink", 
         Cost = 50, 
         Description = "A funny looking wristband lies here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "comlink", 
         ShortDescr = "wrist comlink", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [6401] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 6401, 
         Weight = 2, 
         Name = "sniper scope", 
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
         Description = "A small scope is in the dirt here.", 
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
         ItemType = "scope", 
         ShortDescr = "A sniper scope.", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sniper scope", 
               Description = "This small scope looks as if it could improve your aim buy quite a bit\
\13", 
            }, 
         }, 
         Layers = 0, 
      }, 
   }, 
   Mobiles = 
   {
      [6400] = 
      {
         Weight = 0, 
         Name = "Weapons Dealer", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A shadey looking character is here.\
", 
         NumberOfAttacks = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
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
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 150, 
            ProfitSell = 50, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "Weapons Dealer", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 6400, 
         ShortDescr = "Weapons Dealer", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
   }, 
   LowEconomy = 31277379, 
   ResetMessage = "", 
   VnumRanges = 
   {
      Object = 
      {
         First = 6400, 
         Last = 6401, 
      }, 
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
   }, 
}
