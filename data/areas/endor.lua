-- Endor
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Filename = "endor.lua", 
   Name = "Endor", 
   Mobiles = 
   {
      [3000] = 
      {
         Description = "", 
         Name = "ewok female", 
         Vnum = 3000, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "An ewok female", 
         HitChance = 
         {
            HitSizeDice = 4, 
            HitPlus = 10, 
            HitNoDice = 1, 
         }, 
         LongDescr = "An Ewok female is tending to the young here.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [7] = "ewokese", 
            }, 
            Speaks = 
            {
               [7] = "ewokese", 
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
         Race = "Ewok", 
         VipFlags = 
         {
            [11] = "Endor", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 3, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 2, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 100, 
         Sex = "female", 
         Position = "standing", 
      }, 
      [3001] = 
      {
         Description = "", 
         Name = "gorax ", 
         Vnum = 3001, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [12] = "Deadly", 
         }, 
         ShortDescr = "a gorax", 
         HitChance = 
         {
            HitSizeDice = 20, 
            HitPlus = 1500, 
            HitNoDice = 11, 
         }, 
         LongDescr = "A Giant Gorax is thundering through the trees.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "greet_prog", 
               Code = "if race($n) == ewok\
smile\
cack\
'mmmm dinner!\
evil\
mpkill $n\
endif\
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [7] = "ewokese", 
            }, 
            Speaks = 
            {
               [7] = "ewokese", 
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
         DamRoll = 20, 
         HitRoll = 25, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 101, 
         Damage = 
         {
            DamNoDice = 7, 
            DamSizeDice = 10, 
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
         ArmorClass = -120, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [3002] = 
      {
         Description = "", 
         Name = "male ewok", 
         Vnum = 3002, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "an ewok male", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 30, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A male Ewok is going about his business.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [7] = "ewokese", 
            }, 
            Speaks = 
            {
               [7] = "ewokese", 
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
         Race = "Ewok", 
         VipFlags = 
         {
            [11] = "Endor", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 3, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 92, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [3003] = 
      {
         Description = "", 
         Name = "ewok child", 
         Vnum = 3003, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "an ewok child", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30, 
            HitNoDice = 1, 
         }, 
         LongDescr = "An ewok child is playing here.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [7] = "ewokese", 
            }, 
            Speaks = 
            {
               [7] = "ewokese", 
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
         Race = "Gamorrean", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 1, 
         Level = 1, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 3, 
            DamPlus = 3, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 0, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [3004] = 
      {
         Description = "", 
         Name = "Wicket", 
         Vnum = 3004, 
         Weight = 0, 
         Credits = 20, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Wicket", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 120, 
            HitNoDice = 2, 
         }, 
         LongDescr = "Wicket Leader of the Ewok people stands here spear in hand.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [7] = "ewokese", 
            }, 
            Speaks = 
            {
               [7] = "ewokese", 
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
         Race = "Wookiee", 
         DamRoll = 5, 
         HitRoll = 3, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 12, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 70, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [3005] = 
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
            KeeperShortDescr = "ewok supply keeper", 
         }, 
         Description = "", 
         Name = "supply keeper", 
         Vnum = 3005, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "ewok supply keeper", 
         HitChance = 
         {
            HitSizeDice = 4, 
            HitPlus = 10, 
            HitNoDice = 1, 
         }, 
         LongDescr = "An ewok is here, keeping watch over the supplies.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [7] = "ewokese", 
            }, 
            Speaks = 
            {
               [7] = "ewokese", 
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
         Race = "Ewok", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 3, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 2, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 100, 
         Sex = "female", 
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
         Arg1 = 3001, 
         Arg3 = 3068, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3000, 
         Arg3 = 3000, 
      }, 
      [3] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3000, 
         Arg3 = 3000, 
      }, 
      [4] = 
      {
         Command = "M", 
         MiscData = 0, 
         Arg2 = 20, 
         Arg1 = 3002, 
         Arg3 = 3013, 
      }, 
      [5] = 
      {
         Command = "M", 
         MiscData = 0, 
         Arg2 = 20, 
         Arg1 = 3000, 
         Arg3 = 3013, 
      }, 
      [6] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg1 = 3001, 
         Arg3 = 3080, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg1 = 3001, 
         Arg3 = 3072, 
      }, 
      [8] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3005, 
         Arg3 = 3059, 
      }, 
      [9] = 
      {
         Command = "G", 
         Arg1 = 3006, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Command = "G", 
         Arg1 = 3007, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Command = "G", 
         Arg1 = 3008, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Command = "M", 
         MiscData = 0, 
         Arg2 = 15, 
         Arg1 = 3003, 
         Arg3 = 3000, 
      }, 
      [13] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 0, 
         Arg1 = 3004, 
         Arg3 = 3055, 
      }, 
      [14] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3000, 
         Arg3 = 6, 
      }, 
      [15] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3001, 
         Arg3 = 16, 
      }, 
      [16] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3004, 
         Arg3 = 3, 
      }, 
      [17] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3005, 
         Arg3 = 11, 
      }, 
      [18] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3003, 
         Arg3 = 14, 
      }, 
      [19] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3003, 
         Arg3 = 15, 
      }, 
   }, 
   Rooms = 
   {
      [3072] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3072, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3073, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3071, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3073] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3073, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3072, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3074, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3074] = 
      {
         Description = "You stand before a very historical spot. The vegetation has not grown back\
and you can feel a cold creeping darkness running through you veins\
sending shivers up and down your spine. This is the place where Luke\
Skywalker burned the reamins of his fathers body. You can still make out\
the burned ground as well as see melted bits of Vaders body armor\
scattered about. There are no insects here and the sounds of the forest\
does not seem to be able to penetrate the dark aura the funeral pyre\
radiates. The place also seems to cause interference with your comlink,\
strange.\
", 
         TeleVnum = 0, 
         Vnum = 3074, 
         Flags = 
         {
            [16] = "Silence", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Historical Funeral Pyre", 
         Exits = 
         {
            [1] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3073, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3075] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3075, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3070, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3076, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3076] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3076, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3077, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3075, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3077] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3077, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3078, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3076, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3078] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3078, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3077, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3079, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3079] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3079, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3080, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3078, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3080] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3080, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3079, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3081, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3081] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3081, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3082, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3080, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3082] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3082, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3081, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3083, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3083] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner. \
", 
         TeleVnum = 0, 
         Vnum = 3083, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3084, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3082, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3084] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3084, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3083, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3085, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3085] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3085, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3084, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 3086, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3086] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3086, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3087, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 3085, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3087] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3087, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3086, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3088, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3088] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner. \
", 
         TeleVnum = 0, 
         Vnum = 3088, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3089, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3087, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3089] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3089, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3088, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3090, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3090] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3090, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3091, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3089, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3091] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3091, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3092, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3090, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3092] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3092, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3091, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3093, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3093] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3093, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3092, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 3094, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3094] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3094, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3095, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 3093, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3095] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3095, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 3096, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3096] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3096, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3097, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 3095, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3097] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3097, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3098, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3096, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3098] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3098, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3097, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3099, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3099] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3099, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3098, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3070, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3000] = 
      {
         Description = "You stand in the middle of a room filled with little ewok children they\
range  in size from very tiny and crawling on fur blankets to the near\
adolecents playing with toy bows arrows and spears. The room is littered\
with an abundant amount of  toys for the children to play with. Its a\
rather room for ewok standards and has been put to use from what you can\
guess to be a very very long time. There are few females here tending to\
the young as well as the cries of the new born infants.\
", 
         TeleVnum = 0, 
         Vnum = 3000, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "40", 
               MudProgType = "rand_prog", 
               Code = "mpecho The children scream with excitement.\
", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ewok Nursery House", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3002, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3001] = 
      {
         Description = "The walkway is made from some very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of the pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their village, so quite naturaly they are a little \
cautious when it comes to new people here, but they do eventualy \
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
carnivors that inhabit the planet with the ewok people. The most feared\
beast is the humanoid behemoth Gorax, who are the main reason for the \
village being so high off the ground.\
", 
         TeleVnum = 0, 
         Vnum = 3001, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3002, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3002] = 
      {
         Description = "The walkway is made from some very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of the pressure\
get visitors to their village, so quite naturaly they are a little \
cautious when it comes to new people here, but they do eventualy \
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
carnivors that inhabit the planet with the ewok people. The most feared\
beast is the humanoid behemoth Gorax, who are the main reason for the \
village being so high off the ground.\
", 
         TeleVnum = 0, 
         Vnum = 3002, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3000, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3003, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3003] = 
      {
         Description = "The walkway is made from some very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of the pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their village, so quite naturaly they are a little \
cautious when it comes to new people here, but they do eventualy \
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
carnivors that inhabit the planet with the ewok people. The most feared\
beast is the humanoid behemoth Gorax, who are the main reason for the \
village being so high off the ground.\
", 
         TeleVnum = 0, 
         Vnum = 3003, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3002, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3004] = 
      {
         Description = "The walkway is made from some very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of the pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their village, so quite naturaly they are a little \
cautious when it comes to new people here, but they do eventualy \
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
carnivors that inhabit the planet with the ewok people. The most feared\
beast is the humanoid behemoth Gorax, who are the main reason for the \
village being so high off the ground.\
", 
         TeleVnum = 0, 
         Vnum = 3004, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3000, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3003, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3005] = 
      {
         Description = "The walkway is made from some very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of the pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their village, so quite naturaly they are a little \
cautious when it comes to new people here, but they do eventualy \
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
carnivors that inhabit the planet with the ewok people. The most feared\
beast is the humanoid behemoth Gorax, who are the main reason for the \
village being so high off the ground.\
", 
         TeleVnum = 0, 
         Vnum = 3005, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Walkway Around the Nursery", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 3009, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3006] = 
      {
         Description = "The walkway is made from some very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of the pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their village, so quite naturaly they are a little \
cautious when it comes to new people here, but they do eventualy \
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
carnivors that inhabit the planet with the ewok people. The most feared\
beast is the humanoid behemoth Gorax, who are the main reason for the \
village being so high off the ground.\
", 
         TeleVnum = 0, 
         Vnum = 3006, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Walkway Around the Nursery", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3000, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3007] = 
      {
         Description = "The walkway is made from some very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of the pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their village, so quite naturaly they are a little \
cautious when it comes to new people here, but they do eventualy \
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
carnivors that inhabit the planet with the ewok people. The most feared\
village being so high off the ground.\
", 
         TeleVnum = 0, 
         Vnum = 3007, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Walkway Around the Nursery", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3008] = 
      {
         Description = "The walkway is made from some very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of the pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their village, so quite naturaly they are a little \
cautious when it comes to new people here, but they do eventualy \
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
carnivors that inhabit the planet with the ewok people. The most feared\
beast is the humanoid behemoth Gorax, who are the main reason for the \
village being so high off the ground.\
", 
         TeleVnum = 0, 
         Vnum = 3008, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3000, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3009] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3009, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 3005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 3010, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3010] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3010, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 3009, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 3011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3011] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3011, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 3010, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 3012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3012] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3012, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 3011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3013] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3013, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3044, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3014] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3014, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3015] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3015, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3045, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3016] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3016, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3017] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3017, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3047, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3020, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3018, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3018] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3018, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3019] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3019, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3046, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3018, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3020] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3020, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3021] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3021, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3022] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3022, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3020, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3048, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3021, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3023] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3023, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3029, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3024] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3024, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3021, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3059, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3025] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3025, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3026] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3026, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3050, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3027, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3027] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3027, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3028] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3028, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3027, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3049, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3029] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3029, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3030, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3030] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3030, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3031, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3029, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3031] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3031, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3030, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3032] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3032, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3060, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3031, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3033] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3033, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3034] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3034, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3035] = 
      {
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
         TeleVnum = 0, 
         Vnum = 3035, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3036] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3036, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3043, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3037] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3037, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3055, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3038] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3038, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3039, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3039] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3039, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3052, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3040] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3040, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3041, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3039, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3041] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3041, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3042, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3053, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3042] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3042, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3041, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3043, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3043] = 
      {
         Description = "The walkway is made from very sturdy planks of wood that seem to\
be able to withstand alot of weight as well as alot of pressure\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
         TeleVnum = 0, 
         Vnum = 3043, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3054, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3042, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3044] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3044, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3045] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3045, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3046] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3046, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3047] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3047, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3048] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3048, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3049] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3049, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ewoks Guest House", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3050] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3050, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3051] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3051, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3052] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3052, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3039, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3053] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3053, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3041, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3054] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3054, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3043, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3055] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3055, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3056] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3056, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ewok House Hold", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [3057] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3057, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ewok House Hold", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [3058] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3058, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ewok House Hold", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [3059] = 
      {
         Description = "The houses of the ewoks are littered with feathers pieces of leather\
spear and arrow heads as well as shatfs for the weapons. You also \
see the odd insect scurrying around picking up crumbs from the \
morning breakfast and then scampering off into the shadows to eat\
their new found dinner. From the outside you here the cries of the\
birds deep in the forest as well as the territorial disputes between\
rival preditors battling for more territory and mates. The ewoks\
on the other hand sound as though they are planning for the morning\
hunt as well as their everyday chores the do to make their living \
area more sutable for themselves and their young.\
", 
         TeleVnum = 0, 
         Vnum = 3059, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ewok Food Supplies", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3060] = 
      {
         Description = "Strangly enough, even though the ewok people do not get many \
visitors they seemed to have keep the now very old landing area built\
by intergalactic traders in days past, and have kept it in very good \
with a few minor problems though, such as the decorations strune around\
to make the place look pretty but covering some fairly important \
instruments vital to safe landings and such. Other then those few flaws\
the places appears to be in good condition.\
", 
         TeleVnum = 0, 
         Vnum = 3060, 
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Landing Area", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 3061, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3061] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3061, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Jungle Trail", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3062, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 3060, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3062] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3062, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3061, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3063, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3063] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3063, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3064, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3062, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3064] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3064, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3065, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3063, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3065] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner. You can also make\
out what looks to be an imperial base to the west.\
", 
         TeleVnum = 0, 
         Vnum = 3065, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3064, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3066, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3067, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3066] = 
      {
         Description = "The base is the main shield generator for the second Death Star orbitting\
the forest moon. Access is blocked by massive blast doors to keep out\
non-authorized personnel.\
", 
         TeleVnum = 0, 
         Vnum = 3066, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Imperial Shield Generator", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3065, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3067] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3067, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3068, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3065, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3068] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3068, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 3067, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 3069, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3069] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3069, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 3068, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3070, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3070] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3070, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 3075, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 3071, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 3069, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3099, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [3071] = 
      {
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         TeleVnum = 0, 
         Vnum = 3071, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 3070, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 3072, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 2, 
         High = 100, 
      }, 
      Soft = 
      {
         Low = 2, 
         High = 100, 
      }, 
   }, 
   Objects = 
   {
      [3008] = 
      {
         ActionDescription = "", 
         Name = "small canteen", 
         Vnum = 3008, 
         Weight = 1, 
         Description = "A belt sized canteen was dropped here.", 
         ShortDescr = "a small canteen", 
         Layers = 0, 
         ItemType = "drink_container", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
      }, 
      [3000] = 
      {
         ActionDescription = "", 
         Name = "leather hood", 
         Vnum = 3000, 
         Weight = 1, 
         Description = "A small hood has been dropped here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "a leather hood", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [3001] = 
      {
         ActionDescription = "", 
         Name = "spear", 
         Vnum = 3001, 
         Weight = 1, 
         Description = "A spear lies here in the dirt.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "a spear", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 4, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [3002] = 
      {
         ActionDescription = "", 
         Name = "feathered head dress", 
         Vnum = 3002, 
         Weight = 1, 
         Description = "A feathered head dress lies here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "feathered head dress", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [3003] = 
      {
         ActionDescription = "", 
         Name = "leather wrist guards", 
         Vnum = 3003, 
         Weight = 1, 
         Description = "A feathered head dress lies here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "leather wrist guard", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [3004] = 
      {
         ActionDescription = "", 
         Name = "bone necklace", 
         Vnum = 3004, 
         Weight = 1, 
         Description = "A small pile of bones lie here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "a bone necklace", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
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
      [3005] = 
      {
         ActionDescription = "", 
         Name = "a wooden shield", 
         Vnum = 3005, 
         Weight = 1, 
         Description = "A wooden shield is collecting dust", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "a wooden shield", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [3006] = 
      {
         ActionDescription = "", 
         Name = "fruit", 
         Vnum = 3006, 
         Weight = 1, 
         Description = "Some dried fruit should last for a long time without going bad.", 
         ShortDescr = "some dried fruit", 
         Layers = 0, 
         ItemType = "food", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 8, 
      }, 
      [3007] = 
      {
         ActionDescription = "", 
         Name = "fresh vegitables", 
         Vnum = 3007, 
         Weight = 1, 
         Description = "Some vegitables are attracting flies here.", 
         ShortDescr = "fresh vegitables", 
         Layers = 0, 
         ItemType = "food", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 9, 
      }, 
   }, 
   HighEconomy = 0, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 3005, 
         First = 3000, 
      }, 
      Room = 
      {
         Last = 3099, 
         First = 3000, 
      }, 
      Object = 
      {
         Last = 3008, 
         First = 3000, 
      }, 
   }, 
   ResetFrequency = 0, 
   ResetMessage = "You hear the calls of the forest birds being carried through the Forest air.", 
   FileFormatVersion = 1, 
   LowEconomy = 31250251, 
   Author = "Thrawn", 
}
