-- Dark Asteroid
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [8900] = 
      {
         Layers = 0, 
         Description = "A exarstuff is here.", 
         ShortDescr = "a exarstuff", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 8900, 
         ActionDescription = "", 
         Tag = "", 
         Name = "exarstuff", 
      }, 
      [8999] = 
      {
         Layers = 0, 
         Description = "A exarstuff is here.", 
         ShortDescr = "a exarstuff", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 8999, 
         ActionDescription = "", 
         Tag = "", 
         Name = "exarstuff", 
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
   VnumRanges = 
   {
      Object = 
      {
         Last = 8999, 
         First = 8900, 
      }, 
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
   }, 
   ResetMessage = "", 
   ResetFrequency = 180, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 8999, 
         Arg1 = 8999, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Arg3 = 8999, 
         Arg1 = 8900, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Arg3 = 8999, 
         Arg1 = 8900, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Arg3 = 8999, 
         Arg1 = 8999, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Exar", 
   Rooms = 
   {
      [8904] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               Code = "mpecho An icy wind blows out of nowhere and into your face.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 8904, 
         Description = "", 
         Tag = "", 
         Name = "A Freezing Passage", 
      }, 
      [8905] = 
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
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 8905, 
         Description = "", 
         Tag = "", 
         Name = "A Windy Passage", 
      }, 
      [8906] = 
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
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 8906, 
         Description = "", 
         Tag = "", 
         Name = "A Watery Passage", 
      }, 
      [8999] = 
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
         Vnum = 8999, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [8900] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "1", 
               Code = "mpecho Some equipment clatters loudly in the northern corner of the bay.", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "junk garbage", 
               Description = "All manner of things litter the floor, including hydrospanners and other useful equipment, but there is also a lot of melted equipment too far damaged for you to make out.", 
            }, 
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = 0, 
               Direction = "down", 
               DestinationVnum = 8901, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 8900, 
         Description = "Debris and wreckage cover the inside of this docking bay, to the point of\
making it difficult to move around.  Obviously the bay has been in a state\
of disuse for some time, possibly since the addition of this base to the\
asteroid.  You can only see one exit, a ladder leading down into the main\
portion of the asteroid.\
", 
         Tag = "", 
         Name = "Primary Docking Bay", 
      }, 
      [8901] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 1, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               Code = "mpecho Light flickers briefly below you and then disappears so quickly you aren't sure it was ever there.", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = 0, 
               Direction = "up", 
               DestinationVnum = 8900, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = 0, 
               Direction = "down", 
               DestinationVnum = 8902, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 8901, 
         Description = "The ladder quickly enters a narrow shaft surrounded by the asteroid's rock\
itself, creating a very claustrophobic feel.  Only one person can fit\
through at a time, making you a blockage in this passageway.  The only\
available directions are up and down. \
", 
         Tag = "", 
         Name = "A Descending Shaft", 
      }, 
      [8902] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "50", 
               Code = "mpechoat Something on the floor glitters.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = 0, 
               Direction = "up", 
               DestinationVnum = 8901, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 8902, 
         Description = "Here, at the bottom of the Docking Bay ladder, there is a four way intersection of passages.  Each seems to have been burned from the rock.  There are some strange symbols carved into the floor here, unlike any you have ever seen before.", 
         Tag = "", 
         Name = "An Intersection", 
      }, 
      [8903] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 2, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 8903, 
         Description = "", 
         Tag = "", 
         Name = "A Slippery Passage", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "monolith.lua", 
   Mobiles = 
   {
      [8900] = 
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
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
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
         ShortDescr = "a newly created exarstuff", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
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
         Vnum = 8900, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "exarstuff", 
      }, 
      [8999] = 
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
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
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
         ShortDescr = "a newly created exarstuff", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
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
         Vnum = 8999, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "exarstuff", 
      }, 
   }, 
   LowEconomy = 9000000, 
   Name = "Dark Asteroid", 
}
