-- Suites at Grand Towers
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   LowEconomy = 6286000, 
   Name = "Suites at Grand Towers", 
   ResetFrequency = 0, 
   VnumRanges = 
   {
      Mob = 
      {
         First = 5190, 
         Last = 5190, 
      }, 
      Room = 
      {
         First = 5100, 
         Last = 5149, 
      }, 
      Object = 
      {
         First = 0, 
         Last = 0, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 5113, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 5099, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg3 = 5108, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 5099, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Arg3 = 5103, 
         Command = "M", 
         Arg2 = 2, 
         Arg1 = 5190, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Command = "G", 
         Arg1 = 10314, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Command = "G", 
         Arg1 = 10313, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Arg3 = 5106, 
         Command = "M", 
         Arg2 = 3, 
         Arg1 = 5190, 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Command = "G", 
         Arg1 = 10313, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Command = "G", 
         Arg1 = 10314, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Arg3 = 5111, 
         Command = "M", 
         Arg2 = 4, 
         Arg1 = 5190, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Command = "G", 
         Arg1 = 10313, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         Command = "G", 
         Arg1 = 10314, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg3 = 5104, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 10315, 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Arg3 = 5109, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 21, 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Arg3 = 2, 
         Command = "D", 
         Arg2 = 1, 
         Arg1 = 5109, 
         MiscData = 0, 
      }, 
      [15] = 
      {
         Arg3 = 0, 
         Command = "D", 
         Arg2 = 3, 
         Arg1 = 5109, 
         MiscData = 0, 
      }, 
   }, 
   Objects = 
   {
   }, 
   Rooms = 
   {
      [5100] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5101, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5102, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5009, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5103, 
            }, 
         }, 
         Name = "An Empty Home", 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 5100, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5101] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5100, 
            }, 
         }, 
         Name = "Workshop", 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5101, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5102] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5100, 
            }, 
         }, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5102, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5103] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5100, 
            }, 
         }, 
         Name = "Kitchen", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5103, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5104] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5009, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5105, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5107, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5106, 
            }, 
         }, 
         Name = "An Empty Home", 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 5104, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5105] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5104, 
            }, 
         }, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5105, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5106] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5104, 
            }, 
         }, 
         Name = "Kitchen", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5106, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5107] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5104, 
            }, 
         }, 
         Name = "Workshop", 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5107, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5108] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5009, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               Key = 777, 
               Description = "", 
               DestinationVnum = 5109, 
            }, 
         }, 
         Name = "Suite Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5108, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5109] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5111, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = 777, 
               Description = "", 
               DestinationVnum = 5108, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5110, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5112, 
            }, 
         }, 
         Name = "The Garden Foyer", 
         TeleDelay = 0, 
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
         Vnum = 5109, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5110] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5109, 
            }, 
         }, 
         Name = "An Empty Home", 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 5110, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5111] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5109, 
            }, 
         }, 
         Name = "Kitchen", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5111, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5112] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5109, 
            }, 
         }, 
         Name = "A Tranquil Workroom", 
         TeleDelay = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
         }, 
         Description = "", 
         Vnum = 5112, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5113] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5114, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5009, 
            }, 
         }, 
         Name = "Suite Hallway", 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5113, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5114] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5115, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5117, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5116, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5113, 
            }, 
         }, 
         Name = "An Empty Home", 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Vnum = 5114, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5115] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5114, 
            }, 
         }, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5115, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5116] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5114, 
            }, 
         }, 
         Name = "Kitchen", 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5116, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5117] = 
      {
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Keyword = "", 
               Distance = 0, 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5114, 
            }, 
         }, 
         Name = "Workshop", 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Description = "", 
         Vnum = 5117, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5149] = 
      {
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         Vnum = 5149, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
   }, 
   Mobiles = 
   {
      [5190] = 
      {
         Weight = 0, 
         Credits = 0, 
         Name = "a food despenser", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Description = "", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "water canteen", 
               Code = "mpmload 329\
mpforce mobslave mpoload 31506\
mpforce mobslave drop canteen\
mppurge mobslave\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "food ration", 
               Code = "mpmload 329\
mpforce mobslave mpoload 32252\
mpforce mobslave drop ration\
mpecho The food dispensor spits out a ration. \
mppurge mobslave\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Alignment = 0, 
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
         Height = 0, 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Constitution = 0, 
            Dexterity = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Level = 1, 
         Vnum = 5190, 
         DamRoll = 0, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
         ShortDescr = "a food dispensor", 
      }, 
   }, 
   Filename = "grand_towers_suites.lua", 
   Author = "Darrik", 
   FileFormatVersion = 1, 
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
   ResetMessage = "", 
   HighEconomy = 0, 
}
