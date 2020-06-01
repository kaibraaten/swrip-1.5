-- Suites at Grand Towers
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Resets = 
   {
      [1] = 
      {
         Arg1 = 5099, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 5113, 
      }, 
      [2] = 
      {
         Arg1 = 5099, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 5108, 
      }, 
      [3] = 
      {
         Arg1 = 5190, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 5103, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
      }, 
      [6] = 
      {
         Arg1 = 5190, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 5106, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
      }, 
      [9] = 
      {
         Arg1 = 5190, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 5111, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
      }, 
      [12] = 
      {
         Arg1 = 10315, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 5104, 
      }, 
      [13] = 
      {
         Arg1 = 21, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 5109, 
      }, 
      [14] = 
      {
         Arg1 = 5109, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 2, 
      }, 
      [15] = 
      {
         Arg1 = 5109, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 0, 
      }, 
   }, 
   ResetMessage = "", 
   LowEconomy = 6286000, 
   Rooms = 
   {
      [5100] = 
      {
         Vnum = 5100, 
         Sector = "inside", 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5101, 
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5102, 
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5009, 
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5103, 
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5101] = 
      {
         Vnum = 5101, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5100, 
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5102] = 
      {
         Vnum = 5102, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5100, 
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5103] = 
      {
         Vnum = 5103, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5100, 
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5104] = 
      {
         Vnum = 5104, 
         Sector = "inside", 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5009, 
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5105, 
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5107, 
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5106, 
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5105] = 
      {
         Vnum = 5105, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5104, 
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5106] = 
      {
         Vnum = 5106, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5104, 
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5107] = 
      {
         Vnum = 5107, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5104, 
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5108] = 
      {
         Vnum = 5108, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Suite Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5009, 
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = 777, 
               Description = "", 
               DestinationVnum = 5109, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5109] = 
      {
         Vnum = 5109, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "The Garden Foyer", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5111, 
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = 777, 
               Description = "", 
               DestinationVnum = 5108, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5110, 
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5112, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Description = "Moving from the hallway, you enter a small foyer; grey marble tiles\
covering the floor as you step inside. Further inside, the apartment opens\
up to a courtyard garden that teems with lush and exotic plants from all\
corners of the universe. To the back of the room, a pair of wooden benches\
rest; their seats covered with plush dark green cushions.\
", 
         TeleVnum = 0, 
      }, 
      [5110] = 
      {
         Vnum = 5110, 
         Sector = "inside", 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5109, 
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5111] = 
      {
         Vnum = 5111, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5109, 
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5112] = 
      {
         Vnum = 5112, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "A Tranquil Workroom", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5109, 
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5113] = 
      {
         Vnum = 5113, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Suite Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5114, 
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5009, 
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5114] = 
      {
         Vnum = 5114, 
         Sector = "inside", 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5115, 
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5117, 
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5116, 
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5113, 
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5115] = 
      {
         Vnum = 5115, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5114, 
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5116] = 
      {
         Vnum = 5116, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5114, 
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5117] = 
      {
         Vnum = 5117, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               DestinationVnum = 5114, 
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5149] = 
      {
         Vnum = 5149, 
         Sector = "city", 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         TeleVnum = 0, 
      }, 
   }, 
   Name = "Suites at Grand Towers", 
   Filename = "grand_towers_suites.lua", 
   Author = "Darrik", 
   Mobiles = 
   {
      [5190] = 
      {
         Level = 1, 
         Credits = 0, 
         Name = "a food despenser", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpmload 329\
mpforce mobslave mpoload 32252\
mpforce mobslave drop ration\
mpecho The food dispensor spits out a ration. \
mppurge mobslave\
", 
               Arguments = "food ration", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "mpmload 329\
mpforce mobslave mpoload 31506\
mpforce mobslave drop canteen\
mppurge mobslave\
", 
               Arguments = "water canteen", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         ShortDescr = "a food dispensor", 
         Race = "Human", 
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
         Weight = 0, 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         Sex = "undistinguished", 
         Position = "standing", 
         DamRoll = 0, 
         Alignment = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Description = "", 
         Height = 0, 
         Stats = 
         {
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Strength = 0, 
            Charisma = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Force = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Vnum = 5190, 
      }, 
   }, 
   Objects = 
   {
   }, 
   VnumRanges = 
   {
      Room = 
      {
         First = 5100, 
         Last = 5149, 
      }, 
      Mob = 
      {
         First = 5190, 
         Last = 5190, 
      }, 
      Object = 
      {
         First = 0, 
         Last = 0, 
      }, 
   }, 
   ResetFrequency = 0, 
   FileFormatVersion = 1, 
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
   HighEconomy = 0, 
}
