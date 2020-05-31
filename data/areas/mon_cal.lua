-- Mon Calamri
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   Filename = "mon_cal.lua", 
   HighEconomy = 0, 
   LowEconomy = 187437351, 
   Mobiles = 
   {
      [21000] = 
      {
         Alignment = 1000, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "healer jedi saint", 
         Level = 50, 
         ShortDescr = "elderly saint", 
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
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [2] = "_02", 
            [0] = "parry", 
            [8] = "_08", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 500, 
            HitPlus = 300, 
            HitNoDice = 25, 
         }, 
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
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [0] = "basic", 
            }, 
         }, 
         LongDescr = "A elderly saint wearing only a dark robe wanders here.\
", 
         Vnum = 21000, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21001] = 
      {
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "Anikem the shopkeeper", 
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
         Alignment = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "smile\
nod\
' ahh the rare corusca crystal is what you seek \
' the only one i know of was given to a young jedi by Master Luke.\
' Seek him out if you seek that crystal.\
smile $n\
", 
               MudProgType = "speech_prog", 
               Arguments = "corusca", 
            }, 
         }, 
         Race = "Quarren", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 100, 
            DamSizeDice = 100, 
            DamNoDice = 20, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "Anakiem shopkeeper", 
         Level = 50, 
         ShortDescr = "Anikem the shopkeeper", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 4, 
         ArmorClass = -300, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 34, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 6, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
         }, 
         LongDescr = "Anakiem the shopkeeper stands here.\
", 
         Vnum = 21001, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21002] = 
      {
         RepairShop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitFix = 120, 
            ShopType = 1, 
            KeeperShortDescr = "the repair tech", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
         }, 
         Alignment = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say hello, if you don't have a weapon for me to repair please leave I'm\
mpecho busy!\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "mpecho You hear loud bangs as Torval hammers out dents in the\
mpecho weapons\
", 
               MudProgType = "rand_prog", 
               Arguments = "10 ", 
            }, 
         }, 
         Race = "Twi'lek", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 1000, 
            DamSizeDice = 1, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "Torval repair", 
         Level = 50, 
         ShortDescr = "the repair tech", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = -300, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [2] = "twileki", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "Torval the repir tech works on armor.\
", 
         Vnum = 21002, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21003] = 
      {
         Alignment = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the spice dealer", 
            ProfitBuy = 115, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Race = "Wookiee", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 100, 
            DamSizeDice = 5, 
            DamNoDice = 4, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "Shana spice dealer", 
         Level = 50, 
         ShortDescr = "the spice dealer", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 6, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         LongDescr = "The Rodian spice dealer stands behind the counter.\
", 
         Vnum = 21003, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21004] = 
      {
         Alignment = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the Shuttleee", 
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
         Race = "Wookiee", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 100, 
            DamSizeDice = 5, 
            DamNoDice = 4, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "Shuttleee", 
         Level = 50, 
         ShortDescr = "the Shuttleee", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 6, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         LongDescr = "The Shuttleee sits here.\
", 
         Vnum = 21004, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21006] = 
      {
         Damage = 
         {
            DamPlus = 20, 
            DamSizeDice = 1, 
            DamNoDice = 1, 
         }, 
         Alignment = -1000, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
         }, 
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
         Susceptible = 
         {
            [0] = "fire", 
            [5] = "pierce", 
         }, 
         Height = 0, 
         Name = "guildmaster", 
         Level = 50, 
         ShortDescr = "skill teacher", 
         AttackFlags = 
         {
            [12] = "_12", 
            [20] = "_20", 
            [6] = "_06", 
            [11] = "_11", 
         }, 
         Resistant = 
         {
            [1] = "cold", 
            [4] = "blunt", 
            [20] = "magic", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "The skill teacher awaits a student.\
", 
         Vnum = 21006, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21007] = 
      {
         Alignment = 1000, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Mon Calamrian doll", 
         Level = 1, 
         ShortDescr = "the Calamrian doll", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
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
            [1] = "cold", 
            [2] = "electricity", 
            [3] = "energy", 
            [4] = "blunt", 
            [5] = "pierce", 
            [6] = "slash", 
            [7] = "acid", 
            [8] = "poison", 
            [9] = "drain", 
            [10] = "sleep", 
            [11] = "charm", 
            [12] = "hold", 
            [13] = "nonmagic", 
            [14] = "plus1", 
            [15] = "plus2", 
            [16] = "plus3", 
            [17] = "plus4", 
            [18] = "plus5", 
            [19] = "plus6", 
            [20] = "magic", 
            [21] = "paralysis", 
            [0] = "fire", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 100, 
            HitNoDice = 1, 
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
         LongDescr = "A Calamrian doll hangs limply here.\
", 
         Vnum = 21007, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21009] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the Builder", 
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
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "Ship builder", 
         Level = 50, 
         ShortDescr = "the Builder", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "A Builder offers you his selection of Mon made ships.\
", 
         Vnum = 21009, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21010] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "waitress", 
         Level = 50, 
         ShortDescr = "the waitress", 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the waitress", 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "The cute Calamrian waitress awaits your order.\
", 
         Vnum = 21010, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21011] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "printer", 
         Level = 50, 
         ShortDescr = "the printer", 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the printer", 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
               [5] = "mon calamarian", 
            }, 
         }, 
         LongDescr = "A thin Calamrian printer sits behind a stack of papers.\
", 
         Vnum = 21011, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21012] = 
      {
         Alignment = 1000, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamPlus = 800, 
            DamSizeDice = 5, 
            DamNoDice = 100, 
         }, 
         Name = "Shuttleer father", 
         Level = 50, 
         ShortDescr = "the Guild Father", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "The Guild's Shuttleer meditates here.\
\
", 
         Vnum = 21012, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21013] = 
      {
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the bartender Monei", 
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
         Alignment = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpemote You hear the bartender say, \"I wish those dman vendors would shut\
up!\"\
", 
               MudProgType = "rand_prog", 
               Arguments = "10 ", 
            }, 
            [2] = 
            {
               Code = "Say Pull up a chair and have a drink, we only live once ya know.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 800, 
            DamSizeDice = 100, 
            DamNoDice = 5, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "Monei bartender", 
         Level = 50, 
         ShortDescr = "the bartender Monei", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "Monei the bartender stands behind his counter.\
", 
         Vnum = 21013, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21014] = 
      {
         Alignment = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "Joyta, Mon Calamarian Jewler", 
            ProfitBuy = 95, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Sorry those are not for sale, protected by the governement.\
say Shhhh , I hear there are more in the ocean, get me one and I'll pay you\
a high\
price.\
say but you didn't here that from me.\
", 
               MudProgType = "speech_prog", 
               Arguments = "ultima pearl ultima_pearl", 
            }, 
            [2] = 
            {
               Code = "Yell Come in , I've got the best Jewlery in the Galexy!\
", 
               MudProgType = "rand_prog", 
               Arguments = "5 ", 
            }, 
            [3] = 
            {
               Code = "Say Hello $n in the mood for buying some Jewlery?\
", 
               MudProgType = "speech_prog", 
               Arguments = "hi hello ", 
            }, 
            [4] = 
            {
               Code = "Say Good come take a look at my display!\
", 
               MudProgType = "speech_prog", 
               Arguments = "yes", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "jeweler", 
         Level = 50, 
         ShortDescr = "Joyta, Mon Calamarian Jewler", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&C Joyta, Mon Calamarian Jewler displays here jems in the case.\
", 
         Vnum = 21014, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21015] = 
      {
         RepairShop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitFix = 100, 
            ShopType = 1, 
            KeeperShortDescr = "the Rax armourer", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
         }, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the Rax armourer", 
            ProfitBuy = 130, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Alignment = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Welcome $n Heard you were in town.\
say If you want any equipment just tell me.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 1000, 
            DamSizeDice = 1, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "rax armourer", 
         Level = 50, 
         ShortDescr = "the Rax armourer", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "Rax the armourer is here fitting a Mon Calamrian  helm.\
", 
         Vnum = 21015, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21016] = 
      {
         Alignment = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the Bonta weaponsmith", 
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
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Welcome to my shop care to buy a weapon?\
mpecho Bonta grins at you evily.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "bonta weaponsmith", 
         Level = 50, 
         ShortDescr = "the Bonta weaponsmith", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "The weaponsmith Bonta, labors over a lengthy blade.\
", 
         Vnum = 21016, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21017] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "postmaster", 
         Level = 50, 
         ShortDescr = "the postmaster", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "The postmaster sorts the day's mail.\
", 
         Vnum = 21017, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21018] = 
      {
         Alignment = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the chef Wannie", 
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
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Yell Barbecue, fresh and hot, falls of the bones. \
", 
               MudProgType = "rand_prog", 
               Arguments = "5 ", 
            }, 
            [2] = 
            {
               Code = "Say Hello just step right up and get my galexy famous barbecue.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 800, 
            DamSizeDice = 1, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "chef", 
         Level = 50, 
         ShortDescr = "the chef Wannie", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "A chef Wannie greets you.\
", 
         Vnum = 21018, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21019] = 
      {
         Alignment = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the baker", 
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
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Yell Fresh Hot Seaweed Bread, Get it while it's Hot!\
", 
               MudProgType = "rand_prog", 
               Arguments = "5", 
            }, 
            [2] = 
            {
               Code = "say Welcome to my shop when you want to buy just yell!\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 500, 
            DamSizeDice = 1, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "baker", 
         Level = 50, 
         ShortDescr = "the baker", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "The Mon Calamarian baker is here, covered with seaweed flour.\
", 
         Vnum = 21019, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21020] = 
      {
         Alignment = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the Mon Calamrian girl", 
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
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Hello, can I intrest you in anything?\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "Say Noy noe $n I'm working...maybe later!\
stare $n\
", 
               MudProgType = "speech_prog", 
               Arguments = "sex you fuck", 
            }, 
            [3] = 
            {
               Code = "Yell Fresh blue seacow milk, get it while it's here.\
", 
               MudProgType = "rand_prog", 
               Arguments = "5", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "Mon Calamrian girl", 
         Level = 100, 
         ShortDescr = "the Mon Calamrian girl", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 20, 
         ArmorClass = -150, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 20, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 20, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "A young Mon Calamarian girl smiles as you enter.\
", 
         Vnum = 21020, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21021] = 
      {
         Alignment = 0, 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "&z Lokist the tailor", 
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
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 100, 
            DamSizeDice = 5, 
            DamNoDice = 4, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "Lokist tailor", 
         Level = 50, 
         ShortDescr = "&z Lokist the tailor", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 6, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&z Lokist the tailor is here showing off the latest fashion.\
", 
         Vnum = 21021, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21022] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 100, 
            DamSizeDice = 5, 
            DamNoDice = 4, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "bantha keeper", 
         Level = 50, 
         ShortDescr = "the bantha keeper", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 6, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "The bantha keeper tends to his animals.\
", 
         Vnum = 21022, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21023] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "thief master", 
         Level = 50, 
         ShortDescr = "the Master Thief", 
         AttackFlags = 
         {
            [6] = "_06", 
            [9] = "_09", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [19] = "disarm", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "A master thief is here to demonstrate the ways of thievery.\
", 
         Vnum = 21023, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21025] = 
      {
         RepairShop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitFix = 100, 
            ShopType = 1, 
            KeeperShortDescr = "the hotel keeper", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
         }, 
         Alignment = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Welcome $n your room awaits.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "if inroom($i) == 21069\
  say Go on back and pick a room.\
  , points over his shoulder.\
  mptransfer $n 21146\
  mpat $n mea $n The hotel keeper points you down the hall.\
  mpat $n say When you wan'na leave, just tell me. And don't mess up the sheets\
  mppurge coins\
endif\
", 
               MudProgType = "bribe_prog", 
               Arguments = "200", 
            }, 
            [3] = 
            {
               Code = "if inroom($i) == 21146\
if inroom($n) == 21146\
  mptransfer $n 21069\
  mpat $n mea $n The hotel keeper leads you out.\
endif\
endif\
", 
               MudProgType = "speech_prog", 
               Arguments = "leave exit", 
            }, 
            [4] = 
            {
               Code = "Say Welcome $n your room awits you.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "", 
            }, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 1000, 
            DamSizeDice = 15, 
            DamNoDice = 100, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "hotel keeper", 
         Level = 50, 
         ShortDescr = "the hotel keeper", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 4, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "The hotel keeper stands here, looking rather gruff.\
", 
         Vnum = 21025, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21028] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamPlus = 800, 
            DamSizeDice = 5, 
            DamNoDice = 100, 
         }, 
         Name = "sage man", 
         Level = 50, 
         ShortDescr = "the sage", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "A pensive sage mulls over new Jedi's .\
", 
         Vnum = 21028, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21029] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
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
         Damage = 
         {
            DamPlus = 1000, 
            DamSizeDice = 10, 
            DamNoDice = 100, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "storekeeper", 
         Level = 50, 
         ShortDescr = "the storekeeper", 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "the storekeeper", 
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
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 4, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [14] = "gamorrese", 
            }, 
         }, 
         LongDescr = "A large man stands here, selling equipment for adventurers.\
", 
         Vnum = 21029, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21031] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamPlus = 800, 
            DamSizeDice = 5, 
            DamNoDice = 100, 
         }, 
         Name = "man ranger", 
         Level = 50, 
         ShortDescr = "the ranger Shuttleer", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "The ranger Shuttleer demonstrates combat maneuvers.\
", 
         Vnum = 21031, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21416] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "newbie mob", 
         Level = 1, 
         ShortDescr = "a newly created newbie mob", 
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
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         Vnum = 21416, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21034] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamPlus = 1000, 
            DamSizeDice = 10, 
            DamNoDice = 100, 
         }, 
         Name = "woman Shuttleer", 
         Level = 50, 
         ShortDescr = "the officers Shuttleer", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 4, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "A robed woman is here, Shuttleing initiate officers.\
", 
         Vnum = 21034, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21035] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamPlus = 800, 
            DamSizeDice = 100, 
            DamNoDice = 5, 
         }, 
         Name = "man Shuttleer", 
         Level = 50, 
         ShortDescr = "the Warrior Shuttleer", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 5, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "A giant man stands here, waiting to Shuttle young warriors.\
", 
         Vnum = 21035, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21420] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho $n $I quickly tucks the coins inside his pocket, stepping toward\
$n.\
say $n 'I took this from a Mon Calamrian... a weak, sniveling Calamrian I\
was to kill\
mpecho He continues, 'He traded me this artifact in exchange for his\
life.'\
mpecho The figure says, 'Lucky was he the Bounty on his head was\
low...'\
mpecho The figure says, 'you seem to be trustworthy ...Forget about the\
Mon's..\
mpecho The figure says, 'Join the underground world and the\
Empire.....'\
mpecho He produces a strange, tied hologram from his\
pocket.\
mpoload 21420\
give hologram $n\
mpjunk all.credits\
mpjunk all.hologram\
say good...doing business with you, $n\
hide\
", 
               MudProgType = "bribe_prog", 
               Arguments = "45000", 
            }, 
            [2] = 
            {
               Code = "if isnpc($n)\
else\
  mpechoat $n A man hidden in the shadows beckons you over to him.\
  tell $n I have some information which may be of some value...\
  tell $n And for a price I will perhaps share it with you.\
endif\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "25", 
            }, 
            [3] = 
            {
               Code = "if isnpc($n)\
else\
  mpechoat $n The dark figure stares unflinchingly into your eyes.\
  mpechoaround $n $I draws close to $n and says something.\
    mpechoat $n $I matter-of-factly says, '200 credits.'\
endif\
", 
               MudProgType = "speech_prog", 
               Arguments = "p how much", 
            }, 
            [4] = 
            {
               Code = "if isnpc($n)\
else\
  mpechoat $n The dark figure stares unflinchingly into your eyes.\
  mpechoaround $n $I draws close to $n and says something.\
   mpechoat $n $I matter-of-factly says, '200 credits.'\
endif\
", 
               MudProgType = "speech_prog", 
               Arguments = "p what price", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "dark figure bounty hunter", 
         Level = 10, 
         ShortDescr = "the bounty hunter", 
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
         Height = 0, 
         Description = "A dark Mon Calamrian stands before you, seemingly wearing the shadows around him\
like a cloak.  His gaze bores into your soul, and he appears to beckon\
you over to speak with him.  The glint of a blaster by his side alerts you\
that this man is probably bounty hunter.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 1, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 200, 
            HitNoDice = 1, 
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
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "A dark figure lurks here, hiding in the shadows.\
", 
         Vnum = 21420, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21037] = 
      {
         Alignment = 1000, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamPlus = 20, 
            DamSizeDice = 1, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "guard man", 
         Level = 15, 
         ShortDescr = "the guard", 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "A Mon Calamrian guard patrols the streets of the city.\
", 
         Vnum = 21037, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21041] = 
      {
         Alignment = 1000, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "guard", 
         Level = 5, 
         ShortDescr = "the guard", 
         Damage = 
         {
            DamPlus = 3, 
            DamSizeDice = 3, 
            DamNoDice = 2, 
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
         ArmorClass = 90, 
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
         Credits = 100, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 20, 
            HitNoDice = 1, 
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
         LongDescr = "A tired guard is here.\
", 
         Vnum = 21041, 
         Position = "sleeping", 
         Sex = "male", 
      }, 
      [21043] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Name = "E-web guard", 
         Level = 15, 
         ShortDescr = "the guard", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 500, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "A E-Web guard stares out over the area.\
", 
         Vnum = 21043, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21044] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 800, 
            DamSizeDice = 1, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "executioner", 
         Level = 50, 
         ShortDescr = "the Executioner", 
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
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [2] = "DetectEvil", 
            [3] = "DetectInvis", 
            [13] = "Protect", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [7] = "Sanctuary", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 4, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "A executioner stands silently before you.\
", 
         Vnum = 21044, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21045] = 
      {
         Alignment = 0, 
         Race = "Yevetha", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Name = "dog stray", 
         Level = 5, 
         ShortDescr = "a stray", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 5, 
            DamNoDice = 2, 
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
         ArmorClass = 100, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 35, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [9] = "antarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [18] = "_clan", 
               [19] = "adarese", 
               [21] = "defel", 
               [22] = "dosh", 
               [24] = "quarrenese", 
               [9] = "antarian", 
               [29] = "gand", 
               [30] = "durese", 
            }, 
         }, 
         LongDescr = "A stray Mosny dog noses along the street.\
", 
         Vnum = 21045, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21431] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Damage = 
         {
            DamPlus = 1000, 
            DamSizeDice = 10, 
            DamNoDice = 100, 
         }, 
         Name = "kinalsta man", 
         Level = 51, 
         ShortDescr = "Kinalsta", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
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
         LongDescr = "A proud man stands here, deliberating over his theories.\
", 
         Vnum = 21431, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21433] = 
      {
         Alignment = 40, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You hear the sweat sounds of a guard snoring.\
say &c ZZZZZZZZZZzzzzzzzzzz    ZZZZZZZZZZZZZzzzzzzzzzz\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         Name = "guard sleeping", 
         Level = 49, 
         ShortDescr = "A sleeping Security Guard", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
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
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
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
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         LongDescr = "A sleeping Security Guard rests here.\
", 
         Vnum = 21433, 
         Position = "incapacitated", 
         Sex = "undistinguished", 
      }, 
      [21434] = 
      {
         Alignment = -750, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Well, well you do have money! Have a good time.\
mptransfer $n 21071\
", 
               MudProgType = "bribe_prog", 
               Arguments = "200", 
            }, 
            [2] = 
            {
               Code = "Say Please state your emergency, I'm busy here.\
mpecho You see the secretary return to watching\
\
mpecho her favorite soap.\
", 
               MudProgType = "speech_prog", 
               Arguments = "hi hello", 
            }, 
            [3] = 
            {
               Code = "Say Ya ya ya take a number $n.\
Say please fill out these forms and give me 200 credits for the\
say apointment.\
", 
               MudProgType = "speech_prog", 
               Arguments = "hurt sick injured bleeding emergency ", 
            }, 
            [4] = 
            {
               Code = "Say Sorry we have paying customers here. Move along!\
", 
               MudProgType = "speech_prog", 
               Arguments = "insurance poor money broke", 
            }, 
         }, 
         Name = "woman sec secretary female", 
         Level = 1, 
         ShortDescr = "A female Secretary ", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
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
            [1] = "cold", 
            [2] = "electricity", 
            [3] = "energy", 
            [4] = "blunt", 
            [5] = "pierce", 
            [6] = "slash", 
            [7] = "acid", 
            [8] = "poison", 
            [9] = "drain", 
            [10] = "sleep", 
            [11] = "charm", 
            [12] = "hold", 
            [13] = "nonmagic", 
            [14] = "plus1", 
            [15] = "plus2", 
            [16] = "plus3", 
            [17] = "plus4", 
            [18] = "plus5", 
            [19] = "plus6", 
            [20] = "magic", 
            [21] = "paralysis", 
            [0] = "fire", 
         }, 
         Weight = 0, 
         Credits = 1, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 100, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "A Mon Calamrian Secretary sits here doing important things.\
\
", 
         Vnum = 21434, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21435] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "mon nurse", 
         Level = 51, 
         ShortDescr = "&P A Mon Calamarian Nurse", 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "&P A Mon Calamarian Nurse", 
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
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 10, 
         ArmorClass = -27, 
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
            HitPlus = 510, 
            HitNoDice = 10, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         LongDescr = "&P A Mon Calamarian Nurse sorts through medical supplies.\
", 
         Vnum = 21435, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21052] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_thief", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho From behind the shadows you can feel somone lighten your pockets.\
mpforce $n give 25 credits thief\
mpecho You turn around and see noone.\
", 
               MudProgType = "greet_prog", 
               Arguments = "29", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 5, 
            DamSizeDice = 2, 
            DamNoDice = 3, 
         }, 
         Name = "thief figure", 
         Level = 8, 
         ShortDescr = "the thief", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         Resistant = 
         {
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [15] = "Sneak", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 40, 
            HitPlus = 50, 
            HitNoDice = 3, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
         }, 
         LongDescr = "A strange figure lurks furtively.\
", 
         Vnum = 21052, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21437] = 
      {
         Alignment = 40, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You hear the soft sounds of ZZZZZZZZZzzzzzzzz coming from the shop\
mpecho keeper!\
", 
               MudProgType = "rand_prog", 
               Arguments = "35", 
            }, 
         }, 
         Name = "sleeping shop ", 
         Level = 49, 
         ShortDescr = "&R A sleeping Mount shop keeper ", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Description = "This shop keeper is of a very young age, most likely hi father left him\
here to rent out the\
beasts.\
", 
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
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
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
         LongDescr = "&R A sleeping Mount shop keeper lies here.\
", 
         Vnum = 21437, 
         Position = "incapacitated", 
         Sex = "undistinguished", 
      }, 
      [21438] = 
      {
         Alignment = 1000, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say &z Sorry pal but your mouth just bought you a night in jail!\
mptransfer $n 21147\
", 
               MudProgType = "speech_prog", 
               Arguments = "fuck ass suck dick ", 
            }, 
            [2] = 
            {
               Code = "Say &z Hey if your not supposed to be here, leave before\
Say &z I place you in one of those.\
mpecho The guard points toward the jail cell.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 4, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "elite officer hyko", 
         Level = 40, 
         ShortDescr = "&c An Elite Security Officer , Hyko ", 
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
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Description = "", 
         Height = 0, 
         DamRoll = 6, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 6, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 400, 
            HitNoDice = 8, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "&c An Elite Security Officer , Hyko stands here.\
", 
         Vnum = 21438, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21055] = 
      {
         Alignment = 300, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Name = "beggar man beggarprog", 
         Level = 3, 
         ShortDescr = "the beggar", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if name($n) == dog stray\
  emote pets the dog.\
  mpforce stray lick beggar\
  say That's a good boy, here's a small treat.\
  mpecho The beggar tosses a scrap of meat across the road.\
  mpecho The stray quickly chases after it, eager to fill his belly.\
else\
  say Could you spare a few coins please?\
  beg $n\
endif\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = ", rummages in one of many pouches, searching for gold no doubt.\
", 
               MudProgType = "rand_prog", 
               Arguments = "5", 
            }, 
            [3] = 
            {
               Code = "say OHHH MY!!!\
mpecho The beggar suddenly clutches his chest and doubles over.\
mpecho In the blink of an eye, he is dead. \
mpecho The surprise and shock must have been too much for him.\
mpat 21194 mpforce cleric mpat beggarprog mppurge beggarprog\
", 
               MudProgType = "bribe_prog", 
               Arguments = "1000", 
            }, 
            [4] = 
            {
               Code = "say I cannot express my gratitude in words $n!\
kis $n\
say If only others were so generous.\
", 
               MudProgType = "bribe_prog", 
               Arguments = "100", 
            }, 
            [5] = 
            {
               Code = "say Thank you for such a worthy donation.\
thank $n\
", 
               MudProgType = "bribe_prog", 
               Arguments = "10", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 3, 
            DamSizeDice = 3, 
            DamNoDice = 2, 
         }, 
         Description = "The old man is clad in the rags of what was once a military outfit.\
He eyes you warily and holds out a tin cup in supplication...\
", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 100, 
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
            HitSizeDice = 1, 
            HitPlus = 20, 
            HitNoDice = 1, 
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
         LongDescr = "A decrepit old beggar sits on the cobbles of the road, pleading.\
", 
         Vnum = 21055, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21056] = 
      {
         Alignment = 0, 
         Race = "_78", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 10, 
            DamNoDice = 3, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "Calmese", 
         Level = 15, 
         ShortDescr = "the regal calmese", 
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
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
         Description = "The Calmese returns your stare with unfeeling eyes.  Its beak and talons\
appear as though they could rend even the toughest of flesh.\
", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DamRoll = 0, 
         ArmorClass = -20, 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 75, 
            HitPlus = 100, 
            HitNoDice = 3, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [9] = "antarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [9] = "antarian", 
            }, 
         }, 
         LongDescr = "A proud Calmese bird perches regally here, defiant to all.\
", 
         Vnum = 21056, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21057] = 
      {
         Alignment = 0, 
         Race = "_86", 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 10, 
            DamNoDice = 3, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "bantha", 
         Level = 20, 
         ShortDescr = "the smelly bantha", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Description = "This white bantha sports a brilliant white coat and  lies at your approach.\
She appears ready to serve anyone.\
", 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         DamRoll = 0, 
         ArmorClass = 80, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 100, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [16] = "kubazian", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [18] = "_clan", 
               [15] = "togorian", 
            }, 
            Speaks = 
            {
               [18] = "_clan", 
               [9] = "antarian", 
            }, 
         }, 
         LongDescr = "A smelly white bantha slowly trods in a circle.\
", 
         Vnum = 21057, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21058] = 
      {
         Alignment = 0, 
         Race = "_86", 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 30, 
            DamSizeDice = 10, 
            DamNoDice = 3, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "dewback", 
         Level = 25, 
         ShortDescr = "the dewback", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         Description = "The green dewback snorts as you examine him.  His green scales shine\
brightly regardless of light and the dewback seems as though it could\
move tirelessly for days. dewbacks are scarse here...mostly for pets.\
", 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         DamRoll = 0, 
         ArmorClass = 80, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 100, 
            HitPlus = 250, 
            HitNoDice = 3, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [16] = "kubazian", 
               [9] = "antarian", 
               [18] = "_clan", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [15] = "togorian", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [11] = "barabel", 
            }, 
         }, 
         LongDescr = "A mighty green dewback beats angrily at the ground here.\
", 
         Vnum = 21058, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21059] = 
      {
         Alignment = 0, 
         Race = "_74", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         Name = "teke lizard", 
         Level = 5, 
         ShortDescr = "teke lizard", 
         Damage = 
         {
            DamPlus = 20, 
            DamSizeDice = 10, 
            DamNoDice = 3, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Description = "The teke lizard appears frightened out of its mind...\
", 
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
         ArmorClass = 20, 
         HitRoll = 0, 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 75, 
            HitPlus = 50, 
            HitNoDice = 2, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [9] = "antarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [9] = "antarian", 
            }, 
         }, 
         LongDescr = "A teke lizard scampers away from your booted feet.\
", 
         Vnum = 21059, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21060] = 
      {
         Alignment = 0, 
         Race = "_73", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 5, 
            DamNoDice = 5, 
         }, 
         Name = "dog", 
         Level = 10, 
         ShortDescr = "the Mon Calmarian mutt", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "The Mon Calmarian mutt constantly sniffs the ground, searching for its prey.\
", 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         ArmorClass = 30, 
         HitRoll = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 75, 
            HitPlus = 85, 
            HitNoDice = 3, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [9] = "antarian", 
               [11] = "barabel", 
               [7] = "ewokese", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [9] = "antarian", 
               [18] = "_clan", 
               [11] = "barabel", 
               [4] = "huttese", 
               [17] = "jawaese", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
            }, 
         }, 
         LongDescr = "A mon calamrian mutt paces in circles here, sniffing the ground.\
", 
         Vnum = 21060, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21061] = 
      {
         Alignment = 1000, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "guard man", 
         Level = 15, 
         ShortDescr = "the guard", 
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
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         DamRoll = 2, 
         ArmorClass = 5, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "A heavy guard walks the wall of the city.\
", 
         Vnum = 21061, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21062] = 
      {
         Alignment = 1000, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close w\
\
lock w\
", 
               MudProgType = "time_prog", 
               Arguments = "20", 
            }, 
            [2] = 
            {
               Code = "un w\
op w\
", 
               MudProgType = "time_prog", 
               Arguments = "6", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "guard", 
         Level = 15, 
         ShortDescr = "the Docking bay guard", 
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
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Description = "", 
         Height = 0, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 150, 
            HitNoDice = 15, 
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
         LongDescr = "A Docking bay guard tends the western Docking bay.\
", 
         Vnum = 21062, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21063] = 
      {
         Alignment = 1000, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close e\
lock e\
", 
               MudProgType = "time_prog", 
               Arguments = "20", 
            }, 
            [2] = 
            {
               Code = "un e\
op e\
", 
               MudProgType = "time_prog", 
               Arguments = "6", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "man guard", 
         Level = 15, 
         ShortDescr = "the guard", 
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
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
         Vnum = 21063, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21064] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Alignment = 1000, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close n\
lock n\
", 
               MudProgType = "time_prog", 
               Arguments = "20", 
            }, 
            [2] = 
            {
               Code = "un n\
op n\
", 
               MudProgType = "time_prog", 
               Arguments = "6", 
            }, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "guard man", 
         Level = 15, 
         ShortDescr = "the guard", 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "A Docking bay guard tends the north Docking bay.\
", 
         Vnum = 21064, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21065] = 
      {
         Alignment = 1000, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "unlock s\
op s\
\
", 
               MudProgType = "time_prog", 
               Arguments = "6", 
            }, 
            [2] = 
            {
               Code = "close s\
lock s\
", 
               MudProgType = "time_prog", 
               Arguments = "20", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 15, 
            DamSizeDice = 4, 
            DamNoDice = 3, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "guard", 
         Level = 15, 
         ShortDescr = "the guard", 
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
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
         Vnum = 21065, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21066] = 
      {
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Alignment = 1000, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close e\
lock e\
", 
               MudProgType = "time_prog", 
               Arguments = "20", 
            }, 
            [2] = 
            {
               Code = "un e\
op e\
", 
               MudProgType = "time_prog", 
               Arguments = "6", 
            }, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "guard", 
         Level = 15, 
         ShortDescr = "the guard", 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "A guard of watches you as you move by.\
", 
         Vnum = 21066, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21067] = 
      {
         Alignment = 1000, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close w\
lock w\
", 
               MudProgType = "time_prog", 
               Arguments = "20", 
            }, 
            [2] = 
            {
               Code = "un w\
op w\
", 
               MudProgType = "time_prog", 
               Arguments = "6", 
            }, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "man guard", 
         Level = 15, 
         ShortDescr = "the guard", 
         Height = 0, 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "A guard of the city stands here.\
", 
         Vnum = 21067, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21068] = 
      {
         Alignment = 1000, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close s\
lock s\
", 
               MudProgType = "time_prog", 
               Arguments = "20", 
            }, 
            [2] = 
            {
               Code = "un s\
op s\
", 
               MudProgType = "time_prog", 
               Arguments = "6", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "guard", 
         Level = 15, 
         ShortDescr = "the guard", 
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
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Description = "", 
         Height = 0, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 150, 
            HitNoDice = 15, 
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
         LongDescr = "A guard of the city stands at the ready.\
", 
         Vnum = 21068, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21069] = 
      {
         Alignment = 1000, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close n\
lock n\
close manhole\
", 
               MudProgType = "time_prog", 
               Arguments = "20", 
            }, 
            [2] = 
            {
               Code = "un n\
op n\
", 
               MudProgType = "time_prog", 
               Arguments = "6", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Name = "guard", 
         Level = 15, 
         ShortDescr = "the guard", 
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
         Height = 0, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "An guard keeps vigilant watch here.\
", 
         Vnum = 21069, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21070] = 
      {
         Alignment = 0, 
         Race = "_86", 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         Name = "ratler", 
         Level = 6, 
         ShortDescr = "the pack ratler", 
         Damage = 
         {
            DamPlus = 8, 
            DamSizeDice = 3, 
            DamNoDice = 3, 
         }, 
         Description = "This fat, lumbering creature is tame and unkept. You find yourself\
wondering what it carries.\
", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 150, 
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
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 40, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [16] = "kubazian", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [18] = "_clan", 
               [15] = "togorian", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [6] = "shistavanen", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [0] = "basic", 
               [18] = "_clan", 
            }, 
         }, 
         LongDescr = "A pack ratler lumbers about, carrying its master's belongings.\
", 
         Vnum = 21070, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21071] = 
      {
         Alignment = 1000, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Name = "E-Web Guard", 
         Level = 15, 
         ShortDescr = "the E-web", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Description = "", 
         Height = 0, 
         DamRoll = 2, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitRoll = 2, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 3, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "A E-Web guard peers over the area.\
", 
         Vnum = 21071, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21073] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "Key", 
         Level = 1, 
         ShortDescr = "a newly created key", 
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
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Vnum = 21073, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21074] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "Key", 
         Level = 1, 
         ShortDescr = "a newly created key", 
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
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Vnum = 21074, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21075] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "Key", 
         Level = 1, 
         ShortDescr = "a newly created key", 
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
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Vnum = 21075, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21076] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "Key", 
         Level = 1, 
         ShortDescr = "a newly created key", 
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
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Vnum = 21076, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21077] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "Key", 
         Level = 1, 
         ShortDescr = "a newly created key", 
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
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Vnum = 21077, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21078] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "Key", 
         Level = 1, 
         ShortDescr = "a newly created key", 
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
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Vnum = 21078, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21079] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "Key", 
         Level = 1, 
         ShortDescr = "a newly created key", 
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
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Vnum = 21079, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21080] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "Key", 
         Level = 1, 
         ShortDescr = "a newly created key", 
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
         LongDescr = "Some god abandoned a newly created key here.\
", 
         Vnum = 21080, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21081] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "man elderly george lucas", 
         Level = 15, 
         ShortDescr = "&p An elderly entertainment man ", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Hey tell me your here to buy my new script... Intersteller Wars?\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Description = "This bearded human was jailed after he lost control and shot several Mon\
Calamari individuals. His clothes are ragged and it is rumored that at one\
time he was well known for his excellent Sci-Fiction writing. There is a\
small patch with writing on it. \
", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 62, 
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
            HitSizeDice = 10, 
            HitPlus = 150, 
            HitNoDice = 3, 
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
         LongDescr = "&p An elderly entertainment man rests on the bed contimplating filming a movie.\
&x\
\
", 
         Vnum = 21081, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21082] = 
      {
         Alignment = 0, 
         Race = "Gamorrean", 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Name = "gamorrean male Toisk", 
         Level = 10, 
         ShortDescr = "&G Toisk, A rather dumb Gamorrean male", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 6, 
            DamNoDice = 2, 
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
         ArmorClass = 10, 
         HitRoll = 0, 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         LongDescr = "&G Toisk, A rather dumb Gamorrean male sits here counting the cracks in the\
floor.\
", 
         Vnum = 21082, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21083] = 
      {
         Alignment = 1000, 
         SpecFuns = 
         {
            [0] = "spec_customs_weapons", 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "scanner enterance", 
         Level = 15, 
         ShortDescr = "&z A Tk-13y Security scanner", 
         Height = 0, 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
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
         LongDescr = "&z A Tk-13y voice active security scanner frames the enterace. &z\
", 
         Vnum = 21083, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21084] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [18] = "Mountable", 
            [0] = "Npc", 
            [30] = "Prototype", 
            [26] = "Droid", 
         }, 
         Name = "Greeting Protocol Droid", 
         Level = 10, 
         ShortDescr = "&z Greeting Protocol Droid stands here.", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 75, 
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
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
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
         LongDescr = "A power droid is here.\
", 
         Vnum = 21084, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21100] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "Protocol Droid Secretary", 
         Level = 1, 
         ShortDescr = "Protocol Droid", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 6, 
            DamNoDice = 2, 
         }, 
         Description = "As busy as this guy is he still takes the time to help each and\
every customer that walks into the room.  His silver coated frame\
gleems brightly and you can see that he will remain in service \
for some time barring any accidents.\
", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 2, 
         ArmorClass = 0, 
         HitRoll = 3, 
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
         LongDescr = "Protocol Droid Secretary Greets you\
", 
         Vnum = 21100, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21101] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "Janitor", 
         Level = 1, 
         ShortDescr = "A janitor Droid", 
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
         LongDescr = "A janitor droid scoots about picking up your trash\
", 
         Vnum = 21101, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21445] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "drunk quarren", 
         Level = 11, 
         ShortDescr = "A quarren drunk ", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say well thanks $n\
mpoload 21113\
give map $n\
", 
               MudProgType = "bribe_prog", 
               Arguments = "200 ", 
            }, 
            [2] = 
            {
               Code = "Say hello, You new here $n? or have I talked to you I don't know, \
say hey bartender get me another drink.\
mpecho You see the bartender poor the quarren another drink.\
say you ever been down to the quarren city $n It's awsome.\
mpecho You see the drunk reach in his pockets and \
mpecho you see he has no credits.\
Say hey $n give me 200 credits and I'll give you a map to the Quarren city\
.\
", 
               MudProgType = "speech_prog", 
               Arguments = "hi hello", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 72, 
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
            HitSizeDice = 10, 
            HitPlus = 110, 
            HitNoDice = 2, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         LongDescr = "A quarren drunk stumbles here.\
", 
         Vnum = 21445, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21448] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "clerk mon bank", 
         Level = 50, 
         ShortDescr = "&G A \"First Bank of Mon\" bank clerk", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say  &c Hello, welcome to the first bank of Mon ,\
Say &c Here your money is safe with us.\
smile $n\
mpecho &R You are reasured of that fact as you feal a red\
mpecho &R laser beam scan you for your bio-info.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
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
         DamRoll = 0, 
         ArmorClass = -25, 
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
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
            }, 
         }, 
         LongDescr = "&G A \"First Bank of Mon\" bank clerk counts credits to be sorted.\
", 
         Vnum = 21448, 
         Position = "standing", 
         Sex = "female", 
      }, 
      [21447] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Name = "child mon", 
         Level = 1, 
         ShortDescr = "A Mon child", 
         Damage = 
         {
            DamPlus = 3, 
            DamSizeDice = 3, 
            DamNoDice = 1, 
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
         NumberOfAttacks = 1, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30, 
            HitNoDice = 1, 
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
         LongDescr = "A Mon child digs in the ground.\
", 
         Vnum = 21447, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21446] = 
      {
         Alignment = 0, 
         Race = "Quarren", 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Name = "quarren child", 
         Level = 1, 
         ShortDescr = "A Quarren child plays here.", 
         Damage = 
         {
            DamPlus = 3, 
            DamSizeDice = 3, 
            DamNoDice = 1, 
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
         NumberOfAttacks = 1, 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30, 
            HitNoDice = 1, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [24] = "quarrenese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [24] = "quarrenese", 
            }, 
         }, 
         LongDescr = "A Quarren child plays here.\
", 
         Vnum = 21446, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21499] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "final mob", 
         Level = 1, 
         ShortDescr = "a newly created final mob", 
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
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         Vnum = 21499, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21444] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "food dispensor", 
         Level = 1, 
         ShortDescr = "&R A XT-4y Food Dispensor ", 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "&R A XT-4y Food Dispensor ", 
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
         LongDescr = "&R A XT-4y Food Dispensor sits here.\
", 
         Vnum = 21444, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21436] = 
      {
         Alignment = 1000, 
         Height = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
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
         Name = "Cooking Droid", 
         Level = 15, 
         ShortDescr = "A TK-71 cooking droid", 
         Shop = 
         {
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "A TK-71 cooking droid", 
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
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Description = "", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 2, 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         LongDescr = "&C A TK-71 cooking droid stands behind the grill waiting.\
", 
         Vnum = 21436, 
         Position = "standing", 
         Sex = "male", 
      }, 
      [21415] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "newbie mob", 
         Level = 1, 
         ShortDescr = "a newly created newbie mob", 
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
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         Vnum = 21415, 
         Position = "standing", 
         Sex = "undistinguished", 
      }, 
      [21400] = 
      {
         Alignment = 0, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_police", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "Say Hello how can I help you....well come on..\
", 
               MudProgType = "speech_prog", 
               Arguments = "hi", 
            }, 
            [2] = 
            {
               Code = "Say Sorry $n come back with someone who cares.\
", 
               MudProgType = "speech_prog", 
               Arguments = "crime killed prison free", 
            }, 
            [3] = 
            {
               Code = "mpecho As you enter the clerk looks up\
mpecho stares you down..\
laugh\
mpecho Then returns to work.\
", 
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
            }, 
         }, 
         Name = "takiki mon police clerk", 
         Level = 11, 
         ShortDescr = "Takiki, A Mon Calamarian police clerk", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
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
         ArmorClass = 72, 
         HitRoll = 0, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         DefaultPosition = "standing", 
         Height = 0, 
         Weight = 0, 
         Credits = 0, 
         NumberOfAttacks = 0, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 110, 
            HitNoDice = 2, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         LongDescr = "Takiki, A Mon Calamarian police clerk\
", 
         Vnum = 21400, 
         Position = "standing", 
         Sex = "female", 
      }, 
   }, 
   ResetMessage = "Imperial TIE fighters scream past above, patrolling this occupied city.", 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 2, 
         Arg1 = 21045, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21003, 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Arg1 = 21055, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21010, 
      }, 
      [3] = 
      {
         Arg2 = 7, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21012, 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [12] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [13] = 
      {
         Arg2 = 7, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21018, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [20] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [21] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [23] = 
      {
         Arg2 = 3, 
         Arg1 = 21052, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21026, 
      }, 
      [24] = 
      {
         Arg2 = 7, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21029, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [27] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [29] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [30] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [31] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [32] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [33] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [34] = 
      {
         Arg2 = 2, 
         Arg1 = 21045, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21048, 
      }, 
      [35] = 
      {
         Arg2 = 1, 
         Arg1 = 21017, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21053, 
      }, 
      [36] = 
      {
         Arg2 = 1, 
         Arg1 = 21048, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21053, 
      }, 
      [37] = 
      {
         Arg2 = 1, 
         Arg1 = 38, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21053, 
      }, 
      [38] = 
      {
         Arg2 = 1, 
         Arg1 = 21001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21055, 
      }, 
      [39] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21422, 
         MiscData = 1, 
      }, 
      [40] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21423, 
         MiscData = 1, 
      }, 
      [41] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21424, 
         MiscData = 1, 
      }, 
      [42] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21425, 
         MiscData = 1, 
      }, 
      [43] = 
      {
         Arg2 = 1, 
         Arg1 = 21011, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21056, 
      }, 
      [44] = 
      {
         Arg2 = 1, 
         Arg1 = 21018, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21057, 
      }, 
      [45] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21014, 
         MiscData = 1, 
      }, 
      [46] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21015, 
         MiscData = 1, 
      }, 
      [47] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21016, 
         MiscData = 1, 
      }, 
      [48] = 
      {
         Arg2 = 1, 
         Arg1 = 21002, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21058, 
      }, 
      [49] = 
      {
         Arg2 = 1, 
         Arg1 = 21019, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21060, 
      }, 
      [50] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21020, 
         MiscData = 1, 
      }, 
      [51] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21021, 
         MiscData = 1, 
      }, 
      [52] = 
      {
         Arg2 = 1, 
         Arg1 = 21020, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21061, 
      }, 
      [53] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21017, 
         MiscData = 1, 
      }, 
      [54] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21018, 
         MiscData = 1, 
      }, 
      [55] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21019, 
         MiscData = 1, 
      }, 
      [56] = 
      {
         Arg2 = 1, 
         Arg1 = 21016, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21062, 
      }, 
      [57] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
         MiscData = 1, 
      }, 
      [58] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21069, 
         MiscData = 1, 
      }, 
      [59] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21081, 
         MiscData = 1, 
      }, 
      [60] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21082, 
         MiscData = 1, 
      }, 
      [61] = 
      {
         Arg2 = 7, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21062, 
      }, 
      [62] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [63] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [64] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [65] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [66] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [67] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [68] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [69] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [70] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [71] = 
      {
         Arg2 = 1, 
         Arg1 = 21055, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21063, 
      }, 
      [72] = 
      {
         Arg2 = 3, 
         Arg1 = 21052, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21064, 
      }, 
      [73] = 
      {
         Arg2 = 3, 
         Arg1 = 21052, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21064, 
      }, 
      [74] = 
      {
         Arg2 = 1, 
         Arg1 = 21055, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21064, 
      }, 
      [75] = 
      {
         Arg2 = 1, 
         Arg1 = 21055, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21065, 
      }, 
      [76] = 
      {
         Arg2 = 4, 
         Arg1 = 21061, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21080, 
      }, 
      [77] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [78] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [79] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [80] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [81] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [82] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [83] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [84] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [85] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
      }, 
      [86] = 
      {
         Arg2 = 1, 
         Arg1 = 21065, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
      }, 
      [87] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [88] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [89] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [90] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [91] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21087, 
      }, 
      [92] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [93] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [94] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [95] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [96] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [97] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [98] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [99] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [100] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [101] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
      }, 
      [102] = 
      {
         Arg2 = 1, 
         Arg1 = 21065, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
      }, 
      [103] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [104] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [105] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [106] = 
      {
         Arg2 = 1, 
         Arg1 = 21070, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [107] = 
      {
         Arg2 = 1, 
         Arg1 = 21087, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [108] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21088, 
      }, 
      [109] = 
      {
         Arg2 = 1, 
         Arg1 = 21070, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [110] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [111] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [112] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [113] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [114] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [115] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [116] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [117] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [118] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [119] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [120] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [121] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [122] = 
      {
         Arg2 = 3, 
         Arg1 = 21088, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [123] = 
      {
         Arg2 = 1, 
         Arg1 = 21065, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21099, 
      }, 
      [124] = 
      {
         Arg2 = 1, 
         Arg1 = 21071, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [125] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [126] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [127] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [128] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [129] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [130] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [131] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [132] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [133] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [134] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [135] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [136] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [137] = 
      {
         Arg2 = 1, 
         Arg1 = 21065, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
      }, 
      [138] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
      }, 
      [139] = 
      {
         Arg2 = 2, 
         Arg1 = 21099, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [140] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21112, 
      }, 
      [141] = 
      {
         Arg2 = 1, 
         Arg1 = 21072, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [142] = 
      {
         Arg2 = 1, 
         Arg1 = 21065, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
      }, 
      [143] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [144] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [145] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [146] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [147] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [148] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [149] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [150] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [151] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [152] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
      }, 
      [153] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [154] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [155] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [156] = 
      {
         Arg2 = 3, 
         Arg1 = 21112, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [157] = 
      {
         Arg2 = 1, 
         Arg1 = 21003, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21054, 
      }, 
      [158] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32230, 
         MiscData = 1, 
      }, 
      [159] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10487, 
         MiscData = 1, 
      }, 
      [160] = 
      {
         Arg2 = 7, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21054, 
      }, 
      [161] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [162] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [163] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [164] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [165] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [166] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [167] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [168] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [169] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [170] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21075, 
      }, 
      [171] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [172] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [173] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [174] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [175] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [176] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [177] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [178] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [179] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [180] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [181] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [182] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [183] = 
      {
         Arg2 = 1, 
         Arg1 = 21073, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [184] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
      }, 
      [185] = 
      {
         Arg2 = 1, 
         Arg1 = 21065, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
      }, 
      [186] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21075, 
      }, 
      [187] = 
      {
         Arg2 = 0, 
         Arg1 = 21075, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [188] = 
      {
         Arg2 = 2, 
         Arg1 = 21059, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21119, 
      }, 
      [189] = 
      {
         Arg2 = 4, 
         Arg1 = 21061, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21114, 
      }, 
      [190] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [191] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [192] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [193] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [194] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [195] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [196] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [197] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [198] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [199] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [200] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
      }, 
      [201] = 
      {
         Arg2 = 1, 
         Arg1 = 21065, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 11, 
      }, 
      [202] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [203] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [204] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21056, 
         MiscData = 1, 
      }, 
      [205] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21058, 
         MiscData = 1, 
      }, 
      [206] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21059, 
         MiscData = 1, 
      }, 
      [207] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21060, 
         MiscData = 1, 
      }, 
      [208] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21061, 
         MiscData = 1, 
      }, 
      [209] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21062, 
         MiscData = 1, 
      }, 
      [210] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21063, 
         MiscData = 1, 
      }, 
      [211] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21066, 
         MiscData = 1, 
      }, 
      [212] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21067, 
         MiscData = 1, 
      }, 
      [213] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
         MiscData = 1, 
      }, 
      [214] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21058, 
         MiscData = 1, 
      }, 
      [215] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21062, 
         MiscData = 1, 
      }, 
      [216] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
         MiscData = 1, 
      }, 
      [217] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21057, 
         MiscData = 1, 
      }, 
      [218] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21060, 
         MiscData = 1, 
      }, 
      [219] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21061, 
         MiscData = 1, 
      }, 
      [220] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21064, 
         MiscData = 1, 
      }, 
      [221] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
         MiscData = 1, 
      }, 
      [222] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21063, 
         MiscData = 1, 
      }, 
      [223] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
         MiscData = 1, 
      }, 
      [224] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21067, 
         MiscData = 1, 
      }, 
      [225] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
         MiscData = 1, 
      }, 
      [226] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
         MiscData = 1, 
      }, 
      [227] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21057, 
         MiscData = 1, 
      }, 
      [228] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
         MiscData = 1, 
      }, 
      [229] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21064, 
         MiscData = 1, 
      }, 
      [230] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21068, 
         MiscData = 1, 
      }, 
      [231] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21022, 
         MiscData = 1, 
      }, 
      [232] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21019, 
         MiscData = 1, 
      }, 
      [233] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21020, 
         MiscData = 1, 
      }, 
      [234] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10317, 
         MiscData = 1, 
      }, 
      [235] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10312, 
         MiscData = 1, 
      }, 
      [236] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10424, 
         MiscData = 1, 
      }, 
      [237] = 
      {
         Arg2 = 3, 
         Arg1 = 21059, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21114, 
      }, 
      [238] = 
      {
         Arg2 = 4, 
         Arg1 = 21059, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21106, 
      }, 
      [239] = 
      {
         Arg2 = 5, 
         Arg1 = 21059, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21094, 
      }, 
      [240] = 
      {
         Arg2 = 6, 
         Arg1 = 21059, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21089, 
      }, 
      [241] = 
      {
         Arg2 = 1, 
         Arg1 = 21435, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21129, 
      }, 
      [242] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32254, 
         MiscData = 1, 
      }, 
      [243] = 
      {
         Arg2 = 1, 
         Arg1 = 32231, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21071, 
      }, 
      [244] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21100, 
      }, 
      [245] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [246] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [247] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [248] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [249] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [250] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [251] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [252] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [253] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [254] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [255] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [256] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [257] = 
      {
         Arg2 = 1, 
         Arg1 = 21071, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [258] = 
      {
         Arg2 = 1, 
         Arg1 = 21421, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21100, 
      }, 
      [259] = 
      {
         Arg2 = 0, 
         Arg1 = 21100, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [260] = 
      {
         Arg2 = 1, 
         Arg1 = 21068, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21074, 
      }, 
      [261] = 
      {
         Arg2 = 1, 
         Arg1 = 21073, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [262] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [263] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [264] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [265] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [266] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [267] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [268] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [269] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [270] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [271] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [272] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [273] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [274] = 
      {
         Arg2 = 2, 
         Arg1 = 21074, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [275] = 
      {
         Arg2 = 1, 
         Arg1 = 21014, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21052, 
      }, 
      [276] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21094, 
         MiscData = 1, 
      }, 
      [277] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21056, 
         MiscData = 1, 
      }, 
      [278] = 
      {
         Arg2 = 1, 
         Arg1 = 21444, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21128, 
      }, 
      [279] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6824, 
         MiscData = 1, 
      }, 
      [280] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32283, 
         MiscData = 1, 
      }, 
      [281] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21113, 
      }, 
      [282] = 
      {
         Arg2 = 1, 
         Arg1 = 21056, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
      }, 
      [283] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [284] = 
      {
         Arg2 = 1, 
         Arg1 = 21058, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [285] = 
      {
         Arg2 = 1, 
         Arg1 = 21059, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [286] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [287] = 
      {
         Arg2 = 1, 
         Arg1 = 21061, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [288] = 
      {
         Arg2 = 1, 
         Arg1 = 21062, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 10, 
      }, 
      [289] = 
      {
         Arg2 = 1, 
         Arg1 = 21063, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 9, 
      }, 
      [290] = 
      {
         Arg2 = 1, 
         Arg1 = 21064, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [291] = 
      {
         Arg2 = 1, 
         Arg1 = 21066, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 20, 
      }, 
      [292] = 
      {
         Arg2 = 1, 
         Arg1 = 21067, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 0, 
      }, 
      [293] = 
      {
         Arg2 = 1, 
         Arg1 = 21069, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [294] = 
      {
         Arg2 = 1, 
         Arg1 = 21072, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [295] = 
      {
         Arg2 = 1, 
         Arg1 = 21113, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [296] = 
      {
         Arg2 = 1, 
         Arg1 = 21436, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21072, 
      }, 
      [297] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6814, 
         MiscData = 1, 
      }, 
      [298] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6824, 
         MiscData = 1, 
      }, 
      [299] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6822, 
         MiscData = 1, 
      }, 
      [300] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6825, 
         MiscData = 1, 
      }, 
      [301] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21133, 
         MiscData = 1, 
      }, 
      [302] = 
      {
         Arg2 = 1, 
         Arg1 = 32208, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21072, 
      }, 
      [303] = 
      {
         Arg2 = 7, 
         Arg1 = 21059, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21135, 
      }, 
      [304] = 
      {
         Arg2 = 1, 
         Arg1 = 21060, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21135, 
      }, 
      [305] = 
      {
         Arg2 = 2, 
         Arg1 = 21447, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21134, 
      }, 
      [306] = 
      {
         Arg2 = 2, 
         Arg1 = 21446, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21134, 
      }, 
      [307] = 
      {
         Arg2 = 2, 
         Arg1 = 21446, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21134, 
      }, 
      [308] = 
      {
         Arg2 = 2, 
         Arg1 = 21447, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21134, 
      }, 
      [309] = 
      {
         Arg2 = 3, 
         Arg1 = 21446, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21137, 
      }, 
      [310] = 
      {
         Arg2 = 3, 
         Arg1 = 21447, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21137, 
      }, 
      [311] = 
      {
         Arg2 = 4, 
         Arg1 = 21446, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21136, 
      }, 
      [312] = 
      {
         Arg2 = 4, 
         Arg1 = 21447, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21136, 
      }, 
      [313] = 
      {
         Arg2 = 8, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21007, 
      }, 
      [314] = 
      {
         Arg2 = 9, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21011, 
      }, 
      [315] = 
      {
         Arg2 = 10, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21015, 
      }, 
      [316] = 
      {
         Arg2 = 11, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21021, 
      }, 
      [317] = 
      {
         Arg2 = 12, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21027, 
      }, 
      [318] = 
      {
         Arg2 = 13, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21032, 
      }, 
      [319] = 
      {
         Arg2 = 14, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21001, 
      }, 
      [320] = 
      {
         Arg2 = 1, 
         Arg1 = 21015, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21059, 
      }, 
      [321] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21057, 
         MiscData = 1, 
      }, 
      [322] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21058, 
         MiscData = 1, 
      }, 
      [323] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21059, 
         MiscData = 1, 
      }, 
      [324] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21060, 
         MiscData = 1, 
      }, 
      [325] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 29008, 
         MiscData = 1, 
      }, 
      [326] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21062, 
         MiscData = 1, 
      }, 
      [327] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21063, 
         MiscData = 1, 
      }, 
      [328] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21064, 
         MiscData = 1, 
      }, 
      [329] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21065, 
         MiscData = 1, 
      }, 
      [330] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21066, 
         MiscData = 1, 
      }, 
      [331] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 29007, 
         MiscData = 1, 
      }, 
      [332] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21061, 
         MiscData = 1, 
      }, 
      [333] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 29006, 
         MiscData = 1, 
      }, 
      [334] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21426, 
         MiscData = 1, 
      }, 
      [335] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10311, 
         MiscData = 1, 
      }, 
      [336] = 
      {
         Arg2 = 1, 
         Arg1 = 21448, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21138, 
      }, 
      [337] = 
      {
         Arg2 = 1, 
         Arg1 = 21433, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21150, 
      }, 
      [338] = 
      {
         Arg2 = 1, 
         Arg1 = 21427, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21150, 
      }, 
      [339] = 
      {
         Arg2 = 12, 
         Arg1 = 21037, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21145, 
      }, 
      [340] = 
      {
         Arg2 = 1, 
         Arg1 = 21114, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21000, 
      }, 
      [341] = 
      {
         Arg2 = 1, 
         Arg1 = 21115, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21148, 
      }, 
      [342] = 
      {
         Arg2 = 1, 
         Arg1 = 21116, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21148, 
      }, 
      [343] = 
      {
         Arg2 = 3, 
         Arg1 = 21148, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [344] = 
      {
         Arg2 = 1, 
         Arg1 = 21141, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [345] = 
      {
         Arg2 = 8, 
         Arg1 = 21140, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [346] = 
      {
         Arg2 = 1, 
         Arg1 = 21116, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21149, 
      }, 
      [347] = 
      {
         Arg2 = 1, 
         Arg1 = 21115, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21149, 
      }, 
      [348] = 
      {
         Arg2 = 7, 
         Arg1 = 21149, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [349] = 
      {
         Arg2 = 1, 
         Arg1 = 21139, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [350] = 
      {
         Arg2 = 2, 
         Arg1 = 21142, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [351] = 
      {
         Arg2 = 0, 
         Arg1 = 21143, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [352] = 
      {
         Arg2 = 1, 
         Arg1 = 21438, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21144, 
      }, 
      [353] = 
      {
         Arg2 = 1, 
         Arg1 = 21140, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [354] = 
      {
         Arg2 = 1, 
         Arg1 = 21081, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21146, 
      }, 
      [355] = 
      {
         Arg2 = 1, 
         Arg1 = 21115, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21146, 
      }, 
      [356] = 
      {
         Arg2 = 1, 
         Arg1 = 21116, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21146, 
      }, 
      [357] = 
      {
         Arg2 = 2, 
         Arg1 = 21146, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [358] = 
      {
         Arg2 = 0, 
         Arg1 = 21073, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [359] = 
      {
         Arg2 = 1, 
         Arg1 = 21082, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21147, 
      }, 
      [360] = 
      {
         Arg2 = 1, 
         Arg1 = 21117, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [361] = 
      {
         Arg2 = 1, 
         Arg1 = 28015, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [362] = 
      {
         Arg2 = 1, 
         Arg1 = 21118, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [363] = 
      {
         Arg2 = 1, 
         Arg1 = 21115, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21147, 
      }, 
      [364] = 
      {
         Arg2 = 1, 
         Arg1 = 21116, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21147, 
      }, 
      [365] = 
      {
         Arg2 = 0, 
         Arg1 = 21147, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [366] = 
      {
         Arg2 = 1, 
         Arg1 = 21400, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21132, 
      }, 
      [367] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21069, 
         MiscData = 1, 
      }, 
      [368] = 
      {
         Arg2 = 2, 
         Arg1 = 21132, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [369] = 
      {
         Arg2 = 3, 
         Arg1 = 21058, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
      }, 
      [370] = 
      {
         Arg2 = 1, 
         Arg1 = 21057, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
      }, 
      [371] = 
      {
         Arg2 = 1, 
         Arg1 = 21437, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
      }, 
      [372] = 
      {
         Arg2 = 1, 
         Arg1 = 60, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [373] = 
      {
         Arg2 = 3, 
         Arg1 = 21058, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
      }, 
      [374] = 
      {
         Arg2 = 3, 
         Arg1 = 21058, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21067, 
      }, 
      [375] = 
      {
         Arg2 = 1, 
         Arg1 = 21083, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21130, 
      }, 
      [376] = 
      {
         Arg2 = 1, 
         Arg1 = 21130, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [377] = 
      {
         Arg2 = 2, 
         Arg1 = 21126, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [378] = 
      {
         Arg2 = 1, 
         Arg1 = 21434, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21127, 
      }, 
      [379] = 
      {
         Arg2 = 0, 
         Arg1 = 21127, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [380] = 
      {
         Arg2 = 2, 
         Arg1 = 21040, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [381] = 
      {
         Arg2 = 1, 
         Arg1 = 21025, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21069, 
      }, 
      [382] = 
      {
         Arg2 = 0, 
         Arg1 = 21069, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [383] = 
      {
         Arg2 = 1, 
         Arg1 = 21013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21068, 
      }, 
      [384] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21009, 
         MiscData = 1, 
      }, 
      [385] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21008, 
         MiscData = 1, 
      }, 
      [386] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21010, 
         MiscData = 1, 
      }, 
      [387] = 
      {
         Arg2 = 1, 
         Arg1 = 21445, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21068, 
      }, 
      [388] = 
      {
         Arg2 = 0, 
         Arg1 = 21068, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [389] = 
      {
         Arg2 = 2, 
         Arg1 = 21041, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [390] = 
      {
         Arg2 = 0, 
         Arg1 = 21022, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [391] = 
      {
         Arg2 = 1, 
         Arg1 = 21021, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21066, 
      }, 
      [392] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21076, 
         MiscData = 1, 
      }, 
      [393] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21077, 
         MiscData = 1, 
      }, 
      [394] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21078, 
         MiscData = 1, 
      }, 
      [395] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21079, 
         MiscData = 1, 
      }, 
      [396] = 
      {
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 21080, 
         MiscData = 1, 
      }, 
      [397] = 
      {
         Arg2 = 2, 
         Arg1 = 21066, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [398] = 
      {
         Arg2 = 5, 
         Arg1 = 21066, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [399] = 
      {
         Arg2 = 1, 
         Arg1 = 21180, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [400] = 
      {
         Arg2 = 3, 
         Arg1 = 21184, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [401] = 
      {
         Arg2 = 1, 
         Arg1 = 21183, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 1, 
      }, 
      [402] = 
      {
         Arg2 = 1, 
         Arg1 = 21435, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21187, 
      }, 
   }, 
   Rooms = 
   {
      [21000] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21001, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Anna Avenue lies to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21036, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "To the east lies Barster Road.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21042, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Anna Avenue lies to the south.\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21039, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "To the west lies Barster Road.\
", 
            }, 
         }, 
         Vnum = 21000, 
         Tunnel = 0, 
         Flags = 
         {
            [15] = "NoDropAll", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Coral City Center", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&Y In Honor of the Great Admiral Ackbar.\
\13Who died giving his life for Freedom of all Underwater Creatures.\
\13We can only look tot he heavens for bravery like his.\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&P You are standing within the expanse of the famous Mon Calamrian City of\
Coral City .  A metallic statue of Admiral Ackbar occupies the square's\
center, surrounded by gardens of shrubbery which enhance the air of\
serenity and peace here in the center of the city.  The main roads lead\
away in the cardinal directions, while to the east and west are smooth\
carved rock roads. The roof tops of a buildings can be seen rising to the\
south east.\
", 
      }, 
      [21001] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21002, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Anna Avenue lies in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21000, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road to the south leads to the main  Square.\
", 
            }, 
         }, 
         Vnum = 21001, 
         Tunnel = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Anna Avenue", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. Directly south you\
can see the circular center of Coral City.\
", 
      }, 
      [21002] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21003, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The worn metallic roads of Anna Avenue lie in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21001, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "A peculiar section of Anna Avenue lies to the south.\
", 
            }, 
         }, 
         Vnum = 21002, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Anna Avenue", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. \
", 
      }, 
      [21003] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21004, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Anna Avenue and Security Road cross just north of here.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21002, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "A rather bland portion of Anna Avenue lies to the south.\
", 
            }, 
         }, 
         Vnum = 21003, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Anna Avenue", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. to the north you can see an intersection. \
", 
      }, 
      [21004] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21100, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The northern Docking bay can be seen in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21005, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Security Road extends to the east.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21003, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Going south will bring you near the heart of the city.\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21035, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Security Road extends to the west.\
", 
            }, 
         }, 
         Vnum = 21004, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Intersection of Anna Avenue and Security Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The North Docking bay of Akatamer\
\13East  - Security Road\
\13        - To Luke Street\
\13South - Anna Avenue\
\13        - To Barster Road\
\13        - To Trading Post  Street\
\13        - To Law Avenue\
\13        - To Akatamer Square\
\13West  - Security Road\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&RYou stand at the intersection of &PAnna Avenue&R and Security Road.  This\
main road is home to the Mon Calamari Police. It is highly recommended\
that you do not walk down this street with rifle a blaze. Soft greenery\
have been added to the street sides to help make it look more attractive.\
To the north you can see the north docking bay where the transport ships\
continualy stop. Security Road lies to the east and west, while &P Anna\
Avenue &R can be seen to the north and south.\
", 
      }, 
      [21005] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21132, 
               Keyword = "door", 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21006, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Security Road lies to the east.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21004, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The intersection of Anna Avenue and Security Road is to the west.\
", 
            }, 
         }, 
         Vnum = 21005, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Main Security Office", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&R This portion of Security Road seems extremly well taken care of.  A\
whistling northern wind can be heard passing the large Security building\
to the north.  The extremly large building was made out of grinded lava\
rock from the planet ocean floor. This extremly hard surface is known for\
it's ability to keep criminals inside. Security Road stretches  to the\
east and west.\
", 
      }, 
      [21006] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21007, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Security Road is to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21005, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Security Road extends westward.\
", 
            }, 
         }, 
         Vnum = 21006, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The statue is of the Late members of S.P.I.N. belived to be past\
\13away.\
\13", 
               Keyword = "statue", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&RYou are on a straight section of Security Road.  A statue depicting a\
party of adventurers fighting off a Imperial Stortrooper sits in the\
center of the road.  Blinking back a tear, you remember hearing this tale\
in a local Factory , and realize that the statue is a memorial.  Security\
Road extends to the east and west. \
", 
      }, 
      [21007] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21008, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Security Road meets Luke Street to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21006, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Security Road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21007, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Road", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&R You are walking down Security Road.  The long road, which lines the\
northern wall of Coral City, meets up with Oceanview Street to the east to\
form one of the four corners of Coral City. Beyond these four corners is a\
small walkway guarded by a Mon built breakwater that turns back the\
largest ocean on a habital planet. The street continues westward.\
", 
      }, 
      [21008] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21009, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Luke Street lies to the south.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21007, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Security Road lies to the west.\
", 
            }, 
         }, 
         Vnum = 21008, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Meeting of Oceanview Street and Security Road ", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "West  - Security Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13South - Luke Street\
\13        - To Barster Road\
\13        - To Trading Post  Street\
\13        - To Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&B Oceanview Street and Security Road come together here to form one of the\
four corners of Coral City. Oceanview Street lies to the south, while\
Security Road stretches westward.To the south you can see Mon Calamrian\
New Rebublic troops practicing military drills incase and invasion ever\
occurs again. \
", 
      }, 
      [21009] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21008, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Luke Street meets up with Security Road to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21010, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Luke Street continues to the south.\
", 
            }, 
         }, 
         Vnum = 21009, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Oceanview Street", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&B This section of Oceanview Street is reserved for the Mon Calamrian\
defense team.  E- Web Blaster's and Com - blasters are stacked high into\
the air, almost within reach of the  New Rebublic guards on the outpost.\
to the west. Oceanview Street stretches to the north and south.  You also\
\
see in the enterance a body scanner that will make sure you have no\
weapons on you.\
", 
      }, 
      [21010] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21009, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Luke Street continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21011, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road ranges to the south.\
", 
            }, 
         }, 
         Vnum = 21010, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Oceanview Street", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&B This portion of Oceanview Street is rather poor and unkempt.  Rags\
\
litter the street, and several of the city's unfortunate have set up\
residence here.;A holohome has been set up on the eastern side of the\
road, a beggar's home no doubt.  They prefer this road thanks to the\
constant tourists that travelk it. Oceanview Street continues to the north\
and south.\
", 
      }, 
      [21011] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21010, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Luke Street extends northward.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21012, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Barster Road and Luke Street cross to the south.\
", 
            }, 
         }, 
         Vnum = 21011, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Oceanview Street", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&BYou are walking down the northern half of Oceanview Street at a brisk\
pace. To the east is the towering  security wall of Coral City ,blocking\
your view of the awsome ocean.   Oceanview Street ranges to the north and\
south.  The road is extremly polished and looks as if not to many Mon\
Calamrian's travel down it.\
", 
      }, 
      [21012] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21011, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Luke Street is to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21113, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "To the east is the eastern Docking bay.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21013, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "You can see Luke Street stretch far to the south.\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21038, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Barster Road lies to the east.\
", 
            }, 
         }, 
         Vnum = 21012, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Intersection of Barster Road and Oceanview Street", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Luke Street\
\13        - To Security Road\
\13East  - The East Docking bay of Akatmer\
\13South - Luke Street\
\13        - To Trading Post Street\
\13        - To Law Avenue\
\13West  - Barster Road\
\13        - To Akatamer Square\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&B You stand at the intersection of Barster Road and Oceanview Street.  To\
the east you can see the massive east Docking bay of Coral City. This is\
one of the main smuggling bay's of the city.While Oceanview Street lies to\
the north and south, and Barster Road runs west.\
", 
      }, 
      [21013] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21012, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Barster Road and Luke Street cross just north of here.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21014, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The Trading Post  and Luke Street intersection is south of here.\
", 
            }, 
         }, 
         Vnum = 21013, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Oceanview Street", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&B You take a brief pause on your way down Oceanview Street, and you can\
hear the chirping of some strange bird like creature  coming from the\
other side of the extending breakwall.  Upon catching your breath from the\
salty air, you gather  your belongings and continue on your way.\
", 
      }, 
      [21014] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21013, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Luke Street lies in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21015, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Luke Street stretches southward as far as the eye can see.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21050, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The Trading posts of Akatamer await your arrival and Credits.\
", 
            }, 
         }, 
         Vnum = 21014, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Intersection of Trading post Street and Oceanview Street ", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Luke Street\
\13        - To Barster Road\
\13        - To Security Road\
\13South - Luke Street\
\13        - To Law Avenue\
\13West  - Trading Post Street\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&B You stand at the intersection of Trading Post Street and Luke Street.\
You look out and can see the waves crash upon the breakwall To the west\
are the glorious pavilions and shops of Coral City, while Oceanview Street\
continues to the north and south.\
", 
      }, 
      [21015] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21014, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Trading post Street and Luke Street meet to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21016, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Gazing southward, you see the southeastern corner of Akatamer.\
", 
            }, 
         }, 
         Vnum = 21015, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Oceanview Street.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&B This portion of Oceanview street allows you see rest and watch one of\
the two suns set. Two crome like  benches sit on opposite sides of the\
polished rock road, enticing you to rest.  You can see Law Avenue meeting\
up with Oceanview Street to the south, while to the north is the Trading\
Post Street  and Oceanview Street intersection.\
", 
      }, 
      [21016] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21015, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Luke Street lies to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 6905, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21017, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Law Avenue lies to the west.\
", 
            }, 
         }, 
         Vnum = 21016, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Meeting of Oceanview Street and Law Avenue ", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Luke Street\
\13        - To trading Post Street\
\13        - To Barster Road\
\13        - To Security Road\
\13West  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&WOceanview  Street and Law Avenue come together here to form one of the\
four corners of Coral City. This attractive street recived it's name\
\
becasue the creators of the city's layout placed it on a hill allowing you\
to look at the ocean.Oceanview Street lies to the north, while Law Avenue\
stretches westward.\
", 
      }, 
      [21017] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21016, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Law Avenue joins Luke Street to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21018, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Law Avenue stretches westward.\
", 
            }, 
         }, 
         Vnum = 21017, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Law Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Companions and Mounts\
\13East  - Law Avenue\
\13        - To Luke Street\
\13West  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&WYou are walking down the newly paved Law Avenue, the road which lines the\
southern wall of Coral City recives constant traffic and is ofen the\
center of attraction.  The dust  here seems wet and muddy. you must be\
getting closer to the ocean  To the east is one of the four corners  of\
Coral City, while Law Avenue continues westward. \
", 
      }, 
      [21018] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21138, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21017, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road extends eastward.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21019, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Law Avenue stretches westward as far as the eye can see.\
", 
            }, 
         }, 
         Vnum = 21018, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Law Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "In honor of the late GHETT, founder of the special forces team S.P.I.N.\
\13True friend, and hero to all of us. \
\13", 
               Keyword = "statue ", 
            }, 
            [2] = 
            {
               Description = "The plaque reads: 'May you rest in peace, Ghett of S.P.I.N..'\
\13", 
               Keyword = "plaque", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&W A tall statue attracts your attention on this portion of Law Avenue. \
The platiki metallic  sculpture is of a Calamrian in his late years\
wielding a E-web Blaster against an unseen attacker, although from the\
man's posture it is obvious that his opponent was enormous.  A small\
golden plaque sits near the statue, explaining its importance.  The newly\
paved road stretches both east and west. \
", 
      }, 
      [21019] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21051, 
               Keyword = "door", 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21018, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Law Avenue continues to the east.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21020, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Anna Avenue and Law Avenue cross to the west.\
", 
            }, 
         }, 
         Vnum = 21019, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Law Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Jawa Traders\
\13East  - Law Avenue\
\13        - To Luke Street\
\13West  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&W Walking on Law Avenue you pass a building that explains the roads name,\
City Hall. It is here you goto pay tickets and fines, along with chat with\
\
the mayor. The building which stands over 300 ft high is made of fine\
polished granite imported from a nearby moon. It's extravegent\
\
look;matches the city's over rehaul plan. The walkway leading up to the\
building has polished stones buried into the ground to create a peaceful\
walkway.  Plants from nearby planets are now growing along side the\
walkway to make it more inviting. Unfortunately the interior is not yet\
finished so you can not take a tour.\
", 
      }, 
      [21020] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21044, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "To the north is Anna Avenue.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21019, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "You see the legendary Law Avenue.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21074, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "To the south is Akatamer's southern Docking bay.\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21021, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Law Avenue extends to the west.\
", 
            }, 
         }, 
         Vnum = 21020, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Intersection of Anna Avenue and Law Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Anna Avenue\
\13        - To Trading Post Street\
\13        - To Barster Road\
\13        - To Security Road\
\13        - To Akatamer Square\
\13East  - Law Avenue\
\13        - To Luke Street\
\13South - The Southern Docking bay of Akatamer\
\13West  - Law Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&W You stand at the intersection of Anna Avenue and Law Avenue.  Gazing to\
the south, you see the massive south Docking bay of Coral City. It is\
there most new traders enter the city. It also there that new bounty\
hunters enter. The newly covered roads of Anna Avenue and Law Avenue lie\
in the four cardinal directions.\
", 
      }, 
      [21021] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21073, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21020, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Law Avenue and Anna Road cross to the east.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21022, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Law Avenue ranges to the west.\
", 
            }, 
         }, 
         Vnum = 21021, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Law Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Akatamer square\
\13\
\13East  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Luke Street\
\13West  - Law Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&W You are traveling down one of the newly covered section of Law Avenue at\
a brisk pace. To the north is the Mon Calamrian Factory , a building known\
throughout the the world for its rare metal melting.  You feel almost like\
paying the building a visit.  Law Avenue extends to the east and west.\
", 
      }, 
      [21022] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21066, 
               Keyword = "door", 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "A fashion shop is situated to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21021, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Law Avenue extends to the east.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21023, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Law Avenue stretches westward.\
", 
            }, 
         }, 
         Vnum = 21022, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Law Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Anikeim's fashion  Clothing\
\13West  - Law Avenue\
\13        - To Monock Road\
\13East  - Law Avenue\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&W You are walking down a rather commercial part of Law Avenue. Merchants\
and droids hassle you to spend your credits as you attempt to continue on\
your way. Glancing to the north, you see  the only shop worth visiting,\
owned by the respectable Lokist the Tailor.  Law Avenue stretches to the\
east and west. \
", 
      }, 
      [21023] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21186, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21022, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Law Avenue continues in this direction.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21024, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Law Avenue clashes with Monock Road to the west.\
", 
            }, 
         }, 
         Vnum = 21023, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Law Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - An Abandoned defense building\
\13        - To the Guild of Pilots\
\13\
\13West  - Law Avenue\
\13        - To Monock Road\
\13East  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Luke Street\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&W This stretch of Law Avenue is well trimed and well kept, like most of\
the streets now in Coral City.  Looking northward, you see a small defense\
building that looks like it saw some where and tear twenty years  ago.\
Most of the remains are unenterable.  The lengthy polished rock road\
extends to the east and west. \
", 
      }, 
      [21024] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21025, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Monock Road lies to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21023, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Law Avenue lies to the east.\
", 
            }, 
         }, 
         Vnum = 21024, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Meeting of Monock Road and Law Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Monock Road\
\13        - To Trading Post  Street\
\13        - To Barster Road\
\13        - To Security Road\
\13East  - Law Avenue\
\13        - To Anna Avenue\
\13        - To Luke Street\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&W Monock Road and Law Avenue come together here to form one of the four\
corners of Coral City.  A metal staircase leads up onto the main city's\
Security Post, from where even the strongest Imperial Stormtrooper  can be\
repelled. Monock Road lies to the north, while Law Avenue stretches\
eastward.\
", 
      }, 
      [21025] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21026, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Thieves Alley is east of here.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21063, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The Thieves Alley is east of here.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21024, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "One of the four corners of Akatamer is located to the south.\
", 
            }, 
         }, 
         Vnum = 21025, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Monock Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Monock Road\
\13        - To Security Road\
\13        - To Barster Road\
\13        - To Trading Post  Street\
\13East  - Thieves Alley\
\13        - To the Guild of Thieves\
\13South - Monock Road\
\13        - To Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&p You pick up your pace as you travel down this portion of Monock Road.\
\
Gazing eastward, you see what is easily the darkest alley in the city,\
though a glimmer of light can be seen flickering in the shadows of the\
slim street.  To the north is an intersection, while Monock Road continues\
to the south. \
", 
      }, 
      [21026] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21027, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Monock Road lies in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21045, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "You gaze at the pavillions and shops of Trading Post  Street.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21025, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "To the south is Monock Road.\
", 
            }, 
         }, 
         Vnum = 21026, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Intersection of Trading Post  Street and Monock Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Monock Road\
\13        - To Security Road\
\13        - To Barster Road\
\13East  - Trading Post  Street\
\13South - Monock Road\
\13        - To Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&Y You stand at the intersection of Trading Post  Street and Monock Road. \
A wall towers over you to the west, keeping intruders (mostly Quarren) out\
of Coral City unannounced.  To the east are the newly built shops of Coral\
City, while Monock Road continues to the north and south.\
", 
      }, 
      [21027] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21028, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Barster Road and Monock Road cross to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21026, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Trading Post  Street and Monock Road cross just south of here.\
", 
            }, 
         }, 
         Vnum = 21027, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Monock Road", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&p You are walking down a poorer section of Monock Road.  The carved rock\
roads  seem unkept and poorly made, definitely unusual in this city which\
represents hope and order.  The street ranges to the north and south.\
", 
      }, 
      [21028] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21029, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The metallic streets of Monock Road lie to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21041, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Walking in this direction will lead you into the very heart of the city.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21027, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Monock Road lies to the south.\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21088, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "To the west is the west Docking bay of Akatamer.\
", 
            }, 
         }, 
         Vnum = 21028, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Intersection of Barster Road and Monock Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "West  - The Western Docking bay of Akatamer\
\13South - Monock Road\
\13        - To Trading Post  Street\
\13        - To Law Avenue\
\13East  - Barster Road\
\13        - To Akatamer Square\
\13North - Monock Road\
\13        - To Security Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in the four cardinal directions.\
", 
      }, 
      [21029] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21030, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Monock Road stretches northward.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21028, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The intersection of Barster Road and Monock Road is south of here.\
", 
            }, 
         }, 
         Vnum = 21029, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Monock Road", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in two directions north and south.\
", 
      }, 
      [21030] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21031, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Monock Road extends northward.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21067, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21029, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Monock Road stretches southward.\
", 
            }, 
         }, 
         Vnum = 21030, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Monock Road", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not palnning to tackle for awile. \
", 
      }, 
      [21031] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21032, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Monock Road meets with Security Road to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21030, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Monock Road lies to the south.\
", 
            }, 
         }, 
         Vnum = 21031, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Monock Road", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not planning to tackle for awile.\
", 
      }, 
      [21032] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21033, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Security Road lies to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21031, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Monock Road lies to the south.\
", 
            }, 
         }, 
         Vnum = 21032, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Meeting of Monock Road and Security Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East - Security Road\
\13        - to Anna Avenue\
\13        - to Luke Street\
\13South - Monock Road\
\13        - to Barster Road\
\13        - to Trading Post  Street\
\13        - to Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&R Monock Road and Security Road come together here to form one of the four\
corners of Coral City.  From here you can smell the ocean sea salt form\
the nearby breakwall to the west. It reminds you of the fun you have\
swimming in the huge ocean that surrounds this city. Monock Road lies to\
the south, while Security Road stretches \
", 
      }, 
      [21033] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21034, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Security Road stretches eastward.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21032, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Security Road and Monock Road meet to the west.\
", 
            }, 
         }, 
         Vnum = 21033, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Road", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&RYou stand on  Security Road staring at the two suns or the stars above\
your head, depending on time.  This newly paved street is made of polished\
rock that glimers when the first sun comes up. In the distence you can see\
Mon Calamrian children playing in the nearby park. \
", 
      }, 
      [21034] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21035, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Security Road lies to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21131, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21033, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Security Road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21034, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Road", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&RYou travel down a newly lanscaped area of Security Road.  In the new park\
created to the south you can hear strange animal noises that remind you of\
the days back when you used to go to the galactic zoo.  The mysterious\
melody relaxes you as you start to whistle with the birds in a city of\
peace and goodness.  Security Road stretches east and west.\
", 
      }, 
      [21035] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21004, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The intersection of Anna Avenue and Security Road is east of here.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21034, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Security Road stretches westward.\
", 
            }, 
         }, 
         Vnum = 21035, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Road", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&R You are walking cautiously through this part of Security Road.  Lately\
you have heard rumors of thieves prowling these parts, mocking the very\
name of the road.  But that is mostly not likely. The newly paved street\
\
ranges to the east and west.\
", 
      }, 
      [21036] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21037, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Barster Road stretches onward in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21000, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road to the west leads to Akatamer Square.\
", 
            }, 
         }, 
         Vnum = 21036, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Barster Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13South - The Archives\
\13        - To the Legendary Stories of the Archives\
\13        - To the Predictions of the Archives\
\13West  - Barster Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13        - To Akatamer Square\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east and west is the  Barster Road  \
", 
      }, 
      [21037] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21038, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Barster Road continues in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21126, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The enterence to Akatamer's Tower of Jedi's are to the south.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21036, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Barster Road continues in this direction.\
", 
            }, 
         }, 
         Vnum = 21037, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Barster Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13South - Akatamer Tower of jedi's \
\13        - To the Guild of Jedimasters\
\13West  - Barster Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13        - To Akatamer Square\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&c While walking Barster Road, you gaze up at the Akatamer medical\
facility, whose entrance lies to the south. New plantlife grows along side\
the road,&G adding a buitiful haze of green. &c The lengthy rock carved\
out road stretches to the east and west.&x\
", 
      }, 
      [21038] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21012, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The intersection of Barster Road and Luke Street lies to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21133, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21037, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Barster Road stretches to the west as far as the eye can see.\
", 
            }, 
         }, 
         Vnum = 21038, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Barster Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13South - Akatamer Academy\
\13West  - Barster Road\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13        - To Akatamer Square\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&c Young and giddy Mon Calmarians pass you as you travel this portion of\
Barster Road.  Gazing southward, you see the illustrious Coral City\
Academy, which has the responsibility of educateting new Mon Calamarian's.\
 The newly carved rock road of Barster  continue to the east and west.\
", 
      }, 
      [21039] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21000, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road to the east leads to Akatamer Square.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21040, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Barster Road stretches onward as far as the eye can see.\
", 
            }, 
         }, 
         Vnum = 21039, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Barster Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13        - To Akatamer Square\
\13South - Western Hall\
\13West  - Barster Road\
\13        - To Monock Road\
\13\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east is Coral City Square, while Barster Road\
leads on to the west.   \
", 
      }, 
      [21040] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21039, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Barster Road stretches further eastward.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21069, 
               Keyword = "door", 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "The town hotel  awaits.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21041, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Barster Road stretches further westward.\
", 
            }, 
         }, 
         Vnum = 21040, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Barster Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13        - To Akatamer Square\
\13South - The hotel \
\13West  - Barster Road\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&cHere the city's only and extremly large  Hotel stands to the south It was\
constructed fromt he remains of crashed space vessel. It is considered\
sheek to stay in this coverted junk heap (Who figures?)You make note to\
remember  this location for later.  Gazing to the east and west, you can\
see nothing but Barster Road. \
", 
      }, 
      [21041] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21040, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Barster Road continues in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21068, 
               Keyword = "door", 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "The tavern lies to the south.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21028, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Barster Road and Monock Road cross to the west.\
", 
            }, 
         }, 
         Vnum = 21041, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Barster Road", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "East  - Barster Road\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13        - To Akatamer Square\
\13South - The Grim Smile\
\13West  - Barster Road\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&c Cheery laughter can be heard in this section of Barster Road.  Listening\
closely, you are not surprised to find the laughter coming from the\
Cantinia to the south.  People from differnt planets passing by also seem\
interested in those who can find joy in these dark times. This tavern is\
best place to find new friends, bith good and evil. Barster Road ranges to\
the east and west.\
", 
      }, 
      [21042] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21000, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The road to the north leads to Akatamer Square.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21043, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "A bustling intersection lies to the south.\
", 
            }, 
         }, 
         Vnum = 21042, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Anna Avenue", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&PYou are travelling upon the southern portion of Anna Avenue.  The newly\
constructed buildings of the Coral City Trading Post street rise high into\
the air to the east and west.  The metallic road stretches to the north\
and south, where you can see a bustling intersection of Mon Calamrian\
shopers.\
", 
      }, 
      [21043] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21042, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Anna Avenue lies to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21048, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21044, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Anna Avenue stretches to the south as far as the eye can see.\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21047, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
            }, 
         }, 
         Vnum = 21043, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Intersection of Anna Avenue and Trading Post  Street", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Anna Avenue\
\13        - To Security Road\
\13        - To Barster Road\
\13        - To Akatamer Square\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - Anna Avenue\
\13        - To Law Avenue\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&YYou stand at the intersection of Anna Avenue and Trading Post  Street. \
The intersection bustles with activity as citizens go about their\
business. To the east and west runs Trading Post  Street, lined with the\
exotic and local shops of Coral City, while Anna Avenue lies to the north\
and south. \
", 
      }, 
      [21044] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21043, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Intersection of Anna Avenue and Trading Post  Street\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21020, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The intersection of Anna Avenue and Law Avenue lies to the south.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21065, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "You can't make out any details about the dark alley.\
", 
            }, 
         }, 
         Vnum = 21044, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Anna Avenue", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Anna Avenue\
\13        - To Trading Post  Street\
\13        - To Barster Road\
\13        - To Security Road\
\13        - To Akatamer Square\
\13West  - Thieves Alley\
\13        - To the Guild of Thieves\
\13South - Anna Avenue\
\13        - To Law Avenue\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&PWhile traversing the busy, smooth carved road of Coral City, you notice a\
\
particularly dark alley to the west which citizens commonly avoid. As  you\
 imagine running into a cloaked thief lurking in the shadows. Anna Avenue\
extends to the north and south.\
", 
      }, 
      [21045] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21046, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "More shops attract your attention to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21052, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "A jewelry shop has been set up in the tent to the south.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21026, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Trading Post  Street meets up with Monock Road to the west.\
", 
            }, 
         }, 
         Vnum = 21045, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Trading Post  Street", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The Scribe's Tent\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13South - The Shining Emerald\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13Anikiem's Rocks - CLOSED - due to hi shipping costs.\
\13 \
\13I have moved closer to the mines to increase my profits.\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "To the north is where a rock seller used to hold shop, on the door is a\
small sign. it does keep your wife happy. Trading Post  Street extends to\
the east and west. \
", 
      }, 
      [21046] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21054, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The Spice Trader's is to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21047, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "More shops attract your attention to the east.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21053, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The Akatamer mail service is situated in a building to the south.\
\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21045, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "More shops attract your attention to the west.\
", 
            }, 
         }, 
         Vnum = 21046, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Trading Post  Street", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The Spide Dealer\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13South - The Akatamer Courier\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&YCitizens of Coral City waddle  around you, anxious to finish their\
shopping. Gazing northward, you can see a female Rodian drying a multitude\
of spices, while to the south you see Coral City's courier service. \
Trading Post  Street ranges to the east and west. \
", 
      }, 
      [21047] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21043, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "You see the intersection of Anna Avenue and Trading Post  Street.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21056, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "A mapmaker store lies to the south.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21046, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "More shops attract your attention to the west.\
", 
            }, 
         }, 
         Vnum = 21047, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Trading Post  Street", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Sorry due to costs of shipping I have moved my shop below closer to the\
\13mine.\
\13", 
               Keyword = "note", 
            }, 
            [2] = 
            {
               Description = "North - Hermit's Tent\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13        - To Anna Avenue\
\13South - Map Builders\
\13West  - Trading Post  Street\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&YThe newly carved polished stone rock road is buzzing with activity. \
Eager shouts from numerous new buildings encourage potential customers to\
come inspect a shopkeeper's;wares.  To the north is Anikem's new shop,\
while a Map Builder  just moved in to the south.  Trading Post  Street\
stretches to the east and west. \
There is a small note tacked up on the north door.\
", 
      }, 
      [21048] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21057, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The barbecue stand lies in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21049, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "More shops attract your attention in this direction.\
\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21058, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "You can see a stocky Mon Calamrian repairing equipment.\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21043, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The intersection of Anna Avenue and Trading Post  Street lies to the west.\
", 
            }, 
         }, 
         Vnum = 21048, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Trading Post  Street", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The Bantha Barbecue\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - The Unlit Saber\
\13West  - Trading Post  Street\
\13        - To Anna Avenue\
\13        - Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&YThe newly carved rock road is buzzing with activity.  Eager shouts from\
the newly built buildings encourage potential customers to come inspect a\
shopkeeper's wares.  To the north you can smaell the sweet aroma that is\
the Bantha barbecue Shop , while the building to the south is dedicated to\
repairing broken items.  Trading Post  Street stretches to the east and\
west.\
", 
      }, 
      [21049] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21060, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "You can see a bakery to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21050, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "More shops attract your attention in this direction.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21059, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The Bobba waresis to the south.\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21048, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "More shops attract your attention in this direction.\
", 
            }, 
         }, 
         Vnum = 21049, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Trading Post  Street", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - The Akatamer Bakery\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - The Bobba Wares\
\13West  - Trading Post  Street\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&YCitizens of Coral City scamper about you, eager to finish their shopping.\
The aroma of fresh bread assails your nose, coming from a bakery from the\
north, and you can see Armory clanging from the wind on the shop to the\
south.ity's armoury to the south.  Trading Post  Street ranges to the east\
and west. \
", 
      }, 
      [21050] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21061, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The dairy to the north deals in all blue milk dairy products.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21014, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Trading Post  Street joins up with Luke Street to the east.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21062, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Weapons can be bought or sold in the store to the south.\
", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21049, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "More shops attract you in this direction.\
\
", 
            }, 
         }, 
         Vnum = 21050, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Trading Post  Street", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "North - Blue Milk Dairy Products\
\13East  - Trading Post  Street\
\13        - To Luke Street\
\13South - The Vibro-Fizz\
\13West  - Trading Post  Street\
\13        - To Anna Avenue\
\13        - To Monock Road\
\13", 
               Keyword = "sign post signpost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&YYou smile at the familiar sight of Trading Post  Street and its glorious\
newly built buildings. The buzz of vibro-blades can be heard from the\
south, while the blue milk dairy is situated to the north.  Trading Post \
Street extends east and west. \
", 
      }, 
      [21051] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21019, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21051, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Interior of City Hall", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [21052] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21045, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21052, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Shining Emerald", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 100,000 credits 16 CHA\
\13Sorry ultima-pearls not included.\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&O A locked display box dominates this particular shop.  Under the glass of\
the box are two of the only three known ulti-ma pearls in existence., each\
lying gently upon a miniscule cushion. Various other items are displayed\
in differnt boxes. Hanging from the walls are various paintings, while\
sculptures take up the rest of the floor space. A north door leads back\
out onto Trading Post Street.\
", 
      }, 
      [21053] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21046, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "An opening in the building leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21053, 
         Tunnel = 0, 
         Flags = 
         {
            [18] = "NoDrop", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Coral City Courier Office", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - Mail Service is Governemnt Own sorry!\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&O An immense computer set against the southern wall of the Building has\
been organized into small consoles, each containing letters to and from\
the citizens of Coral City through Star mail.  Errand boys are constantly\
coming in and collecting disks for delivery.  In the center of the room is\
a large glatic_net mail terminal where people from around the world can\
send mail. A door to the north leads back out onto Trading Post  Street .\
", 
      }, 
      [21054] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21046, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21054, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Spice dealer", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 50,000 Must be a smuggler of 40\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&OThis newly contructed building is filled with the scent of dried spices.\
Wooden shelves are lined with spices, each of varying colors. A counter\
sits in the center of the room. Walking nearer, you notice a small plaque\
on the counter which reads 'Success lies in Spices'. Dispite numerous\
attempts to outlaw spices , they are still legal in this city. A door\
south leads back out onto Trading Post  Street.\
", 
      }, 
      [21055] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 6882, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21055, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Anakiem's Rocks", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - Not for Sale\
\13", 
               Keyword = "cost ", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&O A musty odor fills your nostrils as you inhale.  Shelves hug the walls\
of this newly created building, each shelf filled with  items from the\
mines or ocean floor.  As you begin to inspect several of the shelves, you\
notice they are all covered in dust and dirt.  A square wooden counter\
sits in the center of the room, and to to the south a door leads back out\
onto Trading Post  Street. \
", 
      }, 
      [21056] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21047, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21056, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Maps", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 50,000 credits Wis 16\
\13Also Mon Calamarian\
\13", 
               Keyword = "cost ", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&OYou find yourself in a rather small and empty shop.  Parchments tied into\
neat packs lie about in an unorganized manner in the back corner.  A\
counter in the center of the room houses numerous state of the art\
Holo-Maps, as well as a couple more computer writing tools. This thin\
printer is havinga hard time converting to new technology, and is even\
contemplating retiring. A door to the  north leads back out onto Trading\
Post  Street. \
", 
      }, 
      [21057] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21048, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "An opening in the tent allows you to return to Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21057, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Bantha Barbecue Shop", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&OThe smell of fresh meat grilled to a perfection as only chef Wannie knows\
how is present in the air of this shop.  Kept cool in frosted vaults, the\
city chef sells his meats here, imported from planets far distant or\
harvested form the ocean. There are a few tables scattered around for you\
to sit at, and share stories with your friends.Through the door to the\
south is Trading Post  Street.\
", 
      }, 
      [21058] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21048, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21058, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Unlit saber", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 38.000 credist \
\13Must be Engineer of 50\
\13", 
               Keyword = "cost ", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&O You stand within the modernized building of the city's Repair tech. On\
the floor behind the counter you can see various pieces of Equimpment; a\
poor fellow distroyed. ; Most of Torvals's business is from the military,\
although he does do some private sector every once in awile.  A door north\
leads back out onto Trading Post  Street. \
\
To repair obj or weapon type:  repair (obj)\
\
Sorry there is a small fee for the job.\
", 
      }, 
      [21059] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21049, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21059, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Bobba's wares", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 80,000 plus a Dinner with Bobba Fett\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&O This Mon Calamarian is a dedicated creator of armor and shields.  Having\
lost her son to shabby equipment, she took up the job of putting\
protective suits of armor together. She is also  extremly infatuated with\
the legendary Bobba Fett, and collects any holographics  or drawings of\
this great Bounty Hunter. The enterance leads back out north onto Trading\
Post  Street.\
", 
      }, 
      [21060] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21049, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21060, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Akatamer Bakery", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 28,000 And a Love for Bread\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&OUpon entering the Akatamer Bakery, you find yourself surrounded by\
citizens of the marvelous city, each waiting in line for their daily\
bread. This Mon Calamrian is famous for his fine baked bread made from\
refined seaweed. This green food is terrific with every meal. The door to\
the south leads back out onto Trading Post  Street. \
", 
      }, 
      [21061] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21050, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21061, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Blue Sea-Cow", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 28,000 credits a you must marry off His daughter.\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&OThis small shop smells strongly of blue cheese, as dozens of types of\
cheeses have been laid out and labeled properly on several long shelves. \
You notice many bottles of blue milk, considered to be more important than\
even water, carefully stacked in the northeast corner.  This Mon girl is\
staioned here by here father to sell this rare drink froma seacow. Through\
the door Trading Post  Street lies to the south.\
", 
      }, 
      [21062] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21050, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
            }, 
         }, 
         Vnum = 21062, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Vibro-Fizz", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 89,000 credits and Engineering\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&ORacks line the walls of this store, each filled to the brim with weapons.\
You grin evilly at the items of destruction, and try out a couple on the\
practice dummies hung from the ceiling.  A counter in the center of the\
room is where the keeper of this shop does business.  He is an extremly\
large calamarian who knows his stuff. The door to the north leads back out\
onto Trading Post  Street.\
", 
      }, 
      [21063] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21064, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The Thieves Alley continues in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21025, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Monock Road lies to the west.\
", 
            }, 
         }, 
         Vnum = 21063, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Thieves Alley", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
      }, 
      [21064] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21065, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The Thieves Alley continues in this direction.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21063, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The Thieves Alley continues in this direction.\
", 
            }, 
         }, 
         Vnum = 21064, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Thieves Alley", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
      }, 
      [21065] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21044, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Anna Avenue lies to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21064, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The Thieves Alley continues in this direction.\
", 
            }, 
         }, 
         Vnum = 21065, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Thieves Alley", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "You are walking through a particularly dark and unkempt alley of Akatamer.\
Whomp rats scurry across the metallicground, squeaking at you.  Empty crates and\
tattered rags are lying about.  The alley opens up to Anna Avenue to the\
\
east, while to the west the darkness deepens.\
", 
      }, 
      [21066] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21022, 
               Keyword = "door", 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [3] = "Secret", 
               }, 
               Key = -1, 
               Description = "The door leads back out onto Law Avenue\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21180, 
               Keyword = "hatch", 
               Direction = "down", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21066, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Annir's Clothing", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&O The shop you have entered smells heavily of dried bantha leather. \
Gazing about, you see all manners of clothing, from leather to silk.  A\
coral counter lines the northern wall of the shop, and several stalls line\
the eastern wall, where you can try on your clothes (after you pay for\
them.).  A door to the south leads back out onto Law Avenue. \
", 
      }, 
      [21067] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21030, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21067, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Companions and Mounts", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&O You walk into a large shop which smells of Banthas.  Behind the long\
wooden counter are dozens of cages containing varying types of animals. \
You can hear the sounds of creatures coming from a store room in the back\
of the shop.  A path to the west leads back out onto the busy Monnock St.\
", 
      }, 
      [21068] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21041, 
               Keyword = "door", 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "A door leads out onto Barster Road.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21069, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The hotel  lies to the east.\
", 
            }, 
         }, 
         Vnum = 21068, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Tavern", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&OYou enter the city's lavish cantinia, in fact the only bar inside the\
city;itself, appropriately connected to the city's hotel  to the east\
through a hallway. That way visitors can just get drunk then head over to\
bed. Smoke and the smell of alcohol mix with laughter, quickly gives you a\
dull headache. To the east is the town hotel , while the fresh air of the\
\
outdoors stands at bay to the north.\
", 
      }, 
      [21069] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21040, 
               Keyword = "door", 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "Barster Road lies to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21068, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The tavern lies to the west.\
", 
            }, 
         }, 
         Vnum = 21069, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Akatamer hotel ", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&OHere a weary traveller can seek a good rest in comfort without fear of\
theft or, worse yet, murder.  A long counter stretches across much of the\
room, and for a few credits the hotel keeper will gladly rent you one of\
his rooms.  Drunken laughter emerges from a hall to the west.  To the\
south beyond a door barred by the hotel keeper are the rooms.\
 \
You may safely quit here.\
", 
      }, 
      [21071] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21127, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21071, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your\
body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "&C Inside Bacta Tank", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This room is for the severly wounded. Please donot take advantage of this\
great Facility or the Mon Calamarian Officals will have to remove the\
bacta tank. \
", 
      }, 
      [21072] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21100, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21072, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Restarea", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z This lavish room comes complete with plush bantha leather seat benches.\
A brand new drinking fountain that diperses fresh salt water for drinking.\
And a new cooking droid here to serve some of the great Mon Calamari food.\
The floor is a soft grey colored marble like rock sanded to a smooth\
surface. \
", 
      }, 
      [21073] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21151, 
               Keyword = "door", 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21021, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21073, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Factory Enterence", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c &C You stand before huge doors of the Krantz mining ore factory complex.\
 the doors are kept closed, yet the bared windows are cracked open to give\
all the heat and noise inside a means of escaping.  The doors are made of\
some sort of black metal, most likely found on the ocean floor  seemingly\
impenatrable, and has the Krontz symbol K carved into them  You are not\
sure if the doors are meant to keep intruders out, or workers in...\
", 
      }, 
      [21074] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21020, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Two roads cross to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21075, 
               Keyword = "Docking bay", 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21073, 
               Description = "The Docking bay leads outside of Akatamer.\
", 
            }, 
         }, 
         Vnum = 21074, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Inside the Southern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z You stand inside the southern Docking bay of Coral City. Ships of all\
sizes line the many enterences.There is only four docking bays on Mon\
Calamari that is known to the public and all four exsist on the outskirts\
of the city. They were originally created as Imperial Slave ports but were\
later converted to Docking bays.To the north is the intersection of Anna\
Avenue and Law Avenue.\
", 
      }, 
      [21075] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21074, 
               Keyword = "Docking bay", 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21073, 
               Description = "The Docking bay leads into the city of Akatamer.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21123, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "A path begins to the east.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21076, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "A path begins to the west.\
", 
            }, 
         }, 
         Vnum = 21075, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Outside the Southern Docking bay", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Searching thoroughly, you discover a manhole hidden beneath one of the\
\13many harbor edges.\
\13", 
               Keyword = "foliage", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the eastand west. While to the north you\
can hear the sounds of ships landing and taking off.\
", 
      }, 
      [21076] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21075, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "To the east the southern Docking bay of Akatamer.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21077, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21076, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road west of the Southern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
\
the city.  The road stretches to the east and west. \
", 
      }, 
      [21077] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21076, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21078, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21077, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You are on carved out rock road rounding the southern wall of Akatamer.\
The familiar sound of running water emanates from the Mon Calamarian ocean\
to the south. The large breakwater was created to keep the nasty wind\
storms that come up from spalshing 50 ft. waves upon the city.  The road\
stretches to the east and west. \
", 
      }, 
      [21078] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21077, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21079, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The trail continues to the west.\
", 
            }, 
         }, 
         Vnum = 21078, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
      }, 
      [21079] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21078, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21080, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21079, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can hear the\
ocean getting nearer to the west.  \
", 
      }, 
      [21080] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21079, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21081, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Vnum = 21080, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can see the ocean\
front just off a dock to the west. \
", 
      }, 
      [21081] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21082, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "A path begins to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21080, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "A road begins to the east.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 6908, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21081, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Before the Dock", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c  You have come to the western most spot of the city. before you is a\
large dock leading out to the ocean..  Its supports are cracked,and the\
entire structure seems liable to fall into the ocean at any moment. To the\
north and east are two plain man made roads. \
", 
      }, 
      [21082] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21083, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21081, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The trail continues to the south.\
", 
            }, 
         }, 
         Vnum = 21082, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.\
", 
      }, 
      [21083] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21084, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The trail continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21082, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Vnum = 21083, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.You look into the sky\
and see a common Mon Calamarian bird above.\
", 
      }, 
      [21084] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21085, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The road continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21083, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Vnum = 21084, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
      }, 
      [21085] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21086, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21084, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Vnum = 21085, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
      }, 
      [21086] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21087, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The western entrance to Akatamer lies to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21085, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The Water Shuttle continues rounding the city wall of Akatamer.\
", 
            }, 
         }, 
         Vnum = 21086, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road south of the Western Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
      }, 
      [21087] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21089, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "A path begins to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21088, 
               Keyword = "Docking bay", 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21070, 
               Description = "The Docking bay leads into the city of Akatamer.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21086, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "A road begins to the south.\
", 
            }, 
         }, 
         Vnum = 21087, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Outside the Western Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the east you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
      }, 
      [21088] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21028, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Two roads cross to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21087, 
               Keyword = "Docking bay", 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21070, 
               Description = "The road continues deep into the metallic waste land s of Haon Dor.\
", 
            }, 
         }, 
         Vnum = 21088, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Inside the Western Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z You stand in the western dockingbay, do to the massive damage this place\
took by the empire , only small shuttles can enter this docking bay. This\
platform was designed as a slave port for Mon Calamrian workers by the\
Empire years ago, but were later easily converted in to Docking Bay's for\
the Rebellion's greatest ship builder. You can hear the soft wind of the\
ocean to the west.\
", 
      }, 
      [21089] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21090, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21087, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The western Docking bay is to the south.\
", 
            }, 
         }, 
         Vnum = 21089, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road north of the Western Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the south you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
      }, 
      [21090] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21091, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21089, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Vnum = 21090, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The sign reads:\
\13 Hail Mon Calamrian!  You stand before the Ocean, a\
\13...which is populated by one of the smaller races of \
\13the world.  Do Not enter this zone any further...\
\13We see no use for New Rebublic law now..\
\13", 
               Keyword = "sign", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
      }, 
      [21091] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21092, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21090, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Vnum = 21091, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
      }, 
      [21092] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21093, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21091, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The trail continues to the south.\
", 
            }, 
         }, 
         Vnum = 21092, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
      }, 
      [21093] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21094, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "A gentle sea breeze is coming in from the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21092, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Vnum = 21093, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
      }, 
      [21094] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21095, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21093, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Vnum = 21094, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and south. \
\
", 
      }, 
      [21095] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21096, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21094, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21095, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
      }, 
      [21096] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21097, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The trail continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21095, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Vnum = 21096, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "water and ocean plantlife lye on the top of the holodisk:\
\13You place the disk into your reader ,,,,it says :\
\13Akatamer's Time Will Come, Hail the New Empire.\
\13", 
               Keyword = "holodisk", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
      }, 
      [21097] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21098, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21096, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Vnum = 21097, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
breeze from the ocean beyond.\
", 
      }, 
      [21098] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21099, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "Akatamer's northern Docking bay is to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21097, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21098, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On the Road West of the Northern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
drop of water from the ocean beyond.\
", 
      }, 
      [21099] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21101, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The path begins to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21100, 
               Keyword = "Docking bay", 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21071, 
               Description = "The Docking bay leads into Akatamer.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21098, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road begins to the west.\
", 
            }, 
         }, 
         Vnum = 21099, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "field", 
         Name = "Outside the Northern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the south you can\
hear alot of hustle and bustle of ships taking off.\
\
", 
      }, 
      [21100] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21099, 
               Keyword = "Docking bay", 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21071, 
               Description = "The Docking bay leads out of Akatamer.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21072, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21004, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Two roads meet to the south.\
", 
            }, 
         }, 
         Vnum = 21100, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Inside the Northern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z You stand in the main docking bay of the planet Mon Calamari. This state\
of the art Dockingbay recently recived a facelift to allow for a better\
image of the planet. The floor is now a polished metal, that reflexs the\
extensive lighting system they installed. From the ceiling you can see new\
sprinklers to allow mon citizens to remain damp. This new facility was also\
outfitted with a restarea to the east for individuals waiting for the\
transport. To the North is outside the city. While to the South is the\
intersection of Anna Avenue and Security Road. We hope you enjoy your stay\
here at Coral City (formally Akatamer)!\
", 
      }, 
      [21101] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21102, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The trail continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21099, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Akatamer's northern Docking bay is to the west.\
", 
            }, 
         }, 
         Vnum = 21101, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On the Road East of the Northern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the west you can\
hear alot of hustle and bustle of ships taking off.\
", 
      }, 
      [21102] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21103, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21101, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Vnum = 21102, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The sign reads:\
\13 Welcome to Akatamer - Upper World - City of Hope.\
\13", 
               Keyword = "sign", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
      }, 
      [21103] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21105, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21102, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The trail continues to the west.\
", 
            }, 
         }, 
         Vnum = 21103, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
      }, 
      [21105] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21106, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21103, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21105, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You see a Mon Clamrian\
bird soaring in the sky.\
", 
      }, 
      [21106] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21107, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The path continues to the south.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21105, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The path stretches westward.\
\
", 
            }, 
         }, 
         Vnum = 21106, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the South and west. \
", 
      }, 
      [21107] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21106, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path curves around the northeastern corner.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21108, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Vnum = 21107, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the eastern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from splashing 50 ft. waves upon\
the city.  The road stretches to the South and North. \
", 
      }, 
      [21108] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21107, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The trail stretches northward.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21109, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Vnum = 21108, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
", 
      }, 
      [21109] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21108, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The road heads northward.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21110, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road extends to the south.\
", 
            }, 
         }, 
         Vnum = 21109, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
\
", 
      }, 
      [21110] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21109, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21111, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Vnum = 21110, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. \
", 
      }, 
      [21111] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21110, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21112, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "Akatamer's eastern Docking bay is to the south.\
", 
            }, 
         }, 
         Vnum = 21111, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On the Road North of The Eastern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the south you can\
\
hear starships taking off.\
", 
      }, 
      [21112] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21111, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "A path begins to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21114, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "A road begins to the south.\
", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21113, 
               Keyword = "Docking bay", 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21072, 
               Description = "The Docking bay leads into Akatamer.\
", 
            }, 
         }, 
         Vnum = 21112, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Outside the Eastern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the east you can hear\
starships taking off.\
", 
      }, 
      [21113] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21112, 
               Keyword = "Docking bay", 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = 21072, 
               Description = "The Docking bay leads out of Akatamer.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21012, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "Two roads cross to the west.\
", 
            }, 
         }, 
         Vnum = 21113, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Inside the Eastern Docking bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z You stand inside the eastern Docking bay of Coral City.  This docking\
\
bay gets very little use, very little survalanice..and consequently is\
known for it's secretive cargo. To the west is the intersection of Barster\
Road and Luke Street. \
", 
      }, 
      [21114] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21112, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The eastern Docking bay is to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21115, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Vnum = 21114, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On the Road South of The Eastern Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the north you can\
hear starships taking off.\
", 
      }, 
      [21115] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21114, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The trail continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21116, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Vnum = 21115, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
      }, 
      [21116] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21115, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The road continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21117, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The path continues to the south.\
", 
            }, 
         }, 
         Vnum = 21116, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
      }, 
      [21117] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21116, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21118, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Vnum = 21117, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
      }, 
      [21118] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21117, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21119, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "The road continues to the south.\
", 
            }, 
         }, 
         Vnum = 21118, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. You can feel a soft mist\
coming from the ocean.\
\
", 
      }, 
      [21119] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21118, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "The path continues to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21120, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21119, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the eastern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the north. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and North. You\
can feel a soft mist coming from the ocean.\
", 
      }, 
      [21120] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21119, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21121, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21120, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
      }, 
      [21121] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21120, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21122, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Vnum = 21121, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
      }, 
      [21122] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21121, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21123, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The path continues to the west.\
", 
            }, 
         }, 
         Vnum = 21122, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You walk briskly on carved out rock road rounding the southern wall of\
Akatamer.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the south. The large breakwater was created to keep\
the nasty wind storms that come up from spalshing 50 ft. waves upon the\
city.  The road stretches to the east and west. \
", 
      }, 
      [21123] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21122, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The path continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21075, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "The road continues to the west.\
", 
            }, 
         }, 
         Vnum = 21123, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "On a Road Rounding Coral City.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can feel brief\
splashes of water as the ocean spills over the breakwall.\
", 
      }, 
      [21124] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21123, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The road continues to the east.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21075, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "To the west is the southern Docking bay of Akatamer.\
", 
            }, 
         }, 
         Vnum = 21124, 
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
      [21126] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21037, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "Barster Road is to the north.\
", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21127, 
               Keyword = "door", 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "The Tower of Mon Calamri lies to the south.\
", 
            }, 
         }, 
         Vnum = 21126, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "&p Mon Calamri Medical Facility", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c Before you is a large plain rock building used for healing the sick. The\
rock surface was once a coral underwater creature but is now a memorial to\
what once was. Here you can enter and recive top of the line treatment,\
from some of the greatest medical minds in the galexy. &R The pathway was\
properly framed with imported red plantlife. &c This is another one of\
those steps the new city officols are doing to clean up this city.\
", 
      }, 
      [21127] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21126, 
               Keyword = "door", 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21129, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21128, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "An immense library is at the end of the corridor to the west.\
", 
            }, 
         }, 
         Vnum = 21127, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "&pWithin the Mon Calamri Medical Facility", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&R due to money shortages we no longer can allow free\
\13treatment.\
\13 \
\13To enter the north you must first give the 100 credits to the Sec.\
\13 \
\13Sorry we no longer take Glactic Insurance.\
\13", 
               Keyword = "sign", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&C You walk beneath the impossibly high arches which support the Mon\
Calamari Medical facility.  Walls crafted of smooth coral rock are covered\
with extravegant Calamrian art which create a dazzling array of shimmering\
colors.  A inpatient desk lies in the center of the room, so one can check\
in. To the west is the waiting room. To the east is the medical supply\
store While the south leads to the main Bacta tanks. There is a sign at\
\
the enterance to the south. \
", 
      }, 
      [21128] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21127, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "The corridor leads back to the main hall.\
", 
            }, 
         }, 
         Vnum = 21128, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Waiting Room", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c This room while not highly decorated is a perfect place for adventurers\
who are grouping with a injured partener. The floor is a well polished and\
clean coral rock. While the walls are decorated with hand drawn pictures\
from Mon Calamarian children. \
", 
      }, 
      [21129] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21127, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21129, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Medical Supply Store", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&C This small area of the building was sectioned off to allow travelers to\
Mon Calamari the option to purchase medical equipment. The walls are a\
polished coral rock which give off a pinkish reflection. The floor has a\
\
medical track on it to allow easy transport of victims to and from areas\
of the Medical facility. To the West is the Main hallway\
", 
      }, 
      [21130] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21009, 
               Keyword = "door", 
               Direction = "east", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21130, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "New Rebublic Mon Headquaters", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "There apears to be a small residue of dirt trailing from the entrance to\
\13the north east corner\
\13", 
               Keyword = "dirt ", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&z This high tech space appears to have no exits except for the main door.\
The walls are a smooth pink coral surface decorated with pictures and\
space charts. There appears to be dirt on the checkered pattern floor and\
a small lighting unit is suspeneded from the ceiling.\
", 
      }, 
      [21131] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21034, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21135, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21134, 
               Keyword = "", 
               Direction = "southeast", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21137, 
               Keyword = "", 
               Direction = "southwest", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21131, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Coral City Park", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Please fell free to stop by at anytime, just DON\"T leave your children\
\13here, unattended.\
\13", 
               Keyword = "sign", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&G A attractive black metal gate frames the enterence to Coral City's\
newest relaxation area. The Security Park, is home to a few rare \
creatures flown in and captured by customs. Due to the lack of space for\
storage , city officals created this new park for them to roam around in.\
It also allows for Mon Calamarian youth to have a safe and fun place to\
play in. There is a large sign above the metal frame that welcome's all to\
the park.\
", 
      }, 
      [21132] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21139, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21005, 
               Keyword = "door", 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21145, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21132, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Lobby", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z You enter the main office of the Mon Calamari Security. This room is\
slightly, less extravegant then the rest, and has more of a rough ocean\
bottom feel. The walls  are decorated with pictures of wanted men, and the\
floors are polished rock that imitates a marble look. This rock was\
inported from the depths of the ocean floor. In front of you is a large\
counter to which you see alot of people working behind. At the counter is\
a sign that says step up for assistance.\
", 
      }, 
      [21133] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21038, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21133, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Coral City Academy", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
      }, 
      [21134] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21135, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21131, 
               Keyword = "", 
               Direction = "northwest", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21136, 
               Keyword = "", 
               Direction = "southwest", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21134, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Coral City Park", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for it's\
durablity and groth rate. Both of which will be need to maintain the\
trampling and activity it will see. This grass like surface is new to Mon\
Calamarians and they find it extremely interesting, while the Quarren's\
find it just frivlous. \
", 
      }, 
      [21135] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21131, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21134, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21136, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21137, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21135, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Coral City Park", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  You can see a large white leafed tree\
sitting in the middle of the park.\
", 
      }, 
      [21136] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21135, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21134, 
               Keyword = "", 
               Direction = "northeast", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21137, 
               Keyword = "", 
               Direction = "northwest", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21136, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Coral City Park", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  There is a large brown fence keeping the\
animals and people in surrounding  the edge of the park\
", 
      }, 
      [21137] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21135, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21131, 
               Keyword = "", 
               Direction = "northeast", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21136, 
               Keyword = "", 
               Direction = "southeast", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21137, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Coral City Park", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&GThis area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  There is a large fence that surrounds\
the area to keep animals and people in.\
", 
      }, 
      [21138] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21018, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21138, 
         Tunnel = 0, 
         Flags = 
         {
            [8] = "Bank", 
            [30] = "Prototype", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "First Bank of Mon (Main Branch)", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z This marble like surfaced bank allows for easy transactions between you\
and your currencey. There is a large table in the center of the room to\
sign your life away along with, a counter towards the back where a very\
attractive clerk stands and counts the daily inflow of credits. On the top\
of the ceiling you can see a rather expensive security system tracking\
your everymove. The First bank of Mon's motto isn't \"your money is safe\
with us for no reason.\" To make a bank transaction please type bank.\
", 
      }, 
      [21139] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21140, 
               Keyword = "Door", 
               Direction = "east", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 21428, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21150, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21132, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21139, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The damp hallway is a dark grey with light grey flashes\
as you pass the cells. Very little activity occurs here as most criminals\
can't escape with over 20' of rock between them and the corridor. You  are\
safe and sure not to hear any of them. There is a large bashproof door to\
the east with an electronic doorslides for safty.\
", 
      }, 
      [21140] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21141, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21139, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21149, 
               Keyword = "door", 
               Direction = "southeast", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
               Description = "", 
            }, 
         }, 
         Vnum = 21140, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
      }, 
      [21141] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21148, 
               Keyword = "door", 
               Direction = "east", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21140, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21142, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21141, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
      }, 
      [21142] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21141, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21147, 
               Keyword = "door", 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21143, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21142, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them. \
", 
      }, 
      [21143] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21146, 
               Keyword = "door", 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21142, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21144, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21143, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
      }, 
      [21144] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21143, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21145, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21144, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Corridor", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
      }, 
      [21145] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21144, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [3] = "Secret", 
                  [23] = "BashProof", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21132, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21145, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Chief Security Officer's Office", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "The chief of security's office is now vacant. As the last chief was ordered\
to leave by the Crime Syndacate Mon Calamari is currently looking for a\
BRAVE security officer to replace him. If interested please contact\
Ackbar. Sorry you must be Mon Calamari to fulfill duties\
", 
      }, 
      [21146] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21143, 
               Keyword = "door", 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = 21140, 
               Description = "", 
            }, 
         }, 
         Vnum = 21146, 
         Tunnel = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cell Block 1138", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&R George Lucas\
\13&x\
\13", 
               Keyword = "patch", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
      }, 
      [21147] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21142, 
               Keyword = "door", 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
               Description = "", 
            }, 
         }, 
         Vnum = 21147, 
         Tunnel = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cell Block 1139", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
      }, 
      [21148] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21141, 
               Keyword = "door", 
               Direction = "west", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
               Description = "", 
            }, 
         }, 
         Vnum = 21148, 
         Tunnel = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cell Block 1140", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
      }, 
      [21149] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21140, 
               Keyword = "door", 
               Direction = "northwest", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Key = 21140, 
               Description = "", 
            }, 
         }, 
         Vnum = 21149, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cell Block 1141", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
      }, 
      [21150] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21139, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21150, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Station", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "lever", 
            }, 
            [2] = 
            {
               Description = "There is a state of the art computer panel with a televison screen for each\
\13cell\
\13block.\
\13In the center of the computer panel is a large lever.\
\13", 
               Keyword = "computer", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&z This small cubicle is where a very alert and strong guard stays at\
attention. For it is here that the main door opens from and allows access\
to the jail cells. There is a small computer panel on the wall surrounded\
by laser proof glass panels. There is also a large swival chair with a\
recline feature.  The walls and floors are smooth surface unlike the\
surrounding area. It is most likely that this station was recently\
installed.\
", 
      }, 
      [21151] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21152, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21073, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21155, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21151, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Desk", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c There is a big round desk in the middle of the room here, with all sorts\
of security equipment secured around it.  It looks like some sort of\
high-tech, punch in area for workers to check in. There is a room to the\
east, where most of the Quarren and Mon Calamarian workers seem to be\
going. There is a excellent grained wooden door to the west with an\
extravegant golden sign on it.  This room is tastefully done in a coral\
pink and dark purple decor which makes it feel somewhat exciting. You can\
smell in the distence the heavy smoke of iron ore mealting. \
", 
      }, 
      [21152] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21160, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21151, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21152, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Worker's Lobby", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c This is a nice, sunlit area, strewn about with cushions and benches and\
other pieces of Calamrian comforts.  Along one wall is a array of service\
machines that sell food and drinks.  There is a mini kitchen near the\
windows, for the employee's lunches.  The walls are covered with pitures\
of home and of some of the workers children. On the table you even see a\
Mon Calamarian Fish Scout cookiee order form.\
", 
      }, 
      [21153] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21152, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21153, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
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
      [21155] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21156, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "North-Halway", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21151, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21155, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Customer Check-In", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This part of the factory is set up for customer relations with clients.\
There is a protocol droid sitting here to set up meetings, answer\
telecommunica ions and take orders for materials to be sent all over the\
galaxy. The carpet here \
", 
      }, 
      [21156] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21158, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "North-End of Hall", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21157, 
               Keyword = "", 
               Direction = "east", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "East-Equipment Sales", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21155, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "South-Customer Checkin", 
            }, 
         }, 
         Vnum = 21156, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Hallway", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "You are walking along a plush hallway.  Large windows line the western wall\
and a door is set to the east.  The markings on the door indicate a\
salesroom \
", 
      }, 
      [21157] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21156, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "West-Hallway", 
            }, 
         }, 
         Vnum = 21157, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Equipment Sales", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "You barely step into the room and are stopped by a large counter.  A short \
squat Protocol Droid stands here taking orders and feeding the information \
into its counterpart, a large assembly droid.  Bins of parts and pieces line the\
walls behind the counter waiting for thier turn to be used in som useful pieces\
of equipment for you.", 
      }, 
      [21158] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21159, 
               Keyword = "", 
               Direction = "east", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "East-Workshop", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21156, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "South-Hallway", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21170, 
               Keyword = "", 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
               Description = "Up-Ship Repair", 
            }, 
         }, 
         Vnum = 21158, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "End of Hall", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Here a magnetic lift sits waiting to take customers up to the ship repair\
", 
      }, 
      [21159] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21158, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "West-End of Hall", 
            }, 
         }, 
         Vnum = 21159, 
         Tunnel = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Workshop", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "This is the largest and most elaborate workshop you have everseen. A\
magnetic balanced laser guided lathe sits along the north wall and further\
in is several plasma cutters and a bench of specialty tools of all shapes\
and sizes.  Along the south wall lies a circuit building station complete\
with touch screen  \
", 
      }, 
      [21160] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21161, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "North- Observation Room", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21152, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21162, 
               Keyword = "", 
               Direction = "down", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "Down-Workers Entrance", 
            }, 
         }, 
         Vnum = 21160, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Security Check-Point", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Several Infra Scanners sweep over you for an ID check.  You can rest\
assured that if you are wanted on Mon Calamar you won't make it past this\
point.  Sever l Large swiveling blasters guard the room so that no one\
will enter the factory t at isn't meant to be here.  The workers take\
stairs to the plant floor below and managers continue north to the observe\
the proceedings.  To the south is the \
To the north is the observation booth, while down is the worker's\
entrance.\
", 
      }, 
      [21161] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21160, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "South-Security Checkpoint", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21172, 
               Keyword = "", 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
               Description = "Up-Ship Yard", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
               Description = "Down-Mainframe Computer", 
            }, 
         }, 
         Vnum = 21161, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Observation Room", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Several large windows overlook the factory below and hundreds of dials and\
readouts display conditions on the floor below. A few comfortable chairs\
sit  here placed for easy observation of everything.  This is obviously\
where plant managers come to check on the comings and goings of everything\
on the plant flo r. A lev tube in this room can take you up to the\
shipping platform or down to the \
To the south is the check-point, Up is the platform, while down is the\
computer\
mainframe.\
", 
      }, 
      [21162] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21163, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "West-Lift Station", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21160, 
               Keyword = "", 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
               Description = "Up-Security Checkpoint", 
            }, 
         }, 
         Vnum = 21162, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Workers Entrance", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Rows upon Rows of Equipment lockers stand here holding workers personal\
items and tools for work.  This is presumably where those who work at the\
factory  suit up for the day.  There are two exits from here up to the\
security checkpoi t  In the Direction up you can goto the lift station\
while west is the security post. \
", 
      }, 
      [21163] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21164, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "North-Cooling Section", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21162, 
               Keyword = "", 
               Direction = "east", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "East-Workers Entrance", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21171, 
               Keyword = "", 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
               Description = "Up-Warehouse", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
               Direction = "northeast", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "Northeast-Mainframe Computer", 
            }, 
         }, 
         Vnum = 21163, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Lift Station", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "The cooled parts arrive here on a conveyor from the north where they are\
loaded into large boxes and the boxes are loaded on to a repulsor lift and\
taken up to  the uppermost floor for storage and transfer onto shipping\
barges.  From here y u can go east to the workers entrance, you can go\
north further up the line, or up to the warehouse..or ne to the mainframe.\
", 
      }, 
      [21164] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21166, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "North-Molding and Forming", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
               Direction = "east", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "East-Mainframe Computer", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21163, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "South-Lift Station", 
            }, 
         }, 
         Vnum = 21164, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Cooling Station", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Here the converyor makes a series of sharp turns to S its way from the\
north as dozens of droids turn cooling air hoses on the parts to cool them\
before they  make it to the lift station to the south.  Looking east you\
can see the system that controls the entire facility and from the north\
loud clanging and hissing \
", 
      }, 
      [21165] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21167, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "North-Smelting", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21164, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "West-Cooling Section", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21161, 
               Keyword = "", 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
               Description = "Up-Observation Room", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 21168, 
               Keyword = "", 
               Direction = "northeast", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "Northeast-Sorting and Seperating", 
            }, 
            [5] = 
            {
               Distance = 0, 
               DestinationVnum = 21166, 
               Keyword = "", 
               Direction = "northwest", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "Northwest-Molding and Forming", 
            }, 
            [6] = 
            {
               Distance = 0, 
               DestinationVnum = 21163, 
               Keyword = "", 
               Direction = "southwest", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "Southwest-Lift Station", 
            }, 
         }, 
         Vnum = 21165, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Mainframe Computer", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Here before you is a huge cylinderical object that stretchs from floor to\
ceili g lights run the entire circumfrence of the object and wires string\
about running  away from the massive computer in all directions.  Several\
operator stations ci cle the factory's heart and soul as to monitor and\
solve any problems that occur at a moments notice.  It is possible to\
reach almost any station along the line fr m\
", 
      }, 
      [21166] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21167, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21164, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "South- Cooling Section", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
               Direction = "southeast", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "Southeast-Mainframe Computer", 
            }, 
         }, 
         Vnum = 21166, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Molding and Forming", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Here is where the super heated pipes carring the melted down ore end.  They pore\
their precious cargo into shape shifting molds that set the steel into whatever\
shape the clients of this factory require.  They are then lifted on to the conveyor\
by special droids designed to withstand the heat.  After that they are sent south \
to the cooling section.  You could go east to find out where the pipes are filled.\
", 
      }, 
      [21167] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21168, 
               Keyword = "", 
               Direction = "east", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "East-Sorting and Seperating", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "South-Mainframe Computer", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21166, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "West- Molding and Forming", 
            }, 
         }, 
         Vnum = 21167, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Smelting", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "After the ore is seperated further east, it comes here to be dropped in a\
huge vat that melts it down.  Huge specially heated pipes connect to the\
vat here an \
", 
      }, 
      [21168] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21169, 
               Keyword = "", 
               Direction = "north", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "North-Recieving", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21167, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "West-Smelting", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21165, 
               Keyword = "", 
               Direction = "southwest", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "Southwest-Mainframe Computer", 
            }, 
         }, 
         Vnum = 21168, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Sorting and Seperating", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "After the raw ore and other materials are recieved to the north it comes\
here. The materials that are used for maintence and electronic\
construction are seper ted from the ore here. As well unexecatable pieces\
of ore are returned to the molin \
", 
      }, 
      [21169] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21168, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "South-Sorting and Seperating", 
            }, 
         }, 
         Vnum = 21169, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Recieving", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Here is where the moling miner machines return to drop off the ore after stripping\
it from the floor of the ocean below.  Other things are also recieved here as well,\
Parts for maintence of crucial machines and critical components that can not be\
created on site.  The sorting area to the south is responsible for deciphering where \
materials need to go,  here though the main concern is unloading the constant \
stream of machines as quickly as possible.", 
      }, 
      [21170] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21171, 
               Keyword = "", 
               Direction = "east", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "East-Warehouse", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21158, 
               Keyword = "", 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
               Description = "Down-End of Hall", 
            }, 
         }, 
         Vnum = 21170, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Ship Repair", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "A huge hangar surrounds you and large cranes susspended from the ceiling\
work  continuosly peeling old armor off of ships and pulling worn engine\
casings.  Maintence droids of all shapes and sizes swarm over the ships\
here beeping and whiring at an almost frantic pace.  You get the feeling\
that although this is an iron ore factory they recieve a substancial\
income from the repair of ships\
", 
      }, 
      [21171] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21172, 
               Keyword = "", 
               Direction = "east", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "East-Ship Yard", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21170, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "West-Ship Repair", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 21163, 
               Keyword = "", 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
               Description = "Down- Lift Station", 
            }, 
         }, 
         Vnum = 21171, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Warehouse", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "As the repulsor lifts the huge packages of parts bound for other worlds.\
Binary load lifters sweep them up and move them into neat stacks to await \
transport.  Many of the boxes marked armor are sent west to the ship\
repair area and still many other boxes are being sent through huge doors\
to the east \
", 
      }, 
      [21172] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21171, 
               Keyword = "", 
               Direction = "west", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Key = 0, 
               Description = "West-Warehouse", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21161, 
               Keyword = "", 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Key = 0, 
               Description = "Down-Observation Room", 
            }, 
         }, 
         Vnum = 21172, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Shipping Platform", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Here a platform that holds at least five cargo ships at any given time is a\
bee hive of activity.  Binary load lifters beep at you to get out of the\
way as the   charge back and forth between waiting barges and the\
warehouse to the west. A  small lev tube sits out of the way at one corner\
of the platform. It seems to  \
West is the warehouse and Down is the observation booth.\
", 
      }, 
      [21180] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21181, 
               Keyword = "hatch", 
               Direction = "east", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21066, 
               Keyword = "", 
               Direction = "up", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21180, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Secret Room", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z As you look up you can see a few light rays slipping down from the\
cracks in the hard wood floor above. There is a small light positioned in\
the corner of the room. The floor is carved out stone and rather ruffand\
dark. The walls lead around to a small steal circular hatch. If you become\
quiet you can hear small business transactions occuring above.\
", 
      }, 
      [21181] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21180, 
               Keyword = "hatch", 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21182, 
               Keyword = "", 
               Direction = "down", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21181, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Tunnel", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see the hatch, while below you\
look down and see nothing but complete darkness.\
", 
      }, 
      [21182] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21181, 
               Keyword = "", 
               Direction = "up", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21183, 
               Keyword = "", 
               Direction = "down", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21182, 
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Tunnel", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see only darkness, while below\
you look down and see a glimmer of light coming from the darkness.\
", 
      }, 
      [21183] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21184, 
               Keyword = "door", 
               Direction = "east", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21182, 
               Keyword = "", 
               Direction = "up", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21183, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Security Clearance Room", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&c  Looking around you know this place is one of danger and definitely\
doesn't belong here in Coral City. The Walls are carved out magma with\
extremly state of the art security cameras scanning your every bio-stat.\
Attached to the sides of the doors are small laser pods used to make sure\
someone doesn't pass who is not allowed.  \
", 
      }, 
      [21184] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21185, 
               Keyword = "", 
               Direction = "south", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21183, 
               Keyword = "door", 
               Direction = "west", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21184, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Imperial Spy Base", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "&z You stand in a rather large room full of computer and survailence\
equipment. There are strange markings on the displays .You are familiar\
with the markings, Imperial code language . Apparently the rumors about\
the Quarren are true. \
&x\
", 
      }, 
      [21185] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21184, 
               Keyword = "", 
               Direction = "north", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21185, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
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
      [21186] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21187, 
               Keyword = "", 
               Direction = "east", 
               Key = -1, 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 21023, 
               Keyword = "", 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21186, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "&G Universe Construction Co.", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Welcome to the Universe Construction Co. , We are always looking for new\
builders. In this room is the Construction Board. On it will be\
assignments and a way to check in. This is not a place to ask for a zone\
you have to email me or contact me on the game! Failure to follow this\
simple rule will result in you getting smacked with my back fin!!!!\
To the east you see a large Library!\
Contact Ackbar for more info!\
", 
      }, 
      [21187] = 
      {
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 21186, 
               Keyword = "", 
               Direction = "west", 
               Key = -1, 
               Description = "", 
            }, 
         }, 
         Vnum = 21187, 
         Tunnel = 0, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Construction Blueprints", 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Description = "Here you will find some background info available for your reading.\
Understand this is not all you can use but a basic idea to start with. Got\
any more info on projects were doing ..Well email me them at\
MonCal@netscape.net \
", 
      }, 
      [21445] = 
      {
         Exits = 
         {
         }, 
         Vnum = 21445, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
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
      [21499] = 
      {
         Exits = 
         {
         }, 
         Vnum = 21499, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
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
      [21436] = 
      {
         Exits = 
         {
         }, 
         Vnum = 21436, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
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
      [21000] = 
      {
         ItemType = "potion", 
         Vnum = 21000, 
         Cost = 61000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Textures of both deep red and pale purple swirl together inside the vial.\
\13", 
               Keyword = "violet", 
            }, 
         }, 
         Name = "potion violet glowing", 
         ObjectValues = 
         {
            [1] = 28, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         ShortDescr = "a glowing violet potion", 
         Weight = 2, 
         Layers = 0, 
         Description = "A glowing violet potion has been carelessly left here.", 
      }, 
      [21001] = 
      {
         ItemType = "potion", 
         Vnum = 21001, 
         Cost = 6500, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "potion purple glowing", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         ShortDescr = "a glowing purple potion", 
         Weight = 2, 
         Layers = 0, 
         Description = "A glowing purple potion has been carelessly left here.", 
      }, 
      [21002] = 
      {
         ItemType = "potion", 
         Vnum = 21002, 
         Cost = 2400, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "puce potion glowing", 
         ObjectValues = 
         {
            [1] = 61, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a glowing puce potion", 
         Weight = 2, 
         Layers = 0, 
         Description = "A glowing puce potion has been carelessly left here.", 
      }, 
      [21003] = 
      {
         ItemType = "potion", 
         Vnum = 21003, 
         Cost = 750, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "potion maroon glowing", 
         ObjectValues = 
         {
            [1] = 16, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a glowing maroon potion", 
         Weight = 2, 
         Layers = 0, 
         Description = "A glowing maroon potion has been carelessly left here.", 
      }, 
      [21004] = 
      {
         ItemType = "trash", 
         Vnum = 21004, 
         Cost = 15000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "potion blue glowing", 
         ObjectValues = 
         {
            [1] = 49, 
            [2] = 49, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 22, 
         }, 
         ShortDescr = "glowing blue potion", 
         Weight = 2, 
         Layers = 0, 
         Description = "A glowing blue potion has been carelessly left here.", 
      }, 
      [21133] = 
      {
         ItemType = "food", 
         Vnum = 21133, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s savour$q a piece of $p.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "smoked womp rat", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "smoked womp rat", 
         Weight = 2, 
         Layers = 0, 
         Description = "A freshly smoked womp rat lies here giving off a hickory scent.", 
      }, 
      [21134] = 
      {
         ItemType = "food", 
         Vnum = 21134, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s delicately nibble$q on a piece of $p.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "roast kinewe", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "Roast kinewe", 
         Weight = 2, 
         Layers = 0, 
         Description = "A plump roast kinewe bird has been carelessly left on the ground here.", 
      }, 
      [21135] = 
      {
         ItemType = "food", 
         Vnum = 21135, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s savor$q $p.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "chanterelle mushrooms", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "some freshly picked chanterelle mushrooms", 
         Weight = 2, 
         Layers = 0, 
         Description = "Some freshly picked chanterelle mushrooms have been left behind here.", 
      }, 
      [21136] = 
      {
         ItemType = "food", 
         Vnum = 21136, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s quickly down$q $p.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "bag black walnuts", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a bag of fresh black nuts", 
         Weight = 2, 
         Layers = 0, 
         Description = "Nuts shells lie discarded around a small bag left here.", 
      }, 
      [21137] = 
      {
         ItemType = "food", 
         Vnum = 21137, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "%s savagely gnaw$q on $p.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "leg dewback", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a leg of dewback", 
         Weight = 2, 
         Layers = 0, 
         Description = "A freshly cooked leg of dewback has been dropped here.", 
      }, 
      [21010] = 
      {
         ItemType = "drink_container", 
         Vnum = 21010, 
         Cost = 75, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "mug ale", 
         ObjectValues = 
         {
            [1] = 12, 
            [2] = 4, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ShortDescr = "a mug of ale", 
         Weight = 1, 
         Layers = 0, 
         Description = "A large mug of ale sits here.", 
      }, 
      [21139] = 
      {
         ItemType = "food", 
         Vnum = 21139, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s quickly consume$q $p.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Grana seeds", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a handful of Grana seeds", 
         Weight = 2, 
         Layers = 0, 
         Description = "A handfull of salty Grana seeds has been left hhere.", 
      }, 
      [21140] = 
      {
         ItemType = "key", 
         Vnum = 21140, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "key master silver", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&z A set of silver master keys &x", 
         Weight = 1, 
         Layers = 0, 
         Description = "&z A set of silver master keys was left here.", 
      }, 
      [21141] = 
      {
         ItemType = "treasure", 
         Vnum = 21141, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "flag", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "A flag", 
         Weight = 1, 
         Layers = 0, 
         Description = "&c A Flag of War", 
      }, 
      [21014] = 
      {
         ItemType = "food", 
         Vnum = 21014, 
         Cost = 4, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "salami", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a slice of salami", 
         Weight = 1, 
         Layers = 0, 
         Description = "A slice of salami sits in the man made.", 
      }, 
      [21015] = 
      {
         ItemType = "food", 
         Vnum = 21015, 
         Cost = 9, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "beef", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a big chunk of beef", 
         Weight = 5, 
         Layers = 0, 
         Description = "A large chunk of raw beef lies here.", 
      }, 
      [21016] = 
      {
         ItemType = "food", 
         Vnum = 21016, 
         Cost = 10, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "turkey", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a cooked turkey", 
         Weight = 2, 
         Layers = 0, 
         Description = "A  cooked Mon bird, which looks quite edible, lies on the tray.", 
      }, 
      [21017] = 
      {
         ItemType = "drink_container", 
         Vnum = 21017, 
         Cost = 4, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "bottle blue milk", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 10, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a bottle of blue milk", 
         Weight = 3, 
         Layers = 0, 
         Description = "A bottle of imported blue milk sits upright on the ground.", 
      }, 
      [21018] = 
      {
         ItemType = "food", 
         Vnum = 21018, 
         Cost = 10, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "wheel cheese", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a wheel of cheese", 
         Weight = 3, 
         Layers = 0, 
         Description = "A round wheel of cheese looks very good.", 
      }, 
      [21019] = 
      {
         ItemType = "drink_container", 
         Vnum = 21019, 
         Cost = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "lemonade cup", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "a cup of lemonade", 
         Weight = 1, 
         Layers = 0, 
         Description = "A cup of spiked lemonade makes your thirst quench easily.", 
      }, 
      [21020] = 
      {
         ItemType = "food", 
         Vnum = 21020, 
         Cost = 15, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "cake", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a chocolate cake", 
         Weight = 1, 
         Layers = 0, 
         Description = "A large chocolate cake awaits someone to eat it.", 
      }, 
      [21021] = 
      {
         ItemType = "food", 
         Vnum = 21021, 
         Cost = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "loaf bread", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "a loaf of bread", 
         Weight = 2, 
         Layers = 0, 
         Description = "A scrumptious loaf of bread lies here, making your taste buds swirl.", 
      }, 
      [21022] = 
      {
         ItemType = "food", 
         Vnum = 21022, 
         Cost = 100, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "cherry pie", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "a cherry pie", 
         Weight = 1, 
         Layers = 0, 
         Description = "A cherry pie makes your mouth water.", 
      }, 
      [21023] = 
      {
         ItemType = "pen", 
         Vnum = 21023, 
         Cost = 30, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "pen", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a writing computer pen", 
         Weight = 1, 
         Layers = 0, 
         Description = "A writing computer pen lies on the ground, unowned.", 
      }, 
      [21420] = 
      {
         ItemType = "book", 
         Vnum = 21420, 
         Cost = 45000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [1] = "Hum", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You find you are suddenly able to read the ancient words transcribed upon the\
\13piece of parchment.  The more you read, the more visible the words become...\
\13\
\13                   Strategy & Tactic of the mon calamrian Bounty Hunters\
\13\
\13This parchment is intended for those engaged in pkilling, the deadly path,\
\13but many of the tactics outlined here may be useful in other circumstances,\
\13also.  The following details the contents of this parchment:\
\13\
\13\
\0131.  Legend                          4.  Spells/Skills and Immunties/Death Traps\
\0132.  Important Suggestions           5.  Disarm and Backstab\
\0133.  Preperation and Area Knowledge  6.  Config +FLEE and Miscellaneous Tidbits\
\13\
\13\
\13To view a topics, simply type the number of the item you wish to read.\
\13\
\13", 
               Keyword = "parchment", 
            }, 
            [2] = 
            {
               Description = "The Legend of the Parchment\
\13\
\13During the excavation for New Akatamer, a chest of weapons and artifacts\
\13was uncovered, was concluded to have originated with an ancient mon Calamrian's\
\13\
\13All the weapons of this group had shiny metal surfaces and had been covered\
\13by black tar.  The conclusion was that the clan had attempted to avoid\
\13detection in sunlight by preventing the blades of their weapons from\
\13reflecting the sun's rays.\
\13The created most of thier armor from raiding the quarren's mine shafts\
\13long\
\13before the two races became friends.\
\13\
\13Hidden among the weapons and artifacts was a set of tattered parchments,\
\13which upon translation, appeared to be Training material written by\
\13ancient Quarren.  Although some of the information is now obsolete,\
\13some of the info still be of use.\
\13", 
               Keyword = "1", 
            }, 
            [3] = 
            {
               Description = "1.) Try to join a clan , it is always better to be with #'s\
\13\
\13\
\0132.)  Some kind of macro facility is recommended.  Depending on your typing\
\13speed, this may be more important to some players than others.  In general,\
\13if one player uses macros and another does not, the player using macros\
\13has a distinct (speed) advantage.\
\13\
\0133.)  This game is a social place.  Players who share info with other\
\13players tend to do much better than solitary players.  The information here\
\13is intended to be sparse.  To fully understand the items discussed here, it\
\13is wise to talk the things mentioned here over with other players.\
\13\
\13", 
               Keyword = "2", 
            }, 
            [4] = 
            {
               Description = "Preparation is the foundation to success.  A weaker player who is prepared\
\13shielded and having your weapons wielded at all times when you are not in\
\13a safe place.  It also means having the force you need and being able to\
\13quickly regenerate a shield or spell if it wears out.  You must carry\
\13scanners, spices and other objects that will give you force and heals and\
\13you must be prepared to get them and use them instantly.  This means you\
\13have to carry some in your inventory and some in containers.  You need to\
\13have macros set up to get them and use them.  If you do not use macros,\
\13you need to know which items are stored in which containers so you can get\
\13them instantly.  When attacked by surprise, you cannot afford to start\
\13fumbling around hunting for supplies -- you will likely die.   (Type look\
\0133A for Area Knowledge)  \
\13", 
               Keyword = "3", 
            }, 
            [5] = 
            {
               Description = "Area Knowledge\
\13\
\13Area Knowledge is important to survival whether engaging in pkilling or mob\
\13killing.  You should try to learn as much about an area before attempting\
\13to operate in it.  Know nearby safe zones and where you can or cannot\
\13recall from.  This knowledge may save you in the future.\
\13\
\13", 
               Keyword = "3a", 
            }, 
            [6] = 
            {
               Description = "Sorry this info could not be obtained.\
\13", 
               Keyword = "4", 
            }, 
            [7] = 
            {
               Description = "Dealing with Immunities\
\13\
\13Some players and mobs are immune to different types of weapons and spells.\
\13It's a good idea to carry a few different kinds of weapons and be prepared\
\13to use a few different kinds of offensive spells.  It is important during a\
\13fight to try and see if your weapons and spells are doing any damage.  If\
\13your weapon is constantly \"missing\" (not dodged or parried, but missing),\
\13be ready to switch to another weapon.  If your fireball constantly misses,\
\13try a different kind of spell.  There are many, including lightning bolt,\
\13burning hands, color spray, energy drain and many others to choose from.\
\13\
\13\
\13Avoiding Death Traps and Other Nasty Surprises\
\13\
\13When you are in an unfamiliar place, it is a good idea to look ahead before\
\13entering a new room.  Use scry or scan to do this.  If you see a room that\
\13has no exits, you need to be cautions because it might be a death trap.  If\
\13you cannot scry or scan, type \"look direction\" and read the description of\
\13what lies in that direction.  Most of these rooms are not death traps, they\
\13just have exits that are not obvious or require you to recall to exit.  One\
\13good technique is to bring a friend or a character with little equipment\
\13and send them in to test for a death trap.  Having friends in the mud pays\
\13\
\13dividends in many ways.\
\13", 
               Keyword = "4a", 
            }, 
            [8] = 
            {
               Description = "Disarm\
\13\
\13If you can disarm an opponent and take their weapon, you can get a great\
\13advantage.  This tactic is a little over-rated because your opponent may\
\13have a good grip on their weapon or may have extra weapons.  The effort\
\13you put into disarming them takes away from other tactics you should be\
\13using instead.  Disarming mobs can sometimes be a bad move because some\
\13mobs hit much harder when disarmed.  If you must try this skill, perhaps\
\13you should try it only once or twice in a fight and then move on.\
\13\
\13\
\13Backstab\
\13\
\13If you can backstab an opponent to start a fight, you should certainly try\
\13it.  In order to be backstabbed, however, an opponent must be at full hit\
\13\
\13points.  If they never eat or drink (a good tactic against backstabbing),\
\13they will always be a few hp below maximum.  You can always start a fight\
\13by healing your opponent in the hopes of bringing them to full hit points,\
\13then backstab them.  Naughty but Nice!\
\13\
\13", 
               Keyword = "5", 
            }, 
            [9] = 
            {
               Description = "Config +FLEE\
\13\
\13Many players like this until they flee into a death trap.  In general, it's\
\13a bad idea.  You are usually better off to recall than to flee.  If you have\
\13problems recalling.\
\13\
\13", 
               Keyword = "6", 
            }, 
         }, 
         Name = "hologram", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "A hologram", 
         Weight = 1, 
         Layers = 0, 
         Description = "A hologram parchment sits here.", 
      }, 
      [21421] = 
      {
         ItemType = "furniture", 
         Vnum = 21421, 
         Cost = 0, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "bus stop sign", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a sign", 
         Weight = 1, 
         Layers = 0, 
         Description = "A pluogus bus stop sign.", 
      }, 
      [21422] = 
      {
         ItemType = "crystal", 
         Vnum = 21422, 
         Cost = 100, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "small crystal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a small crystal", 
         Weight = 1, 
         Layers = 0, 
         Description = "A small crystal catches your eye.", 
      }, 
      [21423] = 
      {
         ItemType = "crystal", 
         Vnum = 21423, 
         Cost = 3000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "relacite crystal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "a relacite crystal", 
         Weight = 1, 
         Layers = 0, 
         Description = "A crystal was dropped here.", 
      }, 
      [21424] = 
      {
         ItemType = "crystal", 
         Vnum = 21424, 
         Cost = 2000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Kathracite crystal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a kathracite crystal", 
         Weight = 1, 
         Layers = 0, 
         Description = "Something shiney catches your eye.", 
      }, 
      [21425] = 
      {
         ItemType = "crystal", 
         Vnum = 21425, 
         Cost = 5000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "mephite crystal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "a mephite crystal", 
         Weight = 1, 
         Layers = 0, 
         Description = "Something shiney catches your eye.", 
      }, 
      [21042] = 
      {
         ItemType = "furniture", 
         Vnum = 21042, 
         Cost = 0, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "book", 
            }, 
         }, 
         Name = "board general", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the general board", 
         Weight = 1001, 
         Layers = 0, 
         Description = "The Akatamer board hangs here.", 
      }, 
      [21427] = 
      {
         ItemType = "lever", 
         Vnum = 21427, 
         Cost = 45000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [1] = "Hum", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You find you are suddenly able to read the ancient words transcribed upon the\
\13piece of parchment.  The more you read, the more visible the words become...\
\13\
\13                   Strategy & Tactic of the mon calamrian Bounty Hunters\
\13\
\13This parchment is intended for those engaged in pkilling, the deadly path,\
\13but many of the tactics outlined here may be useful in other circumstances,\
\13also.  The following details the contents of this parchment:\
\13\
\13\
\0131.  Legend                          4.  Spells/Skills and Immunties/Death Traps\
\0132.  Important Suggestions           5.  Disarm and Backstab\
\0133.  Preperation and Area Knowledge  6.  Config +FLEE and Miscellaneous Tidbits\
\13\
\13\
\13To view a topics, simply type the number of the item you wish to read.\
\13\
\13", 
               Keyword = "parchment", 
            }, 
            [2] = 
            {
               Description = "The Legend of the Parchment\
\13\
\13During the excavation for New Akatamer, a chest of weapons and artifacts\
\13was uncovered, was concluded to have originated with an ancient mon Calamrian's\
\13\
\13All the weapons of this group had shiny metal surfaces and had been covered\
\13by black tar.  The conclusion was that the clan had attempted to avoid\
\13detection in sunlight by preventing the blades of their weapons from\
\13reflecting the sun's rays.\
\13The created most of thier armor from raiding the quarren's mine shafts\
\13long\
\13before the two races became friends.\
\13\
\13Hidden among the weapons and artifacts was a set of tattered parchments,\
\13which upon translation, appeared to be Training material written by\
\13ancient Quarren.  Although some of the information is now obsolete,\
\13some of the info still be of use.\
\13", 
               Keyword = "1", 
            }, 
            [3] = 
            {
               Description = "1.) Try to join a clan , it is always better to be with #'s\
\13\
\13\
\0132.)  Some kind of macro facility is recommended.  Depending on your typing\
\13speed, this may be more important to some players than others.  In general,\
\13if one player uses macros and another does not, the player using macros\
\13has a distinct (speed) advantage.\
\13\
\0133.)  This game is a social place.  Players who share info with other\
\13players tend to do much better than solitary players.  The information here\
\13is intended to be sparse.  To fully understand the items discussed here, it\
\13is wise to talk the things mentioned here over with other players.\
\13\
\13", 
               Keyword = "2", 
            }, 
            [4] = 
            {
               Description = "Preparation is the foundation to success.  A weaker player who is prepared\
\13shielded and having your weapons wielded at all times when you are not in\
\13a safe place.  It also means having the force you need and being able to\
\13quickly regenerate a shield or spell if it wears out.  You must carry\
\13scanners, spices and other objects that will give you force and heals and\
\13you must be prepared to get them and use them instantly.  This means you\
\13have to carry some in your inventory and some in containers.  You need to\
\13have macros set up to get them and use them.  If you do not use macros,\
\13\
\13you need to know which items are stored in which containers so you can get\
\13them instantly.  When attacked by surprise, you cannot afford to start\
\13fumbling around hunting for supplies -- you will likely die.   (Type look\
\0133A for Area Knowledge)  \
\13", 
               Keyword = "3", 
            }, 
            [5] = 
            {
               Description = "Area Knowledge\
\13\
\13Area Knowledge is important to survival whether engaging in pkilling or mob\
\13killing.  You should try to learn as much about an area before attempting\
\13to operate in it.  Know nearby safe zones and where you can or cannot\
\13recall from.  This knowledge may save you in the future.\
\13\
\13", 
               Keyword = "3a", 
            }, 
            [6] = 
            {
               Description = "Sorry this info could not be obtained.\
\13", 
               Keyword = "4", 
            }, 
            [7] = 
            {
               Description = "Dealing with Immunities\
\13\
\13Some players and mobs are immune to different types of weapons and spells.\
\13It's a good idea to carry a few different kinds of weapons and be prepared\
\13to use a few different kinds of offensive spells.  It is important during a\
\13fight to try and see if your weapons and spells are doing any damage.  If\
\13your weapon is constantly \"missing\" (not dodged or parried, but missing),\
\13be ready to switch to another weapon.  If your fireball constantly misses,\
\13try a different kind of spell.  There are many, including lightning bolt,\
\13burning hands, color spray, energy drain and many others to choose from.\
\13\
\13\
\13Avoiding Death Traps and Other Nasty Surprises\
\13\
\13\
\13When you are in an unfamiliar place, it is a good idea to look ahead before\
\13entering a new room.  Use scry or scan to do this.  If you see a room that\
\13has no exits, you need to be cautions because it might be a death trap.  If\
\13you cannot scry or scan, type \"look direction\" and read the description of\
\13what lies in that direction.  Most of these rooms are not death traps, they\
\13just have exits that are not obvious or require you to recall to exit.  One\
\13good technique is to bring a friend or a character with little equipment\
\13and send them in to test for a death trap.  Having friends in the mud pays\
\13dividends in many ways.\
\13", 
               Keyword = "4a", 
            }, 
            [8] = 
            {
               Description = "Disarm\
\13\
\13If you can disarm an opponent and take their weapon, you can get a great\
\13advantage.  This tactic is a little over-rated because your opponent may\
\13have a good grip on their weapon or may have extra weapons.  The effort\
\13you put into disarming them takes away from other tactics you should be\
\13using instead.  Disarming mobs can sometimes be a bad move because some\
\13mobs hit much harder when disarmed.  If you must try this skill, perhaps\
\13you should try it only once or twice in a fight and then move on.\
\13Backstab\
\13\
\13If you can backstab an opponent to start a fight, you should certainly try\
\13it.  In order to be backstabbed, however, an opponent must be at full hit\
\13points.  If they never eat or drink (a good tactic against backstabbing),\
\13they will always be a few hp below maximum.  You can always start a fight\
\13by healing your opponent in the hopes of bringing them to full hit points,\
\13then backstab them.  Naughty but Nice!\
\13\
\13", 
               Keyword = "5", 
            }, 
            [9] = 
            {
               Description = "Config +FLEE\
\13\
\13Many players like this until they flee into a death trap.  In general, it's\
\13a bad idea.  You are usually better off to recall than to flee.  If you have\
\13problems recalling.\
\13\
\13", 
               Keyword = "6", 
            }, 
            [10] = 
            {
               Description = "", 
               Keyword = "computer terminal", 
            }, 
         }, 
         Name = "lever omputer terminal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "A computer terminal lever", 
         Weight = 1, 
         Layers = 0, 
         Description = "&b A computer terminal rests aginst the wall here.", 
      }, 
      [21428] = 
      {
         ItemType = "key", 
         Vnum = 21428, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "key ", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "Key", 
         Weight = 1, 
         Layers = 0, 
         Description = "Key", 
      }, 
      [21045] = 
      {
         ItemType = "_wand", 
         Vnum = 21045, 
         Cost = 1000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "crystal staff", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 3, 
            [3] = 81, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ShortDescr = "a sparkling crystal staff", 
         Weight = 1, 
         Layers = 0, 
         Description = "A sparkling crystal staff has been left lying here.", 
      }, 
      [21046] = 
      {
         ItemType = "container", 
         Vnum = 21046, 
         Cost = 1000, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "bag rune-covered", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 75, 
         }, 
         ShortDescr = "a rune-covered bag", 
         Weight = 1, 
         Layers = 0, 
         Description = "A strange bag, covered in dust, has been left here.", 
      }, 
      [21048] = 
      {
         ItemType = "furniture", 
         Vnum = 21048, 
         Cost = 0, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "mail board stack", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a stack of holomail", 
         Weight = 1001, 
         Layers = 0, 
         Description = "A stack of holomail is piled high here.", 
      }, 
      [21049] = 
      {
         ItemType = "light", 
         Vnum = 21049, 
         Cost = 100, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "ball light", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = -1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a bright ball of light", 
         Weight = 1, 
         Layers = 0, 
         Description = "A bright ball of light shimmers in the air.", 
      }, 
      [21435] = 
      {
         ItemType = "furniture", 
         Vnum = 21435, 
         Cost = 0, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "augurer guild board", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the board of the augurer guild", 
         Weight = 1, 
         Layers = 0, 
         Description = "Data Info Center - (Terminal)", 
      }, 
      [21055] = 
      {
         ItemType = "armor", 
         Vnum = 21055, 
         Cost = 500, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Flags = 
         {
            [16] = "_16", 
            [17] = "_17", 
            [19] = "LargeSize", 
            [5] = "Invis", 
            [14] = "_14", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "thief ring", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a thief's ring", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 31, 
            }, 
         }, 
         Layers = 0, 
         Description = "A ring which will bring good luck lies here.", 
      }, 
      [21056] = 
      {
         ItemType = "armor", 
         Vnum = 21056, 
         Cost = 100, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
            [19] = "LargeSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Rumors say that these rings protect from magical enchantments...\
\13", 
               Keyword = "ring", 
            }, 
         }, 
         Name = "ring", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a ring of the city guard", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3072, 
               Location = 27, 
            }, 
            [2] = 
            {
               Modifier = -3, 
               Location = 17, 
            }, 
         }, 
         Layers = 0, 
         Description = "An iron ring has fallen here.", 
      }, 
      [21057] = 
      {
         ItemType = "armor", 
         Vnum = 21057, 
         Cost = 30, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "a neck guard", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a neck guard", 
         Weight = 3, 
         Layers = 0, 
         Description = "A large neck guard was dropped here.", 
      }, 
      [21058] = 
      {
         ItemType = "armor", 
         Vnum = 21058, 
         Cost = 150, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "crested plate", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         ShortDescr = "a New rebublic crested breastplate", 
         Weight = 8, 
         Layers = 128, 
         Description = "A New Rebublic breastplate has fallen here.", 
      }, 
      [21059] = 
      {
         ItemType = "armor", 
         Vnum = 21059, 
         Cost = 50, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "a helm", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a helm", 
         Weight = 8, 
         Layers = 4, 
         Description = "A helm is here.", 
      }, 
      [21060] = 
      {
         ItemType = "armor", 
         Vnum = 21060, 
         Cost = 20, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "guard leggings", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "guard leggings", 
         Weight = 4, 
         Layers = 16, 
         Description = "A set of guard leggings has fallen here.", 
      }, 
      [21061] = 
      {
         ItemType = "armor", 
         Vnum = 21061, 
         Cost = 40, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "boots black", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "black boots", 
         Weight = 2, 
         Layers = 0, 
         Description = "A set of boots has fallen here.", 
      }, 
      [21062] = 
      {
         ItemType = "armor", 
         Vnum = 21062, 
         Cost = 20, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "guard sleeves", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "guard sleeves", 
         Weight = 3, 
         Layers = 0, 
         Description = "A set of guard sleeves has fallen here.", 
      }, 
      [21063] = 
      {
         ItemType = "armor", 
         Vnum = 21063, 
         Cost = 40, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "guard gauntlets", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "guard gauntlets", 
         Weight = 4, 
         Layers = 0, 
         Description = "Some guard gauntlets have fallen here.", 
      }, 
      [21064] = 
      {
         ItemType = "armor", 
         Vnum = 21064, 
         Cost = 75, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "bracer", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "a bracer", 
         Weight = 2, 
         Layers = 128, 
         Description = "A bracer was dropped here.", 
      }, 
      [21065] = 
      {
         ItemType = "armor", 
         Vnum = 21065, 
         Cost = 600, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "calamarian energy shield", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         ShortDescr = "a calamarian energy shield", 
         Weight = 6, 
         Layers = 0, 
         Description = "A calamarian energy shield was dropped here.", 
      }, 
      [21066] = 
      {
         ItemType = "armor", 
         Vnum = 21066, 
         Cost = 50, 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "rubber visor", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a rubber visor", 
         Weight = 1, 
         Layers = 0, 
         Description = "A rubber visor was misplaced here.", 
      }, 
      [21067] = 
      {
         ItemType = "light", 
         Vnum = 21067, 
         Cost = 10, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "torch", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 24, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a torch", 
         Weight = 1, 
         Layers = 0, 
         Description = "A plain electric torch has been left lying here.", 
      }, 
      [21068] = 
      {
         ItemType = "weapon", 
         Vnum = 21068, 
         Cost = 300, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "com-blaster", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a com-blaster", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Layers = 0, 
         Description = "A com-blaster has fallen here.", 
      }, 
      [21069] = 
      {
         ItemType = "weapon", 
         Vnum = 21069, 
         Cost = 300, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "hand blaster", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "hand blaster", 
         Weight = 6, 
         Layers = 0, 
         Description = "A hand blaster has fallen here.", 
      }, 
      [21070] = 
      {
         ItemType = "armor", 
         Vnum = 21070, 
         Cost = 1000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "Key to Docking Bay", 
         Weight = 1, 
         Layers = 0, 
         Description = "Key to Docking Bay", 
      }, 
      [21071] = 
      {
         ItemType = "armor", 
         Vnum = 21071, 
         Cost = 1000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the key to the northern Docking bay of Akatamer", 
         Weight = 1, 
         Layers = 0, 
         Description = "The key to Akatamer's northern Docking bay lies here.", 
      }, 
      [21072] = 
      {
         ItemType = "armor", 
         Vnum = 21072, 
         Cost = 1000, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "the key to the eastern Docking bay of Akatamer", 
         Weight = 1, 
         Layers = 0, 
         Description = "The key to Akatamer's eastern Docking bay lies here.", 
      }, 
      [21073] = 
      {
         ItemType = "armor", 
         Vnum = 21073, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "Key to Southern Docking Bay.", 
         Weight = 1, 
         Layers = 0, 
         Description = "The Key to the southern Docking Bay", 
      }, 
      [21076] = 
      {
         ItemType = "armor", 
         Vnum = 21076, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather shirt", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a leather shirt", 
         Weight = 4, 
         Layers = 0, 
         Description = "Someone has left a bantha leather shirt lying here.", 
      }, 
      [21077] = 
      {
         ItemType = "armor", 
         Vnum = 21077, 
         Cost = 150, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "pants leather", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "some leather pants", 
         Weight = 2, 
         Layers = 0, 
         Description = "Some bantha leather pants are lying here.", 
      }, 
      [21078] = 
      {
         ItemType = "armor", 
         Vnum = 21078, 
         Cost = 75, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather sleeves", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "some leather sleeves", 
         Weight = 1, 
         Layers = 0, 
         Description = "Some bantha leather sleeves have been abandoned here.", 
      }, 
      [21079] = 
      {
         ItemType = "armor", 
         Vnum = 21079, 
         Cost = 125, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather boots", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "some leather boots", 
         Weight = 2, 
         Layers = 0, 
         Description = "A pair of bantha leather boots are lying here.", 
      }, 
      [21080] = 
      {
         ItemType = "armor", 
         Vnum = 21080, 
         Cost = 100, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "leather gloves pair", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a pair of leather gloves", 
         Weight = 1, 
         Layers = 0, 
         Description = "Two bantha leather gloves are lying on the ground.", 
      }, 
      [21081] = 
      {
         ItemType = "weapon", 
         Vnum = 21081, 
         Cost = 100, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "steel knife", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a steel knife", 
         Weight = 1, 
         Layers = 0, 
         Description = "A gleaming knife shines brightly here.", 
      }, 
      [21082] = 
      {
         ItemType = "weapon", 
         Vnum = 21082, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mon-blaster", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         ShortDescr = "Mon blaster", 
         Weight = 4, 
         Layers = 0, 
         Description = "An Mon Blaster has been carelessly left here.", 
      }, 
      [21083] = 
      {
         ItemType = "key", 
         Vnum = 21083, 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "hotel  key", 
         Weight = 1, 
         Layers = 0, 
         Description = "This item doesn't need a long :P", 
      }, 
      [21094] = 
      {
         ItemType = "armor", 
         Vnum = 21094, 
         Cost = 10000, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "ring golden band", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "a strange golden band", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3072, 
               Location = 27, 
            }, 
         }, 
         Layers = 0, 
         Description = "A strange golden band has been left lying here.", 
      }, 
      [21426] = 
      {
         ItemType = "armor", 
         Vnum = 21426, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho &R^R Warning, Gill Mask Failure &x ^x\
", 
               MudProgType = "rand_prog", 
               Arguments = "1", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&O The mon gill while very effective has a very short life span.\
\13", 
               Keyword = "gill mask", 
            }, 
         }, 
         Name = "gill mask", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&O A Mon Gill", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -2147483648, 
               Location = 26, 
            }, 
         }, 
         Layers = 0, 
         Description = "&O A Mon Gill was left here on the ground.", 
      }, 
      [21138] = 
      {
         ItemType = "food", 
         Vnum = 21138, 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "%s quickly eat$q $p.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "wild mustard greens", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "some wild seaweed greens", 
         Weight = 2, 
         Layers = 0, 
         Description = "Some freshly gathered wild seaweed have been forgotten here.", 
      }, 
      [21008] = 
      {
         ItemType = "drink_container", 
         Vnum = 21008, 
         Cost = 100, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "beer bottle", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a bottle of beer", 
         Weight = 1, 
         Layers = 0, 
         Description = "A small bottle, tipped on its side, drips on the ground.", 
      }, 
      [21111] = 
      {
         ItemType = "furniture", 
         Vnum = 21111, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n A magical force suddenly takes hold of you, pulling you in!\
mpechoat $n When you right yourself, you look around to collect your bearings,\
mpechoat $n and find yourself standing before the manor...\
mptrans $n 2400\
mpecho $n fades before your eyes while examining the painting of the manor.\
", 
               MudProgType = "exa_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bless", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
               Keyword = "painting manor house", 
            }, 
         }, 
         Name = "manor painting", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "an oil painting", 
         Weight = 1, 
         Layers = 0, 
         Description = "A painting of a glorious security post hangs on the wall, catching your eye.", 
      }, 
      [21112] = 
      {
         ItemType = "furniture", 
         Vnum = 21112, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n Your feel your body as it dissolves into elements of color,\
mpechoat $n sphotel ing slowly into the oils of the dark painting...\
mpechoaround $n Stepping forward to examine the painting, $n's body begins to\
mpechoaround $n liquesce, dissolving into a kaleidoscope of colors, sphotel ing\
mpechoaround $n funnel-like into the oiled textures of the solemn image.\
mptransfer $n 2171\
", 
               MudProgType = "exa_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [2] = "_02", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Gazing at the painting, you find yourself entranced by the image of a\
\13woman kneeling at the foot of a grave, mourning the loss of her child.\
\13As tears stream down her face, she finds the arms of an angel wrapped\
\13around her, seeming to comfort her in her hour of despair.  Suddenly,\
\13everything about you shifts and you find yourself becoming part of\
\13the painting, screaming as the angel of darkness drags you, too, \
\13unto the unholy grounds of the dead.\
\13", 
               Keyword = "solemn painting unholy", 
            }, 
         }, 
         Name = "solemn painting unholy", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a dark, solemn painting", 
         Weight = 50, 
         Layers = 0, 
         Description = "A dark, solemn painting hangs here in the shadows, collecting dust.", 
      }, 
      [21113] = 
      {
         ItemType = "furniture", 
         Vnum = 21113, 
         Cost = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [8] = "Bless", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&cHead down the ladder, watch out because the water is cold.\
\13Then you swimm 5 legs toward the northern polor.\
\13Then dive down one depth.\
\13Swimm 4 legs toward the sun set.\
\13Then one more leg to the northern polor cap.\
\13Then swim 3 more legs to the sunset.\
\13Then dive down one more depth.\
\13Then swim 3 legs to the sunset.\
\13Then swim 1 leg to the southern/sunset\
\13Then swim 1 leg to the sunset.\
\13Two legs southern polar/sunrise\
\13One leg to the sunrise.\
\13", 
               Keyword = "map", 
            }, 
            [2] = 
            {
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
               Keyword = "painting manor house", 
            }, 
         }, 
         Name = "map", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "A ratted up map", 
         Weight = 1, 
         Layers = 0, 
         Description = "A ratted up map was left here.", 
      }, 
      [21114] = 
      {
         ItemType = "furniture", 
         Vnum = 21114, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You feel all your prayers are being answered from above.\
", 
               MudProgType = "act_prog", 
               Arguments = "bow pray", 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bless", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&c This large bronze statue is of a great Mon Calamarian individual, who\
\13helped end the first Imperial force and the second Death Star. There is  a\
\13small frame on the sign with a gold inprint on it.\
\13", 
               Keyword = "statue", 
            }, 
            [2] = 
            {
               Description = "You move closer to take a look at the image in the painting.  The post is\
\13beautiful, inviting and imposing all at the same time.  You find yourself\
\13wondering what it would be like to work in such a place...\
\13", 
               Keyword = "painting manor house", 
            }, 
         }, 
         Name = "statue", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&c A large bronze statue ", 
         Weight = 1, 
         Layers = 0, 
         Description = "&c A large bronze statue stands tall here.", 
      }, 
      [21115] = 
      {
         ItemType = "furniture", 
         Vnum = 21115, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You plop flat in the large metal bed relaxing..\
mpecho thinking this is not to bad when...\
mpecho  BOING!\
mpecho  A spring pokes you in the back.\
mpforce $n stand\
", 
               MudProgType = "act_prog", 
               Arguments = "100 p sits down.", 
            }, 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "What you've never seen a chair before??\
\13", 
               Keyword = "Chair", 
            }, 
         }, 
         Name = "bed prison", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&z A metal prison bed ", 
         Weight = 1, 
         Layers = 0, 
         Description = "&z A metal prison bed lies aginst the wall. &x", 
      }, 
      [21116] = 
      {
         ItemType = "trash", 
         Vnum = 21116, 
         Cost = 0, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "What you've never seen a chair before??\
\13", 
               Keyword = "Chair", 
            }, 
         }, 
         Name = "suction john toilet waste", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&c A TI-0 suction waste machine", 
         Weight = 1, 
         Layers = 0, 
         Description = "&c A TI-0 suction waste machine is placed in the corner.", 
      }, 
      [21117] = 
      {
         ItemType = "armor", 
         Vnum = 21117, 
         Cost = 100, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
            [3] = "Body", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "vest gamorean double strap", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&G A gamorrean double strap vest &x", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -10, 
               Location = 14, 
            }, 
         }, 
         Layers = 8, 
         Description = "&G A gamorrean double strap vest was left here. &x", 
      }, 
      [21118] = 
      {
         ItemType = "armor", 
         Vnum = 21118, 
         Cost = 125, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "boots lizard feet cover", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&b Lizard skin feet covers.", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 100, 
               Location = 47, 
            }, 
            [2] = 
            {
               Modifier = -20, 
               Location = 14, 
            }, 
         }, 
         Layers = 4, 
         Description = "&b Lizard skin feet covers were left here &x.", 
      }, 
      [21009] = 
      {
         ItemType = "drink_container", 
         Vnum = 21009, 
         Cost = 50, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Name = "whiskey bottle", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 5, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a bottle of whiskey", 
         Weight = 1, 
         Layers = 0, 
         Description = "A bottle of whiskey spills drops on the ground.", 
      }, 
   }, 
   Author = "Ackbar", 
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
         High = 103, 
      }, 
   }, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 21499, 
         First = 21000, 
      }, 
      Object = 
      {
         Last = 21435, 
         First = 21000, 
      }, 
      Room = 
      {
         Last = 21499, 
         First = 21000, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Name = "Mon Calamri", 
}
