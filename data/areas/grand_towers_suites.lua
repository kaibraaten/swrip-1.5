-- Suites at Grand Towers
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   LowEconomy = 6286000, 
   Resets = 
   {
      [1] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 5099, 
         Arg3 = 5113, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 5099, 
         Arg3 = 5108, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Command = "M", 
         Arg2 = 2, 
         Arg1 = 5190, 
         Arg3 = 5103, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg1 = 10314, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Arg1 = 10313, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Command = "M", 
         Arg2 = 3, 
         Arg1 = 5190, 
         Arg3 = 5106, 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Arg1 = 10313, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Arg1 = 10314, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Command = "M", 
         Arg2 = 4, 
         Arg1 = 5190, 
         Arg3 = 5111, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg1 = 10313, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         Arg1 = 10314, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 10315, 
         Arg3 = 5104, 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 21, 
         Arg3 = 5109, 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Command = "D", 
         Arg2 = 1, 
         Arg1 = 5109, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [15] = 
      {
         Command = "D", 
         Arg2 = 3, 
         Arg1 = 5109, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
   }, 
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
   HighEconomy = 0, 
   Name = "Suites at Grand Towers", 
   Objects = 
   {
   }, 
   Mobiles = 
   {
      [5190] = 
      {
         Vnum = 5190, 
         ArmorClass = 0, 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
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
         HitRoll = 0, 
         Stats = 
         {
            Strength = 10, 
            Force = 0, 
            Luck = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Wisdom = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Position = "standing", 
         Level = 1, 
         Weight = 0, 
         Name = "a food despenser", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Race = "Human", 
         ShortDescr = "a food dispensor", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
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
      }, 
   }, 
   ResetMessage = "", 
   Author = "Darrik", 
   Rooms = 
   {
      [5100] = 
      {
         TeleVnum = 0, 
         Vnum = 5100, 
         Name = "The &RCaptain's &wQuarters", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "This room is filled with shag carpeting from the fur of a wampa.  The couch\
speckled with black and the heart-shaped rug in the middle of the floor\
show that this outlaw's here to break some laws. Everyone better step\
back and give this boy some room.\
", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5101, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 5102, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 5009, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               DestinationVnum = 5103, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5101] = 
      {
         TeleVnum = 0, 
         Vnum = 5101, 
         Name = "Workshop", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5100, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5102] = 
      {
         TeleVnum = 0, 
         Vnum = 5102, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5100, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5103] = 
      {
         TeleVnum = 0, 
         Vnum = 5103, 
         Name = "Kitchen", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5100, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5104] = 
      {
         TeleVnum = 0, 
         Vnum = 5104, 
         Name = "An Apartment", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5009, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 5105, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 5107, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               DestinationVnum = 5106, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5105] = 
      {
         TeleVnum = 0, 
         Vnum = 5105, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5104, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5106] = 
      {
         TeleVnum = 0, 
         Vnum = 5106, 
         Name = "Kitchen", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5104, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5107] = 
      {
         TeleVnum = 0, 
         Vnum = 5107, 
         Name = "Workshop", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5104, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5108] = 
      {
         TeleVnum = 0, 
         Vnum = 5108, 
         Name = "Suite Hallway", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5009, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 5109, 
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
               Keyword = "", 
               Description = "", 
               Key = 777, 
            }, 
         }, 
      }, 
      [5109] = 
      {
         TeleVnum = 0, 
         Vnum = 5109, 
         Name = "The Garden Foyer", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "Moving from the hallway, you enter a small foyer; grey marble tiles\
covering the floor as you step inside. Further inside, the apartment opens\
up to a courtyard garden that teems with lush and exotic plants from all\
corners of the universe. To the back of the room, a pair of wooden benches\
rest; their seats covered with plush dark green cushions.\
", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5111, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 5108, 
               Distance = 0, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               Keyword = "", 
               Description = "", 
               Key = 777, 
            }, 
            [3] = 
            {
               DestinationVnum = 5110, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               DestinationVnum = 5112, 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5110] = 
      {
         TeleVnum = 0, 
         Vnum = 5110, 
         Name = "Myzati's Chamber", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5109, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5111] = 
      {
         TeleVnum = 0, 
         Vnum = 5111, 
         Name = "Kitchen", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5109, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5112] = 
      {
         TeleVnum = 0, 
         Vnum = 5112, 
         Name = "A Tranquil Workroom", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5109, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5113] = 
      {
         TeleVnum = 0, 
         Vnum = 5113, 
         Name = "Suite Hallway", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5114, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 5009, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5114] = 
      {
         TeleVnum = 0, 
         Vnum = 5114, 
         Name = "A bachelor pad", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5115, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [2] = 
            {
               DestinationVnum = 5117, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [3] = 
            {
               DestinationVnum = 5116, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
            [4] = 
            {
               DestinationVnum = 5113, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5115] = 
      {
         TeleVnum = 0, 
         Vnum = 5115, 
         Name = "Bedroom", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5114, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5116] = 
      {
         TeleVnum = 0, 
         Vnum = 5116, 
         Name = "Kitchen", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5114, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5117] = 
      {
         TeleVnum = 0, 
         Vnum = 5117, 
         Name = "Workshop", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 5114, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               Description = "", 
               Key = -1, 
            }, 
         }, 
      }, 
      [5149] = 
      {
         TeleVnum = 0, 
         Vnum = 5149, 
         Name = "Floating in a void", 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
         }, 
      }, 
   }, 
   Filename = "grand_towers_suites.lua", 
   LevelRanges = 
   {
      Soft = 
      {
         Low = 0, 
         High = 0, 
      }, 
      Hard = 
      {
         Low = 0, 
         High = 104, 
      }, 
   }, 
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
}
