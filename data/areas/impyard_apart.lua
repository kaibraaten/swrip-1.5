-- Imperial Shipyard Apartments
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Mobiles = 
   {
      [11694] = 
      {
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Vnum = 11694, 
         Sex = "undistinguished", 
         ArmorClass = -25, 
         ShortDescr = "a complex guard", 
         LongDescr = "A Complex guard watches the streets here.\
", 
         DamRoll = 10, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 10, 
            HitPlus = 500, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
         }, 
         SpecFuns = 
         {
            [0] = "spec_police", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
         Description = "", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Credits = 0, 
         Name = "Complex Guard", 
         Stats = 
         {
            Dexterity = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Force = 0, 
            Strength = 0, 
         }, 
         HitRoll = 10, 
         Height = 0, 
         DefaultPosition = "standing", 
         Level = 50, 
         Race = "Human", 
         Position = "standing", 
      }, 
      [11690] = 
      {
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
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Vnum = 11690, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         ShortDescr = "a food dispensor", 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Description = "", 
         Alignment = 0, 
         Weight = 0, 
         Shop = 
         {
            KeeperShortDescr = "a food dispensor", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "emote beeps as it processes the request.\
mpoload 24609\
give ration $n\
drop ration \
Say Enjoy.\
", 
               Arguments = "food ration hungry", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Credits = 0, 
         Name = "A food dispensor", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Force = 0, 
            Strength = 0, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Race = "Human", 
         Position = "standing", 
      }, 
      [11650] = 
      {
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
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Vnum = 11650, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         ShortDescr = "the complex landlord", 
         LongDescr = "The Complex Landlord works on a mound of paperwork here.\
", 
         DamRoll = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Description = "", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Credits = 0, 
         Name = "Complex Landlord", 
         Stats = 
         {
            Dexterity = 0, 
            Intelligence = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Force = 0, 
            Strength = 0, 
         }, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
         Race = "Human", 
         Position = "standing", 
      }, 
   }, 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 11684, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11650, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Arg3 = 11684, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 2, 
      }, 
      [3] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Arg3 = 11684, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 2, 
      }, 
      [5] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Arg3 = 11654, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 32037, 
         Arg2 = 2, 
      }, 
      [7] = 
      {
         Arg3 = 11654, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 3, 
      }, 
      [8] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 11654, 
         Arg2 = 0, 
      }, 
      [10] = 
      {
         Arg3 = 32035, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 5, 
      }, 
      [11] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg3 = 32038, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 5, 
      }, 
      [13] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         Arg3 = 32036, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 7, 
      }, 
      [15] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         Arg3 = 11671, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 8, 
      }, 
      [17] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 11671, 
         Arg2 = 2, 
      }, 
      [19] = 
      {
         Arg3 = 32037, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 9, 
      }, 
      [20] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         Arg3 = 11679, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 10, 
      }, 
      [22] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 11679, 
         Arg2 = 3, 
      }, 
      [24] = 
      {
         Arg3 = 11662, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11694, 
         Arg2 = 10, 
      }, 
      [25] = 
      {
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 53, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [28] = 
      {
         Arg3 = 11657, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11690, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [31] = 
      {
         Arg3 = 11665, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 5190, 
         Arg2 = 20, 
      }, 
      [32] = 
      {
         Arg3 = 11674, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 11690, 
         Arg2 = 5, 
      }, 
      [33] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [34] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
   }, 
   Author = "Darrik", 
   Name = "Imperial Shipyard Apartments", 
   LevelRanges = 
   {
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
   ResetMessage = "", 
   Rooms = 
   {
      [11650] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11650, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11651, 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               DestinationVnum = 32035, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11651] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 11651, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11650, 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11652] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11652, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11653, 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32035, 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11653] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 11653, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11652, 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11654] = 
      {
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 11654, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 11655, 
               Direction = "north", 
               Key = 11691, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32035, 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Residential North Wing", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11655] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11655, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11656, 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11654, 
               Direction = "south", 
               Key = -1, 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11657, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11656] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 11656, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               DestinationVnum = 11655, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11657] = 
      {
         Description = "", 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 11657, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11655, 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Kitchen", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11658] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11658, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11659, 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32038, 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11659] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 11659, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11658, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Apartment", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11660] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Vnum = 11660, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32038, 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11661, 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Apartment 54", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11661] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11661, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11660, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11662] = 
      {
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 11662, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11663, 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32038, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Residential East Wing", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11663] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11663, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11664, 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11666, 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11665, 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11662, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11664] = 
      {
         Description = "", 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 11664, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11663, 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11665] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 11665, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11663, 
               Direction = "north", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Kitchen", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11666] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [25] = "Refinery", 
            [26] = "Factory", 
            [19] = "ClanStoreroom", 
         }, 
         Vnum = 11666, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11663, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Workroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11667] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11667, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               DestinationVnum = 32036, 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11668, 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11668] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 11668, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11667, 
               Direction = "north", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11669] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11669, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11670, 
               Direction = "south", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               DestinationVnum = 32036, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11670] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 11670, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11669, 
               Direction = "north", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11671] = 
      {
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 11671, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32036, 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 11672, 
               Direction = "south", 
               Key = 11693, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Residential South Wing", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11672] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11672, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11671, 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11673, 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11674, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11673] = 
      {
         Description = "", 
         Flags = 
         {
            [23] = "Hotel", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [19] = "ClanStoreroom", 
         }, 
         Vnum = 11673, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               DestinationVnum = 11672, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11674] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [19] = "ClanStoreroom", 
         }, 
         Vnum = 11674, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11672, 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Kitchen", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11675] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11675, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               DestinationVnum = 32037, 
               Direction = "south", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11676, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11676] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 11676, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11675, 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11677] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11677, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               DestinationVnum = 32037, 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11678, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11678] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 11678, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11677, 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11679] = 
      {
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 11679, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32037, 
               Direction = "east", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 11680, 
               Direction = "west", 
               Key = 11694, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Residental West Wing", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11680] = 
      {
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 11680, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11682, 
               Direction = "north", 
               Key = -1, 
            }, 
            [2] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11679, 
               Direction = "east", 
               Key = -1, 
            }, 
            [3] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11681, 
               Direction = "south", 
               Key = -1, 
            }, 
            [4] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11683, 
               Direction = "west", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11681] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Vnum = 11681, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               DestinationVnum = 11680, 
               Direction = "north", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bedroom", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11682] = 
      {
         Description = "", 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 11682, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11680, 
               Direction = "south", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Kitchen", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11683] = 
      {
         Description = "", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [26] = "Factory", 
         }, 
         Vnum = 11683, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 11680, 
               Direction = "east", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Workshop", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11684] = 
      {
         Description = "", 
         Flags = 
         {
            [14] = "Donation", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Vnum = 11684, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Distance = 0, 
               Keyword = "", 
               DestinationVnum = 32034, 
               Direction = "southeast", 
               Key = -1, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Imperial Shipyard Housing", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11694] = 
      {
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Vnum = 11694, 
         TeleVnum = 0, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
   }, 
   Objects = 
   {
      [11650] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11650, 
         Cost = 0, 
         Name = "a shuttle", 
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
         ItemType = "trash", 
         Description = "A a shuttle is here.", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11651] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11651, 
         Cost = 0, 
         Name = "Apartment 51 key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key lies on the ground here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11652] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11652, 
         Cost = 0, 
         Name = "Apartment 52 key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11653] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11653, 
         Cost = 0, 
         Name = "Apartment 53 key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11654] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11654, 
         Cost = 0, 
         Name = "Apartment 54 key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11655] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11655, 
         Cost = 0, 
         Name = "Apartment 55 key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11656] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11656, 
         Cost = 0, 
         Name = "Apartment 56 key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11657] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11657, 
         Cost = 0, 
         Name = "Apartment 57 key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11658] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11658, 
         Cost = 0, 
         Name = "Apartment 58 key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "an apartment key", 
         Description = "An apartment key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11691] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11691, 
         Cost = 0, 
         Name = "Suite key 91", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a suite key", 
         Description = "A suite key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11692] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11692, 
         Cost = 0, 
         Name = "Suite key 92", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a suite key", 
         Description = "A suite key was dropped here", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11693] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11693, 
         Cost = 0, 
         Name = "Suite key 93", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a suite key", 
         Description = "A suite key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11694] = 
      {
         Layers = 0, 
         Weight = 1, 
         Vnum = 11694, 
         Cost = 0, 
         Name = "Suite key 94", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a suite key", 
         Description = "A suite key was dropped here.", 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [11690] = 
      {
         Layers = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 11690, 
         Cost = 0, 
         Name = "A food dispenser", 
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
         Weight = 1, 
         ItemType = "furniture", 
         Description = "A food dispensor has been installed on the wall here.", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
      }, 
   }, 
   Filename = "impyard_apart.lua", 
   LowEconomy = 1003526, 
   ResetFrequency = 0, 
   VnumRanges = 
   {
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
      Mob = 
      {
         Last = 11694, 
         First = 11650, 
      }, 
   }, 
}
