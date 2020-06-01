-- Endor
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Mobiles = 
   {
      [3000] = 
      {
         Weight = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         HitRoll = 0, 
         ArmorClass = 100, 
         DamRoll = 0, 
         Sex = "female", 
         Race = "Ewok", 
         Damage = 
         {
            DamSizeDice = 2, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         LongDescr = "An Ewok female is tending to the young here.\
", 
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
         Height = 0, 
         Description = "", 
         Level = 3, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
         }, 
         Name = "ewok female", 
         VipFlags = 
         {
            [11] = "Endor", 
         }, 
         NumberOfAttacks = 0, 
         Vnum = 3000, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         HitChance = 
         {
            HitPlus = 10, 
            HitNoDice = 1, 
            HitSizeDice = 4, 
         }, 
         ShortDescr = "An ewok female", 
      }, 
      [3001] = 
      {
         Weight = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [12] = "Deadly", 
         }, 
         HitRoll = 25, 
         ArmorClass = -120, 
         DamRoll = 20, 
         Sex = "undistinguished", 
         Race = "Human", 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 7, 
            DamPlus = 0, 
         }, 
         LongDescr = "A Giant Gorax is thundering through the trees.\
", 
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
         Height = 0, 
         Description = "", 
         Level = 101, 
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
         Position = "standing", 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Name = "gorax ", 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
         }, 
         NumberOfAttacks = 0, 
         Vnum = 3001, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         HitChance = 
         {
            HitPlus = 1500, 
            HitNoDice = 11, 
            HitSizeDice = 20, 
         }, 
         ShortDescr = "a gorax", 
      }, 
      [3002] = 
      {
         Weight = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         HitRoll = 0, 
         ArmorClass = 92, 
         DamRoll = 0, 
         Sex = "male", 
         Race = "Ewok", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 0, 
            DamPlus = 2, 
         }, 
         LongDescr = "A male Ewok is going about his business.\
", 
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
         Height = 0, 
         Description = "", 
         Level = 3, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
         }, 
         Name = "male ewok", 
         VipFlags = 
         {
            [11] = "Endor", 
         }, 
         NumberOfAttacks = 0, 
         Vnum = 3002, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         HitChance = 
         {
            HitPlus = 30, 
            HitNoDice = 0, 
            HitSizeDice = 10, 
         }, 
         ShortDescr = "an ewok male", 
      }, 
      [3003] = 
      {
         Weight = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         HitRoll = 0, 
         ArmorClass = 0, 
         DamRoll = 0, 
         Sex = "male", 
         Race = "Gamorrean", 
         Damage = 
         {
            DamSizeDice = 3, 
            DamNoDice = 1, 
            DamPlus = 3, 
         }, 
         LongDescr = "An ewok child is playing here.\
", 
         Height = 0, 
         Description = "", 
         Level = 1, 
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
         Position = "standing", 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Name = "ewok child", 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
         }, 
         NumberOfAttacks = 1, 
         Vnum = 3003, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         HitChance = 
         {
            HitPlus = 30, 
            HitNoDice = 1, 
            HitSizeDice = 1, 
         }, 
         ShortDescr = "an ewok child", 
      }, 
      [3004] = 
      {
         Weight = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         HitRoll = 3, 
         ArmorClass = 70, 
         DamRoll = 5, 
         Sex = "male", 
         Race = "Wookiee", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         LongDescr = "Wicket Leader of the Ewok people stands here spear in hand.\
", 
         Height = 0, 
         Description = "", 
         Level = 12, 
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
         Position = "standing", 
         Credits = 20, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Name = "Wicket", 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
         }, 
         NumberOfAttacks = 0, 
         Vnum = 3004, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         HitChance = 
         {
            HitPlus = 120, 
            HitNoDice = 2, 
            HitSizeDice = 10, 
         }, 
         ShortDescr = "Wicket", 
      }, 
      [3005] = 
      {
         Weight = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         HitRoll = 0, 
         ArmorClass = 100, 
         DamRoll = 0, 
         Sex = "female", 
         Race = "Ewok", 
         Damage = 
         {
            DamSizeDice = 2, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         LongDescr = "An ewok is here, keeping watch over the supplies.\
", 
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
         }, 
         Height = 0, 
         Description = "", 
         Level = 3, 
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
         Position = "standing", 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Name = "supply keeper", 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "ewok supply keeper", 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
         }, 
         NumberOfAttacks = 0, 
         Vnum = 3005, 
         DefaultPosition = "standing", 
         Alignment = 0, 
         HitChance = 
         {
            HitPlus = 10, 
            HitNoDice = 1, 
            HitSizeDice = 4, 
         }, 
         ShortDescr = "ewok supply keeper", 
      }, 
   }, 
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
   Filename = "endor.lua", 
   Rooms = 
   {
      [3072] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3072, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3073, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3071, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3073] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3073, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3072, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3074, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3074] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [16] = "Silence", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Historical Funeral Pyre", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3074, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3073, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
      }, 
      [3075] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3075, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3070, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3076, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3076] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3076, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3077, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3075, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3077] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3077, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3078, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3076, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3078] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3078, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3077, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3079, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3079] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3079, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3080, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3078, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3080] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3080, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3079, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3081, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3081] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3081, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3082, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3080, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3082] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3082, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3081, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3083, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3083] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3083, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3084, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3082, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner. \
", 
      }, 
      [3084] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3084, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3083, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3085, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3085] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3085, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3084, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 3086, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3086] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3086, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3087, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 3085, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3087] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3087, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3086, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3088, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3088] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3088, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3089, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3087, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner. \
", 
      }, 
      [3089] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3089, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3088, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3090, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3090] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3090, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3091, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3089, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3091] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3091, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3092, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3090, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3092] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3092, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3091, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3093, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3093] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3093, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3092, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 3094, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3094] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3094, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3095, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 3093, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3095] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3095, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3024, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 3096, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3096] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3096, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3097, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 3095, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3097] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3097, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3098, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3096, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3098] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3098, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3097, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3099, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3099] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Path", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3099, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3098, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3070, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3000] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok Nursery House", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3000, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3008, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3006, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3004, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3002, 
               Keyword = "", 
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
         TeleDelay = 0, 
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
      }, 
      [3001] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3001, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3008, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3002, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3002, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3001, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3000, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3003, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3003, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3002, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3004, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3004, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3000, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3003, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3005, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3005, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3006, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3004, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 3009, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
      [3006] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3006, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3007, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3005, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3000, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
      [3007] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3007, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3006, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3008, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
      }, 
      [3008] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway Around the Nursery", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3008, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3007, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3000, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3001, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3009, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 3005, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 3010, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3010, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 3009, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 3011, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3011, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 3010, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 3012, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3012, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3013, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3019, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 3011, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3013, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3014, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3044, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3012, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3014, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3015, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3013, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3015, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3014, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3016, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3045, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3016, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3015, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3017, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3017, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3047, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3016, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3020, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3018, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3018, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3019, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3017, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3019, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3012, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3046, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3018, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3020, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3017, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3022, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3021, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3022, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3024, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3022, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3020, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3023, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3048, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3021, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3023, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3028, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3022, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3029, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3024, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3021, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3059, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3025, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3025, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3024, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3026, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3026, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3050, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3027, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3025, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3027, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3028, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3026, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3028, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3023, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3027, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3049, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3029, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3030, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3023, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3030, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3031, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3029, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3031, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3032, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3030, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3032, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3060, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3033, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3031, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3033, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3032, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3034, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3034, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3035, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3033, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rope Bridge", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3035, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3036, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3034, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3036, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3037, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3043, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3035, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3037, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3038, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3055, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3036, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3038, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3039, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3037, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3039, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3040, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3052, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3038, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3040, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3041, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3039, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3041, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3040, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3042, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3053, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3042, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3041, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3043, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walkway", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3043, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3054, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3042, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3036, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3044, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3013, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3045, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3015, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3046, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3019, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3047, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3017, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3048, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3022, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewoks Guest House", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3049, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3028, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
      [3050] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3050, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3026, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3051, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3024, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3052, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3039, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3053, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3041, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3054, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3043, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3055, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3037, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3056, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
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
      [3057] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3057, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
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
      [3058] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok House Hold", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3058, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
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
      [3059] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ewok Food Supplies", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3059, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3024, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
      [3060] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Landing Area", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3060, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3032, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 3061, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Strangly enough, even though the ewok people do not get many \
visitors they seemed to have keep the now very old landing area built\
by intergalactic traders in days past, and have kept it in very good \
with a few minor problems though, such as the decorations strune around\
to make the place look pretty but covering some fairly important \
instruments vital to safe landings and such. Other then those few flaws\
the places appears to be in good condition.\
", 
      }, 
      [3061] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3061, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3062, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 3060, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3062] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3062, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3061, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3063, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3063] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3063, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3064, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3062, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3064] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3064, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3065, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3063, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't\
been used in avery long time. The Ewoks it seems have developed a new form\
of hunting the doesn't really need them to venture into the jungle to far\
as well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3065] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3065, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3064, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3066, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3067, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Imperial Shield Generator", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3066, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3065, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The base is the main shield generator for the second Death Star orbitting\
the forest moon. Access is blocked by massive blast doors to keep out\
non-authorized personnel.\
", 
      }, 
      [3067] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3067, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3068, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3065, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3068] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3068, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 3067, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 3069, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3069] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3069, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 3068, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3070, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3070] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3070, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 3075, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 3071, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 3069, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3099, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
      [3071] = 
      {
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jungle Trail", 
         TeleVnum = 0, 
         Sector = "city", 
         Vnum = 3071, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 3070, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 3072, 
               Keyword = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The path is over grown with vegitation and looks as though it hasn't been\
used in avery long time. The Ewoks it seems have developed a new form of\
hunting the doesn't really need them to venture into the jungle to far as\
well as the fear of the ravinous jnugle preditors the roam around here\
looking for stray ewoks or anything else in that manner.\
", 
      }, 
   }, 
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
   Name = "Endor", 
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Arg1 = 3001, 
         Arg3 = 3068, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Arg1 = 3000, 
         Arg3 = 3000, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Arg1 = 3000, 
         Arg3 = 3000, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg2 = 20, 
         Arg1 = 3002, 
         Arg3 = 3013, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [5] = 
      {
         Arg2 = 20, 
         Arg1 = 3000, 
         Arg3 = 3013, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [6] = 
      {
         Arg2 = 2, 
         Arg1 = 3001, 
         Arg3 = 3080, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Arg2 = 3, 
         Arg1 = 3001, 
         Arg3 = 3072, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg1 = 3005, 
         Arg3 = 3059, 
         Command = "M", 
         MiscData = 1, 
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
         Arg2 = 15, 
         Arg1 = 3003, 
         Arg3 = 3000, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [13] = 
      {
         Arg2 = 0, 
         Arg1 = 3004, 
         Arg3 = 3055, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Arg1 = 3000, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Arg1 = 3001, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Arg1 = 3004, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Arg1 = 3005, 
         Arg3 = 11, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Arg1 = 3003, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Arg1 = 3003, 
         Arg3 = 15, 
         Command = "E", 
         MiscData = 1, 
      }, 
   }, 
   VnumRanges = 
   {
      Room = 
      {
         Last = 3099, 
         First = 3000, 
      }, 
      Mob = 
      {
         Last = 3005, 
         First = 3000, 
      }, 
      Object = 
      {
         Last = 3008, 
         First = 3000, 
      }, 
   }, 
   LowEconomy = 31250251, 
   Objects = 
   {
      [3008] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "small canteen", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 3008, 
         Description = "A belt sized canteen was dropped here.", 
         ItemType = "drink_container", 
         Layers = 0, 
         ShortDescr = "a small canteen", 
      }, 
      [3000] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "leather hood", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Vnum = 3000, 
         Description = "A small hood has been dropped here.", 
         ItemType = "armor", 
         Layers = 0, 
         ShortDescr = "a leather hood", 
      }, 
      [3001] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 4, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Name = "spear", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 3001, 
         Description = "A spear lies here in the dirt.", 
         ItemType = "weapon", 
         Layers = 0, 
         ShortDescr = "a spear", 
      }, 
      [3002] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "feathered head dress", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Vnum = 3002, 
         Description = "A feathered head dress lies here.", 
         ItemType = "armor", 
         Layers = 0, 
         ShortDescr = "feathered head dress", 
      }, 
      [3003] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "leather wrist guards", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Vnum = 3003, 
         Description = "A feathered head dress lies here.", 
         ItemType = "armor", 
         Layers = 0, 
         ShortDescr = "leather wrist guard", 
      }, 
      [3004] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "bone necklace", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Vnum = 3004, 
         Description = "A small pile of bones lie here.", 
         ItemType = "armor", 
         Layers = 0, 
         ShortDescr = "a bone necklace", 
      }, 
      [3005] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "a wooden shield", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Vnum = 3005, 
         Description = "A wooden shield is collecting dust", 
         ItemType = "armor", 
         Layers = 0, 
         ShortDescr = "a wooden shield", 
      }, 
      [3006] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         Cost = 8, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "fruit", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 3006, 
         Description = "Some dried fruit should last for a long time without going bad.", 
         ItemType = "food", 
         Layers = 0, 
         ShortDescr = "some dried fruit", 
      }, 
      [3007] = 
      {
         Weight = 1, 
         ActionDescription = "", 
         Cost = 9, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "fresh vegitables", 
         ExtraDescriptions = 
         {
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 3007, 
         Description = "Some vegitables are attracting flies here.", 
         ItemType = "food", 
         Layers = 0, 
         ShortDescr = "fresh vegitables", 
      }, 
   }, 
   ResetMessage = "You hear the calls of the forest birds being carried through the Forest air.", 
   Author = "Thrawn", 
}
