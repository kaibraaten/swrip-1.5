-- Suites at Grand Towers
-- Last saved Thursday 09-Jul-2020 23:19:12

AreaEntry
{
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
   VnumRanges = 
   {
      Object = 
      {
         Last = 0, 
         First = 0, 
      }, 
      Room = 
      {
         Last = 5149, 
         First = 5100, 
      }, 
      Mob = 
      {
         Last = 5190, 
         First = 5190, 
      }, 
   }, 
   ResetFrequency = 0, 
   Objects = 
   {
   }, 
   Author = "Darrik", 
   Name = "Suites at Grand Towers", 
   Mobiles = 
   {
      [5190] = 
      {
         Credits = 0, 
         DamRoll = 0, 
         Alignment = 0, 
         ShortDescr = "a food dispensor", 
         Vnum = 5190, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Stats = 
         {
            Dexterity = 10, 
            Force = 0, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         ArmorClass = 0, 
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
         Level = 1, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "food ration", 
               Code = "mpmload 329\
mpforce mobslave mpoload 32252\
mpforce mobslave drop ration\
mpecho The food dispensor spits out a ration. \
mppurge mobslave\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "water canteen", 
               Code = "mpmload 329\
mpforce mobslave mpoload 31506\
mpforce mobslave drop canteen\
mppurge mobslave\
", 
            }, 
         }, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Name = "a food despenser", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Height = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 5113, 
         Arg1 = 5099, 
         Command = "O", 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 5108, 
         Arg1 = 5099, 
         Command = "O", 
      }, 
      [3] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 5103, 
         Arg1 = 5190, 
         Command = "M", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [6] = 
      {
         Arg2 = 3, 
         MiscData = 1, 
         Arg3 = 5106, 
         Arg1 = 5190, 
         Command = "M", 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [9] = 
      {
         Arg2 = 4, 
         MiscData = 1, 
         Arg3 = 5111, 
         Arg1 = 5190, 
         Command = "M", 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [12] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 5104, 
         Arg1 = 10315, 
         Command = "O", 
      }, 
      [13] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 5109, 
         Arg1 = 21, 
         Command = "O", 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg3 = 2, 
         Arg1 = 5109, 
         Command = "D", 
      }, 
      [15] = 
      {
         Arg2 = 3, 
         MiscData = 0, 
         Arg3 = 0, 
         Arg1 = 5109, 
         Command = "D", 
      }, 
   }, 
   Rooms = 
   {
      [5100] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5100, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5101, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 5102, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 5009, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 5103, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [5101] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Workshop", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5101, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5100, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "", 
      }, 
      [5102] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Bedroom", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5102, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5100, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
      }, 
      [5103] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Kitchen", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5103, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5100, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
      }, 
      [5104] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5104, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5009, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 5105, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 5107, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 5106, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [5105] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Bedroom", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5105, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5104, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
      }, 
      [5106] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Kitchen", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5106, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5104, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
      }, 
      [5107] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Workshop", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5107, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5104, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
      }, 
      [5108] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Suite Hallway", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5108, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5009, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
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
               Key = 777, 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
      }, 
      [5109] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Name = "The Garden Foyer", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5109, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5111, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               DestinationVnum = 5108, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = 777, 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 5110, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               DestinationVnum = 5112, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "Moving from the hallway, you enter a small foyer; grey marble tiles\
covering the floor as you step inside. Further inside, the apartment opens\
up to a courtyard garden that teems with lush and exotic plants from all\
corners of the universe. To the back of the room, a pair of wooden benches\
rest; their seats covered with plush dark green cushions.\
", 
      }, 
      [5110] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5110, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5109, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [5111] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Kitchen", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5111, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5109, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "", 
      }, 
      [5112] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
         }, 
         Name = "A Tranquil Workroom", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5112, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5109, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "", 
      }, 
      [5113] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Suite Hallway", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5113, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5114, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 5009, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
      }, 
      [5114] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5114, 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5115, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 5117, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 5116, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 5113, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [5115] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Bedroom", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5115, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5114, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "", 
      }, 
      [5116] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Kitchen", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5116, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5114, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "", 
      }, 
      [5117] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Workshop", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5117, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 5114, 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "", 
      }, 
      [5149] = 
      {
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 5149, 
         Sector = "city", 
         Exits = 
         {
         }, 
         Description = "", 
      }, 
   }, 
   HighEconomy = 0, 
   LowEconomy = 6286000, 
   ResetMessage = "", 
   Filename = "grand_towers_suites.lua", 
}
