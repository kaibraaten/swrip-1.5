-- Suites at Grand Towers
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   ResetMessage = "", 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 5099, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 5113, 
      }, 
      [2] = 
      {
         Arg1 = 5099, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 5108, 
      }, 
      [3] = 
      {
         Arg1 = 5190, 
         Arg2 = 2, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 5103, 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [6] = 
      {
         Arg1 = 5190, 
         Arg2 = 3, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 5106, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [9] = 
      {
         Arg1 = 5190, 
         Arg2 = 4, 
         MiscData = 1, 
         Command = "M", 
         Arg3 = 5111, 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [12] = 
      {
         Arg1 = 10315, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 5104, 
      }, 
      [13] = 
      {
         Arg1 = 21, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "O", 
         Arg3 = 5109, 
      }, 
      [14] = 
      {
         Arg1 = 5109, 
         Arg2 = 1, 
         MiscData = 0, 
         Command = "D", 
         Arg3 = 2, 
      }, 
      [15] = 
      {
         Arg1 = 5109, 
         Arg2 = 3, 
         MiscData = 0, 
         Command = "D", 
         Arg3 = 0, 
      }, 
   }, 
   Mobiles = 
   {
      [5190] = 
      {
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 1, 
         ShortDescr = "a food dispensor", 
         Sex = "undistinguished", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Vnum = 5190, 
         DamRoll = 0, 
         Name = "a food despenser", 
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
         Credits = 0, 
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
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Strength = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Intelligence = 10, 
         }, 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         Height = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         Weight = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Position = "standing", 
      }, 
   }, 
   Rooms = 
   {
      [5100] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5101, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5102, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5009, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5103, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5100, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "The &RCaptain's &wQuarters", 
         Description = "This room is filled with shag carpeting from the fur of a wampa.  The couch\
speckled with black and the heart-shaped rug in the middle of the floor\
show that this outlaw's here to break some laws. Everyone better step\
back and give this boy some room.\
", 
      }, 
      [5101] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5100, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5101, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Workshop", 
         Description = "", 
      }, 
      [5102] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5100, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5102, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Bedroom", 
         Description = "", 
      }, 
      [5103] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5100, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5103, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Kitchen", 
         Description = "", 
      }, 
      [5104] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5009, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5105, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5107, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5106, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5104, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "An Apartment", 
         Description = "", 
      }, 
      [5105] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5104, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5105, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Bedroom", 
         Description = "", 
      }, 
      [5106] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5104, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5106, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Kitchen", 
         Description = "", 
      }, 
      [5107] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5104, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5107, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Workshop", 
         Description = "", 
      }, 
      [5108] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5009, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = 777, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5109, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5108, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Suite Hallway", 
         Description = "", 
      }, 
      [5109] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5111, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = 777, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5108, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5110, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5112, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5109, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Name = "The Garden Foyer", 
         Description = "Moving from the hallway, you enter a small foyer; grey marble tiles\
covering the floor as you step inside. Further inside, the apartment opens\
up to a courtyard garden that teems with lush and exotic plants from all\
corners of the universe. To the back of the room, a pair of wooden benches\
rest; their seats covered with plush dark green cushions.\
", 
      }, 
      [5110] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5109, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5110, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Myzati's Chamber", 
         Description = "", 
      }, 
      [5111] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5109, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5111, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Kitchen", 
         Description = "", 
      }, 
      [5112] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5109, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5112, 
         Flags = 
         {
            [16] = "Silence", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
            [26] = "Factory", 
         }, 
         Name = "A Tranquil Workroom", 
         Description = "", 
      }, 
      [5113] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5114, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5009, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5113, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Suite Hallway", 
         Description = "", 
      }, 
      [5114] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5115, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5117, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5116, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5113, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5114, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "A bachelor pad", 
         Description = "", 
      }, 
      [5115] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5114, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5115, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Bedroom", 
         Description = "", 
      }, 
      [5116] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5114, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5116, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Kitchen", 
         Description = "", 
      }, 
      [5117] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 5114, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5117, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Workshop", 
         Description = "", 
      }, 
      [5149] = 
      {
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5149, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
         Description = "", 
      }, 
   }, 
   Objects = 
   {
   }, 
   ResetFrequency = 0, 
   HighEconomy = 0, 
   LowEconomy = 6286000, 
   Author = "Darrik", 
   FileFormatVersion = 1, 
   Name = "Suites at Grand Towers", 
   Filename = "grand_towers_suites.lua", 
}
