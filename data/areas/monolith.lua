-- Dark Asteroid
-- Last saved Thursday 09-Jul-2020 23:19:12

AreaEntry
{
   Rooms = 
   {
      [8904] = 
      {
         TeleDelay = 0, 
         Vnum = 8904, 
         Name = "A Freezing Passage", 
         Exits = 
         {
         }, 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho An icy wind blows out of nowhere and into your face.\
", 
               MudProgType = "rand_prog", 
               Arguments = "25", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [8905] = 
      {
         TeleDelay = 0, 
         Vnum = 8905, 
         Name = "A Windy Passage", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [8906] = 
      {
         TeleDelay = 0, 
         Vnum = 8906, 
         Name = "A Watery Passage", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [8999] = 
      {
         TeleDelay = 0, 
         Vnum = 8999, 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [8900] = 
      {
         TeleDelay = 0, 
         Vnum = 8900, 
         Name = "Primary Docking Bay", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 8901, 
               Key = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "Debris and wreckage cover the inside of this docking bay, to the point of\
making it difficult to move around.  Obviously the bay has been in a state\
of disuse for some time, possibly since the addition of this base to the\
asteroid.  You can only see one exit, a ladder leading down into the main\
portion of the asteroid.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho Some equipment clatters loudly in the northern corner of the bay.", 
               MudProgType = "rand_prog", 
               Arguments = "1", 
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
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
      }, 
      [8901] = 
      {
         TeleDelay = 0, 
         Vnum = 8901, 
         Name = "A Descending Shaft", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 8900, 
               Key = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 8902, 
               Key = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "down", 
            }, 
         }, 
         Description = "The ladder quickly enters a narrow shaft surrounded by the asteroid's rock\
itself, creating a very claustrophobic feel.  Only one person can fit\
through at a time, making you a blockage in this passageway.  The only\
available directions are up and down. \
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho Light flickers briefly below you and then disappears so quickly you aren't sure it was ever there.", 
               MudProgType = "rand_prog", 
               Arguments = "15", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         TeleVnum = 0, 
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [8902] = 
      {
         TeleDelay = 0, 
         Vnum = 8902, 
         Name = "An Intersection", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 8901, 
               Key = 0, 
               Description = "", 
               Keyword = "", 
               Direction = "up", 
            }, 
         }, 
         Description = "Here, at the bottom of the Docking Bay ladder, there is a four way intersection of passages.  Each seems to have been burned from the rock.  There are some strange symbols carved into the floor here, unlike any you have ever seen before.", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat Something on the floor glitters.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "50", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
      }, 
      [8903] = 
      {
         TeleDelay = 0, 
         Vnum = 8903, 
         Name = "A Slippery Passage", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         TeleVnum = 0, 
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
   }, 
   Author = "Exar", 
   ResetFrequency = 180, 
   Name = "Dark Asteroid", 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 8999, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8999, 
      }, 
      [2] = 
      {
         Arg1 = 8900, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8999, 
      }, 
      [3] = 
      {
         Arg1 = 8900, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8999, 
      }, 
      [4] = 
      {
         Arg1 = 8999, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 8999, 
      }, 
   }, 
   Objects = 
   {
      [8900] = 
      {
         Vnum = 8900, 
         Weight = 1, 
         Name = "exarstuff", 
         Cost = 0, 
         Description = "A exarstuff is here.", 
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
         ItemType = "trash", 
         ShortDescr = "a exarstuff", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [8999] = 
      {
         Vnum = 8999, 
         Weight = 1, 
         Name = "exarstuff", 
         Cost = 0, 
         Description = "A exarstuff is here.", 
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
         ItemType = "trash", 
         ShortDescr = "a exarstuff", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
   }, 
   Filename = "monolith.lua", 
   Mobiles = 
   {
      [8900] = 
      {
         Weight = 0, 
         Name = "exarstuff", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         NumberOfAttacks = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 8900, 
         ShortDescr = "a newly created exarstuff", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
      [8999] = 
      {
         Weight = 0, 
         Name = "exarstuff", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         NumberOfAttacks = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 8999, 
         ShortDescr = "a newly created exarstuff", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
   }, 
   VnumRanges = 
   {
      Object = 
      {
         First = 8900, 
         Last = 8999, 
      }, 
      Mob = 
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
   LowEconomy = 9000000, 
   ResetMessage = "", 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
}
