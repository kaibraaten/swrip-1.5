-- Dark Asteroid
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 8999, 
         Command = "M", 
         Arg3 = 8999, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 8900, 
         Command = "M", 
         Arg3 = 8999, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 8900, 
         Command = "O", 
         Arg3 = 8999, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 8999, 
         Command = "O", 
         Arg3 = 8999, 
      }, 
   }, 
   Name = "Dark Asteroid", 
   FileFormatVersion = 1, 
   Author = "Exar", 
   Mobiles = 
   {
      [8900] = 
      {
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         Level = 1, 
         Position = "standing", 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Vnum = 8900, 
         Weight = 0, 
         Name = "exarstuff", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         Description = "", 
         ShortDescr = "a newly created exarstuff", 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Stats = 
         {
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 0, 
      }, 
      [8999] = 
      {
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Race = "Human", 
         Level = 1, 
         Position = "standing", 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created exarstuff here.\
", 
         Vnum = 8999, 
         Weight = 0, 
         Name = "exarstuff", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         Description = "", 
         ShortDescr = "a newly created exarstuff", 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Alignment = 0, 
         Stats = 
         {
            Luck = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Strength = 10, 
            Intelligence = 10, 
            Constitution = 10, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 0, 
      }, 
   }, 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
   Filename = "monolith.lua", 
   LowEconomy = 9000000, 
   ResetMessage = "", 
   ResetFrequency = 180, 
   Rooms = 
   {
      [8904] = 
      {
         Vnum = 8904, 
         TeleDelay = 0, 
         Name = "A Freezing Passage", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
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
         Exits = 
         {
         }, 
         Sector = "inside", 
         Tunnel = 0, 
      }, 
      [8905] = 
      {
         Vnum = 8905, 
         TeleDelay = 0, 
         Name = "A Windy Passage", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Tunnel = 0, 
      }, 
      [8906] = 
      {
         Vnum = 8906, 
         TeleDelay = 0, 
         Name = "A Watery Passage", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Tunnel = 0, 
      }, 
      [8999] = 
      {
         Vnum = 8999, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Tunnel = 0, 
      }, 
      [8900] = 
      {
         Vnum = 8900, 
         TeleDelay = 0, 
         Name = "Primary Docking Bay", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "All manner of things litter the floor, including hydrospanners and other useful equipment, but there is also a lot of melted equipment too far damaged for you to make out.", 
               Keyword = "junk garbage", 
            }, 
         }, 
         Description = "Debris and wreckage cover the inside of this docking bay, to the point of\
making it difficult to move around.  Obviously the bay has been in a state\
of disuse for some time, possibly since the addition of this base to the\
asteroid.  You can only see one exit, a ladder leading down into the main\
portion of the asteroid.\
", 
         Flags = 
         {
            [0] = "Dark", 
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "1", 
               Code = "mpecho Some equipment clatters loudly in the northern corner of the bay.", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "down", 
               Key = 0, 
               DestinationVnum = 8901, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
      }, 
      [8901] = 
      {
         Vnum = 8901, 
         TeleDelay = 0, 
         Name = "A Descending Shaft", 
         ExtraDescriptions = 
         {
         }, 
         Description = "The ladder quickly enters a narrow shaft surrounded by the asteroid's rock\
itself, creating a very claustrophobic feel.  Only one person can fit\
through at a time, making you a blockage in this passageway.  The only\
available directions are up and down. \
", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "15", 
               Code = "mpecho Light flickers briefly below you and then disappears so quickly you aren't sure it was ever there.", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "up", 
               Key = 0, 
               DestinationVnum = 8900, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "down", 
               Key = 0, 
               DestinationVnum = 8902, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 1, 
      }, 
      [8902] = 
      {
         Vnum = 8902, 
         TeleDelay = 0, 
         Name = "An Intersection", 
         ExtraDescriptions = 
         {
         }, 
         Description = "Here, at the bottom of the Docking Bay ladder, there is a four way intersection of passages.  Each seems to have been burned from the rock.  There are some strange symbols carved into the floor here, unlike any you have ever seen before.", 
         Flags = 
         {
            [0] = "Dark", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
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
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "up", 
               Key = 0, 
               DestinationVnum = 8901, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Tunnel = 0, 
      }, 
      [8903] = 
      {
         Vnum = 8903, 
         TeleDelay = 0, 
         Name = "A Slippery Passage", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Tunnel = 2, 
      }, 
   }, 
   Objects = 
   {
      [8900] = 
      {
         Vnum = 8900, 
         Weight = 1, 
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
         Description = "A exarstuff is here.", 
         ShortDescr = "a exarstuff", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         ItemType = "trash", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [8999] = 
      {
         Vnum = 8999, 
         Weight = 1, 
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
         Description = "A exarstuff is here.", 
         ShortDescr = "a exarstuff", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         ItemType = "trash", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
   }, 
}
