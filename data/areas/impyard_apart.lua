-- Imperial Shipyard Apartments
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Filename = "impyard_apart.lua", 
   Name = "Imperial Shipyard Apartments", 
   Mobiles = 
   {
      [11694] = 
      {
         Description = "", 
         Name = "Complex Guard", 
         Vnum = 11694, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "a complex guard", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         LongDescr = "A Complex guard watches the streets here.\
", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [1] = "spec_police", 
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
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         DamRoll = 10, 
         HitRoll = 10, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 50, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         ArmorClass = -25, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11690] = 
      {
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
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a food dispensor", 
         }, 
         Description = "", 
         Name = "A food dispensor", 
         Vnum = 11690, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         ShortDescr = "a food dispensor", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A food dispensor sits in the corner here.\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "food ration hungry", 
               MudProgType = "speech_prog", 
               Code = "emote beeps as it processes the request.\
mpoload 24609\
give ration $n\
drop ration \
Say Enjoy.\
", 
            }, 
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
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11650] = 
      {
         Description = "", 
         Name = "Complex Landlord", 
         Vnum = 11650, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "the complex landlord", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "The Complex Landlord works on a mound of paperwork here.\
", 
         DefaultPosition = "standing", 
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
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 11650, 
         Arg3 = 11684, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg1 = 11694, 
         Arg3 = 11684, 
      }, 
      [3] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [4] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg1 = 11694, 
         Arg3 = 11684, 
      }, 
      [5] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [6] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg1 = 32037, 
         Arg3 = 11654, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg1 = 11694, 
         Arg3 = 11654, 
      }, 
      [8] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [9] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg1 = 11654, 
         Arg3 = 0, 
      }, 
      [10] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg1 = 11694, 
         Arg3 = 32035, 
      }, 
      [11] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [12] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg1 = 11694, 
         Arg3 = 32038, 
      }, 
      [13] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [14] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
         Arg1 = 11694, 
         Arg3 = 32036, 
      }, 
      [15] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [16] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 8, 
         Arg1 = 11694, 
         Arg3 = 11671, 
      }, 
      [17] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [18] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg1 = 11671, 
         Arg3 = 0, 
      }, 
      [19] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 9, 
         Arg1 = 11694, 
         Arg3 = 32037, 
      }, 
      [20] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [21] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 11694, 
         Arg3 = 11679, 
      }, 
      [22] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [23] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg1 = 11679, 
         Arg3 = 0, 
      }, 
      [24] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 11694, 
         Arg3 = 11662, 
      }, 
      [25] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [26] = 
      {
         Command = "G", 
         Arg1 = 10313, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Command = "G", 
         Arg1 = 10314, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 11690, 
         Arg3 = 11657, 
      }, 
      [29] = 
      {
         Command = "G", 
         Arg1 = 10313, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Command = "G", 
         Arg1 = 10314, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 20, 
         Arg1 = 5190, 
         Arg3 = 11665, 
      }, 
      [32] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg1 = 11690, 
         Arg3 = 11674, 
      }, 
      [33] = 
      {
         Command = "G", 
         Arg1 = 10313, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Command = "G", 
         Arg1 = 10314, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
   }, 
   Rooms = 
   {
      [11650] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11650, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
            [21] = "EmptyHome", 
            [26] = "Factory", 
            [10] = "Safe", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11651, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               DestinationVnum = 32035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11651] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11651, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11650, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11652] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11652, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [29] = "Spacecraft", 
            [21] = "EmptyHome", 
            [26] = "Factory", 
            [10] = "Safe", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11653, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 32035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11653] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11653, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11652, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
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
         TeleVnum = 0, 
         Vnum = 11654, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Residential North Wing", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = 11691, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 11655, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 32035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11655] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11655, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [21] = "EmptyHome", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11656, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11654, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11657, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11656] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11656, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               DestinationVnum = 11655, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11657] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11657, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11655, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11658] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11658, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [29] = "Spacecraft", 
            [21] = "EmptyHome", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11659, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 32038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11659] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11659, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11658, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11660] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11660, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Apartment 54", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 32038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11661, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11661] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11661, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [21] = "EmptyHome", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11660, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
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
         TeleVnum = 0, 
         Vnum = 11662, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Residential East Wing", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11663, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 32038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11663] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11663, 
         Flags = 
         {
            [10] = "Safe", 
            [20] = "PlayerHome", 
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Grand Ambassador's Office.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11664, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11666, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11665, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11662, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11664] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11664, 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11663, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11665] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11665, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11663, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11666] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11666, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [25] = "Refinery", 
            [26] = "Factory", 
            [19] = "ClanStoreroom", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Workroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11663, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11667] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11667, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Amirt's Abode", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               DestinationVnum = 32036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11668, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11668] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11668, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11667, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11669] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11669, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
            [21] = "EmptyHome", 
            [26] = "Factory", 
            [10] = "Safe", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11670, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               DestinationVnum = 32036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11670] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11670, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11669, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
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
         TeleVnum = 0, 
         Vnum = 11671, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Residential South Wing", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 32036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = 11693, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 11672, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11672] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11672, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11671, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11673, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11674, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11673] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11673, 
         Flags = 
         {
            [23] = "Hotel", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [19] = "ClanStoreroom", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               DestinationVnum = 11672, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11674] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11674, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [19] = "ClanStoreroom", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11672, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11675] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11675, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [21] = "EmptyHome", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               DestinationVnum = 32037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11676, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11676] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11676, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11675, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11677] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11677, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [21] = "EmptyHome", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               DestinationVnum = 32037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11678, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11678] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11678, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11677, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
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
         TeleVnum = 0, 
         Vnum = 11679, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Residental West Wing", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 32037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = 11694, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 11680, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11680] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11680, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Palpatine's Suite", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11682, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11679, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11681, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11683, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11681] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11681, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bedroom", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               DestinationVnum = 11680, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11682] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11682, 
         Flags = 
         {
            [10] = "Safe", 
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11680, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11683] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11683, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [25] = "Refinery", 
            [10] = "Safe", 
            [26] = "Factory", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11680, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11684] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11684, 
         Flags = 
         {
            [14] = "Donation", 
            [29] = "Spacecraft", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Imperial Shipyard Housing", 
         Exits = 
         {
            [1] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 32034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11694] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11694, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Sector = "city", 
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
         High = 0, 
      }, 
   }, 
   Objects = 
   {
      [11650] = 
      {
         ActionDescription = "", 
         Name = "a shuttle", 
         Vnum = 11650, 
         Weight = 1, 
         ShortDescr = "a a shuttle", 
         Description = "A a shuttle is here.", 
         ItemType = "trash", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11651] = 
      {
         ActionDescription = "", 
         Name = "Apartment 51 key", 
         Vnum = 11651, 
         Weight = 1, 
         Description = "An apartment key lies on the ground here.", 
         ShortDescr = "an apartment key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11652] = 
      {
         ActionDescription = "", 
         Name = "Apartment 52 key", 
         Vnum = 11652, 
         Weight = 1, 
         Description = "An apartment key was dropped here.", 
         ShortDescr = "an apartment key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11653] = 
      {
         ActionDescription = "", 
         Name = "Apartment 53 key", 
         Vnum = 11653, 
         Weight = 1, 
         Description = "An apartment key was dropped here.", 
         ShortDescr = "an apartment key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11654] = 
      {
         ActionDescription = "", 
         Name = "Apartment 54 key", 
         Vnum = 11654, 
         Weight = 1, 
         Description = "An apartment key was dropped here.", 
         ShortDescr = "an apartment key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11655] = 
      {
         ActionDescription = "", 
         Name = "Apartment 55 key", 
         Vnum = 11655, 
         Weight = 1, 
         Description = "An apartment key was dropped here.", 
         ShortDescr = "an apartment key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11656] = 
      {
         ActionDescription = "", 
         Name = "Apartment 56 key", 
         Vnum = 11656, 
         Weight = 1, 
         Description = "An apartment key was dropped here.", 
         ShortDescr = "an apartment key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11657] = 
      {
         ActionDescription = "", 
         Name = "Apartment 57 key", 
         Vnum = 11657, 
         Weight = 1, 
         Description = "An apartment key was dropped here.", 
         ShortDescr = "an apartment key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11658] = 
      {
         ActionDescription = "", 
         Name = "Apartment 58 key", 
         Vnum = 11658, 
         Weight = 1, 
         Description = "An apartment key was dropped here.", 
         ShortDescr = "an apartment key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11691] = 
      {
         ActionDescription = "", 
         Name = "Suite key 91", 
         Vnum = 11691, 
         Weight = 1, 
         Description = "A suite key was dropped here.", 
         ShortDescr = "a suite key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11692] = 
      {
         ActionDescription = "", 
         Name = "Suite key 92", 
         Vnum = 11692, 
         Weight = 1, 
         Description = "A suite key was dropped here", 
         ShortDescr = "a suite key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11693] = 
      {
         ActionDescription = "", 
         Name = "Suite key 93", 
         Vnum = 11693, 
         Weight = 1, 
         Description = "A suite key was dropped here.", 
         ShortDescr = "a suite key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11694] = 
      {
         ActionDescription = "", 
         Name = "Suite key 94", 
         Vnum = 11694, 
         Weight = 1, 
         Description = "A suite key was dropped here.", 
         ShortDescr = "a suite key", 
         Layers = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11690] = 
      {
         ActionDescription = "", 
         Name = "A food dispenser", 
         Vnum = 11690, 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a food dispensor", 
         Description = "A food dispensor has been installed on the wall here.", 
         ItemType = "furniture", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
   }, 
   HighEconomy = 0, 
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
   ResetFrequency = 0, 
   ResetMessage = "", 
   FileFormatVersion = 1, 
   LowEconomy = 1003526, 
   Author = "Darrik", 
}
