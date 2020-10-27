-- Grand Towers Appartments
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
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
   Filename = "grand_towers.lua", 
   ResetMessage = "", 
   VnumRanges = 
   {
      Mob = 
      {
         First = 5000, 
         Last = 5099, 
      }, 
      Object = 
      {
         First = 5000, 
         Last = 5099, 
      }, 
      Room = 
      {
         First = 5000, 
         Last = 5099, 
      }, 
   }, 
   HighEconomy = 0, 
   Mobiles = 
   {
      [5000] = 
      {
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Height = 0, 
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "a newly created dummy", 
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
         DamRoll = 0, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Race = "Human", 
         Name = "dummy", 
         Vnum = 5000, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [5099] = 
      {
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Height = 0, 
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "a newly created dummy", 
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
         DamRoll = 0, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Race = "Human", 
         Name = "dummy", 
         Vnum = 5099, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
   }, 
   Rooms = 
   {
      [5000] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5000, 
         Sector = "city", 
         Name = "The Guest Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5001, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5001] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5001, 
         Sector = "city", 
         Name = "The Lobby", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5002, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 303, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5011, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5002] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5002, 
         Sector = "city", 
         Name = "A Turbolift: Main Lobby", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5001, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5003, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5003] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5003, 
         Sector = "city", 
         Name = "A Turbolift: Floor 100", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5016, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5004, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5002, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5004] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5004, 
         Sector = "city", 
         Name = "A Turbolift: Floor 200", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5021, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5005, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5003, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5005] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5005, 
         Sector = "city", 
         Name = "A Turbolift: Floor 300", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5026, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5006, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5004, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5006] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5006, 
         Sector = "city", 
         Name = "A Turbolift: Floor 400", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5031, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5007, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5005, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5007] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5007, 
         Sector = "city", 
         Name = "A Turbolift: Floor 500", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5036, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5008, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5006, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5008] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5008, 
         Sector = "city", 
         Name = "A Turbolift: Floor 600", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5099, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5009, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5007, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5009] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5009, 
         Sector = "city", 
         Name = "A Turbolift: Floor 700", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5100, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5113, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5104, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5108, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 5010, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [6] = 
            {
               DestinationVnum = 5008, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5010] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5010, 
         Sector = "city", 
         Name = "A Turbolift: Floor 800", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5009, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5011] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5011, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5040, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5001, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5041, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5012, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5012] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5012, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5043, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5011, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5042, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5013, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5013] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5013, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5045, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5012, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5044, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5014, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5014] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5014, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5047, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5013, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5046, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5015, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5015] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5015, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5049, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5014, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5048, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5098, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5016] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5016, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5003, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5096, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5017, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5017] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5017, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5051, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5016, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5050, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5018, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5018] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5018, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5052, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5017, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5053, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5019, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5019] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5019, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5055, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5018, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5054, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5020, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5020] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5020, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5057, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5019, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5056, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5097, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5021] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5021, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5004, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5094, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5022, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5022] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5022, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5059, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5021, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5058, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5023, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5023] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5023, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5061, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5022, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5060, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5024, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5024] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5024, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5063, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5023, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5062, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5025, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5025] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5025, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5065, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5024, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5064, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5095, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5026] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5026, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5005, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5092, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5027, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5027] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5027, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5067, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5026, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5066, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5028, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5028] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5028, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5069, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5027, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5068, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5029, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5029] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5029, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5071, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5028, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5070, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5030, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5030] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5030, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5073, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5029, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5072, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5093, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5031] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5031, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5006, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5090, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5032, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5032] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5032, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5074, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5031, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5075, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5033, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5033] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5033, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5077, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5032, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5076, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5034, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5034] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5034, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5079, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5033, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5078, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5035, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5035] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5035, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5081, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5034, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5080, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5091, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5036] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5036, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5007, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5089, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5037, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5037] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5037, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5083, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5036, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5082, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5038, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5038] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5038, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5085, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5037, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5084, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5039, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5039] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5039, 
         Sector = "city", 
         Name = "A Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5086, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 5038, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 5087, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 5088, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5040] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5040, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5011, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5041] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5041, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5011, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5042] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5042, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5012, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5043] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5043, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5012, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5044] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5044, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5013, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5045] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5045, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5013, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5046] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5046, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5014, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5047] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5047, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5014, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5048] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5048, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5015, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5049] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5049, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5015, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5050] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5050, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5017, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5051] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5051, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5017, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5052] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5052, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5018, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5053] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5053, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5018, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5054] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5054, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5019, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5055] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5055, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5019, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5056] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5056, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5020, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5057] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5057, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5020, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5058] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5058, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5022, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5059] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5059, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5022, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5060] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5060, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5023, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5061] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5061, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5023, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5062] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5062, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5024, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5063] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5063, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5024, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5064] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5064, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5025, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5065] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5065, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5025, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5066] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5066, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5027, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5067] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5067, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5027, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5068] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5068, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5028, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5069] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5069, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5028, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5070] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5070, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5029, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5071] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5071, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5029, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5072] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5072, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5030, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5073] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5073, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5030, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5074] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5074, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5032, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5075] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5075, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5032, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5076] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5076, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5033, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5077] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5077, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5033, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5078] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5078, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5034, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5079] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5079, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5034, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5080] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5080, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5035, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5081] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5081, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5035, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5082] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5082, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5037, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5083] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5083, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5037, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5084] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5084, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5038, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5085] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5085, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5038, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5086] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5086, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5039, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5087] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5087, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5039, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5088] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5088, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5039, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5089] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5089, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5036, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5090] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5090, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5031, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5091] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5091, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5035, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5092] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5092, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5026, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5093] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5093, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5030, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5094] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5094, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5021, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5095] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5095, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5025, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5096] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5096, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5016, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5097] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5097, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5020, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5098] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5098, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5015, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [5099] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 5099, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5008, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
   }, 
   Objects = 
   {
      [5000] = 
      {
         Cost = 0, 
         ItemType = "trash", 
         Weight = 1, 
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
         ActionDescription = "", 
         Name = "dummy", 
         Vnum = 5000, 
         Description = "Some god dropped a newly created dummy here.", 
         Layers = 0, 
         ShortDescr = "a newly created dummy", 
      }, 
      [5099] = 
      {
         Cost = 0, 
         ItemType = "trash", 
         Weight = 1, 
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
         ActionDescription = "", 
         Name = "plant", 
         Vnum = 5099, 
         Description = "A plant sits in the corner.", 
         Layers = 0, 
         ShortDescr = "a plant", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Author = "Durga", 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 5099, 
         Arg3 = 5001, 
         Arg2 = 1, 
         Command = "O", 
      }, 
   }, 
   Name = "Grand Towers Appartments", 
   ResetFrequency = 0, 
   LowEconomy = 130050000, 
}
