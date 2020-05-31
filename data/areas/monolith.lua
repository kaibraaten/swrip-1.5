-- Dark Asteroid
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   ResetMessage = "", 
   Filename = "monolith.lua", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg1 = 8999, 
         Arg2 = 1, 
         Arg3 = 8999, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Command = "M", 
         Arg1 = 8900, 
         Arg2 = 1, 
         Arg3 = 8999, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Command = "O", 
         Arg1 = 8900, 
         Arg2 = 1, 
         Arg3 = 8999, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Command = "O", 
         Arg1 = 8999, 
         Arg2 = 1, 
         Arg3 = 8999, 
         MiscData = 1, 
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
   Name = "Dark Asteroid", 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
   Rooms = 
   {
      [8904] = 
      {
         Name = "A Freezing Passage", 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 8904, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho An icy wind blows out of nowhere and into your face.\
", 
               Arguments = "25", 
            }, 
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [8905] = 
      {
         Name = "A Windy Passage", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 8905, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [8906] = 
      {
         Name = "A Watery Passage", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 8906, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [8999] = 
      {
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 8999, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [8900] = 
      {
         Name = "Primary Docking Bay", 
         Flags = 
         {
            [0] = "Dark", 
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         Vnum = 8900, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "All manner of things litter the floor, including hydrospanners and other useful equipment, but there is also a lot of melted equipment too far damaged for you to make out.", 
               Keyword = "junk garbage", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho Some equipment clatters loudly in the northern corner of the bay.", 
               Arguments = "1", 
            }, 
         }, 
         Description = "Debris and wreckage cover the inside of this docking bay, to the point of\
making it difficult to move around.  Obviously the bay has been in a state\
of disuse for some time, possibly since the addition of this base to the\
asteroid.  You can only see one exit, a ladder leading down into the main\
portion of the asteroid.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Direction = "down", 
               Description = "", 
               DestinationVnum = 8901, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [8901] = 
      {
         Name = "A Descending Shaft", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Vnum = 8901, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho Light flickers briefly below you and then disappears so quickly you aren't sure it was ever there.", 
               Arguments = "15", 
            }, 
         }, 
         Description = "The ladder quickly enters a narrow shaft surrounded by the asteroid's rock\
itself, creating a very claustrophobic feel.  Only one person can fit\
through at a time, making you a blockage in this passageway.  The only\
available directions are up and down. \
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Direction = "up", 
               Description = "", 
               DestinationVnum = 8900, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = 0, 
               Direction = "down", 
               Description = "", 
               DestinationVnum = 8902, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 1, 
         TeleVnum = 0, 
      }, 
      [8902] = 
      {
         Name = "An Intersection", 
         Flags = 
         {
            [0] = "Dark", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         Vnum = 8902, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "mpechoat Something on the floor glitters.\
", 
               Arguments = "50", 
            }, 
         }, 
         Description = "Here, at the bottom of the Docking Bay ladder, there is a four way intersection of passages.  Each seems to have been burned from the rock.  There are some strange symbols carved into the floor here, unlike any you have ever seen before.", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = 0, 
               Direction = "up", 
               Description = "", 
               DestinationVnum = 8901, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [8903] = 
      {
         Name = "A Slippery Passage", 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 8903, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 2, 
         TeleVnum = 0, 
      }, 
   }, 
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
         High = 65, 
      }, 
   }, 
   Author = "Exar", 
   Mobiles = 
   {
      [8900] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Name = "exarstuff", 
         Vnum = 8900, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Race = "Human", 
         Alignment = 0, 
         DamRoll = 0, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         ShortDescr = "a newly created exarstuff", 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
      [8999] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Name = "exarstuff", 
         Vnum = 8999, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Race = "Human", 
         Alignment = 0, 
         DamRoll = 0, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         ShortDescr = "a newly created exarstuff", 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
   }, 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   Objects = 
   {
      [8900] = 
      {
         Cost = 0, 
         Name = "exarstuff", 
         ItemType = "trash", 
         Vnum = 8900, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a exarstuff", 
         Layers = 0, 
         Description = "A exarstuff is here.", 
         Weight = 1, 
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
         Cost = 0, 
         Name = "exarstuff", 
         ItemType = "trash", 
         Vnum = 8999, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a exarstuff", 
         Layers = 0, 
         Description = "A exarstuff is here.", 
         Weight = 1, 
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
   LowEconomy = 9000000, 
   ResetFrequency = 180, 
}
