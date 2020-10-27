-- Suites at Grand Towers
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   VnumRanges = 
   {
      Object = 
      {
         First = 0, 
         Last = 0, 
      }, 
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
   }, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg3 = 5113, 
         Arg2 = 1, 
         Arg1 = 5099, 
         Command = "O", 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg3 = 5108, 
         Arg2 = 1, 
         Arg1 = 5099, 
         Command = "O", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg3 = 5103, 
         Arg2 = 2, 
         Arg1 = 5190, 
         Command = "M", 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Arg1 = 10314, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Arg1 = 10313, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg3 = 5106, 
         Arg2 = 3, 
         Arg1 = 5190, 
         Command = "M", 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Arg1 = 10313, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg1 = 10314, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg3 = 5111, 
         Arg2 = 4, 
         Arg1 = 5190, 
         Command = "M", 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         Arg1 = 10313, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Arg1 = 10314, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg3 = 5104, 
         Arg2 = 1, 
         Arg1 = 10315, 
         Command = "O", 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Arg3 = 5109, 
         Arg2 = 1, 
         Arg1 = 21, 
         Command = "O", 
      }, 
      [14] = 
      {
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 1, 
         Arg1 = 5109, 
         Command = "D", 
      }, 
      [15] = 
      {
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 3, 
         Arg1 = 5109, 
         Command = "D", 
      }, 
   }, 
   Mobiles = 
   {
      [5190] = 
      {
         Sex = "undistinguished", 
         HitRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
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
         ShortDescr = "a food dispensor", 
         Name = "a food despenser", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         DamRoll = 0, 
         Alignment = 0, 
         Race = "Human", 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
         LongDescr = "A food dispensor sits in the corner here.\
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
         Vnum = 5190, 
         Level = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "water canteen", 
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
               Code = "mpmload 329\
mpforce mobslave mpoload 32252\
mpforce mobslave drop ration\
mpecho The food dispensor spits out a ration. \
mppurge mobslave\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
      }, 
   }, 
   Author = "Darrik", 
   HighEconomy = 0, 
   ResetMessage = "", 
   Objects = 
   {
   }, 
   ResetFrequency = 0, 
   Rooms = 
   {
      [5100] = 
      {
         Vnum = 5100, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
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
               DestinationVnum = 5101, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5102, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5009, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5103, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         Tag = "", 
      }, 
      [5101] = 
      {
         Vnum = 5101, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
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
               DestinationVnum = 5100, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Workshop", 
         Tag = "", 
      }, 
      [5102] = 
      {
         Vnum = 5102, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
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
               DestinationVnum = 5100, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bedroom", 
         Tag = "", 
      }, 
      [5103] = 
      {
         Vnum = 5103, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
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
               DestinationVnum = 5100, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Kitchen", 
         Tag = "", 
      }, 
      [5104] = 
      {
         Vnum = 5104, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
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
               DestinationVnum = 5009, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5105, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5107, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5106, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         Tag = "", 
      }, 
      [5105] = 
      {
         Vnum = 5105, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
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
               DestinationVnum = 5104, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bedroom", 
         Tag = "", 
      }, 
      [5106] = 
      {
         Vnum = 5106, 
         Flags = 
         {
            [3] = "Indoors", 
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
               DestinationVnum = 5104, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Kitchen", 
         Tag = "", 
      }, 
      [5107] = 
      {
         Vnum = 5107, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
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
               DestinationVnum = 5104, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Workshop", 
         Tag = "", 
      }, 
      [5108] = 
      {
         Vnum = 5108, 
         Flags = 
         {
            [3] = "Indoors", 
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
               DestinationVnum = 5009, 
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
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Key = 777, 
               Direction = "west", 
               DestinationVnum = 5109, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Suite Hallway", 
         Tag = "", 
      }, 
      [5109] = 
      {
         Vnum = 5109, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "Moving from the hallway, you enter a small foyer; grey marble tiles\
covering the floor as you step inside. Further inside, the apartment opens\
up to a courtyard garden that teems with lush and exotic plants from all\
corners of the universe. To the back of the room, a pair of wooden benches\
rest; their seats covered with plush dark green cushions.\
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
               DestinationVnum = 5111, 
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
               Key = 777, 
               Direction = "east", 
               DestinationVnum = 5108, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5110, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5112, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "The Garden Foyer", 
         Tag = "", 
      }, 
      [5110] = 
      {
         Vnum = 5110, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
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
               DestinationVnum = 5109, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         Tag = "", 
      }, 
      [5111] = 
      {
         Vnum = 5111, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
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
               DestinationVnum = 5109, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Kitchen", 
         Tag = "", 
      }, 
      [5112] = 
      {
         Vnum = 5112, 
         Flags = 
         {
            [16] = "Silence", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
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
               DestinationVnum = 5109, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "A Tranquil Workroom", 
         Tag = "", 
      }, 
      [5113] = 
      {
         Vnum = 5113, 
         Flags = 
         {
            [3] = "Indoors", 
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
               DestinationVnum = 5114, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5009, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Suite Hallway", 
         Tag = "", 
      }, 
      [5114] = 
      {
         Vnum = 5114, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
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
               DestinationVnum = 5115, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 5117, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 5116, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 5113, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "An Empty Home", 
         Tag = "", 
      }, 
      [5115] = 
      {
         Vnum = 5115, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
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
               DestinationVnum = 5114, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Bedroom", 
         Tag = "", 
      }, 
      [5116] = 
      {
         Vnum = 5116, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
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
               DestinationVnum = 5114, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Kitchen", 
         Tag = "", 
      }, 
      [5117] = 
      {
         Vnum = 5117, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
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
               DestinationVnum = 5114, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Name = "Workshop", 
         Tag = "", 
      }, 
      [5149] = 
      {
         Vnum = 5149, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
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
         Name = "Floating in a void", 
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
   LowEconomy = 6286000, 
   Name = "Suites at Grand Towers", 
   Filename = "grand_towers_suites.lua", 
}
