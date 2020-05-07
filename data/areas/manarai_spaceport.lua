-- Coruscant - Manarai Spaceport
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Filename = "manarai_spaceport.lua", 
   LowEconomy = 31260429, 
   LevelRanges = 
   {
      Soft = 
      {
         High = 0, 
         Low = 0, 
      }, 
      Hard = 
      {
         High = 103, 
         Low = 0, 
      }, 
   }, 
   Name = "Coruscant - Manarai Spaceport", 
   ResetMessage = "", 
   ResetFrequency = 0, 
   Mobiles = 
   {
      [208] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "Astromech droid wheels around the floor.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "an astromech droid", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 5, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 208, 
         Name = "astromech droid r2", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "This common make of astromech droid is also known as an R2 unit. It is\
a small wheeled droid designed primarily for ship maintenence and\
repair. It has an interface apendage to plug into a ships computer as\
well as several other tools hidden within its domed frame that it\
uses to preform various functions.\
", 
         ArmorClass = 88, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
      }, 
      [209] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "Astromech droid wheels around the floor.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "an astromech droid", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 5, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 209, 
         Name = "astromech droid r2", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "This common make of astromech droid is also known as an R2 unit. It is\
a small wheeled droid designed primarily for ship maintenence and\
repair. It has an interface apendage to plug into a ships computer as\
well as several other tools hidden within its domed frame that it\
uses to preform various functions.\
", 
         ArmorClass = 88, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
      }, 
      [210] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "A small child begs for money.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "a begger", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 20, 
            HitNoDice = 0, 
            HitSizeDice = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "say Spare some change?\
", 
               Arguments = "50", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "look $n\
say Spare some change?\
", 
               Arguments = "50", 
            }, 
            [3] = 
            {
               MudProgType = "bribe_prog", 
               Code = "say thank you.\
bow $n\
", 
               Arguments = "1", 
            }, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 2, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 210, 
         Name = "begger", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 13, 
            Wisdom = 13, 
            Luck = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Strength = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "", 
         ArmorClass = 95, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 0, 
            DamPlus = 2, 
         }, 
      }, 
      [225] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "Some god abandoned a newly created mobmarker here.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created mobmarker", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 1, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 225, 
         Name = "mobmarker", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "", 
         ArmorClass = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [200] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "A droid is here collecting turbocar tokens.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "bribe_prog", 
               Code = "mpechoat $n The droid scans your credits and allows you to pass.\
mpechoaround $n $n passes through the turnstile.\
mptransfer $n 215\
", 
               Arguments = "5", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "a ticket droid", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Alignment = 0, 
         Level = 1, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 200, 
         Name = "toll droid ticket token", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "This is a plain looking droid whos only purpose day in and day out is to\
collect credits and tokens for entrance into the transit system. It\
doesn't apear that it would be useful in any other capacity.\
", 
         ArmorClass = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [201] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "A droid is here scanning your purchaces.\
", 
         Shop = 
         {
            ProfitBuy = 120, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "a shopkeeper droid", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         ShortDescr = "a shopkeeper droid", 
         Race = "Human", 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 50, 
         VipFlags = 
         {
            [0] = "Coruscant", 
         }, 
         Vnum = 201, 
         Name = "storekeeper hopkeeper droid", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 13, 
            Wisdom = 13, 
            Luck = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Strength = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "This droid is a very rudimentry humanoid shape. Its voice synthesyser is\
worn out and makes a slight hissing sound when it speaks.\
", 
         ArmorClass = -25, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [202] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "A retail droid is here to assist you with your purchaces.\
", 
         Shop = 
         {
            ProfitBuy = 120, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "a retail droid", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         ShortDescr = "a retail droid", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 10, 
         VipFlags = 
         {
            [0] = "Coruscant", 
         }, 
         Vnum = 202, 
         Name = "retail droid", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 13, 
            Wisdom = 13, 
            Luck = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Strength = 18, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "The retail droid is similar in apearance to a standard proticol droid.\
It is fittened however with a crdit exchange terminal in its hip and\
is programmed to be an expert salesperson.\
", 
         ArmorClass = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [203] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "A spaceport security guard looks around the entrance.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "a spaceport security guard", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 500, 
            HitNoDice = 10, 
            HitSizeDice = 10, 
         }, 
         HitRoll = 10, 
         Alignment = 0, 
         Level = 50, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 203, 
         Name = "spaceport security guard", 
         DamRoll = 10, 
         Stats = 
         {
            Constitution = 13, 
            Wisdom = 13, 
            Luck = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Strength = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "", 
         ArmorClass = -25, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
      }, 
      [204] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "A spaceport security guard watches the docking bays.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "a spaceport security guard", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 500, 
            HitNoDice = 10, 
            HitSizeDice = 10, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 50, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 204, 
         Name = "spaceport security guard", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "", 
         ArmorClass = -25, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
      }, 
      [205] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "Some god abandoned a newly created technician here.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created technician", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 1, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 205, 
         Name = "technician", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "", 
         ArmorClass = 0, 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [206] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "A technician is readying ships for launch.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [10] = "Practice", 
            [24] = "NoAssist", 
         }, 
         ShortDescr = "a technician", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 9, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 206, 
         Name = "technician", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Charisma = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Description = "This is a young human tecnician. He is dressed in a grey worksuit that\
is smuged with greasea. Several tools hang from a belt around his\
waist.\
", 
         ArmorClass = 80, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [207] = 
      {
         NumberOfAttacks = 0, 
         LongDescr = "A human is sitting here waiting for his shuttle to arrive.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         ShortDescr = "a human", 
         Race = "Human", 
         Height = 0, 
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
         HitChance = 
         {
            HitPlus = 100, 
            HitNoDice = 2, 
            HitSizeDice = 10, 
         }, 
         HitRoll = 0, 
         Alignment = 0, 
         Level = 10, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Vnum = 207, 
         Name = "human", 
         DamRoll = 0, 
         Stats = 
         {
            Constitution = 13, 
            Wisdom = 13, 
            Luck = 13, 
            Dexterity = 13, 
            Charisma = 13, 
            Strength = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         Position = "standing", 
         Credits = 10, 
         Description = "This young human man is in his early twenties. He is dressed in the latest\
fashions and is clean cut. He is probably a student at the university.\
", 
         ArmorClass = 75, 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
      }, 
   }, 
   Objects = 
   {
      [200] = 
      {
         Cost = 0, 
         Vnum = 200, 
         Name = "ferry shuttle", 
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
         ShortDescr = "the Shipyard Ferry", 
         Weight = 1, 
         Layers = 0, 
         Description = "The shipyard ferry travels back and forth between coruscant and the shipyard.", 
         ActionDescription = "", 
         ItemType = "trash", 
      }, 
      [201] = 
      {
         Cost = 2, 
         Vnum = 201, 
         Name = "sandwich ", 
         ExtraDescriptions = 
         {
         }, 
         Description = "Don't step on that sandwich...", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a sandwich", 
         Weight = 1, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         ItemType = "food", 
      }, 
      [210] = 
      {
         Cost = 0, 
         Vnum = 210, 
         Name = "box", 
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
         ShortDescr = "a box", 
         Weight = 1, 
         Layers = 0, 
         Description = "A large box is on the floor here.", 
         ActionDescription = "", 
         ItemType = "trash", 
      }, 
      [225] = 
      {
         Cost = 0, 
         Vnum = 225, 
         Name = "turbocar subway car transit", 
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
         ShortDescr = "a turbocar", 
         Weight = 1, 
         Layers = 0, 
         Description = "A turbocar is here, board it quickly before it leaves.", 
         ActionDescription = "", 
         ItemType = "trash", 
      }, 
      [202] = 
      {
         Cost = 2, 
         Vnum = 202, 
         Name = "some beat up sneakers", 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some beat up sneakers really stink.", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ShortDescr = "some beat up sneakers", 
         Weight = 1, 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ActionDescription = "", 
         ItemType = "armor", 
      }, 
   }, 
   VnumRanges = 
   {
      Room = 
      {
         Last = 226, 
         First = 199, 
      }, 
      Mob = 
      {
         Last = 225, 
         First = 200, 
      }, 
      Object = 
      {
         Last = 225, 
         First = 200, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 210, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 208, 
         Command = "O", 
      }, 
      [2] = 
      {
         Arg1 = 200, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 214, 
         Command = "M", 
      }, 
      [3] = 
      {
         Arg1 = 38, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 211, 
         Command = "O", 
      }, 
      [4] = 
      {
         Arg1 = 32201, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 209, 
         Command = "O", 
      }, 
      [5] = 
      {
         Arg1 = 202, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 207, 
         Command = "M", 
      }, 
      [6] = 
      {
         Arg1 = 305, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         Arg1 = 304, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Arg1 = 32207, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Arg1 = 201, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Arg1 = 203, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 210, 
         Command = "M", 
      }, 
      [11] = 
      {
         Arg1 = 204, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 204, 
         Command = "M", 
      }, 
      [12] = 
      {
         Arg1 = 204, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 204, 
         Command = "M", 
      }, 
      [13] = 
      {
         Arg1 = 206, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 203, 
         Command = "M", 
      }, 
      [14] = 
      {
         Arg1 = 206, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 203, 
         Command = "M", 
      }, 
      [15] = 
      {
         Arg1 = 207, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 206, 
         Command = "M", 
      }, 
      [16] = 
      {
         Arg1 = 207, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 206, 
         Command = "M", 
      }, 
      [17] = 
      {
         Arg1 = 10315, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 206, 
         Command = "O", 
      }, 
      [18] = 
      {
         Arg1 = 209, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 201, 
         Command = "M", 
      }, 
      [19] = 
      {
         Arg1 = 208, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 202, 
         Command = "M", 
      }, 
      [20] = 
      {
         Arg1 = 210, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 205, 
         Command = "M", 
      }, 
      [21] = 
      {
         Arg1 = 332, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [22] = 
      {
         Arg1 = 3, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         Arg1 = 202, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [24] = 
      {
         Arg1 = 210, 
         Arg2 = 2, 
         MiscData = 1, 
         Arg3 = 205, 
         Command = "M", 
      }, 
      [25] = 
      {
         Arg1 = 332, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 5, 
         Command = "E", 
      }, 
      [26] = 
      {
         Arg1 = 202, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 8, 
         Command = "E", 
      }, 
      [27] = 
      {
         Arg1 = 201, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg3 = 212, 
         Command = "M", 
      }, 
      [28] = 
      {
         Arg1 = 32270, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         Arg1 = 32261, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [30] = 
      {
         Arg1 = 32253, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [31] = 
      {
         Arg1 = 10424, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [32] = 
      {
         Arg1 = 10311, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         Arg1 = 329, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
   }, 
   HighEconomy = 0, 
   Author = "Durga", 
   FileFormatVersion = 1, 
   Rooms = 
   {
      [224] = 
      {
         Tunnel = 0, 
         Vnum = 224, 
         Name = "Turbocar Platform - Plaza Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 447, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [225] = 
      {
         Tunnel = 0, 
         Vnum = 225, 
         Name = "A Turbocar", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The turbocar is long and narrow. There are benches along both sides of\
the car but they are almost always filled. Most passengers are forced\
to grab onto one of the many handholds that extend from the ceiling\
and lock into position once the car starts moving.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [226] = 
      {
         Tunnel = 0, 
         Vnum = 226, 
         Name = "&RDO NOT FLY THIS SHIP&w", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "Do not fly this ship it is controlled automaticly by the code. Do not\
fly this ship it is controlled automaticly by the code. Do not fly\
this ship it is controlled automaticly by the code. Do not fly this\
ship it is controlled automaticly by the code.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [199] = 
      {
         Tunnel = 0, 
         Vnum = 199, 
         Name = "&RDO NOT FLY THIS SHIP", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "Do not fly this ship it is controlled automaticly by the code. Do not\
fly this ship it is controlled automaticly by the code. Do not fly\
this ship it is controlled automaticly by the code. Do not fly this\
ship it is controlled automaticly by the code.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [200] = 
      {
         Tunnel = 0, 
         Vnum = 200, 
         Name = "A Small Shuttle", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You stand inside a small shuttlecraft that flies between Coruscant's\
Manarai Spaceport and An Orbitting Shipyard. There are several plastic\
covered seats along the walls but passengers are mostly expected to\
stand for the brief journey.\
Type LEAVE to exit after the ship lands.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [201] = 
      {
         Tunnel = 0, 
         Vnum = 201, 
         Name = "Serin Pluogus Tourbus Platform", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "This platform is reserved for the publicly funded tour shuttle, the\
Serin Pluogus. The rest of the Manarai spaceport is to the west and\
north of here. Around the rest of the platform you can view the\
southern reaches of Imperial City. To the south tower the Manarai\
Mountains.\
\
When the pluogus lands type BOARD PLUOGUS to enter.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 204, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [202] = 
      {
         Tunnel = 0, 
         Vnum = 202, 
         Name = "Shuttle Platform", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "This platform is reserved for shuttles flying between Manarai spaceport\
and orbitting space stations. The rest of the Manarai spaceport is to\
the south-east and  north of here.  Around the rest of the platform\
you can view the southern reaches of Imperial  City .To the south tower\
the Manarai Mountains.\
 \
Wait here for the shipyard ferry. When it lands BOARD FERRY.\
 \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 204, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [203] = 
      {
         Tunnel = 0, 
         Vnum = 203, 
         Name = "Main Platform", 
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
         Description = "This is the main platform in the Manarai Spaceport. All kinds of ships\
are docked here. There are even a few that can be rented. The rest of\
the spaceport is to the north. Around it is the southern end of\
Imperial City which covers a good portion of the planet. To the south\
s a beautiful view of the Manarai Mountain Range. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 204, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [204] = 
      {
         Tunnel = 0, 
         Vnum = 204, 
         Name = "Platform Area", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Description = "From the platform area of the spaceport you have an excellent view of\
the Manarai Mountains to the south. This large mountain range marks\
the southern limit of Government city. The air is cool here and\
tastes cleaner than that  of the rest of the planet. It would be\
quite peaceful here watching spaceships take off against the\
backgound of the snow capped mountains. The main platform is to the\
south of here. A walkway leads north into the spaceport.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 205, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 202, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               DestinationVnum = 203, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               DestinationVnum = 201, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [205] = 
      {
         Tunnel = 0, 
         Vnum = 205, 
         Name = "Walkway", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The walkway is a long corridor enclosed in transpariplast windows.\
Through the windows you can see that the spaceport is surrounded by\
mountains to the south and a seemongly endless city that stretches\
out in all other directions.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 206, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 204, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [206] = 
      {
         Tunnel = 0, 
         Vnum = 206, 
         Name = "Waiting Room", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This large room is filled with benches and chairs. Most are arranged\
in rows or around small islands of plants. Some however are arranged\
in small groups  facing each other. Scattered amidst the seats are\
many tables housing abandoned magazines. There is a holovid showing\
an old movie in one corner of the room. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 209, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 208, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               DestinationVnum = 205, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               DestinationVnum = 207, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [207] = 
      {
         Tunnel = 0, 
         Vnum = 207, 
         Name = "Spaceport Cafe", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The spaceport cafe is a good sized self-serve cafeteria. There is a\
long counter with many snack type foods and small instant meals. A\
drink dispenser is at one end and at the other a droid teller handles\
the credit transactions. There are a many tables along the walls and\
a several in the center of the room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 206, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [208] = 
      {
         Tunnel = 0, 
         Vnum = 208, 
         Name = "Lost and Found", 
         Flags = 
         {
            [14] = "Donation", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The lost and found is a small plain room. There is a bin of clothing,\
a table with several small boxes, a couple of large boxes and several\
suitcases lined up against the wall. Some of the stuff has been\
collecting dust for quite some time.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 206, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [209] = 
      {
         Tunnel = 0, 
         Vnum = 209, 
         Name = "Spaceport Lobby", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The Manarai Spaceport lobby is a large open room with a transparisteel\
ceiling. The floor is a polished white with a black fractal pattern.\
There is a ticket booth in one corner of the room. An escalater in\
the opposite corner leads down.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 210, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 212, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               DestinationVnum = 206, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               DestinationVnum = 211, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               DestinationVnum = 213, 
               Distance = 0, 
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [210] = 
      {
         Tunnel = 0, 
         Vnum = 210, 
         Name = "Spaceport Entrance", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The entranceway of the Manarai Mountains Spaceport is a large wide\
staicase  leading from the walkway outside down to the spaceport\
lobby. A large set of double doors opens and closes automaticly as\
people approach.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 301, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 209, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [211] = 
      {
         Tunnel = 0, 
         Vnum = 211, 
         Name = "Spaceport Hotel", 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The Manarai Spaceport Hotel is attached directly to the lobby of\
spaceport allowing travelers to find quick lodgings after a long\
journey. The rooms here are well kept although a bit pricy. It would\
be a good safe place to rest for a while.\
\
You may safely leave and reenter the game from here.\
 \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 209, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [212] = 
      {
         Tunnel = 0, 
         Vnum = 212, 
         Name = "Spaceport Store", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The spaceport store seems to carry mostly only useless souveniers.\
There are however a few nice garments for sale and one or two of the\
things on display could come in handy if the prices weren't so high.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 209, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [213] = 
      {
         Tunnel = 0, 
         Vnum = 213, 
         Name = "Transit Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "The Manarai Spaceport Transit Station is one of many interconnected\
turbocar stations running through Imperial City. Its probably the\
easiest fasted and cheapest way to get around the enormous city and\
thus is a favoured means  of transportation.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 214, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 209, 
               Distance = 0, 
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [214] = 
      {
         Tunnel = 0, 
         Vnum = 214, 
         Name = "Toll Booth", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "For one small fee you can ride the turbocar transit system to almost\
anywhere throught Imperial City. The turnstile allows one person\
through at a time as they pay the droid on duty. The cost is 5\
credits.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 213, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [215] = 
      {
         Tunnel = 0, 
         Vnum = 215, 
         Name = "Manarai Spaceport Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extremely high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 213, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [216] = 
      {
         Tunnel = 0, 
         Vnum = 216, 
         Name = "Turbocar Platform - Skydome Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 431, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [217] = 
      {
         Tunnel = 0, 
         Vnum = 217, 
         Name = "Turbocar Platform - Grand Towers Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 433, 
               Distance = 0, 
               Key = -1, 
               Direction = "southwest", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [218] = 
      {
         Tunnel = 0, 
         Vnum = 218, 
         Name = "Turbocar Platform - Grandis Mon Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 436, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 435, 
               Distance = 0, 
               Key = -1, 
               Direction = "southwest", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [219] = 
      {
         Tunnel = 0, 
         Vnum = 219, 
         Name = "Turbocar Platform - Palace Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 438, 
               Distance = 0, 
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               DestinationVnum = 437, 
               Distance = 0, 
               Key = -1, 
               Direction = "southwest", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [220] = 
      {
         Tunnel = 0, 
         Vnum = 220, 
         Name = "Turbocar Platform - Museum Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 439, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [221] = 
      {
         Tunnel = 0, 
         Vnum = 221, 
         Name = "Turbocar Platform - College Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 441, 
               Distance = 0, 
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [222] = 
      {
         Tunnel = 0, 
         Vnum = 222, 
         Name = "Turbocar Platform - Zoo Station ", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 443, 
               Distance = 0, 
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
      [223] = 
      {
         Tunnel = 0, 
         Vnum = 223, 
         Name = "Turbocar Platform - Dometown Station", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This long narrow room is devided down the middle by a wide turbocar\
track. The turbocars move at extreemly high speeds and as they\
aproach a gust of wind tugs at you threatening to knock you off\
ballance. When the turbocar comes to a complete stop you may \"board\"\
it and look for a seat.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               DestinationVnum = 445, 
               Distance = 0, 
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         TeleDelay = 0, 
      }, 
   }, 
}
