-- Imperial Shipyard Apartments
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   Filename = "impyard_apart.lua", 
   HighEconomy = 0, 
   LowEconomy = 1003526, 
   Mobiles = 
   {
      [11694] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "Complex Guard", 
         Level = 50, 
         ShortDescr = "a complex guard", 
         SpecFuns = 
         {
            [0] = "spec_police", 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Description = "", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 10, 
         ArmorClass = -25, 
         HitRoll = 10, 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Wisdom = 0, 
            Luck = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
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
         LongDescr = "A Complex guard watches the streets here.\
", 
         Vnum = 11694, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [11690] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
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
               MudProgType = "speech_prog", 
               Arguments = "food ration hungry", 
            }, 
         }, 
         Name = "A food dispensor", 
         Level = 1, 
         ShortDescr = "a food dispensor", 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "a food dispensor", 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Description = "", 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Wisdom = 0, 
            Luck = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
         LongDescr = "A food dispensor sits in the corner here.\
", 
         Vnum = 11690, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [11650] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "Complex Landlord", 
         Level = 1, 
         ShortDescr = "the complex landlord", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Description = "", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Charisma = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Wisdom = 0, 
            Luck = 0, 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
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
         LongDescr = "The Complex Landlord works on a mound of paperwork here.\
", 
         Vnum = 11650, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
   }, 
   ResetMessage = "", 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Arg1 = 11650, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11684, 
      }, 
      [2] = 
      {
         Arg2 = 2, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11684, 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [4] = 
      {
         Arg2 = 2, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11684, 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [6] = 
      {
         Arg2 = 2, 
         Arg1 = 32037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11654, 
      }, 
      [7] = 
      {
         Arg2 = 3, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11654, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [9] = 
      {
         Arg2 = 0, 
         Arg1 = 11654, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [10] = 
      {
         Arg2 = 5, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 32035, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [12] = 
      {
         Arg2 = 5, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 32038, 
      }, 
      [13] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [14] = 
      {
         Arg2 = 7, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 32036, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [16] = 
      {
         Arg2 = 8, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11671, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [18] = 
      {
         Arg2 = 2, 
         Arg1 = 11671, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [19] = 
      {
         Arg2 = 9, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 32037, 
      }, 
      [20] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [21] = 
      {
         Arg2 = 10, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11679, 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [23] = 
      {
         Arg2 = 3, 
         Arg1 = 11679, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [24] = 
      {
         Arg2 = 10, 
         Arg1 = 11694, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11662, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         Arg1 = 53, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [26] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         Arg1 = 11690, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11657, 
      }, 
      [29] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Arg2 = 20, 
         Arg1 = 5190, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11665, 
      }, 
      [32] = 
      {
         Arg2 = 5, 
         Arg1 = 11690, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11674, 
      }, 
      [33] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
         MiscData = 1, 
      }, 
   }, 
   Rooms = 
   {
      [11650] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11651, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 32035, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11650, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11651] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11650, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11651, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11652] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11653, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 32035, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11652, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11653] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11652, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11653, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11654] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11655, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 11691, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 32035, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11654, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Residential North Wing", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
      }, 
      [11655] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11656, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11654, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 11657, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11655, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11656] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11655, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11656, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11657] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11655, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11657, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kitchen", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11658] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11659, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 32038, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11658, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11659] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11658, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11659, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "An Empty Apartment", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11660] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 32038, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11661, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11660, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Apartment 54", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11661] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11660, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11661, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11662] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11663, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 32038, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11662, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Residential East Wing", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
      }, 
      [11663] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11664, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11666, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 11665, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 11662, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11663, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11664] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11663, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11664, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11665] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11663, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11665, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kitchen", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11666] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11663, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11666, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [25] = "Refinery", 
            [26] = "Factory", 
            [19] = "ClanStoreroom", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Workroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11667] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 32036, 
               Keyword = "", 
               Direction = "east", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11668, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11667, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11668] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11667, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11668, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11669] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11670, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 32036, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11669, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11670] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11669, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11670, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11671] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 32036, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11672, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 11693, 
               Description = "", 
            }, 
         }, 
         Vnum = 11671, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Residential South Wing", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
      }, 
      [11672] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11671, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11673, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 11674, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11672, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11673] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11672, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11673, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [19] = "ClanStoreroom", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11674] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11672, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11674, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [19] = "ClanStoreroom", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kitchen", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11675] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 32037, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11676, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11675, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11676] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11675, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11676, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11677] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 32037, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11678, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11677, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11678] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11677, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11678, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11679] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 32037, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11680, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 11694, 
               Description = "", 
            }, 
         }, 
         Vnum = 11679, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Residental West Wing", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "The residential level is one of its more pleaseant areas. The halls are\
wide with high ceilings and plush carpets. White glowpanels are spaced\
strategicly around the walls and ceilings giving the halls a sunlit\
apearance. Plants from varios planets are placed throughout the area -\
resting on the floor or hanging from the ceiling. There are many numbered\
doors allong the walls leading you would assume to private appartments.\
", 
      }, 
      [11680] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11682, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 11679, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 11681, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 11683, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11680, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11681] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11680, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11681, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bedroom", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11682] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11680, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11682, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kitchen", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11683] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 11680, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11683, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [26] = "Factory", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Workshop", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11684] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 32034, 
               Keyword = "", 
               Direction = "southeast", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 11684, 
         Tunnel = 0, 
         Flags = 
         {
            [14] = "Donation", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Imperial Shipyard Housing", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [11694] = 
      {
         Exits = 
         {
         }, 
         Vnum = 11694, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
   }, 
   Objects = 
   {
      [11650] = 
      {
         ItemType = "trash", 
         Vnum = 11650, 
         Cost = 0, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "A a shuttle is here.", 
      }, 
      [11651] = 
      {
         ItemType = "key", 
         Vnum = 11651, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "An apartment key lies on the ground here.", 
      }, 
      [11652] = 
      {
         ItemType = "key", 
         Vnum = 11652, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "An apartment key was dropped here.", 
      }, 
      [11653] = 
      {
         ItemType = "key", 
         Vnum = 11653, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "An apartment key was dropped here.", 
      }, 
      [11654] = 
      {
         ItemType = "key", 
         Vnum = 11654, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "An apartment key was dropped here.", 
      }, 
      [11655] = 
      {
         ItemType = "key", 
         Vnum = 11655, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "An apartment key was dropped here.", 
      }, 
      [11656] = 
      {
         ItemType = "key", 
         Vnum = 11656, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "An apartment key was dropped here.", 
      }, 
      [11657] = 
      {
         ItemType = "key", 
         Vnum = 11657, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "An apartment key was dropped here.", 
      }, 
      [11658] = 
      {
         ItemType = "key", 
         Vnum = 11658, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "An apartment key was dropped here.", 
      }, 
      [11691] = 
      {
         ItemType = "key", 
         Vnum = 11691, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "A suite key was dropped here.", 
      }, 
      [11692] = 
      {
         ItemType = "key", 
         Vnum = 11692, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "A suite key was dropped here", 
      }, 
      [11693] = 
      {
         ItemType = "key", 
         Vnum = 11693, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "A suite key was dropped here.", 
      }, 
      [11694] = 
      {
         ItemType = "key", 
         Vnum = 11694, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Weight = 1, 
         Layers = 0, 
         Description = "A suite key was dropped here.", 
      }, 
      [11690] = 
      {
         ItemType = "furniture", 
         Vnum = 11690, 
         Cost = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
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
         Layers = 0, 
         Description = "A food dispensor has been installed on the wall here.", 
      }, 
   }, 
   Author = "Darrik", 
   ResetFrequency = 0, 
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
   VnumRanges = 
   {
      Mob = 
      {
         Last = 11694, 
         First = 11650, 
      }, 
      Object = 
      {
         Last = 11694, 
         First = 11650, 
      }, 
      Room = 
      {
         Last = 11694, 
         First = 11650, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Name = "Imperial Shipyard Apartments", 
}
