-- Honoghr
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Filename = "honoghr.lua", 
   Name = "Honoghr", 
   Mobiles = 
   {
      [1008] = 
      {
         Description = "", 
         Name = "Ir'Khanim noghri dynast", 
         Vnum = 1008, 
         Weight = 0, 
         Credits = 450, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "Ir'Khanim", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         LongDescr = "Ir'Khanim, Second Dynast is here.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
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
         Sex = "undistinguished", 
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 18, 
         HitRoll = 16, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 90, 
         Damage = 
         {
            DamNoDice = 11, 
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
         ArmorClass = -125, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Position = "standing", 
      }, 
      [1009] = 
      {
         Description = "", 
         Name = "Maitrakh matiark noghri leader", 
         Vnum = 1009, 
         Weight = 0, 
         Credits = 450, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "Maitrakh, clan Kihm'bar", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         LongDescr = "Maitrakh, clan Kihm'bar is looking at her clan history.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
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
         Sex = "female", 
         DamRoll = 18, 
         HitRoll = 16, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 90, 
         Damage = 
         {
            DamNoDice = 11, 
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
         ArmorClass = -125, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Position = "standing", 
      }, 
      [1010] = 
      {
         Description = "", 
         Name = "Rukh noghri assassin", 
         Vnum = 1010, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Weight = 0, 
         Credits = 420, 
         Flags = 
         {
            [0] = "Npc", 
            [9] = "Train", 
         }, 
         ShortDescr = "Rukh", 
         HitChance = 
         {
            HitSizeDice = 30, 
            HitPlus = 2000, 
            HitNoDice = 50, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "fight_prog", 
               Code = "get dagger sheath\
wield dagger\
", 
            }, 
         }, 
         LongDescr = "Rukh, ex-imperial death commando is here watching you.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [5] = "pierce", 
            [13] = "nonmagic", 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Sex = "male", 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
         }, 
         HitRoll = 21, 
         DamRoll = 21, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 105, 
         Damage = 
         {
            DamNoDice = 6, 
            DamSizeDice = 20, 
            DamPlus = 150, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 16, 
            Wisdom = 18, 
            Dexterity = 25, 
            Strength = 20, 
            Charisma = 17, 
            Intelligence = 19, 
         }, 
         ArmorClass = -162, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         Position = "standing", 
      }, 
      [1011] = 
      {
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "food", 
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
            KeeperShortDescr = "a noghri cook", 
         }, 
         Description = "", 
         Name = "noghri cook ", 
         Vnum = 1011, 
         Weight = 0, 
         Credits = 75, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         ShortDescr = "a noghri cook", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 150, 
            HitNoDice = 3, 
         }, 
         LongDescr = "A noghri cook is here ready to serve you.\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
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
         Sex = "male", 
         DamRoll = 0, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 15, 
         Damage = 
         {
            DamNoDice = 2, 
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
         ArmorClass = 62, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Position = "standing", 
      }, 
      [1012] = 
      {
         Description = "", 
         Name = "a noghri commando", 
         Vnum = 1012, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a noghri commando", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 600, 
            HitNoDice = 12, 
         }, 
         LongDescr = "A noghri commando is standing here on duty.\
", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [1] = "spec_guardian", 
            [2] = "spec_stormtrooper", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "fight_prog", 
               Code = "if ovnumwear(59) < 1\
mpoload 59\
wield vibro\
endif\
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
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
         Race = "Shistavanen", 
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 60, 
         Damage = 
         {
            DamNoDice = 6, 
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
         ArmorClass = -50, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [1099] = 
      {
         Description = "", 
         Name = "noghri ", 
         Vnum = 1099, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created noghri ", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created noghri  here.\
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
      [1016] = 
      {
         Description = "", 
         Name = "A noghri elder", 
         Vnum = 1016, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [20] = "Scholar", 
            [25] = "NoKill", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A noghri elder", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 850, 
            HitNoDice = 17, 
         }, 
         LongDescr = "A noghri elder sits here, in front of books\
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
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 20, 
         HitRoll = 20, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 85, 
         Damage = 
         {
            DamNoDice = 8, 
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
         ArmorClass = -112, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [1000] = 
      {
         Description = "", 
         Name = "Noghri male Khabarakh", 
         Vnum = 1000, 
         Weight = 0, 
         Credits = 225, 
         Flags = 
         {
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "Khabarakh, clan Kihm'bar", 
         HitChance = 
         {
            HitSizeDice = 9, 
            HitPlus = 450, 
            HitNoDice = 10, 
         }, 
         LongDescr = "A noghri male is standing here.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "1000", 
               MudProgType = "fight_prog", 
               Code = "get dagger sheath\
wield dagger\
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [6] = "shistavanen", 
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
         Sex = "male", 
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 9, 
         HitRoll = 7, 
         NumberOfAttacks = 3, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 45, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 8, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 20, 
            Strength = 13, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 52, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Position = "standing", 
      }, 
      [1001] = 
      {
         Description = "", 
         Name = "the dynast", 
         Vnum = 1001, 
         Weight = 0, 
         Credits = 450, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "The Dynast", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         LongDescr = "The Dynast is here keeping control of the clans.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
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
         Sex = "undistinguished", 
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 18, 
         HitRoll = 16, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 90, 
         Damage = 
         {
            DamNoDice = 11, 
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
         ArmorClass = -125, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Position = "standing", 
      }, 
      [1002] = 
      {
         Description = "", 
         Name = "noghri ", 
         Vnum = 1002, 
         Weight = 0, 
         Credits = 75, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a noghri", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 150, 
            HitNoDice = 3, 
         }, 
         LongDescr = "A noghri is walking ever so quietly past you.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [6] = "shistavanen", 
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
         Sex = "male", 
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 1, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 15, 
         Damage = 
         {
            DamNoDice = 2, 
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
         ArmorClass = 62, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Position = "standing", 
      }, 
      [1003] = 
      {
         Description = "", 
         Name = "noghri child", 
         Vnum = 1003, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a noghri child", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 50, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A noghri child is playing ball here.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
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
         Sex = "undistinguished", 
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 1, 
         HitRoll = 1, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 5, 
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
         ArmorClass = 87, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Position = "standing", 
      }, 
      [1004] = 
      {
         Description = "", 
         Name = "noghri female", 
         Vnum = 1004, 
         Weight = 0, 
         Credits = 75, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a noghri female", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 150, 
            HitNoDice = 3, 
         }, 
         LongDescr = "A noghri female is silently walking aound the village.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [6] = "shistavanen", 
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
         Sex = "female", 
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 15, 
         Damage = 
         {
            DamNoDice = 2, 
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
         ArmorClass = 62, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         Position = "standing", 
      }, 
      [1005] = 
      {
         Description = "This common make of astromech droid is also known as an R2 unit. It is\
a small wheeled droid designed primarily for ship maintenence and\
repair. It has an interface apendage to plug into a ships computer as\
well as several other tools hidden within its domed frame that it\
uses to preform various functions.\
", 
         Name = "decon droid", 
         Vnum = 1005, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "a decon droid", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A decon droid is cleaning the soil here.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [11] = "barabel", 
            }, 
            Speaks = 
            {
               [11] = "barabel", 
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
         Level = 5, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 0, 
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
         ArmorClass = 88, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [1006] = 
      {
         Description = "", 
         Name = "a noghri commando", 
         Vnum = 1006, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "a noghri commando", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 20, 
         }, 
         LongDescr = "A noghri commando is standing here on duty.\
", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [1] = "spec_guardian", 
            [2] = "spec_police_undercover", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "fight_prog", 
               Code = "if ovnumwear(59) < 1\
mpoload 59\
wield vibro\
endif\
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
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
         Race = "Shistavanen", 
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 20, 
         HitRoll = 20, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 101, 
         Damage = 
         {
            DamNoDice = 10, 
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
         ArmorClass = -152, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [1007] = 
      {
         Description = "", 
         Name = "Vor'corkh noghri dynast", 
         Vnum = 1007, 
         Weight = 0, 
         Credits = 450, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "Vork'Corkh ", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         LongDescr = "Vork'Corkh, First Dynast is here.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
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
         Sex = "undistinguished", 
         VipFlags = 
         {
            [6] = "Honoghr", 
         }, 
         DamRoll = 18, 
         HitRoll = 16, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Shistavanen", 
         Level = 90, 
         Damage = 
         {
            DamNoDice = 11, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 25, 
            Wisdom = 25, 
            Dexterity = 25, 
            Strength = 25, 
            Charisma = 25, 
            Intelligence = 25, 
         }, 
         ArmorClass = -125, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
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
         Arg1 = 1000, 
         Arg3 = 1046, 
      }, 
      [2] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1002, 
         Arg3 = 14, 
      }, 
      [3] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [4] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1001, 
         Arg3 = 5, 
      }, 
      [5] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10424, 
         Arg3 = 17, 
      }, 
      [6] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1007, 
         Arg3 = 6, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1009, 
         Arg3 = 1033, 
      }, 
      [8] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [9] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1007, 
         Arg3 = 6, 
      }, 
      [10] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1008, 
         Arg3 = 1033, 
      }, 
      [11] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg1 = 1007, 
         Arg3 = 1, 
      }, 
      [12] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32201, 
         Arg3 = 1048, 
      }, 
      [13] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 90, 
         Arg3 = 1049, 
      }, 
      [14] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg1 = 1012, 
         Arg3 = 1003, 
      }, 
      [15] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg1 = 1012, 
         Arg3 = 1003, 
      }, 
      [16] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg1 = 1012, 
         Arg3 = 1003, 
      }, 
      [17] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1005, 
      }, 
      [18] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1005, 
      }, 
      [19] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1005, 
      }, 
      [20] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1005, 
      }, 
      [21] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1005, 
      }, 
      [22] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1005, 
      }, 
      [23] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1005, 
      }, 
      [24] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1005, 
      }, 
      [25] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 19, 
         Arg1 = 1004, 
         Arg3 = 1005, 
      }, 
      [26] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 19, 
         Arg1 = 1004, 
         Arg3 = 1005, 
      }, 
      [27] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
         Arg1 = 1012, 
         Arg3 = 1005, 
      }, 
      [28] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
         Arg1 = 1012, 
         Arg3 = 1005, 
      }, 
      [29] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
         Arg1 = 1012, 
         Arg3 = 1005, 
      }, 
      [30] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
         Arg1 = 1012, 
         Arg3 = 1005, 
      }, 
      [31] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [32] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [33] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [34] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [35] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [36] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [37] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [38] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [39] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [40] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [41] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [42] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [43] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [44] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [45] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [46] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [47] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [48] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [49] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 21, 
         Arg1 = 1002, 
         Arg3 = 1012, 
      }, 
      [50] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 21, 
         Arg1 = 1002, 
         Arg3 = 1012, 
      }, 
      [51] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 19, 
         Arg1 = 1004, 
         Arg3 = 1012, 
      }, 
      [52] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [53] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 21, 
         Arg1 = 1002, 
         Arg3 = 1012, 
      }, 
      [54] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 19, 
         Arg1 = 1004, 
         Arg3 = 1012, 
      }, 
      [55] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1012, 
      }, 
      [56] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 21, 
         Arg1 = 1002, 
         Arg3 = 1012, 
      }, 
      [57] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 11, 
         Arg1 = 1012, 
         Arg3 = 1012, 
      }, 
      [58] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 11, 
         Arg1 = 1012, 
         Arg3 = 1012, 
      }, 
      [59] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 11, 
         Arg1 = 1012, 
         Arg3 = 1012, 
      }, 
      [60] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 11, 
         Arg1 = 1012, 
         Arg3 = 1012, 
      }, 
      [61] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1007, 
         Arg3 = 1008, 
      }, 
      [62] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [63] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1008, 
         Arg3 = 1008, 
      }, 
      [64] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [65] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1001, 
         Arg3 = 1008, 
      }, 
      [66] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [67] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [68] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 15, 
         Arg1 = 1012, 
         Arg3 = 1008, 
      }, 
      [69] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 15, 
         Arg1 = 1012, 
         Arg3 = 1008, 
      }, 
      [70] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 15, 
         Arg1 = 1012, 
         Arg3 = 1008, 
      }, 
      [71] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 15, 
         Arg1 = 1012, 
         Arg3 = 1008, 
      }, 
      [72] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg1 = 1008, 
         Arg3 = 1, 
      }, 
      [73] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 16, 
         Arg1 = 1012, 
         Arg3 = 1011, 
      }, 
      [74] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 17, 
         Arg1 = 1012, 
         Arg3 = 1010, 
      }, 
      [75] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 19, 
         Arg1 = 1012, 
         Arg3 = 1009, 
      }, 
      [76] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 19, 
         Arg1 = 1012, 
         Arg3 = 1009, 
      }, 
      [77] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 21, 
         Arg1 = 1002, 
         Arg3 = 1022, 
      }, 
      [78] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 22, 
         Arg1 = 1012, 
         Arg3 = 1022, 
      }, 
      [79] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 22, 
         Arg1 = 1012, 
         Arg3 = 1022, 
      }, 
      [80] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 22, 
         Arg1 = 1012, 
         Arg3 = 1022, 
      }, 
      [81] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 21, 
         Arg1 = 1002, 
         Arg3 = 1023, 
      }, 
      [82] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 21, 
         Arg1 = 1002, 
         Arg3 = 1023, 
      }, 
      [83] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 21, 
         Arg1 = 1002, 
         Arg3 = 1023, 
      }, 
      [84] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 25, 
         Arg1 = 1012, 
         Arg3 = 1023, 
      }, 
      [85] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 25, 
         Arg1 = 1012, 
         Arg3 = 1023, 
      }, 
      [86] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 25, 
         Arg1 = 1012, 
         Arg3 = 1023, 
      }, 
      [87] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 30, 
         Arg1 = 1012, 
         Arg3 = 1026, 
      }, 
      [88] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 30, 
         Arg1 = 1012, 
         Arg3 = 1026, 
      }, 
      [89] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 30, 
         Arg1 = 1012, 
         Arg3 = 1026, 
      }, 
      [90] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 30, 
         Arg1 = 1012, 
         Arg3 = 1026, 
      }, 
      [91] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 30, 
         Arg1 = 1012, 
         Arg3 = 1026, 
      }, 
      [92] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1000, 
         Arg3 = 1029, 
      }, 
      [93] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1002, 
         Arg3 = 14, 
      }, 
      [94] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [95] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1001, 
         Arg3 = 5, 
      }, 
      [96] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10424, 
         Arg3 = 17, 
      }, 
      [97] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1007, 
         Arg3 = 6, 
      }, 
      [98] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 34, 
         Arg1 = 1012, 
         Arg3 = 1029, 
      }, 
      [99] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 34, 
         Arg1 = 1012, 
         Arg3 = 1029, 
      }, 
      [100] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 34, 
         Arg1 = 1012, 
         Arg3 = 1029, 
      }, 
      [101] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 34, 
         Arg1 = 1012, 
         Arg3 = 1029, 
      }, 
      [102] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 38, 
         Arg1 = 1012, 
         Arg3 = 1031, 
      }, 
      [103] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 38, 
         Arg1 = 1012, 
         Arg3 = 1031, 
      }, 
      [104] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 38, 
         Arg1 = 1012, 
         Arg3 = 1031, 
      }, 
      [105] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 38, 
         Arg1 = 1012, 
         Arg3 = 1031, 
      }, 
      [106] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 1012, 
         Arg3 = 1034, 
      }, 
      [107] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 1012, 
         Arg3 = 1034, 
      }, 
      [108] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 1012, 
         Arg3 = 1034, 
      }, 
      [109] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 45, 
         Arg1 = 1012, 
         Arg3 = 1036, 
      }, 
      [110] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 45, 
         Arg1 = 1012, 
         Arg3 = 1036, 
      }, 
      [111] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 45, 
         Arg1 = 1012, 
         Arg3 = 1036, 
      }, 
      [112] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 45, 
         Arg1 = 1012, 
         Arg3 = 1036, 
      }, 
      [113] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg1 = 1006, 
         Arg3 = 1000, 
      }, 
      [114] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1005, 
         Arg3 = 10, 
      }, 
      [115] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1004, 
         Arg3 = 7, 
      }, 
      [116] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1002, 
         Arg3 = 14, 
      }, 
      [117] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1001, 
         Arg3 = 5, 
      }, 
      [118] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [119] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1006, 
         Arg3 = 9, 
      }, 
      [120] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1007, 
         Arg3 = 6, 
      }, 
      [121] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [122] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg1 = 1006, 
         Arg3 = 1000, 
      }, 
      [123] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1005, 
         Arg3 = 10, 
      }, 
      [124] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1004, 
         Arg3 = 7, 
      }, 
      [125] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1002, 
         Arg3 = 14, 
      }, 
      [126] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1001, 
         Arg3 = 5, 
      }, 
      [127] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [128] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1006, 
         Arg3 = 9, 
      }, 
      [129] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1007, 
         Arg3 = 6, 
      }, 
      [130] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 53, 
         Arg3 = 16, 
      }, 
      [131] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1010, 
         Arg3 = 1020, 
      }, 
      [132] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1002, 
         Arg3 = 14, 
      }, 
      [133] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1007, 
         Arg3 = 6, 
      }, 
      [134] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1003, 
         Arg3 = 12, 
      }, 
      [135] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1006, 
         Arg3 = 9, 
      }, 
      [136] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10424, 
         Arg3 = 17, 
      }, 
      [137] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28100, 
         Arg3 = 16, 
      }, 
      [138] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 18, 
         Arg1 = 1004, 
         Arg3 = 1020, 
      }, 
      [139] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 45, 
         Arg1 = 1012, 
         Arg3 = 1020, 
      }, 
      [140] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 20, 
         Arg1 = 1002, 
         Arg3 = 1020, 
      }, 
      [141] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 45, 
         Arg1 = 1012, 
         Arg3 = 1020, 
      }, 
      [142] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 59, 
         Arg3 = 16, 
      }, 
      [143] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1020, 
      }, 
      [144] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 18, 
         Arg1 = 1004, 
         Arg3 = 1018, 
      }, 
      [145] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 7, 
         Arg1 = 10509, 
         Arg3 = 1018, 
      }, 
      [146] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 46, 
         Arg1 = 1012, 
         Arg3 = 1018, 
      }, 
      [147] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 3, 
         Arg1 = 1006, 
         Arg3 = 1018, 
      }, 
      [148] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1011, 
         Arg3 = 1017, 
      }, 
      [149] = 
      {
         Command = "G", 
         Arg1 = 10313, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [150] = 
      {
         Command = "G", 
         Arg1 = 32253, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [151] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 18, 
         Arg1 = 1004, 
         Arg3 = 1017, 
      }, 
      [152] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 20, 
         Arg1 = 1002, 
         Arg3 = 1017, 
      }, 
      [153] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 18, 
         Arg1 = 1004, 
         Arg3 = 1017, 
      }, 
      [154] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 20, 
         Arg1 = 1002, 
         Arg3 = 1017, 
      }, 
      [155] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1017, 
      }, 
      [156] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 18, 
         Arg1 = 1004, 
         Arg3 = 1017, 
      }, 
      [157] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 46, 
         Arg1 = 1012, 
         Arg3 = 1017, 
      }, 
      [158] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 27, 
         Arg1 = 1005, 
         Arg3 = 1016, 
      }, 
      [159] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 1016, 
         Arg3 = 1016, 
      }, 
      [160] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 20, 
         Arg1 = 1002, 
         Arg3 = 1016, 
      }, 
      [161] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 20, 
         Arg1 = 1002, 
         Arg3 = 1016, 
      }, 
   }, 
   Rooms = 
   {
      [1024] = 
      {
         Description = "Way off to in the distant north you see another tinny little \
village which seems to be made in the same manor as the previous \
village, except this one has a smaller version of a dukha in the \
center. Probably a place for a different clan family to hold their\
own meetings that don't need the advice of the Dynast for such\
small family matters.\
", 
         TeleVnum = 0, 
         Vnum = 1024, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1025] = 
      {
         Description = "Way off to in the distant north you see another tinny little \
village which seems to be made in the same manor as the previous \
village, except this one has a smaller version of a dukha in the \
center. Probably a place for a different clan family to hold their\
own meetings that don't need the advice of the Dynast for such\
small family matters.\
", 
         TeleVnum = 0, 
         Vnum = 1025, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1026] = 
      {
         Description = "Way off to the distant north you see another tinny little\
village which seems to be made in the same manor as the previous\
village, except this one has a smaller version of a dukha in the\
center. Probably a place for a different clan family to hold their\
own meetings that don't need the advice of the Dynast for such\
small family matters.\
", 
         TeleVnum = 0, 
         Vnum = 1026, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Road Way", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1027, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1027] = 
      {
         Description = "Way off to the distant north you see another tinny little\
village which seems to be made in the same manor as the previous\
village, except this one has a smaller version of a dukha in the\
center. Probably a place for a different clan family to hold their\
own meetings that don't need the advice of the Dynast for such\
small family matters.\
", 
         TeleVnum = 0, 
         Vnum = 1027, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1028] = 
      {
         Description = "Way off to the distant north you see another tinny little\
village which seems to be made in the same manor as the previous\
village, except this one has a smaller version of a dukha in the\
center. Probably a place for a different clan family to hold their\
own meetings that don't need the advice of the Dynast for such\
small family matters.\
", 
         TeleVnum = 0, 
         Vnum = 1028, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1027, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1029, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1029] = 
      {
         Description = "The village road runs to the east right into the heart of the \
village itself. Much the same as the city of Nystao only there \
isn't as many huts and the Dukha isn't half as big as the Grand\
Dukha. The people of this village are just as curious as the\
people in the city if not more so, now you feel as though you have \
ten heads instead of the two you felt you had in the city since if\
there are visitors in the city there are almost none who venture\
to this small village\
", 
         TeleVnum = 0, 
         Vnum = 1029, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1030, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1030] = 
      {
         Description = "The village road runs to the east right into the heart of the \
village itself. Much the same as the city of Nystao only there \
isn't as many huts and the Dukha isn't half as big as the Grand\
Dukha. The people of this village are just as curious as the\
people in the city if not more so, now you feel as though you have \
ten heads instead of the two you felt you had in the city since if\
there are visitors in the city there are almost none who venture\
to this small village\
", 
         TeleVnum = 0, 
         Vnum = 1030, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1031, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1029, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1031] = 
      {
         Description = "The village road runs to the east right into the heart of the \
village itself. Much the same as the city of Nystao only there \
isn't as many huts and the Dukha isn't half as big as the Grand\
Dukha. The people of this village are just as curious as the\
people in the city if not more so, now you feel as though you have \
ten heads instead of the two you felt you had in the city since if\
there are visitors in the city there are almost none who venture\
to this small village\
", 
         TeleVnum = 0, 
         Vnum = 1031, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1030, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1032] = 
      {
         Description = "The village road runs to the east right into the heart of the \
village itself. Much the same as the city of Nystao only there \
isn't as many huts and the Dukha isn't half as big as the Grand\
Dukha. The people of this village are just as curious as the\
people in the city if not more so, now you feel as though you have \
ten heads instead of the two you felt you had in the city since if\
there are visitors in the city there are almost none who venture\
to this small village\
", 
         TeleVnum = 0, 
         Vnum = 1032, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1031, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1033] = 
      {
         Description = "The Dukha is covered with the history of the noghri people, hard to\
understand how to read it but it looks very beautiful, like\
hyroglyphs from an ancient city this one gives the entire history\
from further back then the clone wars. In the corner of the Dukha \
is a small thing that looks almost like a confession booth, only\
this is made from the same wood that the Dukha itself is made from.\
", 
         TeleVnum = 0, 
         Vnum = 1033, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Village Dukha", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 1047, 
               Distance = 0, 
               Keyword = "booth", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1034] = 
      {
         Description = "The village is off the the east and as you approach it you notice\
that it is almost an exact replica of the city, but as mentioned\
before, it is very small in size. Looking of to the supposed farm\
lands, you just notice that the fields are not filled with crops\
but with a strange looking brown grass, called Kholm grass, it\
has, from what you can see, over run the entire farm lands and has\
also rendered farming impossible. Some how the people are \
surviving without farms and live stock and you wonder how this is \
possible.\
", 
         TeleVnum = 0, 
         Vnum = 1034, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1035] = 
      {
         Description = "The village is off the the east and as you approach it you notice\
that it is almost an exact replica of the city, but as mentioned\
before, it is very small in size. Looking of to the supposed farm\
lands, you just notice that the fields are not filled with crops\
has, from what you can see, over run the entire farm lands and has\
also rendered farming impossible. Some how the people are \
surviving without farms and live stock and you wonder how this is \
possible.\
", 
         TeleVnum = 0, 
         Vnum = 1035, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1036] = 
      {
         Description = "The village is off the the east and as you approach it you notice\
that it is almost an exact replica of the city, but as mentioned\
before, it is very small in size. Looking of to the supposed farm\
lands, you just notice that the fields are not filled with crops\
but with a strange looking brown grass, called Kholm grass, it\
has, from what you can see, over run the entire farm lands and has\
also rendered farming impossible. Some how the people are \
surviving without farms and live stock and you wonder how this is \
possible.\
", 
         TeleVnum = 0, 
         Vnum = 1036, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1037] = 
      {
         Description = "The village is off the the east and as you approach it you notice\
that it is almost an exact replica of the city, but as mentioned\
before, it is very small in size. Looking of to the supposed farm\
lands, you just notice that the fields are not filled with crops\
but with a strange looking brown grass, called Kholm grass, it\
has, from what you can see, over run the entire farm lands and has\
also rendered farming impossible. Some how the people are \
surviving without farms and live stock and you wonder how this is \
possible.\
", 
         TeleVnum = 0, 
         Vnum = 1037, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1038] = 
      {
         Description = "The village is off the the east and as you approach it you notice\
that it is almost an exact replica of the city, but as mentioned\
before, it is very small in size. Looking of to the supposed farm\
lands, you just notice that the fields are not filled with crops\
but with a strange looking brown grass, called Kholm grass, it\
has, from what you can see, over run the entire farm lands and has\
also rendered farming impossible. Some how the people are \
surviving without farms and live stock and you wonder how this is \
possible.\
", 
         TeleVnum = 0, 
         Vnum = 1038, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1039, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1037, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1039] = 
      {
         Description = "The village is off the the east and as you approach it you notice\
that it is almost an exact replica of the city, but as mentioned\
before, it is very small in size. Looking of to the supposed farm\
lands, you just notice that the fields are not filled with crops\
but with a strange looking brown grass, called Kholm grass, it\
has, from what you can see, over run the entire farm lands and has\
also rendered farming impossible. Some how the people are \
surviving without farms and live stock and you wonder how this is \
possible.\
", 
         TeleVnum = 0, 
         Vnum = 1039, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1040] = 
      {
         Description = "The village is off the the east and as you approach it you notice\
that it is almost an exact replica of the city, but as mentioned\
before, it is very small in size. Looking of to the supposed farm\
lands, you just notice that the fields are not filled with crops\
but with a strange looking brown grass, called Kholm grass, it\
has, from what you can see, over run the entire farm lands and has\
also rendered farming impossible. Some how the people are \
possible.\
", 
         TeleVnum = 0, 
         Vnum = 1040, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Road", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1041, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1043, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1042, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1039, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 1046, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [6] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 1044, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [7] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 1045, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1041] = 
      {
         Description = "This hut, much like all the others, is very small and at the same\
time very comfortable. With a small fire burning in the centre fire\
pit it give the place a nice warm and very cozy feel and a nice \
spicey smell giving an even more pleasant and refreshing felling\
to the sences. The hut has almost nothing in it except for the \
sleeping hamocks the are lining the walls and the odd assortment of\
tools here and there. There is nothing here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1041, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1042] = 
      {
         Description = "This hut, much like all the others, is very small and at the same\
time very comfortable. With a small fire burning in the centre fire\
pit it give the place a nice warm and very cozy feel and a nice \
spicey smell giving an even more pleasant and refreshing felling\
to the sences. The hut has almost nothing in it except for the \
sleeping hamocks the are lining the walls and the odd assortment of\
tools here and there. There is nothing here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1042, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1043] = 
      {
         Description = "This hut, much like all the others, is very small and at the same\
time very comfortable. With a small fire burning in the centre fire\
pit it give the place a nice warm and very cozy feel and a nice \
spicey smell giving an even more pleasant and refreshing felling\
to the sences. The hut has almost nothing in it except for the \
sleeping hamocks the are lining the walls and the odd assortment of\
tools here and there. There is nothing here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1043, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1044] = 
      {
         Description = "This hut, much like all the others, is very small and at the same\
time very comfortable. With a small fire burning in the centre fire\
pit it give the place a nice warm and very cozy feel and a nice \
spicey smell giving an even more pleasant and refreshing felling\
to the sences. The hut has almost nothing in it except for the \
sleeping hamocks the are lining the walls and the odd assortment of\
tools here and there. There is nothing here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1044, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 1040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1045] = 
      {
         Description = "This hut, much like all the others, is very small and at the same\
time very comfortable. With a small fire burning in the centre fire\
pit it give the place a nice warm and very cozy feel and a nice \
spicey smell giving an even more pleasant and refreshing felling\
to the sences. The hut has almost nothing in it except for the \
sleeping hamocks the are lining the walls and the odd assortment of\
tools here and there. There is nothing here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1045, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 1040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1046] = 
      {
         Description = "This hut, much like all the others, is very small and at the same\
time very comfortable. With a small fire burning in the centre fire\
pit it give the place a nice warm and very cozy feel and a nice \
spicey smell giving an even more pleasant and refreshing felling\
to the sences. The hut has almost nothing in it except for the \
sleeping hamocks the are lining the walls and the odd assortment of\
tools here and there. There is nothing here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1046, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 1040, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1047] = 
      {
         Description = "The booth is very small and very cramped. It has a bench and a mesh screen\
that you can see into the Dukha from. You realize this would be a very\
good place to spy on the doings in the Dukha. \
", 
         TeleVnum = 0, 
         Vnum = 1047, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Inside the Booth", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 1033, 
               Distance = 0, 
               Keyword = "screen", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 1033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1048] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 1048, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Communications Booth", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1000, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1049, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [1049] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 1049, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Suggestions Board", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1048, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [1000] = 
      {
         Description = "You are standing in the Nystao Port. At any one point this \
port can have imperial troopers standing guard here,\
or the Grand Admiral Thrawn making his presence felt, or even\
The Dark Lord himself, Darth Vader, could be here letting the\
people of honoghr feel safe. The Noghri people are paying \
their debt to the empire. The Port has very\
few ships docked in its bays.\
", 
         TeleVnum = 0, 
         Vnum = 1000, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Nystao Port", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1048, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1001] = 
      {
         Description = "You are standing in the Nystao Port. At any one point this  port can have\
imperial troopers standing guard here, or the Grand Admiral Thrawn making\
his presence felt, or even The Dark Lord himself, Darth Vader, could be\
here letting the people of honoghr feel safe. The Noghri people are paying\
 their debt to the empire. The Port has very few ships docked in its bays.\
", 
         TeleVnum = 0, 
         Vnum = 1001, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Nystao Port", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1002, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1000, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1002] = 
      {
         Description = "With Nystao Port to the south you see to the east the Grand Dukha,\
where all the noghri hold meetings of great importance wether\
it be for punishment of a clan member or for farming news\
it all get told in that building. Farther off to the northeast \
it looks like a small village made of huts speard around in no\
specific pattern. Without a sound, the people of Honoghr pass by\
you looking at you and some of the children giggle at you as you\
look at them. Some of the young adults look at you as though you\
had two heads, since they very rarely get visitors here.\
", 
         TeleVnum = 0, 
         Vnum = 1002, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Road Way", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1003, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1003] = 
      {
         Description = "With Nystao Port to the southeast you see to the east the Grand Dukha,\
where all the noghri hold meetings of great importance wether\
it be for punishment of a clan member or for farming news\
it all get told in that building. Farther off to the northeast \
it looks like a small village made of huts speard around in no\
specific pattern. Without a sound, the people of Honoghr pass by\
you looking at you and some of the children giggle at you as you\
look at them. Some of the young adults look at you as though you\
had two heads, since they very rarely get visitors here.\
", 
         TeleVnum = 0, 
         Vnum = 1003, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Road Way", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1002, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1004] = 
      {
         Description = "With Nystao Port to the southeast you see to the east the Grand Dukha,\
where all the noghri hold meetings of great importance wether\
it be for punishment of a clan member or for farming news\
it all get told in that building. Farther off to the northeast \
it looks like a small village made of huts speard around in no\
specific pattern. Without a sound, the people of Honoghr pass by\
you looking at you and some of the children giggle at you as you\
look at them. Some of the young adults look at you as though you\
had two heads, since they very rarely get visitors here.\
", 
         TeleVnum = 0, 
         Vnum = 1004, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Road Way", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1003, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1005] = 
      {
         Description = "With Nystao to the southeast you see to the distant east\
the Grand Dukha, where all the noghri hold mettings of great\
importance wether it be for punishment of a clan member\
or for farming news it all gets told in that building. \
Farther to the northeast looks like a small village made\
of huts speard in no specific pattern. Without a sound \
the people of honoghr pass by you, looking at you and some\
of the children giggle at you as you look at them. Some of the \
younge adults look at you as though you had two heads, since \
they rarely get visitors here anyone new is going to get\
look at in a wierd way.\
", 
         TeleVnum = 0, 
         Vnum = 1005, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1006] = 
      {
         Description = "With Nystao to the southeast you see to the distant east\
the Grand Dukha, where all the noghri hold mettings of great\
importance wether it be for punishment of a clan member\
or for farming news it all gets told in that building. \
Farther to the northeast looks like a small village made\
of huts speard in no specific pattern. Without a sound \
the people of honoghr pass by you, looking at you and some\
of the children giggle at you as you look at them. Some of the \
younge adults look at you as though you had two heads, since \
they rarely get visitors here anyone new is going to get\
look at in a wierd way.\
", 
         TeleVnum = 0, 
         Vnum = 1006, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1007] = 
      {
         Description = "You have finaly reached the entrance to the Grand Dukha, doesn't seem to\
be in use at the moment, but, the Noghri are a very sneaky race\
and as far as you know, the place could be crawling with them.\
You see that the Grand Dukha is much bigger then all the other buildings \
that make up the villages.\
", 
         TeleVnum = 0, 
         Vnum = 1007, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 1008, 
               Distance = 0, 
               Keyword = "door", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 1021, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1008] = 
      {
         Description = "This is much larger the the normal clan Dukhas not only in size but\
in almost every other aspect. The walls and roof are made of a \
silver-blue metal instead of wood, with no carvings of any sort on\
there surface. The supporting pillars are black, metal or worked\
stone, you can't tell which. A wide set of black-and-red-marbled\
steps lead up to a grey flagstone entrance terrace outside the \
double doors.\
", 
         TeleVnum = 0, 
         Vnum = 1008, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Grand Dukha", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 1007, 
               Distance = 0, 
               Keyword = "door", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1009, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1009] = 
      {
         Description = "This is much larger the the normal clan Dukhas not only in size but\
in almost every other aspect. The walls and roof are made of a \
silver-blue metal instead of wood, with no carvings of any sort on\
there surface. The supporting pillars are black, metal or worked\
stone, you can't tell which. A wide set of black-and-red-marbled\
steps lead up to a grey flagstone entrance terrace outside the \
double doors.\
", 
         TeleVnum = 0, 
         Vnum = 1009, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Grand Dukha", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1010, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1010] = 
      {
         Description = "This is much larger the the normal clan Dukhas not only in size but\
in almost every other aspect. The walls and roof are made of a \
silver-blue metal instead of wood, with no carvings of any sort on\
there surface. The supporting pillars are black, metal or worked\
stone, you can't tell which. A wide set of black-and-red-marbled\
steps lead up to a grey flagstone entrance terrace outside the \
double doors.\
", 
         TeleVnum = 0, 
         Vnum = 1010, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Grand Dukha", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1009, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1011] = 
      {
         Description = "This is much larger the the normal clan Dukhas not only in size but\
in almost every other aspect. The walls and roof are made of a \
silver-blue metal instead of wood, with no carvings of any sort on\
there surface. The supporting pillars are black, metal or worked\
stone, you can't tell which. A wide set of black-and-red-marbled\
steps lead up to a grey flagstone entrance terrace outside the \
double doors.\
", 
         TeleVnum = 0, 
         Vnum = 1011, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Grand Dukha", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1010, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1012] = 
      {
         Description = "With the Grand Dukha to the south and the port to the southwest, you \
start to head into the village. Its nothing really special, since \
its made up of mostly huts and nothing else except for the \
bakery and a supply hut there is nothing in this village that\
makes it really stand out. Since the Noghri were basicly\
forced into a technology they had no use for before, they\
have only partialy adopted it into their farming and for their\
guarding of they Grand Dukha and the port, other then that the Noghri\
are a very low-tech race of people.\
", 
         TeleVnum = 0, 
         Vnum = 1012, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1020, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1013] = 
      {
         Description = "With the Grand Dukha to the south and the port to the southwest, you \
start to head into the village. Its nothing really special, since \
its made up of mostly huts and nothing else except for the \
bakery and a supply hut there is nothing in this village that\
makes it really stand out. Since the Noghri were basicly\
forced into a technology they had no use for before, they\
have only partialy adopted it into their farming and for their\
guarding of they Grand Dukha and the port, other then that the Noghri\
are a very low-tech race of people.\
", 
         TeleVnum = 0, 
         Vnum = 1013, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1018, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1014] = 
      {
         Description = "With the Grand Dukha to the south and the port to the southwest, you \
start to head into the village. Its nothing really special, since \
its made up of mostly huts and nothing else except for the \
bakery and a supply hut there is nothing in this village that\
makes it really stand out. Since the Noghri were basicly\
forced into a technology they had no use for before, they\
have only partialy adopted it into their farming and for their\
guarding of they Grand Dukha and the port, other then that the Noghri\
are a very low-tech race of people.\
", 
         TeleVnum = 0, 
         Vnum = 1014, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1015] = 
      {
         Description = "The hut is very small, but it is, at the same time, very cozy. \
With a small fire burning in the fire pit located in the middle \
of the hut give the room a nice warmth as well as a slight spicey\
smell which makes it all the more refeshing to the sences. The\
hut has almost nothing in it, except fot the sleeping hamocks\
lining the walls and the odd tool here and there, there is nothing\
here worth while.\
 \
You can safely quit here.\
 \
", 
         TeleVnum = 0, 
         Vnum = 1015, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Noghri Guest House", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1016] = 
      {
         Description = "The hut is very small, but it is, at the same time, very cozy. \
With a small fire burning in the fire pit located in the middle \
of the hut give the room a nice warmth as well as a slight spicey\
smell which makes it all the more refeshing to the sences. The\
hut has almost nothing in it, except fot the sleeping hamocks\
lining the walls and the odd tool here and there, there is nothing\
here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1016, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hut", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1017] = 
      {
         Description = "The cook hous is almost exactly the same as the huts except for one\
difference it sells food. Just like the other huts it has a small fire\
burning in a fire pit and a cauldron of sorts hanging in the middle. No\
Hamocks line this hut, but it is lined with the carcasus of the local live\
stock and other wild animals the noghri cook happend to have had the luck\
of stumbling across. Strangly enough though it also has some imported\
foods, from somewhere.\
", 
         TeleVnum = 0, 
         Vnum = 1017, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Cook House", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1018] = 
      {
         Description = "The hut is very small, but it is, at the same time, very cozy. \
With a small fire burning in the fire pit located in the middle \
of the hut give the room a nice warmth as well as a slight spicey\
smell which makes it all the more refeshing to the sences. The\
hut has almost nothing in it, except fot the sleeping hamocks\
lining the walls and the odd tool here and there, there is nothing\
here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1018, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Hut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1019] = 
      {
         Description = "The hut is very small, but it is, at the same time, very cozy. \
With a small fire burning in the fire pit located in the middle \
of the hut give the room a nice warmth as well as a slight spicey\
smell which makes it all the more refeshing to the sences. The\
hut has almost nothing in it, except fot the sleeping hamocks\
lining the walls and the odd tool here and there, there is nothing\
here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1019, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Hut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1020] = 
      {
         Description = "The hut is very small, but it is, at the same time, very cozy. \
With a small fire burning in the fire pit located in the middle \
of the hut give the room a nice warmth as well as a slight spicey\
smell which makes it all the more refeshing to the sences. The\
lining the walls and the odd tool here and there, there is nothing\
here worth while.\
", 
         TeleVnum = 0, 
         Vnum = 1020, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Hut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1021] = 
      {
         Description = "Way off to in the distant north you see another tinny little \
village which seems to be made in the same manor as the previous \
village, except this one has a smaller version of a dukha in the \
center. Probably a place for a different clan family to hold their\
own meetings that don't need the advice of the Dynast for such\
small family matters.\
", 
         TeleVnum = 0, 
         Vnum = 1021, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 1007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1022] = 
      {
         Description = "Way off to in the distant north you see another tinny little \
village which seems to be made in the same manor as the previous \
village, except this one has a smaller version of a dukha in the \
center. Probably a place for a different clan family to hold their\
own meetings that don't need the advice of the Dynast for such\
small family matters.\
", 
         TeleVnum = 0, 
         Vnum = 1022, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 1021, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 1023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [1023] = 
      {
         Description = "Way off to in the distant north you see another tinny little \
village which seems to be made in the same manor as the previous \
village, except this one has a smaller version of a dukha in the \
center. Probably a place for a different clan family to hold their\
own meetings that don't need the advice of the Dynast for such\
small family matters.\
", 
         TeleVnum = 0, 
         Vnum = 1023, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Road Way", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 1024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 1022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 5, 
         High = 103, 
      }, 
      Soft = 
      {
         Low = 5, 
         High = 103, 
      }, 
   }, 
   Objects = 
   {
      [1000] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
            [2] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
            [3] = 
            {
               Location = 32, 
               Modifier = 5, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "dagger", 
         Vnum = 1000, 
         Weight = 1, 
         Description = "A dagger is collecting dust here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "a finely crafted dagger", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 6, 
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
      [1001] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 37, 
               Modifier = 3, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "chest plate camo", 
         Vnum = 1001, 
         Weight = 3, 
         Description = "A well hidden chest plate is here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "camoflage chest plate", 
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
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 500, 
      }, 
      [1002] = 
      {
         ActionDescription = "", 
         Name = "wrist sheath", 
         Vnum = 1002, 
         Weight = 1, 
         Description = "A wierd looking sheath has been left here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "a wrist sheath", 
         Layers = 2, 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 12, 
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
      [1003] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 37, 
               Modifier = 10, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "robe noghri brown", 
         Vnum = 1003, 
         Weight = 1, 
         Description = "A small brown robe has been dumped here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "brown noghri robe", 
         Layers = 16, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 60, 
      }, 
      [1004] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 37, 
               Modifier = 4, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "leg camo guards", 
         Vnum = 1004, 
         Weight = 1, 
         Description = "On the ground you barly notice some leg guards.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "camoflage leg guards", 
         Layers = 8, 
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
            [5] = "Legs", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 450, 
      }, 
      [1005] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 37, 
               Modifier = 3, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "camo arm guards", 
         Vnum = 1005, 
         Weight = 2, 
         Description = "You barely notice a pair of arm guards on the ground.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "camoflage arm guards", 
         Layers = 8, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 250, 
      }, 
      [1006] = 
      {
         ActionDescription = "", 
         Name = "leather gloves pair", 
         Vnum = 1006, 
         Weight = 1, 
         Description = "Two leather gloves are lying on the ground.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "a pair of leather gloves", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
      }, 
      [1007] = 
      {
         ActionDescription = "", 
         Name = "hood brown", 
         Vnum = 1007, 
         Weight = 1, 
         Description = "A small piece of cloth is blowing around here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "a brown hood", 
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
         Cost = 10, 
      }, 
      [1008] = 
      {
         ActionDescription = "", 
         Name = "booth", 
         Vnum = 1008, 
         Weight = 1, 
         ShortDescr = "a booth", 
         Description = "A booth is here.", 
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
      [1009] = 
      {
         ActionDescription = "", 
         Name = "assassin dagger", 
         Vnum = 1009, 
         Weight = 1, 
         Description = "A fine blade has been carelessly droped here.", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "an assassin's dagger", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 13, 
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
      [1010] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 35, 
               Modifier = -10, 
            }, 
            [2] = 
            {
               Location = 48, 
               Modifier = -20, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "&z chest plate", 
         Vnum = 1010, 
         Weight = 1, 
         Description = "&za chest plate was dropped here", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&za chest plate&R&w", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1000, 
      }, 
      [1011] = 
      {
         ActionDescription = "", 
         Name = "arm brace", 
         Vnum = 1011, 
         Weight = 1, 
         Description = "&za set of arm braces", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&za set of arm braces&R&w", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 40, 
      }, 
      [1012] = 
      {
         ActionDescription = "", 
         Name = "hand plates", 
         Vnum = 1012, 
         Weight = 3, 
         Description = "&z hand plates&R&w", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&z hand plates&R&w", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
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
      [1013] = 
      {
         ActionDescription = "", 
         Name = "a pair of boots", 
         Vnum = 1013, 
         Weight = 3, 
         Description = "&za pair of boots&R&w", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&za pair of boots&R&w", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [1014] = 
      {
         ActionDescription = "", 
         Name = "a pair of shoulder plates", 
         Vnum = 1014, 
         Weight = 3, 
         Description = "&za pair of shoulder plates&R&w", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&za pair of shoulder plates&R&w", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 6, 
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
      [1015] = 
      {
         ActionDescription = "", 
         Name = "an ammo belt", 
         Vnum = 1015, 
         Weight = 3, 
         Description = "&zan ammo belt&R&w", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&zan ammo belt&R&w", 
         Layers = 0, 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5000, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [1016] = 
      {
         ActionDescription = "", 
         Name = "a pair of leg plates", 
         Vnum = 1016, 
         Weight = 6, 
         Description = "&za pair of leg plates&R&w", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&za pair of leg plates&R&w", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [1017] = 
      {
         ActionDescription = "", 
         Name = "a helmet", 
         Vnum = 1017, 
         Weight = 5, 
         Description = "&za helmet &R&W", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&za helmet &R&w", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
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
      [1018] = 
      {
         ActionDescription = "", 
         Name = "a pair of gloves", 
         Vnum = 1018, 
         Weight = 3, 
         Description = "&za pair of gloves&R&w", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&za pair of gloves&R&w", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [1019] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = -5, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "a backpack", 
         Vnum = 1019, 
         Weight = 6, 
         Description = "&za backpack", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         ShortDescr = "&za backpack&R&w", 
         Layers = 0, 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [1099] = 
      {
         ActionDescription = "", 
         Name = "blaster ", 
         Vnum = 1099, 
         Weight = 1, 
         ShortDescr = "a newly created blaster ", 
         Description = "Some god dropped a newly created blaster  here.", 
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
   }, 
   HighEconomy = 0, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 1099, 
         First = 1000, 
      }, 
      Room = 
      {
         Last = 1049, 
         First = 1000, 
      }, 
      Object = 
      {
         Last = 1099, 
         First = 1000, 
      }, 
   }, 
   ResetFrequency = 0, 
   ResetMessage = "A warm breeze blows through the kholm grass.", 
   FileFormatVersion = 1, 
   LowEconomy = 9801790, 
   Author = "Thrawn", 
}
