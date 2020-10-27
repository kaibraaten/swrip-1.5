-- Mos Espa - Tatooine
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
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
   Filename = "mosespa.lua", 
   ResetMessage = "", 
   VnumRanges = 
   {
      Mob = 
      {
         First = 3300, 
         Last = 3399, 
      }, 
      Object = 
      {
         First = 3300, 
         Last = 3399, 
      }, 
      Room = 
      {
         First = 3300, 
         Last = 3399, 
      }, 
   }, 
   HighEconomy = 0, 
   Mobiles = 
   {
      [3300] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Level = 25, 
         Height = 0, 
         LongDescr = "The Head slave goes about his buisness here.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "The head slave", 
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
         DamRoll = 5, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 37, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 5, 
         Race = "Human", 
         Name = "The Head Slave", 
         Vnum = 3300, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 250, 
            HitNoDice = 5, 
         }, 
      }, 
      [3301] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Level = 50, 
         Height = 0, 
         SpecFuns = 
         {
            [0] = "spec_customs_weapons", 
         }, 
         LongDescr = "A Customs Guard here checks for weapons.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "Customs Guard", 
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
         DamRoll = 10, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = -25, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 10, 
         Race = "Human", 
         Name = "Mos Espa Secruit", 
         Vnum = 3301, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
      }, 
      [3302] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Level = 70, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "say If you see that Thief...well, if you see him it'll be to late.\
", 
            }, 
         }, 
         LongDescr = "Laztech, the Mos Espa Chief of Secruity is standing here\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "The Chief of Secruity", 
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
         DamRoll = 14, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = -75, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 14, 
         Race = "Human", 
         Name = "Laztech, the Mos Espa Chief of Secruity", 
         Vnum = 3302, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 7, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 700, 
            HitNoDice = 14, 
         }, 
      }, 
      [3303] = 
      {
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Level = 75, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "say Be carefull, the slaves don't like outsiders. I'm watching you.\
", 
            }, 
         }, 
         LongDescr = "A Guard Watches over the slaves\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Slave Guard", 
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
         DamRoll = 15, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = -87, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 15, 
         Race = "Human", 
         Name = "A Slave Guard", 
         Vnum = 3303, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 7, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 750, 
            HitNoDice = 15, 
         }, 
      }, 
      [3304] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "yes", 
               Code = "give reciept to $n\
say Good, give this to the head slave.\
. . . and make it quick!\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "hello", 
               Code = "say I gota job for you...interested?\
", 
            }, 
         }, 
         LongDescr = "A Dirty little man is standing here\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "Brezna", 
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
         DamRoll = 0, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Race = "Human", 
         Name = "Brezna", 
         Vnum = 3304, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [3305] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [27] = "NoCorpse", 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Height = 0, 
         ArmorClass = 0, 
         LongDescr = "A Jawa shop keeper is stacking his shelves\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Jawa", 
         Languages = 
         {
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         DamRoll = 0, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Shop = 
         {
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
            ProfitBuy = 120, 
            KeeperShortDescr = "A Jawa", 
         }, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Race = "Jawa", 
         Name = "A Jawa shop keeper", 
         Vnum = 3305, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [3306] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         NumberOfAttacks = 0, 
         Level = 35, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "emote looks at you\
say Get outof here, Now!\
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
         LongDescr = "A disgruntled slave is walking about.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Slave", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 7, 
         Credits = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 12, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 7, 
         Race = "Human", 
         Name = "A Slave", 
         Vnum = 3306, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 3, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 350, 
            HitNoDice = 7, 
         }, 
      }, 
      [3307] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [27] = "NoCorpse", 
         }, 
         NumberOfAttacks = 0, 
         Level = 20, 
         Height = 0, 
         ArmorClass = 50, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "say Welcome to my shop.\
", 
            }, 
         }, 
         LongDescr = "A Weird looking Shopkeeper is selling goods here.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "short A Shopkeeper", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
         }, 
         DamRoll = 4, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Shop = 
         {
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
            ProfitBuy = 120, 
            KeeperShortDescr = "short A Shopkeeper", 
         }, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 4, 
         Race = "Human", 
         Name = "A weird Shopkeeper", 
         Vnum = 3307, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 200, 
            HitNoDice = 4, 
         }, 
      }, 
      [3308] = 
      {
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         NumberOfAttacks = 0, 
         Level = 10, 
         Height = 0, 
         LongDescr = "A Mos Espa citizen walks through the streets\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A citizen", 
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
         DamRoll = 2, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 75, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Race = "Human", 
         Name = "A Mos Espa citizen", 
         Vnum = 3308, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
      }, 
      [3309] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [27] = "NoCorpse", 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "Vile", 
               Code = "mpechoat $n The Bartender Leads you to a special room.\
/\
/d2\
mptransfer $n 3357\
", 
            }, 
         }, 
         LongDescr = "The Bartender is tending his bar.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Bartender", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
               [27] = "binary", 
            }, 
         }, 
         DamRoll = 0, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Shop = 
         {
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
            ProfitBuy = 120, 
            KeeperShortDescr = "A Bartender", 
         }, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Race = "Human", 
         Name = "A Bar tender", 
         Vnum = 3309, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [3310] = 
      {
         Flags = 
         {
            [0] = "Npc", 
            [27] = "NoCorpse", 
            [24] = "NoAssist", 
            [7] = "Wimpy", 
         }, 
         NumberOfAttacks = 0, 
         Level = 7, 
         Height = 0, 
         ArmorClass = 82, 
         LongDescr = "A Jawa Merchant travels the streets.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Jawa", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         DamRoll = 1, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Shop = 
         {
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
            ProfitBuy = 120, 
            KeeperShortDescr = "A Jawa", 
         }, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 1, 
         Race = "Human", 
         Name = "A Jawa merchant", 
         Vnum = 3310, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 70, 
            HitNoDice = 1, 
         }, 
      }, 
      [3311] = 
      {
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         NumberOfAttacks = 0, 
         Level = 15, 
         Height = 0, 
         LongDescr = "A Jawa wonders the streets.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Jawa", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         DamRoll = 3, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 62, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 3, 
         Race = "Human", 
         Name = "A Jawa", 
         Vnum = 3311, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 150, 
            HitNoDice = 3, 
         }, 
      }, 
      [3312] = 
      {
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [6] = "StayArea", 
            [27] = "NoCorpse", 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "gives", 
               Code = "if ovnuminv(3300) >=1\
say You did all right kid.\
mpwithdraw 2500 credits $n\
mpgain $n 4 100000\
mpat 3312 drop all\
mpat 3312 mppurge\
endif\
", 
            }, 
         }, 
         LongDescr = "A Dealer is here waiting for his runner.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Dealer", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [24] = "quarrenese", 
               [14] = "gamorrese", 
               [9] = "antarian", 
            }, 
         }, 
         DamRoll = 0, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Race = "Human", 
         Name = "A Dealer", 
         Vnum = 3312, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [3313] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         NumberOfAttacks = 0, 
         Level = 10, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "murder $n\
kill $n\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "emote looks at you\
say Get out of here, Now!\
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
         LongDescr = "A disgruntled slave is walking about.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Slave", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 2, 
         Credits = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 75, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 2, 
         Race = "Human", 
         Name = "A Slave", 
         Vnum = 3313, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
      }, 
      [3314] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Level = 25, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "gives", 
               Code = "if ovnuminv(3301) >=1\
say Here give this to the dealer, he's got the stuff.\
give 3300 to $n\
mpat 3314 drop all\
mpat 3314 mppurge\
endif\
", 
            }, 
         }, 
         LongDescr = "The Head slave goes about his buisness here.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "The head slave", 
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
         DamRoll = 0, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 37, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Race = "Human", 
         Name = "The Head Slave", 
         Vnum = 3314, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 250, 
            HitNoDice = 5, 
         }, 
      }, 
      [3315] = 
      {
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         NumberOfAttacks = 0, 
         Level = 10, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "murder $n\
kill $n\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "emote looks at you\
say Get out of here..Now!\
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
         LongDescr = "A disgruntled slave is walking about.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Slave", 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Credits = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 75, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Race = "Human", 
         Name = "A Slave", 
         Vnum = 3315, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
      }, 
      [3316] = 
      {
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         NumberOfAttacks = 0, 
         Level = 5, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "say Die!!\
muhahaha\
", 
            }, 
         }, 
         LongDescr = "A Crazed slave is on a rampage here.\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Slave", 
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
         DamRoll = 1, 
         Credits = 5, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         ArmorClass = 87, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 1, 
         Race = "Human", 
         Name = "A Crazed Slave", 
         Vnum = 3316, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 50, 
            HitNoDice = 1, 
         }, 
      }, 
      [3317] = 
      {
         Flags = 
         {
            [0] = "Npc", 
            [27] = "NoCorpse", 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Height = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "Trade", 
               Code = "mpechoat $n The Bartender leads you to a secret room\
 \
mptransfer $n 3361\
", 
            }, 
         }, 
         LongDescr = "The Back Room Bartender is here \
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "The Bartender", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
               [14] = "gamorrese", 
               [20] = "verpine", 
            }, 
         }, 
         DamRoll = 0, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Shop = 
         {
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
            ProfitBuy = 120, 
            KeeperShortDescr = "The Bartender", 
         }, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         Race = "Human", 
         Name = "The Back Room Bar Tende", 
         Vnum = 3317, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [3318] = 
      {
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Level = 100, 
         Height = 0, 
         ArmorClass = -150, 
         LongDescr = "A Weapons Dealer Is Here To Assist You\
", 
         Stats = 
         {
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
         }, 
         Alignment = 0, 
         ShortDescr = "A Weapons dealer", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
            }, 
         }, 
         DamRoll = 20, 
         Credits = 0, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Shop = 
         {
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
            ProfitBuy = 120, 
            KeeperShortDescr = "A Weapons dealer", 
         }, 
         Description = "", 
         DefaultPosition = "standing", 
         HitRoll = 20, 
         Race = "Human", 
         Name = "A Weapons Dealer", 
         Vnum = 3318, 
         Sex = "undistinguished", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 20, 
         }, 
      }, 
   }, 
   Rooms = 
   {
      [3328] = 
      {
         Description = "The busy activity of the market place is amazing.  The desert lies in all\
directions from you.  The noise of the spaceport can be heard faintly. \
The Jawa's ride through here with all of their new found machinery and\
droid parts.  The heat of  Tatooine is making you go crazy.   the streets\
here are full of rocks and small animals.  You also notice that the dirt\
here is slight discolored then the rest of the market place.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3328, 
         Sector = "city", 
         Name = "The Mos Espa Market Place", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3327, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3334, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3329] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is where you can access the different Mini Complexes. The turbo lift\
is well kept compared to the actual living quarters. The walls are made\
out of some sort of metal covered in a thick coat of paint. There is only\
light but it reflects against the walls, which illuminates the entire lift\
perfectly. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3329, 
         Sector = "city", 
         Name = "Turbo Lift", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3330, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3336, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3308, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3330] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This hallway leads in many differnt directions to their respective\
chambers.  The room feels cold, and not welcoming.  The walls and floors\
are made from raw metal and it shows.  their are several scratching along\
the walls from people dragging equipment around. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3330, 
         Sector = "city", 
         Name = "Complex 2", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3329, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3333, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3331, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3331] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "Here the head slave can relax and bask in the comfort of his private room.\
This room is more sanitary and better equiped with furnishings.  The walls\
have fresh coats of paint and the floors have fresh carpets.   Here is\
where the \"privlages\" of being the head slave kick in.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3331, 
         Sector = "city", 
         Name = "Head Slaves quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3330, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3332] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3332, 
         Sector = "city", 
         Name = "Children's quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3330, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3333] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is where all the female slave live.  It comes equiped with a bathroom\
and Kitchen.  The floors, walls and the room in generale is very femine\
looking. They are all busy at work, but you can't see what they are\
working on. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3333, 
         Sector = "city", 
         Name = "Female's quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3330, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3334] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This shop is owned and operated by the local band of Jawa's.  They sell\
merchandise that is found, scavenged and pre-owned.  You see the shelves\
well stock with both useless items, and items that are in great need to\
many.  The shop seems to be well maintained, and fairly clean.  You notice\
several foot stools and foot ladders around the shop.  As you look out the\
window you see a swoop bike race by.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3334, 
         Sector = "city", 
         Name = "Electronics Shop", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3328, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3335] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This little shop is covered with gadgets and supplies, for both long and\
short journeys. The walls are stacked nice and neatly, the floor is f \
some sort of tile, and looks freshly moped and waxed.  The door is heavy\
because of the crime in this area. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3335, 
         Sector = "city", 
         Name = "A Supply Shop", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3314, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3336] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is where you can access the different Mini Complexes. The turbo lift\
is well kept compared to the actual living quarters. The walls are made\
out of some sort of metal covered in a thick coat of paint. There is only\
light but it reflects against the walls, which illuminates the entire lift\
perfectly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3336, 
         Sector = "city", 
         Name = "Turbo Lift", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3337, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3329, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3337] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This hallway leads in many differnt directions to their respective\
chambers.  The room feels cold, and not welcoming.  The walls and floors\
are made from raw metal and it shows.  their are several scratching along\
the walls from people dragging equipment around. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3337, 
         Sector = "city", 
         Name = "Complex 3", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3336, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3339, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3338, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3338] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is the head slaves private room.  It has nice red carpets, clean white\
walls, and clean white ceiling.  There are several painting on the wall,\
aswell as a old clock and small statutes of his owners. The cooling system\
in this room is superb, it always stays and the perfect temperature.  You\
even wish that your own place was as nice as this.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3338, 
         Sector = "city", 
         Name = "Head Slaves Quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3337, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3339] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is where all the female slave live.  It comes equiped with a bathroom\
and Kitchen.  The floors, walls and the room in generale is very femine\
looking. They are all busy at work, but you can't see what they are\
working on. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3339, 
         Sector = "city", 
         Name = "Femal slave's quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3337, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3340] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3340, 
         Sector = "city", 
         Name = "Children's quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3337, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3341] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This is where you can access the different Mini Complexes. The turbo lift\
is well kept compared to the actual living quarters. The walls are made\
out of some sort of metal covered in a thick coat of paint. There is only\
light but it reflects against the walls, which illuminates the entire lift\
perfectly. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3341, 
         Sector = "city", 
         Name = "Turbo Lift", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3342, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3307, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3342] = 
      {
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Description = "This is where the slaves go if they have lashed out for any reason. It is\
dark, cold and very dangerous. The walls are made of some sort of stone,\
which is covered in a moss of some sort. You can hear little insects\
making noises and crawling around. The smell is unbearable.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3342, 
         Sector = "city", 
         Name = "The Dungeon", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3341, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3343, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3345, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 3344, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3343] = 
      {
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Description = "This is where the slaves go if they have lashed out for any reason. It is\
dark, cold and very dangerous. The walls are made of some sort of stone,\
which is covered in a moss of some sort. You can hear little insects\
making noises and crawling around. The smell is unbearable.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3343, 
         Sector = "city", 
         Name = "The Dungeon", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3342, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3344] = 
      {
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Description = "This is where the slaves go if they have lashed out for any reason. It is\
dark, cold and very dangerous. The walls are made of some sort of stone,\
which is covered in a moss of some sort. You can hear little insects\
making noises and crawling around. The smell is unbearable.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3344, 
         Sector = "city", 
         Name = "The Dungeon", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3342, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3345] = 
      {
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Description = "This is where the slaves go if they have lashed out for any reason. It is\
dark, cold and very dangerous. The walls are made of some sort of stone,\
which is covered in a moss of some sort. You can hear little insects\
making noises and crawling around. The smell is unbearable.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3345, 
         Sector = "city", 
         Name = "The Dungeon", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3342, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3346] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "This speeder is your average tatooine sppeder.  It can go long distances on\
average speeds.  The armor is typical but weapons are nothing to be\
desired. There is room in here for at least two people, not matter how\
tight. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3346, 
         Sector = "city", 
         Name = "Me001", 
         Exits = 
         {
         }, 
      }, 
      [3347] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "This speeder is your average tatooine speeder.  It can go long distances at\
a average speed.  The armor is Typical but weapons are nothing to be\
desired. At least two people can fit into the speeder.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3347, 
         Sector = "city", 
         Name = "ME002", 
         Exits = 
         {
         }, 
      }, 
      [3348] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "This speeder is your average tatooine speeder.  It can go long distances at\
a average speed.  The armor is Typical but weapons are nothing to be\
desired. At least two people can fit into the speeder.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3348, 
         Sector = "city", 
         Name = "ME003", 
         Exits = 
         {
         }, 
      }, 
      [3349] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is a very nice hallway.  It has the finest materials from all over the\
galaxy.  It is well lit and you notice the fine art on the wall.  What a\
change from the entrance. The hallway here seems much cooler and much more\
relaxed.  The air isn't tense in here at all, hardly anyone passes through\
here in the course of the day.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3349, 
         Sector = "city", 
         Name = "A Cantina Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3350, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3318, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3350] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "The elegance of this hallway continues to impress you.  Everything to the\
smallest detail is a enjoyment for your eyes. It continues all the way up\
to that large door.  This section of the hallway is even cooler then the\
last.  You feel as if you are getting farther away from the two large suns\
of the planet, if that's even possible.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3350, 
         Sector = "city", 
         Name = "A Cantina hallway", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 3352, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = 3300, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3349, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3351] = 
      {
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Description = "This dark and dirty tunnel has been here for some time.  It looks like it\
is well traversed.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3351, 
         Sector = "underground", 
         Name = "A Dirt Tunnel", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3353, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3352, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3352] = 
      {
         Description = "After you passed the large door you are confronted by this passage way. \
Should you go in, or should you go back.  Well if you used the key to get\
in, might as well see what all the fuss is about.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3352, 
         Sector = "city", 
         Name = "The Entrance Way", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 3350, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = 3300, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3351, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3353] = 
      {
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3353, 
         Sector = "underground", 
         Name = "Tunnel", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3351, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3354, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3354] = 
      {
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3354, 
         Sector = "underground", 
         Name = "A tunnel", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3353, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3355, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3355] = 
      {
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3355, 
         Sector = "underground", 
         Name = "Tunnel", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3354, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3356, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3356] = 
      {
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3356, 
         Sector = "underground", 
         Name = "Tunnel", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3355, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3324, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3357] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is a rather large attachment to the orignal cantina.  It is well\
lighted and has a very warm feeling to it.  The enite back room facility\
is made of a shiny metalic material.  The air has a sweet smell to it and\
is pleasing to your senses. Here is to be said the true customers come to\
buy their drinks.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3357, 
         Sector = "city", 
         Name = "The Back Room Bar.", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3360, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3358, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3359, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3358] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This booth is cold, and the air is thick.  This booth hasn't been modified\
at all, it was installed to please those who wish to have no luxuries.\
There is nothing but the cold metal walls, the lamp hanging from the\
ceiling, and a couple of metal stools. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3358, 
         Sector = "city", 
         Name = "A Back Room Booth", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3357, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3359] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This booth has had the most changes made to it.  It has a lovely table in\
center of it, perfect for dinning.  The walls are made of a stone found\
only on the forest planet of Endor. The carpets are authentic Ewok fur\
dyed snow white. The lighting is very soft and gentle to the eyes.  The\
heating in this room can be changed via a hardly notciable control panel\
besdie the door.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3359, 
         Sector = "city", 
         Name = "A Back Room Booth", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3357, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3360] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "In this booth faint, pleasing music is being played.  The walls are coverd\
with decorative art and paintings. The floors have been changed and thick\
red carpet installed.  The smell is of a lovely woman's perfume. The\
lighting is dim, but can be changed with a control switch next to the\
doorway.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3360, 
         Sector = "city", 
         Name = "A Back Room Booth", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3357, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3361] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This room is for the true customers of the cantina.  It's a small hardly\
detectable room. The shelves are made of a shiny metalic material.  They\
are attached to a large black wall at the back of the room.  To the side\
of the shelves you notcie a small flashing control panel.  The panel\
controls the energy shield around the Illegal hardware that the customers\
come here to buy.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3361, 
         Sector = "city", 
         Name = "Illegal Hardware Storage.", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3320, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3362] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This Hallyway is poorly lite and the temperature is hot. There is no\
windows or any outside light. You can smell the odour of a rather large\
animal.  The walls and floors are the same as in the complex lobby. Sandy\
colored and made of durasteel. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3362, 
         Sector = "city", 
         Name = "Complex Hall Way", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3317, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3364, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3365, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 3363, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3363] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3363, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3362, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3364] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3364, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3362, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3365] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is the end of the hallway. It is exellently lite and is a comfrtable\
temperature. Considering the temperatures have been different in each\
section of the hall, you wonder how safe this place really is.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3365, 
         Sector = "city", 
         Name = "A Complex Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3362, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3366, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3367, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3366] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3366, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3365, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3367] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3367, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3365, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3368] = 
      {
         Description = "This is the hallway that leads to the cantinas booths.  The lighting is\
cool and refreshing.  The air is typical for a Tatooine cantina, and you\
smell the traces of smoke. The walls are clean and shiny.  This section of\
the cantina appears to be very well kept.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3368, 
         Sector = "city", 
         Name = "A Cantina Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3369, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3318, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3370, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3369] = 
      {
         Description = "This booth is small and cold.  It is designed for 2 people.  The  music\
netwrok speakers were blasted aprt and are no longer functioning.  The\
floors are dirty and the walls are stained with a red liquid. The light is\
dim and the air is very dirty. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3369, 
         Sector = "city", 
         Name = "A Small booth", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3368, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3370] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is a rather large and comfortable booth.  The walls are covered with\
pictures of famous people who have visited here. The floor is soft and a\
little damp.  The light is bright and clear.  The music in the background\
is a little annoying.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3370, 
         Sector = "city", 
         Name = "A Large booth", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3368, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3399] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3399, 
         Sector = "inside", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
      }, 
      [3300] = 
      {
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "25", 
               Code = "mpecho You hear a freighter taking off.\
", 
            }, 
         }, 
         Description = "The Mos Espa landing facility is state of the art.  You notice many\
security guards and security cameras installed in many different locations\
with in the bay.  You can hear the clatter of tools as a mechanic fixes a\
small ship just a head of you. The air is clear and purified in the\
landing bay, all though some sand and dust makes it in. Every so often a\
alien voice comes on the comlink's public network and lists the current\
departures and arrivals. The sounds of space craft landing and taking off\
makes you a little nervous.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3300, 
         Sector = "city", 
         Name = "Mos Espa Space Port", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3301, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3301] = 
      {
         Description = "This is the main terminal of the Mos Espa landing facility.  Here is where\
you can legally purchase tickets from offworld transports and cargo ships.\
The room is quiet, except for the traffic of people walking to and from\
the landing facility. You get the notion that not many people \"legally\"\
purchase tickets. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3301, 
         Sector = "city", 
         Name = "Walkway To Mos Espa", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3302, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3300, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 31570, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3302] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "This is the Security check point for Mos Espa.  It has a large gate in\
front of it, and a rather vicious looking animal chained to it. The two\
security guards here are trained in the latest weapon skills and\
techniques. Just off to the side you notice a large chute, which is used\
to drop the illegal weapons found on the people entering or leaving the\
city.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3302, 
         Sector = "city", 
         Name = "Customs Checkpoint", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3303, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3301, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3303] = 
      {
         Description = "After a long trek, you finally reach the city that everyone has been\
talking about, but somehow it doesn't seem all that great. Mos Espa looks\
very dirty; people shouting in languages that seems undecipherable, and\
very hideous creatures walk about, mouths covered in blood. It'd be best\
to walk fast and watch your back.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3303, 
         Sector = "city", 
         Name = "Mos Espa", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3313, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3302, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3304, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3304] = 
      {
         Description = "This walkway is quite short, but for the slaves at the end of the walway,\
it's Kilometers long.  They walk back and forth each day, only to do what\
ever their master orders. As you look at the ground it's very grungy and\
not very clean.  There is also a terrible smell that makes you gag.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3304, 
         Sector = "city", 
         Name = "Walkway to the Slave Quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3303, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3305, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3305] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "This is where the Slaves Live.  They live in their family \"Units' as their\
called.  The mood is very depresing You can almost hear a constant groan\
coming from deep within.  The sun's light barely makes it in here, it is\
all man made and very dim.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3305, 
         Sector = "city", 
         Name = "Slave Quarters Entrance", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3304, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3306, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3306] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "Here is where all the groups of slaves can meet on their way to work.  Each\
group has it's own mini complex, and each mini complex is owned by a\
differnt lord . Each lord is responsible for the upkeep of the facility\
there slaves live in, which is not too fantastic.  There living quarters\
are usually poor and small.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3306, 
         Sector = "city", 
         Name = "Slave Corridor", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3305, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3307, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3307] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is where you can access the different Mini Complexes. The turbo lift\
is well kept compared to the actual living quarters. The walls are made\
out of some sort of metal covered in a thick coat of paint. There is only\
light but it reflects against the walls, which illuminates the entire lift\
perfectly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3307, 
         Sector = "city", 
         Name = "Turbo Lift", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3306, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3308, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3341, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3308] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This is where you can access the different Mini Complexes. The turbo lift\
is well kept compared to the actual living quarters. The walls are made\
out of some sort of metal covered in a thick coat of paint. There is only\
light but it reflects against the walls, which illuminates the entire lift\
perfectly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3308, 
         Sector = "city", 
         Name = "Turbo Lift", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3309, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3329, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3307, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3309] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This hallway leads in many differnt directions to their respective\
chambers.  The room feels cold, and not welcoming.  The walls and floors\
are made from raw metal and it shows.  their are several scratching along\
the walls from people dragging equipment around. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3309, 
         Sector = "city", 
         Name = "Complex 1", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3308, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3312, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3310, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3310] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "Here the head slave can relax and bask in the comfort of his private room.\
This room is more sanitary and better equiped with furnishings.  The walls\
have fresh coats of paint and the floors have fresh carpets.   Here is\
where the \"privlages\" of being the head slave kick in.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3310, 
         Sector = "city", 
         Name = "Head Slave's Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3309, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3311] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3311, 
         Sector = "city", 
         Name = "Childrens Room", 
         Exits = 
         {
         }, 
      }, 
      [3312] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is where all the female slave live.  It comes equiped with a bathroom\
and Kitchen.  The floors, walls and the room in generale is very femine\
looking. They are all busy at work, but you can't see what they are\
working on. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3312, 
         Sector = "city", 
         Name = "Female slave quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3309, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3313] = 
      {
         Description = "As you walk in this vast market place you notice all sorts of shops and\
booths, with people behind them trying to sell you everything from\
clothing to food. As you walk by one booth you smell a foul stench of\
something terrible being cooked. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3313, 
         Sector = "city", 
         Name = "The Mos Espa Market Place", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3314, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3303, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3314] = 
      {
         Description = "This is a fairly busy market, you see all kinds of races, and creatures,\
the Jawa's are trying to pawn a broken droid to you, you dismiss their\
attempts to communicate. The Sand here is worn away and it's a hard type\
of dirt, almost like dried clay. The wind here is stopped by giant shields\
that protect the town from sand storms at night. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3314, 
         Sector = "city", 
         Name = "The Mos Espa Market Place", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3335, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3315, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3313, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3315] = 
      {
         Description = "This is the busiest intersection of Mos Espa.  People coming and going from\
the market place, jawa's trying to pawn their goods on offworlder's and\
speeders carrying large freights of cargo. The cantina entrance shoots\
cold air out from it when the door is opened.  There is a droid wait\
station right outside the cantina, it's there to let the owners come back\
for them when they are done inside the cantina.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3315, 
         Sector = "city", 
         Name = "The Mos Espa Market Place", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3316, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3325, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3327, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 3314, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3316] = 
      {
         Flags = 
         {
            [6] = "NoDrive", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This is a sorry Excuse for a Cantina, and you thaught Mos Eisley was bad.\
The walls are dirty, the floor are dirty.  Your boots become sticky apon\
entering this fine establishment.  You wonder if the drinks here are any\
good. You cen deinatley smell a strange odour coming from the north.  The\
smell is over wellming. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3316, 
         Sector = "city", 
         Name = "A Dirty Cantina", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3318, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3315, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3317, 
               Direction = "northwest", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3317] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "This is a very clean apartment complex.  It has sandy colored walls and the\
floors are made of durasteel. The room is fairly lite and the atmosphere\
is cold. There is a slight breeze coming in from a vent near the bottom of\
the wall. This would be a exellent place to purchase a home.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3317, 
         Sector = "city", 
         Name = "The Complex", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3320, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3362, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3316, 
               Direction = "southeast", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3318] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "Here the bartender is serving the drinks.  As you look at the counter you\
can see the scorches of blaster fire, but the counter looks to be solid.\
The floors and walls are pretty dirty, and the light shades are equally\
disgusting.   The people are pushing and shoving as they go about there\
business. the feeling in this room is tense, and the temperature is very\
hot.  \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3318, 
         Sector = "city", 
         Name = "The Bar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3368, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3322, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3316, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 3349, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3319] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3319, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3320, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3320] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Description = "These apartments are reserved for the very privilaged.  They are so\
exclusive that most people don't have enough credits to pay for them. The\
walls on this end are made of a special type of metal only found on a\
secret moon.  The lights are shiped in from Endor and the floors are made\
of Wampa fur. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3320, 
         Sector = "city", 
         Name = "Complex Hall Way", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3319, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3317, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3321, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3321] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3321, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3320, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3322] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This hallway seems to be cleaner then the other ones.  Maybe it's because\
the janito just finished cleaning this one before he got blasted by a\
street thug for his broom. The walls are clean and shiny, and the light is\
bright and clear.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3322, 
         Sector = "city", 
         Name = "A Cantina Hallway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3323, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3318, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3323] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This booth is rather clean.  It says private, and reserved on it.  This\
must be a regulars spot.  You notice that it may have secret compartments\
hidden in it.  The booth is also mounted with a holocam, which is\
broadcast to a unknown destination. Better be carefull\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3323, 
         Sector = "city", 
         Name = "A Rather Clean Booth", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3322, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3324] = 
      {
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Description = "A Very dark place this is, you think to your self what would possibly be\
sotred in here. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3324, 
         Sector = "city", 
         Name = "A Dark Storage Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3356, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 3325, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Key = 3300, 
               Description = "", 
            }, 
         }, 
      }, 
      [3325] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [6] = "NoDrive", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This Small hut is paid for, and maintained by the Tatooine government. \
It's clean and realitvley safe, more then you can say about the rest of\
Mos Espa. You can quit and re-ent ther game form here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3325, 
         Sector = "city", 
         Name = "A Small Hut", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3315, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3326] = 
      {
         Flags = 
         {
            [6] = "NoDrive", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This is a fine place to purchase speeders. The room is very large and has\
lots os speeders and swoop bikes in it. The room is well lite and the air\
is nice to your senses. This is a very comfortable place.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3326, 
         Sector = "city", 
         Name = "Speeder Sales and Delivery", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3327, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
      [3327] = 
      {
         Description = "This is a section in the Market that has the most land speeder traffic. \
You notice the Jawa's salvaging parts of speeder that have fallen off, and\
even a entire speeder that was broke down.  The noise of the distant\
spaceport can be heard.  The smell of the market place fills your nose\
with the most delightfull smell and you wish that you could spend all day\
here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Vnum = 3327, 
         Sector = "city", 
         Name = "The Mos Espa Market Place", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 3315, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 3326, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 3328, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
      }, 
   }, 
   Objects = 
   {
      [3300] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "key", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
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
         ActionDescription = "", 
         Name = "Locker key", 
         Vnum = 3300, 
         Description = "A Strange looking key is lying here", 
         Layers = 0, 
         ShortDescr = "A Storage locker's key", 
      }, 
      [3301] = 
      {
         Cost = 0, 
         Description = "A receipt lies here", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
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
         ItemType = "container", 
         Name = "A Reciept eq3301", 
         Vnum = 3301, 
         ActionDescription = "", 
         Layers = 0, 
         ShortDescr = "A receipt", 
      }, 
      [3302] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "drink_container", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Brewed on Cloud City, this dark ale packs a nice punch with age. Stored in\
\13Harloch's fermintation lab, this brew of Bespin Port has been settling for\
\13nearly two decades. Found in almost every Cantina throughout the galaxy,\
\13Bespin Port is a favorite among most. The taste seems a bit stale though,\
\13and you wonder if Harloch's fermintation lab is clean..\
\13", 
               Keyword = "Vintage Bespin Port", 
            }, 
         }, 
         Cost = 675, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 4, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         ActionDescription = "", 
         Name = "A glass of Mos Espa street brew", 
         Vnum = 3302, 
         Description = "A glass of Mos Espa brew", 
         Layers = 0, 
         ShortDescr = "A Glass of Mos Espa Brew", 
      }, 
      [3303] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "trash", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
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
         ActionDescription = "", 
         Name = "Jawa droid fluid", 
         Vnum = 3303, 
         Description = "A Jawa droid fluid is here.", 
         Layers = 0, 
         ShortDescr = "A Vile of Jawa Droid Fluid", 
      }, 
      [3304] = 
      {
         Flags = 
         {
            [1] = "Hum", 
            [13] = "Inventory", 
         }, 
         ItemType = "drink_container", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A mix of ale, cheap whiskey and beer would seem like a pretty odd drink.\
\13The Flaming Hurricane isn't that..it's more. On a small habitable planet,\
\13in a Cantina with a name well-forgotten, an insane man by the name of Naz\
\13decided to brew his idea of the \"ultimate\" drink. Brewing ale, cheap\
\13whiskey and beer with actual lava from a local Volcano mixed with salt\
\13water, Naz concieved the Flaming Hurricane. While many cannot name the\
\13taste it seems to produce, it has come to be a local favorite for the more\
\13strong-willed citizens.\
\13", 
               Keyword = "Flaming Hurricane", 
            }, 
         }, 
         Cost = 1150, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 7, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "", 
         Name = "Jawa droid", 
         Vnum = 3304, 
         Description = "A piece of paper lies here", 
         Layers = 0, 
         ShortDescr = "a reciept", 
      }, 
      [3305] = 
      {
         Flags = 
         {
            [0] = "Glow", 
            [13] = "Inventory", 
         }, 
         ItemType = "drink_container", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Bartender's specialty\
\13", 
               Keyword = "Bartenders Special", 
            }, 
            [2] = 
            {
               Description = "Considered one of the rarest drinks this side of the galaxy, Alderaanian\
\13Nectar sports pure honey fermented into a delicious drink. Collected from\
\13various Alderaanian natural resources, this drink is the ultimate homeage\
\13to the now destroyed planet. If you decide to divulge in a rare taste of\
\13Alderaanian Nectar, your tastebuds and senses become heightened and you\
\13feel incredible sensations within you. Only found in Harloch's Cantina,\
\13this rare brew is considered priceless throughout the galaxy. \
\13", 
               Keyword = "Alderaanian Nectar", 
            }, 
         }, 
         Cost = 2375, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 16, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ActionDescription = "", 
         Name = "Bartenders Specialty", 
         Vnum = 3305, 
         Description = "A Mug of a Specialty brew", 
         Layers = 0, 
         ShortDescr = "A Mug of the Bartenders Specialty", 
      }, 
      [3306] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "armor", 
         Weight = 9, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 440, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ActionDescription = "", 
         Name = "AA robe eq3306", 
         Vnum = 3306, 
         Description = "A Tusken Raider's Robe", 
         Layers = 0, 
         ShortDescr = "A dirty Robe", 
      }, 
      [3307] = 
      {
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         ItemType = "weapon", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 550, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ActionDescription = "", 
         Name = "Gaffi Stick", 
         Vnum = 3307, 
         Description = "A Gaffi Stick is here.", 
         Layers = 0, 
         ShortDescr = "a Gaffi Stick", 
      }, 
      [3308] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "key", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1290, 
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
         Name = "Dead Key", 
         Vnum = 3308, 
         Description = "A Rusty Key", 
         Layers = 0, 
         ShortDescr = "A Rusty Key", 
      }, 
      [3309] = 
      {
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ItemType = "light", 
         Weight = 600, 
         ExtraDescriptions = 
         {
         }, 
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
         ActionDescription = "", 
         Name = "A Light", 
         Vnum = 3309, 
         Description = "A Light glows dimly", 
         Layers = 0, 
         ShortDescr = "a light", 
      }, 
      [3310] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "trash", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 3000, 
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
         Name = "Gold Medal", 
         Vnum = 3310, 
         Description = "A Gold Raishik Medal", 
         Layers = 0, 
         ShortDescr = "A Gold Medal", 
      }, 
      [3311] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "trash", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2000, 
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
         Name = "Silver Medal", 
         Vnum = 3311, 
         Description = "A Silver Raishik Medal", 
         Layers = 0, 
         ShortDescr = "A Silver Medal", 
      }, 
      [3312] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "trash", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1000, 
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
         Name = "Bronze Medal", 
         Vnum = 3312, 
         Description = "A Bronze Raishik Medal", 
         Layers = 0, 
         ShortDescr = "A Bronze Medal", 
      }, 
      [3313] = 
      {
         Cost = 0, 
         ItemType = "furniture", 
         Weight = 1, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Over to the side, you can see a nice, comfy couch, ideal for just lounging\
\13and taking a break from the life of a trooper.\
\13", 
               Keyword = "couch", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ActionDescription = "", 
         Name = "A small couch", 
         Vnum = 3313, 
         Description = "A comfortable couch is here toward the side.", 
         Layers = 0, 
         ShortDescr = "a couch", 
      }, 
      [3314] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "weapon", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2000, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 3, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 2000, 
            [0] = 12, 
         }, 
         ActionDescription = "", 
         Name = "A Sleak Blaster", 
         Vnum = 3314, 
         Description = "A blaster is lying here", 
         Layers = 0, 
         ShortDescr = "A Sleak Blaster", 
      }, 
      [3315] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "grenade", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A Teklos low yield grenade.  Perfect for blowing your neighbor into tiny\
\13bits with. \
\13", 
               Keyword = "grenade", 
            }, 
         }, 
         Cost = 1200, 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         ActionDescription = "", 
         Name = "A Black Grenade", 
         Vnum = 3315, 
         Description = "A grenade .... run!!!!", 
         Layers = 0, 
         ShortDescr = "A Black Grenade", 
      }, 
      [3316] = 
      {
         Cost = 3000, 
         Description = "A small, lightweight blaster is gathering dust here.", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
            [3] = 
            {
               Location = 31, 
               Modifier = 1, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 12, 
            [2] = 3, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 0, 
         }, 
         ItemType = "weapon", 
         Name = "light blaster pistol rt-22", 
         Vnum = 3316, 
         ActionDescription = "", 
         Layers = 0, 
         ShortDescr = "an RT-22 Light Blaster Pistol", 
      }, 
      [3318] = 
      {
         Cost = 0, 
         ItemType = "furniture", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "", 
         Name = "a Large Table", 
         Vnum = 3318, 
         Description = "A large wooden table", 
         Layers = 0, 
         ShortDescr = "the table", 
      }, 
      [3319] = 
      {
         Cost = 0, 
         ItemType = "trash", 
         Weight = 1, 
         ExtraDescriptions = 
         {
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
         ActionDescription = "", 
         Name = "A chair", 
         Vnum = 3319, 
         Description = "A A chair is here.", 
         Layers = 0, 
         ShortDescr = "a A chair", 
      }, 
      [3399] = 
      {
         Cost = 0, 
         ItemType = "trash", 
         Weight = 1, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The sign begins with \"No weapons beyond this point\" in large letters. It\
continues explaining that there's a weapons checkpoint up ahead and that any\
weapons will be confiscated. Finally it wishes you a nice day.\
", 
               Keyword = "sign", 
            }, 
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
         ActionDescription = "", 
         Name = "sign", 
         Vnum = 3399, 
         Description = "A sign saying \"No weapons beyond this point\" hangs on the wall.", 
         Layers = 0, 
         ShortDescr = "a sign", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Author = "Rendon", 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Arg1 = 3324, 
         Arg3 = 2, 
         Arg2 = 4, 
         Command = "D", 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 3303, 
         Arg3 = 3305, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 60, 
         Arg3 = 16, 
         Arg2 = 1, 
         Command = "E", 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 3301, 
         Arg3 = 3305, 
         Arg2 = 2, 
         Command = "M", 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 57, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg1 = 3300, 
         Arg3 = 3310, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 3305, 
         Arg3 = 3334, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 324, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 28207, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 32234, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 10497, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg1 = 612, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Arg1 = 3306, 
         Arg3 = 3330, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Arg1 = 3307, 
         Arg3 = 3335, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg1 = 10317, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Arg1 = 32232, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Arg1 = 31506, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg1 = 10311, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Arg1 = 10424, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Arg1 = 3308, 
         Arg3 = 3304, 
         Arg2 = 6, 
         Command = "M", 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Arg1 = 3308, 
         Arg3 = 3328, 
         Arg2 = 6, 
         Command = "M", 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Arg1 = 3310, 
         Arg3 = 3303, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [23] = 
      {
         MiscData = 1, 
         Arg1 = 3308, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [24] = 
      {
         MiscData = 1, 
         Arg1 = 3306, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Arg1 = 3307, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Arg1 = 3308, 
         Arg3 = 3314, 
         Arg2 = 6, 
         Command = "M", 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Arg1 = 3308, 
         Arg3 = 3314, 
         Arg2 = 6, 
         Command = "M", 
      }, 
      [28] = 
      {
         MiscData = 1, 
         Arg1 = 3311, 
         Arg3 = 3314, 
         Arg2 = 4, 
         Command = "M", 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg1 = 3311, 
         Arg3 = 3313, 
         Arg2 = 4, 
         Command = "M", 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Arg1 = 10424, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [31] = 
      {
         MiscData = 1, 
         Arg1 = 3308, 
         Arg3 = 3313, 
         Arg2 = 6, 
         Command = "M", 
      }, 
      [32] = 
      {
         MiscData = 1, 
         Arg1 = 3302, 
         Arg3 = 3302, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [33] = 
      {
         MiscData = 1, 
         Arg1 = 60, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [34] = 
      {
         MiscData = 1, 
         Arg1 = 3301, 
         Arg3 = 3302, 
         Arg2 = 2, 
         Command = "M", 
      }, 
      [35] = 
      {
         MiscData = 1, 
         Arg1 = 59, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [36] = 
      {
         MiscData = 1, 
         Arg1 = 60, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [37] = 
      {
         MiscData = 1, 
         Arg1 = 3311, 
         Arg3 = 3300, 
         Arg2 = 4, 
         Command = "M", 
      }, 
      [38] = 
      {
         MiscData = 1, 
         Arg1 = 3308, 
         Arg3 = 3315, 
         Arg2 = 6, 
         Command = "M", 
      }, 
      [39] = 
      {
         MiscData = 1, 
         Arg1 = 3308, 
         Arg3 = 3315, 
         Arg2 = 6, 
         Command = "M", 
      }, 
      [40] = 
      {
         MiscData = 1, 
         Arg1 = 3308, 
         Arg3 = 3327, 
         Arg2 = 6, 
         Command = "M", 
      }, 
      [41] = 
      {
         MiscData = 1, 
         Arg1 = 3304, 
         Arg3 = 3323, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [42] = 
      {
         MiscData = 1, 
         Arg1 = 3301, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [43] = 
      {
         MiscData = 1, 
         Arg1 = 3316, 
         Arg3 = 3306, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [44] = 
      {
         MiscData = 1, 
         Arg1 = 3316, 
         Arg3 = 3343, 
         Arg2 = 5, 
         Command = "M", 
      }, 
      [45] = 
      {
         MiscData = 1, 
         Arg1 = 3316, 
         Arg3 = 3342, 
         Arg2 = 5, 
         Command = "M", 
      }, 
      [46] = 
      {
         MiscData = 1, 
         Arg1 = 3316, 
         Arg3 = 3342, 
         Arg2 = 5, 
         Command = "M", 
      }, 
      [47] = 
      {
         MiscData = 1, 
         Arg1 = 3312, 
         Arg3 = 3355, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [48] = 
      {
         MiscData = 1, 
         Arg1 = 10311, 
         Arg3 = 0, 
         Arg2 = 1, 
         Command = "E", 
      }, 
      [49] = 
      {
         MiscData = 1, 
         Arg1 = 3309, 
         Arg3 = 3355, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [50] = 
      {
         MiscData = 1, 
         Arg1 = 3315, 
         Arg3 = 3337, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [51] = 
      {
         MiscData = 1, 
         Arg1 = 3314, 
         Arg3 = 3338, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [52] = 
      {
         MiscData = 1, 
         Arg1 = 3300, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [53] = 
      {
         MiscData = 1, 
         Arg1 = 3309, 
         Arg3 = 3318, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [54] = 
      {
         MiscData = 1, 
         Arg1 = 3302, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [55] = 
      {
         MiscData = 1, 
         Arg1 = 3305, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [56] = 
      {
         MiscData = 1, 
         Arg1 = 301, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [57] = 
      {
         MiscData = 1, 
         Arg1 = 3317, 
         Arg3 = 3357, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [58] = 
      {
         MiscData = 1, 
         Arg1 = 301, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [59] = 
      {
         MiscData = 1, 
         Arg1 = 3302, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [60] = 
      {
         MiscData = 1, 
         Arg1 = 3305, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [61] = 
      {
         MiscData = 1, 
         Arg1 = 3318, 
         Arg3 = 3361, 
         Arg2 = 1, 
         Command = "M", 
      }, 
      [62] = 
      {
         MiscData = 1, 
         Arg1 = 3315, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [63] = 
      {
         MiscData = 1, 
         Arg1 = 3314, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [64] = 
      {
         MiscData = 1, 
         Arg1 = 3316, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [65] = 
      {
         MiscData = 0, 
         Arg1 = 3399, 
         Arg3 = 3301, 
         Arg2 = 1, 
         Command = "O", 
      }, 
      [66] = 
      {
         MiscData = 0, 
         Arg1 = 3399, 
         Arg3 = 3304, 
         Arg2 = 1, 
         Command = "O", 
      }, 
   }, 
   Name = "Mos Espa - Tatooine", 
   ResetFrequency = 0, 
   LowEconomy = 6272465, 
}
