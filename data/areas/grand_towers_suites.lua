-- Suites at Grand Towers
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
   }, 
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
   VnumRanges = 
   {
      Object = 
      {
         Last = 0, 
         First = 0, 
      }, 
      Mob = 
      {
         Last = 5190, 
         First = 5190, 
      }, 
      Room = 
      {
         Last = 5149, 
         First = 5100, 
      }, 
   }, 
   ResetMessage = "", 
   ResetFrequency = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 5113, 
         Arg1 = 5099, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Arg3 = 5108, 
         Arg1 = 5099, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Arg3 = 5103, 
         Arg1 = 5190, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [4] = 
      {
         Arg3 = 0, 
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Arg3 = 0, 
         Arg1 = 10313, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Arg3 = 5106, 
         Arg1 = 5190, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [7] = 
      {
         Arg3 = 0, 
         Arg1 = 10313, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Arg3 = 0, 
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Arg3 = 5111, 
         Arg1 = 5190, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [10] = 
      {
         Arg3 = 0, 
         Arg1 = 10313, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         Arg3 = 0, 
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg3 = 5104, 
         Arg1 = 10315, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [13] = 
      {
         Arg3 = 5109, 
         Arg1 = 21, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         Arg3 = 2, 
         Arg1 = 5109, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         Arg3 = 0, 
         Arg1 = 5109, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
      }, 
   }, 
   Author = "Darrik", 
   Rooms = 
   {
      [5100] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 5101, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5102, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5009, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5103, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5100, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tag = "", 
         Name = "An Empty Home", 
      }, 
      [5101] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5100, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5101, 
         Description = "", 
         Tag = "", 
         Name = "Workshop", 
      }, 
      [5102] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5100, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5102, 
         Description = "", 
         Tag = "", 
         Name = "Bedroom", 
      }, 
      [5103] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5100, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5103, 
         Description = "", 
         Tag = "", 
         Name = "Kitchen", 
      }, 
      [5104] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 5009, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5105, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5107, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5106, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5104, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tag = "", 
         Name = "An Empty Home", 
      }, 
      [5105] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5104, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5105, 
         Description = "", 
         Tag = "", 
         Name = "Bedroom", 
      }, 
      [5106] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5104, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5106, 
         Description = "", 
         Tag = "", 
         Name = "Kitchen", 
      }, 
      [5107] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 5104, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5107, 
         Description = "", 
         Tag = "", 
         Name = "Workshop", 
      }, 
      [5108] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5009, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Key = 777, 
               Direction = "west", 
               DestinationVnum = 5109, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5108, 
         Description = "", 
         Tag = "", 
         Name = "Suite Hallway", 
      }, 
      [5109] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 5111, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = 777, 
               Direction = "east", 
               DestinationVnum = 5108, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5110, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5112, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5109, 
         Description = "Moving from the hallway, you enter a small foyer; grey marble tiles\
covering the floor as you step inside. Further inside, the apartment opens\
up to a courtyard garden that teems with lush and exotic plants from all\
corners of the universe. To the back of the room, a pair of wooden benches\
rest; their seats covered with plush dark green cushions.\
", 
         Tag = "", 
         Name = "The Garden Foyer", 
      }, 
      [5110] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 5109, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5110, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tag = "", 
         Name = "An Empty Home", 
      }, 
      [5111] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5109, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5111, 
         Description = "", 
         Tag = "", 
         Name = "Kitchen", 
      }, 
      [5112] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5109, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5112, 
         Description = "", 
         Tag = "", 
         Name = "A Tranquil Workroom", 
      }, 
      [5113] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5114, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5009, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5113, 
         Description = "", 
         Tag = "", 
         Name = "Suite Hallway", 
      }, 
      [5114] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 5115, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5117, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5116, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5113, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5114, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tag = "", 
         Name = "An Empty Home", 
      }, 
      [5115] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5114, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5115, 
         Description = "", 
         Tag = "", 
         Name = "Bedroom", 
      }, 
      [5116] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 5114, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5116, 
         Description = "", 
         Tag = "", 
         Name = "Kitchen", 
      }, 
      [5117] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5114, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 5117, 
         Description = "", 
         Tag = "", 
         Name = "Workshop", 
      }, 
      [5149] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 5149, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "grand_towers_suites.lua", 
   Mobiles = 
   {
      [5190] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
            }, 
         }, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a food dispensor", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 5190, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "a food despenser", 
      }, 
   }, 
   LowEconomy = 6286000, 
   Name = "Suites at Grand Towers", 
}
