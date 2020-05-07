-- Dark Asteroid
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Objects = 
   {
      [8900] = 
      {
         Weight = 1, 
         Name = "exarstuff", 
         ActionDescription = "", 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a exarstuff", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Layers = 0, 
         Description = "A exarstuff is here.", 
         Vnum = 8900, 
      }, 
      [8999] = 
      {
         Weight = 1, 
         Name = "exarstuff", 
         ActionDescription = "", 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a exarstuff", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Layers = 0, 
         Description = "A exarstuff is here.", 
         Vnum = 8999, 
      }, 
   }, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 8999, 
         First = 8900, 
      }, 
      Room = 
      {
         Last = 8999, 
         First = 8900, 
      }, 
      Object = 
      {
         Last = 8999, 
         First = 8900, 
      }, 
   }, 
   Rooms = 
   {
      [8904] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho An icy wind blows out of nowhere and into your face.\
", 
               Arguments = "25", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Name = "A Freezing Passage", 
         Vnum = 8904, 
      }, 
      [8905] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Name = "A Windy Passage", 
         Vnum = 8905, 
      }, 
      [8906] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Name = "A Watery Passage", 
         Vnum = 8906, 
      }, 
      [8999] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Vnum = 8999, 
      }, 
      [8900] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Debris and wreckage cover the inside of this docking bay, to the point of\
making it difficult to move around.  Obviously the bay has been in a state\
of disuse for some time, possibly since the addition of this base to the\
asteroid.  You can only see one exit, a ladder leading down into the main\
portion of the asteroid.\
", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "junk garbage", 
               Description = "All manner of things litter the floor, including hydrospanners and other useful equipment, but there is also a lot of melted equipment too far damaged for you to make out.", 
            }, 
         }, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho Some equipment clatters loudly in the northern corner of the bay.", 
               Arguments = "1", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Key = 0, 
               Description = "", 
               DestinationVnum = 8901, 
               Direction = "down", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Name = "Primary Docking Bay", 
         Vnum = 8900, 
      }, 
      [8901] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "The ladder quickly enters a narrow shaft surrounded by the asteroid's rock\
itself, creating a very claustrophobic feel.  Only one person can fit\
through at a time, making you a blockage in this passageway.  The only\
available directions are up and down. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho Light flickers briefly below you and then disappears so quickly you aren't sure it was ever there.", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Key = 0, 
               Description = "", 
               DestinationVnum = 8900, 
               Direction = "up", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Distance = 0, 
               Key = 0, 
               Description = "", 
               DestinationVnum = 8902, 
               Direction = "down", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tunnel = 1, 
         Name = "A Descending Shaft", 
         Vnum = 8901, 
      }, 
      [8902] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "Here, at the bottom of the Docking Bay ladder, there is a four way intersection of passages.  Each seems to have been burned from the rock.  There are some strange symbols carved into the floor here, unlike any you have ever seen before.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat Something on the floor glitters.\
", 
               Arguments = "50", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Distance = 0, 
               Key = 0, 
               Description = "", 
               DestinationVnum = 8901, 
               Direction = "up", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Name = "An Intersection", 
         Vnum = 8902, 
      }, 
      [8903] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 2, 
         Name = "A Slippery Passage", 
         Vnum = 8903, 
      }, 
   }, 
   Name = "Dark Asteroid", 
   ResetFrequency = 180, 
   LowEconomy = 9000000, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 8999, 
         Arg2 = 1, 
         Arg3 = 8999, 
         Command = "M", 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 8900, 
         Arg2 = 1, 
         Arg3 = 8999, 
         Command = "M", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 8900, 
         Arg2 = 1, 
         Arg3 = 8999, 
         Command = "O", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 8999, 
         Arg2 = 1, 
         Arg3 = 8999, 
         Command = "O", 
      }, 
   }, 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
   LevelRanges = 
   {
      Soft = 
      {
         High = 100, 
         Low = 40, 
      }, 
      Hard = 
      {
         High = 65, 
         Low = 0, 
      }, 
   }, 
   Mobiles = 
   {
      [8900] = 
      {
         Credits = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "exarstuff", 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
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
         Alignment = 0, 
         Position = "standing", 
         Description = "", 
         Level = 1, 
         Weight = 0, 
         Height = 0, 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Stats = 
         {
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
         }, 
         ShortDescr = "a newly created exarstuff", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Vnum = 8900, 
      }, 
      [8999] = 
      {
         Credits = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "exarstuff", 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
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
         Alignment = 0, 
         Position = "standing", 
         Description = "", 
         Level = 1, 
         Weight = 0, 
         Height = 0, 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Stats = 
         {
            Strength = 10, 
            Force = 0, 
            Constitution = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Wisdom = 10, 
         }, 
         ShortDescr = "a newly created exarstuff", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Vnum = 8999, 
      }, 
   }, 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   Filename = "monolith.lua", 
   Author = "Exar", 
   ResetMessage = "", 
}
