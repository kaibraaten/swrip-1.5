-- Suites at Grand Towers
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   Name = "Suites at Grand Towers", 
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
   ResetMessage = "", 
   Filename = "grand_towers_suites.lua", 
   Author = "Darrik", 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 5113, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 5099, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg3 = 5108, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 5099, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Arg3 = 5103, 
         Arg2 = 2, 
         Command = "M", 
         Arg1 = 5190, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Arg3 = 5106, 
         Arg2 = 3, 
         Command = "M", 
         Arg1 = 5190, 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg3 = 5111, 
         Arg2 = 4, 
         Command = "M", 
         Arg1 = 5190, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Arg3 = 5104, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 10315, 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Arg3 = 5109, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 21, 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Arg3 = 2, 
         Arg2 = 1, 
         Command = "D", 
         Arg1 = 5109, 
         MiscData = 0, 
      }, 
      [15] = 
      {
         Arg3 = 0, 
         Arg2 = 3, 
         Command = "D", 
         Arg1 = 5109, 
         MiscData = 0, 
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
         High = 104, 
         Low = 0, 
      }, 
   }, 
   Objects = 
   {
   }, 
   Mobiles = 
   {
      [5190] = 
      {
         Height = 0, 
         Sex = "undistinguished", 
         Level = 1, 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
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
         Name = "a food despenser", 
         Weight = 0, 
         Alignment = 0, 
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
         Stats = 
         {
            Wisdom = 0, 
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Constitution = 0, 
            Strength = 0, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 0, 
         Description = "", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ShortDescr = "a food dispensor", 
         Vnum = 5190, 
         ArmorClass = 0, 
      }, 
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
   HighEconomy = 0, 
   Rooms = 
   {
      [5100] = 
      {
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 5101, 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 5102, 
               Description = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 5009, 
               Description = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 5103, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Vnum = 5100, 
      }, 
      [5101] = 
      {
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 5100, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5101, 
      }, 
      [5102] = 
      {
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 5100, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5102, 
      }, 
      [5103] = 
      {
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 5100, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5103, 
      }, 
      [5104] = 
      {
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 5009, 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 5105, 
               Description = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 5107, 
               Description = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 5106, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Vnum = 5104, 
      }, 
      [5105] = 
      {
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 5104, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5105, 
      }, 
      [5106] = 
      {
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 5104, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5106, 
      }, 
      [5107] = 
      {
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 5104, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5107, 
      }, 
      [5108] = 
      {
         Name = "Suite Hallway", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 5009, 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Direction = "west", 
               DestinationVnum = 5109, 
               Description = "", 
               Key = 777, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5108, 
      }, 
      [5109] = 
      {
         Name = "The Garden Foyer", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 5111, 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               DestinationVnum = 5108, 
               Description = "", 
               Key = 777, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 5110, 
               Description = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               DestinationVnum = 5112, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "Moving from the hallway, you enter a small foyer; grey marble tiles\
covering the floor as you step inside. Further inside, the apartment opens\
up to a courtyard garden that teems with lush and exotic plants from all\
corners of the universe. To the back of the room, a pair of wooden benches\
rest; their seats covered with plush dark green cushions.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5109, 
      }, 
      [5110] = 
      {
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 5109, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Vnum = 5110, 
      }, 
      [5111] = 
      {
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 5109, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5111, 
      }, 
      [5112] = 
      {
         Name = "A Tranquil Workroom", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 5109, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5112, 
      }, 
      [5113] = 
      {
         Name = "Suite Hallway", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 5114, 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 5009, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5113, 
      }, 
      [5114] = 
      {
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 5115, 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 5117, 
               Description = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 5116, 
               Description = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 5113, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "inside", 
         Vnum = 5114, 
      }, 
      [5115] = 
      {
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 5114, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5115, 
      }, 
      [5116] = 
      {
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 5114, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5116, 
      }, 
      [5117] = 
      {
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 5114, 
               Description = "", 
               Key = -1, 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5117, 
      }, 
      [5149] = 
      {
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Vnum = 5149, 
      }, 
   }, 
   LowEconomy = 6286000, 
}
