-- Dark Asteroid
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   Rooms = 
   {
      [8904] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "25", 
               MudProgType = "rand_prog", 
               Code = "mpecho An icy wind blows out of nowhere and into your face.\
", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "", 
         Vnum = 8904, 
         Exits = 
         {
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
         Name = "A Freezing Passage", 
      }, 
      [8905] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "", 
         Vnum = 8905, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "A Windy Passage", 
      }, 
      [8906] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "", 
         Vnum = 8906, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "A Watery Passage", 
      }, 
      [8999] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 8999, 
         Exits = 
         {
         }, 
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
      }, 
      [8900] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "1", 
               MudProgType = "rand_prog", 
               Code = "mpecho Some equipment clatters loudly in the northern corner of the bay.", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "Debris and wreckage cover the inside of this docking bay, to the point of\
making it difficult to move around.  Obviously the bay has been in a state\
of disuse for some time, possibly since the addition of this base to the\
asteroid.  You can only see one exit, a ladder leading down into the main\
portion of the asteroid.\
", 
         Vnum = 8900, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 8901, 
               Key = 0, 
               Keyword = "", 
               Direction = "down", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "All manner of things litter the floor, including hydrospanners and other useful equipment, but there is also a lot of melted equipment too far damaged for you to make out.", 
               Keyword = "junk garbage", 
            }, 
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         Name = "Primary Docking Bay", 
      }, 
      [8901] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "15", 
               MudProgType = "rand_prog", 
               Code = "mpecho Light flickers briefly below you and then disappears so quickly you aren't sure it was ever there.", 
            }, 
         }, 
         Tunnel = 1, 
         Sector = "inside", 
         Description = "The ladder quickly enters a narrow shaft surrounded by the asteroid's rock\
itself, creating a very claustrophobic feel.  Only one person can fit\
through at a time, making you a blockage in this passageway.  The only\
available directions are up and down. \
", 
         Vnum = 8901, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 8900, 
               Key = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 8902, 
               Key = 0, 
               Keyword = "", 
               Direction = "down", 
               Description = "", 
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
         Name = "A Descending Shaft", 
      }, 
      [8902] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "50", 
               MudProgType = "all_greet_prog", 
               Code = "mpechoat Something on the floor glitters.\
", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "Here, at the bottom of the Docking Bay ladder, there is a four way intersection of passages.  Each seems to have been burned from the rock.  There are some strange symbols carved into the floor here, unlike any you have ever seen before.", 
         Vnum = 8902, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 8901, 
               Key = 0, 
               Keyword = "", 
               Direction = "up", 
               Description = "", 
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
         Name = "An Intersection", 
      }, 
      [8903] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 2, 
         Sector = "inside", 
         Description = "", 
         Vnum = 8903, 
         Exits = 
         {
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
         Name = "A Slippery Passage", 
      }, 
   }, 
   Name = "Dark Asteroid", 
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
   Author = "Exar", 
   Filename = "monolith.lua", 
   ResetMessage = "", 
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
   Resets = 
   {
      [1] = 
      {
         Arg3 = 8999, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 8999, 
      }, 
      [2] = 
      {
         Arg3 = 8999, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 8900, 
      }, 
      [3] = 
      {
         Arg3 = 8999, 
         Command = "O", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 8900, 
      }, 
      [4] = 
      {
         Arg3 = 8999, 
         Command = "O", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 8999, 
      }, 
   }, 
   ResetFrequency = 180, 
   LowEconomy = 9000000, 
   HighEconomy = 0, 
   Mobiles = 
   {
      [8900] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Flags = 
         {
            [0] = "Npc", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a newly created exarstuff", 
         Vnum = 8900, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "exarstuff", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [8999] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Flags = 
         {
            [0] = "Npc", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a newly created exarstuff", 
         Vnum = 8999, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "exarstuff", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
   }, 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
   Objects = 
   {
      [8900] = 
      {
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "A exarstuff is here.", 
         ShortDescr = "a exarstuff", 
         Name = "exarstuff", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 8900, 
      }, 
      [8999] = 
      {
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "A exarstuff is here.", 
         ShortDescr = "a exarstuff", 
         Name = "exarstuff", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ItemType = "trash", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 8999, 
      }, 
   }, 
}
