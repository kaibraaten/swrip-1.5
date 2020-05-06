-- Grand Towers Appartments
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   Resets = 
   {
      [1] = 
      {
         Arg1 = 5099, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 5001, 
         MiscData = 1, 
      }, 
   }, 
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
   Filename = "grand_towers.lua", 
   HighEconomy = 0, 
   Author = "Durga", 
   Mobiles = 
   {
      [5000] = 
      {
         Race = "Human", 
         Weight = 0, 
         Vnum = 5000, 
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a newly created dummy", 
         ArmorClass = 0, 
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "dummy", 
         Position = "standing", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
         }, 
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 1, 
      }, 
      [5099] = 
      {
         Race = "Human", 
         Weight = 0, 
         Vnum = 5099, 
         DefaultPosition = "standing", 
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
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a newly created dummy", 
         ArmorClass = 0, 
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "dummy", 
         Position = "standing", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
         }, 
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 1, 
      }, 
   }, 
   Name = "Grand Towers Appartments", 
   Rooms = 
   {
      [5000] = 
      {
         Description = "", 
         Vnum = 5000, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Guest Room", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5001, 
            }, 
         }, 
      }, 
      [5001] = 
      {
         Description = "", 
         Vnum = 5001, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Lobby", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5002, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 303, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5011, 
            }, 
         }, 
      }, 
      [5002] = 
      {
         Description = "", 
         Vnum = 5002, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Turbolift: Main Lobby", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5001, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5003, 
            }, 
         }, 
      }, 
      [5003] = 
      {
         Description = "", 
         Vnum = 5003, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Turbolift: Floor 100", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5016, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5004, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5002, 
            }, 
         }, 
      }, 
      [5004] = 
      {
         Description = "", 
         Vnum = 5004, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Turbolift: Floor 200", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5021, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5005, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5003, 
            }, 
         }, 
      }, 
      [5005] = 
      {
         Description = "", 
         Vnum = 5005, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Turbolift: Floor 300", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5026, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5006, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5004, 
            }, 
         }, 
      }, 
      [5006] = 
      {
         Description = "", 
         Vnum = 5006, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Turbolift: Floor 400", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5031, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5007, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5005, 
            }, 
         }, 
      }, 
      [5007] = 
      {
         Description = "", 
         Vnum = 5007, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Turbolift: Floor 500", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5036, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5008, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5006, 
            }, 
         }, 
      }, 
      [5008] = 
      {
         Description = "", 
         Vnum = 5008, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Turbolift: Floor 600", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5099, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5009, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5007, 
            }, 
         }, 
      }, 
      [5009] = 
      {
         Description = "", 
         Vnum = 5009, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Turbolift: Floor 700", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5100, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5113, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5104, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5108, 
            }, 
            [5] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5010, 
            }, 
            [6] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5008, 
            }, 
         }, 
      }, 
      [5010] = 
      {
         Description = "", 
         Vnum = 5010, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "A Turbolift: Floor 800", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5009, 
            }, 
         }, 
      }, 
      [5011] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5011, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5040, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5001, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5041, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5012, 
            }, 
         }, 
      }, 
      [5012] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5012, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5043, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5011, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5042, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5013, 
            }, 
         }, 
      }, 
      [5013] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5013, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5045, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5012, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5044, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5014, 
            }, 
         }, 
      }, 
      [5014] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5014, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5047, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5013, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5046, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5015, 
            }, 
         }, 
      }, 
      [5015] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5015, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5049, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5014, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5048, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5098, 
            }, 
         }, 
      }, 
      [5016] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5016, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5003, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5096, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5017, 
            }, 
         }, 
      }, 
      [5017] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5017, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5051, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5016, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5050, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5018, 
            }, 
         }, 
      }, 
      [5018] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5018, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5052, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5017, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5053, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5019, 
            }, 
         }, 
      }, 
      [5019] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5019, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5055, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5018, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5054, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5020, 
            }, 
         }, 
      }, 
      [5020] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5020, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5057, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5019, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5056, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5097, 
            }, 
         }, 
      }, 
      [5021] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5021, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5004, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5094, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5022, 
            }, 
         }, 
      }, 
      [5022] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5022, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5059, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5021, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5058, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5023, 
            }, 
         }, 
      }, 
      [5023] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5023, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5061, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5022, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5060, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5024, 
            }, 
         }, 
      }, 
      [5024] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5024, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5063, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5023, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5062, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5025, 
            }, 
         }, 
      }, 
      [5025] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5025, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5065, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5024, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5064, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5095, 
            }, 
         }, 
      }, 
      [5026] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5026, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5005, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5092, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5027, 
            }, 
         }, 
      }, 
      [5027] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5027, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5067, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5026, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5066, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5028, 
            }, 
         }, 
      }, 
      [5028] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5028, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5069, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5027, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5068, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5029, 
            }, 
         }, 
      }, 
      [5029] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5029, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5071, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5028, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5070, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5030, 
            }, 
         }, 
      }, 
      [5030] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5030, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5073, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5029, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5072, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5093, 
            }, 
         }, 
      }, 
      [5031] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5031, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5006, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5090, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5032, 
            }, 
         }, 
      }, 
      [5032] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5032, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5074, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5031, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5075, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5033, 
            }, 
         }, 
      }, 
      [5033] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5033, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5077, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5032, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5076, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5034, 
            }, 
         }, 
      }, 
      [5034] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5034, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5079, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5033, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5078, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5035, 
            }, 
         }, 
      }, 
      [5035] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5035, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5081, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5034, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5080, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5091, 
            }, 
         }, 
      }, 
      [5036] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5036, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5007, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5089, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5037, 
            }, 
         }, 
      }, 
      [5037] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5037, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5083, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5036, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5082, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5038, 
            }, 
         }, 
      }, 
      [5038] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5038, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5085, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5037, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5084, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5039, 
            }, 
         }, 
      }, 
      [5039] = 
      {
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Vnum = 5039, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "A Hallway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5086, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5038, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5087, 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5088, 
            }, 
         }, 
      }, 
      [5040] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5040, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Iluk Meklin's Pad", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5011, 
            }, 
         }, 
      }, 
      [5041] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5041, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "A small office", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5011, 
            }, 
         }, 
      }, 
      [5042] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5042, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Star field", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5012, 
            }, 
         }, 
      }, 
      [5043] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5043, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&RKaze &YLives &GHere &R&W", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5012, 
            }, 
         }, 
      }, 
      [5044] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5044, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         Name = "&YA Puddle&R&W", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5013, 
            }, 
         }, 
      }, 
      [5045] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5045, 
         Tunnel = 0, 
         Flags = 
         {
            [1] = "_Reserved", 
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Verazths Apartment", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5013, 
            }, 
         }, 
      }, 
      [5046] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5046, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Crimson's House", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5014, 
            }, 
         }, 
      }, 
      [5047] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5047, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&RJarik's Domain", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5014, 
            }, 
         }, 
      }, 
      [5048] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5048, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&zA dark place&W.", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5015, 
            }, 
         }, 
      }, 
      [5049] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5049, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Stormie's Apartment", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5015, 
            }, 
         }, 
      }, 
      [5050] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5050, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Tash's home", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5017, 
            }, 
         }, 
      }, 
      [5051] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5051, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "WyrmsLair", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5017, 
            }, 
         }, 
      }, 
      [5052] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5052, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Era's Lovely Suite", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5018, 
            }, 
         }, 
      }, 
      [5053] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5053, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Sho's home", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5018, 
            }, 
         }, 
      }, 
      [5054] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5054, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Hidden Smackdom", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5019, 
            }, 
         }, 
      }, 
      [5055] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5055, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         Name = "&Y Itoo Engineering Systems Inc. &W", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5019, 
            }, 
         }, 
      }, 
      [5056] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5056, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Palleon's Command Bunker", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5020, 
            }, 
         }, 
      }, 
      [5057] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5057, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&RV's domain", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5020, 
            }, 
         }, 
      }, 
      [5058] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5058, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&rhell", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5022, 
            }, 
         }, 
      }, 
      [5059] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5059, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&z Dark &P Room", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5022, 
            }, 
         }, 
      }, 
      [5060] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5060, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "A Dark Cave", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5023, 
            }, 
         }, 
      }, 
      [5061] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5061, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&PThe B&glade&Pm&gasters &PRoom&G", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5023, 
            }, 
         }, 
      }, 
      [5062] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5062, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Zinth's Pad", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5024, 
            }, 
         }, 
      }, 
      [5063] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5063, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Palim's Place", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5024, 
            }, 
         }, 
      }, 
      [5064] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5064, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&GCag&ggi&Gn&g'&Gs Sh&gac&Gk&R&W", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5025, 
            }, 
         }, 
      }, 
      [5065] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5065, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&bThe &BCourts &bof &bChaos&w", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5025, 
            }, 
         }, 
      }, 
      [5066] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5066, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Andross's Humble abode", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5027, 
            }, 
         }, 
      }, 
      [5067] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5067, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Esok's Getaway", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5027, 
            }, 
         }, 
      }, 
      [5068] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5068, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "the dark palace", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5028, 
            }, 
         }, 
      }, 
      [5069] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5069, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "HENS HUMBLE BATCHELOR PAD", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5028, 
            }, 
         }, 
      }, 
      [5070] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5070, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Remi Traver's Appartment", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5029, 
            }, 
         }, 
      }, 
      [5071] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5071, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Moo, tastes like chicken", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5029, 
            }, 
         }, 
      }, 
      [5072] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5072, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "The Armory", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5030, 
            }, 
         }, 
      }, 
      [5073] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5073, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Simon's Corp. Office", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5030, 
            }, 
         }, 
      }, 
      [5074] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5074, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Altian's Quarters", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5032, 
            }, 
         }, 
      }, 
      [5075] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5075, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&BG&boraxe's &zGeTaWaY &W", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5032, 
            }, 
         }, 
      }, 
      [5076] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5076, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Shuruga's Den of Solitude", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5033, 
            }, 
         }, 
      }, 
      [5077] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5077, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Gorags Den", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5033, 
            }, 
         }, 
      }, 
      [5078] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5078, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&cThe Office of Jae K'Sunis&w", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5034, 
            }, 
         }, 
      }, 
      [5079] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5079, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Zorgos' Chambers", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5034, 
            }, 
         }, 
      }, 
      [5080] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5080, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Jade Incorp.", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5035, 
            }, 
         }, 
      }, 
      [5081] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5081, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&rA Portal to Hell", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5035, 
            }, 
         }, 
      }, 
      [5082] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5082, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "An Imperial Soldier's Home", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5037, 
            }, 
         }, 
      }, 
      [5083] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5083, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Raichle's G-Spot", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5037, 
            }, 
         }, 
      }, 
      [5084] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5084, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Hadin's little refuge", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5038, 
            }, 
         }, 
      }, 
      [5085] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5085, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Phycos Party palace and reflection chamber", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5038, 
            }, 
         }, 
      }, 
      [5086] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5086, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&pZerack's Sanctuary ", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5039, 
            }, 
         }, 
      }, 
      [5087] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5087, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Phaeton's Palace", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5039, 
            }, 
         }, 
      }, 
      [5088] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5088, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Roquepertuse's Abode", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5039, 
            }, 
         }, 
      }, 
      [5089] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5089, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Elden's Sanctum", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5036, 
            }, 
         }, 
      }, 
      [5090] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5090, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&RJ&rarik's &RD&romain", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5031, 
            }, 
         }, 
      }, 
      [5091] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5091, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&bAcer's &gTwinky &OHouse&G", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5035, 
            }, 
         }, 
      }, 
      [5092] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5092, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Simon's Bus. Office", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5026, 
            }, 
         }, 
      }, 
      [5093] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5093, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "The Humble Den of \"Spawn\"", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5030, 
            }, 
         }, 
      }, 
      [5094] = 
      {
         Description = "", 
         Vnum = 5094, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
         }, 
         Name = "The Pit", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5021, 
            }, 
         }, 
      }, 
      [5095] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5095, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "&BK&biahlin&B'&bs &BK&beep&w", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5025, 
            }, 
         }, 
      }, 
      [5096] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5096, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "The Wanderer's Den", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5016, 
            }, 
         }, 
      }, 
      [5097] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5097, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "An Engineer's Shop", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5020, 
            }, 
         }, 
      }, 
      [5098] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5098, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "A Hunters Hideout", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5015, 
            }, 
         }, 
      }, 
      [5099] = 
      {
         Description = "This is a small but comfortable room. However it could use a few personal\
touches to make it feel more like home and less like a hotel room.\
", 
         Vnum = 5099, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [20] = "PlayerHome", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Name = "&RK&rtang &BG&brenade &YH&yold", 
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 5008, 
            }, 
         }, 
      }, 
   }, 
   LowEconomy = 130050000, 
   Objects = 
   {
      [5000] = 
      {
         Description = "Some god dropped a newly created dummy here.", 
         ShortDescr = "a newly created dummy", 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Name = "dummy", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         Layers = 0, 
         ActionDescription = "", 
         Vnum = 5000, 
      }, 
      [5099] = 
      {
         Description = "A plant sits in the corner.", 
         ShortDescr = "a plant", 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Name = "plant", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 0, 
         Layers = 0, 
         ActionDescription = "", 
         Vnum = 5099, 
      }, 
   }, 
   ResetMessage = "", 
}
