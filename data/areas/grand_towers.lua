-- Grand Towers Appartments
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Filename = "grand_towers.lua", 
   Name = "Grand Towers Appartments", 
   Mobiles = 
   {
      [5000] = 
      {
         Description = "", 
         Name = "dummy", 
         Vnum = 5000, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created dummy", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         DefaultPosition = "standing", 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [5099] = 
      {
         Description = "", 
         Name = "dummy", 
         Vnum = 5099, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created dummy", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         DefaultPosition = "standing", 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 5099, 
         Arg3 = 5001, 
      }, 
   }, 
   Rooms = 
   {
      [5000] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5000, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Guest Room", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5001] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5001, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Lobby", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5002, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 303, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5002] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5002, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Main Lobby", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 5003, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5003] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5003, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 100", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 5004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 5002, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5004] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5004, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 200", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5021, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 5005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 5003, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5005] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5005, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 300", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 5006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 5004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5006] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5006, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 400", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5031, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 5007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 5005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5007] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5007, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 500", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 5008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 5006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5008] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5008, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 600", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5099, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 5009, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 5007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5009] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5009, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 700", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5100, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5113, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5104, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5108, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 5010, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [6] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 5008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5010] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5010, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 800", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 5009, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5011] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5011, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5041, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5012] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5012, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5043, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5042, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5013] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5013, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5045, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5044, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5014] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5014, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5047, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5046, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5015] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5015, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5049, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5048, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5098, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5016] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5016, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5003, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5096, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5017] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5017, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5051, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5050, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5018, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5018] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5018, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5052, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5053, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5019] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5019, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5055, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5018, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5054, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5020, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5020] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5020, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5057, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5056, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5097, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5021] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5021, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5094, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5022] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5022, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5059, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5021, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5058, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5023] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5023, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5061, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5060, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5024] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5024, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5063, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5062, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5025] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5025, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5065, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5064, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5095, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5026] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5026, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5092, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5027, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5027] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5027, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5067, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5066, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5028] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5028, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5069, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5027, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5068, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5029, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5029] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5029, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5071, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5070, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5030, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5030] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5030, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5073, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5029, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5072, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5093, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5031] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5031, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5090, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5032] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5032, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5074, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5031, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5075, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5033] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5033, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5077, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5076, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5034] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5034, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5079, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5078, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5035] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5035, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5081, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5080, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5091, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5036] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5036, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5089, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5037] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5037, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5083, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5082, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5038] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5038, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5085, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5084, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5039, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5039] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
         Vnum = 5039, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5086, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5087, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 5088, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5040] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5040, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Iluk Meklin's Pad", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5041] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5041, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A small office", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5042] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5042, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Star field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5043] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5043, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&RKaze &YLives &GHere &R&W", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5044] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5044, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "rand_prog", 
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&YA Puddle&R&W", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5045] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5045, 
         Flags = 
         {
            [1] = "_Reserved", 
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Verazths Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5046] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5046, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Crimson's House", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5047] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5047, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&RJarik's Domain", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5048] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5048, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&zA dark place&W.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5049] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5049, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Stormie's Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5050] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5050, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Tash's home", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5051] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5051, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "WyrmsLair", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5052] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5052, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Era's Lovely Suite", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5018, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5053] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5053, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Sho's home", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5018, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5054] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5054, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Hidden Smackdom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5055] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5055, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&Y Itoo Engineering Systems Inc. &W", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5056] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5056, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Palleon's Command Bunker", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5020, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5057] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5057, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&RV's domain", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5020, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5058] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5058, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&rhell", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5059] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5059, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&z Dark &P Room", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5060] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5060, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Dark Cave", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5061] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5061, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&PThe B&glade&Pm&gasters &PRoom&G", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5062] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5062, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Zinth's Pad", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5063] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5063, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Palim's Place", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5064] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5064, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&GCag&ggi&Gn&g'&Gs Sh&gac&Gk&R&W", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5065] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5065, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&bThe &BCourts &bof &bChaos&w", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5066] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5066, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Andross's Humble abode", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5027, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5067] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5067, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Esok's Getaway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5027, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5068] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5068, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "the dark palace", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5069] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5069, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "HENS HUMBLE BATCHELOR PAD", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5070] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5070, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Remi Traver's Appartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5029, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5071] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5071, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Moo, tastes like chicken", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5029, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5072] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5072, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Armory", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5030, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5073] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5073, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Simon's Corp. Office", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5030, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5074] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5074, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Altian's Quarters", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5075] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5075, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&BG&boraxe's &zGeTaWaY &W", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5076] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5076, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Shuruga's Den of Solitude", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5077] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5077, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Gorags Den", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5078] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5078, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&cThe Office of Jae K'Sunis&w", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5079] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5079, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Zorgos' Chambers", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5080] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5080, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Jade Incorp.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5081] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5081, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&rA Portal to Hell", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5082] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5082, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Imperial Soldier's Home", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5083] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5083, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Raichle's G-Spot", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5084] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5084, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Hadin's little refuge", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5085] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5085, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Phycos Party palace and reflection chamber", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5086] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5086, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&pZerack's Sanctuary ", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 5039, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5087] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5087, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Phaeton's Palace", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5039, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5088] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5088, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Roquepertuse's Abode", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5039, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5089] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5089, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Elden's Sanctum", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5090] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5090, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&RJ&rarik's &RD&romain", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5031, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5091] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5091, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&bAcer's &gTwinky &OHouse&G", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5092] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5092, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Simon's Bus. Office", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5093] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5093, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Humble Den of \"Spawn\"", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5030, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5094] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 5094, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Pit", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5021, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5095] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5095, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&BK&biahlin&B'&bs &BK&beep&w", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5096] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5096, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Wanderer's Den", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5097] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5097, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Engineer's Shop", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5020, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5098] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5098, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hunters Hideout", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 5015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [5099] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         TeleVnum = 0, 
         Vnum = 5099, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&RK&rtang &BG&brenade &YH&yold", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 5008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 103, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 103, 
      }, 
   }, 
   Objects = 
   {
      [5000] = 
      {
         ActionDescription = "", 
         Name = "dummy", 
         Vnum = 5000, 
         Weight = 1, 
         ShortDescr = "a newly created dummy", 
         Description = "Some god dropped a newly created dummy here.", 
         ItemType = "trash", 
         Layers = 0, 
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
         Cost = 0, 
      }, 
      [5099] = 
      {
         ActionDescription = "", 
         Name = "plant", 
         Vnum = 5099, 
         Weight = 1, 
         ShortDescr = "a plant", 
         Description = "A plant sits in the corner.", 
         ItemType = "trash", 
         Layers = 0, 
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
         Cost = 0, 
      }, 
   }, 
   HighEconomy = 0, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 5099, 
         First = 5000, 
      }, 
      Room = 
      {
         Last = 5099, 
         First = 5000, 
      }, 
      Object = 
      {
         Last = 5099, 
         First = 5000, 
      }, 
   }, 
   ResetFrequency = 0, 
   ResetMessage = "", 
   FileFormatVersion = 1, 
   LowEconomy = 130050000, 
   Author = "Durga", 
}
