-- Some Hunter Spacecraft
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   VnumRanges = 
   {
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
      Mob = 
      {
         First = 6400, 
         Last = 6400, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Arg3 = 6460, 
         Arg2 = 1, 
         Arg1 = 6400, 
         Command = "M", 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Arg1 = 6401, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Arg1 = 6400, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [5] = 
      {
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 8, 
         Arg1 = 6480, 
         Command = "D", 
      }, 
      [6] = 
      {
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 9, 
         Arg1 = 6480, 
         Command = "D", 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg3 = 6411, 
         Arg2 = 17, 
         Arg1 = 5190, 
         Command = "M", 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg3 = 6407, 
         Arg2 = 92, 
         Arg1 = 204, 
         Command = "M", 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg3 = 6407, 
         Arg2 = 92, 
         Arg1 = 204, 
         Command = "M", 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg3 = 6407, 
         Arg2 = 92, 
         Arg1 = 204, 
         Command = "M", 
      }, 
   }, 
   Mobiles = 
   {
      [6400] = 
      {
         Sex = "undistinguished", 
         HitRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 150, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "Weapons Dealer", 
            ProfitSell = 50, 
         }, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         ArmorClass = 0, 
         ShortDescr = "Weapons Dealer", 
         Name = "Weapons Dealer", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         DamRoll = 0, 
         Race = "Human", 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         LongDescr = "A shadey looking character is here.\
", 
         Height = 0, 
         Weight = 0, 
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
         Vnum = 6400, 
         Level = 1, 
         Alignment = 0, 
      }, 
   }, 
   Author = "Bleeds", 
   HighEconomy = 0, 
   ResetMessage = "", 
   Objects = 
   {
      [6400] = 
      {
         Layers = 0, 
         ItemType = "comlink", 
         Vnum = 6400, 
         Description = "A funny looking wristband lies here.", 
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
         Weight = 2, 
         ActionDescription = "", 
         Cost = 50, 
         ShortDescr = "wrist comlink", 
         Name = "Wrist comlink", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
      }, 
      [6401] = 
      {
         Layers = 0, 
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
         Vnum = 6401, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Description = "A small scope is in the dirt here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sniper scope", 
               Description = "This small scope looks as if it could improve your aim buy quite a bit\
\13", 
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
         Weight = 2, 
         ActionDescription = "", 
         Cost = 1000, 
         ShortDescr = "A sniper scope.", 
         Name = "sniper scope", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
      }, 
   }, 
   ResetFrequency = 0, 
   Rooms = 
   {
      [6400] = 
      {
         Vnum = 6400, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "You stand upon in the boarding hatch of on of the most famous\
ships of all time.  A bounty hunters Customized KDY Firespray\
built for speed and firepower.  As you enter you must pass through \
a series of security detectors and camaras.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Boarding Slave 1", 
         Tag = "", 
      }, 
      [6401] = 
      {
         Vnum = 6401, 
         Flags = 
         {
            [29] = "Spacecraft", 
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
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6402, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6404, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6400, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6403, 
               Distance = 0, 
               Description = "", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6406, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6402] = 
      {
         Vnum = 6402, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This ship has a fairly small cargo hold.  Most of the old \
holds area has been taken over in the modifications of the\
engines and shields.  There is still room for about a \
months worth of supplys for the ships single crew memeber.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6405, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Cargo Hold", 
         Tag = "", 
      }, 
      [6403] = 
      {
         Vnum = 6403, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The bridge of slave 1 is very cramped, however everything is within easy\
reach of the comfortable captains chair.  all systems may be monitored\
from this room including prisoner status and even the boading area. \
Controls for various  modifications made on the ship are all located here.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bridge", 
         Tag = "", 
      }, 
      [6404] = 
      {
         Vnum = 6404, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "Like most of the rest of the ship even the crew quaters\
have been taken over with ship modifications.  The area \
that use to sleep 6 comfortably now holds room for 1 and \
in a pinch sleep up to 4 people.\
", 
         TeleDelay = 0, 
         Tag = "", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Crew Quarters", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               ScriptType = "MProg", 
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
      }, 
      [6405] = 
      {
         Vnum = 6405, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This modified cargo hold is used for the ships main cargo,\
bounties.  Force shielded and reinforced cages line the \
walls.  Six seperate cages are in the room each with room\
for 1 person.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6402, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Prisoner Hold", 
         Tag = "", 
      }, 
      [6406] = 
      {
         Vnum = 6406, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "In this room you can clearly see 2 of the largest modifications\
to this ship the old engine and generator have been replaced by\
the massive KES-F31 drive engine and XF-16 power generator.\
Giving this large ship the speed and agility of a y-wing.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6401, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Engine Room", 
         Tag = "", 
      }, 
      [6407] = 
      {
         Vnum = 6407, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You stand in the turbolift of one of the greatest starships\
ever made a CR90 Corellian \"Blockade Runner\". This ship\
is known for its ability to be easily modified to fit its \
current role in a campaign, anything from troop transport\
to front line fighter is in this ships awsome repetoir.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "olympus", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Boarding Bay", 
         Tag = "", 
      }, 
      [6408] = 
      {
         Vnum = 6408, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6419, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6433, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6422, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6438, 
               Distance = 0, 
               Description = "", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6407, 
               Distance = 0, 
               Description = "", 
            }, 
            [6] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6456, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Stairwell", 
         Tag = "", 
      }, 
      [6409] = 
      {
         Vnum = 6409, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6420, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6412, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6423, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Stairwell", 
         Tag = "", 
      }, 
      [6410] = 
      {
         Vnum = 6410, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6421, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6447, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6456, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6442, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6411] = 
      {
         Vnum = 6411, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The level one hallway is built for war not plesentry so  \
it is bare metal walls and very little show, a metal walkway\
with emergancy lighting along it lead around this level.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6424, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Kitchen", 
         Tag = "", 
      }, 
      [6412] = 
      {
         Vnum = 6412, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6458, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6435, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6409, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6413] = 
      {
         Vnum = 6413, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6414, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6428, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Crew recreation center", 
         Tag = "", 
      }, 
      [6414] = 
      {
         Vnum = 6414, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6413, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Crew recreation center", 
         Tag = "", 
      }, 
      [6415] = 
      {
         Vnum = 6415, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6439, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Crew Barracks", 
         Tag = "", 
      }, 
      [6416] = 
      {
         Vnum = 6416, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6439, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Crew Barracks", 
         Tag = "", 
      }, 
      [6417] = 
      {
         Vnum = 6417, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "A new, nonoperational turret", 
         Tag = "", 
      }, 
      [6418] = 
      {
         Vnum = 6418, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "A new, nonoperational turret", 
         Tag = "", 
      }, 
      [6419] = 
      {
         Vnum = 6419, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6420, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6436, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6437, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6420] = 
      {
         Vnum = 6420, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6409, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6419, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6435, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6421] = 
      {
         Vnum = 6421, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6423, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6445, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6410, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6451, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6422] = 
      {
         Vnum = 6422, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Main engineering", 
         Tag = "", 
      }, 
      [6423] = 
      {
         Vnum = 6423, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6427, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6421, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6409, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Stairwell", 
         Tag = "", 
      }, 
      [6424] = 
      {
         Vnum = 6424, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6411, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6428, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Mess Hall", 
         Tag = "", 
      }, 
      [6425] = 
      {
         Vnum = 6425, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6426, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6456, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6431, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Stairwell", 
         Tag = "", 
      }, 
      [6426] = 
      {
         Vnum = 6426, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6428, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6450, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6425, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6449, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6427] = 
      {
         Vnum = 6427, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6423, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6444, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "The main cargo bay", 
         Tag = "", 
      }, 
      [6428] = 
      {
         Vnum = 6428, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6424, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6426, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6413, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6429] = 
      {
         Vnum = 6429, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6444, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6411, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6428, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6414, 
               Distance = 0, 
               Description = "", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6423, 
               Distance = 0, 
               Description = "", 
            }, 
            [6] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6440, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Stairwell", 
         Tag = "", 
      }, 
      [6430] = 
      {
         Vnum = 6430, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6409, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Stairwell", 
         Tag = "", 
      }, 
      [6431] = 
      {
         Vnum = 6431, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6425, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6432] = 
      {
         Vnum = 6432, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6439, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6417, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6431, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6418, 
               Distance = 0, 
               Description = "", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6441, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6433] = 
      {
         Vnum = 6433, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "A small cargo bay", 
         Tag = "", 
      }, 
      [6434] = 
      {
         Vnum = 6434, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6458, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Turret", 
         Tag = "", 
      }, 
      [6435] = 
      {
         Vnum = 6435, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6412, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6420, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Turret", 
         Tag = "", 
      }, 
      [6436] = 
      {
         Vnum = 6436, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6419, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Ship docking port", 
         Tag = "", 
      }, 
      [6437] = 
      {
         Vnum = 6437, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6419, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Ship docking port", 
         Tag = "", 
      }, 
      [6438] = 
      {
         Vnum = 6438, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "A small cargo bay", 
         Tag = "", 
      }, 
      [6439] = 
      {
         Vnum = 6439, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6440, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6415, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6416, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6440] = 
      {
         Vnum = 6440, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6439, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6441] = 
      {
         Vnum = 6441, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6432, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Ventral-mounted turbolaser", 
         Tag = "", 
      }, 
      [6442] = 
      {
         Vnum = 6442, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6410, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6443, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Second Officer's Quarters", 
         Tag = "", 
      }, 
      [6443] = 
      {
         Vnum = 6443, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6442, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bedroom", 
         Tag = "", 
      }, 
      [6444] = 
      {
         Vnum = 6444, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6429, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6427, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Lower cargo bay access", 
         Tag = "", 
      }, 
      [6445] = 
      {
         Vnum = 6445, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6446, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6421, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "First Officer's Quarters", 
         Tag = "", 
      }, 
      [6446] = 
      {
         Vnum = 6446, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6445, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bedroom", 
         Tag = "", 
      }, 
      [6447] = 
      {
         Vnum = 6447, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6448, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6410, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Engineer's Quarters", 
         Tag = "", 
      }, 
      [6448] = 
      {
         Vnum = 6448, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6447, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bedroom", 
         Tag = "", 
      }, 
      [6449] = 
      {
         Vnum = 6449, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6426, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6453, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "A large workshop", 
         Tag = "", 
      }, 
      [6450] = 
      {
         Vnum = 6450, 
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6454, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6426, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "A large workshop", 
         Tag = "", 
      }, 
      [6451] = 
      {
         Vnum = 6451, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6421, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6452, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Captains Quaters", 
         Tag = "", 
      }, 
      [6452] = 
      {
         Vnum = 6452, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6451, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bedroom", 
         Tag = "", 
      }, 
      [6453] = 
      {
         Vnum = 6453, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6449, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "A dark refinery", 
         Tag = "", 
      }, 
      [6454] = 
      {
         Vnum = 6454, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6450, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "A dark refinery", 
         Tag = "", 
      }, 
      [6455] = 
      {
         Vnum = 6455, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6456] = 
      {
         Vnum = 6456, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6410, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6408, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6425, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Stairwell", 
         Tag = "", 
      }, 
      [6457] = 
      {
         Vnum = 6457, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6458] = 
      {
         Vnum = 6458, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6412, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6434, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 6460, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 6459, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "The bridge", 
         Tag = "", 
      }, 
      [6459] = 
      {
         Vnum = 6459, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6460, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 6458, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Pilot's chair", 
         Tag = "", 
      }, 
      [6460] = 
      {
         Vnum = 6460, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The walls of this room are painted a mild blue. A large viewport is located\
on the south  wall allowing passengers to look out into space. A small\
wetbar and fridge are here for  the passengers convienince as well as a\
com to the kitchen.  \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6459, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 6458, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Copilot's chair", 
         Tag = "", 
      }, 
      [6461] = 
      {
         Vnum = 6461, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6462, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hatchway", 
         Tag = "", 
      }, 
      [6462] = 
      {
         Vnum = 6462, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6463, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6461, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Main Hallway", 
         Tag = "", 
      }, 
      [6463] = 
      {
         Vnum = 6463, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6465, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6471, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6462, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6470, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Main Hallway", 
         Tag = "", 
      }, 
      [6464] = 
      {
         Vnum = 6464, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6462, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6472, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6467, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6468, 
               Distance = 0, 
               Description = "", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6466, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Main Hallway", 
         Tag = "", 
      }, 
      [6465] = 
      {
         Vnum = 6465, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The cockpit of this ship is a comfortable  2 seater although everything can\
easily be controlled by a single pilot. A modified YV-666 freighter this\
ship has more than enough power to run with the fighters, and enough\
shielding and weapons to fight with small cruisers.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6463, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Cockpit", 
         Tag = "", 
      }, 
      [6466] = 
      {
         Vnum = 6466, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The powerhouse of this small freigheter is located here. powering both\
shields and Engines from this room make maintenance easy. The modified\
engine allows this ship extra speed beyoynd what a normal frieghter can\
handle.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Engine Room", 
         Tag = "", 
      }, 
      [6467] = 
      {
         Vnum = 6467, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "A sparse living quarters is here.  Designed to be use when travlling on the\
hunt this ship has very little for creature comforts and is more bare bone\
to make you finish all that much sooner. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Crew Quarters", 
         Tag = "", 
      }, 
      [6468] = 
      {
         Vnum = 6468, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "A small bucket seat pivots inside a gyroscopic frame.  In front of the seat\
is the butterfly grip of a laser turret. Targeting controls light up a\
touch monitor in front of the seat. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Laser Turret", 
         Tag = "", 
      }, 
      [6469] = 
      {
         Vnum = 6469, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Name = "Cargo Hold", 
         Tag = "", 
      }, 
      [6470] = 
      {
         Vnum = 6470, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6463, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Prisoner Room", 
         Tag = "", 
      }, 
      [6471] = 
      {
         Vnum = 6471, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The prisoner bays of the ship is set up for easy access at all times \
camaras and sensor waths the prisoners who are in one of 4 force sealed\
cages. Once inside no one gets out until they are let out.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6463, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Prisoner Room", 
         Tag = "", 
      }, 
      [6472] = 
      {
         Vnum = 6472, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "Around this room is various training equipment, designed for helping to\
keep in top form or even help in the recovery of wounds, this is the ideal\
place to stay in shape. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6464, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Training Room", 
         Tag = "", 
      }, 
      [6473] = 
      {
         Vnum = 6473, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This boarding ramp leads inside the modified YV-667 freighter, The Gleaming\
Fang.  The entrance to the cockpit is to the north, and the rest of the\
ship is down the hallway south.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6474, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Boarding Ramp", 
         Tag = "", 
      }, 
      [6474] = 
      {
         Vnum = 6474, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The cockpit is quite spacious. There is a pilot and co-pilot seat, but the\
control panel is modified to be easily accessible to the pilot. The\
controls have been rebuilt, so a Trandoshan pilot can manipulate them.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6473, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Cockpit", 
         Tag = "", 
      }, 
      [6475] = 
      {
         Vnum = 6475, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the galley, and the door to the east leads to the\
'fresher station'. A small ladder provides access to the dorsal and\
ventral turrets, and the hallway continues south.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6473, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6484, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6488, 
               Distance = 0, 
               Description = "", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6476, 
               Distance = 0, 
               Description = "", 
            }, 
            [6] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6477, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6476] = 
      {
         Vnum = 6476, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This is the dorsal turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Dorsal Turret", 
         Tag = "", 
      }, 
      [6477] = 
      {
         Vnum = 6477, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This is the ventral turret. There is a small targeting computer here, and a\
headset connecting the gunner to the shipboard com system. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Ventral Turret", 
         Tag = "", 
      }, 
      [6478] = 
      {
         Vnum = 6478, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls at regular intervals. The door\
to the west leads to the Captain's quarters. The door to the east leads to\
the crew quarters, and the hallway continues south. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6489, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6479, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6483, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6479] = 
      {
         Vnum = 6479, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This main hallway runs the length of the ship. Emergency lighting and\
security systems are mounted on the walls are regular intervals. A ladder\
leads down to the large cargo bay, and holding cells are to the south.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6480, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6485, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6480] = 
      {
         Vnum = 6480, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This room has all the equipment needed to skin and preserve hides. There is\
a long gleaming table in the middle of the room.  A groove runs down one\
side of the table to drain blood and other fluids into a waste disposal\
unit. A dipping tank for curing hides is a one end of the table, and there\
is a skinning apparatus mounted above the table. There are two holding\
cells here. The main hallway is to the north.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6479, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = 20504, 
               Direction = "southeast", 
               DestinationVnum = 6482, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = 20504, 
               Direction = "southwest", 
               DestinationVnum = 6481, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Skinning Room", 
         Tag = "", 
      }, 
      [6481] = 
      {
         Vnum = 6481, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Tunnel = 0, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 20504, 
               Direction = "northeast", 
               DestinationVnum = 6480, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Holding Cell #1", 
         Tag = "", 
      }, 
      [6482] = 
      {
         Vnum = 6482, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [19] = "ClanStoreroom", 
         }, 
         Tunnel = 0, 
         Description = "This holding cell is magnetically sealed. It would be nearly impossible to\
escape without outside help. There is a tiny sensor mounted in the ceiling\
that automatically triggers the release of a nerve agent should the\
occupant struggle.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 20504, 
               Direction = "northwest", 
               DestinationVnum = 6480, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Holding Cell #2", 
         Tag = "", 
      }, 
      [6483] = 
      {
         Vnum = 6483, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "There is a large bunk on one side of the captain's room. On the other side\
of the room, there is a large storage locker. A small desk littered with\
paperwork is against the wall between the bunk and the locker.\
", 
         TeleDelay = 0, 
         Tag = "", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Captain's Quarters", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "25 ", 
               ScriptType = "MProg", 
               Code = "mpecho The bacta heals your wounds.\
feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
      }, 
      [6484] = 
      {
         Vnum = 6484, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 1, 
         Description = "This is a standard refresher unit. There is just barely enough room inside\
for a Trandoshan.\
", 
         TeleDelay = 0, 
         Tag = "", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "The Refresher", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "70", 
               ScriptType = "MProg", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
mpecho &cYou wash around your troubles.\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
      }, 
      [6485] = 
      {
         Vnum = 6485, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The stock cargo bay on a YV-667 is quite large, but a large portion of this\
cargo bay has been converted into a landing bay for a scout craft. There\
is a ladder leading up to the main hallway and the engine room is to the\
south.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6487, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6479, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Cargo Bay", 
         Tag = "", 
      }, 
      [6486] = 
      {
         Vnum = 6486, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "the lounge of this ship serves dual purpose, it is ment for the\
entertainment of guests as well as for meetings between the captain and\
crew or prospective employers. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6498, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6494, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6495, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Lounge", 
         Tag = "", 
      }, 
      [6487] = 
      {
         Vnum = 6487, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The engines on this ship have been heavily upgraded to provide  energy to\
the power draining modifications that have been added to the ship. There\
are blinking readouts a shipboard com station here. There is a small tool\
locker mounted on one bulkhead. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6485, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Engine Room", 
         Tag = "", 
      }, 
      [6488] = 
      {
         Vnum = 6488, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The ship's galley may be small, but it is efficiently designed. There is a\
sink and a small food-prep station here. Food storage compartments have\
been mounted overhead to save space. There is a small table and four\
chairs in the middle of the room. \
", 
         TeleDelay = 0, 
         Tag = "", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Galley", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "food ration", 
               ScriptType = "MProg", 
               Code = "mpoload 10313\
mpecho A packaged ration pops from the station.\
drop all\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
      }, 
      [6489] = 
      {
         Vnum = 6489, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "This room has three small bunks attached to the far bulkhead. There are\
also three small storage lockers mounted to the northern bulkhead.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Crew Quarters", 
         Tag = "", 
      }, 
      [6490] = 
      {
         Vnum = 6490, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "A spare crew quarters is located here. Rows of bunks with foot lockers line\
the walls and a door on the noth wall leads into the captains quarters.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6489, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6475, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Crew Quaters", 
         Tag = "", 
      }, 
      [6491] = 
      {
         Vnum = 6491, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6492, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6476, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Passenger Quaters", 
         Tag = "", 
      }, 
      [6492] = 
      {
         Vnum = 6492, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "A large passenger area is here for the live cargo all freighters are force\
to carry sometimes. Even though it's not built for comfort it is more\
comfortable than the captains and crews quarters. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6491, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Passenger Quaters", 
         Tag = "", 
      }, 
      [6493] = 
      {
         Vnum = 6493, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "A small hatchway leads from the main ship into the cockpit of the ship.\
this is one of the many changes made fron the old YV-1300 into this newer\
model. Micro-electronics has allowed for minaturizatin of controlls and\
systems  making this hallway an ideal like to all the ships systems.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6478, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6499, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bridge Hatch", 
         Tag = "", 
      }, 
      [6494] = 
      {
         Vnum = 6494, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6486, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Top Turrent", 
         Tag = "", 
      }, 
      [6495] = 
      {
         Vnum = 6495, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "This room is bare except for a small targeting computer and a pair of\
lasers. Designed for combat and not comfort you hope the stay in here\
isn't too long. \
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6486, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bottom Turrent", 
         Tag = "", 
      }, 
      [6496] = 
      {
         Vnum = 6496, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6499, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6482, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 6474, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6497] = 
      {
         Vnum = 6497, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6498, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6498] = 
      {
         Vnum = 6498, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting\
around.\
It leads in a circular path around the ship.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6486, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6497, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 6499, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 6476, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6499] = 
      {
         Vnum = 6499, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The hallway is a simple grey metel with various emergency lighting around.\
It leads in a circular path around the ship.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6493, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6496, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6473, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 6498, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6500] = 
      {
         Vnum = 6500, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Cockpit", 
         Tag = "", 
      }, 
      [6501] = 
      {
         Vnum = 6501, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6502, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6512, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6500, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6514, 
               Distance = 0, 
               Description = "", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6513, 
               Distance = 0, 
               Description = "", 
            }, 
            [6] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 6515, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6502] = 
      {
         Vnum = 6502, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6503, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6505, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Spice Lady Lounge", 
         Tag = "", 
      }, 
      [6503] = 
      {
         Vnum = 6503, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6502, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6504, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Equipment Bay", 
         Tag = "", 
      }, 
      [6504] = 
      {
         Vnum = 6504, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6503, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Engineroom", 
         Tag = "", 
      }, 
      [6505] = 
      {
         Vnum = 6505, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6507, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6506, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6502, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6506] = 
      {
         Vnum = 6506, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6505, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6508, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Sleeping Quarters", 
         Tag = "", 
      }, 
      [6507] = 
      {
         Vnum = 6507, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6509, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6505, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Cargo Bay", 
         Tag = "", 
      }, 
      [6508] = 
      {
         Vnum = 6508, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6506, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Sleeping Quarters", 
         Tag = "", 
      }, 
      [6509] = 
      {
         Vnum = 6509, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 6510, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6507, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Cargo bay", 
         Tag = "", 
      }, 
      [6510] = 
      {
         Vnum = 6510, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 6509, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 6511, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Cargo Bay", 
         Tag = "", 
      }, 
      [6511] = 
      {
         Vnum = 6511, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6512, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 6510, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6512] = 
      {
         Vnum = 6512, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6511, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6517, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6516, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hallway", 
         Tag = "", 
      }, 
      [6513] = 
      {
         Vnum = 6513, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Smuggler's Compartment", 
         Tag = "", 
      }, 
      [6514] = 
      {
         Vnum = 6514, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Boarding Ramp", 
         Tag = "", 
      }, 
      [6515] = 
      {
         Vnum = 6515, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 6501, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Hanger", 
         Tag = "", 
      }, 
      [6516] = 
      {
         Vnum = 6516, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 6512, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Turret", 
         Tag = "", 
      }, 
      [6517] = 
      {
         Vnum = 6517, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 6512, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Turret", 
         Tag = "", 
      }, 
      [6518] = 
      {
         Vnum = 6518, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Name = "Spice Lady A-wing", 
         Tag = "", 
      }, 
   }, 
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
   LowEconomy = 31277379, 
   Name = "Some Hunter Spacecraft", 
   Filename = "hunter_ships.lua", 
}
