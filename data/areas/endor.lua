-- Endor
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   Mobiles = 
   {
      [3000] = 
      {
         LongDescr = "An Ewok female is tending to the young here.\
", 
         Position = "standing", 
         Sex = "female", 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Height = 0, 
         Name = "ewok female", 
         ShortDescr = "An ewok female", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 10, 
            HitSizeDice = 4, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Charisma = 0, 
         }, 
         NumberOfAttacks = 0, 
         VipFlags = 
         {
            [11] = "Endor", 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 1, 
            DamSizeDice = 2, 
         }, 
         DamRoll = 0, 
         Race = "Ewok", 
         Weight = 0, 
         ArmorClass = 100, 
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
         Vnum = 3000, 
         Level = 3, 
      }, 
      [3001] = 
      {
         LongDescr = "A Giant Gorax is thundering through the trees.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Credits = 0, 
         HitRoll = 25, 
         Description = "", 
         Height = 0, 
         Name = "gorax ", 
         ShortDescr = "a gorax", 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if race($n) == ewok\
smile\
cack\
'mmmm dinner!\
evil\
mpkill $n\
endif\
", 
               MudProgType = "greet_prog", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 11, 
            HitPlus = 1500, 
            HitSizeDice = 20, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Charisma = 0, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 7, 
            DamSizeDice = 10, 
         }, 
         DamRoll = 20, 
         Race = "Human", 
         Weight = 0, 
         ArmorClass = -120, 
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
         Vnum = 3001, 
         Level = 101, 
      }, 
      [3002] = 
      {
         LongDescr = "A male Ewok is going about his business.\
", 
         Position = "standing", 
         Sex = "male", 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Height = 0, 
         Name = "male ewok", 
         ShortDescr = "an ewok male", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 30, 
            HitSizeDice = 10, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Charisma = 0, 
         }, 
         NumberOfAttacks = 0, 
         VipFlags = 
         {
            [11] = "Endor", 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 0, 
            DamSizeDice = 4, 
         }, 
         DamRoll = 0, 
         Race = "Ewok", 
         Weight = 0, 
         ArmorClass = 92, 
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
         Vnum = 3002, 
         Level = 3, 
      }, 
      [3003] = 
      {
         LongDescr = "An ewok child is playing here.\
", 
         Position = "standing", 
         Sex = "male", 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Height = 0, 
         Name = "ewok child", 
         ShortDescr = "an ewok child", 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 30, 
            HitSizeDice = 1, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Charisma = 0, 
         }, 
         NumberOfAttacks = 1, 
         Damage = 
         {
            DamPlus = 3, 
            DamNoDice = 1, 
            DamSizeDice = 3, 
         }, 
         DamRoll = 0, 
         Race = "Gamorrean", 
         Weight = 0, 
         ArmorClass = 0, 
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
         Vnum = 3003, 
         Level = 1, 
      }, 
      [3004] = 
      {
         LongDescr = "Wicket Leader of the Ewok people stands here spear in hand.\
", 
         Position = "standing", 
         Sex = "male", 
         Credits = 20, 
         HitRoll = 3, 
         Description = "", 
         Height = 0, 
         Name = "Wicket", 
         ShortDescr = "Wicket", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 120, 
            HitSizeDice = 10, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Charisma = 0, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         DamRoll = 5, 
         Race = "Wookiee", 
         Weight = 0, 
         ArmorClass = 70, 
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
         Vnum = 3004, 
         Level = 12, 
      }, 
      [3005] = 
      {
         LongDescr = "An ewok is here, keeping watch over the supplies.\
", 
         Position = "standing", 
         Sex = "female", 
         Credits = 0, 
         HitRoll = 0, 
         Description = "", 
         Height = 0, 
         Name = "supply keeper", 
         ShortDescr = "ewok supply keeper", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Level = 3, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 10, 
            HitSizeDice = 4, 
         }, 
         Stats = 
         {
            Wisdom = 0, 
            Dexterity = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Constitution = 0, 
            Intelligence = 0, 
            Charisma = 0, 
         }, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 1, 
            DamSizeDice = 2, 
         }, 
         DamRoll = 0, 
         Race = "Ewok", 
         Weight = 0, 
         ArmorClass = 100, 
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
         Vnum = 3005, 
         Shop = 
         {
            ProfitBuy = 120, 
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
            KeeperShortDescr = "ewok supply keeper", 
            ProfitSell = 90, 
         }, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 3068, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 3001, 
      }, 
      [2] = 
      {
         Arg3 = 3000, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 3000, 
      }, 
      [3] = 
      {
         Arg3 = 3000, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 3000, 
      }, 
      [4] = 
      {
         Arg3 = 3013, 
         Arg2 = 20, 
         Command = "M", 
         MiscData = 0, 
         Arg1 = 3002, 
      }, 
      [5] = 
      {
         Arg3 = 3013, 
         Arg2 = 20, 
         Command = "M", 
         MiscData = 0, 
         Arg1 = 3000, 
      }, 
      [6] = 
      {
         Arg3 = 3080, 
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 3001, 
      }, 
      [7] = 
      {
         Arg3 = 3072, 
         Arg2 = 3, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 3001, 
      }, 
      [8] = 
      {
         Arg3 = 3059, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 3005, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 3006, 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 3007, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 3008, 
      }, 
      [12] = 
      {
         Arg3 = 3000, 
         Arg2 = 15, 
         Command = "M", 
         MiscData = 0, 
         Arg1 = 3003, 
      }, 
      [13] = 
      {
         Arg3 = 3055, 
         Arg2 = 0, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 3004, 
      }, 
      [14] = 
      {
         Arg3 = 6, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 3000, 
      }, 
      [15] = 
      {
         Arg3 = 16, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 3001, 
      }, 
      [16] = 
      {
         Arg3 = 3, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 3004, 
      }, 
      [17] = 
      {
         Arg3 = 11, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 3005, 
      }, 
      [18] = 
      {
         Arg3 = 14, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 3003, 
      }, 
      [19] = 
      {
         Arg3 = 15, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 3003, 
      }, 
   }, 
   Rooms = 
   {
      [3072] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3073, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3071, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3072, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3073] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3072, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3074, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3073, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3074] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3073, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Historical Funeral Pyre", 
         Vnum = 3074, 
         Flags = 
         {
            [16] = "Silence", 
         }, 
      }, 
      [3075] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3070, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3076, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3075, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3076] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3077, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3075, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3076, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3077] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3078, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3076, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3077, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3078] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3077, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3079, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3078, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3079] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3080, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3078, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3079, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3080] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3079, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3081, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3080, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3081] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3082, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3080, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3081, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3082] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3081, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3083, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3082, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3083] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3084, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3082, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3083, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner. \
", 
      }, 
      [3084] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3083, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3085, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3084, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3085] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3084, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southeast", 
               DestinationVnum = 3086, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3085, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3086] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3087, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 3085, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3086, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3087] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3086, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3088, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3087, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3088] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3089, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3087, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3088, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner. \
", 
      }, 
      [3089] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3088, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3090, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3089, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3090] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3091, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3089, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3090, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3091] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3092, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3090, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3091, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3092] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3091, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3093, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3092, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3093] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3092, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southeast", 
               DestinationVnum = 3094, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3093, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3094] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3095, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 3093, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3094, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3095] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3024, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 3096, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3095, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3096] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3097, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southeast", 
               DestinationVnum = 3095, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3096, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3097] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3098, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3096, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3097, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3098] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3097, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3099, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3098, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3099] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3098, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3070, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Path", 
         Vnum = 3099, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3000] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "40", 
               Code = "mpecho The children scream with excitement.\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Description = "You stand in the middle of a room filled with little ewok children they\
range  in size from very tiny and crawling on fur blankets to the near\
adolecents playing with toy bows arrows and spears. The room is littered\
with an abundant amount of  toys for the children to play with. Its a\
rather room for ewok standards and has been put to use from what you can\
guess to be a very very long time. There are few females here tending to\
the young as well as the cries of the new born infants.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3008, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3006, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3004, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3002, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Ewok Nursery House", 
         Vnum = 3000, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3001] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3008, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3002, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway Around the Nursery", 
         Vnum = 3001, 
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
      }, 
      [3002] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3001, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3000, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3003, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway Around the Nursery", 
         Vnum = 3002, 
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
      }, 
      [3003] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3002, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3004, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway Around the Nursery", 
         Vnum = 3003, 
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
      }, 
      [3004] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3000, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3003, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3005, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway Around the Nursery", 
         Vnum = 3004, 
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
      }, 
      [3005] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3006, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3004, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "southeast", 
               DestinationVnum = 3009, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Walkway Around the Nursery", 
         Vnum = 3005, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3006] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3007, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3005, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3000, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Walkway Around the Nursery", 
         Vnum = 3006, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3007] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3006, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3008, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Walkway Around the Nursery", 
         Vnum = 3007, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3008] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3007, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3000, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3001, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway Around the Nursery", 
         Vnum = 3008, 
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
      }, 
      [3009] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 3005, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southeast", 
               DestinationVnum = 3010, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3009, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3010] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 3009, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southeast", 
               DestinationVnum = 3011, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3010, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3011] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 3010, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southeast", 
               DestinationVnum = 3012, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3011, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3012] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3013, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3019, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 3011, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3012, 
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
      }, 
      [3013] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3014, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3044, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3012, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3013, 
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
      }, 
      [3014] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3015, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3013, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3014, 
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
      }, 
      [3015] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3014, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3016, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3045, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3015, 
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
      }, 
      [3016] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3015, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3017, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3016, 
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
      }, 
      [3017] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3047, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3016, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3020, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3018, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3017, 
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
      }, 
      [3018] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3019, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3017, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3018, 
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
      }, 
      [3019] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3012, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3046, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3018, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3019, 
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
      }, 
      [3020] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3017, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3022, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3020, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3021] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3022, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3024, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3021, 
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
      }, 
      [3022] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3020, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3023, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3048, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3021, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3022, 
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
      }, 
      [3023] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3028, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3022, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3029, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3023, 
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
      }, 
      [3024] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3021, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3059, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3025, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3024, 
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
      }, 
      [3025] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3024, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3026, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3025, 
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
      }, 
      [3026] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3050, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3027, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3025, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3026, 
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
      }, 
      [3027] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3028, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3026, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3027, 
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
      }, 
      [3028] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3023, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3027, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3049, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3028, 
         Description = "The walkway is made from very sturdy planks of wood that seem to\
the forest elements have (and can) throw at it. The ewoks very rarely\
get visitors to their villages, so quite naturaly they are a little\
cautious when it comes to new people here, but they do eventually\
accept your presence and let you in on the village celebrations.\
The walkways are very high up from the ground, this is due to the\
beast is the humanoid behemoth Gorax, who are the main reson for the \
village being so high up in the Endor Trees.\
", 
      }, 
      [3029] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3030, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3023, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3029, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3030] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3031, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3029, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3030, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3031] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3032, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3030, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3031, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3032] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3060, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3033, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3031, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3032, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3033] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3032, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3034, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3033, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3034] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3035, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3033, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3034, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3035] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3036, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3034, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rope Bridge", 
         Vnum = 3035, 
         Description = "The bridge is suppported buy a very sturdy rope that has large \
wooden planks for easy walking and balance. Strangly enough the\
bridge seems to be rather ridged and barely sways under a stronge \
gust of wind. The native ewoks don't even seem to notice any swaying\
at all as some run past you and others just walk past paying no \
attention to your presence.\
", 
      }, 
      [3036] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3037, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3043, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3035, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3036, 
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
      }, 
      [3037] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3038, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3055, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3036, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3037, 
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
      }, 
      [3038] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3039, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3037, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3038, 
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
      }, 
      [3039] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3040, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3052, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3038, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3039, 
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
      }, 
      [3040] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3041, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3039, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3040, 
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
      }, 
      [3041] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3040, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3042, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3053, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3041, 
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
      }, 
      [3042] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3041, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3043, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3042, 
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
      }, 
      [3043] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3054, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3042, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3036, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Walkway", 
         Vnum = 3043, 
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
      }, 
      [3044] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3013, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3044, 
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
      }, 
      [3045] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3015, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3045, 
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
      }, 
      [3046] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3019, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3046, 
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
      }, 
      [3047] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3017, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3047, 
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
      }, 
      [3048] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3022, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3048, 
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
      }, 
      [3049] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3028, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Ewoks Guest House", 
         Vnum = 3049, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
      }, 
      [3050] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3026, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3050, 
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
      }, 
      [3051] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3024, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3051, 
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
      }, 
      [3052] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3039, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3052, 
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
      }, 
      [3053] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3041, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3053, 
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
      }, 
      [3054] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3043, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3054, 
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
      }, 
      [3055] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3037, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Ewok House Hold", 
         Vnum = 3055, 
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
      }, 
      [3056] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ewok House Hold", 
         Vnum = 3056, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3057] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ewok House Hold", 
         Vnum = 3057, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3058] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ewok House Hold", 
         Vnum = 3058, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3059] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3024, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Ewok Food Supplies", 
         Vnum = 3059, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3060] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Strangly enough, even though the ewok people do not get many \
visitors they seemed to have keep the now very old landing area built\
by intergalactic traders in days past, and have kept it in very good \
with a few minor problems though, such as the decorations strune around\
to make the place look pretty but covering some fairly important \
instruments vital to safe landings and such. Other then those few flaws\
the places appears to be in good condition.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3032, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southeast", 
               DestinationVnum = 3061, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Landing Area", 
         Vnum = 3060, 
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
      }, 
      [3061] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3062, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 3060, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Jungle Trail", 
         Vnum = 3061, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3062] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3061, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3063, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3062, 
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3063] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3064, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3062, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3063, 
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3064] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3065, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3063, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3064, 
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3065] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3064, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3066, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3067, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3065, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner. You can also make\
out what looks to be an imperial base to the west.\
", 
      }, 
      [3066] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The base is the main shield generator for the second Death Star orbitting\
the forest moon. Access is blocked by massive blast doors to keep out\
non-authorized personnel.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3065, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Imperial Shield Generator", 
         Vnum = 3066, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [3067] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3068, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3065, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3067, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3068] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 3067, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 3069, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3068, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3069] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 3068, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3070, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3069, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3070] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 3075, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 3071, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 3069, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3099, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3070, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3071] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Sector = "city", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 3070, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 3072, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Jungle Trail", 
         Vnum = 3071, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Objects = 
   {
      [3008] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a small canteen", 
         Description = "A belt sized canteen was dropped here.", 
         Weight = 1, 
         ItemType = "drink_container", 
         Layers = 0, 
         Name = "small canteen", 
         Vnum = 3008, 
         Cost = 10, 
      }, 
      [3000] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Vnum = 3000, 
         Description = "A small hood has been dropped here.", 
         Weight = 1, 
         Layers = 0, 
         ItemType = "armor", 
         Name = "leather hood", 
         ShortDescr = "a leather hood", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
      }, 
      [3001] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 4, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Vnum = 3001, 
         Description = "A spear lies here in the dirt.", 
         Weight = 1, 
         Layers = 0, 
         ItemType = "weapon", 
         Name = "spear", 
         ShortDescr = "a spear", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
      }, 
      [3002] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Vnum = 3002, 
         Description = "A feathered head dress lies here.", 
         Weight = 1, 
         Layers = 0, 
         ItemType = "armor", 
         Name = "feathered head dress", 
         ShortDescr = "feathered head dress", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
      }, 
      [3003] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Vnum = 3003, 
         Description = "A feathered head dress lies here.", 
         Weight = 1, 
         Layers = 0, 
         ItemType = "armor", 
         Name = "leather wrist guards", 
         ShortDescr = "leather wrist guard", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
      }, 
      [3004] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Vnum = 3004, 
         Description = "A small pile of bones lie here.", 
         Weight = 1, 
         Layers = 0, 
         ItemType = "armor", 
         Name = "bone necklace", 
         ShortDescr = "a bone necklace", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
      }, 
      [3005] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Vnum = 3005, 
         Description = "A wooden shield is collecting dust", 
         Weight = 1, 
         Layers = 0, 
         ItemType = "armor", 
         Name = "a wooden shield", 
         ShortDescr = "a wooden shield", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
      }, 
      [3006] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "some dried fruit", 
         Description = "Some dried fruit should last for a long time without going bad.", 
         Weight = 1, 
         ItemType = "food", 
         Layers = 0, 
         Name = "fruit", 
         Vnum = 3006, 
         Cost = 8, 
      }, 
      [3007] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "fresh vegitables", 
         Description = "Some vegitables are attracting flies here.", 
         Weight = 1, 
         ItemType = "food", 
         Layers = 0, 
         Name = "fresh vegitables", 
         Vnum = 3007, 
         Cost = 9, 
      }, 
   }, 
   ResetFrequency = 0, 
   Author = "Thrawn", 
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
   ResetMessage = "You hear the calls of the forest birds being carried through the Forest air.", 
   Filename = "endor.lua", 
   VnumRanges = 
   {
      Object = 
      {
         First = 3000, 
         Last = 3008, 
      }, 
      Room = 
      {
         First = 3000, 
         Last = 3099, 
      }, 
      Mob = 
      {
         First = 3000, 
         Last = 3005, 
      }, 
   }, 
   Name = "Endor", 
   LowEconomy = 31250251, 
   HighEconomy = 0, 
}
