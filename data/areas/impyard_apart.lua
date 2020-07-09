-- Imperial Shipyard Apartments
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   Name = "Imperial Shipyard Apartments", 
   Filename = "impyard_apart.lua", 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 11694, 
         First = 11650, 
      }, 
      Room = 
      {
         Last = 11694, 
         First = 11650, 
      }, 
      Object = 
      {
         Last = 11694, 
         First = 11650, 
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
         High = 105, 
      }, 
   }, 
   Mobiles = 
   {
      [11694] = 
      {
         Name = "Complex Guard", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Height = 0, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 5, 
         }, 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_police", 
         }, 
         DamRoll = 10, 
         ArmorClass = -25, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
         }, 
         Alignment = 0, 
         HitRoll = 10, 
         Sex = "undistinguished", 
         Weight = 0, 
         Vnum = 11694, 
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
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 10, 
            HitPlus = 500, 
         }, 
         LongDescr = "A Complex guard watches the streets here.\
", 
         Level = 50, 
         SaveVs = 
         {
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         ShortDescr = "a complex guard", 
         Position = "standing", 
      }, 
      [11690] = 
      {
         Name = "A food dispensor", 
         Credits = 0, 
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a food dispensor", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
         }, 
         Alignment = 0, 
         HitRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Vnum = 11690, 
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
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "emote beeps as it processes the request.\
mpoload 24609\
give ration $n\
drop ration \
Say Enjoy.\
", 
               Arguments = "food ration hungry", 
            }, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         Level = 1, 
         SaveVs = 
         {
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         ShortDescr = "a food dispensor", 
         Position = "standing", 
      }, 
      [11650] = 
      {
         Name = "Complex Landlord", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Height = 0, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         DamRoll = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
         }, 
         Alignment = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         Weight = 0, 
         Vnum = 11650, 
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
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "The Complex Landlord works on a mound of paperwork here.\
", 
         Level = 1, 
         SaveVs = 
         {
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         DefaultPosition = "standing", 
         ShortDescr = "the complex landlord", 
         Position = "standing", 
      }, 
   }, 
   Author = "Darrik", 
   HighEconomy = 0, 
   Objects = 
   {
      [11650] = 
      {
         Name = "a shuttle", 
         Weight = 1, 
         Vnum = 11650, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "trash", 
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
         ShortDescr = "a a shuttle", 
         Description = "A a shuttle is here.", 
      }, 
      [11651] = 
      {
         Name = "Apartment 51 key", 
         Weight = 1, 
         Vnum = 11651, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key lies on the ground here.", 
      }, 
      [11652] = 
      {
         Name = "Apartment 52 key", 
         Weight = 1, 
         Vnum = 11652, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
      }, 
      [11653] = 
      {
         Name = "Apartment 53 key", 
         Weight = 1, 
         Vnum = 11653, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
      }, 
      [11654] = 
      {
         Name = "Apartment 54 key", 
         Weight = 1, 
         Vnum = 11654, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
      }, 
      [11655] = 
      {
         Name = "Apartment 55 key", 
         Weight = 1, 
         Vnum = 11655, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
      }, 
      [11656] = 
      {
         Name = "Apartment 56 key", 
         Weight = 1, 
         Vnum = 11656, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
      }, 
      [11657] = 
      {
         Name = "Apartment 57 key", 
         Weight = 1, 
         Vnum = 11657, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
      }, 
      [11658] = 
      {
         Name = "Apartment 58 key", 
         Weight = 1, 
         Vnum = 11658, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
      }, 
      [11691] = 
      {
         Name = "Suite key 91", 
         Weight = 1, 
         Vnum = 11691, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "a suite key", 
         Description = "A suite key was dropped here.", 
      }, 
      [11692] = 
      {
         Name = "Suite key 92", 
         Weight = 1, 
         Vnum = 11692, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "a suite key", 
         Description = "A suite key was dropped here", 
      }, 
      [11693] = 
      {
         Name = "Suite key 93", 
         Weight = 1, 
         Vnum = 11693, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "a suite key", 
         Description = "A suite key was dropped here.", 
      }, 
      [11694] = 
      {
         Name = "Suite key 94", 
         Weight = 1, 
         Vnum = 11694, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "a suite key", 
         Description = "A suite key was dropped here.", 
      }, 
      [11690] = 
      {
         Name = "A food dispenser", 
         Weight = 1, 
         Vnum = 11690, 
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ItemType = "furniture", 
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
         ShortDescr = "a food dispensor", 
         Description = "A food dispensor has been installed on the wall here.", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg1 = 11650, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 11684, 
      }, 
      [2] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 11684, 
      }, 
      [3] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [4] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 11684, 
      }, 
      [5] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [6] = 
      {
         Command = "M", 
         Arg1 = 32037, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 11654, 
      }, 
      [7] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 3, 
         MiscData = 1, 
         Arg3 = 11654, 
      }, 
      [8] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [9] = 
      {
         Command = "D", 
         Arg1 = 11654, 
         Arg2 = 0, 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [10] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 5, 
         MiscData = 1, 
         Arg3 = 32035, 
      }, 
      [11] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [12] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 5, 
         MiscData = 1, 
         Arg3 = 32038, 
      }, 
      [13] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [14] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 7, 
         MiscData = 1, 
         Arg3 = 32036, 
      }, 
      [15] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [16] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 8, 
         MiscData = 1, 
         Arg3 = 11671, 
      }, 
      [17] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [18] = 
      {
         Command = "D", 
         Arg1 = 11671, 
         Arg2 = 2, 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [19] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 9, 
         MiscData = 1, 
         Arg3 = 32037, 
      }, 
      [20] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [21] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 10, 
         MiscData = 1, 
         Arg3 = 11679, 
      }, 
      [22] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [23] = 
      {
         Command = "D", 
         Arg1 = 11679, 
         Arg2 = 3, 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [24] = 
      {
         Command = "M", 
         Arg1 = 11694, 
         Arg2 = 10, 
         MiscData = 1, 
         Arg3 = 11662, 
      }, 
      [25] = 
      {
         Command = "E", 
         Arg1 = 53, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10313, 
      }, 
      [27] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10314, 
      }, 
      [28] = 
      {
         Command = "M", 
         Arg1 = 11690, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 11657, 
      }, 
      [29] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10313, 
      }, 
      [30] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10314, 
      }, 
      [31] = 
      {
         Command = "M", 
         Arg1 = 5190, 
         Arg2 = 20, 
         MiscData = 1, 
         Arg3 = 11665, 
      }, 
      [32] = 
      {
         Command = "M", 
         Arg1 = 11690, 
         Arg2 = 5, 
         MiscData = 1, 
         Arg3 = 11674, 
      }, 
      [33] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10313, 
      }, 
      [34] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10314, 
      }, 
   }, 
   LowEconomy = 1003526, 
   ResetMessage = "", 
   Rooms = 
   {
      [11650] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 11651, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Distance = 0, 
               DestinationVnum = 32035, 
               Description = "", 
            }, 
         }, 
         Vnum = 11650, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11651] = 
      {
         Name = "Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 11650, 
               Description = "", 
            }, 
         }, 
         Vnum = 11651, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11652] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 11653, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 32035, 
               Description = "", 
            }, 
         }, 
         Vnum = 11652, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11653] = 
      {
         Name = "Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 11652, 
               Description = "", 
            }, 
         }, 
         Vnum = 11653, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11654] = 
      {
         Name = "Residential North Wing", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = 11691, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 11655, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 32035, 
               Description = "", 
            }, 
         }, 
         Vnum = 11654, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11655] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11656, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 11654, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 11657, 
               Description = "", 
            }, 
         }, 
         Vnum = 11655, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11656] = 
      {
         Name = "Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Distance = 0, 
               DestinationVnum = 11655, 
               Description = "", 
            }, 
         }, 
         Vnum = 11656, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11657] = 
      {
         Name = "Kitchen", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11655, 
               Description = "", 
            }, 
         }, 
         Vnum = 11657, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11658] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11659, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 32038, 
               Description = "", 
            }, 
         }, 
         Vnum = 11658, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11659] = 
      {
         Name = "An Empty Apartment", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 11658, 
               Description = "", 
            }, 
         }, 
         Vnum = 11659, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11660] = 
      {
         Name = "Apartment 54", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 32038, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11661, 
               Description = "", 
            }, 
         }, 
         Vnum = 11660, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11661] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 11660, 
               Description = "", 
            }, 
         }, 
         Vnum = 11661, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11662] = 
      {
         Name = "Residential East Wing", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11663, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 32038, 
               Description = "", 
            }, 
         }, 
         Vnum = 11662, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11663] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 11664, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11666, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 11665, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 11662, 
               Description = "", 
            }, 
         }, 
         Vnum = 11663, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11664] = 
      {
         Name = "A Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 11663, 
               Description = "", 
            }, 
         }, 
         Vnum = 11664, 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11665] = 
      {
         Name = "Kitchen", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 11663, 
               Description = "", 
            }, 
         }, 
         Vnum = 11665, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11666] = 
      {
         Name = "Workroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 11663, 
               Description = "", 
            }, 
         }, 
         Vnum = 11666, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [25] = "Refinery", 
            [26] = "Factory", 
            [19] = "ClanStoreroom", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11667] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Distance = 0, 
               DestinationVnum = 32036, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 11668, 
               Description = "", 
            }, 
         }, 
         Vnum = 11667, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11668] = 
      {
         Name = "Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 11667, 
               Description = "", 
            }, 
         }, 
         Vnum = 11668, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11669] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 11670, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Distance = 0, 
               DestinationVnum = 32036, 
               Description = "", 
            }, 
         }, 
         Vnum = 11669, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11670] = 
      {
         Name = "Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 11669, 
               Description = "", 
            }, 
         }, 
         Vnum = 11670, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11671] = 
      {
         Name = "Residential South Wing", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 32036, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = 11693, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 11672, 
               Description = "", 
            }, 
         }, 
         Vnum = 11671, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11672] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 11671, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11673, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 11674, 
               Description = "", 
            }, 
         }, 
         Vnum = 11672, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11673] = 
      {
         Name = "Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Distance = 0, 
               DestinationVnum = 11672, 
               Description = "", 
            }, 
         }, 
         Vnum = 11673, 
         Flags = 
         {
            [23] = "Hotel", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [19] = "ClanStoreroom", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11674] = 
      {
         Name = "Kitchen", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11672, 
               Description = "", 
            }, 
         }, 
         Vnum = 11674, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [19] = "ClanStoreroom", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11675] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Distance = 0, 
               DestinationVnum = 32037, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 11676, 
               Description = "", 
            }, 
         }, 
         Vnum = 11675, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11676] = 
      {
         Name = "Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11675, 
               Description = "", 
            }, 
         }, 
         Vnum = 11676, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11677] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Distance = 0, 
               DestinationVnum = 32037, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 11678, 
               Description = "", 
            }, 
         }, 
         Vnum = 11677, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11678] = 
      {
         Name = "Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11677, 
               Description = "", 
            }, 
         }, 
         Vnum = 11678, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11679] = 
      {
         Name = "Residental West Wing", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 32037, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = 11694, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 11680, 
               Description = "", 
            }, 
         }, 
         Vnum = 11679, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11680] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 11682, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11679, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 11681, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 11683, 
               Description = "", 
            }, 
         }, 
         Vnum = 11680, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleDelay = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11681] = 
      {
         Name = "Bedroom", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Distance = 0, 
               DestinationVnum = 11680, 
               Description = "", 
            }, 
         }, 
         Vnum = 11681, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11682] = 
      {
         Name = "Kitchen", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 11680, 
               Description = "", 
            }, 
         }, 
         Vnum = 11682, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11683] = 
      {
         Name = "Workshop", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 11680, 
               Description = "", 
            }, 
         }, 
         Vnum = 11683, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [26] = "Factory", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11684] = 
      {
         Name = "Imperial Shipyard Housing", 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Keyword = "", 
               Direction = "southeast", 
               Distance = 0, 
               DestinationVnum = 32034, 
               Description = "", 
            }, 
         }, 
         Vnum = 11684, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11694] = 
      {
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         Vnum = 11694, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Tunnel = 0, 
         Description = "", 
         TeleDelay = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
      }, 
   }, 
   ResetFrequency = 0, 
}
