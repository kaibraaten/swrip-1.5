-- Dark Asteroid
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [8900] = 
      {
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a exarstuff", 
         Name = "exarstuff", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8900, 
         Cost = 0, 
         Description = "A exarstuff is here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [8999] = 
      {
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a exarstuff", 
         Name = "exarstuff", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 8999, 
         Cost = 0, 
         Description = "A exarstuff is here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
   }, 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 8999, 
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 8999, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg3 = 8999, 
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 8900, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Arg3 = 8999, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 8900, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg3 = 8999, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 8999, 
         MiscData = 1, 
      }, 
   }, 
   Author = "Exar", 
   ResetMessage = "", 
   Name = "Dark Asteroid", 
   Rooms = 
   {
      [8904] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Freezing Passage", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "25", 
               Code = "mpecho An icy wind blows out of nowhere and into your face.\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Vnum = 8904, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [8905] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "A Windy Passage", 
         Vnum = 8905, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [8906] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "A Watery Passage", 
         Vnum = 8906, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [8999] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 8999, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [8900] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Primary Docking Bay", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "1", 
               Code = "mpecho Some equipment clatters loudly in the northern corner of the bay.", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Vnum = 8900, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "junk garbage", 
               Description = "All manner of things litter the floor, including hydrospanners and other useful equipment, but there is also a lot of melted equipment too far damaged for you to make out.", 
            }, 
         }, 
         Description = "Debris and wreckage cover the inside of this docking bay, to the point of\
making it difficult to move around.  Obviously the bay has been in a state\
of disuse for some time, possibly since the addition of this base to the\
asteroid.  You can only see one exit, a ladder leading down into the main\
portion of the asteroid.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = 0, 
               Description = "", 
               DestinationVnum = 8901, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [8901] = 
      {
         Tunnel = 1, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Descending Shaft", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho Light flickers briefly below you and then disappears so quickly you aren't sure it was ever there.", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Vnum = 8901, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The ladder quickly enters a narrow shaft surrounded by the asteroid's rock\
itself, creating a very claustrophobic feel.  Only one person can fit\
through at a time, making you a blockage in this passageway.  The only\
available directions are up and down. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = 0, 
               Description = "", 
               DestinationVnum = 8900, 
               Direction = "up", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = 0, 
               Description = "", 
               DestinationVnum = 8902, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [8902] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Intersection", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "50", 
               Code = "mpechoat Something on the floor glitters.\
", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Vnum = 8902, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Here, at the bottom of the Docking Bay ladder, there is a four way intersection of passages.  Each seems to have been burned from the rock.  There are some strange symbols carved into the floor here, unlike any you have ever seen before.", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = 0, 
               Description = "", 
               DestinationVnum = 8901, 
               Direction = "up", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [8903] = 
      {
         Tunnel = 2, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Slippery Passage", 
         Vnum = 8903, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
   }, 
   LowEconomy = 9000000, 
   Mobiles = 
   {
      [8900] = 
      {
         Race = "Human", 
         Stats = 
         {
            Constitution = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Charisma = 0, 
            Force = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 8900, 
         Alignment = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created exarstuff", 
         Weight = 0, 
         Name = "exarstuff", 
         Height = 0, 
         Sex = "undistinguished", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
      }, 
      [8999] = 
      {
         Race = "Human", 
         Stats = 
         {
            Constitution = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Charisma = 0, 
            Force = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 8999, 
         Alignment = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created exarstuff", 
         Weight = 0, 
         Name = "exarstuff", 
         Height = 0, 
         Sex = "undistinguished", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
      }, 
   }, 
   VnumRanges = 
   {
      Mob = 
      {
         First = 8900, 
         Last = 8999, 
      }, 
      Object = 
      {
         First = 8900, 
         Last = 8999, 
      }, 
      Room = 
      {
         First = 8900, 
         Last = 8999, 
      }, 
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
   FileFormatVersion = 1, 
   ResetFrequency = 180, 
   Filename = "monolith.lua", 
}
