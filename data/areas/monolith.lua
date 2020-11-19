-- Dark Asteroid
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
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
   Objects = 
   {
      [8900] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 8900, 
         Cost = 0, 
         ShortDescr = "a exarstuff", 
         Layers = 0, 
         Weight = 1, 
         Description = "A exarstuff is here.", 
         ActionDescription = "", 
         ItemType = "trash", 
         Name = "exarstuff", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [8999] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 8999, 
         Cost = 0, 
         ShortDescr = "a exarstuff", 
         Layers = 0, 
         Weight = 1, 
         Description = "A exarstuff is here.", 
         ActionDescription = "", 
         ItemType = "trash", 
         Name = "exarstuff", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
   }, 
   HighEconomy = 0, 
   Rooms = 
   {
      [8904] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 8904, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Freezing Passage", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho An icy wind blows out of nowhere and into your face.\
", 
               Arguments = "25", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [8905] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 8905, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Windy Passage", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [8906] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 8906, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Watery Passage", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [8999] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 8999, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [8900] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "All manner of things litter the floor, including hydrospanners and other useful equipment, but there is also a lot of melted equipment too far damaged for you to make out.", 
               Keyword = "junk garbage", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         Vnum = 8900, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Primary Docking Bay", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho Some equipment clatters loudly in the northern corner of the bay.", 
               Arguments = "1", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = 0, 
               DestinationVnum = 8901, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Debris and wreckage cover the inside of this docking bay, to the point of\
making it difficult to move around.  Obviously the bay has been in a state\
of disuse for some time, possibly since the addition of this base to the\
asteroid.  You can only see one exit, a ladder leading down into the main\
portion of the asteroid.\
", 
      }, 
      [8901] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Vnum = 8901, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Descending Shaft", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho Light flickers briefly below you and then disappears so quickly you aren't sure it was ever there.", 
               Arguments = "15", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = 0, 
               DestinationVnum = 8900, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = 0, 
               DestinationVnum = 8902, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 1, 
         Description = "The ladder quickly enters a narrow shaft surrounded by the asteroid's rock\
itself, creating a very claustrophobic feel.  Only one person can fit\
through at a time, making you a blockage in this passageway.  The only\
available directions are up and down. \
", 
      }, 
      [8902] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         Vnum = 8902, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Intersection", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "mpechoat Something on the floor glitters.\
", 
               Arguments = "50", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = 0, 
               DestinationVnum = 8901, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Here, at the bottom of the Docking Bay ladder, there is a four way intersection of passages.  Each seems to have been burned from the rock.  There are some strange symbols carved into the floor here, unlike any you have ever seen before.", 
      }, 
      [8903] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 8903, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Slippery Passage", 
         Exits = 
         {
         }, 
         Tunnel = 2, 
         Description = "", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 9000000, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 8999, 
         Command = "M", 
         Arg3 = 8999, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 8900, 
         Command = "M", 
         Arg3 = 8999, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 8900, 
         Command = "O", 
         Arg3 = 8999, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 8999, 
         Command = "O", 
         Arg3 = 8999, 
         Arg2 = 1, 
      }, 
   }, 
   ResetMessage = "", 
   Author = "Exar", 
   Name = "Dark Asteroid", 
   ResetFrequency = 180, 
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
   Filename = "monolith.lua", 
   Mobiles = 
   {
      [8900] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a newly created exarstuff", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 8900, 
         Height = 0, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "exarstuff", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         ArmorClass = 0, 
      }, 
      [8999] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a newly created exarstuff", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 8999, 
         Height = 0, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "exarstuff", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         ArmorClass = 0, 
      }, 
   }, 
}
